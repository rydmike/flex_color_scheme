import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

// Settings for the standard Material buttons.
class ButtonsSettings extends StatelessWidget {
  const ButtonsSettings(
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
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String elevatedButtonRadiusDefaultLabel =
        controller.elevatedButtonBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default\nstadium'
                : 'default\n40 dp'
            : controller.elevatedButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global\n${effectiveRadius.toStringAsFixed(0)} dp'
                : '';
    final String outlinedButtonRadiusDefaultLabel =
        controller.outlinedButtonBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default\nstadium'
                : 'default\n40 dp'
            : controller.outlinedButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global\n${effectiveRadius.toStringAsFixed(0)}'
                : '';
    final String textButtonRadiusDefaultLabel =
        controller.textButtonBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default\nstadium'
                : 'default\n40 dp'
            : controller.textButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global\n${effectiveRadius.toStringAsFixed(0)} dp'
                : '';
    final String filledButtonRadiusDefaultLabel =
        controller.filledButtonBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default\nstadium'
                : 'default\n40 dp'
            : controller.filledButtonBorderRadius == null &&
                    effectiveRadius != null
                ? 'global\n${effectiveRadius.toStringAsFixed(0)} dp'
                : '';
    final String outlinedBorderDefaultLabel =
        controller.outlinedButtonBorderWidth == null &&
                controller.thinBorderWidth == null
            ? 'default\n1 dp'
            : controller.outlinedButtonBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global\n${controller.thinBorderWidth!.toStringAsFixed(1)} dp'
                : 'default\n1 dp';
    final String pressedOutlinedBorderDefaultLabel = controller
                    .outlinedButtonPressedBorderWidth ==
                null &&
            controller.thickBorderWidth == null
        ? useMaterial3
            ? 'default\n1 dp'
            : 'default\n2 dp'
        : controller.outlinedButtonPressedBorderWidth == null &&
                controller.thickBorderWidth != null
            ? 'global\n${controller.thickBorderWidth!.toStringAsFixed(1)} dp'
            : 'default\n1 dp';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('ElevatedButton main color'),
          subtitle: controller.useMaterial3
              ? const Text('Foreground color')
              : const Text('Background color'),
          index: controller.elevatedButtonSchemeColor?.index ?? -1,
          onChanged: enableControl
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
          title: const Text('ElevatedButton secondary color'),
          subtitle: controller.useMaterial3
              ? const Text('Background color')
              : const Text('Foreground color'),
          labelForDefault: controller.useMaterial3
              ? 'default (surfaceContainerLow)'
              : 'default (onPrimary)',
          index: controller.elevatedButtonSecondarySchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setElevatedButtonSecondarySchemeColor(null);
                  } else {
                    controller.setElevatedButtonSecondarySchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          value: controller.elevatedButtonBorderRadius,
          onChanged: controller.setElevatedButtonBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDisplayScale: 1,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: elevatedButtonRadiusDefaultLabel,
          valueDefaultDisabledLabel:
              controller.useMaterial3 ? 'default\nstadium' : 'default\n4 dp',
        ),
        const Divider(),
        ColorSchemePopupMenu(
          labelForDefault: 'default (primary & secondaryContainer)',
          title: const Text('FilledButton color'),
          index: controller.filledButtonSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setFilledButtonSchemeColor(null);
                  } else {
                    controller
                        .setFilledButtonSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
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
          valueDisplayScale: 1,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: filledButtonRadiusDefaultLabel,
          valueDefaultDisabledLabel: 'default\nstadium',
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
                      'color. For same reason the tinted disable colors are '
                      'NOT set unless its main color is changed. If disabled '
                      'colors would be set, the different colors of the '
                      'buttons will also be lost. Separate colors and border '
                      'radius for the two variants will be offered when the '
                      'current limitation is removed. Go upvote the issue '
                      'by giving it thumbs-up!\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        ColorSchemePopupMenu(
          title: const Text('OutlinedButton foreground color'),
          index: controller.outlinedButtonSchemeColor?.index ?? -1,
          onChanged: enableControl
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
          title: const Text('OutlinedButton outline color'),
          labelForDefault: controller.useMaterial3
              ? 'default (outline)'
              : controller.useSubThemes && controller.useFlexColorScheme
                  ? 'default (primary)'
                  : 'default (onSurface opacity 0.12)',
          index: controller.outlinedButtonOutlineSchemeColor?.index ?? -1,
          onChanged: enableControl
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setOutlinedButtonOutlineSchemeColor(null);
                  } else {
                    controller.setOutlinedButtonOutlineSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          value: controller.outlinedButtonBorderRadius,
          onChanged: controller.setOutlinedButtonBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDisplayScale: 1,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: outlinedButtonRadiusDefaultLabel,
          valueDefaultDisabledLabel:
              controller.useMaterial3 ? 'default\nstadium' : 'default\n4 dp',
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: SliderListTileReveal(
                enabled: enableControl,
                title: const Text('Border width'),
                value: controller.outlinedButtonBorderWidth,
                onChanged: controller.setOutlinedButtonBorderWidth,
                min: 0.5,
                max: 6,
                divisions: 11,
                valueDisplayScale: 1,
                valueDecimalPlaces: 1,
                valueHeading: 'WIDTH',
                valueDefaultLabel: outlinedBorderDefaultLabel,
                valueDefaultDisabledLabel: 'default\n1 dp',
                valueUnitLabel: ' dp',
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                enabled: enableControl,
                title: const Text('Pressed border width'),
                value: controller.outlinedButtonPressedBorderWidth,
                onChanged: controller.setOutlinedButtonPressedBorderWidth,
                min: 0.5,
                max: 6,
                divisions: 11,
                valueDisplayScale: 1,
                valueDecimalPlaces: 1,
                valueHeading: 'WIDTH',
                valueDefaultLabel: pressedOutlinedBorderDefaultLabel,
                valueDefaultDisabledLabel: 'default\n1 dp',
                valueUnitLabel: ' dp',
              ),
            ),
          ],
        ),
        const Divider(),
        ColorSchemePopupMenu(
          title: const Text('TextButton color'),
          index: controller.textButtonSchemeColor?.index ?? -1,
          onChanged: enableControl
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
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          value: controller.textButtonBorderRadius,
          onChanged: controller.setTextButtonBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDisplayScale: 1,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: textButtonRadiusDefaultLabel,
          valueDefaultDisabledLabel:
              controller.useMaterial3 ? 'default\nstadium' : 'default\n4 dp',
        ),
      ],
    );
  }
}
