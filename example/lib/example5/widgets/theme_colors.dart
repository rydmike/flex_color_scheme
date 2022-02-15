import 'package:flutter/material.dart';

import '../../shared/const/app_color.dart';
import '../../shared/controllers/theme_controller.dart';
import 'color_name_value.dart';
import 'color_picker_inkwell.dart';

// Display the 4 main colors in currently selected color scheme, including
// their name and color code.
//
// Allow user to edit the colors, if we are we are viewing the last color
// scheme, which is the custom color scheme.
class ThemeColors extends StatelessWidget {
  const ThemeColors({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ThemeController controller;

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
    // Size of the tappable color named boxes
    const double colorTapWidth = 125;
    const double colorTapHeight = 95;

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
    // if it did not have one, but retains in ambient themed border radius.
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
          // PICK Primary color
          SizedBox(
            width: colorTapWidth,
            height: colorTapHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
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
                ),
              ),
            ),
          ),
          //
          // PICK Primary variant color
          SizedBox(
            width: colorTapWidth,
            height: colorTapHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
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
                          ? controller
                              .setSecondaryContainerLight(primaryContainer)
                          : controller
                              .setPrimaryContainerLight(primaryContainer);
                    } else {
                      swapDark
                          ? controller
                              .setSecondaryContainerDark(primaryContainer)
                          : controller
                              .setPrimaryContainerDark(primaryContainer);
                    }
                  }
                },
                enabled: isCustomTheme,
                child: ColorNameValue(
                  color: primaryContainer,
                  textColor: colorScheme.onPrimaryContainer,
                  label: 'primary\nContainer',
                ),
              ),
            ),
          ),
          //
          // PICK Secondary color
          SizedBox(
            width: colorTapWidth,
            height: colorTapHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
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
                ),
              ),
            ),
          ),
          //
          // PICK Secondary container color
          SizedBox(
            width: colorTapWidth,
            height: colorTapHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
              color: secondaryContainer,
              child: ColorPickerInkWell(
                color: secondaryContainer,
                onChanged: (Color color) {
                  if (isLight) {
                    swapLight
                        ? controller.setPrimaryContainerLight(color)
                        : controller.setSecondaryContainerLight(color);
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
                          ? controller
                              .setPrimaryContainerLight(secondaryContainer)
                          : controller
                              .setSecondaryContainerLight(secondaryContainer);
                    } else {
                      swapDark
                          ? controller
                              .setPrimaryContainerDark(secondaryContainer)
                          : controller
                              .setSecondaryContainerDark(secondaryContainer);
                    }
                  }
                },
                enabled: isCustomTheme,
                child: ColorNameValue(
                  color: secondaryContainer,
                  textColor: colorScheme.onSecondaryContainer,
                  label: 'secondary\nContainer',
                ),
              ),
            ),
          ),
          //
          // PICK Tertiary color
          SizedBox(
            width: colorTapWidth,
            height: colorTapHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
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
                ),
              ),
            ),
          ),
          //
          // PICK Tertiary container color
          SizedBox(
            width: colorTapWidth,
            height: colorTapHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
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
                      controller.setTertiaryContainerLight(tertiaryContainer);
                    } else {
                      controller.setTertiaryContainerDark(tertiaryContainer);
                    }
                  }
                },
                enabled: isCustomTheme,
                child: ColorNameValue(
                  color: tertiaryContainer,
                  textColor: colorScheme.onTertiaryContainer,
                  label: 'tertiary\nContainer',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
