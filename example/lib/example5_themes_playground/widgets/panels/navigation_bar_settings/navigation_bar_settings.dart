import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_theme.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/back_to_actual_platform.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/is_web_list_tile.dart';
import '../../shared/platform_popup_menu.dart';
import 'navigation_bar_label_behavior_list_tile.dart';

// Panel used to control the sub-theme for NavigationBar.
class NavigationBarSettings extends StatelessWidget {
  const NavigationBarSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isLight = theme.brightness == Brightness.light;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    // Logic for background color label.
    String backgroundColorLabel() {
      if (useMaterial3 && controller.navBarBackgroundSchemeColor == null) {
        return 'default (surfaceContainer)';
      }
      if (!controller.useSubThemes ||
          !controller.useFlexColorScheme ||
          (controller.navBarBackgroundSchemeColor == null)) {
        return 'default (surface with onSurface overlay-3)';
      }
      return 'default (surfaceContainer)';
    }

    // Logic for indicator color label default value,
    // custom color selection overrides default label and value.
    String indicatorColorLabel() {
      // Use FCS component default, secondaryContainer.
      if (controller.useFlexColorScheme && controller.useSubThemes) {
        return 'default (secondaryContainer)';
      }
      // Use M2 default color
      if (!useMaterial3) {
        return 'default (secondary opacity 24 %)';
      }
      // All other cases will use M3 style.
      return 'default (secondaryContainer)';
    }

    // Logic for selected icon color default value,
    // custom color selection overrides default label and value.
    String selectedIconColorLabel() {
      // Use FCS component default, onSurface.
      if (controller.useFlexColorScheme && controller.useSubThemes) {
        return 'default (onSecondaryContainer)';
      }
      // Use M2 default color
      if (!useMaterial3) {
        return 'default (onSurface)';
      }
      // All other cases will use M3 style.
      return 'default (onSecondaryContainer)';
    }

    // Logic for selected icon color default value,
    // custom color selection overrides default label and value.
    String selectedLabelColorLabel() {
      // Use FCS component default, onSecondaryContainer.
      if (controller.useFlexColorScheme && controller.useSubThemes) {
        return 'default (onSurface)';
      }
      // Use M2 default color
      if (!useMaterial3) {
        return 'default (onSurface)';
      }
      // All other cases will use M3 style.
      return 'default (onSurface)';
    }

