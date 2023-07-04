import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';

class PopupMenuButtonSettings extends StatelessWidget {
  const PopupMenuButtonSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    final String popupMenuElevationDefaultLabel =
        controller.popupMenuElevation == null
            ? useMaterial3
                ? 'default 3'
                : 'default 6'
            : '';
    final double popupOpacity =
        controller.useSubThemes && controller.useFlexColorScheme
            ? controller.popupMenuOpacity
            : 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('PopupMenuButton'),
          subtitleDense: true,
          subtitle: Text(
            'The PopupMenuButton can be used on any widget, it is typically '
            'used on an Icon, as below. Its implementation differs from newer '
            'Material-3 menu components. '
            'PopupMenuButton is originally a Material-2 design, that has also '
            'been updated to M3 style. It still works well and can be themed '
            'to a certain degree. '
            'If applicable, consider using newer more versatile M3 menu '
            'components, like MenuAnchor and DropdownMenu.\n',
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: PopupMenuButtonsShowcase(explain: false),
        ),
        const ListTileReveal(
          title: Text('Known limitations'),
          dense: true,
          subtitle: Text('FCS themes foreground color by default to correct '
              'contrast pair for selected background color. This works well '
              'if your PopupMenuItems only contain Text widgets. If they '
              'contain e.g. ListTiles, like the second PopupMenuButton above, '
              'the items will not use the contrasting foreground color via the '
              "PopupMenuTheme's foreground color. You will have to define the "
              'correct foreground color for your items used by '
              'PopupMenuItems.\n'
              '\n'
              'Recommend avoiding theme mode reverse brightness as background '
              'on PopupMenuButton to avoid this limitation. Such color choices '
              'are not very useful designs anyway, so it should not be a big '
              'limitation.'),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color of container'),
          labelForDefault: 'default (surface)',
          index: controller.popupMenuSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setPopupMenuSchemeColor(null);
                  } else {
                    controller
                        .setPopupMenuSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Opacity of container'),
          subtitle: Slider(
            max: 100,
            divisions: 100,
            label: (popupOpacity * 100).toStringAsFixed(0),
            value: popupOpacity * 100,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setPopupMenuOpacity(value / 100);
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
                  '${(popupOpacity * 100).toStringAsFixed(0)} %',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTileReveal(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Container radius'),
          subtitleDense: true,
          subtitle: const Text(
            'Does not use the global border radius setting. '
            'Avoid using large border radius on menu container.\n',
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          subtitle: Slider(
            min: -1,
            max: 12,
            divisions: 13,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuBorderRadius == null ||
                        (controller.popupMenuBorderRadius ?? -1) < 0
                    ? 'default 4'
                    : (controller.popupMenuBorderRadius?.toStringAsFixed(0) ??
                        '')
                : 'default 4',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setPopupMenuBorderRadius(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.popupMenuBorderRadius == null ||
                              (controller.popupMenuBorderRadius ?? -1) < 0
                          ? 'default 4'
                          : (controller.popupMenuBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : 'default 4',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuElevation == null ||
                        (controller.popupMenuElevation ?? -1) < 0
                    ? popupMenuElevationDefaultLabel
                    : (controller.popupMenuElevation?.toStringAsFixed(0) ?? '')
                : useMaterial3
                    ? 'default 3'
                    : 'default 8',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.popupMenuElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setPopupMenuElevation(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.popupMenuElevation == null ||
                              (controller.popupMenuElevation ?? -1) < 0
                          ? popupMenuElevationDefaultLabel
                          : (controller.popupMenuElevation
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 3'
                          : 'default 8',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        const ListTileReveal(
          title: Text('DropdownButtonFormField'),
          subtitleDense: true,
          subtitle: Text('An older Material-2 widget, it uses the TextField '
              'input decoration style by default. It does not work well with '
              'high border radius and filled background, since there is no '
              'corner clip of background fill color. '
              'Maybe consider using the M3 DropdownMenu widget instead.\n'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: DropdownButtonFormFieldShowcase(),
        ),
        const ListTileReveal(
          title: Text('DropdownButton'),
          subtitleDense: true,
          subtitle: Text('An older Material-2 widget, it cannot be themed. '
              'Consider using M3 DropdownMenu instead.\n'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: DropDownButtonShowcase(),
        ),
      ],
    );
  }
}
