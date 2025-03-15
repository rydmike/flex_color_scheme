import 'package:flutter/material.dart';

/// Widget using [ToggleButtons) that can be used to toggle a boolean value
/// between false, null (undetermined) and true.
/// It has suitable icons as choices.
class NullableBoolToggleButtons extends StatelessWidget {
  const NullableBoolToggleButtons({
    super.key,
    this.value,
    this.onChanged,
  });
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      value == false,
      value == null,
      // ignore: use_if_null_to_convert_nulls_to_bools
      value == true,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: onChanged == null
          ? null
          : (int index) {
              if (index == 0) {
                onChanged?.call(false);
              } else if (index == 1) {
                onChanged?.call(null);
              } else {
                onChanged?.call(true);
              }
            },
      children: const <Widget>[
        Tooltip(
          message: 'False',
          child: Icon(Icons.radio_button_unchecked_outlined),
        ),
        Tooltip(
          message: 'Undefined (null)',
          child: Icon(Icons.texture_outlined),
        ),
        Tooltip(
          message: 'True',
          child: Icon(Icons.circle),
        ),
      ],
    );
  }
}
