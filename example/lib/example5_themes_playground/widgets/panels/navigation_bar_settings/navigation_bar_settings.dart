import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_theme.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../dialogs/set_navigation_bar_to_m3_dialog.dart';
import '../../shared/adaptive_theme_popup_menu.dart';
import '../../shared/back_to_actual_platform.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/is_web_list_tile.dart';
import '../../shared/navigators_use_default_switch.dart';
import '../../shared/platform_popup_menu.dart';
import 'navigation_bar_label_behavior_list_tile.dart';

// Panel used to control the sub-theme for NavigationBar.
class NavigationBarSettings extends StatelessWidget {
  const NavigationBarSettings(this.controller, {super.key});
  final ThemeController controller;

  Future<void> _handleSetToM3(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const SetNavigationBarToM3Dialog();
      },
    );
    if (reset ?? false) {
      await controller.setNavigationBarToM3();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;

    // Logic for default elevation label.
    final String elevationDefaultLabel = controller.navBarElevation == null
        ? 'default 3'
        : controller.navBarElevation!.toStringAsFixed(1);

    // Logic for background color label.
    String backgroundColorLabel() {
      if (controller.useMaterial3 &&
          controller.navBarBackgroundSchemeColor == null) {
        return 'default (surface with elevation tint)';
      }
      if (!controller.useSubThemes ||
          !controller.useFlexColorScheme ||
          (controller.useFlutterDefaults &&
              controller.navBarBackgroundSchemeColor == null)) {
        return 'default (surface with onSurface overlay)';
      }
      return 'default (surfaceVariant)';
    }

    // Logic for indicator color label default value,
    // custom color selection overrides default label and value.
    String indicatorColorLabel() {
      // Use FCS component default, primary.
      if (!controller.useFlutterDefaults &&
          controller.useFlexColorScheme &&
          controller.useSubThemes) {
        return 'default (primary)';
      }
      // Use M2 default color
      if (!controller.useMaterial3) {
        return 'default (secondary)';
      }
      // All other cases will use M3 style.
      return 'default (secondaryContainer)';
    }

    // Logic for selected icon color default value,
    // custom color selection overrides default label and value.
    String selectedIconColorLabel() {
      // Use FCS component default, primary.
      if (!controller.useFlutterDefaults &&
          controller.useFlexColorScheme &&
          controller.useSubThemes) {
        return 'default (primary)';
      }
      // Use M2 default color
      if (!controller.useMaterial3) {
        return 'default (onSurface)';
      }
      // All other cases will use M3 style.
      return 'default (onSecondaryContainer)';
    }

    // Logic for selected icon color default value,
    // custom color selection overrides default label and value.
    String selectedLabelColorLabel() {
      // Use FCS component default, primary.
      if (!controller.useFlutterDefaults &&
          controller.useFlexColorScheme &&
          controller.useSubThemes) {
        return 'default (primary)';
      }
      // Use M2 default color
      if (!controller.useMaterial3) {
        return 'default (onSurface)';
      }
      // All other cases will use M3 style.
      return 'default (onSurface)';
    }

    final bool muteUnselectedEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.useFlutterDefaults &&
            controller.navBarSelectedIconSchemeColor == null &&
            controller.navBarUnselectedSchemeColor == null);
    // Logic for unselected item color label default value,
    // custom color selection overrides default label and value.
    String unselectedItemColorLabel() {
      // Use FCS component default, onSurface with muted label.
      if (!controller.useFlutterDefaults &&
          controller.useFlexColorScheme &&
          controller.useSubThemes &&
          controller.navBarMuteUnselected &&
          muteUnselectedEnabled) {
        return 'default (onSurface, with blend & opacity)';
      }
      // Use FCS component default, onSurface.
      if (!controller.useMaterial3 || !controller.useFlutterDefaults) {
        return 'default (onSurface)';
      }
      // All other cases will use M3 style.
      return 'default (onSurfaceVariant)';
    }

    final bool navBarOpacityEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        (!controller.useFlutterDefaults ||
            controller.navBarBackgroundSchemeColor != null);
    final double navBarOpacity =
        navBarOpacityEnabled ? controller.navBarOpacity : 1;
    final bool navBarHighlightOpacityEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.navBarIndicatorSchemeColor == null &&
            controller.useFlutterDefaults);
    final double navBarHighlightOpacity = navBarHighlightOpacityEnabled
        ? (controller.navBarIndicatorOpacity ?? -0.01)
        : -0.01;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('NavigationBar colors and styles'),
          subtitle: Text(
            'Default background color is surface with an onSurface overlay '
            'color in M2. In M3 default background color is surface with '
            'elevation 3, using M3 elevation tint. FlexColorScheme M2 theme '
            'default is color scheme background, with active surface blend '
            'and elevation 0. FCS M3 mode background is same as M3 default.\n',
          ),
        ),
        Card(
          elevation: 0,
          shadowColor: Colors.transparent,
          color: useMaterial3
              ? theme.colorScheme.surfaceVariant
              : theme.colorScheme.onInverseSurface,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: NavigationBarShowcase(explain: false),
          ),
        ),
        const SizedBox(height: 8),
        ListTileReveal(
          enabled: useMaterial3,
          title: const Text('Use Material 3 default NavigationBar style?'),
          subtitleDense: true,
          subtitle: const Text('Updates settings below to match M3 default '
              'values.\n'),
          trailing: FilledButton(
            onPressed: useMaterial3
                ? () async {
                    await _handleSetToM3(context);
                  }
                : null,
            child: const Text('Set to M3'),
          ),
          onTap: () async {
            await _handleSetToM3(context);
          },
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: backgroundColorLabel(),
          index: controller.navBarBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
        ListTile(
          enabled: navBarOpacityEnabled,
          title: const Text('Background opacity'),
          subtitle: Slider(
            max: 100,
            divisions: 100,
            label: (navBarOpacity * 100).toStringAsFixed(0),
            value: navBarOpacity * 100,
            onChanged: navBarOpacityEnabled
                ? (double value) {
                    controller.setNavBarOpacity(value / 100);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OPACITY',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  '${(navBarOpacity * 100).toStringAsFixed(0)} %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 24,
            divisions: 25,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarElevation == null ||
                        (controller.navBarElevation ?? -1) < 0
                    ? elevationDefaultLabel
                    : (controller.navBarElevation?.toStringAsFixed(1) ?? '')
                : controller.useMaterial3
                    ? 'default 3'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setNavBarElevation(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.navBarElevation == null ||
                              (controller.navBarElevation ?? -1) < 0
                          ? elevationDefaultLabel
                          : (controller.navBarElevation?.toStringAsFixed(1) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 3'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Height'),
          subtitle: Slider(
            min: 54,
            max: 100,
            divisions: 46,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarHeight == null ||
                        (controller.navBarHeight ?? 54) < 55
                    ? 'default 80'
                    : (controller.navBarHeight?.toStringAsFixed(0) ?? '')
                : 'default 80',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarHeight ?? 54
                : 54,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setNavBarHeight(
                        value < 55 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.navBarHeight == null ||
                              (controller.navBarHeight ?? 54) < 55
                          ? 'default 80'
                          : (controller.navBarHeight?.toStringAsFixed(0) ?? '')
                      : 'default 80',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Selection indicator color'),
          labelForDefault: indicatorColorLabel(),
          index: controller.navBarIndicatorSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
        ListTile(
          enabled: navBarHighlightOpacityEnabled,
          title: const Text('Selection indicator opacity'),
          subtitle: Slider(
            min: -1,
            max: 100,
            divisions: 101,
            label: navBarHighlightOpacityEnabled
                ? controller.navBarIndicatorOpacity == null ||
                        (controller.navBarIndicatorOpacity ?? -1) < 0
                    ? 'default 24%'
                    : (navBarHighlightOpacity * 100).toStringAsFixed(0)
                : controller.useMaterial3
                    ? 'default 100%'
                    : 'default 24%',
            value: navBarHighlightOpacity * 100,
            onChanged: navBarHighlightOpacityEnabled
                ? (double value) {
                    controller.setNavBarIndicatorOpacity(
                        value < 0 ? null : value / 100);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OPACITY',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  navBarHighlightOpacityEnabled
                      ? controller.navBarIndicatorOpacity == null ||
                              (controller.navBarIndicatorOpacity ?? -1) < 0
                          ? 'default 24%'
                          // ignore: lines_longer_than_80_chars
                          : '${(navBarHighlightOpacity * 100).toStringAsFixed(0)} %'
                      : controller.useMaterial3
                          ? 'default 100%'
                          : 'default 24%',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Indicator border radius'),
          subtitle: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarIndicatorBorderRadius == null ||
                        (controller.navBarIndicatorBorderRadius ?? -1) < 0
                    ? 'default (stadium)'
                    : (controller.navBarIndicatorBorderRadius
                            ?.toStringAsFixed(0) ??
                        '')
                : 'default (stadium)',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarIndicatorBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setNavBarIndicatorBorderRadius(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.navBarIndicatorBorderRadius == null ||
                              (controller.navBarIndicatorBorderRadius ?? -1) < 0
                          ? 'default (stadium)'
                          : (controller.navBarIndicatorBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default (stadium)',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Selected icon color'),
          labelForDefault: selectedIconColorLabel(),
          index: controller.navBarSelectedIconSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
          subtitleDense: true,
          subtitle: const Text('Unselected icon and text are less bright. '
              'Shared setting for icon and text, but separate properties '
              'in the API.\n'),
          value: controller.navBarMuteUnselected && muteUnselectedEnabled,
          onChanged:
              muteUnselectedEnabled ? controller.setNavBarMuteUnselected : null,
        ),
        NavigationBarLabelBehaviorListTile(controller: controller),
        const Divider(),
        if (isLight)
          AdaptiveThemePopupMenu(
            title: const Text('Remove elevation tint'),
            subtitle: const Text(
              'An adaptive theme response to remove elevation tint on elevated '
              'NavigationBar in Material-3 in light theme-mode on selected '
              'platforms. This setting has no impact in Material-2 mode.\n',
            ),
            index: controller.adaptiveRemoveNavigationBarTintLight?.index ?? -1,
            onChanged: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.useMaterial3
                ? (int index) {
                    if (index < 0 || index >= AdaptiveTheme.values.length) {
                      controller.setAdaptiveRemoveNavigationBarTintLight(null);
                    } else {
                      controller.setAdaptiveRemoveNavigationBarTintLight(
                          AdaptiveTheme.values[index]);
                    }
                  }
                : null,
          )
        else
          AdaptiveThemePopupMenu(
            title: const Text('Remove elevation tint'),
            subtitle: const Text(
              'An adaptive theme response to remove elevation tint on elevated '
              'NavigationBar in Material-3 in dark theme-mode on selected '
              'platforms. This setting has no impact in Material-2 mode.\n',
            ),
            index: controller.adaptiveRemoveNavigationBarTintDark?.index ?? -1,
            onChanged: controller.useFlexColorScheme &&
                    controller.useSubThemes &&
                    controller.useMaterial3
                ? (int index) {
                    if (index < 0 || index >= AdaptiveTheme.values.length) {
                      controller.setAdaptiveRemoveNavigationBarTintDark(null);
                    } else {
                      controller.setAdaptiveRemoveNavigationBarTintDark(
                          AdaptiveTheme.values[index]);
                    }
                  }
                : null,
          ),
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        IsWebListTile(controller: controller),
        BackToActualPlatform(controller: controller),
        const Divider(),
        NavigatorsUseDefaultsSwitch(controller: controller),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitle: Text(
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
