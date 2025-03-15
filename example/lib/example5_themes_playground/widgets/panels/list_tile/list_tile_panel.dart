import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';

class ListTilePanel extends StatelessWidget {
  const ListTilePanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _lisTilePlaceholderIssue = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues',
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
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Selected color'),
          defaultLabel: 'primary',
          value: controller.listTileSelectedSchemeColor,
          onChanged: controller.setListTileSelectedSchemeColor,
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Icon color'),
              defaultLabel: 'onSurfaceVariant',
              defaultLabelM2: 'Black opacity 54%',
              defaultLabelDarkM2: 'White',
              value: controller.listTileIconSchemeColor,
              onChanged: controller.setListTileIconSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Text color'),
              defaultLabel: 'Used text styles',
              defaultLabelM2: 'Used text styles & subtitle bodySmall',
              defaultDisabledLabel: 'onSurface',
              value: controller.listTileTextSchemeColor,
              onChanged: controller.setListTileTextSchemeColor,
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Tile color'),
              defaultLabel: 'transparent',
              value: controller.listTileTileSchemeColor,
              onChanged: controller.setListTileTileSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Selected tile color'),
              defaultLabel: 'transparent',
              value: controller.listTileSelectedTileSchemeColor,
              onChanged: controller.setListTileSelectedTileSchemeColor,
            ),
            isRow: isRow,
          );
        }),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Content padding'),
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              trailingWidth: 52,
              enabled: enableControl,
              value: controller.listTilePaddingStart,
              onChanged: controller.setListTilePaddingStart,
              min: 0,
              max: 50,
              divisions: 50,
              valueDecimalPlaces: 0,
              valueHeading: 'START',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '16 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              trailingWidth: 60,
              enabled: enableControl,
              value: controller.listTilePaddingEnd,
              onChanged: controller.setListTilePaddingEnd,
              min: 0,
              max: 50,
              divisions: 50,
              valueDecimalPlaces: 0,
              valueHeading: 'END',
              valueUnitLabel: ' dp',
              valueDefaultLabel: useMaterial3 ? '24 dp' : '16 dp',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              trailingWidth: 52,
              enabled: enableControl,
              value: controller.listTilePaddingTop,
              onChanged: controller.setListTilePaddingTop,
              min: 0,
              max: 50,
              divisions: 50,
              valueDecimalPlaces: 0,
              valueHeading: 'TOP',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              trailingWidth: 60,
              enabled: enableControl,
              value: controller.listTilePaddingBottom,
              onChanged: controller.setListTilePaddingBottom,
              min: 0,
              max: 50,
              divisions: 50,
              valueDecimalPlaces: 0,
              valueHeading: 'BOTTOM',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              title: const Text('Horizontal title gap'),
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              trailingWidth: 52,
              enabled: enableControl,
              value: controller.listTileHorizontalTitleGap,
              onChanged: controller.setListTileHorizontalTitleGap,
              min: 0,
              max: 50,
              divisions: 50,
              valueDecimalPlaces: 0,
              valueHeading: 'GAP',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '16 dp',
            ),
            lastWidget: SliderListTileReveal(
              title: const Text('Min vertical padding'),
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              trailingWidth: 60,
              enabled: enableControl,
              value: controller.listTileMinVerticalPadding,
              onChanged: controller.setListTileMinVerticalPadding,
              min: 0,
              max: 50,
              divisions: 50,
              valueDecimalPlaces: 0,
              valueHeading: 'PADDING',
              valueUnitLabel: ' dp',
              valueDefaultLabel: useMaterial3 ? '8 dp' : '4 dp',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: EnumPopupMenu<ListTileStyle>(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              values: ListTileStyle.values,
              title: const Text('Style'),
              // defaultLabel: 'transparent',
              value: controller.listTileStyle,
              onChanged: controller.setListTileStyle,
            ),
            lastWidget: EnumPopupMenu<ListTileTitleAlignment>(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              values: ListTileTitleAlignment.values,
              title: const Text('Title alignment'),
              // defaultLabel: 'transparent',
              value: controller.listTileTitleAlignment,
              onChanged: controller.setListTileTitleAlignment,
            ),
            isRow: isRow,
          );
        }),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The minVertical padding is lowest at 4 not at 0 '
                      'This may be a bug in Flutter SDK. It will be studied '
                      'and reported as an ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _lisTilePlaceholderIssue,
                  text: 'issue',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' if it is. The ListTileStyle theme property has no '
                      'effect, this may also be a bug in Flutter SDK. It will '
                      'be studied and reported as an ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _lisTilePlaceholderIssue,
                  text: 'issue',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' if it is one.\n',
                ),
              ],
            ),
          ),
        ),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitleReveal: Text(
            'With the API you can also set the text styles with '
            'FlexSubThemesData properties:\n'
            '\n'
            '- listTileTitleTextStyle\n'
            '- listTileSubtitleTextStyle\n'
            '- listTileLeadingAndTrailingTextStyle\n',
          ),
        ),
        const SizedBox(height: 8),
        const Divider(height: 1),
        const ListTileShowcase(),
        const Divider(height: 1),
        const SwitchListTileShowcase(),
        const Divider(height: 1),
        const CheckboxListTileShowcase(),
        const Divider(height: 1),
        const RadioListTileShowcase(),
        const Divider(),
        const ExpansionTileShowcase(),
        const SizedBox(height: 8),
        const ExpansionPanelListShowcase(),
        const SizedBox(height: 16),
      ],
    );
  }
}
