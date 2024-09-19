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
    final bool useMaterial3 = theme.useMaterial3;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final String labelForDefaultSelectedItem = isDark &&
            (!controller.useFlexColorScheme ||
                (controller.bottomNavBarSelectedSchemeColor == null &&
                    controller.bottomNavBarUnselectedSchemeColor == null))
        ? 'secondary'
        : 'primary';
    final String labelForDefaultUnelectedItem =
        enableControl ? 'onSurface' : 'ThemeData.unselectedWidgetColor';

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
          enabled: enableControl,
          title: const Text('Background color'),
          subtitleReveal: const Text('In Material-2 dark mode, the bottom '
              'navigation background color gets an elevation overlay, making '
              'the background color lighter the more it is elevated. This is '
              'the correct behavior for elevated Material surfaces in dark '
              'mode in Material-2. This is most likely where the now mostly '
              'abandoned elevation tint in Material-3 got its inspiration.'
              '\n'
              'The elevation overlay only happens in Material-2 dark mode '
              'when the `applyElevationOverlayColor` is set to true. In '
              'vanilla ThemeData is is false by default, you are supposed to '
              'set it to true when you use Material-2. FlexColorScheme sets '
              'it to true by default, set it to false if you do not want the '
              'elevation overlay in dark mode.\n'
              '\n'
              'Also notice that the elevation overlay is ONLY applied to '
              'elevated Material surfaces when the background color of the '
              'Material has a color value that equals ColorScheme.surface. '
              'For any other color value, the elevation overlay is not '
              'applied.\n'),
          colorSuffix: isDark &&
                  !useMaterial3 &&
                  controller.bottomNavBarBackgroundSchemeColor ==
                      SchemeColor.surface &&
                  controller.bottomNavigationBarElevation != 0
              ? ', with dark elevation overlay'
              : '',
          defaultLabel: 'surface',
          defaultLabelDarkM2: controller.bottomNavigationBarElevation != 0
              ? 'surface, with dark elevation overlay'
              : 'surface',
          defaultDisabledLabel:
              !controller.useSubThemes && controller.useFlexColorScheme
                  ? 'surface'
                  : 'ThemeData.canvasColor',
          defaultDisabledLabelDark: 'surface',
          defaultDisabledLabelDarkM2:
              !controller.useSubThemes && controller.useFlexColorScheme
                  ? 'surface, with dark elevation overlay'
                  : 'ThemeData.canvasColor, with dark elevation overlay',
          value: controller.bottomNavBarBackgroundSchemeColor,
          onChanged: controller.setBottomNavBarBackgroundSchemeColor,
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
          enabled: enableControl,
          title: const Text('Selected item color'),
          subtitle: const Text('Label and icon, but separate API'),
          defaultLabel: labelForDefaultSelectedItem,
          value: controller.bottomNavBarSelectedSchemeColor,
          onChanged: controller.setBottomNavBarSelectedSchemeColor,
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Unselected item color'),
          subtitle: const Text('Label and icon, but separate API'),
          defaultLabel: labelForDefaultUnelectedItem,
          value: controller.bottomNavBarUnselectedSchemeColor,
          onChanged: controller.setBottomNavBarUnselectedSchemeColor,
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
