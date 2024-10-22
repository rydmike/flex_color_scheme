import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_response.dart';
import '../../../../shared/model/splash_type_enum.dart';
import '../../../../shared/model/visual_density_enum.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../theme/theme_values.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/test_adaptive_response.dart';

// Panel used to control the adaptive theme settings.
class AdaptiveThemePanel extends StatelessWidget {
  const AdaptiveThemePanel(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('Platform adaptive response'),
          subtitleReveal: Text(
              'With platform adaptive settings you can modify theme '
              'properties to have a different response on selected platforms.\n'
              '\n'
              'You select which platforms the platform adaptive '
              'value should be used on. All other platforms not included '
              'in this choice, will continue to use the none adaptive '
              'value or default behavior.\n'
              '\n'
              'With the API you can customize which platform an adaptive '
              'response is used on, including separate definitions when using '
              'the app in a web build on each platform. The selections here '
              'use built-in combinations, they cover typical use cases.'),
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            isRow: isRow,
            firstWidget: EnumPopupMenu<VisualDensityEnum>(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: controller.useFlexColorScheme,
              values: VisualDensityEnum.values,
              title: const Text('Visual density'),
              subtitleReveal: Text(
                'Defines the visual density of user interface components. '
                'Density, in the context of a UI, is the vertical and '
                'horizontal "compactness" of the components in the UI. '
                'It is without unit, since it means different things to '
                'different UI components.\n'
                '\n'
                // ignore: lines_longer_than_80_chars
                '${controller.visualDensity?.describe ?? VisualDensityEnum.platform.describe}',
              ),
              value: controller.visualDensity,
              onChanged: controller.setVisualDensity,
            ),
            lastWidget: EnumPopupMenu<MaterialTapTargetSize>(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: controller.useFlexColorScheme,
              values: MaterialTapTargetSize.values,
              title: const Text('Tap target size'),
              subtitleReveal: const Text(
                'Configures the tap target and layout size of Material '
                'widgets.\n'
                '\n'
                'The "padded" selection makes minimum tap size 48x48 dp '
                'and is primarily intended for Mobile touch devices.\n'
                '\n'
                'The "shrinkWrap" selection keeps the tap target size '
                'same as the child size, and is primary intended for Desktop '
                'devices.\n'
                '\n'
                'Impacted Material widgets are:\n'
                'FloatingActionButton (only the mini one), '
                'OutlinedButton, TextButton, ElevatedButton, IconButton, '
                'showTimePicker, SnackBar, Chips, Radio, Switch '
                'and Checkbox.\n'
                '\n',
              ),
              value: controller.tapTargetSize,
              onChanged: controller.setTapTargetSize,
            ),
          );
        }),
        const Divider(),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            isRow: isRow,
            firstWidget: EnumPopupMenu<SplashTypeEnum>(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              values: SplashTypeEnum.values,
              title: const Text('Splash type'),
              subtitleReveal: Text(
                'Defines the type of tap ink splash effect used on Material '
                'UI components.\n'
                '\n'
                // ignore: lines_longer_than_80_chars
                '${controller.splashType?.describe ?? SplashTypeEnum.defaultSplash.describe}',
              ),
              value: controller.splashType,
              onChanged: controller.setSplashType,
            ),
            lastWidget: EnumPopupMenu<SplashTypeEnum>(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl &&
                  controller.adaptiveResponseSplash != AdaptiveResponse.off &&
                  controller.adaptiveResponseSplash != null,
              values: SplashTypeEnum.values,
              title: const Text('Adaptive splash'),
              subtitleReveal: Text(
                'Defines the type of tap ink splash effect response used on '
                'Material UI components when running on selected platforms. '
                'When not running on these platforms or if the platform '
                'adaptive ink feature is OFF, the ink splash effect is '
                'used.\n'
                '\n'
                // ignore: lines_longer_than_80_chars
                '${controller.splashTypeAdaptive?.describe ?? SplashTypeEnum.defaultSplash.describe}',
              ),
              value: controller.splashTypeAdaptive,
              onChanged: controller.setSplashTypeAdaptive,
            ),
          );
        }),
        EnumPopupMenu<AdaptiveResponse>(
          enabled: enableControl,
          values: AdaptiveResponse.values,
          title: const Text('Adaptive response'),
          subtitleReveal: Text(
            'An adaptive theme response used to select a different ink '
            'splash effect on selected platforms.\n'
            '\n'
            // ignore: lines_longer_than_80_chars
            '${controller.adaptiveResponseSplash?.describe ?? AdaptiveResponse.off.describe}',
          ),
          value: controller.adaptiveResponseSplash,
          onChanged: controller.setAdaptiveResponseSplash,
        ),
        const Divider(),
        if (isLight) ...<Widget>[
          EnumPopupMenu<AdaptiveResponse>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveResponse.values,
            title: const Text('Bring elevation shadows back'),
            subtitleReveal: Text(
              'An adaptive theme response to bring elevation shadows back in '
              'Material-3 in light theme mode on selected platforms. '
              'Has no impact in Material-2 mode. '
              'Applies to AppBar, BottomAppBar, BottomSheet, DatePickerDialog, '
              'Dialog, Drawer, NavigationBar, NavigationDrawer.\n'
              '\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveElevationShadowsBackLight?.describe ?? AdaptiveResponse.off.describe}',
            ),
            value: controller.adaptiveElevationShadowsBackLight,
            onChanged: controller.setAdaptiveElevationShadowsBackLight,
          ),
          EnumPopupMenu<AdaptiveResponse>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveResponse.values,
            title: const Text('Remove elevation tint (obsolete)'),
            subtitleReveal: Text(
              'Platform adaptive theme response to remove elevation tint on '
              'elevated surfaces in Material-3 in light theme mode on '
              'selected platforms.\n'
              '\n'
              'OBSOLETE: In Flutter version 3.22 and later, this feature is '
              'no longer needed, as elevation tints are no longer used. '
              'Keeping it around for now, but it is not useful in Flutter 3.22 '
              'and later. We could add a bring surface tints back feature, but '
              'who wants that anyway? :)\n'
              '\n'
              'This setting has no impact in Material-2 mode.\n'
              '\n'
              'Applies to BottomAppBar, BottomSheet, Card, Chip, '
              'DatePickerDialog, Dialog, Drawer, DropdownMenu, MenuBar, '
              'MenuAnchor, NavigationDrawer and PopupMenuButton. There is a '
              'separate tint removal setting for the NavigationBar, as you may '
              'want to keep it ON, even if otherwise removing elevation tint.\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveRemoveElevationTintLight?.describe ?? AdaptiveResponse.off.describe}',
            ),
            value: controller.adaptiveRemoveElevationTintLight,
            onChanged: controller.setAdaptiveRemoveElevationTintLight,
          ),
        ] else ...<Widget>[
          EnumPopupMenu<AdaptiveResponse>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveResponse.values,
            title: const Text('Bring elevation shadows back'),
            subtitleReveal: Text(
              'An adaptive theme response to bring elevation shadows back in '
              'Material-3 in dark theme mode on selected platforms. '
              'Has no impact in Material-2 mode. '
              'Applies to AppBar, BottomAppBar, BottomSheet, DatePickerDialog, '
              'Dialog, Drawer, NavigationBar, NavigationDrawer.\n'
              '\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveElevationShadowsBackDark?.describe ?? AdaptiveResponse.off.describe}',
            ),
            value: controller.adaptiveElevationShadowsBackDark,
            onChanged: controller.setAdaptiveElevationShadowsBackDark,
          ),
          EnumPopupMenu<AdaptiveResponse>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveResponse.values,
            title: const Text('Remove elevation tint (obsolete)'),
            subtitleReveal: Text(
              'Platform adaptive theme response to remove elevation tint on '
              'elevated surfaces in Material-3 in dark theme mode on '
              'selected platforms.\n'
              '\n'
              'OBSOLETE: In Flutter version 3.22 and later, this feature is '
              'no longer needed, as elevation tints are no longer used. '
              'Keeping it around for now, but it is not useful in Flutter 3.22 '
              'and later. We could add a bring surface tints back feature, but '
              'who wants that anyway? :)\n'
              '\n'
              'This setting has no impact in Material-2 mode.\n'
              '\n'
              'Using this was never recommended in dark mode, unless '
              'shadows are also brought back in Flutter prior to version 3.22. '
              'However, even then it is a bad '
              'idea since shadows are not very visible in dark mode. Recommend '
              'keeping elevation tint in M3 mode in dark mode in Flutter '
              'versions before to 3.22. You can also bring shadows back in '
              'dark mode, it may further increase elevation separation in '
              'dark mode.\n'
              '\n'
              'Applies to BottomAppBar, BottomSheet, Card, Chip, '
              'DatePickerDialog, Dialog, Drawer, DropdownMenu, MenuBar, '
              'MenuAnchor, NavigationDrawer and PopupMenuButton. There is a '
              'separate tint removal setting for the NavigationBar, as you may '
              'want to keep it ON, even if otherwise removing elevation tint.\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveRemoveElevationTintLight?.describe ?? AdaptiveResponse.off.describe}',
            ),
            value: controller.adaptiveRemoveElevationTintDark,
            onChanged: controller.setAdaptiveRemoveElevationTintDark,
          ),
        ],
        const Divider(),
        TestAdaptiveResponse(controller),
        const Divider(),
        const ListTile(
          dense: true,
          title: Text('You can find additional platform adaptive '
              'theme settings under Shape Radius, Switch, TextField, AppBar, '
              'NavigationBar and Dialogs. The above controls used '
              'to test the adaptive response are present on all settings '
              'panels that have platform adaptive properties.'),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
