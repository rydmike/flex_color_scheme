import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/flex_tones_enum.dart';
import '../../shared/color_name_value.dart';

// Display the all scheme surface colors in currently selected color scheme,
// including their name and color code.
class SurfaceColors extends StatelessWidget {
  const SurfaceColors({
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light;

  // On color used when a theme color property does not have a theme onColor.
  static Color _onColor(final Color color, final Color bg) =>
      _isLight(Color.alphaBlend(color, bg)) ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    // Used to enable & disable color selection on the color boxes.
    // We can only pick colors when custom theme is selected, which is
    // last index in out list of color schemes.

    // Size of the color presentation boxes
    const double boxWidth = 150;
    const double boxHeight = 180;

    // Theme values...
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;

    // Grab active tones and chroma setup.
    final FlexTones tones = FlexTonesEnum.values[controller.usedFlexToneSetup]
        .tones(theme.brightness)
        .onMainsUseBW(isLight
            ? controller.onMainsUseBWLight
            : controller.onMainsUseBWDark)
        .onSurfacesUseBW(isLight
            ? controller.onSurfacesUseBWLight
            : controller.onSurfacesUseBWDark);
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
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 6,
        runSpacing: 6,
        children: <Widget>[
          //
          // ScaffoldBackground colors presentation
          RepaintBoundary(
            key: const ValueKey<String>('surf scaffold'),
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
                      flex: 7,
                      child: Material(
                        color: theme.scaffoldBackgroundColor,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur scaffoldBackgroundColor '
                              '${theme.scaffoldBackgroundColor}'),
                          color: theme.scaffoldBackgroundColor,
                          textColor: colorScheme.onBackground,
                          label: 'Scaffold\nbackground',
                          tone: tones.backgroundTone,
                          showTone: false,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.onBackground,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onBackground '
                              '${colorScheme.onBackground}'),
                          color: colorScheme.onBackground,
                          textColor: colorScheme.background,
                          label: 'onBackground',
                          tone: tones.onBackgroundTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // Background colors presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf background'),
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
                      flex: 7,
                      child: Material(
                        color: colorScheme.background,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur background '
                              '${colorScheme.background}'),
                          color: colorScheme.background,
                          textColor: colorScheme.onBackground,
                          label: 'background',
                          tone: tones.backgroundTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.onBackground,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onBackground '
                              '${colorScheme.onBackground}'),
                          color: colorScheme.onBackground,
                          textColor: colorScheme.background,
                          label: 'onBackground',
                          tone: tones.onBackgroundTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // Surface colors presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf surface'),
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
                      flex: 7,
                      child: Material(
                        color: colorScheme.surface,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur surface '
                              '${colorScheme.surface}'),
                          color: colorScheme.surface,
                          textColor: colorScheme.onSurface,
                          label: 'surface',
                          tone: tones.surfaceTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.onSurface,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onSurface '
                              '${colorScheme.onSurface}'),
                          color: colorScheme.onSurface,
                          textColor: colorScheme.surface,
                          label: 'onSurface',
                          tone: tones.onSurfaceTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // SurfaceVariant colors presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf surfaceVariant'),
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
                      flex: 7,
                      child: Material(
                        color: colorScheme.surfaceVariant,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur surfaceVariant '
                              '${colorScheme.surfaceVariant}'),
                          color: colorScheme.surfaceVariant,
                          textColor: colorScheme.onSurfaceVariant,
                          label: 'surface\u200BVariant',
                          tone: tones.surfaceVariantTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.onSurfaceVariant,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onSurfaceVariant '
                              '${colorScheme.onSurfaceVariant}'),
                          color: colorScheme.onSurfaceVariant,
                          textColor: colorScheme.surfaceVariant,
                          label: 'onSurface\u200BVariant',
                          tone: tones.onSurfaceVariantTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // InverseSurface colors presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf inversesurface'),
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
                      flex: 7,
                      child: Material(
                        color: colorScheme.inverseSurface,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur inverseSurface '
                              '${colorScheme.inverseSurface}'),
                          color: colorScheme.inverseSurface,
                          textColor: colorScheme.onInverseSurface,
                          label: 'inverse\u200BSurface',
                          tone: tones.inverseSurfaceTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.onInverseSurface,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onInverseSurface '
                              '${colorScheme.onInverseSurface}'),
                          color: colorScheme.onInverseSurface,
                          textColor: colorScheme.inverseSurface,
                          label: 'onInverse\u200BSurface',
                          tone: tones.onInverseSurfaceTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // Shadow color and surface tint color presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf shadow'),
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
                      flex: 7,
                      child: Material(
                        color: colorScheme.shadow,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur shadow '
                              '${colorScheme.shadow}'),
                          color: colorScheme.shadow,
                          textColor:
                              _onColor(colorScheme.shadow, colorScheme.surface),
                          label: 'shadow',
                          tone: tones.shadowTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.surfaceTint,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur surfaceTint '
                              '${colorScheme.surfaceTint}'),
                          color: colorScheme.surfaceTint,
                          textColor: _onColor(
                              colorScheme.surfaceTint, colorScheme.surface),
                          label: 'surfaceTint',
                          tone: tones.surfaceTintTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // onPrimaryContainer and onPrimary color presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf onPrimaryContainer'),
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
                      flex: 7,
                      child: Material(
                        color: colorScheme.onPrimaryContainer,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onPrimaryContainer '
                              '${colorScheme.onPrimaryContainer}'),
                          color: colorScheme.onPrimaryContainer,
                          textColor: colorScheme.primaryContainer,
                          label: 'onPrimaryContainer',
                          tone: tones.onPrimaryContainerTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.onPrimary,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onPrimary '
                              '${colorScheme.onPrimary}'),
                          color: colorScheme.onPrimary,
                          textColor: colorScheme.primary,
                          label: 'onPrimary',
                          tone: tones.onPrimaryTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // onSecondaryContainer and onSecondary color presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf onSecondaryContainer'),
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
                      flex: 7,
                      child: Material(
                        color: colorScheme.onSecondaryContainer,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onSecondaryContainer '
                              '${colorScheme.onSecondaryContainer}'),
                          color: colorScheme.onSecondaryContainer,
                          textColor: colorScheme.secondaryContainer,
                          label: 'onSecondary\nContainer',
                          tone: tones.onSecondaryContainerTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.onSecondary,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onSecondary '
                              '${colorScheme.onSecondary}'),
                          color: colorScheme.onSecondary,
                          textColor: colorScheme.secondary,
                          label: 'onSecondary',
                          tone: tones.onSecondaryTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // onTertiaryContainer and onTertiary color presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf onTertiaryContainer'),
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
                      flex: 7,
                      child: Material(
                        color: colorScheme.onTertiaryContainer,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onTertiaryContainer '
                              '${colorScheme.onTertiaryContainer}'),
                          color: colorScheme.onTertiaryContainer,
                          textColor: colorScheme.tertiaryContainer,
                          label: 'onTertiaryContainer',
                          tone: tones.onTertiaryContainerTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.onTertiary,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onTertiary '
                              '${colorScheme.onTertiary}'),
                          color: colorScheme.onTertiary,
                          textColor: colorScheme.tertiary,
                          label: 'onTertiary',
                          tone: tones.onTertiaryTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // onErrorContainer and onError color presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf onErrorContainer'),
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
                      flex: 7,
                      child: Material(
                        color: colorScheme.onErrorContainer,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onErrorContainer '
                              '${colorScheme.onErrorContainer}'),
                          color: colorScheme.onErrorContainer,
                          textColor: colorScheme.errorContainer,
                          label: 'onErrorContainer',
                          tone: tones.onErrorContainerTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Material(
                        color: colorScheme.onError,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onError '
                              '${colorScheme.onError}'),
                          color: colorScheme.onError,
                          textColor: colorScheme.error,
                          label: 'onError',
                          tone: tones.onErrorTone,
                          showTone: showTones,
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
