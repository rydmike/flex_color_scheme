import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Widget used to select a ColorScheme based colors in example 5.
///
/// Uses index out out of range of [SchemeColor] to represent and select
/// no selection of [SchemeColor] which sets its value to null in parent,
/// so we can use a selectable item as null input, to represent default value
/// via no value definition. A bit ugly/pragmatic approach.
class ColorSchemePopupMenu extends StatelessWidget {
  const ColorSchemePopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.labelForDefault = 'default (primary)',
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.
  final String labelForDefault;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;
    // Negative value, or index covering the the last two in th enum,
    // the deprecated primaryVariant and secondaryVariant are considered as
    // null and default value.
    final bool useDefault = index < 0 || index >= SchemeColor.values.length - 2;
    final String colorName = enabled && !useDefault
        ? SchemeColor.values[index].name
        : labelForDefault;

    return PopupMenuButton<int>(
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached first deprecated color.
        // -1, or any negative value will cause controller for a
        // SchemeColor to be set to "null", we need to be able to do that
        // to input "null" property value to SchemeColor configs.
        onChanged?.call(index >= SchemeColor.values.length - 2 ? -1 : index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        // Exclude the last two enums, deprecated primaryVariant and
        // secondaryVariant.
        for (int i = 0; i < SchemeColor.values.length - 1; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              leading: ColorSchemeBox(
                color: i >= SchemeColor.values.length - 2
                    ? colorScheme.surface
                    : FlexSubThemes.schemeColor(
                        SchemeColor.values[i],
                        colorScheme,
                      ),
                defaultColor: i >= SchemeColor.values.length - 2,
              ),
              title: i >= SchemeColor.values.length - 2
                  // If we reached first deprecated color, make default label.
                  ? Text(labelForDefault, style: txtStyle)
                  : Text(SchemeColor.values[i].name, style: txtStyle),
            ),
          )
      ],
      child: ListTile(
        enabled: enabled,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        title: title,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (subtitle != null) subtitle!,
            Text('ColorScheme color $colorName'),
          ],
        ),
        trailing: ColorSchemeBox(
          color: enabled && !useDefault
              ? FlexSubThemes.schemeColor(
                  SchemeColor.values[index],
                  colorScheme,
                )
              : colorScheme.surface,
          defaultColor: useDefault,
        ),
      ),
    );
  }
}

class ColorSchemeBox extends StatelessWidget {
  const ColorSchemeBox({
    super.key,
    this.color = Colors.white,
    this.size = const Size(45, 35),
    this.defaultColor = false,
  });

  final Color color;
  final Size size;
  final bool defaultColor;

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      FlexSchemeOnColors.estimateErrorBrightness(color) == Brightness.light;

  // On color used when a theme color property does not have a theme onColor.
  static Color _onColor(final Color color) => _isLight(color)
      ? Colors.black.withOpacity(0.4)
      : Colors.white.withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Material(
        color: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
        child: defaultColor
            ? Icon(Icons.texture_outlined, color: _onColor(color))
            : Icon(Icons.palette_outlined, color: _onColor(color)),
      ),
    );
  }
}
