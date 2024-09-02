import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';

class TabBarSettings extends StatelessWidget {
  const TabBarSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterPr119690 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/119690',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    // Logic to enable unselected light opacity value
    final bool unselectedLightOpacityEnabled =
        enableControl && controller.tabBarItemSchemeColorLight != null;

    // Logic to enable unselected dark opacity value
    final bool unselectedDarkOpacityEnabled =
        enableControl && controller.tabBarItemSchemeColorDark != null;

    // Logic for default unselected light mode default label
    String unselectedLightLabel() {
      if (!controller.useSubThemes || !controller.useFlexColorScheme) {
        return 'default (TabBarStyle)';
      }
      if (controller.tabBarItemSchemeColorLight == null &&
          controller.tabBarUnselectedItemSchemeColorLight == null) {
        return 'default (TabBarStyle)';
      }
      if (controller.tabBarItemSchemeColorLight != null) {
        if (useMaterial3) {
          return 'default (onSurfaceVariant)';
        } else {
          // ignore: lines_longer_than_80_chars
          return 'default (${SchemeColor.values[controller.tabBarItemSchemeColorLight!.index].name})';
        }
      }
      return 'default (TabBarStyle)';
    }

    // Logic for default unselected light mode default label
    String unselectedDarkLabel() {
      if (!controller.useSubThemes || !controller.useFlexColorScheme) {
        return 'default (TabBarStyle)';
      }
      if (controller.tabBarItemSchemeColorDark == null &&
          controller.tabBarUnselectedItemSchemeColorDark == null) {
        return 'default (TabBarStyle)';
      }
      if (controller.tabBarItemSchemeColorDark != null) {
        if (useMaterial3) {
          return 'default (onSurfaceVariant)';
        } else {
          // ignore: lines_longer_than_80_chars
          return 'default (${SchemeColor.values[controller.tabBarItemSchemeColorDark!.index].name})';
        }
      }
      return 'default (TabBarStyle)';
    }

    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('TabBar colors and styles'),
          subtitleReveal: Text('With component themes enabled you can select '
              'scheme color for the tab items and indicator separately. '
              'Using TabBarStyle conveniently syncs the TabBar to active '
              'AppBar or surface theme, but this offers more '
              'options if that is needed. '
              'These settings override used TabBarStyle, set them '
              'back to default to use TabBarStyle again.\n'),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          shadowColor: Colors.transparent,
          color: theme.colorScheme.surfaceContainerHighest,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TabBarForAppBarShowcase(),
                SizedBox(height: 16),
                TabBarScrollingForAppBarShowcase(),
                SizedBox(height: 16),
                TabBarForBackgroundShowcase(explain: true),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        EnumPopupMenu<FlexTabBarStyle>(
          values: FlexTabBarStyle.values,
          title: const Text('TabBarStyle'),
          enabled: controller.useFlexColorScheme &&
              controller.tabBarItemSchemeColorLight == null,
          value: controller.tabBarStyle,
          onChanged: controller.setTabBarStyle,
        ),
        EnumPopupMenu<TabAlignment>(
          enabled: enableControl,
          values: TabAlignment.values,
          title: const Text('Tab alignment'),
          subtitleReveal: const Text('If any of your TabBar widgets are '
              'scrollable only the TabBar alignment options "fill" and '
              '"center" are valid values.\n'
              'If any of your TabBar widgets are fixed, the common case, '
              'only the TabBar alignment options "start", "startOffset" and '
              '"center" are valid alignment values.\n'
              '\n'
              'If you theme to an alignment value that is not '
              "valid by any of your TabBar widget's scrolling setting, those "
              'TabBars will throw an exception !!!\n'
              '\n'
              'If you have both scrollable and fixed TabBar widgets '
              'in your app, you can only theme to the "center" alignment or '
              'leave it at default undefined, which causes Flutter to use '
              'different default styles for fixed and scrollable variants.\n'
              '\n'
              'NOTE: The TabBar widgets presented in the Playground have '
              'logic to ignore invalid TabAlignment values.\n'
              'Hot take: Flutter should do that by default!\n'),
          value: controller.tabBarTabAlignment,
          onChanged: controller.setTabBarTabAlignment,
        ),
        if (isLight) ...<Widget>[
          ColorSchemePopupMenu(
            title: const Text('Light selected item color'),
            labelForDefault: 'default (TabBarStyle)',
            index: controller.tabBarItemSchemeColorLight?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarItemSchemeColorLight(null);
                    } else {
                      controller.setTabBarItemSchemeColorLight(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          ColorSchemePopupMenu(
            title: const Text('Light unselected items color'),
            labelForDefault: unselectedLightLabel(),
            index: controller.tabBarUnselectedItemSchemeColorLight?.index ?? -1,
            onChanged: enableControl &&
                    controller.tabBarItemSchemeColorLight != null
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarUnselectedItemSchemeColorLight(null);
                    } else {
                      controller.setTabBarUnselectedItemSchemeColorLight(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          SliderListTileReveal(
            enabled: unselectedLightOpacityEnabled,
            title: const Text('Light unselected item opacity'),
            value: controller.tabBarUnselectedItemOpacityLight,
            onChanged: controller.setTabBarUnselectedItemOpacityLight,
            min: 0,
            max: 1,
            divisions: 100,
            valueDisplayScale: 100,
            valueDecimalPlaces: 0,
            valueHeading: 'OPACITY',
            valueUnitLabel: ' %',
            valueDefaultLabel: useMaterial3 ? '100%' : '70%',
          ),
          ColorSchemePopupMenu(
            title: const Text('Light indicator color'),
            labelForDefault: 'default (TabBarStyle)',
            index: controller.tabBarIndicatorLight?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarIndicatorLight(null);
                    } else {
                      controller
                          .setTabBarIndicatorLight(SchemeColor.values[index]);
                    }
                  }
                : null,
          )
        ] else ...<Widget>[
          ColorSchemePopupMenu(
            title: const Text('Dark selected item color'),
            labelForDefault: 'default (TabBarStyle)',
            index: controller.tabBarItemSchemeColorDark?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarItemSchemeColorDark(null);
                    } else {
                      controller.setTabBarItemSchemeColorDark(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          ColorSchemePopupMenu(
            title: const Text('Dark unselected items color'),
            labelForDefault: unselectedDarkLabel(),
            index: controller.tabBarUnselectedItemSchemeColorDark?.index ?? -1,
            onChanged: enableControl &&
                    controller.tabBarItemSchemeColorDark != null
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarUnselectedItemSchemeColorDark(null);
                    } else {
                      controller.setTabBarUnselectedItemSchemeColorDark(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          SliderListTileReveal(
            enabled: unselectedDarkOpacityEnabled,
            title: const Text('Dark unselected item opacity'),
            value: controller.tabBarUnselectedItemOpacityDark,
            onChanged: controller.setTabBarUnselectedItemOpacityDark,
            min: 0,
            max: 1,
            divisions: 100,
            valueDisplayScale: 100,
            valueDecimalPlaces: 0,
            valueHeading: 'OPACITY',
            valueUnitLabel: ' %',
            valueDefaultLabel: useMaterial3 ? '100%' : '70%',
          ),
          ColorSchemePopupMenu(
            title: const Text('Dark indicator color'),
            labelForDefault: 'default (TabBarStyle)',
            index: controller.tabBarIndicatorDark?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setTabBarIndicatorDark(null);
                    } else {
                      controller
                          .setTabBarIndicatorDark(SchemeColor.values[index]);
                    }
                  }
                : null,
          )
        ],
        EnumPopupMenu<TabBarIndicatorSize>(
          values: TabBarIndicatorSize.values,
          enabled: enableControl,
          title: const Text('Indicator style'),
          value: controller.tabBarIndicatorSize,
          onChanged: controller.setTabBarIndicatorSize,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Indicator weight'),
          value: controller.tabBarIndicatorWeight,
          onChanged: controller.setTabBarIndicatorWeight,
          min: 0,
          max: 10,
          divisions: 20,
          valueDecimalPlaces: 1,
          valueHeading: 'WEIGHT',
          valueUnitLabel: ' dp',
          valueDefaultLabel: useMaterial3 ? '3 dp' : '2 dp',
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Indicator top edge radius'),
          value: controller.tabBarIndicatorTopRadius,
          onChanged: controller.setTabBarIndicatorTopRadius,
          min: 0,
          max: 10,
          divisions: 20,
          valueDecimalPlaces: 1,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: useMaterial3 ? '3 dp' : '0 dp',
        ),
        SwitchListTileReveal(
          title: const Text('Remove bottom divider'),
          subtitleReveal: const Text('Removes the bottom divider on M3 TabBar, '
              'does not have any effect on M2 mode TabBar.\n'),
          value: enableControl &&
              useMaterial3 &&
              controller.tabBarDividerColor == Colors.transparent,
          onChanged: controller.useFlexColorScheme &&
                  controller.useSubThemes &&
                  useMaterial3
              ? (bool removeDivider) {
                  if (removeDivider) {
                    controller.setTabBarDividerColor(Colors.transparent);
                  } else {
                    controller.setTabBarDividerColor(null);
                  }
                }
              : null,
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: spanTextStyle,
                    text: 'In Flutter 3.7 and earlier the TabBar dividerColor '
                        'cannot be set '
                        'via a theme in Material-3 mode. This is fixed in '
                        'Flutter 3.10 and later via ',
                  ),
                  LinkTextSpan(
                    style: linkStyle,
                    uri: _fcsFlutterPr119690,
                    text: 'PR #119690',
                  ),
                  TextSpan(
                    style: spanTextStyle,
                    text: '.\n',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
