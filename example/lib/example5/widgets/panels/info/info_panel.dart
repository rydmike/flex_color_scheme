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
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../dialogs/show_copy_setup_code_dialog.dart';
import 'platform_popup_menu.dart';

/// Show the main panel with into and information text.
/// Has the main controls to turn ON/OFF using FlexColorScheme and te sub themes
/// too.
class InfoPanel extends StatelessWidget {
  const InfoPanel({
    Key? key,
    required this.controller,
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('FlexColorScheme Info'),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          const ListTile(
            title: Text('FlexColorScheme v5 Themes Playground'),
            subtitle: Text(
                'With this app you can try all features and themes in '
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
                'as shown when FlexColorScheme is active.'),
          ),
          SwitchListTileAdaptive(
            subtitle: const Text(
              "Turn OFF to see Flutter's default theming with active colors.\n"
              'Most settings are disabled or have no impact when turned OFF.',
            ),
            value: controller.useFlexColorScheme,
            onChanged: controller.setUseFlexColorScheme,
          ),
          const ListTile(
            title: Text('Component Themes'),
            subtitle: Text('The opinionated opt-in component widget sub '
                'theming is ON by default in this app, but off in the API. '
                'Turn it OFF to see the differences. The component themes '
                'follow Material Design 3 as far as possible '
                'while still being based on and limited by Material 2 themes. '
                'Mostly this affects corner radius of Widgets, but also '
                'TextTheme size and its optional coloring. '),
          ),
          SwitchListTileAdaptive(
            subtitle: const Text('Use opinionated widget sub themes.\n'
                'When ON you can configure additional settings on components, '
                'that is on Flutter built-in Material UI widgets.'),
            value: controller.useSubThemes && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setUseSubThemes
                : null,
          ),
          const ListTile(
            title: Text('Get Setup Code'),
            subtitle: Text(
                'Want to use a theme you configured here in your Flutter app? '
                'Just copy the setup code for your active settings and paste '
                'it into your Flutter app iny our IDE, import FlexColorScheme '
                'and you are good to go.'),
          ),
          ListTile(
            title: const Text('Get the FlexColorScheme setup code for '
                'this theme'),
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
            subtitle: Text('Only a few Material 3 widgets and styles are '
                'available in Flutter 2.10 and earlier. There is a toggle in '
                'ThemeData that you can turn on to enable M3 styles, but it '
                'still has no effect on Widgets in Flutter.'),
          ),
          SwitchListTileAdaptive(
            title: const Text(
              "Use Flutter's Material 3 based ThemeData defaults",
            ),
            subtitle: const Text(
              'Toggles ThemeData.useMaterial3 true/false. '
              'Has no effect in Flutter 2.10.2 or earlier. It will in future '
              'versions. When it does, use this toggle to see what it does.',
            ),
            value: controller.useMaterial3,
            onChanged: controller.setUseMaterial3,
          ),
          const ListTile(
            title: Text('New ColorScheme in Flutter 2.10 and '
                'FlexColorScheme v5'),
            subtitle: Text('The Material 3 ColorScheme is used in '
                'FlexColorScheme v5. However, '
                'widgets in Flutter 2.10 do not utilize any of its colors '
                'yet by default. Nor do they implement other M3 styles, even '
                'if the useMaterial3:true flag is set in ThemeData.\n'
                '\n'
                'You can use '
                "FlexColorScheme's opinionated component sub-themes to get "
                'a theme that is close to M3 styles already now. You can also '
                'customize it, and '
                'define which scheme colors are used by which widgets via '
                'sub-theme configuration. '
                'This feature will also work well when Material 3 styles '
                'become available in Flutter. It works as a quick and '
                'convenient way to select non standard color, from the '
                'ColorScheme for built-in Material UI components.'),
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
      ),
    );
  }
}
