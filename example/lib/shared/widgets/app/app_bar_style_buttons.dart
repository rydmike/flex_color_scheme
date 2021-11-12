import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Widget used to change the used app bar style mode in example 5.
class AppBarStyleButtons extends StatelessWidget {
  const AppBarStyleButtons({
    Key? key,
    required this.style,
    required this.onChanged,
    this.customAppBarColor,
  }) : super(key: key);
  final FlexAppBarStyle style;
  final ValueChanged<FlexAppBarStyle> onChanged;
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
      onPressed: (int newIndex) {
        onChanged(FlexAppBarStyle.values[newIndex]);
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
          message: 'Custom, typically\nsecondary variant',
          child: Icon(Icons.panorama_wide_angle_select,
              color: customAppBarColor ?? scheme.secondaryVariant),
        ),
      ],
    );
  }
}
