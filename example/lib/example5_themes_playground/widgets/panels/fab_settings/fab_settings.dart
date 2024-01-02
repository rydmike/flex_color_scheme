import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

class FabSettings extends StatelessWidget {
  const FabSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue115827 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/115827',
  );

  static final Uri _fcsFlutterIssue107946 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/107946',
  );

  static final Uri _fcsChipUmbrellaIssue115364 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/115364',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String fabRadiusDefaultLabel = controller.fabBorderRadius == null &&
            effectiveRadius == null
        ? 'default 16'
        : controller.fabBorderRadius == null && controller.defaultRadius != null
            ? 'global ${effectiveRadius!.toStringAsFixed(0)}'
            : '';

    final String chipRadiusDefaultLabel =
        controller.chipBorderRadius == null && effectiveRadius == null
            ? 'default 8'
            : controller.chipBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${effectiveRadius!.toStringAsFixed(0)}'
                : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          title: const Text('FloatingActionButton color'),
          labelForDefault: controller.useMaterial3
              ? 'default (primaryContainer)'
              : 'default (secondary)',
          index: controller.fabSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setFabSchemeColor(null);
                  } else {
                    controller.setFabSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FabShowcase(),
        ),
        SwitchListTileReveal(
          title: const Text('Use themed shape'),
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitleDense: true,
          subtitle: const Text('OFF removes shape usage, making it use default '
              'style, regardless of global border radius setting or own radius '
              'setting.\n'),
          value: controller.fabUseShape &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setFabUseShape
              : null,
        ),
        SwitchListTileReveal(
          enabled: controller.fabUseShape &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          title: const Text('Always circular'),
          subtitleDense: true,
          subtitle: const Text('Turn on to always use circular and stadium '
              'shaped FAB, also in Material 3.\n'),
          value: controller.fabAlwaysCircular &&
              controller.fabUseShape &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes &&
                  controller.useFlexColorScheme &&
                  controller.fabUseShape
              ? controller.setFabAlwaysCircular
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes &&
              controller.useFlexColorScheme &&
              controller.fabUseShape &&
              !controller.fabAlwaysCircular,
          title: const Text('Border radius'),
          subtitle: Slider(
            min: -1,
            max: 60,
            divisions: 61,
            label: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.fabUseShape &&
                    !controller.fabAlwaysCircular
                ? controller.fabBorderRadius == null ||
                        (controller.fabBorderRadius ?? -1) < 0
                    ? fabRadiusDefaultLabel
                    : (controller.fabBorderRadius?.toStringAsFixed(0) ?? '')
                : controller.fabAlwaysCircular && controller.fabUseShape
                    ? 'circular'
                    : controller.useMaterial3
                        ? 'M3 rounded'
                        : 'circular',
            value: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.fabUseShape &&
                    !controller.fabAlwaysCircular
                ? controller.fabBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
                    controller.fabUseShape &&
                    !controller.fabAlwaysCircular
                ? (double value) {
                    controller.setFabBorderRadius(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes &&
                          controller.useFlexColorScheme &&
                          controller.fabUseShape &&
                          !controller.fabAlwaysCircular
                      ? controller.fabBorderRadius == null ||
                              (controller.fabBorderRadius ?? -1) < 0
                          ? fabRadiusDefaultLabel
                          : (controller.fabBorderRadius?.toStringAsFixed(0) ??
                              '')
                      : controller.fabAlwaysCircular && controller.fabUseShape
                          ? 'circular'
                          : controller.useMaterial3
                              ? 'M3 rounded'
                              : 'circular',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues and limitations'),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Current Flutter SDK FAB theming has limitations. '
                      'You cannot make themed FABs where the radius varies '
                      'by FAB type, like the M3 defaults do. See '
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
      ],
    );
  }
}
