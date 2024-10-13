import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Settings for the standard Material buttons.
class ButtonsPanel extends StatelessWidget {
  const ButtonsPanel(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  static final Uri _fcsFlutterIssue118063 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/118063',
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
    final String elevatedButtonRadiusDefaultLabel =
        controller.elevatedButtonBorderRadius == null && effectiveRadius == null
            ? useMaterial3
                ? 'stadium'
                : '40 dp'
            : controller.elevatedButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
                : '';
    final String outlinedButtonRadiusDefaultLabel =
        controller.outlinedButtonBorderRadius == null && effectiveRadius == null
            ? useMaterial3
                ? 'stadium'
                : '40 dp'
            : controller.outlinedButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String textButtonRadiusDefaultLabel =
        controller.textButtonBorderRadius == null && effectiveRadius == null
            ? useMaterial3
                ? 'stadium'
                : '40 dp'
            : controller.textButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
                : '';
    final String filledButtonRadiusDefaultLabel =
        controller.filledButtonBorderRadius == null && effectiveRadius == null
            ? useMaterial3
                ? 'stadium'
                : '40 dp'
            : controller.filledButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
                : '';
    final String outlinedBorderDefaultLabel =
        controller.outlinedButtonBorderWidth == null &&
                controller.thinBorderWidth == null
            ? '1 dp'
            : controller.outlinedButtonBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global ${controller.thinBorderWidth!.toStringAsFixed(1)} dp'
                : '1 dp';
    final String pressedOutlinedBorderDefaultLabel =
        controller.outlinedButtonPressedBorderWidth == null &&
                controller.thickBorderWidth == null
            ? useMaterial3
                ? '1 dp'
                : '2 dp'
            : controller.outlinedButtonPressedBorderWidth == null &&
                    controller.thickBorderWidth != null
                ? 'global ${controller.thickBorderWidth!.toStringAsFixed(1)} dp'
                : '1 dp';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('ElevatedButton main color'),
          colorPrefix: useMaterial3 ? 'Foreground color ' : 'Background color ',
          defaultLabel: 'primary',
          value: controller.elevatedButtonSchemeColor,
          onChanged: controller.setElevatedButtonSchemeColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ElevatedButtonShowcase(),
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('ElevatedButton secondary color'),
          colorPrefix: useMaterial3 ? 'Background color ' : 'Foreground color ',
          defaultLabel: 'surfaceContainerLow',
          defaultLabelM2: 'onPrimary',
          value: controller.elevatedButtonSecondarySchemeColor,
          onChanged: controller.setElevatedButtonSecondarySchemeColor,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          value: controller.elevatedButtonBorderRadius,
          onChanged: controller.setElevatedButtonBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: elevatedButtonRadiusDefaultLabel,
          valueDefaultDisabledLabel: useMaterial3 ? 'stadium' : '4 dp',
        ),
        const Divider(),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('FilledButton color'),
          defaultLabel: 'primary and secondaryContainer',
          value: controller.filledButtonSchemeColor,
          onChanged: controller.setFilledButtonSchemeColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FilledButtonShowcase(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FilledButtonTonalShowcase(),
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          value: controller.filledButtonBorderRadius,
          onChanged: controller.setFilledButtonBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: filledButtonRadiusDefaultLabel,
          valueDefaultDisabledLabel: 'stadium',
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Current Flutter SDK FilledButton theming has a '
                      'limitation where the FilledButton.tonal variant cannot '
                      'be themed differently from FilledButton. See '
                      'Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue118063,
                  text: 'issue #118063',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. Due to this issue, if you change theme color, the '
                      'FilledButton and FilledButton.tonal will get the same '
                      'color.\n'
                      '\n'
                      'For the same reason the tinted disable colors are '
                      'NOT set unless its main color is changed. If disabled '
                      'colors would be set, the different colors of the '
                      'buttons would also be lost. Separate colors and border '
                      'radius for the two variants will be offered when the '
                      'current limitation is removed in Flutter. Go upvote '
                      'the issue by giving it thumbs-up!\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('OutlinedButton foreground color'),
          defaultLabel: 'primary',
          value: controller.outlinedButtonSchemeColor,
          onChanged: controller.setOutlinedButtonSchemeColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: OutlinedButtonShowcase(),
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('OutlinedButton outline color'),
          defaultLabel: 'outline',
          defaultLabelM2: 'primary',
          defaultDisabledLabelM2: 'onSurface opacity 0.12',
          value: controller.outlinedButtonOutlineSchemeColor,
          onChanged: controller.setOutlinedButtonOutlineSchemeColor,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          value: controller.outlinedButtonBorderRadius,
          onChanged: controller.setOutlinedButtonBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: outlinedButtonRadiusDefaultLabel,
          valueDefaultDisabledLabel: useMaterial3 ? 'stadium' : '4 dp',
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Border width'),
              value: controller.outlinedButtonBorderWidth,
              onChanged: controller.setOutlinedButtonBorderWidth,
              min: 0.5,
              max: 6,
              divisions: 11,
              valueDecimalPlaces: 1,
              valueHeading: 'WIDTH',
              valueUnitLabel: ' dp',
              valueDefaultLabel: outlinedBorderDefaultLabel,
              valueDefaultDisabledLabel: '1 dp',
            ),
            lastWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Pressed width'),
              value: controller.outlinedButtonPressedBorderWidth,
              onChanged: controller.setOutlinedButtonPressedBorderWidth,
              min: 0.5,
              max: 6,
              divisions: 11,
              valueDecimalPlaces: 1,
              valueHeading: 'WIDTH',
              valueUnitLabel: ' dp',
              valueDefaultLabel: pressedOutlinedBorderDefaultLabel,
              valueDefaultDisabledLabel: '1 dp',
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('TextButton color'),
          defaultLabel: 'primary',
          value: controller.textButtonSchemeColor,
          onChanged: controller.setTextButtonSchemeColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextButtonShowcase(),
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          value: controller.textButtonBorderRadius,
          onChanged: controller.setTextButtonBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: textButtonRadiusDefaultLabel,
          valueDefaultDisabledLabel: useMaterial3 ? 'stadium' : '4 dp',
        ),
        const Divider(),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitleReveal: Text(
            'With the API you can also set the button text styles with '
            'FlexSubThemesData properties:\n'
            '\n'
            '- elevatedButtonTextStyle\n'
            '- outlinedButtonTextStyle\n'
            '- filledButtonTextStyle\n'
            '- textButtonTextStyle\n',
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
