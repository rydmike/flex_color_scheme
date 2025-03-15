import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../utils/effective_flex_tones.dart';
import '../../shared/color_name_value.dart';

// Display all the surface colors in currently selected color scheme,
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
  static Color _onColor(final Color color) =>
      _isLight(color) ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    // Size of the color presentation boxes
    const double boxWidth = 135;
    const double boxHeight = 160;

    // Theme values...
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool useMaterial3 = theme.useMaterial3;

    // Get effective tones and chroma setup, for FSS and MCU based schemes.
    final FlexTones tones = effectiveFlexTones(controller, context);

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
                      child: Material(
                        color: colorScheme.surfaceContainer,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur surfaceContainer '
                              '${colorScheme.surfaceContainer}'),
                          color: colorScheme.surfaceContainer,
                          textColor: colorScheme.onSurface,
                          label: 'surfaceContainer',
                          tone: tones.surfaceContainerTone,
                          showTone: showTones,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                    Expanded(
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
                    Expanded(
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
                    Expanded(
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
                  ],
                ),
              ),
            ),
          ),
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
                      child: Material(
                        color: theme.scaffoldBackgroundColor,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur scaffoldBackgroundColor '
                              '${theme.scaffoldBackgroundColor}'),
                          color: theme.scaffoldBackgroundColor,
                          textColor: _onColor(theme.scaffoldBackgroundColor),
                          label: 'Scaffold\nbackground',
                          tone: tones.surfaceTone,
                          showTone: false,
                        ),
                      ),
                    ),
                    Expanded(
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
                  ],
                ),
              ),
            ),
          ),
          //
          // Surface tint color presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf tint'),
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
                      child: Material(
                        color: colorScheme.surfaceTint,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur surfaceTint '
                              '${colorScheme.surfaceTint}'),
                          color: colorScheme.surfaceTint,
                          textColor: _onColor(colorScheme.surfaceTint),
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
        ],
      ),
    );
  }
}
