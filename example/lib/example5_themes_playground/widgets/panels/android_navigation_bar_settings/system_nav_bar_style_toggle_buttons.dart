import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Widget used to change the used app bar style mode in example 5.
class SystemNavBarStyleToggleButtons extends StatelessWidget {
  const SystemNavBarStyleToggleButtons({
    super.key,
    required this.style,
    required this.onChanged,
  });
  final FlexSystemNavBarStyle style;
  final ValueChanged<FlexSystemNavBarStyle> onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;

    final List<bool> isSelected = <bool>[
      style == FlexSystemNavBarStyle.system,
      style == FlexSystemNavBarStyle.surface,
      style == FlexSystemNavBarStyle.background,
      style == FlexSystemNavBarStyle.scaffoldBackground,
      style == FlexSystemNavBarStyle.transparent,
      style == FlexSystemNavBarStyle.navigationBar,
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
          child: Icon(Icons.lens, color: colorScheme.surface),
        ),
        Tooltip(
          message: 'Themed surfaceContainerLow color',
          child: Icon(Icons.lens, color: colorScheme.surfaceContainerLow),
        ),
        Tooltip(
          message: 'Themed scaffoldBackground color',
          child: Icon(
            Icons.lens,
            color: theme.scaffoldBackgroundColor,
          ),
        ),
        const Tooltip(
          message: 'Fully transparent',
          child: Icon(Icons.lens_outlined),
        ),
        Tooltip(
          message: 'Themed NavigationBar background color',
          child: Icon(
            Icons.lens,
            color: theme.navigationBarTheme.backgroundColor ??
                colorScheme.surfaceContainer,
          ),
        ),
      ],
    );
  }
}
