import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

class FloatingActionButtonPanel extends StatelessWidget {
  const FloatingActionButtonPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue107946 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/107946',
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
    final String fabRadiusDefaultLabel = controller.fabBorderRadius == null &&
            effectiveRadius == null
        ? '16 dp'
        : controller.fabBorderRadius == null && controller.defaultRadius != null
            ? 'global ${effectiveRadius!.toStringAsFixed(0)} dp'
            : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Background color'),
          defaultLabel: 'primaryContainer',
          defaultLabelM2: 'secondary',
          value: controller.fabSchemeColor,
          onChanged: controller.setFabSchemeColor,
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Foreground color'),
          defaultLabel: controller.fabSchemeColor != null
              ? SchemeColor
                  .values[
                      FlexSubThemes.onSchemeColor(controller.fabSchemeColor!)
                          .index]
                  .name
              : useMaterial3
                  ? 'onPrimaryContainer'
                  : 'onSecondary',
          defaultDisabledLabel: 'onPrimaryContainer',
          defaultDisabledLabelM2: 'onSecondary',
          value: controller.fabForegroundSchemeColor,
          onChanged: controller.setFabForegroundSchemeColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FabShowcase(),
        ),
        SwitchListTileReveal(
          title: const Text('Use themed shape'),
          enabled: enableControl,
          subtitleReveal: const Text(
              'OFF removes shape usage, making it use default '
              'style, regardless of global border radius setting or own radius '
              'setting.\n'),
          value: controller.fabUseShape &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: enableControl ? controller.setFabUseShape : null,
        ),
        SwitchListTileReveal(
          enabled: enableControl && controller.fabUseShape,
          title: const Text('Always circular'),
          subtitleReveal:
              const Text('Turn on to always use circular and stadium '
                  'shaped FAB, also in Material-3.\n'),
          value: controller.fabAlwaysCircular &&
              controller.fabUseShape &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: enableControl && controller.fabUseShape
              ? controller.setFabAlwaysCircular
              : null,
        ),
        SliderListTileReveal(
          enabled: enableControl &&
              controller.fabUseShape &&
              !controller.fabAlwaysCircular,
          title: const Text('Border radius'),
          value: controller.fabBorderRadius,
          onChanged: controller.setFabBorderRadius,
          min: 0,
          max: 60,
          divisions: 60,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: fabRadiusDefaultLabel,
          valueDefaultDisabledLabel:
              controller.fabAlwaysCircular && controller.fabUseShape
                  ? 'circular'
                  : useMaterial3
                      ? 'M3 rounded'
                      : 'circular',
        ),
        const Divider(),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Current Flutter SDK FloatingActionButton theming has '
                      'limitations. You cannot make themed '
                      'FloatingActionButtons where the radius varies '
                      'by type, like the Material-3 defaults do. See '
                      'Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue107946,
                  text: 'issue #107946',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ' for more info.\n',
                ),
              ],
            ),
          ),
        ),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitleReveal: Text(
            'With the API you can also set the text style with '
            'FlexSubThemesData properties:\n'
            '\n'
            '- fabExtendedTextStyle\n',
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
