import 'package:flutter/material.dart';

/// Widget using [ToggleButtons) that can be used to toggle the fake
/// is web setting for testing adaptive theme features.
class IsWebToggleButtons extends StatelessWidget {
  const IsWebToggleButtons({
    super.key,
    this.isWeb,
    this.onChanged,
  });
  final bool? isWeb;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      isWeb ?? false,
      isWeb == null,
      isWeb == false,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: onChanged == null
          ? null
          : (int index) {
              if (index == 0) {
                onChanged?.call(true);
              } else if (index == 1) {
                onChanged?.call(null);
              } else {
                onChanged?.call(false);
              }
            },
      children: const <Widget>[
        SizedBox(
          width: 65,
          child: Center(child: Text('Web', style: TextStyle(fontSize: 11))),
        ),
        SizedBox(
          width: 65,
          child: Center(child: Text('Actual', style: TextStyle(fontSize: 11))),
        ),
        SizedBox(
          width: 65,
          child: Center(child: Text('Not Web', style: TextStyle(fontSize: 11))),
        ),
      ],
    );
  }
}
