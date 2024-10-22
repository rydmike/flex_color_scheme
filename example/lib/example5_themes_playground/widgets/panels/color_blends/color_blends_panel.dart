import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/scaffold_base_popup_menu.dart';
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

  static const String _blendInfo =
      'Surface blend uses alpha blend, to mix in the surface '
      'tint color into all surface colors. The blend '
      'level is the used alpha blend value. The blend mode '
      'changes a factor used on this alpha blend value differently '
      'for different surface colors and scaffold background color.\n'
      '\n'
      'Blends also applies to surfaces when seeded ColorSchemes are '
      'used. Seed based surfaces already include a primary color '
      'tinted surface. You can make this stronger with surface blends. '
      'To use default seed generated surface color results, keep '
      'blend level at zero.\n'
      '\n'
      'When using a surface blend mode with a high factor on Scaffold '
      'background, the design intent is typically to not place any '
      'controls or text on it directly, but to always use them on '
      'other surfaces '
      'with less surface tint, for example in Cards. The Scaffold '
      'background is then only used as a background color effect. If '
      'your app places controls directly on Scaffold, a high blend '
      'factor on Scaffold background color may not be a good fit. '
      'Choose one where it has a lower color blend factor.\n';

  static const String _scaffoldBaseInfo =
      'You can select a base color to be used as the Scaffold background, '
      'that is also used as input to the surface blending. In previous '
      'versions it was fixed to default surface color, which are different '
      'for Material-2 and Material-3 mode.\n'
      '\n'
      'The different base color selections allow you to have a more variation '
      'in how the background looks with different surface blend levels. You '
      'can also use White color as starting point in light theme mode and '
      'Black color in dark theme mode.\n '
      '\n'
      'That starting base blend color now defaults to '
      'surfaceContainerLowest in Material-3 mode and to surface in Material-2 '
      'mode.\n'
      '\n'
      'If you use surface blends, but want the scaffold background color to '
      'use a fixed color, you can select select a fixed '
      '"Scaffold background override" color further below.\n';

  static const String _scaffoldColorOverrideInfo =
      'You can select any ColorScheme color '
      'to be used as Scaffold background override color.\n'
      '\n'
      'Setting this color will override any blended Scaffold background and '
      'also the "Plain white" and "True black" setting part that makes the '
      'scaffold background color '
      'white or black, the other parts of their impacts will remain in effect. '
      'You will see the effective color on the Scaffold background '
      'color box above.\n'
      '\n'
      'We recommend sticking to surface colors, but if you use '
      'ScaffoldBackground only as a background effect color, you can '
      'now choose any ColorScheme color you like. White, Black and '
      'transparent are also available. Transparent will only '
      'show the background color of the parent widget, which in root '
      'MaterialApp case is black, so you will not see the desktop '
      'behind it.\n';

  static const String _contrastBlendInfo =
      'You can adjust alpha blends for contrasting ON colors for '
      'surfaces, outline colors, for the main container colors and '
      'optionally also the contrasting ON colors for the main colors.\n'
      '\n'
      'Unlike the surface color blends, these blends are not applied '
      'to seed generated ColorSchemes.\n'
      '\n'
      'The setting is however available also when using seed colors. Because, '
      'if you pin a main or container color in the seed generated scheme '
      'to its source color, the blend setting will be used to compute its '
      'onColor.\n'
      '\n'
      "A pinned color's hue may not be a part of the palette in the "
      'generated ColorScheme, we can thus not use the seed generated '
      'onColor as its onColor. It would require computing a '
      'totally different palette, matching the pinned color, to use '
      'the typically more color expressive seed generated ON color tones.\n'
      'Because of this, the contrast blend level can be used for getting '
      'more color expressive onColors for pinned colors when using '
      'seed generated ColorSchemes. To do so, adjust the "Contrast colors '
      'blend level" to a higher value. If you also turn on '
      '"Main colors on color blending", they also get contrast '
      'color blends. In Material-3 design it is only used in dark mode, but '
      'you can try it light mode too, or keep it OFF in both light and '
      'dark mode, all depending on your design goals.\n';

  static const String _contrastBlendLevelInfo =
      'The contrasting on color blending mixes in its own main color, '
      'into the contrasting ON color. This is only done when a '
      'seed generated color for the color in question is not used.\n'
      '\n'
      'This contrast blend level affects onSurface, onSurfaceVariant '
      'and onInverseSurface, the outline colors and the on colors for '
      'the main container colors.\n'
      '\n'
      'When the main on color blending switch is ON, it also affects '
      'on colors for primary, secondary, tertiary and error.\n'
      '\n'
      'When seed generated colors are used, the on color contrast '
      'color always gets its correct tonal palette on color, but if '
      'a main or its container color is pinned to its input value, '
      'the the computed blended on color contrast color version '
      'defined here will be used instead.\n';

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
            subtitleReveal: Text(_blendInfo),
          ),
          ListTile(
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendLevelLight.toString(),
              value: controller.blendLevelLight.toDouble(),
              onChanged: (double value) {
                controller.setBlendLevelLight(value.toInt());
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
                    '${controller.blendLevelLight}',
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
            subtitleReveal: Text(_blendInfo),
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
          ScaffoldBasePopupMenu(
            enabled: enableControl,
            title: const Text('Scaffold blend base'),
            subtitleReveal: const Text(_scaffoldBaseInfo),
            defaultLabel: 'surfaceContainerLowest',
            defaultLabelM2: 'surface',
            value: controller.scaffoldBackgroundLightBaseColor,
            onChanged: controller.setScaffoldBackgroundLightBaseColor,
          ),
          SwitchListTileReveal(
            enabled: controller.useFlexColorScheme,
            title: const Text('Plain white'),
            subtitleReveal: const Text(
              'Plain white uses white Scaffold background color in all blend '
              'modes, other surfaces also become less blended.\n',
            ),
            value: controller.scaffoldLightIsWhite,
            onChanged: controller.setScaffoldLightIsWhite,
          ),
          ColorSchemePopupMenu(
            enabled: enableControl,
            title: const Text('Scaffold background override'),
            subtitleReveal: const Text(_scaffoldColorOverrideInfo),
            defaultLabel: 'not used',
            defaultDisabledLabel: controller.useFlexColorScheme
                ? controller.scaffoldLightIsWhite
                    ? 'White'
                    : 'surfaceContainerLowest'
                : 'surface',
            defaultDisabledLabelM2: controller.useFlexColorScheme
                ? controller.scaffoldLightIsWhite
                    ? 'White'
                    : 'surface'
                : 'grey50',
            value: controller.scaffoldBackgroundLightSchemeColor,
            onChanged: controller.setScaffoldBackgroundLightSchemeColor,
          ),
        ] else ...<Widget>[
          SurfacesSeedBlendColorDark(controller),
          ScaffoldBasePopupMenu(
            enabled: enableControl,
            title: const Text('Scaffold blend base'),
            subtitleReveal: const Text(_scaffoldBaseInfo),
            defaultLabel: 'surfaceContainerLowest',
            defaultLabelM2: 'surface',
            value: controller.scaffoldBackgroundDarkBaseColor,
            onChanged: controller.setScaffoldBackgroundDarkBaseColor,
          ),
          SwitchListTileReveal(
            enabled: controller.useFlexColorScheme,
            title: const Text('True black'),
            subtitleReveal: const Text(
              'For an ink black dark mode, use True Black. It uses a totally '
              'black Scaffold background in all blend modes, other surfaces '
              'also become less blended.\n',
            ),
            value: controller.scaffoldDarkIsTrueBlack,
            onChanged: controller.setScaffoldDarkIsTrueBlack,
          ),
          ColorSchemePopupMenu(
            enabled: enableControl,
            title: const Text('Scaffold background override'),
            subtitleReveal: const Text(_scaffoldColorOverrideInfo),
            defaultLabel: 'not used',
            defaultDisabledLabel: controller.useFlexColorScheme
                ? controller.scaffoldDarkIsTrueBlack
                    ? 'Black'
                    : 'surfaceContainerLowest'
                : 'surface',
            defaultDisabledLabelM2: controller.useFlexColorScheme
                ? controller.scaffoldDarkIsTrueBlack
                    ? 'Black'
                    : 'surface'
                : 'grey850',
            value: controller.scaffoldBackgroundDarkSchemeColor,
            onChanged: controller.setScaffoldBackgroundDarkSchemeColor,
          ),
        ],
        const SizedBox(height: 8),
        const Divider(height: 1),
        ListTileReveal(
          title: const Text('Contrast Color Blends'),
          subtitleReveal: const Text(_contrastBlendInfo),
          tileColor: theme.colorScheme.surfaceContainer,
        ),
        const Divider(height: 1),
        const SizedBox(height: 8),
        //
        // Light mode widgets
        //
        if (isLight) ...<Widget>[
          SwitchListTileReveal(
            title: const Text('Main colors on color blending'),
            enabled: enableControl,
            subtitleReveal: const Text(
              'In Material-3 design, in light mode, only container colors '
              'use color pair tinted contrasting on colors. Main colors use '
              'black or white. '
              'Keep this setting OFF to do so. Set to ON to also use contrast '
              'blends with onPrimary, onSecondary, onTertiary and onError, '
              'when seed generated colors are NOT used.\n',
            ),
            value: controller.blendLightOnColors,
            onChanged: controller.setBlendLightOnColors,
          ),
          ListTileReveal(
            enabled: enableControl,
            title: const Text('Contrast colors blend level'),
            subtitleReveal: const Text(_contrastBlendLevelInfo),
          ),
          ListTile(
            enabled: enableControl,
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendOnLevelLight.toString(),
              value:
                  enableControl ? controller.blendOnLevelLight.toDouble() : 0,
              onChanged: enableControl
                  ? (double value) {
                      controller.setBlendOnLevelLight(value.toInt());
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
                    '${controller.useSubThemes && controller.useFlexColorScheme ? controller.blendOnLevelLight : ""}',
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
            title: const Text('Main colors on color blending'),
            enabled: enableControl,
            subtitleReveal: const Text(
              'In Material-3 design, in dark mode, both container and '
              'main colors use color pair tinted contrasting on colors. '
              'Keep this setting ON to do so in dark mode and use contrast '
              'blends for onPrimary, '
              'onSecondary, onTertiary and onError, when seed generated '
              'colors are NOT used. You can of course turn it OFF in dark '
              'mode too, if that style fits your design goal better.\n',
            ),
            value: controller.blendDarkOnColors,
            onChanged: controller.setBlendDarkOnColors,
          ),
          ListTileReveal(
            enabled: enableControl,
            title: const Text('Contrast colors blend level'),
            subtitleReveal: const Text(_contrastBlendLevelInfo),
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
        const SizedBox(height: 16),
      ],
    );
  }
}
