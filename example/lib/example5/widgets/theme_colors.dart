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
    const double colorTapHeight = 100;

    // Theme values...
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    final Color primary = colorScheme.primary;
    final Color primaryVariant = colorScheme.primaryVariant;
    final Color onPrimaryVariant =
        ThemeData.estimateBrightnessForColor(colorScheme.primaryVariant) ==
                Brightness.dark
            ? Colors.white
            : Colors.black;
    final Color secondary = colorScheme.secondary;
    final Color secondaryVariant = colorScheme.secondaryVariant;
    final Color onSecondaryVariant =
        ThemeData.estimateBrightnessForColor(colorScheme.secondaryVariant) ==
                Brightness.dark
            ? Colors.white
            : Colors.black;

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
              color: primaryVariant,
              child: ColorPickerInkWell(
                color: primaryVariant,
                onChanged: (Color color) {
                  if (isLight) {
                    swapLight
                        ? controller.setSecondaryVariantLight(color)
                        : controller.setPrimaryVariantLight(color);
                  } else {
                    swapDark
                        ? controller.setSecondaryVariantDark(color)
                        : controller.setPrimaryVariantDark(color);
                  }
                },
                recentColors: controller.recentColors,
                onRecentColorsChanged: controller.setRecentColors,
                wasCancelled: (bool cancelled) {
                  if (cancelled) {
                    if (isLight) {
                      swapLight
                          ? controller.setSecondaryVariantLight(primaryVariant)
                          : controller.setPrimaryVariantLight(primaryVariant);
                    } else {
                      swapDark
                          ? controller.setSecondaryVariantDark(primaryVariant)
                          : controller.setPrimaryVariantDark(primaryVariant);
                    }
                  }
                },
                enabled: isCustomTheme,
                child: ColorNameValue(
                  color: primaryVariant,
                  textColor: onPrimaryVariant,
                  label: 'primary\nVariant',
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
          // PICK Secondary variant color
          SizedBox(
            width: colorTapWidth,
            height: colorTapHeight,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
              color: secondaryVariant,
              child: ColorPickerInkWell(
                color: secondaryVariant,
                onChanged: (Color color) {
                  if (isLight) {
                    swapLight
                        ? controller.setPrimaryVariantLight(color)
                        : controller.setSecondaryVariantLight(color);
                  } else {
                    swapDark
                        ? controller.setPrimaryVariantDark(color)
                        : controller.setSecondaryVariantDark(color);
                  }
                },
                recentColors: controller.recentColors,
                onRecentColorsChanged: controller.setRecentColors,
                wasCancelled: (bool cancelled) {
                  if (cancelled) {
                    if (isLight) {
                      swapLight
                          ? controller.setPrimaryVariantLight(secondaryVariant)
                          : controller
                              .setSecondaryVariantLight(secondaryVariant);
                    } else {
                      swapDark
                          ? controller.setPrimaryVariantDark(secondaryVariant)
                          : controller
                              .setSecondaryVariantDark(secondaryVariant);
                    }
                  }
                },
                enabled: isCustomTheme,
                child: ColorNameValue(
                  color: secondaryVariant,
                  textColor: onSecondaryVariant,
                  label: 'secondary\nVariant',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
