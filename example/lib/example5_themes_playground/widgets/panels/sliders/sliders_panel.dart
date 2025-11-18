import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_expand.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';
import '../../shared/test_adaptive_response.dart';

class SlidersPanel extends StatelessWidget {
  const SlidersPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue125329 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/125329',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool use2023Style = controller.sliderYear2023 ?? true;

    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    final String labelThumbDefault = controller.sliderBaseSchemeColor == null
        ? 'primary'
        : '${controller.sliderBaseSchemeColor?.name}';
    final String labelIndicatorDefault =
        controller.sliderBaseSchemeColor == null &&
                controller.sliderThumbSchemeColor == null
            ? 'primary'
            : controller.sliderThumbSchemeColor == null
                ? '${controller.sliderBaseSchemeColor?.name}'
                : '${controller.sliderThumbSchemeColor?.name}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTileReveal(
          enabled: enableControl && useMaterial3,
          title: const Text('Use legacy Material-3 style'),
          subtitleReveal: const Text(
              'The Material-3 specification for the Slider design changed in '
              'December 2023. The old style is ON and used by default in '
              'Flutter and FCS Material-3 to not break past themed style. '
              'Turn OFF this setting to opt-in and enable the newer and '
              'current Material-3 Slider style.\n'
              '\n'
              'There are plans to make the new style the default in a future '
              'Flutter release and remove support for the older M3 style. When '
              'that happens and if it is '
              'possible, FCS will retain support for the older '
              'M3 style via theming options.'),
          value: use2023Style,
          onChanged: controller.setSliderYear2023,
        ),
        const Divider(),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Main color'),
              defaultLabel: 'primary',
              value: controller.sliderBaseSchemeColor,
              onChanged: controller.setSliderBaseSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Thumb color'),
              defaultLabel: labelThumbDefault,
              value: controller.sliderThumbSchemeColor,
              onChanged: controller.setSliderThumbSchemeColor,
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Value indicator color'),
              defaultLabel: labelIndicatorDefault,
              defaultDisabledLabelM2:
                  'grey [onSurface op60% alpha blended w. surface op90%]',
              colorPrefix: controller.sliderValueTinted ? 'tinted ' : '',
              value: controller.sliderIndicatorSchemeColor,
              onChanged: controller.setSliderIndicatorSchemeColor,
            ),
            lastWidget: SwitchListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Tinted indicator'),
              subtitleReveal: Text(
                'Uses a scrim and opacity, to make it much '
                '${isLight ? 'darker' : 'lighter'} than the selected color, '
                'it also and adds some slight opacity. By default the value '
                'indicator only shows up on a stepped Slider. You can change '
                'this behavior with the indicator visibility further '
                'below.\n',
              ),
              value: controller.sliderValueTinted,
              onChanged: controller.setSliderValueTinted,
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: EnumPopupMenu<FlexSliderIndicatorType>(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              values: FlexSliderIndicatorType.values,
              title: const Text('Indicator type'),
              value: controller.sliderValueIndicatorType,
              onChanged: controller.setSliderValueIndicatorType,
              defaultLabel: enableControl && useMaterial3 && !use2023Style
                  ? 'Default (rounded)'
                  : null,
            ),
            lastWidget: EnumPopupMenu<ShowValueIndicator>(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              values: ShowValueIndicator.values,
              title: const Text('Indicator visibility'),
              value: controller.sliderShowValueIndicator,
              onChanged: controller.setSliderShowValueIndicator,
            ),
            isRow: isRow,
          );
        }),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Track height'),
          value: controller.sliderTrackHeight,
          onChanged: controller.setSliderTrackHeight,
          min: 1,
          max: 40,
          divisions: 39,
          valueDecimalPlaces: 0,
          valueHeading: 'HEIGHT',
          valueUnitLabel: ' dp',
          valueDefaultLabel: useMaterial3 && !use2023Style ? '16 dp' : '4 dp',
        ),
        const Divider(),
        const ListTile(title: Text('Slider')),
        //
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SliderShowcase(),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'There are many issues related to Slider and a few '
                      'to its theming as well. You can find a collection of '
                      'issues related to the Slider in the slider umbrella ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue125329,
                  text: 'issue #125329',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTileReveal(title: Text('RangeSlider')),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RangeSliderShowcase(),
        ),
        const Divider(),
        ListTileExpand(
          title: const Text('Slider.adaptive'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: <Widget>[
                const SliderAdaptiveShowcase(),
                TestAdaptiveResponse(controller),
              ],
            ),
          ),
        ),

        const Divider(),
        ListTileReveal(
          title: const Text('Known issues'),
          dense: true,
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The RangeSlider should behave and look like Slider '
                      'in Material-3 mode in the older M3 style as well. This '
                      'design is not available in Flutter 3.38 and earlier. '
                      'It can also not use the same indicator classes as '
                      'Slider. FCS applies the paddle drop style as a better '
                      'match with the older M3 than the rectangle in '
                      'M3 mode as default when older M3 style is used.\n'
                      '\n'
                      'When using the newer Material-3 Slider style, that '
                      'was introduced in December 2023, the RangeSlider gets '
                      'the correct updated Material-3 design\n'
                      '\n'
                      'RangeSlider behaves a bit differently from Slider when '
                      'looking at things like hover and focus responses. It '
                      'also lacks any kind of keyboard usage support. '
                      'You can find a collection of issues related to the '
                      'RangeSlider in the slider umbrella ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue125329,
                  text: 'issue #125329',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
