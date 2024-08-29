import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Panel used to control the sub-theme for BottomNavigationBar.
class BottomNavigationBarSettings extends StatelessWidget {
  const BottomNavigationBarSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final String labelForDefaultSelectedItem = isDark &&
            (!controller.useFlexColorScheme ||
                (controller.bottomNavBarSelectedSchemeColor == null &&
                    controller.bottomNavBarUnselectedSchemeColor == null))
        ? 'default (secondary)'
        : 'default (primary)';
    final String labelForDefaultUnelectedItem = enableControl
        ? 'default (onSurface)'
        : 'default (ThemeData.unselectedWidgetColor)';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('BottomNavigationBar colors and styles'),
          subtitleReveal: Text(
            'Default SDK background color is theme canvasColor via Material. '
            'The canvasColor is typically colorScheme.background, elevation '
            'is 8. FCS sub-theme default is colorScheme.background and '
            'elevation 0.\n',
          ),
        ),
        Card(
          elevation: 0,
          shadowColor: Colors.transparent,
          color: theme.colorScheme.surfaceContainerHighest,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: BottomNavigationBarShowcase(explain: false),
          ),
        ),
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: enableControl
              ? 'default (surface)'
              : 'default (ThemeData.canvasColor)',
          index: controller.bottomNavBarBackgroundSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomNavBarBackgroundSchemeColor(null);
                  } else {
                    controller.setBottomNavBarBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Opacity'),
          value: controller.bottomNavigationBarOpacity,
          onChanged: controller.setBottomNavigationBarOpacity,
          min: 0,
          max: 1,
          divisions: 100,
          valueDisplayScale: 100,
          valueDecimalPlaces: 0,
          valueHeading: 'OPACITY',
          valueUnitLabel: ' %',
          valueDefaultLabel: '100 %',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Elevation'),
          value: controller.bottomNavigationBarElevation,
          onChanged: controller.setBottomNavigationBarElevation,
          min: 0,
          max: 24,
          divisions: 24,
          valueHeading: 'ELEV',
          valueDecimalPlaces: 1,
          valueDefaultLabel: '3',
          valueDefaultDisabledLabel: '8',
        ),
        ColorSchemePopupMenu(
          title: const Text('Selected item color'),
          subtitle: const Text('Label and icon, but own properties in API'),
          labelForDefault: labelForDefaultSelectedItem,
          index: controller.bottomNavBarSelectedSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomNavBarSelectedSchemeColor(null);
                  } else {
                    controller.setBottomNavBarSelectedSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('Unselected item color'),
          subtitle: const Text('Label and icon, but own properties in API'),
          labelForDefault: labelForDefaultUnelectedItem,
          index: controller.bottomNavBarUnselectedSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomNavBarUnselectedSchemeColor(null);
                  } else {
                    controller.setBottomNavBarUnselectedSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SwitchListTileReveal(
          title: const Text('Mute unselected items'),
          subtitleReveal:
              const Text('Unselected icon and text are less bright. '
                  'Shared setting for icon and text in the Playground, but '
                  'separate properties are used by the API.\n'),
          value: enableControl
              ? controller.bottomNavBarMuteUnselected
              : !enableControl,
          onChanged:
              enableControl ? controller.setBottomNavBarMuteUnselected : null,
        ),
        SwitchListTile(
          title: const Text('Show selected labels'),
          value: enableControl && controller.bottomNavShowSelectedLabels,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setBottomNavShowSelectedLabels
              : null,
        ),
        SwitchListTile(
          title: const Text('Show unselected labels'),
          value: enableControl && controller.bottomNavShowUnselectedLabels,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setBottomNavShowUnselectedLabels
              : null,
        ),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitleReveal: Text(
            'With the API you can also set the font and icon size '
            'individually on selected and unselected items. Use '
            'FlexSubThemesData properties: '
            'bottomNavigationBarSelectedLabelSize, '
            'bottomNavigationBarUnselectedLabelSize, '
            'bottomNavigationBarSelectedIconSize and '
            'bottomNavigationBarUnselectedIconSize.\n',
          ),
        ),
      ],
    );
  }
}
