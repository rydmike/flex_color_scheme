import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/flex_tones_enum.dart';
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
      FlexSchemeOnColors.estimateErrorBrightness(color) == Brightness.light;

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

    // Show the input color values
    final bool showInputColor = tc.showSchemeInput;

    // Size of the color presentation boxes
    const double boxWidth = 150;
    final double boxHeight = showInputColor ? 230 : 200;

    // Theme values...
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    // These color values are used if picking is cancelled to restore
    // previous color selection.
    final Color primary = colorScheme.primary;
    final Color primaryContainer = colorScheme.primaryContainer;
    final Color secondary = colorScheme.secondary;
    final Color secondaryContainer = colorScheme.secondaryContainer;
    final Color tertiary = colorScheme.tertiary;
    final Color tertiaryContainer = colorScheme.tertiaryContainer;

    // Grab active tones and chroma setup.
    final FlexTones tones = FlexTonesEnum.values[tc.usedFlexToneSetup]
        .tones(theme.brightness)
        .onMainsUseBW(isLight ? tc.onMainsUseBWLight : tc.onMainsUseBWDark)
        .onSurfacesUseBW(
            isLight ? tc.onSurfacesUseBWLight : tc.onSurfacesUseBWDark);
    // Should we even show the tone? We show them only when, seeding is on.
    final bool showTones = tc.useKeyColors && tc.useFlexColorScheme;

    // Get controller input colors, if we are using the the to dark
    final FlexSchemeColor inputColor = isLight || tc.useToDarkMethod
        ? AppColor.scheme(tc).light
        : AppColor.scheme(tc).dark;

    // But error input dark mode colors also when we use toDark
    final FlexSchemeColor inputErrColor =
        isLight ? AppColor.scheme(tc).light : AppColor.scheme(tc).dark;

    // Input errorColors
    final Color inputErrorColor = inputErrColor.error ??
        (isLight ? FlexColor.materialLightError : FlexColor.materialDarkError);
    final Color inputOnErrorColor = _onColor(inputErrorColor);
    final Color inputErrorContainerColor = inputErrColor.errorContainer ??
        (isLight
            ? FlexColor.lightErrorContainer(inputErrorColor)
            : FlexColor.darkErrorContainer(inputErrorColor));
    final Color inputOnErrorContainerColor = _onColor(inputErrorContainerColor);

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

    // TODO(rydmike): Removed tone hover indication feature 16.3.2023.
    // For some reason tone hover feature started causing issues in WEB release
    // mode builds, but only in WEB release mode on both SKIA and HTML. No idea
    // why that happens only on web release mode and not in its debug mode or
    // any mode VM mode build. JS compiler optimization bug in release mode
    // is my  suspected cause.
    //
    // Removal of this feature has removed commented code in:
    // - theme_controller.dart
    // - scheme_colors.dart
    // - show_tonal_palette.dart
    // - seeded_color_scheme_settings.dart
    // ----- Commented hover code are in all the MouseRegion's below
    //       The MouseRegion's are still there, maybe remove them as well.

    // Wrap this widget branch in a custom theme where card has a border outline
    // if it did not have one, but retains the ambient themed border radius.
    return Theme(
      data: theme.copyWith(
        cardTheme: CardTheme.of(context).copyWith(
          elevation: 0,
          shape: border,
          surfaceTintColor: Colors.transparent,
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
          RepaintBoundary(
            key: const ValueKey<String>('primary'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(primary);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.primary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: primary,
                          child: ColorPickerInkWellDialog(
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
                              key: ValueKey<String>('cnv primary $primary'),
                              color: primary,
                              textColor: colorScheme.onPrimary,
                              label: 'primary',
                              showInputColor: showInputColor,
                              inputColor: inputColor.primary,
                              inputTextColor: _onColor(inputColor.primary),
                              tone: tones.primaryTone,
                              showTone: _locked(isLight, !tc.keepPrimary,
                                  !tc.keepDarkPrimary),
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
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onPrimary);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.primary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onPrimary,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv onPrimary ${colorScheme.onPrimary}'),
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
                  ],
                ),
              ),
            ),
          ),
          //
          // PrimaryContainer colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('primaryContainer'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        //   onEnter: (PointerEvent details) {
                        //     tc.setHoverColor(primaryContainer);
                        //     tc.setHoverTonalPalette(TonalPalettes.primary);
                        //   },
                        //   onExit: (PointerEvent details) {
                        //     tc.setHoverColor(null);
                        //     tc.setHoverTonalPalette(null);
                        //   },
                        child: Material(
                          color: primaryContainer,
                          child: ColorPickerInkWellDialog(
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
                              key: ValueKey<String>('cnv primaryContainer '
                                  '$primaryContainer'),
                              color: primaryContainer,
                              textColor: colorScheme.onPrimaryContainer,
                              label: 'primary\u200BContainer',
                              showInputColor: showInputColor,
                              inputColor: inputColor.primaryContainer,
                              inputTextColor:
                                  _onColor(inputColor.primaryContainer),
                              tone: tones.primaryContainerTone,
                              showTone: _locked(
                                  isLight,
                                  !tc.keepPrimaryContainer,
                                  !tc.keepDarkPrimaryContainer),
                              isLocked: _locked(
                                  isLight,
                                  tc.keepPrimaryContainer,
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
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onPrimaryContainer);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.primary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onPrimaryContainer,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onPrimaryContainer '
                                '${colorScheme.onPrimaryContainer}'),
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
          ),
          //
          // Secondary colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('secondary'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(secondary);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.secondary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: secondary,
                          child: ColorPickerInkWellDialog(
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
                              key: ValueKey<String>('cnv secondary $secondary'),
                              color: secondary,
                              textColor: colorScheme.onSecondary,
                              label: 'secondary',
                              showInputColor: showInputColor,
                              inputColor: inputColor.secondary,
                              inputTextColor: _onColor(inputColor.secondary),
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
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onSecondary);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.secondary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onSecondary,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv onSecondary ${colorScheme.onSecondary}'),
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
                  ],
                ),
              ),
            ),
          ),
          //
          // SecondaryContainer colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('secondaryContainer'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(secondaryContainer);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.secondary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: secondaryContainer,
                          child: ColorPickerInkWellDialog(
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
                              key: ValueKey<String>('cnv secondaryContainer '
                                  '$secondaryContainer'),
                              color: secondaryContainer,
                              textColor: colorScheme.onSecondaryContainer,
                              label: 'secondary\u200BContainer',
                              showInputColor: showInputColor,
                              inputColor: inputColor.secondaryContainer,
                              inputTextColor:
                                  _onColor(inputColor.secondaryContainer),
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
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onSecondaryContainer);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.secondary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onSecondaryContainer,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onSecondaryContainer '
                                '${colorScheme.onSecondaryContainer}'),
                            color: colorScheme.onSecondaryContainer,
                            textColor: secondaryContainer,
                            label: 'onSecondary\u200BContainer',
                            tone: tones.onSecondaryContainerTone,
                            showTone: _locked(
                                isLight,
                                !tc.keepSecondaryContainer,
                                !tc.keepDarkSecondaryContainer),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // Tertiary colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('tertiary'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(tertiary);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.tertiary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: tertiary,
                          child: ColorPickerInkWellDialog(
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
                              key: ValueKey<String>('cnv tertiary $tertiary'),
                              color: tertiary,
                              textColor: colorScheme.onTertiary,
                              label: 'tertiary',
                              showInputColor: showInputColor,
                              inputColor: inputColor.tertiary,
                              inputTextColor: _onColor(inputColor.tertiary),
                              tone: tones.tertiaryTone,
                              showTone: _locked(isLight, !tc.keepTertiary,
                                  !tc.keepDarkTertiary),
                              isLocked: _locked(isLight, tc.keepTertiary,
                                  tc.keepDarkTertiary),
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
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onTertiary);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.tertiary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onTertiary,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv onTertiary ${colorScheme.onTertiary}'),
                            color: colorScheme.onTertiary,
                            textColor: tertiary,
                            label: 'onTertiary',
                            tone: tones.onTertiaryTone,
                            showTone: _locked(isLight, !tc.keepTertiary,
                                !tc.keepDarkTertiary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // TertiaryContainer colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('tertiaryContainer'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(tertiaryContainer);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.tertiary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: tertiaryContainer,
                          child: ColorPickerInkWellDialog(
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
                                  tc.setTertiaryContainerLight(
                                      tertiaryContainer);
                                } else {
                                  tc.setTertiaryContainerDark(
                                      tertiaryContainer);
                                }
                              }
                            },
                            enabled: isCustomTheme,
                            child: ColorNameValue(
                              key: ValueKey<String>('cnv tertiaryContainer '
                                  '$tertiaryContainer'),
                              color: tertiaryContainer,
                              textColor: colorScheme.onTertiaryContainer,
                              label: 'tertiary\u200BContainer',
                              showInputColor: showInputColor,
                              inputColor: inputColor.tertiaryContainer,
                              inputTextColor:
                                  _onColor(inputColor.tertiaryContainer),
                              tone: tones.tertiaryContainerTone,
                              showTone: _locked(
                                  isLight,
                                  !tc.keepTertiaryContainer,
                                  !tc.keepDarkTertiaryContainer),
                              isLocked: _locked(
                                  isLight,
                                  tc.keepTertiaryContainer,
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
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onTertiaryContainer);
                        //   tc.setHoverTonalPalette(TonalPalettes.tertiary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onTertiaryContainer,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onTertiaryContainer '
                                '${colorScheme.onTertiaryContainer}'),
                            color: colorScheme.onTertiaryContainer,
                            textColor: tertiaryContainer,
                            label: 'onTertiary\u200BContainer',
                            tone: tones.onTertiaryContainerTone,
                            showTone: _locked(
                                isLight,
                                !tc.keepTertiaryContainer,
                                !tc.keepDarkTertiaryContainer),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // Error colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('error'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.error);
                        //   tc.setHoverTonalPalette(TonalPalettes.error);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.error,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv error ${colorScheme.error}'),
                            color: colorScheme.error,
                            textColor: colorScheme.onError,
                            label: 'error',
                            showInputColor: showInputColor,
                            inputColor: inputErrorColor,
                            inputTextColor: inputOnErrorColor,
                            tone: tones.errorTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onError);
                        //   tc.setHoverTonalPalette(TonalPalettes.error);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onError,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv onError ${colorScheme.onError}'),
                            color: colorScheme.onError,
                            textColor: colorScheme.error,
                            label: 'onError',
                            tone: tones.onErrorTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // ErrorContainer colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('errorContainer'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.errorContainer);
                        //   tc.setHoverTonalPalette(TonalPalettes.error);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.errorContainer,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv errorContainer '
                                '${colorScheme.errorContainer}'),
                            color: colorScheme.errorContainer,
                            textColor: colorScheme.onErrorContainer,
                            label: 'error\nContainer',
                            showInputColor: showInputColor,
                            inputColor: inputErrorContainerColor,
                            inputTextColor: inputOnErrorContainerColor,
                            tone: tones.errorContainerTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onErrorContainer);
                        //   tc.setHoverTonalPalette(TonalPalettes.error);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onErrorContainer,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onErrorContainer '
                                '${colorScheme.onErrorContainer}'),
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
          ),
          //
          // Background colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('background'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.background);
                        //
                        //   tc.setHoverTonalPalette(TonalPalettes.neutral);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.background,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv background ${colorScheme.background}'),
                            color: colorScheme.background,
                            textColor: colorScheme.onBackground,
                            label: 'background',
                            tone: tones.backgroundTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onBackground);
                        //   tc.setHoverTonalPalette(TonalPalettes.neutral);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onBackground,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onBackground '
                                '${colorScheme.onBackground}'),
                            color: colorScheme.onBackground,
                            textColor: colorScheme.background,
                            label: 'onBackground',
                            tone: tones.onBackgroundTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // Surface colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('surface'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.surface);
                        //   tc.setHoverTonalPalette(TonalPalettes.neutral);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.surface,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv surface ${colorScheme.surface}'),
                            color: colorScheme.surface,
                            textColor: colorScheme.onSurface,
                            label: 'surface',
                            tone: tones.surfaceTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onSurface);
                        //   tc.setHoverTonalPalette(TonalPalettes.neutral);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onSurface,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv onSurface ${colorScheme.onSurface}'),
                            color: colorScheme.onSurface,
                            textColor: colorScheme.surface,
                            label: 'onSurface',
                            tone: tones.onSurfaceTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // SurfaceVariant colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('surfaceVariant'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.surfaceVariant);
                        //tc.setHoverTonalPalette(TonalPalettes.neutralVariant);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.surfaceVariant,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv surfaceVariant '
                                '${colorScheme.surfaceVariant}'),
                            color: colorScheme.surfaceVariant,
                            textColor: colorScheme.onSurfaceVariant,
                            label: 'surface\u200BVariant',
                            tone: tones.surfaceVariantTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onSurfaceVariant);
                        //tc.setHoverTonalPalette(TonalPalettes.neutralVariant);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onSurfaceVariant,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onSurfaceVariant '
                                '${colorScheme.onSurfaceVariant}'),
                            color: colorScheme.onSurfaceVariant,
                            textColor: colorScheme.surfaceVariant,
                            label: 'onSurface\u200BVariant',
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
          ),
          //
          // InverseSurface colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('inverseSurface'),
            child: SizedBox(
              width: boxWidth,
              height: boxHeight,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.inverseSurface);
                        //   tc.setHoverTonalPalette(TonalPalettes.neutral);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.inverseSurface,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv inverseSurface '
                                '${colorScheme.inverseSurface}'),
                            color: colorScheme.inverseSurface,
                            textColor: colorScheme.onInverseSurface,
                            label: 'inverse\u200BSurface',
                            tone: tones.inverseSurfaceTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.onInverseSurface);
                        //   tc.setHoverTonalPalette(TonalPalettes.neutral);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.onInverseSurface,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onInverseSurface '
                                '${colorScheme.onInverseSurface}'),
                            color: colorScheme.onInverseSurface,
                            textColor: colorScheme.inverseSurface,
                            label: 'onInverse\u200BSurface',
                            tone: tones.onInverseSurfaceTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // Outline and outlineVariant colors presentation.
          RepaintBoundary(
            key: const ValueKey<String>('outline'),
            child: SizedBox(
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
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.outline);
                        //tc.setHoverTonalPalette(TonalPalettes.neutralVariant);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.outline,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv outline ${colorScheme.outline}'),
                            color: colorScheme.outline,
                            textColor: _onColor(colorScheme.outline),
                            label: 'outline',
                            tone: tones.outlineTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.outlineVariant);
                        //tc.setHoverTonalPalette(TonalPalettes.neutralVariant);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.outlineVariant,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv outlineVariant '
                                '${colorScheme.outlineVariant}'),
                            color: colorScheme.outlineVariant,
                            textColor: _onColor(colorScheme.outlineVariant),
                            label: 'outline\u200BVariant',
                            tone: tones.outlineVariantTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Shadow and scrim colors presentation.
          RepaintBoundary(
            key: const ValueKey<String>('Shadow'),
            child: SizedBox(
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
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.shadow);
                        //   tc.setHoverTonalPalette(TonalPalettes.neutral);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.shadow,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv shadow ${colorScheme.shadow}'),
                            color: colorScheme.shadow,
                            textColor: _onColor(colorScheme.shadow),
                            label: 'shadow',
                            tone: tones.shadowTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.scrim);
                        //   tc.setHoverTonalPalette(TonalPalettes.neutral);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.scrim,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv scrim ${colorScheme.scrim}'),
                            color: colorScheme.scrim,
                            textColor: _onColor(colorScheme.scrim),
                            label: 'scrim',
                            tone: tones.scrimTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // InversePrimary and surfaceTint colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('inversePrimary'),
            child: SizedBox(
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
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.inversePrimary);
                        //   tc.setHoverTonalPalette(TonalPalettes.primary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.inversePrimary,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv inversePrimary '
                                '${colorScheme.inversePrimary}'),
                            color: colorScheme.inversePrimary,
                            textColor: colorScheme.inverseSurface,
                            label: 'inverse\u200BPrimary',
                            tone: tones.inversePrimaryTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MouseRegion(
                        // onEnter: (PointerEvent details) {
                        //   tc.setHoverColor(colorScheme.surfaceTint);
                        //   tc.setHoverTonalPalette(TonalPalettes.primary);
                        // },
                        // onExit: (PointerEvent details) {
                        //   tc.setHoverColor(null);
                        //   tc.setHoverTonalPalette(null);
                        // },
                        child: Material(
                          color: colorScheme.surfaceTint,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv surfaceTint '
                                '${colorScheme.surfaceTint}'),
                            color: colorScheme.surfaceTint,
                            textColor: _onColor(colorScheme.surfaceTint),
                            label: 'surfaceTint',
                            tone: tones.primaryTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
