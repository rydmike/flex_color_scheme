import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/color_scheme_box.dart';

/// Widget used to select used FlexSliderIndicatorType using a popup menu.
///
/// Uses index out out of range of [FlexSliderIndicatorType] to represent
/// and select no selection of [FlexSliderIndicatorType] which sets its
/// value to null in parent, so we can use a selectable item as null input,
/// to represent default value via no value definition.
class SliderIndicatorPopupMenu extends StatelessWidget {
  const SliderIndicatorPopupMenu({
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

  String _explainIndicatorStyle(
    final FlexSliderIndicatorType? style,
    final bool useMaterial3,
  ) {
    switch (style) {
      case FlexSliderIndicatorType.rectangular:
        return 'Rounded rectangular indicator';
      case FlexSliderIndicatorType.drop:
        return 'Inverted water drop';
      case null:
        {
          if (useMaterial3) {
            return 'Default M3 (Inverted water drop)';
          }
          return 'Default M2 (Rounded rectangular indicator)';
        }
    }
  }

  static const List<Widget> _indicatorWidgets = <Widget>[
    Tooltip(
      message: 'Rounded rectangular indicator',
      child: Icon(Icons.assistant),
    ),
    Tooltip(
      message: 'Inverted water drop',
      child: Icon(Icons.pin_drop),
    ),
    Tooltip(
      message: 'Default indicator',
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
        index < 0 || index >= FlexSliderIndicatorType.values.length;
    final String styleName = !useDefault
        ? _explainIndicatorStyle(FlexSliderIndicatorType.values[index], useM3)
        : _explainIndicatorStyle(null, useM3);
    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.primary);

    return PopupMenuButton<int>(
      initialValue: useDefault ? FlexSliderIndicatorType.values.length : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached max length or any negative
        // value will cause controller for a FlexAppBarStyle to be set to
        // "null", we need to be able to do that to input "null" property
        // value to FlexAppBarStyle configs.
        onChanged
            ?.call(index >= FlexSliderIndicatorType.values.length ? -1 : index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= FlexSliderIndicatorType.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: index == i ||
                      (index < 0 && i == FlexSliderIndicatorType.values.length)
                  ? IconTheme(
                      data: selectedIconTheme,
                      child: ColorSchemeBox(
                        backgroundColor: scheme.primary,
                        borderColor: Colors.transparent,
                        child: _indicatorWidgets[i],
                      ),
                    )
                  : IconTheme(
                      data: unSelectedIconTheme,
                      child: ColorSchemeBox(
                        backgroundColor: Colors.transparent,
                        borderColor: scheme.primary,
                        child: _indicatorWidgets[i],
                      ),
                    ),
              title: i >= FlexSliderIndicatorType.values.length
                  // If we reached max length make default label.
                  ? Text(popupLabelDefault ?? labelForDefault, style: txtStyle)
                  : Text(FlexSliderIndicatorType.values[i].name,
                      style: txtStyle),
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
              child: _indicatorWidgets[
                  useDefault ? FlexSliderIndicatorType.values.length : index],
            ),
          ),
        ),
      ),
    );
  }
}
