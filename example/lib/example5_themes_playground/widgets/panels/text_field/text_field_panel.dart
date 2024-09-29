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

class TextFieldPanel extends StatelessWidget {
  const TextFieldPanel(this.controller, {super.key});
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
    final String baseDefaultLabelLightColor =
        controller.inputDecoratorSchemeColorLight != null
            ? SchemeColor
                .values[controller.inputDecoratorSchemeColorLight!.index].name
            : 'primary';
    final String baseDefaultLabelDarkColor =
        controller.inputDecoratorSchemeColorDark != null
            ? SchemeColor
                .values[controller.inputDecoratorSchemeColorDark!.index].name
            : 'primary';
    //
    final String baseDefaultHandleLabelLightColor =
        controller.inputDecoratorSchemeColorLight != null &&
                controller.inputDecoratorSchemeColorLight != SchemeColor.primary
            ? SchemeColor
                .values[controller.inputDecoratorSchemeColorLight!.index].name
            : 'primary';
    final String baseDefaultHandleLabelDarkColor =
        controller.inputDecoratorSchemeColorDark != null &&
                controller.inputDecoratorSchemeColorDark != SchemeColor.primary
            ? SchemeColor
                .values[controller.inputDecoratorSchemeColorDark!.index].name
            : 'primary';

    // Input content padding logic, default is zero, true when collapsed used,
    // but we do not really offer that option, but used as init values.
    String defaultStartPadding = '0';
    String defaultTopPadding = '0';
    String defaultEndPadding = '0';
    String defaultBottomPadding = '0';
    // This complex logic is needed to show the default padding values for the
    // the content padding. The values are taken from hard coded values
    // in the `ìnput_decorator.dart` around lines 2396 to 2433 when this was
    // written.
    // There is also internal constraints in the `InputDecorator` impacting
    // the effective padding, changing them from the defaults. So these default
    // values are not used in all cases.
    if (controller.inputDecoratorBorderType == FlexInputBorderType.underline) {
      if (controller.inputDecoratorIsFilled) {
        if (useMaterial3) {
          if (controller.inputDecoratorIsDense) {
            defaultStartPadding = '12';
            defaultTopPadding = '4';
            defaultEndPadding = '12';
            defaultBottomPadding = '4';
          } else {
            defaultStartPadding = '12';
            defaultTopPadding = '8';
            defaultEndPadding = '12';
            defaultBottomPadding = '8';
          }
          // Using Material2
        } else {
          if (controller.inputDecoratorIsDense) {
            defaultStartPadding = '12';
            defaultTopPadding = '8';
            defaultEndPadding = '12';
            defaultBottomPadding = '8';
          } else {
            defaultStartPadding = '12';
            defaultTopPadding = '12';
            defaultEndPadding = '12';
            defaultBottomPadding = '12';
          }
        }
        // The underline border type, is NOT filled.
      } else {
        if (useMaterial3) {
          if (controller.inputDecoratorIsDense) {
            defaultStartPadding = '0';
            defaultTopPadding = '4';
            defaultEndPadding = '0';
            defaultBottomPadding = '4';
          } else {
            defaultStartPadding = '0';
            defaultTopPadding = '8';
            defaultEndPadding = '0';
            defaultBottomPadding = '8';
          }
          // Using Material2
        } else {
          if (controller.inputDecoratorIsDense) {
            defaultStartPadding = '0';
            defaultTopPadding = '8';
            defaultEndPadding = '0';
            defaultBottomPadding = '8';
          } else {
            defaultStartPadding = '0';
            defaultTopPadding = '12';
            defaultEndPadding = '0';
            defaultBottomPadding = '12';
          }
        }
      }
      // Using outline border type
    } else {
      if (useMaterial3) {
        if (controller.inputDecoratorIsDense) {
          defaultStartPadding = '12';
          defaultTopPadding = '16';
          defaultEndPadding = '12';
          defaultBottomPadding = '8';
        } else {
          defaultStartPadding = '12';
          defaultTopPadding = '20';
          defaultEndPadding = '12';
          defaultBottomPadding = '12';
        }
        // Using Material2
      } else {
        if (controller.inputDecoratorIsDense) {
          defaultStartPadding = '12';
          defaultTopPadding = '20';
          defaultEndPadding = '12';
          defaultBottomPadding = '12';
        } else {
          defaultStartPadding = '12';
          defaultTopPadding = '24';
          defaultEndPadding = '12';
          defaultBottomPadding = '16';
        }
      }
    }
    // As soon as any padding prop is set, the default for all paddings go
    // to zero, you will have to set them yourself to your desired values.
    // But at least when not set, you can see the default values for the
    // different combinations of settings and figure out something that might
    // work well.
    if (controller.inputDecoratorPaddingStart != null ||
        controller.inputDecoratorPaddingEnd != null ||
        controller.inputDecoratorPaddingTop != null ||
        controller.inputDecoratorPaddingBottom != null) {
      defaultTopPadding = '0';
      defaultBottomPadding = '0';
      defaultStartPadding = '0';
      defaultEndPadding = '0';
    }