    final bool muteUnselectedEnabled =
        controller.useSubThemes && controller.useFlexColorScheme;
    // Logic for unselected item color label default value,
    // custom color selection overrides default label and value.
    String unselectedItemColorLabel() {
      // Use FCS component default.
      if (controller.useFlexColorScheme && controller.useSubThemes) {
        return 'default (onSurfaceVariant)';
      }
      // Use M2 Flutter component default..
      if (!useMaterial3) {
        return 'default (onSurface)';
      }
      // All other cases will use M3 style.
      return 'default (onSurfaceVariant)';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('NavigationBar colors and styles'),
          subtitleReveal: Text(
            'Default background color is surface with an onSurface overlay '
            'color in M2. In M3 default background color is surface with '
            'elevation 3, using M3 elevation tint. FlexColorScheme M2 theme '
            'default is color scheme background, with active surface blend '
            'and elevation 0. FCS M3 mode background is same as M3 default.\n',
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: NavigationBarShowcase(explain: false),
        ),
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: backgroundColorLabel(),
          index: controller.navBarBackgroundSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarBackgroundSchemeColor(null);
                  } else {
                    controller.setNavBarBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Background opacity'),
          value: controller.navBarOpacity,
          onChanged: controller.setNavBarOpacity,
          min: 0,
          max: 1,
          divisions: 100,
          valueDisplayScale: 100,
          valueDecimalPlaces: 0,
          valueHeading: 'OPACITY',
          valueUnitLabel: ' %',
          valueDefaultLabel: '100 %',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Elevation'),
          value: controller.navBarElevation,
          onChanged: controller.setNavBarElevation,
          min: 0,
          max: 24,
          divisions: 24,
          valueHeading: 'ELEV',
          valueDecimalPlaces: 0,
          valueDefaultLabel: useMaterial3 ? '3' : '0',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Height'),
          value: controller.navBarHeight,
          onChanged: controller.setNavBarHeight,
          min: 55,
          max: 100,
          divisions: 45,
          valueHeading: 'HEIGHT',
          valueUnitLabel: ' dp',
          valueDecimalPlaces: 0,
          valueDefaultLabel: '80 dp',
        ),
        ColorSchemePopupMenu(
          title: const Text('Selection indicator color'),
          labelForDefault: indicatorColorLabel(),
          index: controller.navBarIndicatorSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarIndicatorSchemeColor(null);
                  } else {
                    controller.setNavBarIndicatorSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Selection indicator opacity'),
          value: controller.navBarIndicatorOpacity,
          onChanged: controller.setNavBarIndicatorOpacity,
          min: 0,
          max: 1,
          divisions: 100,
          valueDisplayScale: 100,
          valueDecimalPlaces: 0,
          valueHeading: 'OPACITY',
          valueUnitLabel: ' %',
          valueDefaultLabel: '100 %',
          valueDefaultDisabledLabel: useMaterial3 ? '100 %' : '24 %',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Indicator border radius'),
          value: controller.navBarIndicatorBorderRadius,
          onChanged: controller.setNavBarIndicatorBorderRadius,
          min: 0,
          max: 50,
          divisions: 50,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDecimalPlaces: 0,
          valueDefaultLabel: 'stadium',
        ),
        ColorSchemePopupMenu(
          title: const Text('Selected icon color'),
          labelForDefault: selectedIconColorLabel(),
          index: controller.navBarSelectedIconSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarSelectedIconSchemeColor(null);
                  } else {
                    controller.setNavBarSelectedIconSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Selected label color'),
          labelForDefault: selectedLabelColorLabel(),
          index: controller.navBarSelectedLabelSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarSelectedLabelSchemeColor(null);
                  } else {
                    controller.setNavBarSelectedLabelSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Unselected item color'),
          subtitle: const Text('Label and icon, but own properties in API'),
          labelForDefault: unselectedItemColorLabel(),
          index: controller.navBarUnselectedSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarUnselectedSchemeColor(null);
                  } else {
                    controller.setNavBarUnselectedSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SwitchListTileReveal(
          title: const Text('Mute unselected items'),
          subtitleReveal:
              const Text('Unselected icon and text are less bright. '
                  'Shared setting for icon and text, but separate properties '
                  'in the API.\n'),
          value: controller.navBarMuteUnselected && muteUnselectedEnabled,
          onChanged:
              muteUnselectedEnabled ? controller.setNavBarMuteUnselected : null,
        ),
        NavigationBarLabelBehaviorListTile(controller: controller),
        const Divider(),
        if (isLight)
          EnumPopupMenu<AdaptiveTheme>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveTheme.values,
            title: const Text('Remove elevation tint'),
            subtitleReveal: Text(
              'An adaptive theme response to remove elevation tint on elevated '
              'NavigationBar in Material-3 in light theme-mode on selected '
              'platforms. This setting has no impact in Material-2 mode.\n'
              '\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveRemoveNavigationBarTintLight?.describe ?? AdaptiveTheme.off.describe}',
            ),
            value: controller.adaptiveRemoveNavigationBarTintLight,
            onChanged: controller.setAdaptiveRemoveNavigationBarTintLight,
          )
        else
          EnumPopupMenu<AdaptiveTheme>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveTheme.values,
            title: const Text('Remove elevation tint'),
            subtitleReveal: Text(
              'An adaptive theme response to remove elevation tint on elevated '
              'NavigationBar in Material-3 in dark theme-mode on selected '
              'platforms. This setting has no impact in Material-2 mode.\n'
              '\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveRemoveNavigationBarTintDark?.describe ?? AdaptiveTheme.off.describe}',
            ),
            value: controller.adaptiveRemoveNavigationBarTintDark,
            onChanged: controller.setAdaptiveRemoveNavigationBarTintDark,
          ),
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        IsWebListTile(controller: controller),
        BackToActualPlatform(controller: controller),
        const Divider(),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitleReveal: Text(
            'With the API you can also set the font and icon size individually '
            'on selected and unselected items. Use FlexSubThemesData '
            'properties: navigationBarSelectedLabelSize, '
            'navigationBarUnselectedLabelSize, '
            'navigationBarSelectedIconSize and '
            'navigationBarUnselectedIconSize.\n',
          ),
        ),
      ],
    );
  }
}
