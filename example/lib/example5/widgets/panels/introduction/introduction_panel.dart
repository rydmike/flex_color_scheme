// Each Card shown in the grid view is just its on little widget, typically
// very simple and basic Column based layouts.
// They all share a common custom wrapper widget, the HeaderCard.
//
// The widgets below are all private classes local to this file, since in this
// demo they are only intended to be use in HomePage. The could of course be
// made public widget and put into their own files if there would be a need
// to use them on other other screens too.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../dialogs/show_copy_setup_code_dialog.dart';
import 'platform_popup_menu.dart';

/// Show the main panel with introduction information.
///
/// Has the main controls to turn ON/OFF using FlexColorScheme and
/// the sub themes too.
class IntroductionPanel extends StatelessWidget {
  const IntroductionPanel({Key? key, required this.controller})
      : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          subtitle: Text('With this app you can try all features and themes in '
              'FlexColorScheme V5. Find a color scheme you '
              'like, experiment with surface blend modes and '
              'levels. See how the AppBar theme options work. '
              'Try the true black option for dark '
              'themes, along with computed dark themes.\n'
              '\n'
              'In version 5, the new '
              'Material 3 based ColorScheme is used. It can also be '
              'generated using the main colors as color seed keys. You '
              'can use primary, secondary and tertiary colors as seed keys '
              'or just primary, like in ColorScheme.fromSeed. For branding '
              'needs you can also lock selected ColorScheme colors to their '
              'input value, while other colors are still seed generated.\n'
              '\n'
              'This demo does not adjust any individual widget properties, '
              'the application theme is adjusted interactively and all the '
              'Flutter widgets change as the theme is modified interactively '
              'via the controls.\n'
              '\n'
              'The theming impact on widgets is shown in expandable '
              'cards with "Themed" headings. The three first themes are '
              'example custom color schemes made with the API, and are not '
              'built-in choices in the package. In the packages tutorial '
              'you learn how to make your own custom color schemes and turn '
              'them into advanced themes with FlexColorScheme. '
              'All settings in this demo are persisted locally.'),
        ),
        const ListTile(
          title: Text('Use FlexColorScheme Theming Features'),
          subtitle: Text("You can turn FlexColorScheme's theming OFF "
              'to see what a theme looks like when using standard Flutter '
              'ThemeData.from(colorScheme) using same active ColorScheme '
              'as shown when FlexColorScheme is active. You do not get any '
              'component theming then, but you can adjust colors. However, '
              'the Scaffold background color will always be equal to '
              'background color, since it does not have its '
              'own value in ColorScheme.'),
        ),
        SwitchListTileAdaptive(
          title: const Text('Turn OFF FlexColorScheme theming'),
          subtitle: const Text(
            "With the theming disabled, you can see Flutter's default "
            'theming using the same colors. Component settings are '
            'disabled when OFF',
          ),
          value: controller.useFlexColorScheme,
          onChanged: controller.setUseFlexColorScheme,
        ),
        const ListTile(
          title: Text('Component Themes'),
          subtitle: Text('The opinionated component widget sub '
              'theming is ON by default in this app, but off by default in '
              'the API. Turn it OFF to observe the differences. '
              'The default sub-theming when ON, follows Material Design 3 '
              'when possible. It is however to some extent still limited '
              'by Flutter SDK Material 2 based designs. '
              'Most visible change is the corner radius on Widgets that '
              'depends on Widget type, but also TextTheme size.'),
        ),
        SwitchListTileAdaptive(
          title: const Text('Use component widget sub themes'),
          subtitle: const Text('Turn ON to use and adjust available '
              'opinionated component widget sub themes'),
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        ListTile(
          title: const Text('Get Theme Setup Code'),
          subtitle: const Text(
              'Want to use a FlexColorScheme theme you configured here in '
              'your Flutter app?\n'
              'Just copy the setup code for these settings and paste '
              'it into your Flutter app, import FlexColorScheme '
              'and you are done.'),
          trailing: ElevatedButton(
            onPressed: controller.useFlexColorScheme
                ? () {
                    showCopySetupCodeDialog(context, controller);
                  }
                : null,
            child: const Text('Code'),
          ),
          onTap: controller.useFlexColorScheme
              ? () {
                  showCopySetupCodeDialog(context, controller);
                }
              : null,
        ),
        const ListTile(
          title: Text('Material Design 3'),
          subtitle: Text(
            'The in Flutter 2.10.0 introduced Material 3 ColorScheme is '
            'used and fully supported by FlexColorScheme v5. However, '
            'widgets in Flutter 2.10.x do not yet use any of the '
            "ColorScheme's new colors by default. You can enable "
            "FlexColorScheme's component sub-themes to get "
            'a theme that is close to the Material 3 style by default. '
            'With the component sub-themes you can also change which scheme '
            'color its themed component uses. This is a convenient way to '
            'use a themed, none default ColorScheme based color, as the '
            'color of choice on Material UI widgets included in '
            "FlexColorScheme's supported component theme customization "
            'capabilities.\n'
            '\n'
            'Very few Material 3 widgets and styles are available in '
            'Flutter 2.10.x and earlier. The updated ColorScheme, '
            'NavigationBar and the flag to use a selection indicator on '
            'NavigationRail are the only M3 features in the Flutter SDK '
            '(applies to stable version 2.10.x).\n'
            '\n'
            'There is a toggle in ThemeData that you can turn on to enable '
            'available built-in M3 styles. It still has almost no effect '
            'on UI widget defaults in Flutter. The indicator on the '
            'NavigationRail is the only thing it affects so far. It will be '
            'used more in future Flutter versions. When it is, we can use '
            'this toggle to see what it does.',
          ),
        ),
        SwitchListTileAdaptive(
          title: const Text(
            "Use Flutter's Material 3 based ThemeData defaults",
          ),
          subtitle: const Text(
            'Toggles ThemeData.useMaterial3 true/false',
          ),
          value: controller.useMaterial3,
          onChanged: controller.setUseMaterial3,
        ),
        const ListTile(
          title: Text('Platform'),
          subtitle: Text('For testing purposes you can change used platform. '
              'It changes some icons and widgets like Switches and Sliders, '
              'also font and platform mechanics, like '
              'scrolling behavior and acceleration. '
              'This setting is not persisted.'),
        ),
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        ListTile(
          title: const Text('Set to actual platform'),
          trailing: ElevatedButton(
            onPressed: () {
              controller.setPlatform(defaultTargetPlatform);
            },
            child: const Text('Actual'),
          ),
          onTap: () {
            controller.setPlatform(defaultTargetPlatform);
          },
        ),
      ],
    );
  }
}
