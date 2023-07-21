import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_theme.dart';
import '../../../../shared/model/splash_type_enum.dart';
import '../../../../shared/model/visual_density_enum.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../shared/adaptive_theme_popup_menu.dart';
import '../../shared/back_to_actual_platform.dart';
import '../../shared/is_web_list_tile.dart';
import '../../shared/platform_popup_menu.dart';
import '../../shared/splash_type_popup_menu.dart';
import '../../shared/visual_density_popup_menu.dart';

// Panel used to control the adaptive theme settings.
class AdaptiveThemeSettings extends StatelessWidget {
  const AdaptiveThemeSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('Platform adaptive behavior'),
          // subtitleDense: true,
          subtitle: Text('With platform adaptive settings you can modify theme '
              'properties to have a different response on selected platforms. '
              'You can select which platforms the platform adaptive value '
              'should be used on. All other platforms not included '
              'in this choice, will continue to use the none adaptive '
              'value or default behavior.\n'
              '\n'
              'Using the API you can customize which platform an adaptive '
              'feature is used on, including separate definitions when using '
              'the app in a web build on each platform. The selections here '
              'use built-in combinations, they cover most use cases.'),
        ),
        VisualDensityPopupMenu(
          title: const Text('VisualDensity'),
          subtitle: const Text(
            'Defines the visual density of user interface components. '
            'Density, in the context of a UI, is the vertical and horizontal '
            '"compactness" of the components in the UI. It is without unit, '
            'since it means different things to different UI components.\n',
          ),
          index: controller.usedVisualDensity?.index ?? -1,
          onChanged: controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= VisualDensityEnum.values.length) {
                    controller.setUsedVisualDensity(null);
                  } else {
                    controller
                        .setUsedVisualDensity(VisualDensityEnum.values[index]);
                  }
                }
              : null,
        ),
        const Divider(),
        SplashTypePopupMenu(
          title: const Text('Ink splash effect'),
          subtitle: const Text(
            'Defines the type of tap ink splash effect used on Material '
            'UI components.\n',
          ),
          index: controller.splashType?.index ?? -1,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? (int index) {
                  if (index < 0 || index >= SplashTypeEnum.values.length) {
                    controller.setSplashType(null);
                  } else {
                    controller.setSplashType(SplashTypeEnum.values[index]);
                  }
                }
              : null,
        ),
        SplashTypePopupMenu(
          title: const Text('Adaptive ink splash effect'),
          subtitle: const Text(
            'Defines the type of tap ink splash effect used on Material '
            'UI components when running on below selected platforms. When not '
            'running on these platforms or if the platform adaptive ink '
            'feature is OFF, the ink splash effect above is used.\n',
          ),
          index: controller.splashTypeAdaptive?.index ?? -1,
          onChanged: controller.useFlexColorScheme &&
                  controller.useSubThemes &&
                  controller.adaptiveSplash != AdaptiveTheme.off &&
                  controller.adaptiveSplash != null
              ? (int index) {
                  if (index < 0 || index >= SplashTypeEnum.values.length) {
                    controller.setSplashTypeAdaptive(null);
                  } else {
                    controller
                        .setSplashTypeAdaptive(SplashTypeEnum.values[index]);
                  }
                }
              : null,
        ),
        AdaptiveThemePopupMenu(
          title: const Text('Use platform adaptive ink splash'),
          subtitle: const Text(
            'An adaptive theme response used to select a different ink '
            'splash effect on selected platforms.\n',
          ),
          index: controller.adaptiveSplash?.index ?? -1,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? (int index) {
                  if (index < 0 || index >= AdaptiveTheme.values.length) {
                    controller.setAdaptiveSplash(null);
                  } else {
                    controller.setAdaptiveSplash(AdaptiveTheme.values[index]);
                  }
                }
              : null,
        ),
        const Divider(),
        if (isLight) ...<Widget>[
          AdaptiveThemePopupMenu(
            title: const Text('Bring elevation shadows back'),
            subtitle: const Text(
              'An adaptive theme response to bring elevation shadows back in '
              'Material-3 in light theme mode on selected platforms. '
              'Has no impact in Material-2 mode. '
              'Applies to AppBar, BottomAppBar, BottomSheet, DatePickerDialog, '
              'Dialog, Drawer, NavigationBar, NavigationDrawer.\n',
            ),
            index: controller.adaptiveElevationShadowsBackLight?.index ?? -1,
            onChanged: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.useMaterial3
                ? (int index) {
                    if (index < 0 || index >= AdaptiveTheme.values.length) {
                      controller.setAdaptiveElevationShadowsBackLight(null);
                    } else {
                      controller.setAdaptiveElevationShadowsBackLight(
                          AdaptiveTheme.values[index]);
                    }
                  }
                : null,
          ),
          AdaptiveThemePopupMenu(
            title: const Text('Remove elevation tint'),
            subtitle: const Text(
              'An adaptive theme response to remove elevation tint on elevated '
              'surfaces in Material-3 in light theme mode on selected '
              'platforms. This is not recommended unless shadows are also '
              'brought back. '
              'This setting has no impact in Material-2 mode. '
              'Applies to BottomAppBar, BottomSheet, Card, Chip, '
              'DatePickerDialog, Dialog, Drawer, DropdownMenu, MenuBar, '
              'MenuAnchor, NavigationDrawer and PopupMenuButton. There is a '
              'separate tint removal setting for the NavigationBar, as you may '
              'want to keep it on even if otherwise removing tint.\n',
            ),
            index: controller.adaptiveRemoveElevationTintLight?.index ?? -1,
            onChanged: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.useMaterial3
                ? (int index) {
                    if (index < 0 || index >= AdaptiveTheme.values.length) {
                      controller.setAdaptiveRemoveElevationTintLight(null);
                    } else {
                      controller.setAdaptiveRemoveElevationTintLight(
                          AdaptiveTheme.values[index]);
                    }
                  }
                : null,
          ),
        ] else ...<Widget>[
          AdaptiveThemePopupMenu(
            title: const Text('Bring elevation shadows back'),
            subtitle: const Text(
              'An adaptive theme response to bring elevation shadows back in '
              'Material-3 in dark theme mode on selected platforms. '
              'Has no impact in Material-2 mode. '
              'Applies to AppBar, BottomAppBar, BottomSheet, DatePickerDialog, '
              'Dialog, Drawer, NavigationBar, NavigationDrawer.\n',
            ),
            index: controller.adaptiveElevationShadowsBackDark?.index ?? -1,
            onChanged: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.useMaterial3
                ? (int index) {
                    if (index < 0 || index >= AdaptiveTheme.values.length) {
                      controller.setAdaptiveElevationShadowsBackDark(null);
                    } else {
                      controller.setAdaptiveElevationShadowsBackDark(
                          AdaptiveTheme.values[index]);
                    }
                  }
                : null,
          ),
          AdaptiveThemePopupMenu(
            title: const Text('Remove elevation tint'),
            subtitle: const Text(
              'An adaptive theme response to remove elevation tint on elevated '
              'surfaces in Material-3 in dark theme mode on selected '
              'platforms. This is not recommended in dark mode, unless '
              'shadows are also brought back. However, even then it is bad '
              'idea since shadows are not very visible in dark mode. Recommend '
              'keeping elevation tint in M3 mode in dark mode. You can '
              'still bring shadows back in dark mode, it can further increase '
              'elevation separation in dark mode. '
              'This setting sas no impact in Material-2 mode. '
              'Applies to BottomAppBar, BottomSheet, Card, Chip, '
              'DatePickerDialog, Dialog, Drawer, DropdownMenu, MenuBar, '
              'MenuAnchor, NavigationDrawer and PopupMenuButton. There is a '
              'separate tint removal setting for the NavigationBar, as you may '
              'want to keep it on even if otherwise removing tint.\n',
            ),
            index: controller.adaptiveRemoveElevationTintDark?.index ?? -1,
            onChanged: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.useMaterial3
                ? (int index) {
                    if (index < 0 || index >= AdaptiveTheme.values.length) {
                      controller.setAdaptiveRemoveElevationTintDark(null);
                    } else {
                      controller.setAdaptiveRemoveElevationTintDark(
                          AdaptiveTheme.values[index]);
                    }
                  }
                : null,
          ),
        ],
        const Divider(),
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        IsWebListTile(controller: controller),
        BackToActualPlatform(controller: controller),
        const Divider(),
        const ListTile(
            subtitle: Text('You can find additional platform adaptive '
                'settings under Shape & Radius, AppBar, NavigationBar '
                'and Dialogs.'))
      ],
    );
  }
}
