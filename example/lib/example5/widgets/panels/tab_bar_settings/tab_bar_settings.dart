import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'tab_bar_style_buttons.dart';

class TabBarSettings extends StatelessWidget {
  const TabBarSettings(
      {Key? key,
      required this.controller,
      required this.isOpen,
      required this.onTap})
      : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  String explainTabStyle(final FlexTabBarStyle style) {
    switch (style) {
      case FlexTabBarStyle.forAppBar:
        return 'Style: forAppbar\n'
            'Works with used app bar style, usually the one you want (Default)';
      case FlexTabBarStyle.forBackground:
        return 'Style: forBackground\n'
            'Works on surface colors, like Scaffold, but '
            'also works on surface colored app bars';
      case FlexTabBarStyle.flutterDefault:
        return 'Style: flutterDefault\n'
            'SDK default. Works on primary color in light mode, and '
            'background color in dark mode';
      case FlexTabBarStyle.universal:
        return 'Style: universal\n'
            'Experimental universal style, has '
            'low contrast. May change in future versions';
    }
  }

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('TabBar Settings'),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Choose TabBarStyle that fits your use case'),
            subtitle: Text(explainTabStyle(controller.tabBarStyle)),
          ),
          // const SizedBox(height: 4),
          ListTile(
            trailing: TabBarStyleButtons(
              style: controller.useFlexColorScheme
                  ? controller.tabBarStyle
                  : FlexTabBarStyle.flutterDefault,
              onChanged: controller.useFlexColorScheme
                  ? controller.setTabBarStyle
                  : null,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TabBarForAppBarShowcase(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TabBarForBackgroundShowcase(),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const ListTile(
            title: Text('Custom colors'),
            subtitle: Text('With sub-themes you can select scheme color for '
                'the items and indicator separately. '
                'Using TabBarStyle is easier, but this offers more control. '
                'These settings overrides used TabBarStyle, set them '
                'back to default (null) to use TabBarStyle again. '
                'With API you can set different color in light and dark '
                'mode. This app shares same input for both modes, but you '
                'can easily modify the generated setup code.'),
          ),
          ColorSchemePopupMenu(
            title: const Text('TabBar items color'),
            labelForDefault: 'null (TabBarStyle)',
            index: controller.tabBarItemSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarItemSchemeColor(null);
                    } else {
                      controller
                          .setTabBarItemSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          ColorSchemePopupMenu(
            title: const Text('TabBar indicator color'),
            labelForDefault: 'null (TabBarStyle)',
            index: controller.tabBarIndicator?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarIndicator(null);
                    } else {
                      controller.setTabBarIndicator(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
