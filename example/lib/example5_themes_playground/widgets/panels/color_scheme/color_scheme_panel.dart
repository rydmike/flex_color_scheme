import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/controllers/tone_indicator_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/list_tile_slider.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/custom_uses_dark_colors_for_seed_switch.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/show_input_colors_switch.dart';
import '../../shared/surfaces_seed_blend_color.dart';
import '../../shared/use_seeded_color_scheme_switch.dart';
import 'flex_tone_config_popup_menu.dart';
import 'scheme_colors.dart';
import 'show_tonal_palette.dart';

// Panel used to show effective color scheme, when using keys to seed it
// and just using raw FlexSchemeColors input data too based ColorScheme too.
class ColorSchemePanel extends StatefulWidget {
  const ColorSchemePanel(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  @override
  State<ColorSchemePanel> createState() => _ColorSchemePanelState();
}

class _ColorSchemePanelState extends State<ColorSchemePanel> {
  String get _flexToneName =>
      FlexSchemeVariant.values[widget.controller.usedFlexToneSetup].variantName;

  bool get _isFlutterScheme => FlexSchemeVariant
      .values[widget.controller.usedFlexToneSetup].isFlutterScheme;

  String get _seedType => _isFlutterScheme ? 'MCU' : 'FSS';

  final ToneIndicatorController toneController = ToneIndicatorController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    // Show blend info if blend is used and key colors are used.
    final bool showBlendInfo =
        ((isLight && widget.controller.blendLevelLight > 0) ||
                (!isLight && widget.controller.blendLevelDark > 0)) &&
            widget.controller.useKeyColors;

