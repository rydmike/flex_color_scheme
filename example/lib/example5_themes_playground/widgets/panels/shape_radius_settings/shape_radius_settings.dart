import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/adaptive_theme.dart';
import '../../../../shared/controllers/theme_controller.dart';
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
    final bool isLight = theme.brightness == Brightness.light;
    final Color shapeColor =
        isLight ? theme.colorScheme.outlineVariant : theme.colorScheme.outline;
    final Color lineColorError = theme.colorScheme.error;
    final Color onShapeColor = theme.colorScheme.onSurface;

    final bool useMaterial3 = theme.useMaterial3;
    const double height = 80;
    const double width = 190;
    const double heightBig = 160;
    const double widthBig = 320;
    const double lineWidth = 1.5;

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
            'You can change the used ShapeBorder type.\n'
            '\n'
            'FlexColorScheme supports using "Squircle" '
            'shape, a type of super-ellipses corner shape used by '
            'Apple on iOS. This is supported via custom SquircleBorder and '
            'SquircleStadiumBorder implementations. If Flutter SDK at some '
            'point starts supporting a version of this shape, it will be '
            'supported as well. This custom implementation may then later be '
            'deprecated if the shapes are identical or very close. The '
            'custom version will be kept around for many version in parallel.\n'
            '\n'
            'You can also use an alternative corner ShapeBorder in Flutter, '
            'called ContinuousRectangleBorder. It was originally added '
            'in Flutter to provide a Squircle implementation in, but it is '
            'a very poor match for the version used by Apple on iOS. If you '
            'multiply used border radius with 2.35, it becomes a closer match, '
            'but not exactly.\n'
            '\n'
            'A beveled shape BeveledRectangleBorder, is also available.\n'
            '\n'
            'You could use the Circular shape as default main shape, and '
            'e.g. on iOS and macOS use the Squircle shape.\n',
          ),
        ),
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
                      'Circular',
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
                      'Squircle',
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
                      'ContinuousRectangle',
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
                      'Circular Stadium',
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
                      'Squircle Stadium',
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
                      'Beveled Corner',
                      style: TextStyle(color: onShapeColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Components border radius'),
          subtitleDense: true,
          subtitle: const Text(
            'By default, the border radius on all Material '
            'UI components in FCS follow the Material-3 design guide in M3 '
            'mode. The defaults used by FCS for M2 mode, are also mostly M3 '
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: <Widget>[
              Material(
                clipBehavior: Clip.antiAlias,
                color: shapeColor,
                shape: SquircleBorder(cornerRadius: radius),
                child: SizedBox(
                  height: heightBig,
                  width: widthBig,
                  child: Center(
                    child: Text(
                      'Squircle background '
                      '(h=${heightBig.toStringAsFixed(0)})\n'
                      'ContinuousRectangleBorder red outline\n'
                      'using radius x 2.3529',
                      style: TextStyle(color: onShapeColor),
                    ),
                  ),
                ),
              ),
              // Material(
              //   clipBehavior: Clip.antiAlias,
              //   color: Colors.transparent,
              //   shape: BeveledRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(radius)),
              //    side: BorderSide(width: lineWidth, color: lineColorPrimary),
              //   ),
              //   child: const SizedBox(
              //     height: heightBig,
              //     width: widthBig,
              //   ),
              // ),
              // Material(
              //   clipBehavior: Clip.antiAlias,
              //   color: Colors.transparent,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(radius)),
              //   ide: BorderSide(width: lineWidth, color: lineColorOnSurface),
              //   ),
              //   child: const SizedBox(
              //     height: heightBig,
              //     width: widthBig,
              //   ),
              // ),
              Material(
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                shape: ContinuousRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius * 2.3529)),
                  side: BorderSide(width: lineWidth, color: lineColorError),
                ),
                child: const SizedBox(
                  height: heightBig,
                  width: widthBig,
                ),
              ),

              //   Material(
              //     clipBehavior: Clip.antiAliasWithSaveLayer,
              //     color: shapeColor,
              //     shape: const StadiumBorder(),
              //     child: SizedBox(
              //       height: height,
              //       width: width,
              //       child: Center(
              //         child: Text(
              //           'Circular Stadium',
              //           style: TextStyle(color: onShapeColor),
              //         ),
              //       ),
              //     ),
              //   ),
              //   Material(
              //     clipBehavior: Clip.antiAliasWithSaveLayer,
              //     color: shapeColor,
              //     shape: const SquircleStadiumBorder(),
              //     child: SizedBox(
              //       height: height,
              //       width: width,
              //       child: Center(
              //         child: Text(
              //           'Squircle Stadium',
              //           style: TextStyle(color: onShapeColor),
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('Platform adaptive settings'),
          // subtitleDense: true,
          subtitle: Text('With platform adaptive settings you can modify theme '
              'properties to have a different response on selected platforms. '
              'You can select which platforms the platform adaptive value '
              'should be used on. While all other platforms not included '
              'in this choice, will continue to use the none adaptive '
              'value or default behavior.\n'
              '\n'
              'Using the API you can customize which platform an adaptive '
              'feature is used on, including separate definitions when using '
              'the app in a web build on each platform. The selections here '
              'use built-in combinations, they cover most use cases.'),
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
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        IsWebListTile(controller: controller),
        BackToActualPlatform(controller: controller),
      ],
    );
  }
}
