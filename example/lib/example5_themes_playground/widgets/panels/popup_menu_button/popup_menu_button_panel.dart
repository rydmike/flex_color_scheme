import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

class PopupMenuButtonPanel extends StatelessWidget {
  const PopupMenuButtonPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue131282 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/131282',
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('PopupMenuButton'),
          subtitleReveal: Text(
            'The PopupMenuButton can be used on any widget, it is typically '
            'used on an Icon, as below. Its implementation differs from newer '
            'Material-3 menu components. '
            'PopupMenuButton is originally a Material-2 design, that has also '
            'been updated to M3 style. It still works well and can be themed '
            'to a certain degree. '
            'If applicable, consider using newer more versatile M3 menu '
            'components, like MenuAnchor and DropdownMenu.\n',
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: PopupMenuButtonsShowcase(explain: false),
        ),
        const ListTileReveal(
          title: Text('Known limitations'),
          dense: true,
          subtitleReveal: Text(
              'FCS themes foreground color by default to correct '
              'contrast pair for selected background color. This works well '
              'if your PopupMenuItems only contain Text widgets. If they '
              'contain e.g. ListTiles, like the second PopupMenuButton above, '
              'the items will not use the contrasting foreground color via the '
              "PopupMenuTheme's foreground color. You will have to define the "
              'correct foreground color for your items used by '
              'PopupMenuItems.\n'
              '\n'
              'Recommend avoiding theme mode reverse brightness as background '
              'on PopupMenuButton to avoid this limitation. Such color choices '
              'are not very useful designs anyway, so it should not be a big '
              'limitation.'),
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Background color'),
              defaultLabel: 'surfaceContainer',
              defaultLabelM2: 'surface',
              value: controller.popupMenuSchemeColor,
              onChanged: controller.setPopupMenuSchemeColor,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Opacity'),
              value: controller.popupMenuOpacity,
              onChanged: controller.setPopupMenuOpacity,
              min: 0,
              max: 1,
              divisions: 100,
              valueDisplayScale: 100,
              valueDecimalPlaces: 0,
              valueHeading: 'OPACITY',
              valueUnitLabel: ' %',
              valueDefaultLabel: '100 %',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Container radius'),
              subtitleReveal: const Text(
                'Does not use the global border radius setting. Avoid using '
                'a large border radius on the popup menu container. '
                'At higher than 12 dp, the none clipped highlight will '
                'overflow the menu container corners.\n',
              ),
              value: controller.popupMenuBorderRadius,
              onChanged: controller.setPopupMenuBorderRadius,
              min: 0,
              max: 12,
              divisions: 12,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '4 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Elevation'),
              value: controller.popupMenuElevation,
              onChanged: controller.setPopupMenuElevation,
              min: 0,
              max: 20,
              divisions: 20,
              valueDecimalPlaces: 0,
              valueHeading: 'ELEV',
              valueDefaultLabel: useMaterial3 ? '3' : '6',
              valueDefaultDisabledLabel: useMaterial3 ? '3' : '8',
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
        const ListTileReveal(
          title: Text('DropdownButton'),
          subtitleReveal:
              Text('An older Material-2 widget, it cannot be themed. '
                  'Consider using M3 DropdownMenu instead.\n'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: DropDownButtonShowcase(),
        ),
        SwitchListTileReveal(
          title: const Text('Match Dropdown width to parent width'),
          subtitleReveal: const Text('When ON the DropdownMenuButton and '
              'DropdownButtonFormField will match their width to the '
              "parent's button size. If OFF, they will be wider. Is OFF by "
              'default in the FlexColorScheme API, but ON by default in '
              'Themes Playground. This setting applies to both the '
              'DropdownButton and DropdownButtonFormField.\n'),
          value: controller.alignedDropdown &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setAlignedDropdown
              : null,
        ),
        const ListTileReveal(
          title: Text('DropdownButtonFormField'),
          subtitleReveal:
              Text('An older Material-2 widget, it uses the ThemeData '
                  'input decoration style if defined. In the Themes '
                  'Playground it is defined in the TextField panel.\n'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: DropdownButtonFormFieldShowcase(),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The DropdownButtonFormField does not work well with '
                      'high border radius and filled background, since there '
                      'is no corner clip of background fill color. '
                      'Maybe consider using the M3 DropdownMenu widget '
                      'instead. See Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue131282,
                  text: 'issue #131282',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
