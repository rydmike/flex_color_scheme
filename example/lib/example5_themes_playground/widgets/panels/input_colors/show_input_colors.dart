import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../shared/color_name_value.dart';
import '../../shared/color_picker_inkwell.dart';

// Display the colors in currently selected input color scheme, including
// their name and color code.
//
// Allow user to edit the colors, if we are we are viewing the last color
// scheme, which is the custom color scheme.
class ShowInputColors extends StatelessWidget {
  const ShowInputColors({
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      FlexSchemeOnColors.estimateErrorBrightness(color) == Brightness.light;

  // On color used when a theme color property does not have a theme onColor.
  static Color _onColor(final Color color) =>
      _isLight(color) ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    // Used to enable & disable color selection on the color boxes.
    // We can only pick colors when custom theme is selected, which is
    // last index in out list of color schemes.
    final bool isCustomTheme =
        (AppColor.schemes.length - 1) == controller.schemeIndex;
    // Are colors swapped?
    final bool swapLight = controller.swapLightColors;
    final bool swapDark = controller.swapDarkColors;
    // Size of the color boxes
    const double boxWidth = 152; // Was 155, 150 OK on Android
    const double boxHeight = 140;

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

    // Get controller input colors, if we are using the the to dark
    final FlexSchemeColor inputColor = isLight || controller.useToDarkMethod
        ? AppColor.scheme(controller).light
        : AppColor.scheme(controller).dark;

    // But error input dark mode colors also when we use toDark
    final FlexSchemeColor inputErrColor = isLight
        ? AppColor.scheme(controller).light
        : AppColor.scheme(controller).dark;

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
          SizedBox(
            width: boxWidth,
            height: boxHeight * 2,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  // PICK Primary color
                  Expanded(
                    child: Material(
                      color: primary,
                      child: ColorPickerInkWellDialog(
                        color: primary,
                        onChanged: (Color color) {
                          if (isLight) {
                            swapLight
                                ? unawaited(controller.setSecondaryLight(color))
                                : unawaited(controller.setPrimaryLight(color));
                          } else {
                            swapDark
                                ? unawaited(controller.setSecondaryDark(color))
                                : unawaited(controller.setPrimaryDark(color));
                          }
                        },
                        recentColors: controller.recentColors,
                        onRecentColorsChanged: controller.setRecentColors,
                        wasCancelled: (bool cancelled) {
                          if (cancelled) {
                            if (isLight) {
                              swapLight
                                  ? unawaited(
                                      controller.setSecondaryLight(primary))
                                  : unawaited(
                                      controller.setPrimaryLight(primary));
                            } else {
                              swapDark
                                  ? unawaited(
                                      controller.setSecondaryDark(primary))
                                  : unawaited(
                                      controller.setPrimaryDark(primary));
                            }
                          }
                        },
                        enabled: isCustomTheme,
                        child: ColorNameValue(
                          color: primary,
                          textColor: colorScheme.onPrimary,
                          label: 'primary',
                          inputColor: inputColor.primary,
                          inputTextColor: _onColor(inputColor.primary),
                          showMaterialName: true,
                        ),
                      ),
                    ),
                  ),
                  // PICK Primary variant color
                  Expanded(
                    child: Material(
                      color: primaryContainer,
                      child: ColorPickerInkWellDialog(
                        color: primaryContainer,
                        onChanged: (Color color) {
                          if (isLight) {
                            swapLight
                                ? unawaited(controller
                                    .setSecondaryContainerLight(color))
                                : unawaited(
                                    controller.setPrimaryContainerLight(color));
                          } else {
                            swapDark
                                ? unawaited(
                                    controller.setSecondaryContainerDark(color))
                                : unawaited(
                                    controller.setPrimaryContainerDark(color));
                          }
                        },
                        recentColors: controller.recentColors,
                        onRecentColorsChanged: controller.setRecentColors,
                        wasCancelled: (bool cancelled) {
                          if (cancelled) {
                            if (isLight) {
                              swapLight
                                  ? unawaited(
                                      controller.setSecondaryContainerLight(
                                          primaryContainer))
                                  : unawaited(
                                      controller.setPrimaryContainerLight(
                                          primaryContainer));
                            } else {
                              swapDark
                                  ? unawaited(
                                      controller.setSecondaryContainerDark(
                                          primaryContainer))
                                  : unawaited(
                                      controller.setPrimaryContainerDark(
                                          primaryContainer));
                            }
                          }
                        },
                        enabled: isCustomTheme,
                        child: ColorNameValue(
                          color: primaryContainer,
                          textColor: colorScheme.onPrimaryContainer,
                          label: 'primary\nContainer',
                          inputColor: inputColor.primaryContainer,
                          inputTextColor: _onColor(inputColor.primaryContainer),
                          showMaterialName: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: boxWidth,
            height: boxHeight * 2,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  // PICK Secondary color
                  Expanded(
                    child: Material(
                      color: secondary,
                      child: ColorPickerInkWellDialog(
                        color: secondary,
                        onChanged: (Color color) {
                          if (isLight) {
                            swapLight
                                ? unawaited(controller.setPrimaryLight(color))
                                : unawaited(
                                    controller.setSecondaryLight(color));
                          } else {
                            swapDark
                                ? unawaited(controller.setPrimaryDark(color))
                                : unawaited(controller.setSecondaryDark(color));
                          }
                        },
                        recentColors: controller.recentColors,
                        onRecentColorsChanged: controller.setRecentColors,
                        wasCancelled: (bool cancelled) {
                          if (cancelled) {
                            if (isLight) {
                              swapLight
                                  ? unawaited(
                                      controller.setPrimaryLight(secondary))
                                  : unawaited(
                                      controller.setSecondaryLight(secondary));
                            } else {
                              swapDark
                                  ? unawaited(
                                      controller.setPrimaryDark(secondary))
                                  : unawaited(
                                      controller.setSecondaryDark(secondary));
                            }
                          }
                        },
                        enabled: isCustomTheme,
                        child: ColorNameValue(
                          color: secondary,
                          textColor: colorScheme.onSecondary,
                          label: 'secondary',
                          inputColor: inputColor.secondary,
                          inputTextColor: _onColor(inputColor.secondary),
                          showMaterialName: true,
                        ),
                      ),
                    ),
                  ),
                  // PICK Secondary container color
                  Expanded(
                    child: Material(
                      color: secondaryContainer,
                      child: ColorPickerInkWellDialog(
                        color: secondaryContainer,
                        onChanged: (Color color) {
                          if (isLight) {
                            swapLight
                                ? unawaited(
                                    controller.setPrimaryContainerLight(color))
                                : unawaited(controller
                                    .setSecondaryContainerLight(color));
                          } else {
                            swapDark
                                ? unawaited(
                                    controller.setPrimaryContainerDark(color))
                                : unawaited(controller
                                    .setSecondaryContainerDark(color));
                          }
                        },
                        recentColors: controller.recentColors,
                        onRecentColorsChanged: controller.setRecentColors,
                        wasCancelled: (bool cancelled) {
                          if (cancelled) {
                            if (isLight) {
                              swapLight
                                  ? unawaited(
                                      controller.setPrimaryContainerLight(
                                          secondaryContainer))
                                  : unawaited(
                                      controller.setSecondaryContainerLight(
                                          secondaryContainer));
                            } else {
                              swapDark
                                  ? unawaited(
                                      controller.setPrimaryContainerDark(
                                          secondaryContainer))
                                  : unawaited(
                                      controller.setSecondaryContainerDark(
                                          secondaryContainer));
                            }
                          }
                        },
                        enabled: isCustomTheme,
                        child: ColorNameValue(
                          color: secondaryContainer,
                          textColor: colorScheme.onSecondaryContainer,
                          label: 'secondary\nContainer',
                          inputColor: inputColor.secondaryContainer,
                          inputTextColor:
                              _onColor(inputColor.secondaryContainer),
                          showMaterialName: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: boxWidth,
            height: boxHeight * 2,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  // PICK Tertiary color
                  Expanded(
                    child: Material(
                      color: tertiary,
                      child: ColorPickerInkWellDialog(
                        color: tertiary,
                        onChanged: (Color color) {
                          if (isLight) {
                            unawaited(controller.setTertiaryLight(color));
                          } else {
                            unawaited(controller.setTertiaryDark(color));
                          }
                        },
                        recentColors: controller.recentColors,
                        onRecentColorsChanged: controller.setRecentColors,
                        wasCancelled: (bool cancelled) {
                          if (cancelled) {
                            if (isLight) {
                              unawaited(controller.setTertiaryLight(tertiary));
                            } else {
                              unawaited(controller.setTertiaryDark(tertiary));
                            }
                          }
                        },
                        enabled: isCustomTheme,
                        child: ColorNameValue(
                          color: tertiary,
                          textColor: colorScheme.onTertiary,
                          label: 'tertiary',
                          inputColor: inputColor.tertiary,
                          inputTextColor: _onColor(inputColor.tertiary),
                          showMaterialName: true,
                        ),
                      ),
                    ),
                  ),
                  //
                  Expanded(
                    child: Material(
                      color: tertiaryContainer,
                      child: ColorPickerInkWellDialog(
                        color: tertiaryContainer,
                        onChanged: (Color color) {
                          if (isLight) {
                            unawaited(
                                controller.setTertiaryContainerLight(color));
                          } else {
                            unawaited(
                                controller.setTertiaryContainerDark(color));
                          }
                        },
                        recentColors: controller.recentColors,
                        onRecentColorsChanged: controller.setRecentColors,
                        wasCancelled: (bool cancelled) {
                          if (cancelled) {
                            if (isLight) {
                              unawaited(controller.setTertiaryContainerLight(
                                  tertiaryContainer));
                            } else {
                              unawaited(controller
                                  .setTertiaryContainerDark(tertiaryContainer));
                            }
                          }
                        },
                        enabled: isCustomTheme,
                        child: ColorNameValue(
                          color: tertiaryContainer,
                          textColor: colorScheme.onTertiaryContainer,
                          label: 'tertiary\nContainer',
                          inputColor: inputColor.tertiaryContainer,
                          inputTextColor:
                              _onColor(inputColor.tertiaryContainer),
                          showMaterialName: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: boxWidth,
            height: boxHeight * 2,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isCustomTheme ? 2 : 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  // Show Error color
                  Expanded(
                    child: Material(
                      color: colorScheme.error,
                      child: ColorNameValue(
                        color: colorScheme.error,
                        textColor: colorScheme.onError,
                        label: 'error',
                        inputColor: inputErrorColor,
                        inputTextColor: inputOnErrorColor,
                        showMaterialName: true,
                      ),
                    ),
                  ),
                  // Show Error container color
                  Expanded(
                    child: Material(
                      color: colorScheme.errorContainer,
                      child: ColorNameValue(
                        color: colorScheme.errorContainer,
                        textColor: colorScheme.onErrorContainer,
                        label: 'error\nContainer',
                        inputColor: inputErrorContainerColor,
                        inputTextColor: inputOnErrorContainerColor,
                        showMaterialName: true,
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
