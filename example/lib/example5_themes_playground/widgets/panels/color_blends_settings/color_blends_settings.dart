import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_picker_inkwell.dart';
import '../../shared/color_scheme_box.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'dark_surface_mode_list_tile.dart';
import 'dark_surface_mode_popup_menu.dart';
import 'light_surface_mode_list_tile.dart';
import 'light_surface_mode_popup_menu.dart';
import 'on_colors.dart';
import 'surface_colors.dart';

// Panel used to define how primary color is blended into surfaces and
// onColors.
class ColorBlendsSettings extends StatelessWidget {
  const ColorBlendsSettings(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  // Logic to get the effective default Dialog color label.
  static String _scaffoldBackgroundDefault(
    ThemeController controller,
    bool isLight,
  ) {
    if (!controller.useFlexColorScheme) {
      if (controller.useMaterial3) {
        return 'default (surface)';
      } else {
        return isLight ? 'default (grey50)' : 'default (grey850)';
      }
    } else {
      if (controller.useMaterial3) {
        return 'default (surfaceContainerLowest)';
      } else {
        return 'default (surface)';
      }
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
              'for different surface colors and scaffold background colors.\n'
              '\n'
              'Blends also applies to surfaces when M3 seeded ColorSchemes are '
              'used. Seed based M3 surfaces already include a touch of '
              'primary color, you can make it stronger with surface blends. '
              'To use default M3 surface color results, use blend level zero.\n'
              '\n'
              'When using a surface blend mode with a high factor on Scaffold '
              'background, the design intent is to not place any controls or '
              'text on it directly, but to always use them on other surfaces '
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
              'for different surface colors and scaffold background colors.\n'
              '\n'
              'Blends also applies to surfaces when M3 seeded ColorSchemes are '
              'used. Seed based M3 surfaces already include a touch of '
              'primary color, you can make it stronger with surface blends. '
              'To use default M3 surface color results, use blend level zero.\n'
              '\n'
              'When using a surface blend mode with a high factor on Scaffold '
              'background, the design intent is to not place any controls or '
              'text on it directly, but to always use them on other surfaces '
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
          ColorSchemePopupMenu(
            title: const Text('Scaffold background color'),
            labelForDefault: _scaffoldBackgroundDefault(controller, isLight),
            index: controller.scaffoldBackgroundLightSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setScaffoldBackgroundLightSchemeColor(null);
                    } else {
                      controller.setScaffoldBackgroundLightSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          SwitchListTileReveal(
            title: const Text('Plain white'),
            subtitleReveal: const Text(
              'Plain white uses white Scaffold background color in all blend '
              'modes, other surfaces also become less blended.\n',
            ),
            value: controller.lightIsWhite,
            onChanged: controller.setLightIsWhite,
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
              title: const Text('Light blend and surface tint color'),
              subtitle: Text('Color$defaultTintLightLabel '
                  '$nameThatColorLight $materialNameLight$spaceLight'
                  '#${effectiveTintLight.hexCode}'),
              trailing: Padding(
                padding: const EdgeInsetsDirectional.only(end: 5.0),
                child: ColorSchemeBox(
                  borderColor: Colors.transparent,
                  backgroundColor:
                      controller.surfaceTintLight ?? colorScheme.primary,
                ),
              ),
            ),
          ),
          ListTileReveal(
            enabled: controller.surfaceTintLight != null,
            title: const Text('Use default blend and tint color'),
            subtitleReveal: const Text('Sets light theme mode custom blend and '
                'tint color back to primary color.\n'),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 5.0),
              child: FilledButton(
                onPressed: controller.surfaceTintLight != null
                    ? () {
                        controller.setSurfaceTintLight(null);
                      }
                    : null,
                child: const Text('Default'),
              ),
            ),
            onTap: () {
              controller.setSurfaceTintLight(null);
            },
          ),
        ] else ...<Widget>[
          ColorSchemePopupMenu(
            title: const Text('Scaffold background color'),
            labelForDefault: _scaffoldBackgroundDefault(controller, isLight),
            index: controller.scaffoldBackgroundDarkSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setScaffoldBackgroundDarkSchemeColor(null);
                    } else {
                      controller.setScaffoldBackgroundDarkSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          SwitchListTileReveal(
            title: const Text('True black'),
            subtitleReveal: const Text(
              'For an ink black dark mode, use True Black. It uses a totally '
              'black Scaffold background in all blend modes, other surfaces '
              'also become less blended.\n',
            ),
            value: controller.darkIsTrueBlack,
            onChanged: controller.setDarkIsTrueBlack,
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
              title: const Text('Dark blend and surface tint color'),
              subtitle: Text('Color$defaultTintDarkLabel '
                  '$nameThatColorDark $materialNameDark$spaceDark'
                  '#${effectiveTintDark.hexCode}'),
              trailing: Padding(
                padding: const EdgeInsetsDirectional.only(end: 5.0),
                child: ColorSchemeBox(
                  borderColor: Colors.transparent,
                  backgroundColor:
                      controller.surfaceTintDark ?? colorScheme.primary,
                ),
              ),
            ),
          ),
          ListTileReveal(
            enabled: controller.surfaceTintDark != null,
            title: const Text('Use default blend and tint color'),
            subtitleReveal: const Text('Sets dark theme mode custom blend and '
                'tint color back to primary color.\n'),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 5.0),
              child: FilledButton(
                onPressed: controller.surfaceTintDark != null
                    ? () {
                        controller.setSurfaceTintDark(null);
                      }
                    : null,
                child: const Text('Default'),
              ),
            ),
            onTap: () {
              controller.setSurfaceTintDark(null);
            },
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
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
            subtitleReveal:
                const Text('In M3 design, in light mode, only container colors '
                    'use color '
                    'pair tinted on color. Main colors use black or white. '
                    'Keep this OFF to do so. Set to ON to use blends with '
                    'onPrimary, onSecondary, onTertiary and onError, when seed '
                    'colors are NOT used.\n'),
            value: controller.blendLightOnColors &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendLightOnColors
                : null,
          ),
          ListTileReveal(
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
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
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendOnLevel.toString(),
              value: controller.useSubThemes && controller.useFlexColorScheme
                  ? controller.blendOnLevel.toDouble()
                  : 0,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
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
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
            subtitleReveal:
                const Text('In M3 design, in dark mode, both container and '
                    'main colors use color pair tinted on colors. Keep it '
                    'ON to do so in dark mode and use blends for onPrimary, '
                    'onSecondary, onTertiary and onError, when seed '
                    'colors are NOT used.\n'),
            value: controller.blendDarkOnColors &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setBlendDarkOnColors
                : null,
          ),
          ListTileReveal(
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
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
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
            title: Slider(
              min: 0,
              max: 40,
              divisions: 40,
              label: controller.blendOnLevelDark.toString(),
              value: controller.useSubThemes && controller.useFlexColorScheme
                  ? controller.blendOnLevelDark.toDouble()
                  : 0,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
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
