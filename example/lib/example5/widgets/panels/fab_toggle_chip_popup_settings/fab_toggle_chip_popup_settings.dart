import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class FabToggleChipPopupSettings extends StatelessWidget {
  const FabToggleChipPopupSettings({
    Key? key,
    required this.controller,
    this.isOpen = true,
    this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final double popupOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.popupMenuOpacity
            : 1;
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('FAB, ToggleButtons, Chip and Popup'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ColorSchemePopupMenu(
            title: const Text('FloatingActionButton color'),
            labelForDefault: 'null (secondary)',
            index: controller.fabSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setFabSchemeColor(null);
                    } else {
                      controller.setFabSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          SwitchListTileAdaptive(
            title: const Text('Use themed Shape on FloatingActionButton'),
            subtitle: const Text('OFF removes the Shape usage from its '
                'component theme, making it use the default un-themed style. '
                'This is circular while M2 remain its default un-themed style. '
                'It may become the M3 style later. Currently even setting '
                'ThemeData useMaterial3 to true, does not switch it '
                'to M3 style. FlexColorScheme component sub-themes defaults '
                'it to M3 style, unless you remove its shape completely with '
                'this flag.'),
            value: controller.fabUseShape &&
                controller.useSubThemes &&
                controller.useFlexColorScheme,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.setFabUseShape
                : null,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: FabShowcase(),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('ToggleButtons color'),
            index: controller.toggleButtonsSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setToggleButtonsSchemeColor(null);
                    } else {
                      controller.setToggleButtonsSchemeColor(
                          SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: ToggleButtonsShowcase(),
          ),
          ListTile(
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
            title: const Text('ToggleButtons border radius'),
            subtitle: Slider.adaptive(
              min: -1,
              max: 30,
              divisions: 31,
              label: controller.toggleButtonsBorderRadius == null ||
                      (controller.toggleButtonsBorderRadius ?? -1) < 0
                  ? 'default'
                  : (controller.toggleButtonsBorderRadius?.toStringAsFixed(0) ??
                      ''),
              value: controller.useSubThemes && controller.useFlexColorScheme
                  ? controller.toggleButtonsBorderRadius ?? -1
                  : 0,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? (double value) {
                          controller.setToggleButtonsBorderRadius(
                              value < 0 ? null : value);
                        }
                      : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'RADIUS',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    controller.useSubThemes && controller.useFlexColorScheme
                        ? controller.toggleButtonsBorderRadius == null ||
                                (controller.toggleButtonsBorderRadius ?? -1) < 0
                            ? 'default'
                            : (controller.toggleButtonsBorderRadius
                                    ?.toStringAsFixed(0) ??
                                '')
                        : '0',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          ColorSchemePopupMenu(
            title: const Text('Chip color'),
            index: controller.chipSchemeColor?.index ?? -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (int index) {
                    if (index < 0 || index >= SchemeColor.values.length) {
                      controller.setChipSchemeColor(null);
                    } else {
                      controller.setChipSchemeColor(SchemeColor.values[index]);
                    }
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: ChipShowcase(),
          ),
          const Divider(),
          ListTile(
            enabled: controller.useSubThemes && controller.useFlexColorScheme,
            title: const Text('PopupMenu opacity'),
            subtitle: Slider.adaptive(
              max: 100,
              divisions: 100,
              label: (popupOpacity * 100).toStringAsFixed(0),
              value: popupOpacity * 100,
              onChanged:
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? (double value) {
                          controller.setPopupMenuOpacity(value / 100);
                        }
                      : null,
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'OPACITY',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    '${(popupOpacity * 100).toStringAsFixed(0)} %',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PopupDropdownButtonsShowcase(),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircleAvatarAndTooltipShowcase(),
          ),
        ],
      ),
    );
  }
}
