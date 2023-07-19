import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_theme.dart';
import '../../../../shared/widgets/universal/flex_squircle.dart';
import '../../../../shared/widgets/universal/flex_stadium_squircle.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../shared/adaptive_theme_popup_menu.dart';
import '../../shared/back_to_actual_platform.dart';
import '../../shared/is_web_list_tile.dart';
import '../../shared/platform_popup_menu.dart';

// Panel used to turn usage ON/OFF usage of opinionated component sub-themes.
//
// Settings are available for border radius and a few other options.
class ShapeRadiusSettings extends StatelessWidget {
  const ShapeRadiusSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color shapeColor = theme.colorScheme.primaryContainer;
    final Color onShapeColor = theme.colorScheme.onPrimaryContainer;

    final bool useMaterial3 = theme.useMaterial3;
    const double height = 90;
    const double width = 200;

    final double radius =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.defaultRadius ?? (useMaterial3 ? 12 : 4)
            : (useMaterial3 ? 12 : 4);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Components shape'),
          subtitleDense: true,
          subtitle: const Text(
            'By default Material UI widgets with ShapeBorder use circular '
            'corners or half-circle stadium shapes, via the ShapeBorder '
            'called RoundedRectangleBorder and StadiumBorder. '
            'Currently in FCS you cannot change the used ShapeBorder type.\n'
            '\n'
            'FlexColorScheme plans to support using "Squircle" '
            'shape, a type of super-ellipses corner shape used by Apple '
            'on iOS. This will be supported via custom SquircleBorder and '
            'SquircleStadiumBorder implementations. If Flutter SDK at some '
            'point starts supporting a version of this shape, it will be '
            'supported too. The planned custom implementation may then be '
            'deprecated if the shapes are identical or very close.\n'
            '\n'
            'FCS also plans to support using other built-in shapes, like '
            'an alternative corner ShapeBorder in Flutter, '
            'called ContinuousRectangleBorder. It was originally added '
            'in Flutter to provide a Squircle implementation in, but it is '
            'a very poor match for the version used by Apple on iOS. If you '
            'multiply used border radius with 2.35, it becomes a closer match, '
            'but not exactly.\n'
            '\n'
            'A beveled shape BeveledRectangleBorder, is also available in the '
            'Flutter SDK.',
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              Material(
                clipBehavior: Clip.antiAlias,
                color: shapeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      'Circular\n(Flutter SDK)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: onShapeColor),
                    ),
                  ),
                ),
              ),
              Material(
                clipBehavior: Clip.antiAlias,
                color: shapeColor,
                shape: SquircleBorder(cornerRadius: radius),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      'Squircle\n(Custom)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: onShapeColor),
                    ),
                  ),
                ),
              ),
              Material(
                clipBehavior: Clip.antiAlias,
                color: shapeColor,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      'ContinuousRectangle\n(Flutter SDK)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: onShapeColor),
                    ),
                  ),
                ),
              ),
              Material(
                clipBehavior: Clip.antiAlias,
                color: shapeColor,
                shape: const StadiumBorder(),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      'Circular Stadium\n(Flutter SDK)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: onShapeColor),
                    ),
                  ),
                ),
              ),
              Material(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: shapeColor,
                shape: const SquircleStadiumBorder(),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      'Squircle Stadium\n(Custom)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: onShapeColor),
                    ),
                  ),
                ),
              ),
              Material(
                clipBehavior: Clip.antiAlias,
                color: shapeColor,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      'Beveled Corner\n(Flutter SDK)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: onShapeColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Components border radius'),
          subtitleDense: true,
          subtitle: const Text(
            'By default, the border radius on all Material '
            'UI components in FCS follow the Material-3 design guide in M3 '
            'mode. The defaults used by FCS for Material-2 mode, are also '
            'mostly Material-3 inspired.\n'
            '\n'
            'Radius specification in Material-3 design varies per component '
            'type. '
            'Material-2 specification used 4 dp on all components. To use M2 '
            'specification, set this value to 4. '
            'If you set a value, all major Material UI components will use '
            'it as its border radius. You can also override used radius per '
            'component, it will then use its own value, regardless of '
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
            'and considered "large", it is thus included in the global border '
            'radius override.',
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: Slider(
            min: -1,
            max: 100,
            divisions: 101,
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
        ListTileReveal(
          enabled: controller.useSubThemes &&
              controller.useFlexColorScheme &&
              controller.adaptiveRadius != AdaptiveTheme.off &&
              controller.adaptiveRadius != null,
          title: const Text('Adaptive border radius'),
          subtitleDense: true,
          subtitle: const Text('You can define a separate global border radius '
              'override that gets used adaptively on selected platforms. This '
              'is useful if you for example want to keep M3 design radius on '
              'for example Android platform, but want a less rounded border '
              'radius design on other platforms.'),
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
        AdaptiveThemePopupMenu(
          title: const Text('Use platform adaptive border radius'),
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
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        IsWebListTile(controller: controller),
        BackToActualPlatform(controller: controller),
        const Divider(),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Shape outline borders'),
          subtitleDense: true,
          subtitle: const Text(
            'Some Material UI components like ToggleButtons, SegmentedButton, '
            'OutlinedButton and TextField use an outline border on their '
            'shape. With these '
            'settings you can modify their thickness values with one common '
            'config. You can also define and override these value per '
            "component in each component's settings.\n"
            '\n'
            'ThemesPlayground and FlexColorScheme does not enable defining '
            'outline borders for widgets that do not use them by default. '
            'With custom component themes, that have a shape property, you '
            'can do that if you so desire.\n',
          ),
        ),
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
                              ? 'default 1&2'
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
      ],
    );
  }
}
