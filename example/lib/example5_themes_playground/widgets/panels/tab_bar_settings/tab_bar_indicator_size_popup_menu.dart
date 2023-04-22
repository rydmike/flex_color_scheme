import 'package:flutter/material.dart';

import '../../shared/color_scheme_box.dart';

/// Widget used to select used [TabBarIndicatorSize] using a popup menu.
///
/// Uses index out out of range of [TabBarIndicatorSize] to represent
/// and select no selection of [TabBarIndicatorSize] which sets its
/// value to null in parent, so we can use a selectable item as null input,
/// to represent default value via no value definition.
class TabBarIndicatorSizePopupMenu extends StatelessWidget {
  const TabBarIndicatorSizePopupMenu({
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

  String _explainTabSize(
    final TabBarIndicatorSize? style,
    final bool useMaterial3,
  ) {
    switch (style) {
      case TabBarIndicatorSize.tab:
        return 'Size: tab\n'
            'Indicator covers entire tab width';
      case TabBarIndicatorSize.label:
        return 'Size: label\n'
            'Indicator only spans width of the tab label';
      case null:
        return useMaterial3 ? 'Default (label)' : 'Default (tab)';
    }
  }

  static const List<Widget> _tabBarWidget = <Widget>[
    Tooltip(
      message: 'Width equals entire tab',
      child: Icon(Icons.border_bottom_outlined),
    ),
    Tooltip(
      message: 'Width equals label',
      child: Icon(Icons.format_underlined_outlined),
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
        index < 0 || index >= TabBarIndicatorSize.values.length || !enabled;
    final String styleName = !useDefault
        ? _explainTabSize(TabBarIndicatorSize.values[index], useM3)
        : _explainTabSize(null, useM3);
    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.primary);

    return PopupMenuButton<int>(
      initialValue: useDefault ? TabBarIndicatorSize.values.length : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached max length or any negative
        // value will cause controller for a FlexAppBarStyle to be set to
        // "null", we need to be able to do that to input "null" property
        // value to FlexAppBarStyle configs.
        onChanged
            ?.call(index >= TabBarIndicatorSize.values.length ? -1 : index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= TabBarIndicatorSize.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: index == i ||
                      (index < 0 && i == TabBarIndicatorSize.values.length)
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
              title: i >= TabBarIndicatorSize.values.length
                  // If we reached max length make default label.
                  ? Text(popupLabelDefault ?? labelForDefault, style: txtStyle)
                  : Text(TabBarIndicatorSize.values[i].name, style: txtStyle),
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
          padding: const EdgeInsetsDirectional.only(end: 10.0),
          child: IconTheme(
            data: selectedIconTheme,
            child: ColorSchemeBox(
              backgroundColor: scheme.primary,
              borderColor: Colors.transparent,
              child: _tabBarWidget[
                  useDefault ? TabBarIndicatorSize.values.length : index],
            ),
          ),
        ),
      ),
    );
  }
}
