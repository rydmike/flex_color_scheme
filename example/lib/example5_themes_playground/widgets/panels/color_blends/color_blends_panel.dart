import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/surfaces_seed_blend_color.dart';
import 'dark_surface_mode_list_tile.dart';
import 'dark_surface_mode_popup_menu.dart';
import 'light_surface_mode_list_tile.dart';
import 'light_surface_mode_popup_menu.dart';
import 'on_colors.dart';
import 'surface_colors.dart';

// Panel used to define how primary color is blended into surfaces and
// onColors.
class ColorBlendsPanel extends StatelessWidget {
  const ColorBlendsPanel(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        // UseSeededColorSchemeSwitch(controller: controller),
        if (isLight) ...<Widget>[
          LightSurfaceModePopupMenu(controller: controller),
          LightSurfaceModeListTile(controller: controller),
          const ListTileReveal(
            title: Text('Surface colors blend level'),
            subtitleReveal: Text(
              'Surface blend uses alpha blend, to mix in the surface '
              'tint color into all surface colors. The blend '
              'level is the used alpha value in an alpha blend. The mode '
              'changes used factor of this alpha blend value differently '
              'for different surface colors and scaffold background color.\n'
              '\n'
              'Blends also applies to surfaces when seeded ColorSchemes are '
              'used. Seed based surfaces already include a touch of '
              'primary color, you can make it stronger with surface blends. '
              'To use default seed generated surface color results, use '
              'blend level zero.\n'
              '\n'
              'When using a surface blend mode with a high factor on Scaffold '
              'background, the design intent is typically to not place any '
              'controls or text on it directly, but to always use them on '
              'other surfaces '
              'with less surface tint, for example in Cards. The Scaffold '
              'background is then only used as a background color effect. If '
              'your app places controls directly on Scaffold, a high blend '
              'factor on Scaffold background color may not be a good fit. '
              'Choose one where it has a lower color blend factor.',
            ),
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
        ] else ...<Widget>[
          DarkSurfaceModePopupMenu(controller: controller),
          DarkSurfaceModeListTile(controller: controller),
          const ListTileReveal(
            title: Text('Surface colors blend level'),
            subtitleReveal: Text(
              'Surface blend uses alpha blend, to mix in the surface '
              'tint color into all surface colors. The blend '
              'level is the used alpha value in an alpha blend. The mode '
              'changes used factor of this alpha blend value differently '
              'for different surface colors and scaffold background color.\n'
              '\n'
              'Blends also applies to surfaces when seeded ColorSchemes are '
              'used. Seed based surfaces already include a touch of '
              'primary color, you can make it stronger with surface blends. '
              'To use default seed generated surface color results, use '
              'blend level zero.\n'
              '\n'
              'When using a surface blend mode with a high factor on Scaffold '
              'background, the design intent is typically to not place any '
              'controls or text on it directly, but to always use them on '
              'other surfaces '
              'with less surface tint, for example in Cards. The Scaffold '
              'background is then only used as a background color effect. If '
              'your app places controls directly on Scaffold, a high blend '
              'factor on Scaffold background color may not be a good fit. '
              'Choose one where it has a lower color blend factor.',
            ),
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
        ],
        // Show all the surface colors to show what is done to them.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SurfaceColors(controller: controller),
        ),
        const SizedBox(height: 8),
        if (isLight) ...<Widget>[
          SurfacesSeedBlendColorLight(controller),
          ColorSchemePopupMenu(
            enabled: enableControl,
            title: const Text('Scaffold background color'),
            defaultLabel:
                controller.lightIsWhite ? 'White' : 'surfaceContainerLowest',
            defaultLabelM2: controller.lightIsWhite ? 'White' : 'surface',
            defaultDisabledLabel: controller.useFlexColorScheme
                ? controller.lightIsWhite
                    ? 'White'
                    : 'surfaceContainerLowest'
                : 'surface',
            defaultDisabledLabelM2: controller.useFlexColorScheme
                ? controller.lightIsWhite
                    ? 'White'
                    : 'surface'
                : 'grey50',
            value: controller.scaffoldBackgroundLightSchemeColor,
            onChanged: controller.setScaffoldBackgroundLightSchemeColor,
          ),
          SwitchListTileReveal(
            enabled: controller.useFlexColorScheme,
            title: const Text('Plain white'),
            subtitleReveal: const Text(
              'Plain white uses white Scaffold background color in all blend '
              'modes, other surfaces also become less blended.\n',
            ),
            value: controller.lightIsWhite,
            onChanged: controller.setLightIsWhite,
          ),
        ] else ...<Widget>[
          SurfacesSeedBlendColorDark(controller),
          ColorSchemePopupMenu(
            enabled: enableControl,
            title: const Text('Scaffold background color'),
            defaultLabel: 'surfaceContainerLowest',
            defaultLabelM2: controller.darkIsTrueBlack ? 'Black' : 'surface',
            defaultDisabledLabel: controller.useFlexColorScheme
                ? controller.darkIsTrueBlack
                    ? 'Black'
                    : 'surfaceContainerLowest'
                : 'surface',
            defaultDisabledLabelM2: controller.useFlexColorScheme
                ? controller.darkIsTrueBlack
                    ? 'Black'
                    : 'surface'
                : 'grey850',
            value: controller.scaffoldBackgroundDarkSchemeColor,
            onChanged: controller.setScaffoldBackgroundDarkSchemeColor,
          ),
          SwitchListTileReveal(
            enabled: controller.useFlexColorScheme,
            title: const Text('True black'),
            subtitleReveal: const Text(
              'For an ink black dark mode, use True Black. It uses a totally '
              'black Scaffold background in all blend modes, other surfaces '
              'also become less blended.\n',
            ),
            value: controller.darkIsTrueBlack,
            onChanged: controller.setDarkIsTrueBlack,
          ),
        ],
        const Divider(),
        const ListTileReveal(
          title: Text('Contrast Color Blends'),
          subtitleReveal: Text(
            'You can adjust alpha blends for on colors for surfaces and '
            'for the main and container colors.\n',
          ),
        ),
        //
        // Light mode widgets
        //
        if (isLight) ...<Widget>[
          SwitchListTileReveal(
            title: const Text('Main and container colors on color blending'),
            enabled: enableControl,
            subtitleReveal:
                const Text('In M3 design, in light mode, only container colors '
                    'use color '
                    'pair tinted on color. Main colors use black or white. '
                    'Keep this OFF to do so. Set to ON to use blends with '
                    'onPrimary, onSecondary, onTertiary and onError, when seed '
                    'colors are NOT used.\n'),
            value: controller.blendLightOnColors,
            onChanged: controller.setBlendLightOnColors,
          ),
          ListTileReveal(
            enabled: enableControl,
            title: const Text('Contrast colors blend level'),
            subtitleReveal: const Text(
              'The contrasting on color blending mixes in '
              'its own main color, '
              'into the on color, when seed/M3 colors are not used. This '
              'affects onContainers, onSurface and onBackground. When the '
              'main on color blending switch is ON, it also affects on colors '
              'for primary, secondary, tertiary and error.\n'
              'When seed color is used, the on color contrast color always '
              'gets its correct tonal palette on color, but if the main '
              'color is locked to custom color, the computed blended on '
              'color contrast color version will be used instead.\n',
            ),
          ),
          ListTile(
            enabled: enableControl,
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendOnLevel.toString(),
              value: enableControl ? controller.blendOnLevel.toDouble() : 0,
              onChanged: enableControl
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
                    '${controller.useSubThemes && controller.useFlexColorScheme ? controller.blendOnLevel : ""}',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ]
        //
        // ELSE Dark mode widgets
        //
        else ...<Widget>[
          SwitchListTileReveal(
            title: const Text('Main and container colors on color blending'),
            enabled: enableControl,
            subtitleReveal:
                const Text('In M3 design, in dark mode, both container and '
                    'main colors use color pair tinted on colors. Keep it '
                    'ON to do so in dark mode and use blends for onPrimary, '
                    'onSecondary, onTertiary and onError, when seed '
                    'colors are NOT used.\n'),
            value: controller.blendDarkOnColors,
            onChanged: controller.setBlendDarkOnColors,
          ),
          ListTileReveal(
            enabled: enableControl,
            title: const Text('Contrast colors blend level'),
            subtitleReveal: const Text(
              'The contrasting on color blending mixes in '
              'its own main color, '
              'into the on color, when seed/M3 colors are not used. This '
              'affects onContainers, onSurface and onBackground. When the '
              'main on color blending switch is ON, it also affects on colors '
              'for primary, secondary, tertiary and error.\n'
              'When seed color is used, the on color contrast color always '
              'gets its correct tonal palette on color, but if the main '
              'color is locked to custom color, the computed blended on '
              'color contrast color version will be used instead.\n',
            ),
          ),
          ListTile(
            enabled: enableControl,
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendOnLevelDark.toString(),
              value: enableControl ? controller.blendOnLevelDark.toDouble() : 0,
              onChanged: enableControl
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
                    '${controller.useSubThemes && controller.useFlexColorScheme ? controller.blendOnLevelDark : ""}',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
        // Show all the on colors to show what is done to them.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: OnColors(controller: controller),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
