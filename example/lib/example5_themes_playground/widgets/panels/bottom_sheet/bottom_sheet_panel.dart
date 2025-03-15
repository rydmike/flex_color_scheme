import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';
import '../../shared/enum_popup_menu.dart';

class BottomSheetPanel extends StatelessWidget {
  const BottomSheetPanel(this.controller, {super.key});

  final ThemeController controller;

  static final Uri _fcsIssue270 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'rydmike/flex_color_scheme/issues/270',
  );

  static final Uri _fcsFlutterIssue160963 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/160963',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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

    // Get effective platform default global radius.
    final double? effectiveRadius = ThemeValues.effectiveRadius(controller);
    final String sheetRadiusDefaultLabel = controller.bottomSheetBorderRadius ==
                null &&
            effectiveRadius == null
        ? '28 dp'
        : controller.bottomSheetBorderRadius == null && effectiveRadius != null
            ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
            : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('BottomSheet'),
          subtitleReveal: Text(
              'The BottomSheet comes in two variants, normal and '
              'modal version. Some of their properties can be themed '
              'individually, but not all of them. The border radius only has '
              'one the property shared by both variants.\n'),
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Radius'),
          value: controller.bottomSheetBorderRadius,
          onChanged: controller.setBottomSheetBorderRadius,
          min: 0,
          max: 50,
          divisions: 50,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: sheetRadiusDefaultLabel,
          valueDefaultDisabledLabel: useMaterial3 ? '28 dp' : '0 dp',
        ),
        EnumPopupMenu<Clip>(
          enabled: enableControl,
          values: Clip.values,
          title: const Text('Content clip behavior'),
          subtitleReveal: const Text('Controls how the content is clipped '
              'inside the BottomSheet. Clip is needed if you have content '
              'in the bottom sheet that would overlap its rounded top '
              'corners. See known issues below for more info.\n'),
          value: controller.bottomSheetClipBehavior,
          onChanged: controller.setBottomSheetClipBehavior,
        ),
        const Divider(),
        const ListTile(title: Text('Standard BottomSheet')),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetShowcase(),
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Elevation'),
          value: controller.bottomSheetElevation,
          onChanged: controller.setBottomSheetElevation,
          min: 0,
          max: 20,
          divisions: 20,
          valueDecimalPlaces: 0,
          valueHeading: 'ELEV',
          valueDefaultLabel: useMaterial3 ? '1' : '4',
          valueDefaultDisabledLabel: useMaterial3 ? '1' : '0',
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Background color'),
          defaultLabel: 'surfaceContainerLow',
          defaultDisabledLabelM2: 'canvasColor',
          value: controller.bottomSheetSchemeColor,
          onChanged: controller.setBottomSheetSchemeColor,
        ),
        const Divider(),
        const ListTile(title: Text('Modal BottomSheet')),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetModalShowcase(),
        ),
        const SizedBox(height: 16),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Elevation'),
          value: controller.bottomSheetModalElevation,
          onChanged: controller.setBottomSheetModalElevation,
          min: 0,
          max: 20,
          divisions: 20,
          valueDecimalPlaces: 0,
          valueHeading: 'ELEV',
          valueDefaultLabel: useMaterial3 ? '2' : '8',
          valueDefaultDisabledLabel: useMaterial3 ? '1' : '0',
        ),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Background color'),
          defaultLabel: 'surfaceContainerLow',
          defaultDisabledLabelM2: 'canvasColor',
          value: controller.bottomSheetModalSchemeColor,
          onChanged: controller.setBottomSheetModalSchemeColor,
        ),
        const Divider(),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Using a BackdropFilter with a BottomSheet does not '
                      'work if any other content clip behavior than Clip.none '
                      'is used. This is a known issue in Flutter, see '
                      'Flutter SDK ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue160963,
                  text: 'issue #160963',
                ),
                // _fcsChipUmbrellaIssue115364
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n\n'
                      'The issues is also reported in the FlexColorScheme '
                      'issue tracker, see issue ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsIssue270,
                  text: 'issue #270',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. It contains a work around example that can be used '
                      'to change the clip behavior to Clip.none, if you need '
                      'to use a BackdropFilter with a BottomSheet, with FCS '
                      'versions prior to 8.1.0, when the property value '
                      'defaulted to Clip.antiAlias and could not be changed.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
