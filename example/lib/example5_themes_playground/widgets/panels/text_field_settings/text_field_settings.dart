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
            ? 'default\n1 dp'
            : controller.inputDecoratorBorderWidth == null &&
                    controller.thinBorderWidth != null
                ? 'global\n${controller.thinBorderWidth!.toStringAsFixed(1)} dp'
                : '';
    final String focusedBorderDefaultLabel = controller
                    .inputDecoratorFocusedBorderWidth ==
                null &&
            controller.thickBorderWidth == null
        ? 'default\n2 dp'
        : controller.inputDecoratorFocusedBorderWidth == null &&
                controller.thickBorderWidth != null
            ? 'global\n${controller.thickBorderWidth!.toStringAsFixed(1)} dp'
            : '';

    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String decoratorRadiusDefaultLabel =
        controller.inputDecoratorBorderRadius == null && effectiveRadius == null
            ? controller.useMaterial3
                ? 'default\n4 dp'
                : 'default\n10 dp'
            : controller.inputDecoratorBorderRadius == null &&
                    effectiveRadius != null
                ? 'global\n${effectiveRadius.toStringAsFixed(0)} dp'
                : '';

    // TODO: Add comment about defaults as opacity values
    // Default decorator alpha values and labels
    final double defaultBackgroundAlpha = useMaterial3
        ? 0xFF // Light M3 default
        : isLight
            ? 0x0D // Light FCS own M2 default
            : 0x14; // Dark FCS own M2 default

    final String lightBackgroundLabel = (controller
                        .inputDecoratorBackgroundAlphaLight ??
                    -1) >=
                0 &&
            enableControl
        // ignore: lines_longer_than_80_chars
        ? '0x${controller.inputDecoratorBackgroundAlphaLight?.toRadixString(16).toUpperCase()}'
        : 'Default\n0x'
            '${defaultBackgroundAlpha.toInt().toRadixString(16).toUpperCase()}';
    // TODO: The not themed defaults are not showing up, add them!
    final String lightBackgroundLabelOpacity =
        controller.inputDecoratorBackgroundAlphaLight != null
            ? (controller.inputDecoratorBackgroundAlphaLight! / 255 * 100)
                .toStringAsFixed(1)
            : (defaultBackgroundAlpha / 255 * 100).toStringAsFixed(1);

    final String darkBackgroundLabel = (controller
                    .inputDecoratorBackgroundAlphaDark ??
                -1) <
            0
        ? useMaterial3
            ? 'Default\n0xFF' // Dark M3 default
            : 'Default\n0x14' // Dark FCS own M2 default
        // ignore: lines_longer_than_80_chars
        : '0x${controller.inputDecoratorBackgroundAlphaDark?.toRadixString(16).toUpperCase()}';
    // TODO: The not themed defaults are not showing up, add them!
    final String darkBackgroundLabelOpacity =
        controller.inputDecoratorBackgroundAlphaDark != null
            ? (controller.inputDecoratorBackgroundAlphaDark! / 255 * 100)
                .toStringAsFixed(1)
            : (defaultBackgroundAlpha / 255 * 100).toStringAsFixed(1);

    // Defaults for tex selection setup and info.
    //
    final double defaultSelectionOpacity = isLight
        ? 0.3 // Light FCS own default
        : 0.5; // Dark FCS own default
    // TODO: The not themed defaults are not showing up, add them!
    final String selectionLabelLightOpacity = controller
                .inputSelectionLightOpacity !=
            null
        ? (controller.inputSelectionLightOpacity! * 100).toStringAsFixed(0)
        : 'default\n${(defaultSelectionOpacity * 100).toStringAsFixed(0)} %';
    final String selectionLabelDarkOpacity = controller
                .inputSelectionDarkOpacity !=
            null
        ? (controller.inputSelectionDarkOpacity! * 100).toStringAsFixed(0)
        : 'default\n${(defaultSelectionOpacity * 100).toStringAsFixed(0)} %';
    //
    final String baseDefaultLabelLightColor = controller
                .inputDecoratorSchemeColorLight !=
            null
        // ignore: lines_longer_than_80_chars
        ? 'default (base ${SchemeColor.values[controller.inputDecoratorSchemeColorLight!.index].name})'
        : 'default (base primary)';
    final String baseDefaultLabelDarkColor = controller
                .inputDecoratorSchemeColorDark !=
            null
        // ignore: lines_longer_than_80_chars
        ? 'default (base ${SchemeColor.values[controller.inputDecoratorSchemeColorDark!.index].name})'
        : 'default (base primary)';
    //
    final String baseDefaultHandleLabelLightColor = controller
                    .inputDecoratorSchemeColorLight !=
                null &&
            controller.inputDecoratorSchemeColorLight != SchemeColor.primary
        // ignore: lines_longer_than_80_chars
        ? 'default (base ${SchemeColor.values[controller.inputDecoratorSchemeColorLight!.index].name})'
        : 'default (theme.primaryColorDark)';
    final String baseDefaultHandleLabelDarkColor = controller
                    .inputDecoratorSchemeColorDark !=
                null &&
            controller.inputDecoratorSchemeColorDark != SchemeColor.primary
        // ignore: lines_longer_than_80_chars
        ? 'default (base ${SchemeColor.values[controller.inputDecoratorSchemeColorDark!.index].name})'
        : 'default (theme.primaryColorDark)';

    // TODO: More compact layout, use two columns for has border and width
    // TODO: Put unfocused before focused.
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
        const Padding(
          padding: EdgeInsets.all(16),
          child: TextFieldShowcase(),
        ),
        const Divider(),
        if (isLight)
          ColorSchemePopupMenu(
            title: const Text('Light theme base color'),
            labelForDefault: controller.useMaterial3
                ? 'default (primary & surfaceVariant)'
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
          )
        else
          ColorSchemePopupMenu(
            title: const Text('Dark theme base color'),
            labelForDefault: controller.useMaterial3
                ? 'default (primary & surfaceVariant)'
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
        SwitchListTileReveal(
          title: const Text('Use base color as background fill'),
          subtitleReveal:
              const Text('TIP: If you leave this OFF, you can still '
                  'theme the fill color and turn it ON using widget level '
                  "'filled: true' property, and wise versa.\n"),
          value: controller.inputDecoratorIsFilled &&
              controller.useSubThemes &&
              controller.useFlexColorScheme,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInputDecoratorIsFilled
              : null,
        ),
        if (isLight)
          ColorSchemePopupMenu(
            title: const Text('Light theme focused prefix icon color'),
            labelForDefault: controller.useMaterial3
                ? 'default (onSurface)'
                // ignore: lines_longer_than_80_chars
                : 'default (${controller.inputDecoratorSchemeColorLight?.name ?? 'primary'})',
            index: controller.inputDecoratorPrefixIconSchemeColor?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setInputDecoratorPrefixIconSchemeColor(null);
                    } else {
                      controller.setInputDecoratorPrefixIconSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          )
        else
          ColorSchemePopupMenu(
            title: const Text('Dark theme focused prefix icon color'),
            labelForDefault: controller.useMaterial3
                ? 'default (onSurface)'
                // ignore: lines_longer_than_80_chars
                : 'default (${controller.inputDecoratorSchemeColorDark?.name ?? 'primary'})',
            index:
                controller.inputDecoratorPrefixIconDarkSchemeColor?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller
                          .setInputDecoratorPrefixIconDarkSchemeColor(null);
                    } else {
                      controller.setInputDecoratorPrefixIconDarkSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
        if (isLight)
          SliderListTileReveal(
            enabled: enableControl,
            title: const Text('Light theme background alpha'),
            subtitle: Text('Current alpha as opacity is '
                '$lightBackgroundLabelOpacity %'),
            value: controller.inputDecoratorBackgroundAlphaLight?.toDouble(),
            onChanged: (double? value) {
              controller.setInputDecoratorBackgroundAlphaLight(
                  value == null || value < 0 ? null : value.toInt());
            },
            min: 0,
            max: 255,
            divisions: 255,
            valueDisplayScale: 1,
            valueDecimalPlaces: 0,
            valueHeading: 'ALPHA',
            valueDefaultLabel: lightBackgroundLabel,
          )
        else
          SliderListTileReveal(
            enabled: enableControl,
            title: const Text('Dark theme background alpha'),
            subtitle: Text('Current alpha as opacity is '
                '$darkBackgroundLabelOpacity %'),
            value: controller.inputDecoratorBackgroundAlphaDark?.toDouble(),
            onChanged: (double? value) {
              controller.setInputDecoratorBackgroundAlphaDark(
                  value == null || value < 0 ? null : value.toInt());
            },
            min: 0,
            max: 255,
            divisions: 255,
            valueDisplayScale: 1,
            valueDecimalPlaces: 0,
            valueHeading: 'ALPHA',
            valueDefaultLabel: darkBackgroundLabel,
          ),
        const Divider(),
        //
        // Border color, style and radius
        //
        if (isLight)
          ColorSchemePopupMenu(
            title: const Text('Light theme border color'),
            labelForDefault: 'default (base color)',
            index: controller.inputDecoratorBorderSchemeColorLight?.index ?? -1,
            onChanged: enableControl &&
                    !(!controller.inputDecoratorFocusedHasBorder &&
                        (!controller.inputDecoratorUnfocusedHasBorder ||
                            !controller.inputDecoratorUnfocusedBorderIsColored))
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setInputDecoratorBorderSchemeColorLight(null);
                    } else {
                      controller.setInputDecoratorBorderSchemeColorLight(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          )
        else
          ColorSchemePopupMenu(
            title: const Text('Dark theme border color'),
            labelForDefault: 'default (base color)',
            index: controller.inputDecoratorBorderSchemeColorDark?.index ?? -1,
            onChanged: enableControl &&
                    !(!controller.inputDecoratorFocusedHasBorder &&
                        (!controller.inputDecoratorUnfocusedHasBorder ||
                            !controller.inputDecoratorUnfocusedBorderIsColored))
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setInputDecoratorBorderSchemeColorDark(null);
                    } else {
                      controller.setInputDecoratorBorderSchemeColorDark(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
        SwitchListTile(
          title: const Text(
            'Border style',
          ),
          subtitle: const Text(
            'ON for outline | OFF for underline',
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
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Border radius'),
          value: controller.inputDecoratorBorderRadius,
          onChanged: controller.setInputDecoratorBorderRadius,
          min: 0,
          max: 40,
          divisions: 40,
          valueDisplayScale: 1,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: decoratorRadiusDefaultLabel,
          valueDefaultDisabledLabel: 'default\n4 dp',
        ),
        const Divider(),
        //
        // Focused border
        //
        SwitchListTile(
          title: const Text('Focused field has a border'),
          value: enableControl && controller.inputDecoratorFocusedHasBorder,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInputDecoratorFocusedHasBorder
              : null,
        ),
        SliderListTileReveal(
          enabled: enableControl && controller.inputDecoratorFocusedHasBorder,
          title: const Text('Focused border width'),
          value: controller.inputDecoratorFocusedBorderWidth,
          onChanged: controller.setInputDecoratorFocusedBorderWidth,
          min: 0.5,
          max: 6,
          divisions: 11,
          valueDisplayScale: 1,
          valueDecimalPlaces: 1,
          valueHeading: 'WIDTH',
          valueDefaultLabel: focusedBorderDefaultLabel,
          valueDefaultDisabledLabel:
              enableControl && controller.inputDecoratorFocusedHasBorder
                  ? 'default\n2 dp'
                  : 'none',
          valueUnitLabel: ' dp',
        ),
        const Divider(),
        //
        // Unfocused border
        //
        SwitchListTile(
          title: const Text('Unfocused field has a border'),
          value: enableControl && controller.inputDecoratorUnfocusedHasBorder,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? controller.setInputDecoratorUnfocusedHasBorder
              : null,
        ),
        SwitchListTile(
          title: const Text('Unfocused border is colored'),
          value: enableControl &&
              controller.inputDecoratorUnfocusedBorderIsColored &&
              controller.inputDecoratorUnfocusedHasBorder,
          onChanged: controller.useSubThemes &&
                  controller.inputDecoratorUnfocusedHasBorder &&
                  controller.useFlexColorScheme
              ? controller.setInputDecoratorUnfocusedBorderIsColored
              : null,
        ),
        SliderListTileReveal(
          enabled: enableControl && controller.inputDecoratorUnfocusedHasBorder,
          title: const Text('Unfocused border width'),
          value: controller.inputDecoratorBorderWidth,
          onChanged: controller.setInputDecoratorBorderWidth,
          min: 0.5,
          max: 6,
          divisions: 11,
          valueDisplayScale: 1,
          valueDecimalPlaces: 1,
          valueHeading: 'WIDTH',
          valueDefaultLabel: unfocusedBorderDefaultLabel,
          valueDefaultDisabledLabel:
              controller.inputDecoratorUnfocusedHasBorder ||
                      !controller.useSubThemes ||
                      !controller.useFlexColorScheme
                  ? 'default\n2 dp'
                  : 'none',
          valueUnitLabel: ' dp',
        ),
        // ListTile(
        //   title: const Text('Unfocused border width'),
        //   enabled: controller.useSubThemes &&
        //       controller.useFlexColorScheme &&
        //       controller.inputDecoratorUnfocusedHasBorder,
        //   subtitle: Slider(
        //     min: 0,
        //     max: 6,
        //     divisions: 12,
        //     label: controller.useSubThemes &&
        //             controller.useFlexColorScheme &&
        //             controller.inputDecoratorUnfocusedHasBorder
        //         ? controller.inputDecoratorBorderWidth == null ||
        //                 (controller.inputDecoratorBorderWidth ?? 0) <= 0
        //             ? unfocusedBorderDefaultLabel
        //             : (controller.inputDecoratorBorderWidth
        //                     ?.toStringAsFixed(1) ??
        //                 '')
        //         : controller.inputDecoratorUnfocusedHasBorder ||
        //                 !controller.useSubThemes ||
        //                 !controller.useFlexColorScheme
        //             ? 'default 1'
        //             : 'none',
        //     value: controller.useSubThemes &&
        //             controller.useFlexColorScheme &&
        //             controller.inputDecoratorUnfocusedHasBorder
        //         ? controller.inputDecoratorBorderWidth ?? 0
        //         : 0,
        //     onChanged: controller.useSubThemes &&
        //             controller.useFlexColorScheme &&
        //             controller.inputDecoratorUnfocusedHasBorder
        //         ? (double value) {
        //             controller.setInputDecoratorBorderWidth(
        //                 value <= 0 ? null : value);
        //           }
        //         : null,
        //   ),
        //   trailing: Padding(
        //     padding: const EdgeInsetsDirectional.only(end: 5),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: <Widget>[
        //         Text(
        //           'WIDTH',
        //           style: theme.textTheme.bodySmall,
        //         ),
        //         Text(
        //           controller.useSubThemes &&
        //                   controller.useFlexColorScheme &&
        //                   controller.inputDecoratorUnfocusedHasBorder
        //               ? controller.inputDecoratorBorderWidth == null ||
        //                     (controller.inputDecoratorBorderWidth ?? 0) <= 0
        //                   ? unfocusedBorderDefaultLabel
        //                   : (controller.inputDecoratorBorderWidth
        //                           ?.toStringAsFixed(1) ??
        //                       '')
        //               : controller.inputDecoratorUnfocusedHasBorder ||
        //                       !controller.useSubThemes ||
        //                       !controller.useFlexColorScheme
        //                   ? 'default 1'
        //                   : 'none',
        //           style: theme.textTheme.bodySmall!
        //               .copyWith(fontWeight: FontWeight.bold),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        //
        // Selection color border
        //
        // TODO: More compact layout, use two columns!
        // TODO: Add heading for light/dark mode that mentions it.
        const Divider(),
        if (isLight) ...<Widget>[
          ColorSchemePopupMenu(
            title: const Text('Light theme cursor'),
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
          ColorSchemePopupMenu(
            title: const Text('Light theme text selection'),
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
          SliderListTileReveal(
            enabled: enableControl,
            title: const Text('Light theme text selection opacity'),
            value: controller.inputSelectionLightOpacity,
            onChanged: controller.setInputSelectionLightOpacity,
            min: 0,
            max: 1,
            divisions: 100,
            valueDisplayScale: 100,
            valueDecimalPlaces: 0,
            valueHeading: 'OPACITY',
            valueUnitLabel: ' %',
            valueDefaultLabel: selectionLabelLightOpacity,
          ),
          ListTile(
            enabled: enableControl,
            title: const Text('Light theme text selection opacity'),
            subtitle: Slider(
              min: -1,
              max: 100,
              divisions: 101,
              label: selectionLabelLightOpacity,
              value: controller.useSubThemes && controller.useFlexColorScheme
                  ? (controller.inputSelectionLightOpacity ?? -0.01) * 100
                  : -1,
              onChanged: enableControl
                  ? (double value) {
                      controller.setInputSelectionLightOpacity(
                          value < 0 ? null : value / 100);
                    }
                  : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'OPACITY',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    selectionLabelLightOpacity,
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ColorSchemePopupMenu(
            title: const Text('Light theme text selection handles'),
            labelForDefault: baseDefaultHandleLabelLightColor,
            index: controller.inputSelectionHandleLightSchemeColor?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setInputSelectionHandleLightSchemeColor(null);
                    } else {
                      controller.setInputSelectionHandleLightSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
        ] else ...<Widget>[
          ColorSchemePopupMenu(
            title: const Text('Dark theme cursor'),
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
          ColorSchemePopupMenu(
            title: const Text('Dark text selection'),
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
          SliderListTileReveal(
            enabled: enableControl,
            title: const Text('Dark text selection opacity'),
            value: controller.inputSelectionDarkOpacity,
            onChanged: controller.setInputSelectionDarkOpacity,
            min: 0,
            max: 1,
            divisions: 100,
            valueDisplayScale: 100,
            valueDecimalPlaces: 0,
            valueHeading: 'OPACITY',
            valueUnitLabel: ' %',
            valueDefaultLabel: selectionLabelDarkOpacity,
          ),
          // ListTile(
          //  enabled: controller.useSubThemes && controller.useFlexColorScheme,
          //   title: const Text('Dark text selection opacity'),
          //   subtitle: Slider(
          //     min: -1,
          //     max: 100,
          //     divisions: 101,
          //     label: selectionLabelDarkOpacity,
          //     value: enableControl
          //         ? (controller.inputSelectionDarkOpacity ?? -0.01) * 100
          //         : -1,
          //     onChanged:
          //         controller.useSubThemes && controller.useFlexColorScheme
          //             ? (double value) {
          //                 controller.setInputSelectionDarkOpacity(
          //                     value < 0 ? null : value / 100);
          //               }
          //             : null,
          //   ),
          //   trailing: Padding(
          //     padding: const EdgeInsetsDirectional.only(end: 5),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: <Widget>[
          //         Text(
          //           'OPACITY',
          //           style: theme.textTheme.bodySmall,
          //         ),
          //         Text(
          //           selectionLabelDarkOpacity,
          //           style: theme.textTheme.bodySmall!
          //               .copyWith(fontWeight: FontWeight.bold),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          ColorSchemePopupMenu(
            title: const Text('Dark theme text selection handles'),
            labelForDefault: baseDefaultHandleLabelDarkColor,
            index: controller.inputSelectionHandleDarkSchemeColor?.index ?? -1,
            onChanged: enableControl
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setInputSelectionHandleDarkSchemeColor(null);
                    } else {
                      controller.setInputSelectionHandleDarkSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
        ],
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            showCursor: true,
            decoration: InputDecoration(
              hintText: 'Write something and try the text selection style',
              labelText: 'Label: TextField for text selection',
            ),
          ),
        ),
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
