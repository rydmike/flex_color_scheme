import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

class BottomSheetPanel extends StatelessWidget {
  const BottomSheetPanel(this.controller, {super.key});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

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
      ],
    );
  }
}
