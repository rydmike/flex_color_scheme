import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_response.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/test_adaptive_response.dart';

// Panel used to configure sub themes on Switch, Checkbox and Radio widgets.
class SwitchCheckRadioPanel extends StatelessWidget {
  const SwitchCheckRadioPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue130295 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/130295',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final String explainThumb = useMaterial3 ? ' pressed/hovered/focused' : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTileReveal(
          title: const Text('Unselected toggle is colored'),
          subtitleReveal:
              const Text('Applies to OFF state of Switch and unselected '
                  'state on checkbox and Radio.\n'
                  '\n'
                  'ON: Use main color on unselected toggle\n'
                  'OFF: Use default grey/surface style on unselected toggle\n'),
          value: controller.unselectedToggleIsColored &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setUnselectedToggleIsColored
              : null,
        ),
        const Divider(),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Switch color'),
          defaultLabel: 'primary',
          defaultDisabledLabelM2: 'secondary',
          value: controller.switchSchemeColor,
          onChanged: controller.setSwitchSchemeColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SwitchShowcase(showCupertinoSwitches: true),
        ),
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: Text('Switch ON state$explainThumb thumb color'),
          defaultLabel: 'primaryContainer',
          defaultLabelM2: 'primary',
          defaultDisabledLabelM2: 'secondary',
          value: controller.switchThumbSchemeColor,
          onChanged: controller.setSwitchThumbSchemeColor,
        ),
        SwitchListTileReveal(
          title: const Text('Thumb size is fixed'),
          subtitleReveal:
              const Text('Turn ON to keep the Switch thumb the same '
                  'size when Switch is ON or OFF. Only available in Material-3 '
                  'mode.\n'),
          value: controller.switchThumbFixedSize &&
              controller.useSubThemes &&
              controller.useFlexColorScheme &&
              useMaterial3,
          onChanged: controller.useSubThemes &&
                  controller.useFlexColorScheme &&
                  useMaterial3
              ? controller.setSwitchThumbFixedSize
              : null,
        ),
        EnumPopupMenu<AdaptiveResponse>(
          enabled: enableControl && controller.useMaterial3,
          values: AdaptiveResponse.values,
          title: const Text('Make Material Switch look like iOS Switch'),
          subtitleReveal: Text(
            'An adaptive theme response to make the Material Switch '
            'look as close as possible to a CupertinoSwitch by only using '
            'available theming and to make this theme response platform '
            'adaptive. This feature has the advantage over Switch.adaptive '
            'that it can use another theme color than primary and it can have '
            'the adaptive response on other than Apple platforms.\n'
            '\n'
            'In Material-2 mode this setting has no effect and is thus not '
            'available.\n'
            '\n'
            // ignore: lines_longer_than_80_chars
            '${controller.switchAdaptiveCupertinoLike?.describe ?? AdaptiveResponse.off.describe}',
          ),
          value: controller.switchAdaptiveCupertinoLike,
          onChanged: controller.setSwitchAdaptiveCupertinoLike,
        ),
        TestAdaptiveResponse(controller),
        const Divider(),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Checkbox color'),
          defaultLabel: 'primary',
          defaultDisabledLabelM2: 'secondary',
          value: controller.checkboxSchemeColor,
          onChanged: controller.setCheckboxSchemeColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CheckboxShowcase(),
        ),
        if (!useMaterial3)
          const ListTile(
            dense: true,
            title: Text('Error state is not supported in M2 mode'),
          ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Prior to version 3.13 Flutter Checkbox theming '
                      'worked slightly differently concerning how to color '
                      'the outline and filled state. If you had themed them '
                      'before, the Flutter release 3.13 breaks the result. '
                      'The theme needs to be changed to get same result as '
                      'before.\n'
                      '\n'
                      'This is an undocumented Flutter breaking '
                      'change. See ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue130295,
                  text: 'issue #130295',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more information. FlexColorScheme 7.3 and later '
                      'versions include the needed changes to address this '
                      'minor breaking theming change in Flutter 3.13.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Radio color'),
          defaultLabel: 'primary',
          defaultDisabledLabelM2: 'secondary',
          value: controller.radioSchemeColor,
          onChanged: controller.setRadioSchemeColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: RadioShowcase(),
        ),
      ],
    );
  }
}
