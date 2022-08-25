import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/navigation_bar_label_behavior_buttons.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Panel used to control the sub-theme for NavigationBar.
class NavigationBarSettings extends StatelessWidget {
  const NavigationBarSettings(this.controller, {super.key});
  final ThemeController controller;

  String explainLabelStyle(
      final NavigationDestinationLabelBehavior labelBehavior) {
    switch (labelBehavior) {
      case NavigationDestinationLabelBehavior.alwaysHide:
        return 'Items have no labels';
      case NavigationDestinationLabelBehavior.onlyShowSelected:
        return 'Only selected item has a label';
      case NavigationDestinationLabelBehavior.alwaysShow:
        return 'All items have labels';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    // Logic for background color label.
    String backgroundColorLabel() {
      if (controller.useMaterial3 &&
          controller.navBarBackgroundSchemeColor == null) {
        return 'default (surface with primary overlay)';
      }
      if (!controller.useSubThemes ||
          !controller.useFlexColorScheme ||
          (controller.useFlutterDefaults &&
              controller.navBarBackgroundSchemeColor == null)) {
        return 'default (surface with onSurface overlay)';
      }
      return 'default (background)';
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

    // Logic for selected item color label default value,
    // custom color selection overrides default label and value.
    String selectedItemColorLabel() {
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
      return 'default (icon onSecondaryContainer, label onSurface)';
    }

    final bool muteUnselectedEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.useFlutterDefaults &&
            controller.navBarSelectedSchemeColor == null &&
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
        !(controller.navBarBackgroundSchemeColor == null &&
            (controller.useFlutterDefaults || controller.useMaterial3));
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
        const NavigationBarShowcase(),
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
          subtitle: Slider.adaptive(
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
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'OPACITY',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '${(navBarOpacity * 100).toStringAsFixed(0)} %',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Height'),
          subtitle: Slider.adaptive(
            min: 54,
            max: 100,
            divisions: 46,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarHeight == null ||
                        (controller.navBarHeight ?? 54) < 55
                    ? controller.useFlutterDefaults
                        ? 'default 80'
                        : 'default 62'
                    : (controller.navBarHeight?.toStringAsFixed(0) ?? '')
                : 'default 80',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navBarHeight ?? 54
                : 54,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setNavBarHeight(value < 55 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.navBarHeight == null ||
                              (controller.navBarHeight ?? 54) < 55
                          ? controller.useFlutterDefaults
                              ? 'default 80'
                              : 'default 62'
                          : (controller.navBarHeight?.toStringAsFixed(0) ?? '')
                      : 'default 80',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
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
          subtitle: Slider.adaptive(
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
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OPACITY',
                  style: Theme.of(context).textTheme.bodySmall,
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
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Selected item color'),
          subtitle: const Text('Label and icon, but own properties in API'),
          labelForDefault: selectedItemColorLabel(),
          index: controller.navBarSelectedSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavBarSelectedSchemeColor(null);
                  } else {
                    controller.setNavBarSelectedSchemeColor(
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
        SwitchListTileAdaptive(
          title: const Text('Mute unselected items'),
          subtitle: const Text('Unselected icon and text are less bright. '
              'Shared setting for icon and text, but separate properties '
              'in API'),
          value: controller.navBarMuteUnselected && muteUnselectedEnabled,
          onChanged:
              muteUnselectedEnabled ? controller.setNavBarMuteUnselected : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Label behavior'),
          subtitle: Text(explainLabelStyle(
              controller.useSubThemes && controller.useFlexColorScheme
                  ? controller.navBarLabelBehavior
                  : NavigationDestinationLabelBehavior.alwaysShow)),
          trailing: NavigationBarLabelBehaviorButtons(
            labelBehavior:
                controller.useSubThemes && controller.useFlexColorScheme
                    ? controller.navBarLabelBehavior
                    : NavigationDestinationLabelBehavior.alwaysShow,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setNavBarLabelBehavior
                : null,
          ),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            'More settings with the API',
            style: denseHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            'With the API you can also set the font and icon size individually '
            'on selected and unselected items. Use FlexSubThemesData '
            'properties: bottomNavigationBarSelectedLabelSize, '
            'bottomNavigationBarUnselectedLabelSize, '
            'bottomNavigationBarSelectedIconSize and '
            'bottomNavigationBarUnselectedIconSize.',
            style: denseBody,
          ),
        ),
        SwitchListTileAdaptive(
          dense: true,
          title: const Text('Use Flutter defaults'),
          subtitle: const Text('Undefined values will fall back to '
              'Flutter SDK defaults. Prefer OFF to use FCS defaults. '
              'Here, both selected and unselected color have to be null before '
              'the item colors can fall back to Flutter defaults. '
              'This setting affects many component themes that implement it. '
              'It is included on panels where it has an impact. '
              'See API docs for more info.'),
          value: controller.useFlutterDefaults &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUseFlutterDefaults
              : null,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
