import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/controllers/tone_indicator_controller.dart';
import '../../../utils/effective_flex_tones.dart';
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
    required this.toneC,
  });

  final ThemeController tc;
  final ToneIndicatorController toneC;

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
    final bool swapLight = tc.swapPrimaryAndSecondaryLightColors;
    final bool swapDark = tc.swapPrimaryAndSecondaryDarkColors;

    // Show the input color values
    final bool showInputColor = tc.showSchemeInputColors;

    // Size of the color presentation boxes
    const double boxWidth = 135;
    final double boxHeight = showInputColor ? 200 : 170;

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
    final Color error = colorScheme.error;
    final Color errorContainer = colorScheme.errorContainer;

    // Get effective tones and chroma setup
    final FlexTones tones = effectiveFlexTones(tc, context);
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
    } else {
      // Border was null, make one matching Card default, but with border
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
          // TODO(rydmike): Refactor RepaintBoundary branch to a StatelessWidget
          //  This represents the most complex version of this widget type,
          //  it should also work for the simpler ones used on ColorBlends and
          //  InputColors. The resulting widget will need a lot of props where
          //  many can optional, but at least it will get flatter and simpler
          //  to maintain. This is a classic lazy copy-paste job with code debt,
          //  that should be refactored.

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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(primary);

                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: primary,
                          child: ColorPickerInkWellDialog(
                            color: primary,
                            onChanged: (Color color) {
                              if (isLight) {
                                swapLight
                                    ? tc.setCustomSecondaryLight(color)
                                    : tc.setCustomPrimaryLight(color);
                              } else {
                                swapDark
                                    ? tc.setCustomSecondaryDark(color)
                                    : tc.setCustomPrimaryDark(color);
                              }
                            },
                            recentColors: tc.recentColors,
                            onRecentColorsChanged: tc.setRecentColors,
                            wasCancelled: (bool cancelled) {
                              if (cancelled) {
                                if (isLight) {
                                  swapLight
                                      ? tc.setCustomSecondaryLight(primary)
                                      : tc.setCustomPrimaryLight(primary);
                                } else {
                                  swapDark
                                      ? tc.setCustomSecondaryDark(primary)
                                      : tc.setCustomPrimaryDark(primary);
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onPrimary);

                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(primaryContainer);
                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: primaryContainer,
                          child: ColorPickerInkWellDialog(
                            color: primaryContainer,
                            onChanged: (Color color) {
                              if (isLight) {
                                swapLight
                                    ? tc.setCustomSecondaryContainerLight(color)
                                    : tc.setCustomPrimaryContainerLight(color);
                              } else {
                                swapDark
                                    ? tc.setCustomSecondaryContainerDark(color)
                                    : tc.setCustomPrimaryContainerDark(color);
                              }
                            },
                            recentColors: tc.recentColors,
                            onRecentColorsChanged: tc.setRecentColors,
                            wasCancelled: (bool cancelled) {
                              if (cancelled) {
                                if (isLight) {
                                  swapLight
                                      ? tc.setCustomSecondaryContainerLight(
                                          primaryContainer)
                                      : tc.setCustomPrimaryContainerLight(
                                          primaryContainer);
                                } else {
                                  swapDark
                                      ? tc.setCustomSecondaryContainerDark(
                                          primaryContainer)
                                      : tc.setCustomPrimaryContainerDark(
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onPrimaryContainer);

                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
          // primaryFixed colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('primaryFixed'),
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.primaryFixed);
                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.primaryFixed,
                          child: ColorNameValue(
                            key: ValueKey<String>(
                                'cnv primaryFixed ${colorScheme.primaryFixed}'),
                            color: colorScheme.primaryFixed,
                            textColor: colorScheme.onPrimaryFixed,
                            label: 'primaryFixed',
                            tone: tones.primaryFixedTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onPrimaryFixed);
                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.onPrimaryFixed,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onPrimaryFixed '
                                '${colorScheme.onPrimaryFixed}'),
                            color: colorScheme.onPrimaryFixed,
                            textColor: colorScheme.primaryFixed,
                            label: 'onPrimaryFixed',
                            tone: tones.onPrimaryFixedTone,
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
          // primaryFixedDim colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('primaryFixedDim'),
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.primaryFixedDim);
                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.primaryFixedDim,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv primaryFixed '
                                '${colorScheme.primaryFixedDim}'),
                            color: colorScheme.primaryFixedDim,
                            textColor: colorScheme.onPrimaryFixedVariant,
                            label: 'primaryFixedDim',
                            tone: tones.primaryFixedDimTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onPrimaryFixedVariant);
                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.onPrimaryFixedVariant,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onPrimaryFixedVariant '
                                '${colorScheme.onPrimaryFixedVariant}'),
                            color: colorScheme.onPrimaryFixedVariant,
                            textColor: colorScheme.primaryFixedDim,
                            label: 'onPrimaryFixed\nVariant',
                            tone: tones.onPrimaryFixedVariantTone,
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(secondary);

                          toneC.setPalette(TonalPalettes.secondary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: secondary,
                          child: ColorPickerInkWellDialog(
                            color: secondary,
                            onChanged: (Color color) {
                              if (isLight) {
                                swapLight
                                    ? tc.setCustomPrimaryLight(color)
                                    : tc.setCustomSecondaryLight(color);
                              } else {
                                swapDark
                                    ? tc.setCustomPrimaryDark(color)
                                    : tc.setCustomSecondaryDark(color);
                              }
                            },
                            recentColors: tc.recentColors,
                            onRecentColorsChanged: tc.setRecentColors,
                            wasCancelled: (bool cancelled) {
                              if (cancelled) {
                                if (isLight) {
                                  swapLight
                                      ? tc.setCustomPrimaryLight(secondary)
                                      : tc.setCustomSecondaryLight(secondary);
                                } else {
                                  swapDark
                                      ? tc.setCustomPrimaryDark(secondary)
                                      : tc.setCustomSecondaryDark(secondary);
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onSecondary);

                          toneC.setPalette(TonalPalettes.secondary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(secondaryContainer);

                          toneC.setPalette(TonalPalettes.secondary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: secondaryContainer,
                          child: ColorPickerInkWellDialog(
                            color: secondaryContainer,
                            onChanged: (Color color) {
                              if (isLight) {
                                swapLight
                                    ? tc.setCustomPrimaryContainerLight(color)
                                    : tc.setCustomSecondaryContainerLight(
                                        color);
                              } else {
                                swapDark
                                    ? tc.setCustomPrimaryContainerDark(color)
                                    : tc.setCustomSecondaryContainerDark(color);
                              }
                            },
                            recentColors: tc.recentColors,
                            onRecentColorsChanged: tc.setRecentColors,
                            wasCancelled: (bool cancelled) {
                              if (cancelled) {
                                if (isLight) {
                                  swapLight
                                      ? tc.setCustomPrimaryContainerLight(
                                          secondaryContainer)
                                      : tc.setCustomSecondaryContainerLight(
                                          secondaryContainer);
                                } else {
                                  swapDark
                                      ? tc.setCustomPrimaryContainerDark(
                                          secondaryContainer)
                                      : tc.setCustomSecondaryContainerDark(
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onSecondaryContainer);

                          toneC.setPalette(TonalPalettes.secondary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
          // secondaryFixed colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('secondaryFixed'),
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.secondaryFixed);
                          toneC.setPalette(TonalPalettes.secondary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.secondaryFixed,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv secondaryFixed '
                                '${colorScheme.secondaryFixed}'),
                            color: colorScheme.secondaryFixed,
                            textColor: colorScheme.onSecondaryFixed,
                            label: 'secondaryFixed',
                            tone: tones.secondaryFixedTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onSecondaryFixed);
                          toneC.setPalette(TonalPalettes.secondary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.onSecondaryFixed,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onSecondaryFixed '
                                '${colorScheme.onSecondaryFixed}'),
                            color: colorScheme.onSecondaryFixed,
                            textColor: colorScheme.secondaryFixed,
                            label: 'onSecondaryFixed',
                            tone: tones.onSecondaryFixedTone,
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
          // secondaryFixedDim colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('secondaryFixedDim'),
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.secondaryFixedDim);
                          toneC.setPalette(TonalPalettes.secondary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.secondaryFixedDim,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv secondaryFixed '
                                '${colorScheme.secondaryFixedDim}'),
                            color: colorScheme.secondaryFixedDim,
                            textColor: colorScheme.onSecondaryFixedVariant,
                            label: 'secondaryFixedDim',
                            tone: tones.secondaryFixedDimTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onSecondaryFixedVariant);
                          toneC.setPalette(TonalPalettes.secondary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.onSecondaryFixedVariant,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onSecondaryFixedVariant '
                                '${colorScheme.onSecondaryFixedVariant}'),
                            color: colorScheme.onSecondaryFixedVariant,
                            textColor: colorScheme.secondaryFixedDim,
                            label: 'onSecondaryFixed\nVariant',
                            tone: tones.onSecondaryFixedVariantTone,
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(tertiary);
                          toneC.setPalette(TonalPalettes.tertiary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: tertiary,
                          child: ColorPickerInkWellDialog(
                            color: tertiary,
                            onChanged: (Color color) {
                              if (isLight) {
                                tc.setCustomTertiaryLight(color);
                              } else {
                                tc.setCustomTertiaryDark(color);
                              }
                            },
                            recentColors: tc.recentColors,
                            onRecentColorsChanged: tc.setRecentColors,
                            wasCancelled: (bool cancelled) {
                              if (cancelled) {
                                if (isLight) {
                                  tc.setCustomTertiaryLight(tertiary);
                                } else {
                                  tc.setCustomTertiaryDark(tertiary);
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onTertiary);
                          toneC.setPalette(TonalPalettes.tertiary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(tertiaryContainer);
                          toneC.setPalette(TonalPalettes.tertiary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: tertiaryContainer,
                          child: ColorPickerInkWellDialog(
                            color: tertiaryContainer,
                            onChanged: (Color color) {
                              if (isLight) {
                                tc.setCustomTertiaryContainerLight(color);
                              } else {
                                tc.setCustomTertiaryContainerDark(color);
                              }
                            },
                            recentColors: tc.recentColors,
                            onRecentColorsChanged: tc.setRecentColors,
                            wasCancelled: (bool cancelled) {
                              if (cancelled) {
                                if (isLight) {
                                  tc.setCustomTertiaryContainerLight(
                                      tertiaryContainer);
                                } else {
                                  tc.setCustomTertiaryContainerDark(
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onTertiaryContainer);
                          toneC.setPalette(TonalPalettes.tertiary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
          // tertiaryFixed colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('tertiaryFixed'),
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.tertiaryFixed);
                          toneC.setPalette(TonalPalettes.tertiary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.tertiaryFixed,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv tertiaryFixed '
                                '${colorScheme.tertiaryFixed}'),
                            color: colorScheme.tertiaryFixed,
                            textColor: colorScheme.onTertiaryFixed,
                            label: 'tertiaryFixed',
                            tone: tones.tertiaryFixedTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onTertiaryFixed);
                          toneC.setPalette(TonalPalettes.tertiary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.onTertiaryFixed,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onTertiaryFixed '
                                '${colorScheme.onTertiaryFixed}'),
                            color: colorScheme.onTertiaryFixed,
                            textColor: colorScheme.tertiaryFixed,
                            label: 'onTertiaryFixed',
                            tone: tones.onTertiaryFixedTone,
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
          // tertiaryFixedDim colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('tertiaryFixedDim'),
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.tertiaryFixedDim);
                          toneC.setPalette(TonalPalettes.tertiary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.tertiaryFixedDim,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv tertiaryFixed '
                                '${colorScheme.tertiaryFixedDim}'),
                            color: colorScheme.tertiaryFixedDim,
                            textColor: colorScheme.onTertiaryFixedVariant,
                            label: 'tertiaryFixedDim',
                            tone: tones.tertiaryFixedDimTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onTertiaryFixedVariant);
                          toneC.setPalette(TonalPalettes.tertiary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.onTertiaryFixedVariant,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onTertiaryFixedVariant '
                                '${colorScheme.onTertiaryFixedVariant}'),
                            color: colorScheme.onTertiaryFixedVariant,
                            textColor: colorScheme.tertiaryFixedDim,
                            label: 'onTertiaryFixed\nVariant',
                            tone: tones.onTertiaryFixedVariantTone,
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.error);
                          toneC.setPalette(TonalPalettes.error);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: error,
                          child: ColorPickerInkWellDialog(
                            color: error,
                            onChanged: (Color color) {
                              if (isLight) {
                                tc.setCustomErrorLight(color);
                              } else {
                                tc.setCustomErrorDark(color);
                              }
                            },
                            recentColors: tc.recentColors,
                            onRecentColorsChanged: tc.setRecentColors,
                            wasCancelled: (bool cancelled) {
                              if (cancelled) {
                                if (isLight) {
                                  tc.setCustomErrorLight(error);
                                } else {
                                  tc.setCustomErrorDark(error);
                                }
                              }
                            },
                            enabled: isCustomTheme,
                            child: ColorNameValue(
                              key: ValueKey<String>('cnv error $error'),
                              color: colorScheme.error,
                              textColor: colorScheme.onError,
                              label: 'error',
                              showInputColor: showInputColor,
                              inputColor: inputErrorColor,
                              inputTextColor: inputOnErrorColor,
                              tone: tones.errorTone,
                              showTone: _locked(
                                  isLight, !tc.keepError, !tc.keepDarkError),
                              isLocked: _locked(
                                  isLight, tc.keepError, tc.keepDarkError),
                              onLocked: tc.useKeyColors && tc.useFlexColorScheme
                                  ? isLight
                                      ? tc.setKeepError
                                      : tc.setKeepDarkError
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onError);
                          toneC.setPalette(TonalPalettes.error);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.errorContainer);
                          toneC.setPalette(TonalPalettes.error);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: errorContainer,
                          child: ColorPickerInkWellDialog(
                            color: errorContainer,
                            onChanged: (Color color) {
                              if (isLight) {
                                tc.setCustomErrorContainerLight(color);
                              } else {
                                tc.setCustomErrorContainerDark(color);
                              }
                            },
                            recentColors: tc.recentColors,
                            onRecentColorsChanged: tc.setRecentColors,
                            wasCancelled: (bool cancelled) {
                              if (cancelled) {
                                if (isLight) {
                                  tc.setCustomErrorContainerLight(
                                      errorContainer);
                                } else {
                                  tc.setCustomErrorContainerDark(
                                      errorContainer);
                                }
                              }
                            },
                            enabled: isCustomTheme,
                            child: ColorNameValue(
                              key: ValueKey<String>('cnv errorContainer '
                                  '${colorScheme.errorContainer}'),
                              color: colorScheme.errorContainer,
                              textColor: colorScheme.onErrorContainer,
                              label: 'error\u200BContainer',
                              showInputColor: showInputColor,
                              inputColor: inputErrorContainerColor,
                              inputTextColor: inputOnErrorContainerColor,
                              tone: tones.errorContainerTone,
                              showTone: _locked(isLight, !tc.keepErrorContainer,
                                  !tc.keepDarkErrorContainer),
                              isLocked: _locked(isLight, tc.keepErrorContainer,
                                  tc.keepDarkErrorContainer),
                              onLocked: tc.useKeyColors && tc.useFlexColorScheme
                                  ? isLight
                                      ? tc.setKeepErrorContainer
                                      : tc.setKeepDarkErrorContainer
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onErrorContainer);
                          toneC.setPalette(TonalPalettes.error);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                      // flex: 3,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.surface);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                      // flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onSurface);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
          // surfaceDim and Bright colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('surfaceDim'),
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
                      // flex: 3,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.surfaceDim);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.surfaceDim,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv surfaceDim '
                                '${colorScheme.surfaceDim}'),
                            color: colorScheme.surfaceDim,
                            textColor: colorScheme.onSurface,
                            label: 'surface\u200BDim',
                            tone: tones.surfaceDimTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.surfaceBright);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.surfaceBright,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv surfaceBright '
                                '${colorScheme.surfaceBright}'),
                            color: colorScheme.surfaceBright,
                            textColor: colorScheme.onSurface,
                            label: 'surface\u200BBright',
                            tone: tones.surfaceBrightTone,
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
          // surfaceContainerLowest and Low colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('surfaceContainerLowest'),
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
                      // flex: 3,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.surfaceContainerLowest);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.surfaceContainerLowest,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv surfaceContainerLowest '
                                '${colorScheme.surfaceContainerLowest}'),
                            color: colorScheme.surfaceContainerLowest,
                            textColor: colorScheme.onSurface,
                            label: 'surface\u200BContainer\u200BLowest',
                            tone: tones.surfaceContainerLowestTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.surfaceContainerLow);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.surfaceContainerLow,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv surfaceContainerLow '
                                '${colorScheme.surfaceContainerLow}'),
                            color: colorScheme.surfaceContainerLow,
                            textColor: colorScheme.onSurface,
                            label: 'surface\u200BContainer\u200BLow',
                            tone: tones.surfaceContainerLowTone,
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
          // SurfaceContainer colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('surfaceContainer'),
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
                      // flex: 3,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.surfaceContainer);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.surfaceContainer,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv surfaceContainer '
                                '${colorScheme.surfaceContainer}'),
                            color: colorScheme.surfaceContainer,
                            textColor: colorScheme.onSurface,
                            label: 'surface\u200BContainer',
                            tone: tones.surfaceContainerTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onSurfaceVariant);
                          toneC.setPalette(TonalPalettes.neutralVariant);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.onSurfaceVariant,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv onSurfaceVariant '
                                '${colorScheme.onSurfaceVariant}'),
                            color: colorScheme.onSurfaceVariant,
                            textColor: colorScheme.surfaceContainerHighest,
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
          // surfaceContainerHigh and Highest colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('surfaceContainerHigh'),
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
                      // flex: 3,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.surfaceContainerHigh);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.surfaceContainerHigh,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv surfaceContainerLowest '
                                '${colorScheme.surfaceContainerHigh}'),
                            color: colorScheme.surfaceContainerHigh,
                            textColor: colorScheme.onSurface,
                            label: 'surface\u200BContainer\u200BHigh',
                            tone: tones.surfaceContainerHighTone,
                            showTone: showTones,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.surfaceContainerHighest);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
                        child: Material(
                          color: colorScheme.surfaceContainerHighest,
                          child: ColorNameValue(
                            key: ValueKey<String>('cnv surfaceContainerHighest '
                                '${colorScheme.surfaceContainerHighest}'),
                            color: colorScheme.surfaceContainerHighest,
                            textColor: colorScheme.onSurface,
                            label: 'surface\u200BContainer\u200BHighest',
                            tone: tones.surfaceContainerHighestTone,
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
                      // flex: 3,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.inverseSurface);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                      // flex: 2,
                      child: MouseRegion(
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.onInverseSurface);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.outline);
                          toneC.setPalette(TonalPalettes.neutralVariant);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.outlineVariant);
                          toneC.setPalette(TonalPalettes.neutralVariant);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.shadow);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.scrim);
                          toneC.setPalette(TonalPalettes.neutral);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.inversePrimary);
                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
                        onEnter: (PointerEvent details) {
                          toneC.setHover(colorScheme.surfaceTint);
                          toneC.setPalette(TonalPalettes.primary);
                        },
                        onExit: (PointerEvent details) {
                          toneC.setHover(null);
                          toneC.setPalette(null);
                        },
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
