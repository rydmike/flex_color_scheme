import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/model/adaptive_response.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../dialogs/set_text_field_to_defaults_dialog.dart';
import '../../dialogs/set_text_field_to_dense_dialog.dart';
import '../../dialogs/set_text_field_to_m3_dialog.dart';
import '../../dialogs/set_text_field_to_outlined_dialog.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/test_adaptive_response.dart';

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

  Future<void> _handleSetToOutlined(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const SetTextFieldToOutlinedDialog();
      },
    );
    if (reset ?? false) {
      await controller.setTextFieldToPlaygroundOutlined();
    }
  }

  Future<void> _handleSetToDense(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const SetTextFieldToDenseDialog();
      },
    );
    if (reset ?? false) {
      await controller.setTextFieldToPlaygroundDense();
    }
  }

  // Complex logic for the adaptive InputDecorator radius label.
  static String? _adaptiveDecoratorModeLabel(ThemeController controller) {
    if (!controller.useSubThemes && !controller.useFlexColorScheme) return null;
    final bool useAdaptiveRadius =
        controller.adaptiveResponseRadius != AdaptiveResponse.off &&
            controller.adaptiveResponseRadius != null &&
            controller.inputDecoratorBorderRadius == null;
    if (useAdaptiveRadius) {
      return 'Global (${controller.adaptiveResponseRadius?.label ?? ''})';
    }
    return null;
  }

  // Complex logic for the adaptive decorator radius label.
  static String _adaptiveDecoratorRadiusLabel(ThemeController controller) {
    final bool useFCS =
        controller.useSubThemes && controller.useFlexColorScheme;
    if (!useFCS) {
      return '4 dp';
    }
    final bool useAdaptiveInputDecoratorRadius =
        controller.adaptiveResponseInputDecoratorRadius !=
                AdaptiveResponse.off &&
            controller.adaptiveResponseInputDecoratorRadius != null;
    if (useAdaptiveInputDecoratorRadius) {
      return controller.inputDecoratorBorderRadiusAdaptive != null
          ? controller.inputDecoratorBorderRadiusAdaptive!.toStringAsFixed(0)
          : '4 dp';
    }
    final bool useAdaptiveRadius =
        controller.adaptiveResponseRadius != AdaptiveResponse.off &&
            controller.adaptiveResponseRadius != null &&
            controller.inputDecoratorBorderRadius == null;
    if (useAdaptiveRadius) {
      return controller.defaultRadiusAdaptive != null
          ? 'global ${controller.defaultRadiusAdaptive!.toStringAsFixed(0)} dp'
          : '4 dp';
    }
    return 'OFF';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
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
    final double? effectiveRadius = ThemeValues.effectiveRadius(controller);
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Material-3 defaults'),
              subtitleReveal:
                  const Text('Update settings to match Material-3 default '
                      'style. Also sets text selection style.\n'
                      'Can also be used in Material-2 mode, but the result is '
                      'different from when used in actual M3 mode.'),
              trailing: IconButton(
                isSelected: true,
                onPressed: () async {
                  await _handleSetToM3(context);
                },
                icon: const Icon(Icons.refresh),
              ),
              onTap: () async {
                await _handleSetToM3(context);
              },
            ),
            lastWidget: ListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Playground defaults'),
              subtitleReveal: const Text("Update settings to Playground's own "
                  'default values. Also resets text selection '
                  'style.\n'
                  'The defaults for Material-2 and Material-3 are slightly '
                  'different, the Material-3 mode defaults are very close '
                  'to Material defaults, but use a filled outline style.'),
              trailing: IconButton(
                isSelected: true,
                onPressed: () async {
                  await _handleSetToDefaults(context);
                },
                icon: const Icon(Icons.refresh),
              ),
              onTap: () async {
                await _handleSetToDefaults(context);
              },
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(
          builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ListTileReveal(
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                title: const Text('Colored outline'),
                subtitleReveal: const Text(
                  'Update settings to an example with colored '
                  'outlined border and primary opacity background '
                  'color. Also use custom colors on prefix and suffix '
                  'icons, and less padding. Used colors and opacities '
                  'varies between light and dark mode.',
                ),
                trailing: IconButton(
                  isSelected: true,
                  onPressed: () async {
                    await _handleSetToOutlined(context);
                  },
                  icon: const Icon(Icons.refresh),
                ),
                onTap: () async {
                  await _handleSetToOutlined(context);
                },
              ),
              lastWidget: ListTileReveal(
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                title: const Text('Dense, no focused border'),
                subtitleReveal: const Text(
                  'Update settings to an example with dense field, no '
                  'focused border and '
                  'a colored outlined border and primary opacity background '
                  'color. Also use custom colors on prefix and suffix '
                  'icons. Used colors and opacities '
                  'varies between light and dark mode.',
                ),
                trailing: IconButton(
                  isSelected: true,
                  onPressed: () async {
                    await _handleSetToDense(context);
                  },
                  icon: const Icon(Icons.refresh),
                ),
                onTap: () async {
                  await _handleSetToDense(context);
                },
              ),
              isRow: isRow,
            );
          },
        ),
        const Divider(),
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
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                enabled: enableControl,
                title: const Text('Background color (light)'),
                defaultLabel: 'surfaceContainerHighest',
                defaultLabelM2: 'primary',
                defaultDisabledLabelM2: '#0A000000: 4% black',
                value: controller.inputDecoratorSchemeColorLight,
                onChanged: controller.setInputDecoratorSchemeColorLight,
              ),
              lastWidget: SliderListTileReveal(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
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
              isRow: isRow,
            );
          })
        else
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                enabled: enableControl,
                title: const Text('Background color (dark)'),
                defaultLabel: 'surfaceContainerHighest',
                defaultLabelM2: 'primary',
                defaultDisabledLabelM2: '#1AFFFFFF: 10% white',
                value: controller.inputDecoratorSchemeColorDark,
                onChanged: controller.setInputDecoratorSchemeColorDark,
              ),
              lastWidget: SliderListTileReveal(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                title: const Text('Opacity'),
                subtitle: Text('Alpha as opacity is '
                    '$darkBackgroundLabelOpacity %'),
                value: controller.inputDecoratorBackgroundAlphaDark?.toDouble(),
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
              isRow: isRow,
            );
          }),
        const Divider(height: 0),
        //
        // Border type and radius
        //
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Border'),
              subtitle: controller.inputDecoratorBorderType ==
                          FlexInputBorderType.outline &&
                      enableControl
                  ? const Text('Outlined')
                  : const Text('Underlined'),
              onTap: () {
                if (controller.inputDecoratorBorderType ==
                    FlexInputBorderType.outline) {
                  controller.setInputDecoratorBorderType(
                      FlexInputBorderType.underline);
                } else {
                  controller
                      .setInputDecoratorBorderType(FlexInputBorderType.outline);
                }
              },
              trailing: Padding(
                padding: const EdgeInsetsDirectional.only(end: 12),
                child: controller.inputDecoratorBorderType ==
                            FlexInputBorderType.outline &&
                        enableControl
                    ? const Icon(Icons.border_outer_outlined, size: 36)
                    : const Icon(Icons.border_bottom_outlined, size: 36),
              ),
            ),
            lastWidget: EnumPopupMenu<AdaptiveResponse>(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              values: AdaptiveResponse.values,
              title: const Text('Adaptive response'),
              subtitleReveal: Text(
                'Use an alternative InputDecorator border radius on '
                'selected platforms.\n'
                '\n'
                // ignore: lines_longer_than_80_chars
                '${controller.adaptiveResponseInputDecoratorRadius?.describe ?? AdaptiveResponse.off.describe}',
              ),
              defaultLabel: _adaptiveDecoratorModeLabel(controller),
              value: controller.adaptiveResponseInputDecoratorRadius,
              onChanged: controller.setAdaptiveResponseInputDecoratorRadius,
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            isRow: isRow,
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Border radius'),
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
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl &&
                  controller.adaptiveResponseInputDecoratorRadius !=
                      AdaptiveResponse.off &&
                  controller.adaptiveResponseInputDecoratorRadius != null,
              title: const Text('Adaptive radius'),
              value: controller.inputDecoratorBorderRadiusAdaptive,
              onChanged: controller.setInputDecoratorBorderRadiusAdaptive,
              min: 0,
              max: 40,
              divisions: 40,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: _adaptiveDecoratorRadiusLabel(controller),
              valueDefaultDisabledLabel: '4 dp',
            ),
          );
        }),
        TestAdaptiveResponse(controller),
        const Divider(),
        //
        // Border color and style
        //
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: isLight
                // 1st column light
                ? ColorSchemePopupMenu(
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    enabled: enableControl &&
                        !(!controller.inputDecoratorFocusedHasBorder &&
                            (!controller.inputDecoratorUnfocusedHasBorder ||
                                !controller
                                    .inputDecoratorUnfocusedBorderIsColored)),
                    title: const Text('Border color (light)'),
                    defaultLabel: baseDefaultLabelLightColor,
                    defaultDisabledLabel: 'primary',
                    value: controller.inputDecoratorBorderSchemeColorLight,
                    onChanged:
                        controller.setInputDecoratorBorderSchemeColorLight,
                  )
                // 1st column dark
                : ColorSchemePopupMenu(
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    enabled: enableControl &&
                        !(!controller.inputDecoratorFocusedHasBorder &&
                            (!controller.inputDecoratorUnfocusedHasBorder ||
                                !controller
                                    .inputDecoratorUnfocusedBorderIsColored)),
                    title: const Text('Border color (dark)'),
                    defaultDisabledLabel: 'primary',
                    defaultLabel: baseDefaultLabelDarkColor,
                    value: controller.inputDecoratorBorderSchemeColorDark,
                    onChanged:
                        controller.setInputDecoratorBorderSchemeColorDark,
                  ),
            lastWidget: SwitchListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
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
            isRow: isRow,
          );
        }),
        //
        // Unfocused border
        //
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SwitchListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Unfocused has border'),
              value:
                  enableControl && controller.inputDecoratorUnfocusedHasBorder,
              onChanged: enableControl
                  ? controller.setInputDecoratorUnfocusedHasBorder
                  : null,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled:
                  enableControl && controller.inputDecoratorUnfocusedHasBorder,
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
            isRow: isRow,
          );
        }),
        //
        // Focused border
        //
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SwitchListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Focused has border'),
              value: enableControl && controller.inputDecoratorFocusedHasBorder,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.setInputDecoratorFocusedHasBorder
                      : null,
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
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
            isRow: isRow,
          );
        }),
        const Divider(),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: isLight
                // 1st column light
                ? ColorSchemePopupMenu(
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    enabled: enableControl,
                    title: const Text('Focused prefix icon'),
                    defaultLabel: 'onSurfaceVariant',
                    defaultLabelM2:
                        controller.inputDecoratorSchemeColorLight?.name ??
                            'primary',
                    defaultDisabledLabelM2: 'primary',
                    value: controller.inputDecoratorPrefixIconLightSchemeColor,
                    onChanged:
                        controller.setInputDecoratorPrefixIconLightSchemeColor,
                  )
                // 1st column dark
                : ColorSchemePopupMenu(
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
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
            lastWidget: isLight
                // 2nd column light
                ? ColorSchemePopupMenu(
                    enabled: enableControl,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                    title: const Text('Focused suffix icon'),
                    defaultLabel: 'onSurfaceVariant',
                    defaultLabelM2:
                        controller.inputDecoratorSchemeColorLight?.name ??
                            'primary',
                    defaultDisabledLabelM2: 'primary',
                    value: controller.inputDecoratorSuffixIconLightSchemeColor,
                    onChanged:
                        controller.setInputDecoratorSuffixIconLightSchemeColor,
                  )
                // 2nd column dark
                : ColorSchemePopupMenu(
                    enabled: enableControl,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
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
            isRow: isRow,
          );
        }),
        const Divider(),
        //
        // TextField Padding props
        //
        SwitchListTileReveal(
          enabled: enableControl,
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
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
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
              valueDefaultLabel: DecoratorDefault.start.asLabel(controller),
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
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
              valueDefaultLabel: DecoratorDefault.end.asLabel(controller),
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
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
              valueDefaultLabel: DecoratorDefault.top.asLabel(controller),
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
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
              valueDefaultLabel: DecoratorDefault.bottom.asLabel(controller),
            ),
            isRow: isRow,
          );
        }),
        //
        const SizedBox(height: 8),
        const Divider(height: 0),
        //
        // Text Selection Style
        //
        if (isLight)
          ListTile(
            title: const Text('TextSelection style (light)'),
            tileColor: theme.colorScheme.surfaceContainer,
          )
        else
          ListTile(
            title: const Text('TextSelection style (dark)'),
            tileColor: theme.colorScheme.surfaceContainer,
          ),
        const Divider(height: 0),
        const Padding(
          padding: EdgeInsetsDirectional.only(start: 16, end: 108, top: 16),
          child: TextField(
            showCursor: true,
            decoration: InputDecoration(
              hintText: 'Write something to try text selection style',
              labelText: 'TextField selection',
            ),
          ),
        ),
        if (isLight) ...<Widget>[
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                enabled: enableControl,
                title: const Text('Cursor'),
                defaultLabel: baseDefaultLabelLightColor,
                defaultDisabledLabel: 'primary',
                value: controller.inputCursorLightSchemeColor,
                onChanged: controller.setInputCursorLightSchemeColor,
              ),
              lastWidget: ColorSchemePopupMenu(
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                enabled: enableControl,
                title: const Text('Selection handles'),
                defaultLabel: baseDefaultHandleLabelLightColor,
                defaultDisabledLabel: 'primary',
                value: controller.inputSelectionHandleLightSchemeColor,
                onChanged: controller.setInputSelectionHandleLightSchemeColor,
              ),
              isRow: isRow,
            );
          }),
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                enabled: enableControl,
                title: const Text('Selection'),
                defaultLabel: baseDefaultLabelLightColor,
                defaultDisabledLabel: 'primary',
                value: controller.inputSelectionLightSchemeColor,
                onChanged: controller.setInputSelectionLightSchemeColor,
              ),
              lastWidget: SliderListTileReveal(
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
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
              isRow: isRow,
            );
          }),
        ] else ...<Widget>[
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                enabled: enableControl,
                title: const Text('Cursor'),
                defaultLabel: baseDefaultLabelDarkColor,
                defaultDisabledLabel: 'primary',
                value: controller.inputCursorDarkSchemeColor,
                onChanged: controller.setInputCursorDarkSchemeColor,
              ),
              lastWidget: ColorSchemePopupMenu(
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                enabled: enableControl,
                title: const Text('Selection handles'),
                defaultLabel: baseDefaultHandleLabelDarkColor,
                defaultDisabledLabel: 'primary',
                value: controller.inputSelectionHandleDarkSchemeColor,
                onChanged: controller.setInputSelectionHandleDarkSchemeColor,
              ),
              isRow: isRow,
            );
          }),
          ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
            return RowOrColumn(
              firstWidget: ColorSchemePopupMenu(
                contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                enabled: enableControl,
                title: const Text('Selection'),
                defaultLabel: baseDefaultLabelDarkColor,
                defaultDisabledLabel: 'primary',
                value: controller.inputSelectionDarkSchemeColor,
                onChanged: controller.setInputSelectionDarkSchemeColor,
              ),
              lastWidget: SliderListTileReveal(
                contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
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
              isRow: isRow,
            );
          }),
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
                      'repo if you want this to change.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
