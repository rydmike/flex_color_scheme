import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Widget used to change the used app bar style mode in example 5.
class TabBarStyleButtons extends StatelessWidget {
  const TabBarStyleButtons({
    Key? key,
    required this.style,
    required this.onChanged,
  }) : super(key: key);
  final FlexTabBarStyle style;
  final ValueChanged<FlexTabBarStyle> onChanged;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      style == FlexTabBarStyle.forAppBar,
      style == FlexTabBarStyle.forBackground,
      style == FlexTabBarStyle.flutterDefault,
      style == FlexTabBarStyle.universal,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        onChanged(FlexTabBarStyle.values[newIndex]);
      },
      children: const <Widget>[
        Tooltip(
          message: 'To use in AppBar',
          child: Icon(Icons.tab),
        ),
        Tooltip(
          message: 'To use on background color',
          child: Icon(Icons.tab_unselected),
        ),
        Tooltip(
          message: 'Flutter SDK default',
          child: Icon(Icons.web_asset_outlined),
        ),
        Tooltip(
          message: 'Universal style',
          child: Icon(Icons.crop_3_2),
        ),
      ],
    );
  }
}
