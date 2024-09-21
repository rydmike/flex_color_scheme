import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/examples/show_sub_theme_colors.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/component_colors_reveal.dart';

// Panel used to turn usage ON/OFF usage of opinionated component sub-themes.
//
// Settings are available for border radius and a few other options.
class GeneralPanel extends StatelessWidget {
  const GeneralPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue117755 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/117755',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTileReveal(
          title: const Text('Use Material-3'),
          subtitleReveal: const Text(
            'Turning this OFF switches your theme to use the legacy Material-2 '
            'styling of components. It is recommended to keep it ON and use '
            'Material-3.\n'
            '\n'
            'Using Material-2 is still valid in Flutter 3.24 and not yet '
            'deprecated. Material-3 is the default in the framework '
            'since Flutter 3.16 and the recommended way to style your '
            'app when using Material design. There is a plan to deprecate '
            'Material-2 support in Flutter, but a timeline has not been '
            'communicated.\n'
            '\n'
            'If you prefer the Material-2 style, you can try the '
            'FlexColorScheme "Premade Designs" option called "Material 3 '
            'does M2". This will use Material-3 theming mode, but theme all '
            'components to look like Material-2, as far as it is possible. '
            'This will not be deprecated and will work also after the legacy '
            'Material-2 support has been removed from the Flutter framework.\n'
            '\n'
            'You can toggle this setting ON and OFF to observe the differences '
            'when Material-3 and legacy Material-2 is being used.',
          ),
          value: useMaterial3,
          onChanged: controller.setUseMaterial3,
        ),
        SwitchListTileReveal(
          title: const Text('Use FlexColorScheme theming'),
          subtitleReveal: const Text(
            'This is what you are here for so keep FlexColorScheme (FCS) '
            'theming ON.\n'
            '\n'
            'You can toggle it ON and OFF to observe the differences when FCS '
            "is being used, to Flutter's default theming. Even when OFF, the "
            'selected color theme is still being applied to the '
            'Themes Playground app.',
          ),
          value: controller.useFlexColorScheme,
          onChanged: controller.setUseFlexColorScheme,
        ),
        SwitchListTileReveal(
          title: const Text('Use component themes'),
          subtitleReveal: const Text(
            'If you are only here for color theming and want to do your own '
            'styling of components, turn this OFF.\n'
            '\n'
            'Regardless of if you use FCS component themes or not, you can '
            'always override the style of any component with your own, by '
            'using ".copyWith" on the FlexColorScheme produced ThemeData.\n'
            '\n'
            'You can toggle this setting ON and OFF to observe the '
            'differences between FCS with and without component themes '
            'enabled.',
          ),
          value: controller.useSubThemes && controller.useFlexColorScheme,
          onChanged:
              controller.useFlexColorScheme ? controller.setUseSubThemes : null,
        ),
        const Divider(),
        SwitchListTileReveal(
          title: const Text('Apply ColorScheme to all Cupertino components'),
          subtitleReveal: const Text(
            "Keep this ON to apply the colors of this Material theme's  "
            'ColorScheme to '
            'all Cupertino components. You typically want this, and we '
            'recommend that you keep this setting ON. '
            'For example, without this set to '
            'ON, the CupertinoSwitch remains iOS system green and not '
            'primary color, like the default themed Material Switch is.\n'
            '\n'
            'NOTE: Custom Material Switch component themed colors are NOT '
            'applied to the CupertinoSwitch, only the ColorScheme primary '
            'color is.',
          ),
          value: controller.applyThemeToAllCupertino &&
              controller.useFlexColorScheme,
          onChanged: controller.useFlexColorScheme
              ? controller.setApplyThemeToAllCupertino
              : null,
        ),
        const Divider(),
        SwitchListTileReveal(
          title: const Text('Use Material-2 style Divider in Material-3'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Material-3 the primary color tinted outlineVariant '
                      'colored Divider may not fit on all background colors. '
                      'The Material-2 style, based on black or white, with '
                      'opacity, always fits. It is also less prominent than '
                      'the default Material-3 style and may be preferred. '
                      'We prefer it and recommend setting this ON.\n'
                      '\n'
                      'In Flutter 3.3 to at least 3.24, the Divider color also '
                      'has theming inconsistencies, it gets different colors '
                      'depending on used ThemeData constructor. '
                      'For more information see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue117755,
                  text: 'issue #117755',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. FCS fixes this issue by default, but if you do not '
                      'use FCS, it is a theming issue to be aware of.\n',
                ),
              ],
            ),
          ),
          value: controller.useM2StyleDividerInM3 &&
              controller.useSubThemes &&
              useMaterial3 &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes &&
                  controller.useFlexColorScheme &&
                  useMaterial3
              ? controller.setUseM2StyleDividerInM3
              : null,
        ),
        SwitchListTileReveal(
          title: const Text('Tinted disabled components'),
          subtitleReveal: const Text(
            'Disabled controls get a slight primary color '
            'tint or tint of its own color, if it is not primary colored. '
            'Keep OFF for Flutter grey defaults. Turn it ON for subtly more '
            'color expressive disabled styles. We like it and recommend it.\n'
            '\n'
            'Turning it ON impacts ThemeData disabledColor, but also '
            'disabled state color on '
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
          subtitleReveal: const Text(
            'Hover, focus, highlight, pressed and splash '
            'colors get a slight primary color tint, or tint of its '
            'own color, if it is not primary colored.\n'
            '\n'
            "Keep OFF for Flutter's mostly grey defaults. "
            'Turn it ON for subtly more color expressive interaction styles. '
            'We like it and recommend it. It also makes interactions more '
            'consistent. By default Material-3 uses tinted interactions '
            'on some newer components, but it is not applied to all '
            'components. This settings also remedies this gap where it is '
            'possible.\n'
            '\n'
            'The ON state impacts ThemeData hover, focus, highlight and splash '
            'colors. Material-3 components implement their own interaction '
            'effects via WidgetState color properties. This also styles '
            'all Material components on component theme level. Most '
            'components are covered, a few cases may not be fully '
            'supported due to lack of support or issues in the Flutter '
            'framework. Their later inclusion in this setting will be '
            'reported as new features, not as style breaking.\n',
          ),
          value: controller.interactionEffects &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInteractionEffects
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
