import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../shared/color_name_value.dart';

// Display all scheme main and surface onColors in currently selected
// color scheme, including their name and color code.
class OnColors extends StatelessWidget {
  const OnColors({
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    // Used to enable & disable color selection on the color boxes.
    // We can only pick colors when custom theme is selected, which is
    // last index in out list of color schemes.

    // Size of the color presentation boxes
    const double boxWidth = 150;
    const double boxHeight = 170;

    // Theme values...
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;

    // TODO(rydmike): Review tones everywhere! And colors! Need a helper?
    // See show_tonal_palette.dart for correct tones!

    // Grab active tones and chroma setup.
    final FlexTones tones = FlexSchemeVariant
        .values[controller.usedFlexToneSetup]
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
          // Surface colors presentation.
          RepaintBoundary(
            key: const ValueKey<String>('surf onSurface'),
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
                    const Divider(height: 1),
                    Expanded(
                      child: Material(
                        color: colorScheme.onSurfaceVariant,
                        child: ColorNameValue(
                          key: ValueKey<String>('sur onSurfaceVariant '
                              '${colorScheme.onSurfaceVariant}'),
                          color: colorScheme.onSurfaceVariant,
                          textColor: colorScheme.surfaceContainerHighest,
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
        ],
      ),
    );
  }
}
