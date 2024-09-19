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

    // Paddings for the two column control layouts.
    const EdgeInsetsDirectional paddingStartColumn =
        EdgeInsetsDirectional.only(start: 16, end: 8);
    final EdgeInsetsDirectional paddingEndColumn =
        EdgeInsetsDirectional.only(start: 8, end: useMaterial3 ? 24 : 16);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('NavigationBar colors and styles'),
          subtitleReveal: Text(
            'Default background color in Material 2 is surface with an '
            'onSurface overlay elevation color fixed to level 3. '
            'In M3 default background color is surfaceContainer, no '
            'elevation tint is used since Flutter 3.22. FlexColorScheme uses '
            'surfaceContainer as default background color in both '
            'Material-2 and Material-3 mode, since V8, when component themes '
            'are enabled.\n',
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: NavigationBarShowcase(explain: false),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ColorSchemePopupMenuNew(
                contentPadding: paddingStartColumn,
                enabled: enableControl,
                title: const Text('Background color'),
                defaultLabel: 'surfaceContainer',
                defaultDisabledLabelM2: 'surface with onSurface overlay-3',
                value: controller.navBarBackgroundSchemeColor,
                onChanged: controller.setNavBarBackgroundSchemeColor,
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
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
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingStartColumn,
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
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
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
            ),
          ],
        ),
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ColorSchemePopupMenuNew(
                contentPadding: paddingStartColumn,
                enabled: enableControl,
                title: const Text('Selection indicator color'),
                defaultLabel: 'secondaryContainer',
                defaultDisabledLabelM2: 'secondary opacity 24%',
                value: controller.navBarIndicatorSchemeColor,
                onChanged: controller.setNavBarIndicatorSchemeColor,
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
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
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingStartColumn,
                enabled: enableControl,
                title: const Text('Indicator border radius'),
                value: controller.navBarIndicatorBorderRadius,
                onChanged: controller.setNavBarIndicatorBorderRadius,
                min: 0,
                max: 25,
                divisions: 25,
                valueHeading: 'RADIUS',
                valueUnitLabel: ' dp',
                valueDecimalPlaces: 0,
                valueDefaultLabel: 'stadium',
              ),
            ),
            Expanded(
              child: NavigationBarLabelBehaviorListTile(
                controller: controller,
                contentPadding: paddingEndColumn,
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ColorSchemePopupMenuNew(
                contentPadding: paddingStartColumn,
                enabled: enableControl,
                title: const Text('Selected icon color'),
                defaultLabel: 'onSecondaryContainer',
                defaultDisabledLabelM2: 'onSurface',
                value: controller.navBarSelectedIconSchemeColor,
                onChanged: controller.setNavBarSelectedIconSchemeColor,
              ),
            ),
            Expanded(
              child: ColorSchemePopupMenuNew(
                contentPadding: paddingEndColumn,
                enabled: enableControl,
                title: const Text('Selected label color'),
                defaultLabel: 'onSurface',
                value: controller.navBarSelectedLabelSchemeColor,
                onChanged: controller.setNavBarSelectedLabelSchemeColor,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ColorSchemePopupMenuNew(
                contentPadding: paddingStartColumn,
                enabled: enableControl,
                title: const Text('Unselected item color'),
                subtitle: const Text('Label and icon, but separate API'),
                defaultLabel: 'onSurfaceVariant',
                defaultDisabledLabelM2: 'onSurface',
                value: controller.navBarUnselectedSchemeColor,
                onChanged: controller.setNavBarUnselectedSchemeColor,
              ),
            ),
            Expanded(
              child: SwitchListTileReveal(
                contentPadding: paddingEndColumn,
                enabled: enableControl,
                title: const Text('Mute unselected items'),
                subtitleReveal: const Text(
                    'Unselected icon and text are less bright. '
                    'Shared setting for icon and text, but separate properties '
                    'in the API.\n'),
                value: controller.navBarMuteUnselected,
                onChanged: controller.setNavBarMuteUnselected,
              ),
            ),
          ],
        ),
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
