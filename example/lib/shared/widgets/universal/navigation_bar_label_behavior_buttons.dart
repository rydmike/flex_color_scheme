import 'package:flutter/material.dart';

/// Widget using [ToggleButtons) that can be used to toggle the label style
/// of a [NavigationBar].
///
/// This is a simple Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class NavigationBarLabelBehaviorButtons extends StatelessWidget {
  const NavigationBarLabelBehaviorButtons({
    super.key,
    this.labelBehavior,
    this.onChanged,
  });
  final NavigationDestinationLabelBehavior? labelBehavior;
  final ValueChanged<NavigationDestinationLabelBehavior>? onChanged;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      labelBehavior == NavigationDestinationLabelBehavior.alwaysHide,
      labelBehavior == NavigationDestinationLabelBehavior.onlyShowSelected,
      labelBehavior == NavigationDestinationLabelBehavior.alwaysShow,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: onChanged == null
          ? null
          : (int index) {
              if (index == 0) {
                onChanged?.call(NavigationDestinationLabelBehavior.alwaysHide);
              } else if (index == 1) {
                onChanged
                    ?.call(NavigationDestinationLabelBehavior.onlyShowSelected);
              } else {
                onChanged?.call(NavigationDestinationLabelBehavior.alwaysShow);
              }
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
