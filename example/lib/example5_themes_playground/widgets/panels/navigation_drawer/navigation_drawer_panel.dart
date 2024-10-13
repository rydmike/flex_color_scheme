import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

class NavigationDrawerPanel extends StatelessWidget {
  const NavigationDrawerPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _drawerM3Spec = Uri(
    scheme: 'https',
    host: 'm3.material.io',
    path: 'components/navigation-drawer/specs',
  );
  static final Uri _drawerWidthIssue123380 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/123380',
  );
  static final Uri _drawerUmbrellaIssue123507 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/123507',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    // Get effective platform default global radius.
    final double? effectiveRadius = ThemeValues.effectiveRadius(controller);
    final String drawerRadiusDefaultLabel =
        controller.drawerBorderRadius == null && effectiveRadius == null
            ? '16 dp'
            : controller.drawerBorderRadius == null && effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String indicatorDefaultLabel =
        controller.drawerIndicatorBorderRadius == null &&
                effectiveRadius == null
            ? 'stadium'
            : controller.drawerIndicatorBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';

    // Keeping the logic for the M2 different logic for width here, in case
    // it is needed again in the future.
    final double derivedIndicatorWidth =
        (controller.drawerWidth ?? (useMaterial3 ? 304 : 304)) - 2 * 12;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('Drawer'),
          subtitleReveal: Text('The Drawer comes in two variants, the vanilla '
              'Drawer, which is an empty Drawer container. You provide '
              'the content. Its theme also control how the '
              'NavigationDrawer looks, since the NavigationDrawer builds '
              'on the Drawer.\n'
              '\n'
              'Default background in Flutter SDK in M3 is colorScheme.surface, '
              'with elevation tint and no shadow. In M2 it has shadow and '
              'uses color theme.canvasColor, that is typically set '
              'to colorScheme.background. FCS component sub-themes use '
              'surface as default color in both M2 and M3 modes.\n'),
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Background color'),
          defaultLabel: 'surfaceContainerLow',
          defaultDisabledLabelM2: 'canvasColor',
          value: controller.drawerBackgroundSchemeColor,
          onChanged: controller.setDrawerBackgroundSchemeColor,
        ),
        const SizedBox(height: 8),
        const DrawerShowcase(explain: false),
        const SizedBox(height: 16),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Radius'),
              value: controller.drawerBorderRadius,
              onChanged: controller.setDrawerBorderRadius,
              min: 0,
              max: 50,
              divisions: 50,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: drawerRadiusDefaultLabel,
              valueDefaultDisabledLabel: useMaterial3 ? '16 dp' : '0 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Elevation'),
              value: controller.drawerElevation,
              onChanged: controller.setDrawerElevation,
              min: 0,
              max: 20,
              divisions: 20,
              valueHeading: 'ELEV',
              valueDecimalPlaces: 0,
              valueDefaultLabel: useMaterial3 ? '1' : '16',
            ),
            isRow: isRow,
          );
        }),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Width'),
          value: controller.drawerWidth,
          onChanged: controller.setDrawerWidth,
          min: 200,
          max: 500,
          divisions: 300,
          valueHeading: 'WIDTH',
          valueDecimalPlaces: 0,
          valueDefaultLabel: '304 dp',
        ),
        ListTileReveal(
          title: const Text('Width issue'),
          dense: true,
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Based on Material-3 ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _drawerM3Spec,
                  text: 'specification of NavigationDrawer',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' it should be 360 dp wide, while Material-2 is '
                      '304 dp in Flutter. '
                      'Due to a bug in Flutter, it defaults to 304 dp in both '
                      'modes in Flutter, at least up to version 3.24.\n'
                      '\n'
                      'FCS before version 8.0 corrected this spec deviation in '
                      'its defaults, but version 8.0 now follows the Flutter '
                      'SDK value of 304 dp in Material-3 mode as well.\n'
                      '\n'
                      'It does so because a 360 dp wide Drawer may be too wide '
                      'for smaller or older phones and the Drawer may '
                      'cover the entire width of the phone. This is not '
                      'desired. The 304 dp M2 spec width is not a bad choice '
                      'in M3 either. Please see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _drawerWidthIssue123380,
                  text: 'issue #123380',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more information and analysis of suitable '
                      'Drawer width on different sized phones.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('NavigationDrawer'),
          subtitleReveal: Text('The NavigationDrawer arrived with Flutter 3.7. '
              'It provides an easy way to make a Material-3 specification '
              'matching Drawer with built-in top level navigation items '
              'and a selected destination indicator.\n'
              '\n'
              'Default Flutter background color is colorScheme.surface, '
              'with addition of elevation tint in Material-3 mode.\n'),
        ),
        const NavigationDrawerShowcase(explain: false),
        const SizedBox(height: 16),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Indicator color'),
              defaultLabel: 'secondaryContainer',
              value: controller.drawerIndicatorSchemeColor,
              onChanged: controller.setDrawerIndicatorSchemeColor,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Opacity'),
              value: controller.drawerIndicatorOpacity,
              onChanged: controller.setDrawerIndicatorOpacity,
              min: 0,
              max: 1,
              divisions: 100,
              valueDisplayScale: 100,
              valueDecimalPlaces: 0,
              valueHeading: 'OPACITY',
              valueUnitLabel: ' %',
              valueDefaultLabel: '100 %',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Indicator radius'),
              value: controller.drawerIndicatorBorderRadius,
              onChanged: controller.setDrawerIndicatorBorderRadius,
              min: 0,
              max: 50,
              divisions: 50,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: indicatorDefaultLabel,
              valueDefaultDisabledLabel: 'stadium',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Width'),
              value: controller.drawerIndicatorWidth,
              onChanged: controller.setDrawerIndicatorWidth,
              min: 200,
              max: 500,
              divisions: 300,
              valueHeading: 'WIDTH',
              valueDecimalPlaces: 0,
              valueDefaultLabel:
                  '${derivedIndicatorWidth.toStringAsFixed(0)} dp',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Selected item'),
              defaultLabel: controller.drawerIndicatorSchemeColor == null
                  ? 'onSecondaryContainer'
                  : SchemeColor
                      .values[FlexSubThemes.onSchemeColor(
                              controller.drawerIndicatorSchemeColor!)
                          .index]
                      .name,
              defaultDisabledLabel: 'onSecondaryContainer',
              value: controller.drawerSelectedItemSchemeColor,
              onChanged: controller.setDrawerSelectedItemSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Unselected item'),
              defaultLabel: controller.drawerBackgroundSchemeColor == null
                  ? 'onSurfaceVariant'
                  : SchemeColor
                      .values[FlexSubThemes.onSchemeColor(
                              controller.drawerBackgroundSchemeColor!,
                              useOnSurfaceVariant: true)
                          .index]
                      .name,
              defaultDisabledLabel: 'onSurfaceVariant',
              value: controller.drawerUnselectedItemSchemeColor,
              onChanged: controller.setDrawerUnselectedItemSchemeColor,
            ),
            isRow: isRow,
          );
        }),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The NavigationDrawer and its Indicator styling has a '
                      'number of minor styling issues in Flutter 3.7 and later '
                      'that limits useful styling options. You can find '
                      'an overview of them and their status in ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _drawerUmbrellaIssue123507,
                  text: 'issue #123507',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. A few of them have been solved, but most '
                      'are open and still impact latest Flutter release.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
