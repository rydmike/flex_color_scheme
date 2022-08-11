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
  const IntroductionPanel(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          subtitle: Text('Use the Themes Playground to try features and themes '
              'of FlexColorScheme. Find a scheme you like, experiment '
              'with surface blends at different levels. See how AppBar '
              'theme options work. Test the true black option for dark '
              'themes, along with computed dark themes.\n'
              '\n'
              'Material 3 based ColorScheme is supported and used by built-in '
              'schemes. ColorSchemes can also be generated using main built-in '
              'scheme colors as ColorScheme seed keys. You can use primary '
              'color as seed key, like with in ColorScheme.fromSeed, but you '
              'also have more options. You can use secondary and tertiary '
              'colors, in addition to primary as key colors to seed your '
              'dynamic ColorScheme. You can even customize the tonal palette '
              'generation parameters. For branding purposes you can lock '
              'selected main colors to their defined input values, while other '
              'colors are still seed generated.\n'
              '\n'
              'This application does not adjust any individual widget '
              'properties. The theme is adjusted interactively and all '
              'Flutter widgets change as the app theme is modified '
              'interactively via their controls.\n'
              '\n'
              'The theming settings and their impact on widgets are shown in '
              'widget topic panels. The same panels are used on two screens '
              'with different layouts. The default one is a page view, '
              'where you see one topic at a time. The second screen is a '
              'large masonry grid view, where you can see many topics at once '
              'on large screens. You can open and close topics to view more or '
              'fewer of them at the same time.\n'
              '\n'
              'Both layouts are responsive and work well down to phone sizes. '
              'If you build this app, it fits and runs nicely on modern '
              'phones. The app is however primarily intended to '
              'be used on web based desktop browsers, or as a native Windows, '
              'Mac or Linux desktop app, where it shines.'
              '\n'
              'The three first themes in the app are example custom color '
              'schemes, made in the tutorials with the API, they are not '
              'built-in choices in the package. In the package tutorials '
              'you learn how to make your own custom color schemes and turn '
              'them into advanced themes with FlexColorScheme.\n'
              '\n'
              'All settings in this demo are persisted locally.'),
        ),
        const Divider(),
        const ListTile(
          title: Text('FlexColorScheme theming'),
          subtitle: Text("You can turn FlexColorScheme's theming OFF "
              'to see what a theme looks like when using standard Flutter '
              'ThemeData.from(colorScheme), using the same active ColorScheme '
              'as shown when FlexColorScheme is active. You do not get any '
              'component theming then, but you can adjust colors. However, '
              'the Scaffold background color will always be equal to '
              'background color, since it does not have its '
              'own value in ColorScheme.'),
        ),
        SwitchListTileAdaptive(
          title: const Text('Use FlexColorScheme'),
          subtitle: const Text(
            "With FlexColorScheme disabled, you can see Flutter's default "
            'theming using the same colors. Component theme settings are also '
            'disabled when FlexColorScheme is disabled',
          ),
          value: controller.useFlexColorScheme,
          onChanged: controller.setUseFlexColorScheme,
        ),
        const ListTile(
          title: Text('Component themes'),
          subtitle: Text('The opinionated component widget sub '
              'theming is ON by default in this app, but OFF by default in '
              'the API. '
              'When OFF, FlexColorScheme mostly only harmonize the colors '
              'and you can adjust a few common sub-theme properties, like '
              'AppBar, see docs to find out more.\n'
              '\n'
              'The default sub-theming follows Material Design 3 guideline '
              'with its own twists and implementing it to some extent using '
              'Flutter Material 2 based theming capabilities on M2 widgets. '
              'Most visible change is the corner radius on Widgets, that '
              'depends on Widget type, but also font sizes in the TextTheme.'),
        ),
        SwitchListTileAdaptive(
          title: const Text('Use component themes'),
          subtitle: const Text('Turn ON to use the opinionated component '
              'sub-themes and adjust their settings'),
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        ListTile(
          title: const Text('Get FlexColorScheme setup code'),
          subtitle: const Text(
              'Want to use a FlexColorScheme theme you configured here in '
              'your Flutter app? '
              'Copy the setup code, paste it into your Flutter app, '
              'import FlexColorScheme, and your theming is done!'),
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
            'Material 3 ColorScheme is used and fully supported. However, many '
            'components in Flutter 3.0 do still not use the updated '
            "ColorScheme's new colors by default as specified in M3 guide.\n"
            '\n'
            'When you enable '
            "FlexColorScheme's component sub-themes you get "
            'a theme that is close to the Material 3 style without using the '
            'M3 toggle in ThemeData. '
            'With the component sub-themes settings you can adjust it further, '
            'and e.g. change which ColorScheme color each component uses. '
            'This is a convenient way to select and use any ColorScheme based '
            'color, as the themed color for components included in '
            "FlexColorScheme's supported component theme customization "
            'capabilities.\n'
            '\n'
            'Only some widgets in Flutter 3.0 implement M3 correctly. '
            'If you disable FlexColorScheme and set '
            '"useMaterial3:true" with toggle below, you can see which '
            'components currently get the new M3 styling.\n'
            '\n'
            'In Flutter SDK 3.0 there are Material widget elevation issues '
            'if you set "useMaterial3:true". For example Dialogs, Drawers, '
            'BottomSheet, PopupMenu and most Material using widgets will not '
            'get any elevation when it is used. This is due to a change in the '
            'Material elevation behavior when M3 is used. For elevation in M3, '
            'Material needs to specify shadowColor, and optionally '
            'surfaceTintColor. For custom Material widgets you can do this, '
            'but SDK widgets using Material that do not yet implement their '
            'own M3 behaviour, do not do so yet, and do not get any elevation, '
            'even if they should in M3 design as well.\n'
            '\n'
            'When you combine "useMaterial3:true" and FlexColorScheme '
            'opinionated component theming, FCS will default some widgets '
            'with unspecified property values to its M3 defaults, instead of '
            'using its own opinionated default.',
          ),
        ),
        SwitchListTileAdaptive(
          title: const Text(
            'Use Flutter SDK Material 3 ThemeData defaults',
          ),
          subtitle: const Text(
            'Sets ThemeData.useMaterial3 to true\n'
            'WARNING: Has elevation issues in Flutter 3.0',
          ),
          value: controller.useMaterial3,
          onChanged: controller.setUseMaterial3,
        ),
        const ListTile(
          title: Text('Platform'),
          subtitle: Text('For testing purposes you can change used platform. '
              'It changes some icons and widgets like Switches and Sliders, '
              'plus platform mechanics, like '
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
        const SizedBox(height: 8),
      ],
    );
  }
}
