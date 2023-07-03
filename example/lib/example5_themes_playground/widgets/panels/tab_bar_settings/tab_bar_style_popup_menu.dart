import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/color_scheme_box.dart';

/// Widget used to select used [FlexTabBarStyle] using a popup menu.
///
/// Uses index out out of range of [FlexTabBarStyle] to represent
/// and select no selection of [FlexTabBarStyle] which sets its
/// value to null in parent, so we can use a selectable item as null input,
/// to represent default value via no value definition.
class TabBarStylePopupMenu extends StatelessWidget {
  const TabBarStylePopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.labelForDefault = 'default (null)',
    this.popupLabelDefault,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.
  final String labelForDefault;
  final String? popupLabelDefault;

  String _explainTabStyle(
    final FlexTabBarStyle? style,
    final bool useMaterial3,
  ) {
    switch (style) {
      case FlexTabBarStyle.forAppBar:
        return 'Style: forAppbar\n'
            'Works with themed AppBar background color. '
            'FCS M2 default.';
      case FlexTabBarStyle.forBackground:
        return 'Style: forBackground\n'
            'Works on surface colors, like scaffold '
            'and surface colored AppBar.';
      case FlexTabBarStyle.flutterDefault:
        return 'Style: flutterDefault\n'
            'In M2, works on primary color in '
            'light mode and background color in dark mode. In M3 it '
            'works on surface colors. FCS M3 default.';
      case FlexTabBarStyle.universal:
        return 'Style: universal\n'
            'Experimental style, has low contrast. '
            'May change in future versions.';
      case null:
        return useMaterial3
            ? 'Default (flutterDefault)'
            : 'Default (forAppBar)';
    }
  }

  static const List<Widget> _tabBarWidget = <Widget>[
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
    Tooltip(
      message: 'Default',
      child: Icon(Icons.texture_outlined),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useM3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;
    // Negative value, or index over range are used as null and default value.
    final bool useDefault =
        index < 0 || index >= FlexTabBarStyle.values.length || !enabled;
    final String styleName = !useDefault
        ? _explainTabStyle(FlexTabBarStyle.values[index], useM3)
        : _explainTabStyle(null, useM3);
    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.primary);

    return PopupMenuButton<int>(
      initialValue: useDefault ? FlexTabBarStyle.values.length : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached max length or any negative
        // value will cause controller for a FlexAppBarStyle to be set to
        // "null", we need to be able to do that to input "null" property
        // value to FlexAppBarStyle configs.
        onChanged?.call(index >= FlexTabBarStyle.values.length ? -1 : index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= FlexTabBarStyle.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: index == i ||
                      (index < 0 && i == FlexTabBarStyle.values.length)
                  ? IconTheme(
                      data: selectedIconTheme,
                      child: ColorSchemeBox(
                        backgroundColor: scheme.primary,
                        borderColor: Colors.transparent,
                        child: _tabBarWidget[i],
                      ),
                    )
                  : IconTheme(
                      data: unSelectedIconTheme,
                      child: ColorSchemeBox(
                        backgroundColor: Colors.transparent,
                        borderColor: scheme.primary,
                        child: _tabBarWidget[i],
                      ),
                    ),
              title: i >= FlexTabBarStyle.values.length
                  // If we reached max length make default label.
                  ? Text(popupLabelDefault ?? labelForDefault, style: txtStyle)
                  : Text(FlexTabBarStyle.values[i].name, style: txtStyle),
            ),
          )
      ],
      child: ListTile(
        enabled: enabled,
        contentPadding: contentPadding,
        title: title,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (subtitle != null) subtitle!,
            Text(styleName),
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: IconTheme(
            data: selectedIconTheme,
            child: ColorSchemeBox(
              backgroundColor: scheme.primary,
              borderColor: Colors.transparent,
              child: _tabBarWidget[
                  useDefault ? FlexTabBarStyle.values.length : index],
            ),
          ),
        ),
      ),
    );
  }
}
