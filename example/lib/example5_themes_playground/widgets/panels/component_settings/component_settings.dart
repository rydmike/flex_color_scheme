import 'package:flutter/material.dart';

import '../../../../shared/const/adaptive_theme.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/adaptive_theme_popup_menu.dart';
import '../../shared/back_to_actual_platform.dart';
import '../../shared/component_colors_reveal.dart';
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
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        SwitchListTileReveal(
          title: const Text('Use M2 style divider in M3'),
          subtitleDense: true,
          subtitle: const Text('In Material-3 the primary color tinted '
              'outlineVariant Divider may not fit on all background colors. '
              'The Material-2 style based on black or white, with opacity, '
              'always fits. It is also '
              'less prominent than the M3 style and may be preferred.\n'),
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
        SwitchListTileReveal(
          title: const Text('Tinted disabled components'),
          subtitleDense: true,
          subtitle: const Text(
            'Disabled controls get a slight primary color '
            'tint or tint of its own color, if it is not primary colored. '
            'Turn OFF for Flutter grey defaults. '
            'Impacts ThemeData disabledColor, but also disabled state color on '
            'all individual components. Material 3 UI components typically '
            'ignore the ThemeData disabledColor. Their disabled styling is '
            'defined on component themes. This settings also applies disabled '
            'tint on all components that supports it.\n',
          ),
          value: controller.tintedDisabledControls &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setTintedDisabledControls
              : null,
        ),
        SwitchListTileReveal(
          title: const Text('Tinted interactions'),
          subtitleDense: true,
          subtitle: const Text(
            'Hover, focus, highlight, pressed and splash '
            'colors get a slight primary color tint, or tint of its '
            'own color, if it is not primary colored. '
            'Turn OFF for Flutter grey defaults. '
            'Impacts ThemeData hover, focus, highlight and splash colors. '
            'Material 3 components implement their own interaction '
            'effects. This setting also styles all of them on component theme '
            'level. Most components are covered, a few cases may not be fully '
            'supported due to lacking support in the Flutter framework. Their '
            'later inclusion in this setting will be reported as new features, '
            'not as style breaking.\n',
          ),
          value: controller.interactionEffects &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInteractionEffects
              : null,
        ),
        const Divider(),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Components border radius'),
          subtitleDense: true,
          subtitle: const Text(
            'By default, the border radius on all Material '
            'UI components in FCS follow the Material-3 design guide in M3 '
            'mode. The defaults used by FCS for M2 mode are also mostly M3 '
            'inspired.\n'
            '\n'
            'Radius specification in M3 varies per component. '
            'Material 2 specification used 4 dp on all components. To use M2 '
            'specification, set this value to 4. '
            'If you set a value, all major Material UI components will use '
            'it as their border radius. You can also set radius per '
            'component, they will then use their own value, regardless of '
            'what is defined here.\n'
            '\n'
            'Radius on very small elements, or components where changing it '
            'to a high radius is a bad idea, are not included in this global '
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
        AdaptiveThemePopupMenu(
          title: const Text('Adaptive radius'),
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
        ListTileReveal(
          enabled: controller.useSubThemes &&
              controller.useFlexColorScheme &&
              controller.adaptiveRadius != AdaptiveTheme.off &&
              controller.adaptiveRadius != null,
          title: const Text('Adaptive border radius'),
          subtitleDense: true,
          subtitle: const Text('You can define a separate global '
              'border radius override that gets used adaptively on above '
              'selected platforms. Useful if you for example want to keep '
              'M3 design radius on Android platform, but want a '
              'less rounded design on other platforms. '
              'With the API you can define which platform an adaptive '
              'feature is used on, including separate definitions when '
              'using the app in a web build on each platform. The above '
              'selections are using built-in preconfigured constructors, they '
              'probably cover most use cases.'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
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
            padding: const EdgeInsetsDirectional.only(end: 5),
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
                      : useMaterial3 ||
                              (controller.useSubThemes &&
                                  controller.useFlexColorScheme)
                          ? 'M3 defaults'
                          : 'M2 default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
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
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border width'),
          subtitleDense: true,
          subtitle: const Text('Default border width for InputDecorator, '
              'OutlinedButton, ToggleButtons and SegmentedButton.\n'),
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
            padding: const EdgeInsetsDirectional.only(end: 5),
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
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Thick border width'),
          subtitleDense: true,
          subtitle: const Text('Default border width for focused '
              'InputDecorator and pressed or error OutlinedButton.\n'),
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
            padding: const EdgeInsetsDirectional.only(end: 5),
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
        const ComponentColorsReveal(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: ShowSubThemeColors(showTitle: false),
        ),
      ],
    );
  }
}
