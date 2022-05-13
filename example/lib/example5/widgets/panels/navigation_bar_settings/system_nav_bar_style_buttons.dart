import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Widget used to change the used app bar style mode in example 5.
class SystemNavBarStyleButtons extends StatelessWidget {
  const SystemNavBarStyleButtons({
    super.key,
    required this.style,
    required this.onChanged,
  });
  final FlexSystemNavBarStyle style;
  final ValueChanged<FlexSystemNavBarStyle> onChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    final List<bool> isSelected = <bool>[
      style == FlexSystemNavBarStyle.system,
      style == FlexSystemNavBarStyle.surface,
      style == FlexSystemNavBarStyle.background,
      style == FlexSystemNavBarStyle.scaffoldBackground,
      style == FlexSystemNavBarStyle.transparent,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        onChanged(FlexSystemNavBarStyle.values[newIndex]);
      },
      children: <Widget>[
        Tooltip(
          message:
              isLight ? 'Android default\n(White)' : 'Android default\n(Black)',
          child: Icon(Icons.lens, color: isLight ? Colors.white : Colors.black),
        ),
        Tooltip(
          message: 'Themed surface color',
          child: Icon(Icons.lens, color: scheme.surface.darken(5)),
        ),
        Tooltip(
          message: 'Themed background color',
          child: Icon(Icons.lens, color: scheme.background.darken(5)),
        ),
        Tooltip(
          message: 'Themed scaffold background color',
          child: Icon(
            Icons.lens,
            color: Theme.of(context).scaffoldBackgroundColor.darken(5),
          ),
        ),
        const Tooltip(
          message: 'Fully transparent',
          child: Icon(Icons.lens_outlined),
        ),
      ],
    );
  }
}
