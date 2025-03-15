import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_response.dart';
import '../../../../shared/widgets/universal/flex_squircle.dart';
import '../../../../shared/widgets/universal/flex_stadium_squircle.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/test_adaptive_response.dart';

// Panel used to turn usage ON/OFF usage of opinionated component sub-themes.
//
// Settings are available for border radius and a few other options.
class ShapeRadiusPanel extends StatelessWidget {
  const ShapeRadiusPanel(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final Color shapeColor = theme.colorScheme.primaryContainer;
    final Color onShapeColor = theme.colorScheme.onPrimaryContainer;
    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;
    const double height = 90;
    const double width = 200;

    // Get effective platform default global radius.
    // Used on the shapes presentation.
    final double radius = ThemeValues.effectiveRadius(controller) ??
        (enableControl ? 12 : (useMaterial3 ? 12 : 4));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Components shape'),
          subtitleReveal: const Text(
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
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Global radius'),
              subtitleReveal: const Text(
                'The global default radius used by most components with a '
                'shape.\n'
                '\n'
                'By default, the border radius on all Material '
                'UI components in FCS follow the Material-3 design guide in '
                'M3 mode. The defaults used by FCS for Material-2 mode, are '
                'also mostly Material-3 inspired.\n'
                '\n'
                'Radius specification in Material-3 design varies per '
                'component type. Material-2 specification used 4 dp on all '
                'components. To use M2 specification, set this value to 4. '
                'If you set a value, all major Material UI components will '
                'use it as its border radius. You can also override used '
                'radius per component, it will then use its own value, '
                'regardless of what is defined here.\n'
                '\n'
                'Radius on very small elements, or components where changing '
                'it to a high radius is a bad idea, are not included in this '
                'global radius override. This includes PopupMenuButton, '
                'Menu, MenuBar, SubmenuButton, MenuItemButton, ToolTip, the '
                'small indicators on NavigationBar and NavigationRail, as '
                'well as the SnackBar. The very distinct '
                'FloatingActionButton can be included, but is not by '
                'default. The radius on these elements can still be themed, '
                'but only individually. The indicator on NavigationDrawer is '
                'button sized and considered "large", it is thus included in '
                'the global default border radius setting.',
              ),
              value: controller.defaultRadius,
              onChanged: controller.setDefaultRadius,
              min: 0,
              max: 100,
              divisions: 100,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: 'M3 values',
              valueDefaultDisabledLabel: useMaterial3 ? 'M3 values' : '4 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl &&
                  controller.adaptiveResponseRadius != AdaptiveResponse.off &&
                  controller.adaptiveResponseRadius != null,
              title: const Text('Adaptive radius'),
              subtitleReveal: const Text(
                'You can define a separate global border radius '
                'override that gets used adaptively on selected platforms. '
                'This is useful if you for example want to keep Material-3 '
                'design radius on for the Android platform, but want another '
                'border radius design on other platforms.',
              ),
              value: controller.defaultRadiusAdaptive,
              onChanged: controller.setDefaultRadiusAdaptive,
              min: 0,
              max: 100,
              divisions: 100,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: 'M3 values',
              valueDefaultDisabledLabel: !enableControl
                  ? useMaterial3
                      ? 'M3 values'
                      : '4 dp'
                  : 'OFF',
            ),
            isRow: isRow,
          );
        }),
        EnumPopupMenu<AdaptiveResponse>(
          enabled: enableControl,
          values: AdaptiveResponse.values,
          title: const Text('Adaptive response'),
          subtitleReveal: Text(
            controller.adaptiveResponseRadius?.describe ??
                AdaptiveResponse.off.describe,
          ),
          value: controller.adaptiveResponseRadius,
          onChanged: controller.setAdaptiveResponseRadius,
        ),
        TestAdaptiveResponse(controller),
        const Divider(),
        ListTileReveal(
          enabled: enableControl,
          title: const Text('Shape outline borders'),
          subtitleReveal: const Text(
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
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Standard width'),
              subtitleReveal: const Text(
                'Standard border width used as default by InputDecorator, '
                'OutlinedButton, ToggleButtons and SegmentedButton.\n',
              ),
              value: controller.thinBorderWidth,
              onChanged: controller.setThinBorderWidth,
              min: 0.5,
              max: 6,
              divisions: 11,
              valueDecimalPlaces: 1,
              valueHeading: 'WIDTH',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '1 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Thicker width'),
              subtitleReveal: const Text(
                'Thicker border width used as default by focused '
                'InputDecorator and pressed or error OutlinedButton.\n',
              ),
              value: controller.thickBorderWidth,
              onChanged: controller.setThickBorderWidth,
              min: 0.5,
              max: 6,
              divisions: 11,
              valueDecimalPlaces: 1,
              valueHeading: 'WIDTH',
              valueUnitLabel: ' dp',
              valueDefaultLabel: useMaterial3 ? '1 & 2 dp' : '2 dp',
              valueDefaultDisabledLabel: '1 & 2 dp',
            ),
            isRow: isRow,
          );
        }),
      ],
    );
  }
}
