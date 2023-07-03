import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/color_scheme_box.dart';

/// Widget used to select used AppBarStyle using a popup menu.
///
/// Uses index out out of range of [FlexAppBarStyle] to represent and select
/// no selection of [FlexAppBarStyle] which sets its value to null in parent,
/// so we can use a selectable item as null input, to represent default value
/// via no value definition. A bit ugly/pragmatic approach.
class AppBarStylePopupMenu extends StatelessWidget {
  const AppBarStylePopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.labelForDefault = 'default (null)',
    this.popupLabelDefault,
    this.customAppBarColor,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.
  final String labelForDefault;
  final String? popupLabelDefault;
  final Color? customAppBarColor;

  Color _appBarStyleColor(
    final FlexAppBarStyle? style,
    final ColorScheme colorScheme,
    final Color scaffold,
    final bool isLight,
    final bool useMaterial3,
  ) {
    switch (style) {
      case FlexAppBarStyle.primary:
        return colorScheme.primary;
      case FlexAppBarStyle.material:
        return isLight
            ? FlexColor.materialLightSurface
            : FlexColor.materialDarkSurface;
      case FlexAppBarStyle.surface:
        return colorScheme.surface;
      case FlexAppBarStyle.background:
        return colorScheme.background;
      case FlexAppBarStyle.scaffoldBackground:
        return scaffold;
      case FlexAppBarStyle.custom:
        return customAppBarColor ?? colorScheme.tertiaryContainer;
      case null:
        {
          if (useMaterial3) {
            return colorScheme.surface;
          } else {
            if (isLight) {
              return FlexColor.materialLightSurface;
            } else {
              return FlexColor.materialDarkSurface;
            }
          }
        }
    }
  }

  String _explainAppBarStyle(
    final FlexAppBarStyle? style,
    final bool isLight,
    final bool useMaterial3,
  ) {
    switch (style) {
      case FlexAppBarStyle.primary:
        return isLight ? 'Primary color (M2 default)' : 'Primary color';
      case FlexAppBarStyle.material:
        return isLight
            ? 'White (M2 light surface)'
            : 'Dark (M2 default surface #121212)';
      case FlexAppBarStyle.surface:
        return 'Surface color, with primary color blend';
      case FlexAppBarStyle.background:
        return 'Background color, with primary color blend';
      case FlexAppBarStyle.scaffoldBackground:
        return 'Scaffold color, with primary color blend';
      case FlexAppBarStyle.custom:
        return 'Custom. Built-in schemes use tertiary color, '
            'but you can use any color with the API';
      case null:
        {
          if (useMaterial3) {
            return 'Surface color (M3 default)';
          } else {
            if (isLight) {
              return 'Primary color (M2 default)';
            } else {
              return 'Dark (M2 default surface #121212)';
            }
          }
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useM3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;
    // Negative value, or index over range are used as null and default value.
    final bool useDefault = index < 0 || index >= FlexAppBarStyle.values.length;
    final String styleName = !useDefault
        ? _explainAppBarStyle(FlexAppBarStyle.values[index], isLight, useM3)
        : _explainAppBarStyle(null, isLight, useM3);

    return PopupMenuButton<int>(
      initialValue: useDefault ? FlexAppBarStyle.values.length : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached max length or any negative
        // value will cause controller for a FlexAppBarStyle to be set to
        // "null", we need to be able to do that to input "null" property
        // value to FlexAppBarStyle configs.
        onChanged?.call(index >= FlexAppBarStyle.values.length ? -1 : index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= FlexAppBarStyle.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: ColorSchemeBox(
                borderColor: i == index ||
                        (index < 0 && i == FlexAppBarStyle.values.length)
                    ? theme.colorScheme.onSurface
                    : theme.dividerColor,
                selected: i == index ||
                    (index < 0 && i == FlexAppBarStyle.values.length),
                backgroundColor: i >= FlexAppBarStyle.values.length
                    ? _appBarStyleColor(
                        null,
                        colorScheme,
                        theme.scaffoldBackgroundColor,
                        isLight,
                        useM3,
                      )
                    : _appBarStyleColor(
                        FlexAppBarStyle.values[i],
                        colorScheme,
                        theme.scaffoldBackgroundColor,
                        isLight,
                        useM3,
                      ),
                defaultOption: i >= FlexAppBarStyle.values.length,
              ),
              title: i >= FlexAppBarStyle.values.length
                  // If we reached max length make default label.
                  ? Text(popupLabelDefault ?? labelForDefault, style: txtStyle)
                  : Text(FlexAppBarStyle.values[i].name, style: txtStyle),
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
          child: ColorSchemeBox(
            borderColor: theme.dividerColor,
            backgroundColor: enabled && !useDefault
                ? _appBarStyleColor(
                    FlexAppBarStyle.values[index],
                    colorScheme,
                    theme.scaffoldBackgroundColor,
                    isLight,
                    useM3,
                  )
                : _appBarStyleColor(
                    null,
                    colorScheme,
                    theme.scaffoldBackgroundColor,
                    isLight,
                    useM3,
                  ),
            defaultOption: useDefault,
          ),
        ),
      ),
    );
  }
}
