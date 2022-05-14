import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../shared/color_name_value.dart';
import '../../shared/color_picker_inkwell.dart';

// Display the all scheme colors in currently selected color scheme, including
// their name and color code.
//
// Allows user to edit the colors, if we are we are viewing the last color
// scheme, which is the custom color scheme.
class SchemeColors extends StatelessWidget {
  const SchemeColors({
    super.key,
    required this.tc,
  });

  final ThemeController tc;

  // Return true if the color is light, meaning it needs dark text for contrast.
  bool _isLight(final Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light;

  // On color used when a theme color property does not have a theme onColor.
  Color _onColor(final Color color) =>
      _isLight(color) ? Colors.black : Colors.white;

  bool _locked(bool isLight, bool keepLight, bool keepDark) =>
      tc.useKeyColors &&
      tc.useFlexColorScheme &&
      ((isLight && keepLight) || (!isLight && keepDark));

  @override
  Widget build(BuildContext context) {
    // Used to enable & disable color selection on the color boxes.
    // We can only pick colors when custom theme is selected, which is
    // last index in out list of color schemes.
    final bool isCustomTheme = (AppColor.schemes.length - 1) == tc.schemeIndex;
    // Are colors swapped?
    final bool swapLight = tc.swapLightColors;
    final bool swapDark = tc.swapDarkColors;
    // Size of the color presentation boxes
    const double boxWidth = 152;
    const double boxHeight = 360;

    // Theme values...
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    // These color values are also used if picking is cancelled to restore
    // previous color selection.
    final Color primary = colorScheme.primary;
    final Color primaryContainer = colorScheme.primaryContainer;
    final Color secondary = colorScheme.secondary;
    final Color secondaryContainer = colorScheme.secondaryContainer;
    final Color tertiary = colorScheme.tertiary;
    final Color tertiaryContainer = colorScheme.tertiaryContainer;

    // Grab active tons and chroma setup.
    final FlexTones tones =
        AppColor.flexTonesConfig(theme.brightness, tc.usedFlexToneSetup);
    // Should we even show the tone? We show them only when, seeding is on.
    final bool showTones = tc.useKeyColors && tc.useFlexColorScheme;

    // Grab the card border from the theme card shape
    ShapeBorder? border = theme.cardTheme.shape;
    // If we had one, copy in a border side to it.
    if (border is RoundedRectangleBorder) {
      border = border.copyWith(
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
      // If
    } else {
      // If border was null, make one matching Card default, but with border
      // side, if it was not null, we leave it as it was.
      border ??= RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(useMaterial3 ? 12 : 4)),
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
    }
    // Wrap this widget branch in a custom theme where card has a border outline
    // if it did not have one, but retains the ambient themed border radius.
    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: CardTheme.of(context).copyWith(
          elevation: 0,
          shape: border,
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 6,
        runSpacing: 6,
        children: <Widget>[
          //
          // Primary colors presentation
          SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(primary);
                        tc.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: primary,
                        child: ColorPickerInkWell(
                          color: primary,
                          onChanged: (Color color) {
                            if (isLight) {
                              swapLight
                                  ? tc.setSecondaryLight(color)
                                  : tc.setPrimaryLight(color);
                            } else {
                              swapDark
                                  ? tc.setSecondaryDark(color)
                                  : tc.setPrimaryDark(color);
                            }
                          },
                          recentColors: tc.recentColors,
                          onRecentColorsChanged: tc.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                swapLight
                                    ? tc.setSecondaryLight(primary)
                                    : tc.setPrimaryLight(primary);
                              } else {
                                swapDark
                                    ? tc.setSecondaryDark(primary)
                                    : tc.setPrimaryDark(primary);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: primary,
                            textColor: colorScheme.onPrimary,
                            label: 'primary',
                            tone: tones.primaryTone,
                            showTone: _locked(
                                isLight, !tc.keepPrimary, !tc.keepDarkPrimary),
                            isLocked: _locked(
                                isLight, tc.keepPrimary, tc.keepDarkPrimary),
                            onLocked: tc.useKeyColors && tc.useFlexColorScheme
                                ? isLight
                                    ? tc.setKeepPrimary
                                    : tc.setKeepDarkPrimary
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onPrimary);
                        tc.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onPrimary,
                        child: ColorNameValue(
                          color: colorScheme.onPrimary,
                          textColor: colorScheme.primary,
                          label: 'onPrimary',
                          showTone: _locked(
                              isLight, !tc.keepPrimary, !tc.keepDarkPrimary),
                          tone: tones.onPrimaryTone,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(primaryContainer);
                        tc.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: primaryContainer,
                        child: ColorPickerInkWell(
                          color: primaryContainer,
                          onChanged: (Color color) {
                            if (isLight) {
                              swapLight
                                  ? tc.setSecondaryContainerLight(color)
                                  : tc.setPrimaryContainerLight(color);
                            } else {
                              swapDark
                                  ? tc.setSecondaryContainerDark(color)
                                  : tc.setPrimaryContainerDark(color);
                            }
                          },
                          recentColors: tc.recentColors,
                          onRecentColorsChanged: tc.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                swapLight
                                    ? tc.setSecondaryContainerLight(
                                        primaryContainer)
                                    : tc.setPrimaryContainerLight(
                                        primaryContainer);
                              } else {
                                swapDark
                                    ? tc.setSecondaryContainerDark(
                                        primaryContainer)
                                    : tc.setPrimaryContainerDark(
                                        primaryContainer);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: primaryContainer,
                            textColor: colorScheme.onPrimaryContainer,
                            label: 'primary\u200BContainer',
                            tone: tones.primaryContainerTone,
                            showTone: _locked(isLight, !tc.keepPrimaryContainer,
                                !tc.keepDarkPrimaryContainer),
                            isLocked: _locked(isLight, tc.keepPrimaryContainer,
                                tc.keepDarkPrimaryContainer),
                            onLocked: tc.useKeyColors && tc.useFlexColorScheme
                                ? isLight
                                    ? tc.setKeepPrimaryContainer
                                    : tc.setKeepDarkPrimaryContainer
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onPrimaryContainer);
                        tc.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onPrimaryContainer,
                        child: ColorNameValue(
                          color: colorScheme.onPrimaryContainer,
                          textColor: colorScheme.primaryContainer,
                          label: 'onPrimary\u200BContainer',
                          tone: tones.onPrimaryContainerTone,
                          showTone: _locked(isLight, !tc.keepPrimaryContainer,
                              !tc.keepDarkPrimaryContainer),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          // Secondary colors presentation
          SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(secondary);
                        tc.setHoverTonalPalette(TonalPalettes.secondary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: secondary,
                        child: ColorPickerInkWell(
                          color: secondary,
                          onChanged: (Color color) {
                            if (isLight) {
                              swapLight
                                  ? tc.setPrimaryLight(color)
                                  : tc.setSecondaryLight(color);
                            } else {
                              swapDark
                                  ? tc.setPrimaryDark(color)
                                  : tc.setSecondaryDark(color);
                            }
                          },
                          recentColors: tc.recentColors,
                          onRecentColorsChanged: tc.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                swapLight
                                    ? tc.setPrimaryLight(secondary)
                                    : tc.setSecondaryLight(secondary);
                              } else {
                                swapDark
                                    ? tc.setPrimaryDark(secondary)
                                    : tc.setSecondaryDark(secondary);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: secondary,
                            textColor: colorScheme.onSecondary,
                            label: 'secondary',
                            tone: tones.secondaryTone,
                            showTone: _locked(isLight, !tc.keepSecondary,
                                !tc.keepDarkSecondary),
                            isLocked: _locked(isLight, tc.keepSecondary,
                                tc.keepDarkSecondary),
                            onLocked: tc.useKeyColors && tc.useFlexColorScheme
                                ? isLight
                                    ? tc.setKeepSecondary
                                    : tc.setKeepDarkSecondary
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onSecondary);
                        tc.setHoverTonalPalette(TonalPalettes.secondary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onSecondary,
                        child: ColorNameValue(
                          color: colorScheme.onSecondary,
                          textColor: colorScheme.secondary,
                          label: 'onSecondary',
                          tone: tones.onSecondaryTone,
                          showTone: _locked(isLight, !tc.keepSecondary,
                              !tc.keepDarkSecondary),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(secondaryContainer);
                        tc.setHoverTonalPalette(TonalPalettes.secondary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: secondaryContainer,
                        child: ColorPickerInkWell(
                          color: secondaryContainer,
                          onChanged: (Color color) {
                            if (isLight) {
                              swapLight
                                  ? tc.setPrimaryContainerLight(color)
                                  : tc.setSecondaryContainerLight(color);
                            } else {
                              swapDark
                                  ? tc.setPrimaryContainerDark(color)
                                  : tc.setSecondaryContainerDark(color);
                            }
                          },
                          recentColors: tc.recentColors,
                          onRecentColorsChanged: tc.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                swapLight
                                    ? tc.setPrimaryContainerLight(
                                        secondaryContainer)
                                    : tc.setSecondaryContainerLight(
                                        secondaryContainer);
                              } else {
                                swapDark
                                    ? tc.setPrimaryContainerDark(
                                        secondaryContainer)
                                    : tc.setSecondaryContainerDark(
                                        secondaryContainer);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: secondaryContainer,
                            textColor: colorScheme.onSecondaryContainer,
                            label: 'secondary\u200BContainer',
                            tone: tones.secondaryContainerTone,
                            showTone: _locked(
                                isLight,
                                !tc.keepSecondaryContainer,
                                !tc.keepDarkSecondaryContainer),
                            isLocked: _locked(
                                isLight,
                                tc.keepSecondaryContainer,
                                tc.keepDarkSecondaryContainer),
                            onLocked: tc.useKeyColors && tc.useFlexColorScheme
                                ? isLight
                                    ? tc.setKeepSecondaryContainer
                                    : tc.setKeepDarkSecondaryContainer
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onSecondaryContainer);
                        tc.setHoverTonalPalette(TonalPalettes.secondary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onSecondaryContainer,
                        child: ColorNameValue(
                          color: colorScheme.onSecondaryContainer,
                          textColor: secondaryContainer,
                          label: 'onSecondary\u200BContainer',
                          tone: tones.onSecondaryContainerTone,
                          showTone: _locked(isLight, !tc.keepSecondaryContainer,
                              !tc.keepDarkSecondaryContainer),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          // Tertiary colors presentation
          SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(tertiary);
                        tc.setHoverTonalPalette(TonalPalettes.tertiary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: tertiary,
                        child: ColorPickerInkWell(
                          color: tertiary,
                          onChanged: (Color color) {
                            if (isLight) {
                              tc.setTertiaryLight(color);
                            } else {
                              tc.setTertiaryDark(color);
                            }
                          },
                          recentColors: tc.recentColors,
                          onRecentColorsChanged: tc.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                tc.setTertiaryLight(tertiary);
                              } else {
                                tc.setTertiaryDark(tertiary);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: tertiary,
                            textColor: colorScheme.onTertiary,
                            label: 'tertiary',
                            tone: tones.tertiaryTone,
                            showTone: _locked(isLight, !tc.keepTertiary,
                                !tc.keepDarkTertiary),
                            isLocked: _locked(
                                isLight, tc.keepTertiary, tc.keepDarkTertiary),
                            onLocked: tc.useKeyColors && tc.useFlexColorScheme
                                ? isLight
                                    ? tc.setKeepTertiary
                                    : tc.setKeepDarkTertiary
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onTertiary);
                        tc.setHoverTonalPalette(TonalPalettes.tertiary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onTertiary,
                        child: ColorNameValue(
                          color: colorScheme.onTertiary,
                          textColor: tertiary,
                          label: 'onTertiary',
                          tone: tones.onTertiaryTone,
                          showTone: _locked(
                              isLight, !tc.keepTertiary, !tc.keepDarkTertiary),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(tertiaryContainer);
                        tc.setHoverTonalPalette(TonalPalettes.tertiary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: tertiaryContainer,
                        child: ColorPickerInkWell(
                          color: tertiaryContainer,
                          onChanged: (Color color) {
                            if (isLight) {
                              tc.setTertiaryContainerLight(color);
                            } else {
                              tc.setTertiaryContainerDark(color);
                            }
                          },
                          recentColors: tc.recentColors,
                          onRecentColorsChanged: tc.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                tc.setTertiaryContainerLight(tertiaryContainer);
                              } else {
                                tc.setTertiaryContainerDark(tertiaryContainer);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: tertiaryContainer,
                            textColor: colorScheme.onTertiaryContainer,
                            label: 'tertiary\u200BContainer',
                            tone: tones.tertiaryContainerTone,
                            showTone: _locked(
                                isLight,
                                !tc.keepTertiaryContainer,
                                !tc.keepDarkTertiaryContainer),
                            isLocked: _locked(isLight, tc.keepTertiaryContainer,
                                tc.keepDarkTertiaryContainer),
                            onLocked: tc.useKeyColors && tc.useFlexColorScheme
                                ? isLight
                                    ? tc.setKeepTertiaryContainer
                                    : tc.setKeepDarkTertiaryContainer
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onTertiaryContainer);
                        tc.setHoverTonalPalette(TonalPalettes.tertiary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onTertiaryContainer,
                        child: ColorNameValue(
                          color: colorScheme.onTertiaryContainer,
                          textColor: tertiaryContainer,
                          label: 'onTertiary\u200BContainer',
                          tone: tones.onTertiaryContainerTone,
                          showTone: _locked(isLight, !tc.keepTertiaryContainer,
                              !tc.keepDarkTertiaryContainer),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          // Error colors presentation
          SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.error);
                        tc.setHoverTonalPalette(TonalPalettes.error);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.error,
                        child: ColorNameValue(
                          color: colorScheme.error,
                          textColor: colorScheme.onError,
                          label: 'error',
                          tone: tones.errorTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onError);
                        tc.setHoverTonalPalette(TonalPalettes.error);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onError,
                        child: ColorNameValue(
                          color: colorScheme.onError,
                          textColor: colorScheme.error,
                          label: 'onError',
                          tone: tones.onErrorTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.errorContainer);
                        tc.setHoverTonalPalette(TonalPalettes.error);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.errorContainer,
                        child: ColorNameValue(
                          color: colorScheme.errorContainer,
                          textColor: colorScheme.onErrorContainer,
                          label: 'errorContainer',
                          tone: tones.errorContainerTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onErrorContainer);
                        tc.setHoverTonalPalette(TonalPalettes.error);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onErrorContainer,
                        child: ColorNameValue(
                          color: colorScheme.onErrorContainer,
                          textColor: colorScheme.errorContainer,
                          label: 'onError\u200BContainer',
                          tone: tones.onErrorContainerTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          // Background and shadow colors presentation
          SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.background);
                        tc.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.background,
                        child: ColorNameValue(
                          color: colorScheme.background,
                          textColor: colorScheme.onBackground,
                          label: 'background',
                          tone: tones.backgroundTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onBackground);
                        tc.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onBackground,
                        child: ColorNameValue(
                          color: colorScheme.onBackground,
                          textColor: colorScheme.background,
                          label: 'onBackground',
                          tone: tones.onBackgroundTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.outline);
                        tc.setHoverTonalPalette(TonalPalettes.neutralVariant);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.outline,
                        child: ColorNameValue(
                          color: colorScheme.outline,
                          textColor: _onColor(colorScheme.outline),
                          label: 'outline',
                          tone: tones.outlineTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.shadow);
                        tc.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.shadow,
                        child: ColorNameValue(
                          color: colorScheme.shadow,
                          textColor: _onColor(colorScheme.shadow),
                          label: 'shadow',
                          tone: tones.shadowTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          // Surface colors presentation
          SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.surface);
                        tc.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.surface,
                        child: ColorNameValue(
                          color: colorScheme.surface,
                          textColor: colorScheme.onSurface,
                          label: 'surface',
                          tone: tones.surfaceTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onSurface);
                        tc.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onSurface,
                        child: ColorNameValue(
                          color: colorScheme.onSurface,
                          textColor: colorScheme.surface,
                          label: 'onSurface',
                          tone: tones.onSurfaceTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.surfaceVariant);
                        tc.setHoverTonalPalette(TonalPalettes.neutralVariant);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.surfaceVariant,
                        child: ColorNameValue(
                          color: colorScheme.surfaceVariant,
                          textColor: colorScheme.onSurfaceVariant,
                          label: 'surfaceVariant',
                          tone: tones.surfaceVariantTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onSurfaceVariant);
                        tc.setHoverTonalPalette(TonalPalettes.neutralVariant);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onSurfaceVariant,
                        child: ColorNameValue(
                          color: colorScheme.onSurfaceVariant,
                          textColor: colorScheme.surfaceVariant,
                          label: 'onSurfaceVariant',
                          tone: tones.onSurfaceVariantTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          // Inverse colors presentation
          SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.inverseSurface);
                        tc.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.inverseSurface,
                        child: ColorNameValue(
                          color: colorScheme.inverseSurface,
                          textColor: colorScheme.onInverseSurface,
                          label: 'inverseSurface',
                          tone: tones.inverseSurfaceTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.onInverseSurface);
                        tc.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onInverseSurface,
                        child: ColorNameValue(
                          color: colorScheme.onInverseSurface,
                          textColor: colorScheme.inverseSurface,
                          label: 'onInverseSurface',
                          tone: tones.onInverseSurfaceTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        tc.setHoverColor(colorScheme.inversePrimary);
                        tc.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        tc.setHoverColor(null);
                        tc.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.inversePrimary,
                        child: ColorNameValue(
                          color: colorScheme.inversePrimary,
                          textColor: primary,
                          label: 'inversePrimary',
                          tone: tones.inversePrimaryTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
