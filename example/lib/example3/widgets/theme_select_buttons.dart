import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Widget used to change the used FlexScheme in example 3.
class ThemeSelectButtons extends StatelessWidget {
  const ThemeSelectButtons({
    super.key,
    required this.scheme,
    required this.onChanged,
  });
  final FlexScheme scheme;
  final ValueChanged<FlexScheme> onChanged;

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontSize: 14);
    final List<bool> isSelected = <bool>[
      scheme == FlexScheme.hippieBlue,
      scheme == FlexScheme.mallardGreen,
      scheme == FlexScheme.outerSpace,
      scheme == FlexScheme.custom,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          onChanged(FlexScheme.hippieBlue);
        } else if (newIndex == 1) {
          onChanged(FlexScheme.mallardGreen);
        } else if (newIndex == 2) {
          onChanged(FlexScheme.outerSpace);
        } else {
          onChanged(FlexScheme.custom);
        }
      },
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            'Hippie\nblue',
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            'Mallard\ngreen',
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            'Outer\nspace',
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            'Custom\nblue',
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
      ],
    );
  }
}
