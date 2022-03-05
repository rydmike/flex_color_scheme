import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class ButtonsSettings extends StatelessWidget {
  const ButtonsSettings({
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
      title: const Text('Themed Material Buttons'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          const ListTile(
            title: Text('Themed button colors'),
            subtitle: Text('Change theme color, default is primary via '
                'SDK default and component sub-theme defaults. '
                'With API you can set different color in light and dark '
                'mode. This app shares same input for both modes, but you '
                'can easily modify the generated setup code.'),
          ),
          ColorSchemePopupMenu(
            title: const Text('ElevatedButton color'),
            index: controller.elevatedButtonSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setElevatedButtonSchemeColor(null);
                    } else {
                      controller.setElevatedButtonSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButtonShowcase(),
          ),
          ColorSchemePopupMenu(
            title: const Text('OutlinedButton color'),
            index: controller.outlinedButtonSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setOutlinedButtonSchemeColor(null);
                    } else {
                      controller.setOutlinedButtonSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OutlinedButtonShowcase(),
          ),
          ColorSchemePopupMenu(
            title: const Text('TextButton color'),
            index: controller.textButtonSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTextButtonSchemeColor(null);
                    } else {
                      controller
                          .setTextButtonSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextButtonShowcase(),
          ),

          /// Showing the legacy buttons is removed from the sample.
          ///
          /// The deprecated legacy buttons weill be removed in next stable
          /// release after Flutter 2.10.x. For more info see:
          /// https://github.com/flutter/flutter/issues/98537
          ///
          /// The sub themes that style them will be kept available since it
          /// is not going away and may be useful to the theme ButtonBar and
          /// dropdown. button style. As long as the buttons are actually
          /// available in the SDK, the comment code to show will be kept
          /// around in the samples, should anybody want to uncomment it to
          /// see what their style with sub themes applied looks like.

          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('Legacy buttons, deprecated',
          //       style: Theme.of(context).textTheme.subtitle1),
          // ),
          // const LegacyButtonShowcase(),
          // const SizedBox(height: 8),
          // const LegacyButtonShowcase(enabled: false),
          // const SizedBox(height: 8),
          // const LegacyButtonIconShowcase(),
        ],
      ),
    );
  }
}
