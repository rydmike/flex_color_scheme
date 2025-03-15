import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';
import 'color_picker_inkwell.dart';
import 'color_scheme_box.dart';

const String _revealText = 'The surface blend and tint color is used as '
    'seed key color for neutral and neutralVariant seed generated palettes.\n '
    '\n'
    'Surface Color Blends use it as the color to blend into surfaces at '
    'selected blend level and mode.\n'
    '\n'
    'It is also used as surfaceTint color in the '
    'ColorScheme, and thus used by legacy Material-3 '
    'elevation tinted surfaces. Note that elevation '
    'based surface tint is planned to be removed from Flutter and it is no '
    'longer really used after Flutter 3.22 in the framework, '
    'except for the AppBar scroll under tint effect, that still '
    'uses it in Flutter 3.22 and 3.24, but it will likely be removed from '
    'there too at some later point.\n'
    '\n'
    'The default used color is ColorScheme '
    'primary. There is rarely any need to change it. Primary '
    'color tinted surfaces is usually what you want, if you '
    'want tinted surfaces. To reduce the tint, use low or '
    'no surface blend level. For seed generated ColorSchemes, '
    'choose a seed scheme variant with less tint in '
    'neutrals. To remove tint from surface colors you '
    'can use seed scheme modifiers when using FSS based scheme variants.\n';

class SurfacesSeedBlendColorLight extends StatelessWidget {
  const SurfacesSeedBlendColorLight(
    this.controller, {
    super.key,
    this.enabled = true,
    this.dense,
  });

  final ThemeController controller;

  /// Whether this Popup is enabled.
  ///
  /// Set to false to disable the popup, it will be displayed as disabled
  /// along with the title and value trailing labels.
  final bool enabled;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null then its value is based on [ListTileTheme.dense].
  ///
  /// Dense list tiles default to a smaller height.
  final bool? dense;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;

    // Default color is in use, make a light label to use in custom color.
    final String defaultTintLightLabel =
        controller.surfaceTintLight == null ? 'Default primary ' : '';
    // Current light tint color
    final Color? previousTintLight = controller.surfaceTintLight;
    final Color effectiveTintLight =
        controller.surfaceTintLight ?? colorScheme.surfaceTint;
    // Names for the light tint colors.
    final String materialNameLight =
        ColorTools.materialName(effectiveTintLight);
    final String nameThatColorLight =
        ColorTools.nameThatColor(effectiveTintLight);
    final String spaceLight = materialNameLight == '' ? '' : ' ';

    return ColorPickerInkWellDialog(
      color: controller.surfaceTintLight ?? colorScheme.primary,
      onChanged: controller.setSurfaceTintLight,
      recentColors: controller.recentColors,
      onRecentColorsChanged: controller.setRecentColors,
      wasCancelled: (bool cancelled) {
        if (cancelled) {
          controller.setSurfaceTintLight(previousTintLight);
        }
      },
      enabled: enabled,
      child: ListTileReveal(
        dense: dense,
        enabled: enabled,
        title:
            const Text('Neutrals seed, surfaces blend and SurfaceTint color'),
        subtitle: Text('$defaultTintLightLabel'
            '#${effectiveTintLight.hexCode} '
            '$nameThatColorLight $materialNameLight$spaceLight'),
        subtitleReveal: const Text(_revealText),
        leading: Tooltip(
          message: controller.surfaceTintLight != null
              ? 'Reset to default,\nprimary color'
              : '',
          child: IconButton.filled(
            isSelected: controller.surfaceTintLight != null,
            icon: Icon(Icons.refresh,
                color: controller.surfaceTintLight != null
                    ? useMaterial3
                        ? colorScheme.onPrimary
                        : colorScheme.primary
                    : null),
            onPressed: controller.surfaceTintLight != null
                ? () {
                    controller.setSurfaceTintLight(null);
                  }
                : null,
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: ColorSchemeBox(
            borderColor: Colors.transparent,
            backgroundColor: controller.surfaceTintLight ?? colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class SurfacesSeedBlendColorDark extends StatelessWidget {
  const SurfacesSeedBlendColorDark(
    this.controller, {
    super.key,
    this.enabled = true,
    this.dense,
  });

  final ThemeController controller;

  /// Whether this Popup is enabled.
  ///
  /// Set to false to disable the popup, it will be displayed as disabled
  /// along with the title and value trailing labels.
  final bool enabled;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null then its value is based on [ListTileTheme.dense].
  ///
  /// Dense list tiles default to a smaller height.
  final bool? dense;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;

    // Default color is in use, make a dark label to use in custom color.
    final String defaultTintDarkLabel =
        controller.surfaceTintDark == null ? 'Default primary ' : '';
    // Current dark tint color.
    final Color? previousTintDark = controller.surfaceTintDark;
    final Color effectiveTintDark =
        controller.surfaceTintDark ?? colorScheme.surfaceTint;
    // Names for the dark tint colors.
    final String materialNameDark = ColorTools.materialName(effectiveTintDark);
    final String nameThatColorDark =
        ColorTools.nameThatColor(effectiveTintDark);
    final String spaceDark = materialNameDark == '' ? '' : ' ';

    return ColorPickerInkWellDialog(
      color: controller.surfaceTintDark ?? colorScheme.primary,
      onChanged: controller.setSurfaceTintDark,
      recentColors: controller.recentColors,
      onRecentColorsChanged: controller.setRecentColors,
      wasCancelled: (bool cancelled) {
        if (cancelled) {
          controller.setSurfaceTintDark(previousTintDark);
        }
      },
      enabled: enabled,
      child: ListTileReveal(
        enabled: enabled,
        dense: dense,
        title:
            const Text('Neutrals seed, surfaces blend and SurfaceTint color'),
        subtitle: Text('$defaultTintDarkLabel'
            '#${effectiveTintDark.hexCode} '
            '$nameThatColorDark $materialNameDark$spaceDark'),
        subtitleReveal: const Text(_revealText),
        leading: Tooltip(
          message: controller.surfaceTintDark != null
              ? 'Reset to default,\nprimary color'
              : '',
          child: IconButton.filled(
            isSelected: controller.surfaceTintDark != null,
            icon: Icon(Icons.refresh,
                color: controller.surfaceTintDark != null
                    ? useMaterial3
                        ? colorScheme.onPrimary
                        : colorScheme.primary
                    : null),
            onPressed: controller.surfaceTintDark != null
                ? () {
                    controller.setSurfaceTintDark(null);
                  }
                : null,
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: ColorSchemeBox(
            borderColor: Colors.transparent,
            backgroundColor: controller.surfaceTintDark ?? colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
