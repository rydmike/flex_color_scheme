import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// TODO(rydmike): Remove this widget in example 5 in future release 6.0.0.
// Widget used to change the used app bar style mode in example 5.
//
// In version 5.2.0 of FlexColorScheme and its example 5, this widget is
// no longer used, but keeping it around for a while.
class AppBarStyleButtons extends StatelessWidget {
  const AppBarStyleButtons({
    super.key,
    this.style,
    this.onChanged,
    this.customAppBarColor,
  });
  final FlexAppBarStyle? style;
  final ValueChanged<FlexAppBarStyle>? onChanged;
  final Color? customAppBarColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final List<bool> isSelected = <bool>[
      style == FlexAppBarStyle.primary,
      style == FlexAppBarStyle.material,
      style == FlexAppBarStyle.surface,
      style == FlexAppBarStyle.background,
      style == FlexAppBarStyle.custom,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: onChanged == null
          ? null
          : (int newIndex) {
              onChanged?.call(FlexAppBarStyle.values[newIndex]);
            },
      children: <Widget>[
        Tooltip(
          message: 'Primary colored',
          child: Icon(Icons.panorama_wide_angle_select, color: scheme.primary),
        ),
        Tooltip(
          message: 'Material background',
          child: Icon(
            Icons.panorama_wide_angle_select,
            color: isLight
                ? FlexColor.materialLightSurface // Colors.white
                : FlexColor.materialDarkSurface, // Color(0xFF121212)
          ),
        ),
        Tooltip(
          message: 'Surface colored',
          child: Icon(Icons.panorama_wide_angle_select,
              color: scheme.surface.darken(5)),
        ),
        Tooltip(
          message: 'Background colored',
          child: Icon(Icons.panorama_wide_angle_select,
              color: scheme.background.darken(5)),
        ),
        Tooltip(
          message: 'Custom, defaults to\ntertiary in FCS',
          child: Icon(Icons.panorama_wide_angle_select,
              color: customAppBarColor ?? scheme.secondaryContainer),
        ),
      ],
    );
  }
}
