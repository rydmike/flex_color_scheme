import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

class SegmentedButtonsPanel extends StatelessWidget {
  const SegmentedButtonsPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _segmentNotTransparentIssue123292 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/123292',
  );
  static final Uri _segmentWrongHeightIssue121493 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/121493',
  );
  static final Uri _segmentWrongOverlayIssue123308 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/123308',
  );
  static final Uri _segmentNotM3SpecIssue119733 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/119733',
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

    // Get effective platform default global radius.
    final double? effectiveRadius = ThemeValues.effectiveRadius(controller);
    final String toggleButtonsRadiusDefaultLabel =
        controller.toggleButtonsBorderRadius == null && effectiveRadius == null
            ? '40 dp'
            : controller.toggleButtonsBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
                : '';
    final String toggleBorderWidthDefaultLabel =
        controller.toggleButtonsBorderWidth == null &&
                controller.thinBorderWidth == null
            ? '1 dp'
            : controller.toggleButtonsBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global ${controller.thinBorderWidth!.toStringAsFixed(1)} dp'
                : '';
    final String segmentedButtonsRadiusDefaultLabel =
        controller.segmentedButtonBorderRadius == null &&
                effectiveRadius == null
            ? 'stadium'
            : controller.segmentedButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
                : '';
    final String segmentedBorderWidthDefaultLabel =
        controller.segmentedButtonBorderWidth == null &&
                controller.thinBorderWidth == null
            ? '1 dp'
            : controller.segmentedButtonBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global ${controller.thinBorderWidth!.toStringAsFixed(1)} dp'
                : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ListTileReveal(
          title: Text('SegmentedButton'),
          subtitleReveal: Text('Material-3, replacement for ToggleButtons. '
              'ToggleButtons may work better when using only icons and it is '
              'similarly styled by FCS component themes. SegmentedButton '
              'is better if you also have text, and optionally also want '
              'a checkmark icon to mark the selected state.\n'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: SegmentedButtonShowcase(),
        ),
        ResponsiveTwoWidgets(
          builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              isRow: isRow,
              firstWidget: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                title: const Text('Selected background'),
                defaultLabel: 'secondaryContainer',
                defaultLabelM2: 'primary',
                defaultDisabledLabel: 'secondaryContainer',
                value: controller.segmentedButtonSchemeColor,
                onChanged: controller.setSegmentedButtonSchemeColor,
              ),
              lastWidget: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                title: const Text('Selected foreground'),
                defaultLabel: controller.segmentedButtonSchemeColor == null
                    ? useMaterial3
                        ? 'onSecondaryContainer'
                        : 'onPrimary'
                    : SchemeColor
                        .values[FlexSubThemes.onSchemeColor(
                                controller.segmentedButtonSchemeColor!)
                            .index]
                        .name,
                defaultDisabledLabel: 'onSecondaryContainer',
                value: controller.segmentedButtonSelectedForegroundSchemeColor,
                onChanged:
                    controller.setSegmentedButtonSelectedForegroundSchemeColor,
              ),
            );
          },
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            isRow: isRow,
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Unselected background'),
              defaultLabel: 'transparent',
              value: controller.segmentedButtonUnselectedSchemeColor,
              onChanged: controller.setSegmentedButtonUnselectedSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Unselected foreground'),
              defaultLabel: controller.segmentedButtonUnselectedSchemeColor ==
                      null
                  ? 'onSurface'
                  : SchemeColor
                      .values[FlexSubThemes.onSchemeColor(
                              controller.segmentedButtonUnselectedSchemeColor!)
                          .index]
                      .name,
              defaultDisabledLabel: 'onSurface',
              value: controller.segmentedButtonUnselectedForegroundSchemeColor,
              onChanged:
                  controller.setSegmentedButtonUnselectedForegroundSchemeColor,
            ),
          );
        }),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Border color'),
          defaultLabel: controller.segmentedButtonBorderSchemeColor == null
              ? useMaterial3
                  ? 'outline'
                  : 'primary'
              : controller.segmentedButtonSchemeColor?.name ??
                  SchemeColor.primary.name,
          defaultDisabledLabel: 'outline',
          value: controller.segmentedButtonBorderSchemeColor,
          onChanged: controller.setSegmentedButtonBorderSchemeColor,
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            isRow: isRow,
            firstWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Radius'),
              value: controller.segmentedButtonBorderRadius,
              onChanged: controller.setSegmentedButtonBorderRadius,
              min: 0,
              max: 40,
              divisions: 40,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: segmentedButtonsRadiusDefaultLabel,
              valueDefaultDisabledLabel: 'stadium',
            ),
            lastWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Width'),
              value: controller.segmentedButtonBorderWidth,
              onChanged: controller.setSegmentedButtonBorderWidth,
              min: 0.5,
              max: 6,
              divisions: 11,
              valueDecimalPlaces: 1,
              valueHeading: 'WIDTH',
              valueUnitLabel: ' dp',
              valueDefaultLabel: segmentedBorderWidthDefaultLabel,
              valueDefaultDisabledLabel: '1 dp',
            ),
          );
        }),
        //
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.7 the SegmentedButton has a few '
                      'small issues, like background is not transparent ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _segmentNotTransparentIssue123292,
                  text: '(issue #123292)',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' and its default unselected foreground color does '
                      'not follow M3 spec ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _segmentNotM3SpecIssue119733,
                  text: '(issue #119733)',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ', these issues are fixed in Flutter 3.10.\n'
                      'Additionally min height or size '
                      'cannot be set ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _segmentWrongHeightIssue121493,
                  text: '(issue #121493)',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' and selectedOverlay state does not work ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _segmentWrongOverlayIssue123308,
                  text: '(issue #123308)',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ', these have no fixes yet.',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('ToggleButtons'),
          subtitleReveal:
              Text('By default ToggleButtons in FCS are themed to style and '
                  'height align with OutlinedButton and FilledButton, shown '
                  'here for comparison. The ToggleButtons component is a '
                  'a useful alternative for a compact icon button bar.\n'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: ToggleButtonsShowcase(compareButtons: true),
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            isRow: isRow,
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Selected background'),
              defaultLabel: 'primary',
              defaultDisabledLabel: 'primary opacity 12%',
              value: controller.toggleButtonsSchemeColor,
              onChanged: controller.setToggleButtonsSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Selected foreground'),
              defaultLabel: controller.toggleButtonsSchemeColor == null
                  ? 'onPrimary'
                  : SchemeColor
                      .values[FlexSubThemes.onSchemeColor(
                              controller.toggleButtonsSchemeColor!)
                          .index]
                      .name,
              defaultDisabledLabel: 'primary opacity 12%',
              value: controller.toggleButtonsSelectedForegroundSchemeColor,
              onChanged:
                  controller.setToggleButtonsSelectedForegroundSchemeColor,
            ),
          );
        }),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Unselected foreground color'),
          subtitleReveal: const Text('There is no setting in Flutter '
              'ToggleButtons theme to set the unselected background color.\n'),
          defaultLabel: enableControl &&
                  controller.toggleButtonsUnselectedSchemeColor == null
              ? controller.toggleButtonsSchemeColor?.name ??
                  SchemeColor.primary.name
              : 'primary',
          defaultDisabledLabel: 'onSurface',
          value: controller.toggleButtonsUnselectedSchemeColor,
          onChanged: controller.setToggleButtonsUnselectedSchemeColor,
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Border color'),
          defaultLabel: useMaterial3
              ? 'outline'
              : enableControl &&
                      controller.toggleButtonsBorderSchemeColor == null
                  ? controller.toggleButtonsSchemeColor?.name ??
                      SchemeColor.primary.name
                  : 'primary',
          defaultDisabledLabel: 'onSurface opacity 12%',
          value: controller.toggleButtonsBorderSchemeColor,
          onChanged: controller.setToggleButtonsBorderSchemeColor,
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            isRow: isRow,
            firstWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Radius'),
              value: controller.toggleButtonsBorderRadius,
              onChanged: controller.setToggleButtonsBorderRadius,
              min: 0,
              max: 40,
              divisions: 40,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: toggleButtonsRadiusDefaultLabel,
              valueDefaultDisabledLabel: '0 dp',
            ),
            lastWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Width'),
              value: controller.toggleButtonsBorderWidth,
              onChanged: controller.setToggleButtonsBorderWidth,
              min: 0.5,
              max: 6,
              divisions: 11,
              valueDecimalPlaces: 1,
              valueHeading: 'WIDTH',
              valueDefaultLabel: toggleBorderWidthDefaultLabel,
              valueDefaultDisabledLabel: '1 dp',
              valueUnitLabel: ' dp',
            ),
          );
        }),
        const Divider(),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitleReveal: Text(
            'With the API you can also set the text styles with '
            'FlexSubThemesData properties:\n'
            '\n'
            '- segmentedButtonTextStyle\n'
            '- toggleButtonsTextStyle\n',
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
