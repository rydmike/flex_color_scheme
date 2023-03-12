import 'package:flutter/material.dart';

import '../../../../shared/const/adaptive_theme.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../shared/adaptive_theme_popup_menu.dart';
import '../../shared/back_to_actual_platform.dart';
import '../../shared/is_web_list_tile.dart';
import '../../shared/platform_popup_menu.dart';
import '../../shared/use_tinted_text_theme.dart';

// Panel used to turn usage ON/OFF usage of opinionated component sub-themes.
//
// Settings are available for border radius and a few other options.
class ComponentSettings extends StatelessWidget {
  const ComponentSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text('Use component sub themes'),
          subtitle: const Text("FlexColorScheme's M2 mode is very opinionated. "
              'Components look almost like M3, but done in M2 mode. '
              'In M3 mode there are only a few subtle nuance differences to '
              'default M3 style, and some fixes to Flutter M3 '
              'specification styling bugs.'),
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        SwitchListTile(
          title: const Text('Use Material 2 style divider in Material 3'),
          subtitle: const Text('In M3 the primary color tinted outlineVariant '
              'may not fit on all background colors. The M2 style based on '
              'black or white with opacity does. It is also less prominent '
              'than the M3 style and may be preferred.'),
          value: controller.useM2StyleDividerInM3 &&
              controller.useSubThemes &&
              controller.useMaterial3 &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes &&
                  controller.useFlexColorScheme &&
                  controller.useMaterial3
              ? controller.setUseM2StyleDividerInM3
              : null,
        ),
        const Divider(),
        UseTinted3TextTheme(controller: controller),
        SwitchListTile(
          title: const Text('Tinted disabled components'),
          subtitle: const Text('Disabled controls get a slight primary color '
              'tint or tint of its own color, if it is not primary colored. '
              'Turn OFF for Flutter grey defaults'),
          value: controller.tintedDisabledControls &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setTintedDisabledControls
              : null,
        ),
        ListTile(
          dense: true,
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: const Text(
            'Impacts ThemeData disabledColor, but also disabled state color on '
            'all individual components. Material 3 UI components typically '
            'ignore the ThemeData disabledColor. Their disabled styling is '
            'defined on component themes. This settings also applies disabled '
            'tint on all components that supports it.',
          ),
        ),
        SwitchListTile(
          title: const Text('Tinted interaction effects'),
          subtitle: const Text('Hover, focus, highlight, pressed and splash '
              'colors get a slight primary color tint, or tint of its '
              'own color, if it is not primary colored. '
              'Turn OFF for Flutter grey defaults.'),
          value: controller.interactionEffects &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInteractionEffects
              : null,
        ),
        ListTile(
          dense: true,
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: const Text(
            'Impacts ThemeData hover, focus, highlight and splash colors. '
            'Material 3 components implement their own interaction '
            'effects. This setting also styles all of them on component theme '
            'level. Most components are covered, a few cases may not be fully '
            'supported due to lacking support in the Flutter framework. Their '
            'later inclusion in this setting will be reported as new features, '
            'not as style breaking.',
          ),
        ),
        const Divider(),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius on all components'),
          subtitle: const Text('By default border radius on all Material UI '
              'components follow the Material 3 design guide in M3 mode. The '
              'defaults used by FCS for M2 mode are also mostly M3 inspired.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
            min: -1,
            max: 60,
            divisions: 61,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.defaultRadius == null ||
                        (controller.defaultRadius ?? -1) < 0
                    ? 'M3 defaults'
                    : (controller.defaultRadius?.toStringAsFixed(0) ?? '')
                : useMaterial3
                    ? 'M3 defaults'
                    : 'M2 default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.defaultRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setDefaultRadius(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.defaultRadius == null ||
                              (controller.defaultRadius ?? -1) < 0
                          ? 'M3 defaults'
                          : (controller.defaultRadius?.toStringAsFixed(0) ?? '')
                      : useMaterial3
                          ? 'M3 defaults'
                          : 'M2 default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          dense: true,
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: const Text(
            'Radius specification in M3 varies per component. '
            'Material 2 specification used 4 dp on all components. To use M2 '
            'specification, set this value to 4. '
            'If you set a value, all major Material UI components will use '
            'it as their border radius. You can also set radius per '
            'component, they will then use their own value, regardless of '
            'what is defined here.\n'
            'Radius on very small elements or components where changing it '
            'to a high radius is a bad idea are not included in the default '
            'radius override. This includes PopupMenuButton, Menu, '
            'MenuBar, SubmenuButton, MenuItemButton, ToolTip, the small '
            'indicators on NavigationBar and '
            'NavigationRail, as well as the SnackBar. The very distinct '
            'FloatingActionButton can be included, but is not by default. '
            'The radius on these elements can still be themed, but only '
            'individually. The indicator on NavigationDrawer is button sized '
            'and considered large, it is thus included in the global border '
            'radius override.',
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Platform adaptive border radius override'),
          subtitle: const Text('You can define a separate global '
              'border radius override that gets used adaptively on selected '
              'platforms. Useful if you for example want to keep '
              'M3 design radius on Android platform, but want a '
              'less rounded design on other platforms.'),
        ),
        AdaptiveThemePopupMenu(
          title: const Text('Adaptive default border radius usage'),
          index: controller.adaptiveRadius?.index ?? -1,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? (int index) {
                  if (index < 0 || index >= AdaptiveTheme.values.length) {
                    controller.setAdaptiveRadius(null);
                  } else {
                    controller.setAdaptiveRadius(AdaptiveTheme.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Adaptive default border radius override'),
          subtitle: Slider(
            min: -1,
            max: 60,
            divisions: 61,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.defaultRadiusAdaptive == null ||
                        (controller.defaultRadiusAdaptive ?? -1) < 0 ||
                        controller.adaptiveRadius == null ||
                        controller.adaptiveRadius == AdaptiveTheme.off
                    ? 'M3 defaults'
                    : (controller.defaultRadiusAdaptive?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'M3 defaults'
                    : 'M2 default 4',
            value: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.adaptiveRadius != null &&
                    controller.adaptiveRadius != AdaptiveTheme.off
                ? controller.defaultRadiusAdaptive ?? -1
                : -1,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.adaptiveRadius != null &&
                    controller.adaptiveRadius != AdaptiveTheme.off
                ? (double value) {
                    controller.setDefaultRadiusAdaptive(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes &&
                          controller.useFlexColorScheme &&
                          controller.adaptiveRadius != null &&
                          controller.adaptiveRadius != AdaptiveTheme.off
                      ? controller.defaultRadiusAdaptive == null ||
                              (controller.defaultRadiusAdaptive ?? -1) < 0
                          ? 'M3 defaults'
                          : (controller.defaultRadiusAdaptive
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'M3 defaults'
                          : 'M2 default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          dense: true,
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: const Text(
            'With the API you can define which platform an adaptive '
            'feature is used on, including separate definitions when '
            'using the app in a web build on each platform. The above '
            'selections are using built-in preconfigured constructors, they '
            'probably cover most use cases.',
          ),
        ),
        const Divider(),
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        IsWebListTile(controller: controller),
        BackToActualPlatform(controller: controller),
        const Divider(),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border width'),
          subtitle: const Text('Default border width for InputDecorator, '
              'OutlinedButton, ToggleButtons and SegmentedButton.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thinBorderWidth == null ||
                        (controller.thinBorderWidth ?? 0) <= 0
                    ? 'default 1'
                    : (controller.thinBorderWidth?.toStringAsFixed(1) ?? '')
                : 'default 1',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thinBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setThinBorderWidth(value <= 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.thinBorderWidth == null ||
                              (controller.thinBorderWidth ?? 0) < 0
                          ? controller.useMaterial3
                              ? 'default 1' // M3
                              : 'default 1' // M2
                          : (controller.thinBorderWidth?.toStringAsFixed(1) ??
                              '')
                      : 'default 1',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Thick border width'),
          subtitle: const Text('Default border width for focused '
              'InputDecorator and pressed or error OutlinedButton.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
            min: 0,
            max: 5,
            divisions: 10,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thickBorderWidth == null ||
                        (controller.thickBorderWidth ?? 0) < 0
                    ? useMaterial3
                        ? 'default 1'
                        : 'default 2'
                    : (controller.thickBorderWidth?.toStringAsFixed(1) ?? '')
                : 'default 1',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.thickBorderWidth ?? 0
                : 0,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setThickBorderWidth(value <= 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.thickBorderWidth == null ||
                              (controller.thickBorderWidth ?? 0) <= 0
                          ? useMaterial3
                              ? 'default 1'
                              : 'default 2'
                          : (controller.thickBorderWidth?.toStringAsFixed(1) ??
                              '')
                      : 'default 1',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ShowSubThemeColors(),
        ),
        const ListTile(
          dense: true,
          subtitle: Text("Colors are controlled in each component's "
              'settings panel. Above default or currently selected '
              'ColorScheme based used theme color for each component.'),
        ),
        const Divider(height: 16),
        SwitchListTile(
          dense: true,
          title: const Text('Navigators use Flutter defaults'),
          subtitle: const Text('Undefined sub-theme values will fall '
              'back to Flutter SDK defaults. Prefer OFF to use FCS defaults. '
              'This setting affects BottomNavigationBar, NavigationBar and '
              'NavigationRail. See API docs for more info.'),
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