    return ListenableBuilder(
      listenable: toneController,
      builder: (BuildContext context, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 8),
            UseSeededColorSchemeSwitch(controller: widget.controller),
            FlexToneConfigPopupMenu(
              enabled: widget.controller.useKeyColors,
              title: 'Scheme',
              flexToneName: '$_flexToneName $_seedType',
              index: widget.controller.usedFlexToneSetup,
              onChanged: widget.controller.setUsedFlexToneSetup,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ShowTonalPalette(
                themController: widget.controller,
                toneController: toneController,
              ),
            ),
            const SizedBox(height: 4),
            if (isLight)
              SurfacesSeedBlendColorLight(
                widget.controller,
                dense: true,
              )
            else
              SurfacesSeedBlendColorDark(
                widget.controller,
                dense: true,
              ),
            ResponsiveTwoWidgets(
              builder: (BuildContext context, bool isRow) {
                return RowOrColumn(
                  isRow: isRow,
                  firstWidget: ListTileReveal(
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    enabled: widget.controller.useKeyColors,
                    title: const Text('Keep input colors?'),
                    dense: true,
                    subtitleReveal: const Text(
                      'With the switches on the colors below you can lock '
                      'primary, secondary, tertiary, error and their '
                      'container colors to their scheme input defined colors, '
                      'instead of using the color from the seeded tonal '
                      'palette. The switches have '
                      'separate states for light and dark theme mode.\n',
                    ),
                  ),
                  lastWidget: ShowInputColorsSwitch(
                    controller: widget.controller,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
              child: SchemeColors(
                tc: widget.controller,
                toneC: toneController,
              ),
            ),
            if (widget.controller.schemeIndex != (AppColor.schemes.length - 1))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Tap a color code to copy it to the clipboard.'
                  '\n'
                  // ignore: lines_longer_than_80_chars
                  "${widget.controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color above. ' : ''}"
                  // ignore: lines_longer_than_80_chars
                  "${showBlendInfo ? 'Color blends are used, blended colors may not be found in palettes when hovered.' : '\n'}",
                  style: theme.textTheme.labelSmall,
                ),
              ),
            if (widget.controller.schemeIndex == (AppColor.schemes.length - 1))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'This is the customizable color theme, you can tap on '
                  'primary, secondary, tertiary and error colors, plus their '
                  'container colors, to change them.'
                  '\n'
                  // ignore: lines_longer_than_80_chars
                  "${widget.controller.useKeyColors ? 'Hover a color to highlight its tonal palette source color above. ' : ''}"
                  // ignore: lines_longer_than_80_chars
                  "${showBlendInfo ? 'Color blends are used, blended colors may not be found in palettes when hovered.' : '\n'}",
                  style: theme.textTheme.labelSmall,
                ),
              ),
            const Divider(),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 24, 0),
              child: Text(
                'Adjust the none seeded ColorScheme',
                style: TextStyle(fontSize: 13),
              ),
            ),
            EnumPopupMenu<FlexFixedColorStyle>(
              dense: true,
              enabled: widget.controller.useFlexColorScheme &&
                  !widget.controller.useKeyColors,
              values: FlexFixedColorStyle.values,
              title: const Text('Fixed colors'),
              subtitleReveal: const Text(
                'This setting applies when not using seed generated '
                'ColorSchemes. '
                'It offers three styles. FCS computed fixed and fixedDim '
                'style, that is not seed generated in HCT color space. '
                'Alternatively two different seed generated versions can be '
                'used. The first one is called seeded by FSS, it uses the same '
                'color tones as the MCU spec. The second option uses tones '
                'that create fixed and fixedDim colors that are brighter and '
                'have more contrast.\n'
                '\n'
                'Fixed and fixed dim colors are used for colors that have '
                'the same color value in light and dark mode.\n',
              ),
              value: widget.controller.fixedColorStyle,
              onChanged: widget.controller.setFixedColorStyle,
            ),
            const Divider(height: 1),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 24, 0),
              child: Text(
                'Adjust the seeded ColorScheme',
                style: TextStyle(fontSize: 13),
              ),
            ),
            ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
              return RowOrColumn(
                isRow: isRow,
                firstWidget: SwitchListTileReveal(
                  contentPadding: ThemeValues.tilePaddingStart(context, isRow),
                  dense: true,
                  enabled: widget.controller.useFlexColorScheme &&
                      widget.controller.useKeyColors,
                  title: const Text('Expressive containers'),
                  subtitleReveal: const Text(
                    'Use tone 30 instead of 10 for onColors on containers in '
                    'LIGHT mode. This is a new Material-3 spec standard. It '
                    'is more color expressive, but reduces contrast.\n'
                    '\n'
                    'This modifier ONLY impacts LIGHT scheme variants where '
                    'the container on colors use tone 10. For scheme '
                    'variants with an intentionally custom tone for onColors '
                    'on containers, this setting has no impact. Such '
                    'variants are:\n'
                    ' - Fidelity\n'
                    ' - Monochrome\n'
                    ' - Content\n'
                    ' - Ultra Contrast\n'
                    ' - Candy pop\n'
                    ' - Chroma\n'
                    '\n'
                    "This feature is not yet used by Flutter's "
                    'ColorScheme.fromSeed produced ColorSchemes, but will be '
                    'when Flutter upgrades to Material Color Utilities (MCU) '
                    '0.12.0. You can opt in on using it already now, or '
                    'decide not to use it. With FSS you will be able to do '
                    'so, even after it becomes a forced default and the only '
                    "option in Flutter's ColorScheme.fromSeed.\n"
                    '\n'
                    'For MCU seed generated schemes, this only has any '
                    'impact when contrast level is at the default value (0), '
                    'normal contrast.\n'
                    '\n'
                    'When using FFS seed generated schemes, the tones '
                    'modifier "B&W main onColors" will override this '
                    'setting.\n',
                  ),
                  value: widget.controller.expressiveOnContainer,
                  onChanged: widget.controller.setExpressiveOnContainer,
                ),
                lastWidget: SwitchListTileReveal(
                  contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                  dense: true,
                  enabled: widget.controller.useFlexColorScheme &&
                      widget.controller.useKeyColors,
                  title: const Text('Legacy monochrome seed'),
                  subtitleReveal: const Text(
                    'With Flutter and also FCS versions before V8, using a '
                    'monochrome seed color or white color, resulted in a '
                    'tonal palette with cyan color tones. Whereas a black '
                    'seed color resulted in red like color tones. This is '
                    'not very intuitive and not really expected or desired '
                    'when using monochrome seed colors.\n'
                    '\n'
                    'In V8 and later of FCS any monochrome RGB input value '
                    'will result in the creation of a greyscale tonal '
                    'palette for the palette using the monochrome seed '
                    'color. An RGB monochrome value is one where Red, Green '
                    'and Blue values are all equal. If you need the legacy '
                    'style seed result for monochrome seed '
                    'colors, then turn ON this setting.\n',
                  ),
                  value: widget.controller.useLegacyMonochromeSeedBehavior,
                  onChanged:
                      widget.controller.setUseLegacyMonochromeSeedBehavior,
                ),
              );
            }),
            CustomUsesDarkColorsForSeedSwitch(controller: widget.controller),
            const Divider(height: 1),
            ListTileReveal(
              dense: true,
              title: const Text('Adjust the FSS seeded ColorScheme'),
              subtitle: _isFlutterScheme
                  ? const Text('Use a FSS scheme variant to enable modifiers')
                  : null,
              subtitleReveal: !widget.controller.useKeyColors ||
                      _isFlutterScheme
                  ? null
                  : const Text(
                      'FSS FlexTones adjustments are separate for light '
                      'and dark mode, '
                      'except the higher contrast fixed and fixedDim option '
                      'that must be same so that fixed scheme colors in light '
                      'and dark mode remain "fixed" and identical.'),
            ),
            SwitchListTileReveal(
              dense: true,
              enabled: widget.controller.useKeyColors && !_isFlutterScheme,
              title: const Text('Higher contrast fixed and fixedDim'),
              subtitleReveal: const Text(
                'The seed generated fixed, onFixed, fixedDim and '
                'onFixedVariant color palette tones use 92, 6, 84, 12 '
                'instead Material-3 design specified 90, 10, 80, 30.\n',
              ),
              value: widget.controller.higherContrastFixed,
              onChanged: widget.controller.setHigherContrastFixed,
            ),
            if (isLight) ...<Widget>[
              ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
                return RowOrColumn(
                  isRow: isRow,
                  firstWidget: SwitchListTileReveal(
                    dense: true,
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    enabled:
                        widget.controller.useKeyColors && !_isFlutterScheme,
                    title: const Text('Monochrome surfaces'),
                    subtitleReveal: const Text(
                      'All seed generated surface colors are pure greyscale '
                      'with no color tint.\n',
                    ),
                    value: widget.controller.useMonoSurfacesLight,
                    onChanged: widget.controller.setUseMonoSurfacesLight,
                  ),
                  lastWidget: SwitchListTileReveal(
                    dense: true,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                    enabled:
                        widget.controller.useKeyColors && !_isFlutterScheme,
                    title: const Text('White surface'),
                    subtitleReveal: const Text(
                      'Surface color uses tone 100 which is '
                      'always white. You can add this modifier to any seed '
                      'generation strategy. Surface blends are applied after '
                      'this and will still mix in the blend color into '
                      'surface, using selected blend strategy and level.\n',
                    ),
                    value: widget.controller.surfacesUseBWLight,
                    onChanged: widget.controller.setSurfacesUseBWLight,
                  ),
                );
              }),
              ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
                return RowOrColumn(
                  isRow: isRow,
                  firstWidget: SwitchListTileReveal(
                    dense: true,
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    enabled:
                        widget.controller.useKeyColors && !_isFlutterScheme,
                    title: const Text('B&W main onColors'),
                    subtitleReveal: const Text(
                      'Main colors are primary, secondary, tertiary, '
                      'error, their container and fixed colors. Using black '
                      'and white as contrast colors on the main colors may '
                      'improve their contrast, it also makes them less '
                      'color expressive.\n',
                    ),
                    value: widget.controller.onMainsUseBWLight,
                    onChanged: widget.controller.setOnMainsUseBWLight,
                  ),
                  lastWidget: SwitchListTileReveal(
                    dense: true,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                    enabled:
                        widget.controller.useKeyColors && !_isFlutterScheme,
                    title: const Text('B&W surface onColors'),
                    subtitleReveal: const Text(
                      'Surface on colors are onSurface, onSurfaceVariant and '
                      'onInverseSurface colors. Using black and white as '
                      'contrast colors on all surfaces will improve '
                      'the contrast.\n',
                    ),
                    value: widget.controller.onSurfacesUseBWLight,
                    onChanged: widget.controller.setOnSurfacesUseBWLight,
                  ),
                );
              }),
            ] else ...<Widget>[
              ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
                return RowOrColumn(
                  isRow: isRow,
                  firstWidget: SwitchListTileReveal(
                    dense: true,
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    enabled:
                        widget.controller.useKeyColors && !_isFlutterScheme,
                    title: const Text('Monochrome surfaces'),
                    subtitleReveal: const Text(
                      'All seed generated surface colors are pure greyscale '
                      'with no color tint.\n',
                    ),
                    value: widget.controller.useMonoSurfacesDark,
                    onChanged: widget.controller.setUseMonoSurfacesDark,
                  ),
                  lastWidget: SwitchListTileReveal(
                    dense: true,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                    enabled:
                        widget.controller.useKeyColors && !_isFlutterScheme,
                    title: const Text('Black surface'),
                    subtitleReveal: const Text(
                      'Surface uses tone 0, which is always '
                      'true black. You can add this modifier to any seed '
                      'generation strategy. Surface blends will still mix in '
                      'blend color into surface, using selected blend '
                      'strategy and level.\n',
                    ),
                    value: widget.controller.surfacesUseBWDark,
                    onChanged: widget.controller.setSurfacesUseBWDark,
                  ),
                );
              }),
              ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
                return RowOrColumn(
                  isRow: isRow,
                  firstWidget: SwitchListTileReveal(
                    dense: true,
                    contentPadding:
                        ThemeValues.tilePaddingStart(context, isRow),
                    enabled:
                        widget.controller.useKeyColors && !_isFlutterScheme,
                    title: const Text('B&W main onColors'),
                    subtitleReveal: const Text(
                      'Main colors are primary, secondary, tertiary, '
                      'error, their container and fixed colors. Using black '
                      'and white as onColors on the main colors may improve '
                      'contrast, it also makes the theme less color '
                      'expressive.\n',
                    ),
                    value: widget.controller.onMainsUseBWDark,
                    onChanged: widget.controller.setOnMainsUseBWDark,
                  ),
                  lastWidget: SwitchListTileReveal(
                    dense: true,
                    contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
                    enabled:
                        widget.controller.useKeyColors && !_isFlutterScheme,
                    title: const Text('B&W surface onColors'),
                    subtitleReveal: const Text(
                      'Surface onColors are onSurface, onSurfaceVariant and '
                      'onInverseSurface colors. Using black and white as '
                      'onColors on all surfaces may improve contrast.\n',
                    ),
                    value: widget.controller.onSurfacesUseBWDark,
                    onChanged: widget.controller.setOnSurfacesUseBWDark,
                  ),
                );
              }),
            ],
            const Divider(height: 1),
            ListTileReveal(
              dense: true,
              title: const Text('Adjust the MCU seeded ColorScheme'),
              subtitle: !widget.controller.useKeyColors || !_isFlutterScheme
                  ? const Text(
                      'Use a MCU scheme variant to enable contrast level')
                  : const Text('Same value is used in light and dark mode'),
              subtitleReveal: const Text('Please be aware that using any other '
                  'contrast level than default (0) will make the fixed colors '
                  'no longer confirm to the Material-3 design specification '
                  'that says they should be the same color in light and dark '
                  'mode.\n'
                  '\n'
                  'This is what the Material-3 accessibility contrast level '
                  'adjustment does to them. It is probably not what you want '
                  'for your design if you used them because they have the '
                  'same color values in light and dark mode. This design is '
                  'still most likely intentional, as the contrast level '
                  'adjustment is designed to allow you to easily create an '
                  'optional more accessible version of your theme by '
                  'increasing the contrast. The fixed colors do not have '
                  'very high contrast ratios, so they will need adjustment.\n'
                  '\n'
                  'When not using seeded color schemes or when using FSS '
                  'FlexTones based seed generated schemes, you have an option '
                  'to use higher contrast fixed colors, that are still fixed '
                  'and same in light and dark mode.\n'),
            ),
            ListTileSlider(
              dense: true,
              enabled: widget.controller.useKeyColors && _isFlutterScheme,
              title: const Text('Contrast level'),
              subtitle:
                  const Text('Material spec (0=Normal  0.5=Medium  1=High)'),
              min: -1,
              max: 1,
              divisions: 8,
              valueDecimals: 2,
              value: widget.controller.useKeyColors && _isFlutterScheme
                  ? widget.controller.dynamicContrastLevel
                  : 0,
              onChanged: widget.controller.setDynamicContrastLevel,
              sliderLabel: 'Contrast',
            ),
          ],
        );
      },
    );
  }
}
