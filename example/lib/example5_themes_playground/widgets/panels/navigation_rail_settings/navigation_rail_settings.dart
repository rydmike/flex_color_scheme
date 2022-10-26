import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/navigation_rail_label_type_buttons.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class NavigationRailSettings extends StatelessWidget {
  const NavigationRailSettings(this.controller, {super.key});
  final ThemeController controller;

  String explainLabelStyle(final NavigationRailLabelType labelStyle) {
    switch (labelStyle) {
      case NavigationRailLabelType.none:
        return 'Items have no labels';
      case NavigationRailLabelType.selected:
        return 'Only selected item has a label';
      case NavigationRailLabelType.all:
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
        return 'default (primary)';
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
        return 'default (primary)';
      }
      // All other cases will use M3 style.
      return 'default (icon onSecondaryContainer, label onSurface)';
    }

    // const String labelForDefaultSelectedItem = 'default (primary)';
    final bool muteUnselectedEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.useFlutterDefaults &&
            controller.navRailSelectedSchemeColor == null &&
            controller.navRailUnselectedSchemeColor == null);

    // Logic for unselected item color label default value,
    // custom color selection overrides default label and value.
    String unselectedItemColorLabel() {
      // Use FCS component default, onSurface with muted label.
      if (!controller.useFlutterDefaults &&
          controller.useFlexColorScheme &&
          controller.useSubThemes &&
          controller.navRailMuteUnselected &&
          muteUnselectedEnabled) {
        return 'default (onSurface, with blend & opacity)';
      }
      // Use FCS component default, onSurface.
      if (!controller.useMaterial3 && controller.useFlutterDefaults) {
        return 'default (onSurface, with opacity 64%)';
      }
      // Use M2 default, onSurface.
      if (!controller.useMaterial3) {
        return 'default (onSurface)';
      }
      // All other cases will use M3 style.
      return 'default (icon onSurfaceVariant, label onSurface)';
    }

    final bool navRailOpacityEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        !(controller.navRailBackgroundSchemeColor == null &&
            controller.useFlutterDefaults);
    final double navRailOpacity =
        navRailOpacityEnabled ? controller.navRailOpacity : 1;
    final bool navRailIndicatorOpacityEnabled =
        controller.navRailUseIndicator &&
            controller.useSubThemes &&
            controller.useFlexColorScheme &&
            !(controller.navRailIndicatorSchemeColor == null &&
                controller.useFlutterDefaults);
    final double navRailIndicatorOpacity = navRailIndicatorOpacityEnabled
        ? (controller.navRailIndicatorOpacity ?? -0.01)
        : -0.01;
    final double navRailElevation =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.navigationRailElevation
            : 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: !controller.useSubThemes ||
                  !controller.useFlexColorScheme ||
                  (controller.useFlutterDefaults &&
                      controller.navRailBackgroundSchemeColor == null)
              ? 'default (surface)'
              : 'default (background)',
          index: controller.navRailBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavRailBackgroundSchemeColor(null);
                  } else {
                    controller.setNavRailBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: navRailOpacityEnabled,
          title: const Text('Background opacity'),
          subtitle: Slider.adaptive(
            max: 100,
            divisions: 100,
            label: (navRailOpacity * 100).toStringAsFixed(0),
            value: navRailOpacity * 100,
            onChanged: navRailOpacityEnabled
                ? (double value) {
                    controller.setNavRailOpacity(value / 100);
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
                  '${(navRailOpacity * 100).toStringAsFixed(0)} %',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        // const Divider(),
        ListTile(
          title: const Text('Elevation'),
          subtitle: Slider.adaptive(
            max: 24,
            divisions: 48,
            label: navRailElevation.toStringAsFixed(1),
            value: navRailElevation,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setNavigationRailElevation
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  navRailElevation.toStringAsFixed(1),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SwitchListTileAdaptive(
          title: const Text('Use selection indicator'),
          subtitle: const Text('On by default when useMaterial3 '
              'is true, turn OFF component themes to see this'),
          value: controller.navRailUseIndicator &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setNavRailUseIndicator
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Selection indicator color'),
          labelForDefault: indicatorColorLabel(),
          index: controller.navRailIndicatorSchemeColor?.index ?? -1,
          onChanged: controller.navRailUseIndicator &&
                  controller.useSubThemes &&
                  controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setNavRailIndicatorSchemeColor(null);
                  } else {
                    controller.setNavRailIndicatorSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: navRailIndicatorOpacityEnabled,
          title: const Text('Selection indicator opacity'),
          subtitle: Slider.adaptive(
            min: -1,
            max: 100,
            divisions: 101,
            label: navRailIndicatorOpacityEnabled
                ? controller.navRailIndicatorOpacity == null ||
                        (controller.navRailIndicatorOpacity ?? -1) < 0
                    ? 'default 24%'
                    : (navRailIndicatorOpacity * 100).toStringAsFixed(0)
                : 'default 24%',
            value: navRailIndicatorOpacity * 100,
            onChanged: navRailIndicatorOpacityEnabled
                ? (double value) {
                    controller.setNavRailIndicatorOpacity(
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
                  navRailIndicatorOpacityEnabled
                      ? controller.navRailIndicatorOpacity == null ||
                              (controller.navRailIndicatorOpacity ?? -1) < 0
                          ? 'default 24%'
                          // ignore: lines_longer_than_80_chars
                          : '${(navRailIndicatorOpacity * 100).toStringAsFixed(0)} %'
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
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Labels when rail is collapsed'),
          subtitle: Text(explainLabelStyle(
              controller.useSubThemes && controller.useFlexColorScheme
                  ? controller.navRailLabelType
                  : NavigationRailLabelType.none)),
          trailing: NavigationRailLabelTypeButtons(
            style: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.navRailLabelType
                : NavigationRailLabelType.none,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setNavRailLabelType
                : null,
          ),
        ),
        NavigationRailShowcase(
          height: 700,
          // TODO(rydmike): Raise Flutter issue about this too eager assert.
          // This is used as a work around to avoid unnecessarily eager
          // assert in SDK.
          // Assertion: line 562: 'useIndicator || indicatorColor == null'
          // A flag is used to do trickery with transparency for this
          // assertion that we cannot avoid since the theme controls the
          // setup and user it. User may enter combo that has no effect, and
          // triggers the assert.
          // It should be obvious that if you have no indicator color
          // you cannot use an indicator, why assert it? Just don't show one!
          useAssertWorkAround:
              (!controller.useSubThemes || !controller.useFlexColorScheme) &&
                  !controller.useMaterial3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ColorSchemePopupMenu(
                title: const Text('Selected item color'),
                subtitle:
                    const Text('Label and icon, but own properties in API'),
                labelForDefault: selectedItemColorLabel(),
                index: controller.navRailSelectedSchemeColor?.index ?? -1,
                onChanged: controller.useSubThemes &&
                        controller.useFlexColorScheme
                    ? (int index) {
                        if (index < 0 || index >= SchemeColor.values.length) {
                          controller.setNavRailSelectedSchemeColor(null);
                        } else {
                          controller.setNavRailSelectedSchemeColor(
                              SchemeColor.values[index]);
                        }
                      }
                    : null,
              ),
              ColorSchemePopupMenu(
                title: const Text('Unselected item color'),
                subtitle:
                    const Text('Label and icon, but own properties in API'),
                labelForDefault: unselectedItemColorLabel(),
                index: controller.navRailUnselectedSchemeColor?.index ?? -1,
                onChanged: controller.useSubThemes &&
                        controller.useFlexColorScheme
                    ? (int index) {
                        if (index < 0 || index >= SchemeColor.values.length) {
                          controller.setNavRailUnselectedSchemeColor(null);
                        } else {
                          controller.setNavRailUnselectedSchemeColor(
                              SchemeColor.values[index]);
                        }
                      }
                    : null,
              ),
              SwitchListTileAdaptive(
                title: const Text('Mute unselected items'),
                subtitle: const Text(
                    'Unselected icon and text are less bright. Shared '
                    'setting for icon and text, but separate properties '
                    'in API'),
                value: muteUnselectedEnabled
                    ? controller.navRailMuteUnselected
                    : !muteUnselectedEnabled,
                onChanged: muteUnselectedEnabled
                    ? controller.setNavRailMuteUnselected
                    : null,
              ),
              const Divider(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  'More settings with the API',
                  style: denseHeader,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  'With the API you can also set the font and icon size '
                  'individually on selected and unselected items. Use '
                  'FlexSubThemesData properties: '
                  'navigationRailSelectedLabelSize, '
                  'navigationRailUnselectedLabelSize, '
                  'navigationRailSelectedIconSize and '
                  'navigationRailUnselectedIconSize.',
                  style: denseBody,
                ),
              ),
              SwitchListTileAdaptive(
                dense: true,
                title: const Text('Use Flutter defaults'),
                subtitle: const Text('Undefined values will fall back to '
                    'Flutter SDK defaults. Prefer OFF to use FCS defaults. '
                    'Here, both selected and unselected color have to be null '
                    'before the item colors can fall back to Flutter defaults. '
                    'This setting affects many component themes that implement '
                    'it. It is included on panels where it has an impact. '
                    'See API docs for more info.'),
                value: controller.useFlutterDefaults &&
                    controller.useSubThemes &&
                    controller.useFlexColorScheme,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? controller.setUseFlutterDefaults
                        : null,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}
