import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';
import 'tab_bar_indicator_size_popup_menu.dart';
import 'tab_bar_style_popup_menu.dart';

class TabBarSettings extends StatelessWidget {
  const TabBarSettings(this.controller, {super.key});
  final ThemeController controller;

  String explainTabStyle(final FlexTabBarStyle style) {
    switch (style) {
      case FlexTabBarStyle.forAppBar:
        return 'Style: forAppbar\n'
            'Works with used app bar style in both M2 and M3 mode. '
            'FCS Default style';
      case FlexTabBarStyle.forBackground:
        return 'Style: forBackground\n'
            'Works on surface colors, like Scaffold, but '
            'also works on surface colored AppBar in M2 and M3';
      case FlexTabBarStyle.flutterDefault:
        return 'Style: flutterDefault\n'
            'Flutter default style. In M2, it works on primary color in '
            'light mode, and background color in dark mode. In M3 it '
            'works on surface colors.';
      case FlexTabBarStyle.universal:
        return 'Style: universal\n'
            'Experimental universal style, has '
            'low contrast. May change in future versions';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    // final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
    //     color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // Logic to enable unselected light opacity value
    final bool unselectedLightOpacityEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        controller.tabBarItemSchemeColorLight != null;
    final double unselectedOpacityLight = unselectedLightOpacityEnabled
        ? (controller.tabBarUnselectedItemOpacityLight ?? -0.01)
        : -0.01;
    // Logic to enable unselected dark opacity value
    final bool unselectedDarkOpacityEnabled = controller.useSubThemes &&
        controller.useFlexColorScheme &&
        controller.tabBarItemSchemeColorDark != null;
    final double unselectedOpacityDark = unselectedDarkOpacityEnabled
        ? (controller.tabBarUnselectedItemOpacityDark ?? -0.01)
        : -0.01;

    // Logic for default indicator weight label.
    final String weightDefaultLabel = controller.tabBarIndicatorWeight == null
        ? controller.useMaterial3
            ? 'default 3'
            : 'default 2'
        : controller.tabBarIndicatorWeight!.toStringAsFixed(1);
    // Logic for default indicator top radius label.
    final String topRadiusDefaultLabel =
        controller.tabBarIndicatorTopRadius == null
            ? controller.useMaterial3
                ? 'default 3'
                : 'default 0'
            : controller.tabBarIndicatorTopRadius!.toStringAsFixed(1);
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
        if (controller.useMaterial3) {
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
        if (controller.useMaterial3) {
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
        const ListTile(
          title: Text('TabBar'),
          subtitle: Text('FlexColorscheme comes with a quick TabBar styling '
              'option, where you can choose if it should always fit in '
              'your AppBar, regardless of what theme you set for the AppBar. '
              'Usually you want this, but sometimes surface might be preferred '
              'or the Flutter SDK default style. In M2 mode Flutter default '
              'does not work well on surface colored AppBar and in M3 mode '
              'the default does not work with primary colored AppBar. By using '
              'the forAppBar style, the TabBar always fits with the AppBar.'),
        ),
        const SizedBox(height: 8),
        TabBarStylePopupMenu(
          title: const Text('Select TabBarStyle that fits your use case'),
          labelForDefault:
              useMaterial3 ? 'Default (flutterDefault)' : 'Default (forAppBar)',
          index: controller.tabBarStyle?.index ?? -1,
          onChanged: controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= FlexTabBarStyle.values.length) {
                    controller.setTabBarStyle(null);
                  } else {
                    controller.setTabBarStyle(FlexTabBarStyle.values[index]);
                  }
                }
              : null,
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TabBarForAppBarShowcase(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TabBarForBackgroundShowcase(),
        ),
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Custom TabBar colors and styles'),
          subtitle: Text('With component themes enabled you can select '
              'scheme color for the tab items and indicator separately. '
              'Using TabBarStyle conveniently syncs the TabBar to active '
              'AppBar or surface theme, but this offers more '
              'options if that is needed. '
              'These settings override used TabBarStyle, set them '
              'back to default to use TabBarStyle again.'),
        ),
        if (isLight) ...<Widget>[
          ColorSchemePopupMenu(
            title: const Text('Light selected item color'),
            labelForDefault: 'default (TabBarStyle)',
            index: controller.tabBarItemSchemeColorLight?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
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
          ListTile(
            enabled: unselectedLightOpacityEnabled,
            title: const Text('Light unselected item opacity'),
            subtitle: Slider(
              min: -1,
              max: 100,
              divisions: 101,
              label: unselectedLightOpacityEnabled
                  ? controller.tabBarUnselectedItemOpacityLight == null ||
                          (controller.tabBarUnselectedItemOpacityLight ?? -1) <
                              0
                      ? controller.useMaterial3
                          ? 'default 100%'
                          : 'default 70%'
                      : (unselectedOpacityLight * 100).toStringAsFixed(0)
                  : controller.useMaterial3
                      ? 'default 100%'
                      : 'default 70%',
              value: unselectedOpacityLight * 100,
              onChanged: unselectedLightOpacityEnabled
                  ? (double value) {
                      controller.setTabBarUnselectedItemOpacityLight(
                          value < 0 ? null : value / 100);
                    }
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'OPACITY',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    unselectedLightOpacityEnabled
                        ? controller.tabBarUnselectedItemOpacityLight == null ||
                                (controller.tabBarUnselectedItemOpacityLight ??
                                        -1) <
                                    0
                            ? controller.useMaterial3
                                ? 'default 100%'
                                : 'default 70%'
                            // ignore: lines_longer_than_80_chars
                            : '${(unselectedOpacityLight * 100).toStringAsFixed(0)} %'
                        : controller.useMaterial3
                            ? 'default 100%'
                            : 'default 70%',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          ColorSchemePopupMenu(
            title: const Text('Light indicator color'),
            labelForDefault: 'default (TabBarStyle)',
            index: controller.tabBarIndicatorLight?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
            onChanged: controller.useSubThemes &&
                    controller.useFlexColorScheme &&
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
          ListTile(
            enabled: unselectedDarkOpacityEnabled,
            title: const Text('Dark unselected item opacity'),
            subtitle: Slider(
              min: -1,
              max: 100,
              divisions: 101,
              label: unselectedDarkOpacityEnabled
                  ? controller.tabBarUnselectedItemOpacityDark == null ||
                          (controller.tabBarUnselectedItemOpacityDark ?? -1) < 0
                      ? controller.useMaterial3
                          ? 'default 100%'
                          : 'default 70%'
                      : (unselectedOpacityDark * 100).toStringAsFixed(0)
                  : controller.useMaterial3
                      ? 'default 100%'
                      : 'default 70%',
              value: unselectedOpacityDark * 100,
              onChanged: unselectedDarkOpacityEnabled
                  ? (double value) {
                      controller.setTabBarUnselectedItemOpacityDark(
                          value < 0 ? null : value / 100);
                    }
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'OPACITY',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    unselectedDarkOpacityEnabled
                        ? controller.tabBarUnselectedItemOpacityDark == null ||
                                (controller.tabBarUnselectedItemOpacityDark ??
                                        -1) <
                                    0
                            ? controller.useMaterial3
                                ? 'default 100%'
                                : 'default 70%'
                            // ignore: lines_longer_than_80_chars
                            : '${(unselectedOpacityDark * 100).toStringAsFixed(0)} %'
                        : controller.useMaterial3
                            ? 'default 100%'
                            : 'default 70%',
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          ColorSchemePopupMenu(
            title: const Text('Dark indicator color'),
            labelForDefault: 'default (TabBarStyle)',
            index: controller.tabBarIndicatorDark?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
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
        TabBarIndicatorSizePopupMenu(
          title: const Text('Indicator style'),
          labelForDefault: useMaterial3 ? 'Default (label)' : 'Default (tab)',
          index: controller.tabBarIndicatorSize?.index ?? -1,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? (int index) {
                  if (index < 0 || index >= TabBarIndicatorSize.values.length) {
                    controller.setTabBarIndicatorSize(null);
                  } else {
                    controller.setTabBarIndicatorSize(
                        TabBarIndicatorSize.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Indicator weight'),
          subtitle: Slider(
            min: -0.5,
            max: 10,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tabBarIndicatorWeight == null ||
                        (controller.tabBarIndicatorWeight ?? -0.5) < 0
                    ? weightDefaultLabel
                    : (controller.tabBarIndicatorWeight?.toStringAsFixed(1) ??
                        '')
                : controller.useMaterial3
                    ? 'default 3'
                    : 'default 2',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tabBarIndicatorWeight ?? -0.5
                : -0.5,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller
                        .setTabBarIndicatorWeight(value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.tabBarIndicatorWeight == null ||
                              (controller.tabBarIndicatorWeight ?? -0.5) < 0
                          ? weightDefaultLabel
                          : (controller.tabBarIndicatorWeight
                                  ?.toStringAsFixed(1) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 3'
                          : 'default 2',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Indicator top edge radius'),
          subtitle: Slider(
            min: -0.5,
            max: 10,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tabBarIndicatorTopRadius == null ||
                        (controller.tabBarIndicatorTopRadius ?? -0.5) < 0
                    ? topRadiusDefaultLabel
                    : (controller.tabBarIndicatorTopRadius
                            ?.toStringAsFixed(1) ??
                        '')
                : controller.useMaterial3
                    ? 'default 3'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.tabBarIndicatorTopRadius ?? -0.5
                : -0.5,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller
                        .setTabBarIndicatorTopRadius(value < 0 ? null : value);
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.tabBarIndicatorTopRadius == null ||
                              (controller.tabBarIndicatorTopRadius ?? -0.5) < 0
                          ? topRadiusDefaultLabel
                          : (controller.tabBarIndicatorTopRadius
                                  ?.toStringAsFixed(1) ??
                              '')
                      : controller.useMaterial3
                          ? 'default 3'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SwitchListTile(
          title: const Text('Remove bottom divider'),
          subtitle: const Text('Removes the bottom divider on M3 TabBar, '
              'does not have any effect on M2 mode TabBar.'),
          value: controller.useFlexColorScheme &&
              controller.useSubThemes &&
              controller.tabBarDividerColor == Colors.transparent,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? (bool removeDivider) {
                  if (removeDivider) {
                    controller.setTabBarDividerColor(Colors.transparent);
                  } else {
                    controller.setTabBarDividerColor(null);
                  }
                }
              : null,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.7 the TabBar dividerColor cannot be set '
                      'via theme in Material 3 mode',
                ),
                // LinkTextSpan(
                //   style: linkStyle,
                //   uri: _fcsFlutterFix117082,
                //   text: 'FIX PR #117082.',
                // ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. It is a bug and will be fixed. It has been left out '
                      'in property fallthrough, it does widget and M3 '
                      'defaults, but leaves out theme value in between them.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
