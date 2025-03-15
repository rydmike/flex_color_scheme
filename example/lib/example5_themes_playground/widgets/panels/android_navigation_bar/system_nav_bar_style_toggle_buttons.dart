import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Widget used to change the used app bar style mode in example 5.
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
          child: Icon(
            Icons.lens,
            color: isLight ? Colors.white : Colors.black,
            size: 30,
          ),
        ),
        Tooltip(
          message: 'Themed surface color',
          child: Icon(
            Icons.lens,
            color: colorScheme.surface,
            size: 30,
          ),
        ),
        Tooltip(
          message: 'Themed surfaceContainerLow color',
          child: Icon(
            Icons.lens,
            color: colorScheme.surfaceContainerLow,
            size: 30,
          ),
        ),
        Tooltip(
          message: 'Themed scaffoldBackground color',
          child: Icon(
            Icons.lens,
            color: theme.scaffoldBackgroundColor,
            size: 30,
          ),
        ),
        const Tooltip(
          message: 'Fully transparent',
          child: Icon(
            Icons.lens_outlined,
            size: 30,
          ),
        ),
        Tooltip(
          message: 'Themed NavigationBar background color',
          child: Icon(
            Icons.lens,
            color: theme.navigationBarTheme.backgroundColor ??
                colorScheme.surfaceContainer,
            size: 30,
          ),
        ),
      ],
    );
  }
}

// TODO(rydmike): How to to make a smaller SegmentedButton, possible?
/// Widget used to change the used app bar style mode in example 5.
///
/// This is an experiment with using [SegmentedButton] instead of
/// [ToggleButtons] but it just get too wide and it does not seem to be
/// possible to make it smaller.
class SystemNavBarStyleSegmentedButton extends StatelessWidget {
  const SystemNavBarStyleSegmentedButton({
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

    // const List<FlexSystemNavBarStyle> styles = FlexSystemNavBarStyle.values;
    final Set<FlexSystemNavBarStyle> selected = <FlexSystemNavBarStyle>{style};

    return SegmentedButton<FlexSystemNavBarStyle>(
      showSelectedIcon: false,
      // expandedInsets: EdgeInsets.zero,
      style: SegmentedButton.styleFrom(
        // foregroundColor: Colors.black,
        // selectedForegroundColor: colorScheme.primary,
        backgroundColor: isLight ? Colors.white : Colors.black,
        selectedBackgroundColor: colorScheme.primary,
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      segments: <ButtonSegment<FlexSystemNavBarStyle>>[
        ButtonSegment<FlexSystemNavBarStyle>(
          value: FlexSystemNavBarStyle.system,
          icon: Tooltip(
            message: isLight
                ? 'Android default\n(White)'
                : 'Android default\n(Black)',
            child: Icon(
              Icons.lens,
              color: isLight ? Colors.white : Colors.black,
              size: 30,
            ),
          ),
        ),
        ButtonSegment<FlexSystemNavBarStyle>(
          value: FlexSystemNavBarStyle.surface,
          icon: Tooltip(
            message: 'Themed surface color',
            child: Icon(
              Icons.lens,
              color: colorScheme.surface,
              size: 30,
            ),
          ),
        ),
        ButtonSegment<FlexSystemNavBarStyle>(
          value: FlexSystemNavBarStyle.background,
          icon: Tooltip(
            message: 'Themed surfaceContainerLow color',
            child: Icon(
              Icons.lens,
              color: colorScheme.surfaceContainerLow,
              size: 30,
            ),
          ),
        ),
        ButtonSegment<FlexSystemNavBarStyle>(
          value: FlexSystemNavBarStyle.scaffoldBackground,
          icon: Tooltip(
            message: 'Themed scaffoldBackground color',
            child: Icon(
              Icons.lens,
              color: theme.scaffoldBackgroundColor,
              size: 30,
            ),
          ),
        ),
        ButtonSegment<FlexSystemNavBarStyle>(
          value: FlexSystemNavBarStyle.transparent,
          icon: Tooltip(
            message: 'Fully transparent',
            child: Icon(
              Icons.lens_outlined,
              color: colorScheme.surface,
              size: 30,
            ),
          ),
        ),
        ButtonSegment<FlexSystemNavBarStyle>(
          value: FlexSystemNavBarStyle.navigationBar,
          icon: Tooltip(
            message: 'Themed NavigationBar background color',
            child: Icon(
              Icons.lens,
              color: theme.navigationBarTheme.backgroundColor ??
                  colorScheme.surfaceContainer,
              size: 30,
            ),
          ),
        ),
      ],
      selected: selected,
      onSelectionChanged: (Set<FlexSystemNavBarStyle> newSelection) {
        if (newSelection.isNotEmpty) {
          onChanged(newSelection.first);
        }
      },
    );
  }
}
