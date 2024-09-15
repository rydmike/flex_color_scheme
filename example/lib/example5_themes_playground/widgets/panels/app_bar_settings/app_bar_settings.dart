import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_theme.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../shared/back_to_actual_platform.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/is_web_list_tile.dart';
import '../../shared/platform_popup_menu.dart';
import 'app_bar_center_title_toggle_buttons.dart';
import 'app_bar_style_popup_menu.dart';

class AppBarSettings extends StatelessWidget {
  const AppBarSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue110951 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/110951',
  );
  static final Uri _fcsFlutterIssue123943 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/123943',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    // Paddings for the two column control layouts.
    const EdgeInsetsDirectional paddingStartColumn =
        EdgeInsetsDirectional.only(start: 16, end: 8);
    final EdgeInsetsDirectional paddingEndColumn =
        EdgeInsetsDirectional.only(start: 8, end: useMaterial3 ? 24 : 16);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('AppBar colors and styles'),
          subtitleReveal: Text('With component themes enabled you can select a '
              'ColorScheme based color for the AppBar background color. '
              'Using AppBarStyle is convenient and does not require activating '
              'FlexColorScheme component themes, but activating them gives '
              'more theming options.\n'
              '\n'
              'Selecting a color, overrides used AppBarStyle. Set it back '
              'to default to use AppBarStyle again. Using AppBarStyle also '
              'offers Scaffold background color as AppBar color, which can be '
              'different from ColorScheme surface colors.\n'),
        ),
        // Show sample AppBar's in a Card
        Card(
          elevation: 0,
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: theme.colorScheme.surfaceContainerHighest,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: AppBarShowcase(),
          ),
        ),
        // TODO(rydmike): Issue, does not get enabled when turning off subthemes
        //  if sub-themes had and background color selected. FIX!!
        // TODO(rydmike): We get wrong contrast color for prim style! FIX!
        if (isLight)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: AppBarStylePopupMenu(
                  contentPadding: paddingStartColumn,
                  title: const Text('Light AppBarStyle'),
                  enabled: controller.useFlexColorScheme &&
                      controller.appBarBackgroundSchemeColorLight == null,
                  value: controller.appBarStyleLight,
                  onChanged: controller.setAppBarStyleLight,
                  // To access the custom color we defined for AppBars in this
                  // PopupMenu buttons widget, we have to pass it along, or the
                  // entire controller. We chose the color in this case. It is
                  // not carried with the theme, so we cannot get it from there
                  // in the widget. FlexColorScheme knows the color when
                  // you make a theme with it. This color is used to show the
                  // correct color on the AppBar custom color option for the not
                  // built-in custom color scheme.
                  // In our examples we only actually have a custom app bar
                  // color in the three custom color examples, and we want to
                  // show them as well on the PopupMenu button.
                  customAppBarColor:
                      AppColor.scheme(controller).light.appBarColor,
                  isBlended: controller.blendLevel > 0,
                ),
              ),
              Expanded(
                child: SliderListTileReveal(
                  contentPadding: paddingEndColumn,
                  enabled: controller.useFlexColorScheme,
                  title: const Text('Opacity'),
                  subtitleReveal:
                      const Text('The themed opacity of the AppBar in light '
                          'mode, try 85% to 98%\n'),
                  value: controller.appBarOpacityLight,
                  onChanged: controller.setAppBarOpacityLight,
                  min: 0,
                  max: 1,
                  divisions: 100,
                  valueDisplayScale: 100,
                  valueDecimalPlaces: 0,
                  valueHeading: 'OPACITY',
                  valueUnitLabel: ' %',
                  valueDefaultLabel: '100 %',
                ),
              ),
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: AppBarStylePopupMenu(
                  contentPadding: paddingStartColumn,
                  title: const Text('Dark AppBarStyle'),
                  enabled: controller.useFlexColorScheme &&
                      controller.appBarBackgroundSchemeColorDark == null,
                  value: controller.appBarStyleDark,
                  onChanged: controller.setAppBarStyleDark,
                  customAppBarColor:
                      AppColor.scheme(controller).dark.appBarColor,
                  isBlended: controller.blendLevelDark > 0,
                ),
              ),
              Expanded(
                child: SliderListTileReveal(
                  contentPadding: paddingEndColumn,
                  enabled: controller.useFlexColorScheme,
                  title: const Text('Opacity'),
                  subtitleReveal:
                      const Text('The themed opacity of the AppBar in dark '
                          'mode, try 85% to 98%\n'),
                  value: controller.appBarOpacityDark,
                  onChanged: controller.setAppBarOpacityDark,
                  min: 0,
                  max: 1,
                  divisions: 100,
                  valueDisplayScale: 100,
                  valueDecimalPlaces: 0,
                  valueHeading: 'OPACITY',
                  valueUnitLabel: ' %',
                  valueDefaultLabel: '100 %',
                ),
              ),
            ],
          ),
        const ListTileReveal(
          dense: true,
          title: Text('AppBar color'),
          subtitleReveal: Text(
            'With component themes enabled you can select a '
            'ColorScheme based color for the AppBar background color.\n'
            '\n'
            'Using AppBarStyle is an older API that does not require '
            'activating '
            'FlexColorScheme component themes. Using component themes '
            'offers more choices. '
            'Selecting a background color, overrides the older used '
            'AppBarStyle property. Set it back '
            'to default to use AppBarStyle again.\n'
            '\n'
            'Using AppBarStyle uniquely '
            'offers Scaffold background color as AppBar color, which when '
            'using surface blends can be different from ColorScheme '
            'surface colors.\n',
          ),
        ),
        // TODO(rydmike): Incomplete migration to ColorSchemePopupMenuNew. Fix!
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (isLight)
              Expanded(
                child: ColorSchemePopupMenuNew(
                  enabled: enableControl,
                  contentPadding: paddingStartColumn,
                  title: const Text('Background color'),
                  defaultLabel: 'AppBarStyle',
                  defaultDisabledLabel:
                      controller.useFlexColorScheme ? 'AppBarStyle' : 'surface',
                  defaultDisabledLabelM2:
                      controller.useFlexColorScheme ? 'AppBarStyle' : 'primary',
                  value: controller.appBarBackgroundSchemeColorLight,
                  onChanged: controller.setAppBarBackgroundSchemeColorLight,
                ),
              )
            else
              Expanded(
                child: ColorSchemePopupMenuNew(
                  enabled: enableControl,
                  contentPadding: paddingStartColumn,
                  title: const Text('Background color'),
                  defaultLabel: 'AppBarStyle',
                  defaultDisabledLabel:
                      controller.useFlexColorScheme ? 'AppBarStyle' : 'surface',
                  value: controller.appBarBackgroundSchemeColorDark,
                  onChanged: controller.setAppBarBackgroundSchemeColorDark,
                ),
              ),
            if (isLight)
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  title: const Text('Background color'),
                  defaultLabel: controller.useFlexColorScheme
                      ? 'default (AppBarStyle)'
                      : useMaterial3
                          ? 'default (surface)'
                          : 'default (primary)',
                  value:
                      controller.appBarBackgroundSchemeColorLight?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setAppBarBackgroundSchemeColorLight(null);
                          } else {
                            controller.setAppBarBackgroundSchemeColorLight(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              )
            else
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  title: const Text('Background color'),
                  defaultLabel: controller.useFlexColorScheme
                      ? 'default (AppBarStyle)'
                      : 'default (surface)',
                  value:
                      controller.appBarBackgroundSchemeColorDark?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setAppBarBackgroundSchemeColorDark(null);
                          } else {
                            controller.setAppBarBackgroundSchemeColorDark(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
            if (isLight)
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingEndColumn,
                  title: const Text('Title color'),
                  defaultLabel: controller.useFlexColorScheme
                      ? 'default (AppBarStyle)'
                      : useMaterial3
                          ? 'default (surface)'
                          : 'default (primary)',
                  value:
                      controller.appBarForegroundSchemeColorLight?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setAppBarForegroundSchemeColorLight(null);
                          } else {
                            controller.setAppBarForegroundSchemeColorLight(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              )
            else
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingEndColumn,
                  title: const Text('Title color'),
                  defaultLabel: controller.useFlexColorScheme
                      ? 'default (AppBarStyle)'
                      : 'default (surface)',
                  value:
                      controller.appBarForegroundSchemeColorDark?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setAppBarForegroundSchemeColorDark(null);
                          } else {
                            controller.setAppBarForegroundSchemeColorDark(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (isLight)
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  title: const Text('Icon color'),
                  defaultLabel: controller.useFlexColorScheme
                      ? 'default (AppBarStyle)'
                      : useMaterial3
                          ? 'default (surface)'
                          : 'default (primary)',
                  value: controller.appBarIconSchemeColorLight?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setAppBarIconSchemeColorLight(null);
                          } else {
                            controller.setAppBarIconSchemeColorLight(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              )
            else
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  title: const Text('Icon color'),
                  defaultLabel: controller.useFlexColorScheme
                      ? 'default (AppBarStyle)'
                      : 'default (surface)',
                  value: controller.appBarIconSchemeColorDark?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setAppBarIconSchemeColorDark(null);
                          } else {
                            controller.setAppBarIconSchemeColorDark(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
            if (isLight)
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingEndColumn,
                  title: const Text('Actions icon color'),
                  defaultLabel: controller.useFlexColorScheme
                      ? 'default (AppBarStyle)'
                      : useMaterial3
                          ? 'default (surface)'
                          : 'default (primary)',
                  value:
                      controller.appBarActionsIconSchemeColorLight?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setAppBarActionsIconSchemeColorLight(null);
                          } else {
                            controller.setAppBarActionsIconSchemeColorLight(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              )
            else
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingEndColumn,
                  title: const Text('Title color'),
                  defaultLabel: controller.useFlexColorScheme
                      ? 'default (AppBarStyle)'
                      : 'default (surface)',
                  value:
                      controller.appBarActionsIconSchemeColorDark?.index ?? -1,
                  onChanged: controller.useSubThemes &&
                          controller.useFlexColorScheme
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setAppBarActionsIconSchemeColorDark(null);
                          } else {
                            controller.setAppBarActionsIconSchemeColorDark(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: AppBarCenterTitleToggleButtons(
                controller: controller,
                contentPadding: paddingStartColumn,
              ),
            ),
            Expanded(
              child: SwitchListTileReveal(
                contentPadding: paddingEndColumn,
                title: const Text('Remove scrim'),
                subtitleReveal: const Text(
                  'ON  No scrim on top status bar, as in Material-3 spec\n'
                  'OFF Use a two toned AppBar with a scrim on top status bar\n'
                  'This settings only applies to the Android platform.\n',
                ),
                value: controller.transparentStatusBar &&
                    controller.useFlexColorScheme,
                onChanged: controller.useFlexColorScheme
                    ? controller.setTransparentStatusBar
                    : null,
              ),
            ),
          ],
        ),
        if (isLight)
          Row(
            children: <Widget>[
              Expanded(
                child: SliderListTileReveal(
                  contentPadding: paddingStartColumn,
                  enabled: controller.useFlexColorScheme,
                  title: const Text('Elevation'),
                  value: controller.appBarElevationLight,
                  onChanged: controller.setAppBarElevationLight,
                  min: 0,
                  max: 20,
                  divisions: 40,
                  valueHeading: 'ELEV',
                  valueDecimalPlaces: 1,
                  valueDefaultLabel: '0',
                  valueDefaultDisabledLabel: useMaterial3 ? '0' : '4',
                ),
              ),
              Expanded(
                child: SliderListTileReveal(
                  contentPadding: paddingEndColumn,
                  enabled: enableControl && useMaterial3,
                  title: const Text('Scroll under'),
                  value: controller.appBarScrolledUnderElevationLight,
                  onChanged: controller.setAppBarScrolledUnderElevationLight,
                  min: 0,
                  max: 20,
                  divisions: 40,
                  valueHeading: 'ELEV',
                  valueDecimalPlaces: 1,
                  valueDefaultLabel: '3',
                ),
              ),
            ],
          )
        else
          Row(
            children: <Widget>[
              Expanded(
                child: SliderListTileReveal(
                  contentPadding: paddingStartColumn,
                  enabled: controller.useFlexColorScheme,
                  title: const Text('Elevation'),
                  value: controller.appBarElevationDark,
                  onChanged: controller.setAppBarElevationDark,
                  min: 0,
                  max: 20,
                  divisions: 40,
                  valueHeading: 'ELEV',
                  valueDecimalPlaces: 1,
                  valueDefaultLabel: '0',
                  valueDefaultDisabledLabel: useMaterial3 ? '0' : '4',
                ),
              ),
              Expanded(
                child: SliderListTileReveal(
                  contentPadding: paddingEndColumn,
                  enabled: enableControl && useMaterial3,
                  title: const Text('Scroll under'),
                  value: controller.appBarScrolledUnderElevationDark,
                  onChanged: controller.setAppBarScrolledUnderElevationDark,
                  min: 0,
                  max: 20,
                  divisions: 40,
                  valueHeading: 'ELEV',
                  valueDecimalPlaces: 1,
                  valueDefaultLabel: '3',
                ),
              ),
            ],
          ),

        const Divider(),
        const ListTileReveal(
          title: Text('Platform adaptive settings'),
          // subtitleDense: true,
          subtitleReveal: Text(
              'With platform adaptive settings you can modify theme '
              'properties to have a different response on selected platforms. '
              'You can select which platforms the platform adaptive value '
              'should be used on. While all other platforms not included '
              'in this choice, will continue to use the none adaptive '
              'value or default behavior.\n'
              '\n'
              'Using the API you can customize which platform an adaptive '
              'feature is used on, including separate definitions when using '
              'the app in a web build on each platform. The selections here '
              'use built-in combinations, they cover most use cases.'),
        ),
        if (isLight)
          EnumPopupMenu<AdaptiveTheme>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveTheme.values,
            title: const Text('Scroll under elevation tint removal'),
            subtitleReveal: Text(
              'Remove the AppBar scroll under tint '
              'elevation effect in Material-3 light mode on selected '
              'platforms. This setting has no effect in Material-2 mode.\n'
              '\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveAppBarScrollUnderOffLight?.describe ?? AdaptiveTheme.off.describe}',
            ),
            value: controller.adaptiveAppBarScrollUnderOffLight,
            onChanged: controller.setAdaptiveAppBarScrollUnderOffLight,
          )
        else
          EnumPopupMenu<AdaptiveTheme>(
            enabled: enableControl && controller.useMaterial3,
            values: AdaptiveTheme.values,
            title: const Text('Scroll under elevation tint removal'),
            subtitleReveal: Text(
              'Remove the AppBar scroll under tint '
              'elevation effect in Material-3 dark mode on selected '
              'platforms. This setting has no effect in Material-2 mode.\n'
              '\n'
              // ignore: lines_longer_than_80_chars
              '${controller.adaptiveAppBarScrollUnderOffDark?.describe ?? AdaptiveTheme.off.describe}',
            ),
            value: controller.adaptiveAppBarScrollUnderOffDark,
            onChanged: controller.setAdaptiveAppBarScrollUnderOffDark,
          ),
        PlatformPopupMenu(
          platform: controller.platform,
          onChanged: controller.setPlatform,
        ),
        IsWebListTile(controller: controller),
        BackToActualPlatform(controller: controller),
        const Divider(),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.7 and earlier, when using '
                      'SliverAppBar.large or '
                      'SliverAppBar.medium, the foreground color cannot be '
                      'changed with widget or theme properties, see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue110951,
                  text: 'issue #110951',
                ),
                TextSpan(
                    style: spanTextStyle,
                    text: '. This is fixed in 3.10 and later.\n'
                        '\n'
                        'Before Flutter 3.13, the theming and defaults are '
                        'also incorrect for the '
                        'action icons for SliverAppBar.large or '
                        'SliverAppBar.medium, see '),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue123943,
                  text: 'issue #123943',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: ', this is fixed in Flutter 3.13 and later.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