    // Paddings for the two column control layouts.
    const EdgeInsetsDirectional paddingStartColumn =
        EdgeInsetsDirectional.only(start: 16, end: 8);
    final EdgeInsetsDirectional paddingEndColumn =
        EdgeInsetsDirectional.only(start: 8, end: useMaterial3 ? 24 : 16);

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
          enabled: enableControl,
          contentPadding: EdgeInsetsDirectional.only(
            start: 16,
            end: useMaterial3 ? 28 : 20,
          ),
          title: const Text('Background filled'),
          subtitleReveal: const Text('If you leave this OFF, you can still '
              'theme the fill color below and turn it ON by using the '
              'widget level "filled: true" property and it gets the '
              'themed fill style by default, but you can also use the not '
              'filled style. It also works the other way around, leave it '
              'ON and set to OFF on widget level when so needed.\n'),
          value: controller.inputDecoratorIsFilled,
          onChanged: controller.setInputDecoratorIsFilled,
        ),

        if (isLight)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1st column light
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  enabled: enableControl,
                  title: const Text('Background color (light)'),
                  defaultLabel: 'surfaceContainerHighest',
                  defaultLabelM2: 'primary',
                  defaultDisabledLabelM2: '#0A000000: 4% black',
                  value: controller.inputDecoratorSchemeColorLight,
                  onChanged: controller.setInputDecoratorSchemeColorLight,
                ),
              ),
              // 2nd column light
              Expanded(
                child: SliderListTileReveal(
                  enabled: enableControl,
                  contentPadding: paddingEndColumn,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1st column dark
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  enabled: enableControl,
                  title: const Text('Background color (dark)'),
                  defaultLabel: 'surfaceContainerHighest',
                  defaultLabelM2: 'primary',
                  defaultDisabledLabelM2: '#1AFFFFFF: 10% white',
                  value: controller.inputDecoratorSchemeColorDark,
                  onChanged: controller.setInputDecoratorSchemeColorDark,
                ),
              ),
              // 2nd column dark
              Expanded(
                child: SliderListTileReveal(
                  enabled: enableControl,
                  contentPadding: paddingEndColumn,
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
        const Divider(height: 0),
        //
        // Border type and radius
        //
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1st column light and dark
            Expanded(
              child: ListTile(
                  contentPadding: paddingStartColumn,
                  enabled: enableControl,
                  title: const Text('Border'),
                  subtitle: controller.inputDecoratorBorderType ==
                          FlexInputBorderType.outline
                      ? const Text('Outlined')
                      : const Text('Underlined'),
                  onTap: () {
                    if (controller.inputDecoratorBorderType ==
                        FlexInputBorderType.outline) {
                      controller.setInputDecoratorBorderType(
                          FlexInputBorderType.underline);
                    } else {
                      controller.setInputDecoratorBorderType(
                          FlexInputBorderType.outline);
                    }
                  },
                  trailing: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12),
                    child: controller.inputDecoratorBorderType ==
                            FlexInputBorderType.outline
                        ? const Icon(Icons.border_outer_outlined, size: 36)
                        : const Icon(Icons.border_bottom_outlined, size: 36),
                  )),
            ),
            // 2nd colum light and dark
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
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
        //
        // Border color and style
        //
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (isLight)
              // 1st column light
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  enabled: enableControl &&
                      !(!controller.inputDecoratorFocusedHasBorder &&
                          (!controller.inputDecoratorUnfocusedHasBorder ||
                              !controller
                                  .inputDecoratorUnfocusedBorderIsColored)),
                  title: const Text('Border color (light)'),
                  defaultLabel: baseDefaultLabelLightColor,
                  defaultDisabledLabel: 'primary',
                  value: controller.inputDecoratorBorderSchemeColorLight,
                  onChanged: controller.setInputDecoratorBorderSchemeColorLight,
                ),
              )
            else
              // 1st column dark
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  enabled: enableControl &&
                      !(!controller.inputDecoratorFocusedHasBorder &&
                          (!controller.inputDecoratorUnfocusedHasBorder ||
                              !controller
                                  .inputDecoratorUnfocusedBorderIsColored)),
                  title: const Text('Border color (dark)'),
                  defaultDisabledLabel: 'primary',
                  defaultLabel: baseDefaultLabelDarkColor,
                  value: controller.inputDecoratorBorderSchemeColorDark,
                  onChanged: controller.setInputDecoratorBorderSchemeColorDark,
                ),
              ),
            // 2nd column light and dark
            Expanded(
              child: SwitchListTile(
                contentPadding: paddingEndColumn,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1st column light and dark
            Expanded(
              child: SwitchListTile(
                contentPadding: paddingStartColumn,
                title: const Text('Unfocused has border'),
                value: enableControl &&
                    controller.inputDecoratorUnfocusedHasBorder,
                onChanged: enableControl
                    ? controller.setInputDecoratorUnfocusedHasBorder
                    : null,
              ),
            ),
            // 2nd column light and dark
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1st column light and dark
            Expanded(
              child: SwitchListTile(
                contentPadding: paddingStartColumn,
                title: const Text('Focused has border'),
                value:
                    enableControl && controller.inputDecoratorFocusedHasBorder,
                onChanged:
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? controller.setInputDecoratorFocusedHasBorder
                        : null,
              ),
            ),
            // 2nd column light and dark
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
                enabled:
                    enableControl && controller.inputDecoratorFocusedHasBorder,
                title: const Text('Focused border width'),
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
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1st column light
            if (isLight)
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  enabled: enableControl,
                  title: const Text('Focused prefix icon'),
                  defaultLabel: 'onSurfaceVariant',
                  defaultLabelM2:
                      controller.inputDecoratorSchemeColorLight?.name ??
                          'primary',
                  defaultDisabledLabelM2: 'primary',
                  value: controller.inputDecoratorPrefixIconSchemeColor,
                  onChanged: controller.setInputDecoratorPrefixIconSchemeColor,
                ),
              )
            else
              // 1st column dark
              Expanded(
                child: ColorSchemePopupMenu(
                  contentPadding: paddingStartColumn,
                  enabled: enableControl,
                  title: const Text('Focused prefix icon'),
                  defaultLabel: 'onSurfaceVariant',
                  defaultLabelM2:
                      controller.inputDecoratorSchemeColorDark?.name ??
                          'primary',
                  defaultDisabledLabelM2: 'primary',
                  value: controller.inputDecoratorPrefixIconDarkSchemeColor,
                  onChanged:
                      controller.setInputDecoratorPrefixIconDarkSchemeColor,
                ),
              ),

            if (isLight)
              // 2nd column light
              Expanded(
                child: ColorSchemePopupMenu(
                  enabled: enableControl,
                  contentPadding: paddingEndColumn,
                  title: const Text('Focused suffix icon'),
                  defaultLabel: 'onSurfaceVariant',
                  defaultLabelM2:
                      controller.inputDecoratorSchemeColorLight?.name ??
                          'primary',
                  defaultDisabledLabelM2: 'primary',
                  value: controller.inputDecoratorSuffixIconSchemeColor,
                  onChanged: controller.setInputDecoratorSuffixIconSchemeColor,
                ),
              )
            else
              // 2nd column dark
              Expanded(
                child: ColorSchemePopupMenu(
                  enabled: enableControl,
                  contentPadding: paddingEndColumn,
                  title: const Text('Focused suffix icon'),
                  defaultLabel: 'onSurfaceVariant',
                  defaultLabelM2:
                      controller.inputDecoratorSchemeColorDark?.name ??
                          'primary',
                  defaultDisabledLabelM2: 'primary',
                  value: controller.inputDecoratorSuffixIconDarkSchemeColor,
                  onChanged:
                      controller.setInputDecoratorSuffixIconDarkSchemeColor,
                ),
              ),
          ],
        ),
        const Divider(),
        //
        // TextField Padding props
        //
        SwitchListTileReveal(
          contentPadding: EdgeInsetsDirectional.only(
            start: 16,
            end: useMaterial3 ? 28 : 20,
          ),
          title: const Text('Dense TextField '),
          subtitleReveal: const Text(
            'A nice Flutter built in quick padding '
            'style toggle to make the TextField more dense and use less '
            'padding. Many prefer the dense less space wasting style.\n',
          ),
          value: controller.inputDecoratorIsDense,
          onChanged: controller.setInputDecoratorIsDense,
        ),
        ListTileReveal(
          enabled: enableControl,
          title: const Text('Content padding'),
          subtitleReveal: const Text(
            'As soon as you set the "contentPadding" to any value, you '
            'loose all the built-in default logic Flutter has for padding the '
            'TextField InputDecorator, and need to set usable values for '
            'your design manually.\n'
            '\n'
            'When you toggle M2/M3, filled, border type and dense TextField, '
            'the default Flutter content padding values are shown, if they are '
            'all left undefined. There are also internal constraints '
            'in the InputDecorator impacting effective paddings, changing '
            'them from the shown defaults in some cases.\n'
            '\n'
            'Recommend caution when using custom content padding, but since '
            'you can visually see what you get here with different combos, '
            'feel free to experiment.\n',
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingStartColumn,
                trailingWidth: 52,
                enabled: enableControl,
                value: controller.inputDecoratorPaddingStart,
                onChanged: controller.setInputDecoratorPaddingStart,
                min: 0,
                max: 32,
                divisions: 32,
                valueDecimalPlaces: 0,
                valueHeading: 'START',
                valueUnitLabel: ' dp',
                valueDefaultLabel: defaultStartPadding,
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
                trailingWidth: 60,
                enabled: enableControl,
                value: controller.inputDecoratorPaddingEnd,
                onChanged: controller.setInputDecoratorPaddingEnd,
                min: 0,
                max: 32,
                divisions: 32,
                valueDecimalPlaces: 0,
                valueHeading: 'END',
                valueUnitLabel: ' dp',
                valueDefaultLabel: defaultEndPadding,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingStartColumn,
                trailingWidth: 52,
                enabled: enableControl,
                value: controller.inputDecoratorPaddingTop,
                onChanged: controller.setInputDecoratorPaddingTop,
                min: 0,
                max: 32,
                divisions: 32,
                valueDecimalPlaces: 0,
                valueHeading: 'TOP',
                valueUnitLabel: ' dp',
                valueDefaultLabel: defaultTopPadding,
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
                trailingWidth: 60,
                enabled: enableControl,
                value: controller.inputDecoratorPaddingBottom,
                onChanged: controller.setInputDecoratorPaddingBottom,
                min: 0,
                max: 32,
                divisions: 32,
                valueDecimalPlaces: 0,
                valueHeading: 'BOTTOM',
                valueUnitLabel: ' dp',
                valueDefaultLabel: defaultBottomPadding,
              ),
            ),
          ],
        ),
        //
        const Divider(height: 0),
        //
        // Text Selection Style
        //
        if (isLight)
          const ListTile(title: Text('TextSelection style (light)'))
        else
          const ListTile(title: Text('TextSelection style (dark)')),
        const Padding(
          padding: EdgeInsetsDirectional.only(start: 16, end: 108),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1st column light
              Expanded(
                child: ColorSchemePopupMenu(
                  enabled: enableControl,
                  contentPadding: paddingStartColumn,
                  title: const Text('Cursor'),
                  defaultLabel: baseDefaultLabelLightColor,
                  defaultDisabledLabel: 'primary',
                  value: controller.inputCursorLightSchemeColor,
                  onChanged: controller.setInputCursorLightSchemeColor,
                ),
              ),
              // 2nd column light
              Expanded(
                child: ColorSchemePopupMenu(
                  enabled: enableControl,
                  contentPadding: paddingEndColumn,
                  title: const Text('Selection handles'),
                  defaultLabel: baseDefaultHandleLabelLightColor,
                  defaultDisabledLabel: 'primary',
                  value: controller.inputSelectionHandleLightSchemeColor,
                  onChanged: controller.setInputSelectionHandleLightSchemeColor,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1st column light
              Expanded(
                child: ColorSchemePopupMenu(
                  enabled: enableControl,
                  contentPadding: paddingStartColumn,
                  title: const Text('Selection'),
                  defaultLabel: baseDefaultLabelLightColor,
                  defaultDisabledLabel: 'primary',
                  value: controller.inputSelectionLightSchemeColor,
                  onChanged: controller.setInputSelectionLightSchemeColor,
                ),
              ),
              // 2nd column light
              Expanded(
                child: SliderListTileReveal(
                  contentPadding: paddingEndColumn,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1st column dark
              Expanded(
                child: ColorSchemePopupMenu(
                  enabled: enableControl,
                  contentPadding: paddingStartColumn,
                  title: const Text('Cursor'),
                  defaultLabel: baseDefaultLabelDarkColor,
                  defaultDisabledLabel: 'primary',
                  value: controller.inputCursorDarkSchemeColor,
                  onChanged: controller.setInputCursorDarkSchemeColor,
                ),
              ),
              // 2nd column dark
              Expanded(
                child: ColorSchemePopupMenu(
                  enabled: enableControl,
                  contentPadding: paddingEndColumn,
                  title: const Text('Selection handles'),
                  defaultLabel: baseDefaultHandleLabelDarkColor,
                  defaultDisabledLabel: 'primary',
                  value: controller.inputSelectionHandleDarkSchemeColor,
                  onChanged: controller.setInputSelectionHandleDarkSchemeColor,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1st column dark
              Expanded(
                child: ColorSchemePopupMenu(
                  enabled: enableControl,
                  contentPadding: paddingStartColumn,
                  title: const Text('Selection'),
                  defaultLabel: baseDefaultLabelDarkColor,
                  defaultDisabledLabel: 'primary',
                  value: controller.inputSelectionDarkSchemeColor,
                  onChanged: controller.setInputSelectionDarkSchemeColor,
                ),
              ),
              // 2nd column dark
              Expanded(
                child: SliderListTileReveal(
                  contentPadding: paddingEndColumn,
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
