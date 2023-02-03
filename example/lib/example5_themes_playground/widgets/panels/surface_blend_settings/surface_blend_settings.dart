import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../shared/color_picker_inkwell.dart';
import '../../shared/color_scheme_box.dart';
import 'dark_surface_mode_list_tile.dart';
import 'dark_surface_mode_popup_menu.dart';
import 'light_surface_mode_list_tile.dart';
import 'light_surface_mode_popup_menu.dart';

// Panel used to define how primary color is blended into surfaces and
// onColors.
class SurfaceBlendSettings extends StatelessWidget {
  const SurfaceBlendSettings(
    this.controller, {
    super.key,
    required this.allBlends,
  });
  final ThemeController controller;
  final bool allBlends;

  String explainMode(final FlexSurfaceMode mode) {
    switch (mode) {
      case FlexSurfaceMode.level:
        return 'Level blends\n'
            'Surface 1x  Background 1x  Scaffold 1x\n';
      case FlexSurfaceMode.highBackgroundLowScaffold:
        return 'High background, low scaffold\n'
            'Surface 1x  Background 3/2x  Scaffold 1/2x\n';
      case FlexSurfaceMode.highSurfaceLowScaffold:
        return 'High surface, low scaffold\n'
            'Surface 3/2x  Background 1x  Scaffold 1/2x\n';
      case FlexSurfaceMode.highScaffoldLowSurface:
        return 'Very high scaffold, low surface\n'
            'Surface 1/2x  Background 1x  Scaffold 3x\n';
      case FlexSurfaceMode.highScaffoldLevelSurface:
        return 'Very high scaffold, high background, level surface\n'
            'Surface 1x  Background 2x  Scaffold 3x\n';
      case FlexSurfaceMode.levelSurfacesLowScaffold:
        return 'Level surface and background, low scaffold\n'
            'Surface 1x  Background 1x  Scaffold 1/2x\n';
      case FlexSurfaceMode.highScaffoldLowSurfaces:
        return 'Very high scaffold, low surface and background\n'
            'Surface 1/2x  Background 1/2x  Scaffold 3x\n';
      case FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog:
        return 'Tertiary container dialog, low scaffold\n'
            'Surface 1x  Background 1x  Scaffold 1/2x\n'
            'Dialog 1x blend of tertiary container color';
      case FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog:
        return 'Tertiary container dialog, very high scaffold\n'
            'Surface 1/2x  Background 1/2x  Scaffold 3x\n'
            'Dialog 1/2x blend of tertiary container color';
      case FlexSurfaceMode.custom:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final ColorScheme colorScheme = theme.colorScheme;

    // Default color is in use, make a light label to use in custom color.
    final String defaultTintLightLabel =
        controller.surfaceTintLight == null ? ' primary (default):' : ':';
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
    // Default color is in use, make a dark label to use in custom color.
    final String defaultTintDarkLabel =
        controller.surfaceTintDark == null ? ' primary (default)' : '';
    // Current dark tint color.
    final Color? previousTintDark = controller.surfaceTintDark;
    final Color effectiveTintDark =
        controller.surfaceTintDark ?? colorScheme.surfaceTint;
    // Names for the dark tint colors.
    final String materialNameDark = ColorTools.materialName(effectiveTintDark);
    final String nameThatColorDark =
        ColorTools.nameThatColor(effectiveTintDark);
    final String spaceDark = materialNameDark == '' ? '' : ' ';
    //
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Blended surfaces and backgrounds'),
          isThreeLine: true,
          subtitle: Text(
            'Material Design 2 guide mentions using surfaces with '
            'primary color alpha blends. FlexColorScheme surface blends '
            'does it for you.\n'
            '\n'
            'Material Design 3 has a new color system where a hint of primary '
            'color is also used on surfaces. It is done via its neutral tonal '
            'palettes that are shifted slightly towards the primary color. '
            'If you use M3 seeded ColorSchemes, set blend level to zero '
            'to get the pure M3 design. With surface blends, you can further '
            'strengthen the effect and vary blend levels by surface type.\n'
            '\n'
            'When using a surface blend mode with a high factor on Scaffold '
            'background, the design intent is to not place any controls and '
            'text on it directly, but to always use them on other surfaces '
            'with less surface tint, for example in Cards. The Scaffold '
            'background is then only used as a background color effect. If '
            'your app places controls directly on Scaffold with its default '
            'background color, these blend modes may not be a good fit. Choose '
            'one with lower color blends on Scaffold background.',
          ),
        ),
        if (isLight) ...<Widget>[
          LightSurfaceModePopupMenu(controller: controller),
          LightSurfaceModeListTile(controller: controller),
          ListTile(
            enabled: controller.surfaceTintLight != null,
            title: const Text('Set light blend and tint color back to default'),
            subtitle: const Text('Sets custom blend and tint color back '
                'to primary color'),
            trailing: FilledButton(
              onPressed: controller.surfaceTintLight != null
                  ? () {
                      controller.setSurfaceTintLight(null);
                    }
                  : null,
              child: const Text('Default'),
            ),
            onTap: () {
              controller.setSurfaceTintLight(null);
            },
          ),
          ColorPickerInkWellDialog(
            color: controller.surfaceTintLight ?? colorScheme.primary,
            onChanged: controller.setSurfaceTintLight,
            recentColors: controller.recentColors,
            onRecentColorsChanged: controller.setRecentColors,
            wasCancelled: (bool cancelled) {
              if (cancelled) {
                controller.setSurfaceTintLight(previousTintLight);
              }
            },
            enabled: true,
            child: ListTile(
              title: const Text('Light theme blend and surface tint color'),
              subtitle: Text('Color$defaultTintLightLabel '
                  '$nameThatColorLight $materialNameLight$spaceLight'
                  '#${effectiveTintLight.hexCode}'),
              trailing: ColorSchemeBox(
                borderColor: Colors.transparent,
                backgroundColor:
                    controller.surfaceTintLight ?? colorScheme.primary,
              ),
            ),
          ),
          const ListTile(
            title: Text('Light theme blend level'),
            subtitle: Text('Adjust the surface, background, scaffold and '
                'dialog blend level. Also impacts surfaces when '
                'seed colors are used. Seed based surfaces always include '
                'a touch of primary, but you can make it stronger with '
                'surface blends'),
          ),
          ListTile(
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendLevel.toString(),
              value: controller.blendLevel.toDouble(),
              onChanged: (double value) {
                controller.setBlendLevel(value.toInt());
              },
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'LEVEL',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    '${controller.blendLevel}',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            enabled: controller.useSubThemes &&
                controller.useFlexColorScheme &&
                !controller.useKeyColors,
            title: const Text('Light theme onColors blend level'),
            subtitle: const Text('The onColor blending mixes in its own color, '
                'into the onColor, when seed/M3 colors are not used. This '
                'affects onContainers, onSurface and onBackground. When the '
                'main onColor blending switch is ON, it also affects on colors '
                'for primary, secondary, tertiary and error.'),
          ),
          ListTile(
            enabled: controller.useSubThemes &&
                controller.useFlexColorScheme &&
                !controller.useKeyColors,
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendOnLevel.toString(),
              value: controller.useSubThemes &&
                      controller.useFlexColorScheme &&
                      !controller.useKeyColors
                  ? controller.blendOnLevel.toDouble()
                  : 0,
              onChanged: controller.useSubThemes &&
                      controller.useFlexColorScheme &&
                      !controller.useKeyColors
                  ? (double value) {
                      controller.setBlendOnLevel(value.toInt());
                    }
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'LEVEL',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    '${controller.useSubThemes && controller.useFlexColorScheme && !controller.useKeyColors ? controller.blendOnLevel : ""}',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SwitchListTile(
            title: const Text('Light theme main colors use onColor blending'),
            subtitle:
                const Text('In M3 design, only container colors use color '
                    'pair tinted onColor. Main colors use black or white. '
                    'Keep this OFF to do so. Set to ON to use it with '
                    'onPrimary, onSecondary, onTertiary and onError, when seed '
                    'colors are not used'),
            value: controller.blendLightOnColors &&
                controller.useSubThemes &&
                controller.useFlexColorScheme &&
                !controller.useKeyColors,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors
                ? controller.setBlendLightOnColors
                : null,
          ),
          SwitchListTile(
            title: const Text('Plain white'),
            subtitle: const Text(
              'White Scaffold in all blend modes, '
              'other surfaces become 5% lighter',
            ),
            value: controller.lightIsWhite,
            onChanged: controller.setLightIsWhite,
          ),
        ]
        //
        // ELSE Dark mode widgets
        //
        else ...<Widget>[
          DarkSurfaceModePopupMenu(controller: controller),
          DarkSurfaceModeListTile(controller: controller),
          ListTile(
            enabled: controller.surfaceTintDark != null,
            title: const Text('Set dark blend and tint color back to default'),
            subtitle: const Text('Sets custom blend and tint color back '
                'to primary color'),
            trailing: FilledButton(
              onPressed: controller.surfaceTintDark != null
                  ? () {
                      controller.setSurfaceTintDark(null);
                    }
                  : null,
              child: const Text('Default'),
            ),
            onTap: () {
              controller.setSurfaceTintDark(null);
            },
          ),
          ColorPickerInkWellDialog(
            color: controller.surfaceTintDark ?? colorScheme.primary,
            onChanged: controller.setSurfaceTintDark,
            recentColors: controller.recentColors,
            onRecentColorsChanged: controller.setRecentColors,
            wasCancelled: (bool cancelled) {
              if (cancelled) {
                controller.setSurfaceTintDark(previousTintDark);
              }
            },
            enabled: true,
            child: ListTile(
              title: const Text('Dark theme blend and surface tint color'),
              subtitle: Text('Color$defaultTintDarkLabel '
                  '$nameThatColorDark $materialNameDark$spaceDark'
                  '#${effectiveTintDark.hexCode}'),
              trailing: ColorSchemeBox(
                borderColor: Colors.transparent,
                backgroundColor:
                    controller.surfaceTintDark ?? colorScheme.primary,
              ),
            ),
          ),
          const ListTile(
            title: Text('Dark theme blend level'),
            subtitle: Text('Adjust the surface, background, scaffold and '
                'dialog blend level. Also impacts surfaces when '
                'seed colors are used. Seed based surfaces already include '
                'a touch of primary, but you can make it stronger with '
                'surface blends'),
          ),
          ListTile(
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendLevelDark.toString(),
              value: controller.blendLevelDark.toDouble(),
              onChanged: (double value) {
                controller.setBlendLevelDark(value.toInt());
              },
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'LEVEL',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    '${controller.blendLevelDark}',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            enabled: controller.useSubThemes &&
                controller.useFlexColorScheme &&
                !controller.useKeyColors,
            title: const Text('Dark theme onColors blend level'),
            subtitle: const Text('The onColor blending mixes in its own color, '
                'into the onColor, when seed/M3 colors are not used. This '
                'affects onContainers, onSurface and onBackground. When the '
                'main onColor blending switch is ON, it also affects on colors '
                'for primary, secondary, tertiary and error.'),
          ),
          ListTile(
            enabled: controller.useSubThemes &&
                controller.useFlexColorScheme &&
                !controller.useKeyColors,
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendOnLevelDark.toString(),
              value: controller.useSubThemes &&
                      controller.useFlexColorScheme &&
                      !controller.useKeyColors
                  ? controller.blendOnLevelDark.toDouble()
                  : 0,
              onChanged: controller.useSubThemes &&
                      controller.useFlexColorScheme &&
                      !controller.useKeyColors
                  ? (double value) {
                      controller.setBlendOnLevelDark(value.toInt());
                    }
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'LEVEL',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    '${controller.useSubThemes && controller.useFlexColorScheme && !controller.useKeyColors ? controller.blendOnLevelDark : ""}',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SwitchListTile(
            title: const Text('Dark theme main colors use onColor blending'),
            subtitle: const Text(
                'In M3 dark design, not only container colors use '
                'color pair tinted onColor, but also main colors do. '
                'Keep this ON to also use it with onPrimary, onSecondary, '
                'onTertiary and onError colors in dark mode, when seed colors '
                'are not used'),
            value: controller.blendDarkOnColors &&
                controller.useSubThemes &&
                controller.useFlexColorScheme &&
                !controller.useKeyColors,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors
                ? controller.setBlendDarkOnColors
                : null,
          ),
          SwitchListTile(
            title: const Text('True black'),
            subtitle: const Text(
              'Black Scaffold in all blend modes, '
              'other surfaces become 5% darker',
            ),
            value: controller.darkIsTrueBlack,
            onChanged: controller.setDarkIsTrueBlack,
          ),
        ],
      ],
    );
  }
}
