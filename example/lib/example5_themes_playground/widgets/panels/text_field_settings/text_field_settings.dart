import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../dialogs/set_text_field_to_defaults_dialog.dart';
import '../../dialogs/set_text_field_to_m3_dialog.dart';
import '../../shared/color_scheme_popup_menu.dart';

class TextFieldSettings extends StatelessWidget {
  const TextFieldSettings(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterHandleLimit = Uri(
    scheme: 'https',
    host: 'api.flutter.dev',
    path: 'flutter/material/TextSelectionThemeData/selectionHandleColor.html',
  );

  Future<void> _handleSetToM3(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const SetTextFieldToM3Dialog();
      },
    );
    if (reset ?? false) {
      await controller.setTextFieldToM3();
    }
  }

  Future<void> _handleSetToDefaults(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const SetTextFieldToDefaultsDialog();
      },
    );
    if (reset ?? false) {
      await controller.setTextFieldToDefaults();
    }
  }

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

    final String unfocusedBorderDefaultLabel =
        controller.inputDecoratorBorderWidth == null &&
                controller.thinBorderWidth == null
            ? '1 dp'
            : controller.inputDecoratorBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global ${controller.thinBorderWidth!.toStringAsFixed(1)} dp'
                : '';
    final String focusedBorderDefaultLabel =
        controller.inputDecoratorFocusedBorderWidth == null &&
                controller.thickBorderWidth == null
            ? '2 dp'
            : controller.inputDecoratorFocusedBorderWidth == null &&
                    controller.thickBorderWidth != null
                ? 'global ${controller.thickBorderWidth!.toStringAsFixed(1)} dp'
                : '';

    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String decoratorRadiusDefaultLabel =
        controller.inputDecoratorBorderRadius == null && effectiveRadius == null
            ? useMaterial3
                ? '4 dp'
                : '10 dp'
            : controller.inputDecoratorBorderRadius == null &&
                    effectiveRadius != null
                ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
                : '';

    // Default decorator alpha values and labels
    final double defaultBackgroundAlpha = useMaterial3
        ? 0xFF // #FF = 255 = 100% Light M3 default
        : isLight
            ? 0x0D // #0D = 13 = 5.1% Light FCS own M2 default
            : 0x14; // #14 = 20 = 7.84% Dark FCS own M2 default

    final String lightBackgroundLabel =
        enableControl && controller.inputDecoratorBackgroundAlphaLight != null
            ? '${controller.inputDecoratorBackgroundAlphaLight}'
            : '${defaultBackgroundAlpha.toInt()}';

    final String lightBackgroundLabelOpacity =
        enableControl && controller.inputDecoratorBackgroundAlphaLight != null
            ? (controller.inputDecoratorBackgroundAlphaLight! / 255 * 100)
                .toStringAsFixed(1)
            : (defaultBackgroundAlpha / 255 * 100).toStringAsFixed(1);

    final String darkBackgroundLabel =
        enableControl && controller.inputDecoratorBackgroundAlphaDark != null
            ? '${controller.inputDecoratorBackgroundAlphaDark}'
            : useMaterial3
                ? '255' // #FF = 255 = 100% Dark M3 default
                : '20'; // #14 = 20 = 7.84% Dark FCS own M2 default

    final String darkBackgroundLabelOpacity =
        enableControl && controller.inputDecoratorBackgroundAlphaDark != null
            ? (controller.inputDecoratorBackgroundAlphaDark! / 255 * 100)
                .toStringAsFixed(1)
            : (defaultBackgroundAlpha / 255 * 100).toStringAsFixed(1);

    // Defaults for tex selection setup and info.
    //
    final double defaultSelectionOpacity = isLight
        ? 0.3 // Light FCS own default
        : 0.5; // Dark FCS own default

    final String selectionLabelDefaultOpacity =
        '${(defaultSelectionOpacity * 100).toStringAsFixed(0)} %';
    //
    final String baseDefaultLabelLightColor = controller
                .inputDecoratorSchemeColorLight !=
            null
        // ignore: lines_longer_than_80_chars
        ? 'default (${SchemeColor.values[controller.inputDecoratorSchemeColorLight!.index].name})'
        : 'default (primary)';
    final String baseDefaultLabelDarkColor = controller
                .inputDecoratorSchemeColorDark !=
            null
        // ignore: lines_longer_than_80_chars
        ? 'default (${SchemeColor.values[controller.inputDecoratorSchemeColorDark!.index].name})'
        : 'default (primary)';
    //
    final String baseDefaultHandleLabelLightColor = controller
                    .inputDecoratorSchemeColorLight !=
                null &&
            controller.inputDecoratorSchemeColorLight != SchemeColor.primary
        // ignore: lines_longer_than_80_chars
        ? 'default (${SchemeColor.values[controller.inputDecoratorSchemeColorLight!.index].name})'
        : 'default (primary)';
    final String baseDefaultHandleLabelDarkColor = controller
                    .inputDecoratorSchemeColorDark !=
                null &&
            controller.inputDecoratorSchemeColorDark != SchemeColor.primary
        // ignore: lines_longer_than_80_chars
        ? 'default (${SchemeColor.values[controller.inputDecoratorSchemeColorDark!.index].name})'
        : 'default (primary)';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTileReveal(
          title: const Text('Use Material 3 default TextField style?'),
          subtitleReveal: const Text(
              'Update settings below to match M3 default '
              'values. Also sets text selection style.\n'
              'Can also be used in M2 mode, but the result is different from '
              'when used in actual M3 mode.'),
          trailing: FilledButton(
            onPressed: () async {
              await _handleSetToM3(context);
            },
            child: const Text('Set to M3'),
          ),
          onTap: () async {
            await _handleSetToM3(context);
          },
        ),
        ListTileReveal(
          title: const Text('Reset TextField to FlexColorScheme defaults?'),
          subtitleReveal: const Text("Update settings to FlexColorScheme's own "
              'opinionated default values. Also resets text selection style.\n'
              'The FCS defaults for M2 and M3 are different, the M3 mode '
              'defaults are very close to M3 defaults, but use a filled '
              'outline style.'),
          trailing: FilledButton(
            onPressed: () async {
              await _handleSetToDefaults(context);
            },
            child: const Text('Defaults'),
          ),
          onTap: () async {
            await _handleSetToDefaults(context);
          },
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 16,
            end: useMaterial3 ? 24 : 16,
            bottom: 0,
          ),
          child: const TextFieldShowcase(),
        ),
        const Divider(),
        SwitchListTileReveal(
          contentPadding: EdgeInsetsDirectional.only(
            start: 16,
            end: useMaterial3 ? 28 : 20,
          ),
          title: const Text('Background filled'),
          subtitleReveal:
              const Text('TIP: If you leave this OFF, you can still '
                  'theme the fill color and turn it ON using widget level '
                  "filled: true' property and it gets the themed fill "
                  'style by default, but you can also use unfilled style.\n'),
          value: enableControl && controller.inputDecoratorIsFilled,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInputDecoratorIsFilled
              : null,
        ),
        if (isLight)
          Row(
            children: <Widget>[
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Color light mode'),
                  labelForDefault: useMaterial3
                      ? 'default (surfaceContainerHighest)'
                      : 'default (primary)',
                  index: controller.inputDecoratorSchemeColorLight?.index ?? -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setInputDecoratorSchemeColorLight(null);
                          } else {
                            controller.setInputDecoratorSchemeColorLight(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
              Expanded(
                child: SliderListTileReveal(
                  enabled: enableControl,
                  contentPadding:
                      EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                  title: const Text('Opacity'),
                  subtitle: Text('Alpha as opacity is '
                      '$lightBackgroundLabelOpacity %'),
                  value:
                      controller.inputDecoratorBackgroundAlphaLight?.toDouble(),
                  onChanged: (double? value) {
                    controller.setInputDecoratorBackgroundAlphaLight(
                        value == null || value < 0 ? null : value.toInt());
                  },
                  min: 0,
                  max: 255,
                  divisions: 255,
                  valueDecimalPlaces: 0,
                  valueHeading: 'ALPHA',
                  valueDefaultLabel: lightBackgroundLabel,
                ),
              )
            ],
          )
        else
          Row(
            children: <Widget>[
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Color dark mode'),
                  labelForDefault: useMaterial3
                      ? 'default (surfaceVariant)'
                      : 'default (primary)',
                  index: controller.inputDecoratorSchemeColorDark?.index ?? -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setInputDecoratorSchemeColorDark(null);
                          } else {
                            controller.setInputDecoratorSchemeColorDark(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
              Expanded(
                child: SliderListTileReveal(
                  enabled: enableControl,
                  contentPadding:
                      EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                  title: const Text('Opacity'),
                  subtitle: Text('Alpha as opacity is '
                      '$darkBackgroundLabelOpacity %'),
                  value:
                      controller.inputDecoratorBackgroundAlphaDark?.toDouble(),
                  onChanged: (double? value) {
                    controller.setInputDecoratorBackgroundAlphaDark(
                        value == null || value < 0 ? null : value.toInt());
                  },
                  min: 0,
                  max: 255,
                  divisions: 255,
                  valueDecimalPlaces: 0,
                  valueHeading: 'ALPHA',
                  valueDefaultLabel: darkBackgroundLabel,
                ),
              ),
            ],
          ),
        Row(
          children: <Widget>[
            if (isLight)
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Focused prefix icon'),
                  labelForDefault: useMaterial3
                      ? 'default (onSurface)'
                      // ignore: lines_longer_than_80_chars
                      : 'default (${controller.inputDecoratorSchemeColorLight?.name ?? 'primary'})',
                  index:
                      controller.inputDecoratorPrefixIconSchemeColor?.index ??
                          -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setInputDecoratorPrefixIconSchemeColor(null);
                          } else {
                            controller.setInputDecoratorPrefixIconSchemeColor(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              )
            else
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Focused prefix icon'),
                  labelForDefault: useMaterial3
                      ? 'default (onSurface)'
                      // ignore: lines_longer_than_80_chars
                      : 'default (${controller.inputDecoratorSchemeColorDark?.name ?? 'primary'})',
                  index: controller
                          .inputDecoratorPrefixIconDarkSchemeColor?.index ??
                      -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setInputDecoratorPrefixIconDarkSchemeColor(
                                    null);
                          } else {
                            controller
                                .setInputDecoratorPrefixIconDarkSchemeColor(
                                    SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
            if (isLight)
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding:
                      EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                  title: const Text('Focused suffix icon'),
                  labelForDefault: useMaterial3
                      ? 'default (onSurface)'
                      // ignore: lines_longer_than_80_chars
                      : 'default (${controller.inputDecoratorSchemeColorLight?.name ?? 'primary'})',
                  index:
                      controller.inputDecoratorPrefixIconSchemeColor?.index ??
                          -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setInputDecoratorPrefixIconSchemeColor(null);
                          } else {
                            controller.setInputDecoratorPrefixIconSchemeColor(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              )
            else
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding:
                      EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                  title: const Text('Focused suffix icon'),
                  labelForDefault: useMaterial3
                      ? 'default (onSurface)'
                      // ignore: lines_longer_than_80_chars
                      : 'default (${controller.inputDecoratorSchemeColorDark?.name ?? 'primary'})',
                  index: controller
                          .inputDecoratorPrefixIconDarkSchemeColor?.index ??
                      -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setInputDecoratorPrefixIconDarkSchemeColor(
                                    null);
                          } else {
                            controller
                                .setInputDecoratorPrefixIconDarkSchemeColor(
                                    SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
          ],
        ),
        const Divider(),
        //
        // Border type and radius
        //
        Row(
          children: <Widget>[
            Expanded(
              child: SwitchListTile(
                title: const Text(
                  'Border type',
                ),
                subtitle: const Text(
                  'OFF underline  |  ON outline',
                ),
                value: controller.inputDecoratorBorderType ==
                        FlexInputBorderType.outline &&
                    controller.useSubThemes &&
                    controller.useFlexColorScheme,
                onChanged: enableControl
                    ? (bool isOn) {
                        if (isOn) {
                          controller.setInputDecoratorBorderType(
                              FlexInputBorderType.outline);
                        } else {
                          controller.setInputDecoratorBorderType(
                              FlexInputBorderType.underline);
                        }
                      }
                    : null,
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding:
                    EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                enabled: enableControl,
                title: const Text('Radius'),
                value: controller.inputDecoratorBorderRadius,
                onChanged: controller.setInputDecoratorBorderRadius,
                min: 0,
                max: 40,
                divisions: 40,
                valueDecimalPlaces: 0,
                valueHeading: 'RADIUS',
                valueUnitLabel: ' dp',
                valueDefaultLabel: decoratorRadiusDefaultLabel,
                valueDefaultDisabledLabel: '4 dp',
              ),
            ),
          ],
        ),

        const Divider(),
        //
        // Border color and style
        //
        Row(
          children: <Widget>[
            if (isLight)
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Border light mode'),
                  labelForDefault: baseDefaultLabelLightColor,
                  index:
                      controller.inputDecoratorBorderSchemeColorLight?.index ??
                          -1,
                  onChanged: enableControl &&
                          !(!controller.inputDecoratorFocusedHasBorder &&
                              (!controller.inputDecoratorUnfocusedHasBorder ||
                                  !controller
                                      .inputDecoratorUnfocusedBorderIsColored))
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setInputDecoratorBorderSchemeColorLight(null);
                          } else {
                            controller.setInputDecoratorBorderSchemeColorLight(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              )
            else
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Border dark mode'),
                  labelForDefault: baseDefaultLabelDarkColor,
                  index:
                      controller.inputDecoratorBorderSchemeColorDark?.index ??
                          -1,
                  onChanged: enableControl &&
                          !(!controller.inputDecoratorFocusedHasBorder &&
                              (!controller.inputDecoratorUnfocusedHasBorder ||
                                  !controller
                                      .inputDecoratorUnfocusedBorderIsColored))
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setInputDecoratorBorderSchemeColorDark(null);
                          } else {
                            controller.setInputDecoratorBorderSchemeColorDark(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
            Expanded(
              child: SwitchListTile(
                contentPadding:
                    EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                title: const Text('Unfocused uses color'),
                value: enableControl &&
                    controller.inputDecoratorUnfocusedBorderIsColored &&
                    controller.inputDecoratorUnfocusedHasBorder,
                onChanged: controller.useSubThemes &&
                        controller.inputDecoratorUnfocusedHasBorder &&
                        controller.useFlexColorScheme
                    ? controller.setInputDecoratorUnfocusedBorderIsColored
                    : null,
              ),
            ),
          ],
        ),
        //
        // Unfocused border
        //
        Row(
          children: <Widget>[
            Expanded(
              child: SwitchListTile(
                title: const Text('Unfocused has border'),
                value: enableControl &&
                    controller.inputDecoratorUnfocusedHasBorder,
                onChanged: enableControl
                    ? controller.setInputDecoratorUnfocusedHasBorder
                    : null,
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding:
                    EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                enabled: enableControl &&
                    controller.inputDecoratorUnfocusedHasBorder,
                title: const Text('Unfocused border width'),
                value: controller.inputDecoratorBorderWidth,
                onChanged: controller.setInputDecoratorBorderWidth,
                min: 0.5,
                max: 6,
                divisions: 11,
                valueDecimalPlaces: 1,
                valueHeading: 'WIDTH',
                valueDefaultLabel: unfocusedBorderDefaultLabel,
                valueDefaultDisabledLabel: '1 dp',
                valueUnitLabel: ' dp',
              ),
            ),
          ],
        ),
        //
        // Focused border
        //
        Row(
          children: <Widget>[
            Expanded(
              child: SwitchListTile(
                title: const Text('Focused has border'),
                value:
                    enableControl && controller.inputDecoratorFocusedHasBorder,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? controller.setInputDecoratorFocusedHasBorder
                        : null,
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding:
                    EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                enabled:
                    enableControl && controller.inputDecoratorFocusedHasBorder,
                title: const Text('Border width'),
                value: controller.inputDecoratorFocusedBorderWidth,
                onChanged: controller.setInputDecoratorFocusedBorderWidth,
                min: 0.5,
                max: 6,
                divisions: 11,
                valueDecimalPlaces: 1,
                valueHeading: 'WIDTH',
                valueDefaultLabel: focusedBorderDefaultLabel,
                valueDefaultDisabledLabel: '2 dp',
                valueUnitLabel: ' dp',
              ),
            ),
          ],
        ),

        //
        // Text Selection Style
        //
        const Divider(),
        if (isLight)
          const ListTile(title: Text('Light mode TextSelection style'))
        else
          const ListTile(title: Text('Dark mode TextSelection style')),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            showCursor: true,
            decoration: InputDecoration(
              hintText: 'Write something to try text selection style',
              labelText: 'TextField selection',
            ),
          ),
        ),
        if (isLight) ...<Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Cursor'),
                  labelForDefault: baseDefaultLabelLightColor,
                  index: controller.inputCursorLightSchemeColor?.index ?? -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setInputCursorLightSchemeColor(null);
                          } else {
                            controller.setInputCursorLightSchemeColor(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding:
                      EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                  title: const Text('Selection handles'),
                  labelForDefault: baseDefaultHandleLabelLightColor,
                  index:
                      controller.inputSelectionHandleLightSchemeColor?.index ??
                          -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setInputSelectionHandleLightSchemeColor(null);
                          } else {
                            controller.setInputSelectionHandleLightSchemeColor(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Selection'),
                  labelForDefault: baseDefaultLabelLightColor,
                  index: controller.inputSelectionLightSchemeColor?.index ?? -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setInputSelectionLightSchemeColor(null);
                          } else {
                            controller.setInputSelectionLightSchemeColor(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
              Expanded(
                child: SliderListTileReveal(
                  contentPadding:
                      EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                  enabled: enableControl,
                  title: const Text('Selection opacity'),
                  value: controller.inputSelectionLightOpacity,
                  onChanged: controller.setInputSelectionLightOpacity,
                  min: 0,
                  max: 1,
                  divisions: 100,
                  valueDisplayScale: 100,
                  valueDecimalPlaces: 0,
                  valueHeading: 'OPACITY',
                  valueUnitLabel: ' %',
                  valueDefaultLabel: selectionLabelDefaultOpacity,
                  valueDefaultDisabledLabel: '40 %',
                ),
              ),
            ],
          ),
        ] else ...<Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Cursor'),
                  labelForDefault: baseDefaultLabelDarkColor,
                  index: controller.inputCursorDarkSchemeColor?.index ?? -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setInputCursorDarkSchemeColor(null);
                          } else {
                            controller.setInputCursorDarkSchemeColor(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding:
                      EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                  title: const Text('Selection handles'),
                  labelForDefault: baseDefaultHandleLabelDarkColor,
                  index:
                      controller.inputSelectionHandleDarkSchemeColor?.index ??
                          -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller
                                .setInputSelectionHandleDarkSchemeColor(null);
                          } else {
                            controller.setInputSelectionHandleDarkSchemeColor(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ColorSchemePopupMenu(
                  title: const Text('Selection'),
                  labelForDefault: baseDefaultLabelDarkColor,
                  index: controller.inputSelectionDarkSchemeColor?.index ?? -1,
                  onChanged: enableControl
                      ? (int index) {
                          if (index < 0 || index >= SchemeColor.values.length) {
                            controller.setInputSelectionDarkSchemeColor(null);
                          } else {
                            controller.setInputSelectionDarkSchemeColor(
                                SchemeColor.values[index]);
                          }
                        }
                      : null,
                ),
              ),
              Expanded(
                child: SliderListTileReveal(
                  contentPadding:
                      EdgeInsetsDirectional.only(end: useMaterial3 ? 24 : 16),
                  enabled: enableControl,
                  title: const Text('Selection opacity'),
                  value: controller.inputSelectionDarkOpacity,
                  onChanged: controller.setInputSelectionDarkOpacity,
                  min: 0,
                  max: 1,
                  divisions: 100,
                  valueDisplayScale: 100,
                  valueDecimalPlaces: 0,
                  valueHeading: 'OPACITY',
                  valueUnitLabel: ' %',
                  valueDefaultLabel: selectionLabelDefaultOpacity,
                  valueDefaultDisabledLabel: '40 %',
                ),
              ),
            ],
          ),
        ],
        //
        // Known issues
        //
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The text selection handle color cannot be changed '
                      'using a global theme when using Material TextField on '
                      'iOS platforms. They can only be primary color, see API '
                      'doc ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterHandleLimit,
                  text: 'selectionHandleColor property',
                ),
                TextSpan(
                    style: spanTextStyle,
                    text: ' for more information. consider making an '
                        'improvement proposal issue in the Flutter '
                        'repo if you want this to change.\n'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
