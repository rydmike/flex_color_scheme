import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Panel used to configure sub themes on Switch, Checkbox and Radio widgets.
class SwitchesSettings extends StatelessWidget {
  const SwitchesSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue130295 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/130295',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    final String labelForDefaultColor =
        (controller.useSubThemes || controller.useMaterial3) &&
                controller.useFlexColorScheme
            ? 'default (primary)'
            : controller.useMaterial3
                ? 'default (primary)'
                : 'default (secondary)';
    final String labelForDefaultThumbColor =
        (controller.useSubThemes || controller.useMaterial3) &&
                controller.useFlexColorScheme
            ? controller.useMaterial3
                ? 'default (primaryContainer)'
                : 'default (primary)'
            : controller.useMaterial3
                ? 'default (primaryContainer)'
                : 'default (secondary)';

    final String explainThumb =
        controller.useMaterial3 ? ' pressed/hovered/focused' : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SwitchShowcase(),
        ),
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('Switch main color'),
          labelForDefault: labelForDefaultColor,
          index: controller.switchSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSwitchSchemeColor(null);
                  } else {
                    controller.setSwitchSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: Text('Switch ON state$explainThumb thumb color'),
          labelForDefault: labelForDefaultThumbColor,
          index: controller.switchThumbSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSwitchThumbSchemeColor(null);
                  } else {
                    controller
                        .setSwitchThumbSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SwitchListTileReveal(
          title: const Text('Thumb size is fixed'),
          subtitle: const Text('Turn ON to keep the Switch thumb the same '
              'size when Switch is ON or OFF. Only available in Material-3 '
              'mode. When on the Material-3 Switch looks even more like an '
              'iOS Switch.\n'),
          value: controller.switchThumbFixedSize &&
              controller.useSubThemes &&
              controller.useFlexColorScheme &&
              controller.useMaterial3,
          onChanged: controller.useSubThemes &&
                  controller.useFlexColorScheme &&
                  controller.useMaterial3
              ? controller.setSwitchThumbFixedSize
              : null,
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CheckboxShowcase(),
        ),
        if (!controller.useMaterial3)
          const ListTile(
            dense: true,
            title: Text('Error state is not supported in M2 mode'),
          ),
        ColorSchemePopupMenu(
          title: const Text('Checkbox main color'),
          labelForDefault: labelForDefaultColor,
          index: controller.checkboxSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setCheckboxSchemeColor(null);
                  } else {
                    controller
                        .setCheckboxSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Prior to version 3.13 Flutter Checkbox theming '
                      'worked slightly differently concerning how to color '
                      'the outline and filled state. If you had themed them '
                      'before, the Flutter release 3.13 breaks the result. '
                      'The theme needs to be changed to get same result as '
                      'before. This is an undocumented Flutter breaking '
                      'change. See ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue130295,
                  text: 'issue #130295',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more information. FlexColorScheme 7.3 includes '
                      'the needed changes to address this breaking change '
                      'in Flutter 3.13.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: RadioShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('Radio main color'),
          labelForDefault: labelForDefaultColor,
          index: controller.radioSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setRadioSchemeColor(null);
                  } else {
                    controller.setRadioSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Divider(),
        SwitchListTileReveal(
          title: const Text('Unselected toggle is colored'),
          subtitle: const Text('ON: Use main color on unselected toggle\n'
              'OFF: Use default grey/surface style on unselected toggle\n'),
          value: controller.unselectedToggleIsColored &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUnselectedToggleIsColored
              : null,
        ),
      ],
    );
  }
}
