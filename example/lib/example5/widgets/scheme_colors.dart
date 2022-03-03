import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/controllers/theme_controller.dart';
import 'color_name_value.dart';
import 'color_picker_inkwell.dart';

// Display the all scheme colors in currently selected color scheme, including
// their name and color code.
//
// Allow user to edit the colors, if we are we are viewing the last color
// scheme, which is the custom color scheme.
class SchemeColors extends StatelessWidget {
  const SchemeColors({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ThemeController controller;

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light;

  // On color used when a theme color property does not have a theme onColor.
  static Color _onColor(final Color color) =>
      _isLight(color) ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    // Used to enable & disable color selection on the color boxes.
    // We can only pick colors when custom theme is selected, which is
    // last index in out list of color schemes.
    final bool isCustomTheme =
        (AppColor.schemesCustom.length - 1) == controller.schemeIndex;
    // Are colors swapped?
    final bool swapLight = controller.swapLightColors;
    final bool swapDark = controller.swapDarkColors;
    // Size of the color presentation boxes
    const double boxWidth = 155;
    const double boxHeight = 370;

    // Theme values...
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    // These color values are also used if picking is cancelled to restore
    // previous color selection.
    final Color primary = colorScheme.primary;
    final Color primaryContainer = colorScheme.primaryContainer;
    final Color secondary = colorScheme.secondary;
    final Color secondaryContainer = colorScheme.secondaryContainer;
    final Color tertiary = colorScheme.tertiary;
    final Color tertiaryContainer = colorScheme.tertiaryContainer;

    // Grab active tons and chroma setup.
    final FlexTone tones = AppColor.flexTonesConfig(
        theme.brightness, controller.usedFlexToneSetup);
    // Should we even show the tone? We show them only when, seeding is on.
    final bool showTones =
        controller.useKeyColors && controller.useFlexColorScheme;

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
        borderRadius: const BorderRadius.all(Radius.circular(4)),
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
                        controller.setHoverColor(primary);
                        controller.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: primary,
                        child: ColorPickerInkWell(
                          color: primary,
                          onChanged: (Color color) {
                            if (isLight) {
                              swapLight
                                  ? controller.setSecondaryLight(color)
                                  : controller.setPrimaryLight(color);
                            } else {
                              swapDark
                                  ? controller.setSecondaryDark(color)
                                  : controller.setPrimaryDark(color);
                            }
                          },
                          recentColors: controller.recentColors,
                          onRecentColorsChanged: controller.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                swapLight
                                    ? controller.setSecondaryLight(primary)
                                    : controller.setPrimaryLight(primary);
                              } else {
                                swapDark
                                    ? controller.setSecondaryDark(primary)
                                    : controller.setPrimaryDark(primary);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: primary,
                            textColor: colorScheme.onPrimary,
                            label: 'primary',
                            tone: tones.primaryTone,
                            showTone: showTones && !controller.keepPrimary,
                            isLocked: controller.useKeyColors &&
                                controller.useFlexColorScheme &&
                                controller.keepPrimary,
                            onLocked: controller.useKeyColors &&
                                    controller.useFlexColorScheme
                                ? controller.setKeepPrimary
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
                        controller.setHoverColor(colorScheme.onPrimary);
                        controller.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onPrimary,
                        child: ColorNameValue(
                          color: colorScheme.onPrimary,
                          textColor: colorScheme.primary,
                          label: 'onPrimary',
                          showTone: showTones && !controller.keepPrimary,
                          tone: tones.onPrimaryTone,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        controller.setHoverColor(primaryContainer);
                        controller.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: primaryContainer,
                        child: ColorPickerInkWell(
                          color: primaryContainer,
                          onChanged: (Color color) {
                            if (isLight) {
                              swapLight
                                  ? controller.setSecondaryContainerLight(color)
                                  : controller.setPrimaryContainerLight(color);
                            } else {
                              swapDark
                                  ? controller.setSecondaryContainerDark(color)
                                  : controller.setPrimaryContainerDark(color);
                            }
                          },
                          recentColors: controller.recentColors,
                          onRecentColorsChanged: controller.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                swapLight
                                    ? controller.setSecondaryContainerLight(
                                        primaryContainer)
                                    : controller.setPrimaryContainerLight(
                                        primaryContainer);
                              } else {
                                swapDark
                                    ? controller.setSecondaryContainerDark(
                                        primaryContainer)
                                    : controller.setPrimaryContainerDark(
                                        primaryContainer);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: primaryContainer,
                            textColor: colorScheme.onPrimaryContainer,
                            label: 'primaryContainer',
                            tone: tones.primaryContainerTone,
                            showTone:
                                showTones && !controller.keepPrimaryContainer,
                            isLocked: controller.useKeyColors &&
                                controller.useFlexColorScheme &&
                                controller.keepPrimaryContainer,
                            onLocked: controller.useKeyColors &&
                                    controller.useFlexColorScheme
                                ? controller.setKeepPrimaryContainer
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
                        controller
                            .setHoverColor(colorScheme.onPrimaryContainer);
                        controller.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onPrimaryContainer,
                        child: ColorNameValue(
                          color: colorScheme.onPrimaryContainer,
                          textColor: colorScheme.primaryContainer,
                          label: 'onPrimaryContainer',
                          tone: tones.onPrimaryContainerTone,
                          showTone:
                              showTones && !controller.keepPrimaryContainer,
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
                        controller.setHoverColor(secondary);
                        controller
                            .setHoverTonalPalette(TonalPalettes.secondary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: secondary,
                        child: ColorPickerInkWell(
                          color: secondary,
                          onChanged: (Color color) {
                            if (isLight) {
                              swapLight
                                  ? controller.setPrimaryLight(color)
                                  : controller.setSecondaryLight(color);
                            } else {
                              swapDark
                                  ? controller.setPrimaryDark(color)
                                  : controller.setSecondaryDark(color);
                            }
                          },
                          recentColors: controller.recentColors,
                          onRecentColorsChanged: controller.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                swapLight
                                    ? controller.setPrimaryLight(secondary)
                                    : controller.setSecondaryLight(secondary);
                              } else {
                                swapDark
                                    ? controller.setPrimaryDark(secondary)
                                    : controller.setSecondaryDark(secondary);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: secondary,
                            textColor: colorScheme.onSecondary,
                            label: 'secondary',
                            tone: tones.secondaryTone,
                            showTone: showTones && !controller.keepSecondary,
                            isLocked: controller.useKeyColors &&
                                controller.useFlexColorScheme &&
                                controller.keepSecondary,
                            onLocked: controller.useKeyColors &&
                                    controller.useFlexColorScheme
                                ? controller.setKeepSecondary
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
                        controller.setHoverColor(colorScheme.onSecondary);
                        controller
                            .setHoverTonalPalette(TonalPalettes.secondary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onSecondary,
                        child: ColorNameValue(
                          color: colorScheme.onSecondary,
                          textColor: colorScheme.secondary,
                          label: 'onSecondary',
                          tone: tones.onSecondaryTone,
                          showTone: showTones && !controller.keepSecondary,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        controller.setHoverColor(secondaryContainer);
                        controller
                            .setHoverTonalPalette(TonalPalettes.secondary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: secondaryContainer,
                        child: ColorPickerInkWell(
                          color: secondaryContainer,
                          onChanged: (Color color) {
                            if (isLight) {
                              swapLight
                                  ? controller.setPrimaryContainerLight(color)
                                  : controller
                                      .setSecondaryContainerLight(color);
                            } else {
                              swapDark
                                  ? controller.setPrimaryContainerDark(color)
                                  : controller.setSecondaryContainerDark(color);
                            }
                          },
                          recentColors: controller.recentColors,
                          onRecentColorsChanged: controller.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                swapLight
                                    ? controller.setPrimaryContainerLight(
                                        secondaryContainer)
                                    : controller.setSecondaryContainerLight(
                                        secondaryContainer);
                              } else {
                                swapDark
                                    ? controller.setPrimaryContainerDark(
                                        secondaryContainer)
                                    : controller.setSecondaryContainerDark(
                                        secondaryContainer);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: secondaryContainer,
                            textColor: colorScheme.onSecondaryContainer,
                            label: 'secondaryContainer',
                            tone: tones.secondaryContainerTone,
                            showTone:
                                showTones && !controller.keepSecondaryContainer,
                            isLocked: controller.useKeyColors &&
                                controller.useFlexColorScheme &&
                                controller.keepSecondaryContainer,
                            onLocked: controller.useKeyColors &&
                                    controller.useFlexColorScheme
                                ? controller.setKeepSecondaryContainer
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
                        controller
                            .setHoverColor(colorScheme.onSecondaryContainer);
                        controller
                            .setHoverTonalPalette(TonalPalettes.secondary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onSecondaryContainer,
                        child: ColorNameValue(
                          color: colorScheme.onSecondaryContainer,
                          textColor: secondaryContainer,
                          label: 'onSecondaryContainer',
                          tone: tones.onSecondaryContainerTone,
                          showTone:
                              showTones && !controller.keepSecondaryContainer,
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
                        controller.setHoverColor(tertiary);
                        controller.setHoverTonalPalette(TonalPalettes.tertiary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: tertiary,
                        child: ColorPickerInkWell(
                          color: tertiary,
                          onChanged: (Color color) {
                            if (isLight) {
                              controller.setTertiaryLight(color);
                            } else {
                              controller.setTertiaryDark(color);
                            }
                          },
                          recentColors: controller.recentColors,
                          onRecentColorsChanged: controller.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                controller.setTertiaryLight(tertiary);
                              } else {
                                controller.setTertiaryDark(tertiary);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: tertiary,
                            textColor: colorScheme.onTertiary,
                            label: 'tertiary',
                            tone: tones.tertiaryTone,
                            showTone: showTones && !controller.keepTertiary,
                            isLocked: controller.useKeyColors &&
                                controller.useFlexColorScheme &&
                                controller.keepTertiary,
                            onLocked: controller.useKeyColors &&
                                    controller.useFlexColorScheme
                                ? controller.setKeepTertiary
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
                        controller.setHoverColor(colorScheme.onTertiary);
                        controller.setHoverTonalPalette(TonalPalettes.tertiary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onTertiary,
                        child: ColorNameValue(
                          color: colorScheme.onTertiary,
                          textColor: tertiary,
                          label: 'onTertiary',
                          tone: tones.onTertiaryTone,
                          showTone: showTones && !controller.keepTertiary,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (PointerEvent details) {
                        controller.setHoverColor(tertiaryContainer);
                        controller.setHoverTonalPalette(TonalPalettes.tertiary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: tertiaryContainer,
                        child: ColorPickerInkWell(
                          color: tertiaryContainer,
                          onChanged: (Color color) {
                            if (isLight) {
                              controller.setTertiaryContainerLight(color);
                            } else {
                              controller.setTertiaryContainerDark(color);
                            }
                          },
                          recentColors: controller.recentColors,
                          onRecentColorsChanged: controller.setRecentColors,
                          wasCancelled: (bool cancelled) {
                            if (cancelled) {
                              if (isLight) {
                                controller.setTertiaryContainerLight(
                                    tertiaryContainer);
                              } else {
                                controller.setTertiaryContainerDark(
                                    tertiaryContainer);
                              }
                            }
                          },
                          enabled: isCustomTheme,
                          child: ColorNameValue(
                            color: tertiaryContainer,
                            textColor: colorScheme.onTertiaryContainer,
                            label: 'tertiaryContainer',
                            tone: tones.tertiaryContainerTone,
                            showTone:
                                showTones && !controller.keepTertiaryContainer,
                            isLocked: controller.useKeyColors &&
                                controller.useFlexColorScheme &&
                                controller.keepTertiaryContainer,
                            onLocked: controller.useKeyColors &&
                                    controller.useFlexColorScheme
                                ? controller.setKeepTertiaryContainer
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
                        controller
                            .setHoverColor(colorScheme.onTertiaryContainer);
                        controller.setHoverTonalPalette(TonalPalettes.tertiary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onTertiaryContainer,
                        child: ColorNameValue(
                          color: colorScheme.onTertiaryContainer,
                          textColor: tertiaryContainer,
                          label: 'onTertiaryContainer',
                          tone: tones.onTertiaryContainerTone,
                          showTone:
                              showTones && !controller.keepTertiaryContainer,
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
                        controller.setHoverColor(colorScheme.error);
                        controller.setHoverTonalPalette(TonalPalettes.error);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.onError);
                        controller.setHoverTonalPalette(TonalPalettes.error);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.errorContainer);
                        controller.setHoverTonalPalette(TonalPalettes.error);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.onErrorContainer);
                        controller.setHoverTonalPalette(TonalPalettes.error);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
                      },
                      child: Material(
                        color: colorScheme.onErrorContainer,
                        child: ColorNameValue(
                          color: colorScheme.onErrorContainer,
                          textColor: colorScheme.errorContainer,
                          label: 'onErrorContainer',
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
                        controller.setHoverColor(colorScheme.background);
                        controller.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.onBackground);
                        controller.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.outline);
                        controller
                            .setHoverTonalPalette(TonalPalettes.neutralVariant);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.shadow);
                        controller.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.surface);
                        controller.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.onSurface);
                        controller.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.surfaceVariant);
                        controller
                            .setHoverTonalPalette(TonalPalettes.neutralVariant);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.onSurfaceVariant);
                        controller
                            .setHoverTonalPalette(TonalPalettes.neutralVariant);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.inverseSurface);
                        controller.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.onInverseSurface);
                        controller.setHoverTonalPalette(TonalPalettes.neutral);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
                        controller.setHoverColor(colorScheme.inversePrimary);
                        controller.setHoverTonalPalette(TonalPalettes.primary);
                      },
                      onExit: (PointerEvent details) {
                        controller.setHoverColor(null);
                        controller.setHoverTonalPalette(null);
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
