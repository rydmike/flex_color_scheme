import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';

class TabBarPanel extends StatelessWidget {
  const TabBarPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterPr119690 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/119690',
  );

  static final Uri _fcsFlutterIssue160631 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/160631',
  );

  static final Uri _fcsFlutterPr161514 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/161514',
  );

  static final Uri _fcsFlutterIssue162098 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/162098',
  );

  static final Uri _fcsFlutterPr162450 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/162450',
  );

  static final Uri _fcsFlutterTabBarBreak = Uri(
    scheme: 'https',
    host: 'docs.flutter.dev',
    path: 'release/breaking-changes/component-theme-normalization',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
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

    // Get the brightness need of current AppBar color, we need it
    // for when the scaffold background color is used as AppBar color, since
    // it can be whatever.
    final Color currentAppBarColor = theme.appBarTheme.backgroundColor ??
        (useMaterial3
            ? theme.colorScheme.surface
            : isLight
                ? theme.colorScheme.surface
                : theme.colorScheme.surface);
    final Brightness appBarBrightness =
        ThemeData.estimateBrightnessForColor(currentAppBarColor);

    String opacityLabel() {
      if (isLight && controller.tabBarItemSchemeColorLight != null) {
        return '100%';
      }
      if (!isLight && controller.tabBarItemSchemeColorDark != null) {
        return '100%';
      }
      switch (controller.tabBarStyle) {
        case FlexTabBarStyle.flutterDefault:
          return useMaterial3 ? '100%' : '70%';
        case FlexTabBarStyle.forBackground:
          return controller.useSubThemes ? '65%' : '60%';
        case FlexTabBarStyle.forAppBar:
          return (appBarBrightness == Brightness.light &&
                  (currentAppBarColor == Colors.white ||
                      currentAppBarColor == colorScheme.surface ||
                      currentAppBarColor == colorScheme.surfaceContainerLow))
              ? '60%'
              : '70%';
        case FlexTabBarStyle.universal:
          return isLight ? '50%' : '70%';
        case _:
          return useMaterial3
              ? '100%'
              : (appBarBrightness == Brightness.light &&
                      (currentAppBarColor == Colors.white ||
                          currentAppBarColor == colorScheme.surface ||
                          currentAppBarColor ==
                              colorScheme.surfaceContainerLow))
                  ? '60%'
                  : '70%';
      }
    }

    // Logic for default unselected light mode default label
    String unselectedLightLabel() {
      if (!controller.useSubThemes || !controller.useFlexColorScheme) {
        return 'TabBarStyle';
      }
      if (controller.tabBarItemSchemeColorLight == null &&
          controller.tabBarUnselectedItemSchemeColorLight == null) {
        return 'TabBarStyle';
      }
      if (controller.tabBarItemSchemeColorLight != null) {
        if (useMaterial3) {
          return 'onSurfaceVariant';
        } else {
          return SchemeColor
              .values[controller.tabBarItemSchemeColorLight!.index].name;
        }
      }
      return 'TabBarStyle';
    }

    // Logic for default unselected light mode default label
    String unselectedDarkLabel() {
      if (!controller.useSubThemes || !controller.useFlexColorScheme) {
        return 'TabBarStyle';
      }
      if (controller.tabBarItemSchemeColorDark == null &&
          controller.tabBarUnselectedItemSchemeColorDark == null) {
        return 'TabBarStyle';
      }
      if (controller.tabBarItemSchemeColorDark != null) {
        if (useMaterial3) {
          return 'onSurfaceVariant';
        } else {
          return SchemeColor
              .values[controller.tabBarItemSchemeColorDark!.index].name;
        }
      }
      return 'TabBarStyle';
    }

    // Logic for default unselected light mode default label
    String defaultIndicatorAnimation() {
      if (!controller.useSubThemes ||
          !controller.useFlexColorScheme ||
          controller.tabBarIndicatorSize == null) {
        if (useMaterial3) {
          return 'Default (elastic)';
        } else {
          return 'Default (linear)';
        }
      }
      if (controller.tabBarIndicatorSize == TabBarIndicatorSize.label) {
        return 'Default (elastic)';
      } else {
        return 'Default (linear)';
      }
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
              ((isLight && controller.tabBarItemSchemeColorLight == null) ||
                  (!isLight && controller.tabBarItemSchemeColorDark == null)),
          value: controller.tabBarStyle,
          onChanged: controller.setTabBarStyle,
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: EnumPopupMenu<TabAlignment>(
              enabled: enableControl,
              values: TabAlignment.values,
              title: const Text('Tab alignment'),
              subtitleReveal: const Text(
                'ISSUE:\n'
                'If any of your TabBar widgets are '
                'scrollable, only the TabBar alignment options "fill" and '
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
                'Hot take: Flutter should do this by default and not throw!\n',
              ),
              value: controller.tabBarTabAlignment,
              onChanged: controller.setTabBarTabAlignment,
            ),
            lastWidget: EnumPopupMenu<TabIndicatorAnimation>(
              enabled: enableControl,
              values: TabIndicatorAnimation.values,
              defaultLabel: defaultIndicatorAnimation(),
              title: const Text('Tab animation'),
              subtitleReveal: const Text('Default is elastic if style is only '
                  'label, otherwise linear.\n'),
              value: controller.tabBarIndicatorAnimation,
              onChanged: controller.setTabBarIndicatorAnimation,
            ),
            isRow: isRow,
          );
        }),
        if (isLight) ...<Widget>[
          ColorSchemePopupMenu(
            enabled: enableControl,
            title: const Text('Light selected item color'),
            defaultLabel: 'TabBarStyle',
            value: controller.tabBarItemSchemeColorLight,
            onChanged: controller.setTabBarItemSchemeColorLight,
          ),
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                title: const Text('Light unselected items color'),
                defaultLabel: unselectedLightLabel(),
                value: controller.tabBarUnselectedItemSchemeColorLight,
                onChanged: controller.setTabBarUnselectedItemSchemeColorLight,
              ),
              lastWidget: SliderListTileReveal(
                enabled: enableControl, //unselectedLightOpacityEnabled,
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                title: const Text('Opacity'),
                value: controller.tabBarUnselectedItemOpacityLight,
                onChanged: controller.setTabBarUnselectedItemOpacityLight,
                min: 0,
                max: 1,
                divisions: 100,
                valueDisplayScale: 100,
                valueDecimalPlaces: 0,
                valueHeading: 'OPACITY',
                valueUnitLabel: ' %',
                valueDefaultLabel: opacityLabel(),
              ),
              isRow: isRow,
            );
          }),
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                title: const Text('Light indicator color'),
                defaultLabel: 'TabBarStyle',
                value: controller.tabBarIndicatorLight,
                onChanged: controller.setTabBarIndicatorLight,
              ),
              lastWidget: EnumPopupMenu<TabBarIndicatorSize>(
                values: TabBarIndicatorSize.values,
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                title: const Text('Indicator style'),
                value: controller.tabBarIndicatorSize,
                onChanged: controller.setTabBarIndicatorSize,
              ),
              isRow: isRow,
            );
          }),
        ] else ...<Widget>[
          ColorSchemePopupMenu(
            enabled: enableControl,
            title: const Text('Dark selected item color'),
            defaultLabel: 'TabBarStyle',
            value: controller.tabBarItemSchemeColorDark,
            onChanged: controller.setTabBarItemSchemeColorDark,
          ),
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                title: const Text('Dark unselected items color'),
                defaultLabel: unselectedDarkLabel(),
                value: controller.tabBarUnselectedItemSchemeColorDark,
                onChanged: controller.setTabBarUnselectedItemSchemeColorDark,
              ),
              lastWidget: SliderListTileReveal(
                enabled: enableControl, //unselectedDarkOpacityEnabled,
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                title: const Text('Opacity'),
                value: controller.tabBarUnselectedItemOpacityDark,
                onChanged: controller.setTabBarUnselectedItemOpacityDark,
                min: 0,
                max: 1,
                divisions: 100,
                valueDisplayScale: 100,
                valueDecimalPlaces: 0,
                valueHeading: 'OPACITY',
                valueUnitLabel: ' %',
                valueDefaultLabel: opacityLabel(),
              ),
              isRow: isRow,
            );
          }),
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                title: const Text('Dark indicator color'),
                defaultLabel: 'TabBarStyle',
                value: controller.tabBarIndicatorDark,
                onChanged: controller.setTabBarIndicatorDark,
              ),
              lastWidget: EnumPopupMenu<TabBarIndicatorSize>(
                values: TabBarIndicatorSize.values,
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                title: const Text('Indicator style'),
                value: controller.tabBarIndicatorSize,
                onChanged: controller.setTabBarIndicatorSize,
              ),
              isRow: isRow,
            );
          }),
        ],
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
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
            lastWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
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
            isRow: isRow,
          );
        }),
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
                    text: '.\n'
                        '\n'
                        'In Flutter 3.24 the elastic TabBar indicator '
                        'animation is glitchy and in Flutter 3.27.0 to 3.27.2, '
                        'the elastic TabBar indicator animation is broken, '
                        'see issue ',
                  ),
                  LinkTextSpan(
                    style: linkStyle,
                    uri: _fcsFlutterIssue160631,
                    text: '#160631',
                  ),
                  TextSpan(
                    style: spanTextStyle,
                    text: '. The issue is fixed in Flutter 3.27.3 and later, '
                        'via ',
                  ),
                  LinkTextSpan(
                    style: linkStyle,
                    uri: _fcsFlutterPr161514,
                    text: 'PR #161514',
                  ),
                  TextSpan(
                    style: spanTextStyle,
                    text: '.\n'
                        '\n'
                        'In Flutter 3.29.0 the TabBar animation is again a bit '
                        'broken, see issue ',
                  ),
                  LinkTextSpan(
                    style: linkStyle,
                    uri: _fcsFlutterIssue162098,
                    text: '#162098',
                  ),
                  TextSpan(
                    style: spanTextStyle,
                    text: '. This is fixed in Flutter 3.29.1 via PR ',
                  ),
                  LinkTextSpan(
                    style: linkStyle,
                    uri: _fcsFlutterPr162450,
                    text: '#162098',
                  ),
                  TextSpan(
                    style: spanTextStyle,
                    text: '.\n\n'
                        'The TabBar theme API had breaking changes in '
                        'Flutter 3.27 release. These were addressed in '
                        'FlexColorScheme v8.1.0. In Flutter 3.31 (beta) '
                        'there were additional compile-time '
                        'breaking changes not present in Flutter 3.29 and '
                        'earlier versions. FlexColorScheme v8.2.0 and later '
                        'are compatible with these Flutter SDK breaking '
                        'changes. For more information, see the ',
                  ),
                  LinkTextSpan(
                    style: linkStyle,
                    uri: _fcsFlutterTabBarBreak,
                    text: 'TabBar theme API breaking changes',
                  ),
                  TextSpan(
                    style: spanTextStyle,
                    text: ', that documented the in Flutter 3.27 breaking '
                        'changes. Apparently, new changes were added, '
                        'as the TabBar theming that still worked in '
                        'Flutter 3.29, broke again in Flutter 3.31 beta and '
                        'later. Regardless of what and why was broken, '
                        'FCS v8.2.0 and later fixed the usage of the compile '
                        'breaking API.',
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
