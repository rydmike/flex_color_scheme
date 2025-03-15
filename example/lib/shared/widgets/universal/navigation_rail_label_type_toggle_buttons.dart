import 'package:flutter/material.dart';

/// Widget using [ToggleButtons) that can be used to toggle the label style
/// of a [NavigationRail].
///
/// This is a simple Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class NavigationRailLabelTypeToggleButtons extends StatelessWidget {
  const NavigationRailLabelTypeToggleButtons({
    super.key,
    this.style,
    this.onChanged,
  });
  final NavigationRailLabelType? style;
  final ValueChanged<NavigationRailLabelType>? onChanged;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      style == NavigationRailLabelType.none,
      style == NavigationRailLabelType.selected,
      style == NavigationRailLabelType.all,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: onChanged == null
          ? null
          : (int index) {
              onChanged?.call(NavigationRailLabelType.values[index]);
            },
      children: const <Widget>[
        Tooltip(
          message: 'Items have\nno labels',
          child: Icon(Icons.menu),
        ),
        Tooltip(
          message: 'Only selected\nitem has a label',
          child: Icon(Icons.rule_outlined),
        ),
        Tooltip(
          message: 'All items\nhave labels',
          child: Icon(Icons.checklist_rtl_outlined),
        ),
      ],
    );
  }
}
