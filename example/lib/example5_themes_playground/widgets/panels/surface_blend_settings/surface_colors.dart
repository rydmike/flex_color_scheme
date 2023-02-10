import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/flex_tone.dart';
import '../../../../shared/controllers/theme_controller.dart';
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
    const double boxWidth = 152;
    const double boxHeight = 180;

    // Theme values...
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;

    // Grab active tones and chroma setup.
    final FlexTones tones = FlexTone.values[controller.usedFlexToneSetup]
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
                    flex: 7,
                    child: Material(
                      color: theme.scaffoldBackgroundColor,
                      child: ColorNameValue(
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
          //
          // Background colors presentation
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
                    flex: 7,
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
                  Expanded(
                    flex: 6,
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
                    flex: 7,
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
                  Expanded(
                    flex: 6,
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
                ],
              ),
            ),
          ),
          //
          // SurfaceVariant colors presentation
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
                    flex: 7,
                    child: Material(
                      color: colorScheme.surfaceVariant,
                      child: ColorNameValue(
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
          //
          // InverseSurface colors presentation
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
                    flex: 7,
                    child: Material(
                      color: colorScheme.inverseSurface,
                      child: ColorNameValue(
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
          //
          // Shadow color and surface tint color presenatation
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
                    flex: 7,
                    child: Material(
                      color: colorScheme.shadow,
                      child: ColorNameValue(
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
        ],
      ),
    );
  }
}
