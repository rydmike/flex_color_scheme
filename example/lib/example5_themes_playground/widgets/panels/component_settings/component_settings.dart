import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/splash_type_enum.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/component_colors_reveal.dart';
import '../../shared/splash_type_popup_menu.dart';

// Panel used to turn usage ON/OFF usage of opinionated component sub-themes.
//
// Settings are available for border radius and a few other options.
class ComponentSettings extends StatelessWidget {
  const ComponentSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue117755 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/117755',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text('Use component sub themes'),
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        const Divider(),
        SwitchListTileReveal(
          title: const Text('Use M2 style divider in M3'),
          subtitleDense: true,
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Material-3 the primary color tinted outlineVariant '
                      'Divider may not fit on all background colors. The '
                      'Material-2 style based on black or white, with opacity, '
                      'always fits. It is also less prominent than the M3 '
                      'style and may be preferred. In Flutter 3.3 to at least '
                      '3.10, the Divider color also has theming '
                      'inconsistencies, it gets different colors depending on '
                      'used ThemeData constructor. For more information see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue117755,
                  text: 'issue #117755',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. FCS fixes this issue, but if you do not use FCS, '
                      'it is a theming issue to be aware of.\n',
                ),
              ],
            ),
          ),
          value: controller.useM2StyleDividerInM3 &&
              controller.useSubThemes &&
              controller.useMaterial3 &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes &&
                  controller.useFlexColorScheme &&
                  controller.useMaterial3
              ? controller.setUseM2StyleDividerInM3
              : null,
        ),
        SwitchListTileReveal(
          title: const Text('Tinted disabled components'),
          subtitleDense: true,
          subtitle: const Text(
            'Disabled controls get a slight primary color '
            'tint or tint of its own color, if it is not primary colored. '
            'Turn OFF for Flutter grey defaults. '
            'Impacts ThemeData disabledColor, but also disabled state color on '
            'all individual components. Material-3 UI components typically '
            'ignore the ThemeData disabledColor. Their disabled styling is '
            'defined on component themes. This setting applies tinted '
            'disabled style on all components that support it.\n',
          ),
          value: controller.tintedDisabledControls &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setTintedDisabledControls
              : null,
        ),
        SwitchListTileReveal(
          title: const Text('Tinted interactions'),
          subtitleDense: true,
          subtitle: const Text(
            'Hover, focus, highlight, pressed and splash '
            'colors get a slight primary color tint, or tint of its '
            'own color, if it is not primary colored. '
            'Turn OFF for Flutter grey defaults. '
            'Impacts ThemeData hover, focus, highlight and splash colors. '
            'Material-3 components implement their own interaction '
            'effects. This setting also styles all of them on component theme '
            'level. Most components are covered, a few cases may not be fully '
            'supported due to lack of support in the Flutter framework. Their '
            'later inclusion in this setting will be reported as new features, '
            'not as style breaking.\n',
          ),
          value: controller.interactionEffects &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInteractionEffects
              : null,
        ),
        SplashTypePopupMenu(
          title: const Text('Ink splash effect'),
          subtitle: const Text(
            'Defines the type of tap ink splash effect used on Material '
            'UI components.\n',
          ),
          index: controller.splashType?.index ?? -1,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? (int index) {
                  if (index < 0 || index >= SplashTypeEnum.values.length) {
                    controller.setSplashType(null);
                  } else {
                    controller.setSplashType(SplashTypeEnum.values[index]);
                  }
                }
              : null,
        ),
        const Divider(),
        const ComponentColorsReveal(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: ShowSubThemeColors(showTitle: false),
        ),
      ],
    );
  }
}
