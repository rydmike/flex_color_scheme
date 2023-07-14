import 'package:flutter/material.dart';

import '../../../shared/model/adaptive_theme.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';
import 'color_scheme_box.dart';

/// Widget used to select used AdaptiveTheme using a popup menu.
///
/// Uses index out out of range of [AdaptiveTheme] to represent
/// and select no selection of [AdaptiveTheme] which sets its
/// value to null in parent, so we can use a selectable item as null input,
/// to represent default value via no value definition.
class AdaptiveThemePopupMenu extends StatelessWidget {
  const AdaptiveThemePopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;
    // Negative value, or index over range are used as null and default value.
    final bool useDefault =
        index < 0 || index >= AdaptiveTheme.values.length || !enabled;

    final String tileLabel = !useDefault
        ? AdaptiveTheme.values[index].label
        : 'Undefined (${AdaptiveTheme.off.label})';

    final String styleDescribe = !useDefault
        ? AdaptiveTheme.values[index].describe
        : AdaptiveTheme.off.describe;

    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.primary);

    return PopupMenuButton<int>(
      initialValue: useDefault ? AdaptiveTheme.values.length : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached max length or any negative
        // value will cause controller for a AdaptiveTheme to be set to
        // "null", we need to be able to do that to input "null" property
        // value to AdaptiveTheme configs.
        onChanged?.call(index >= AdaptiveTheme.values.length ? -1 : index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= AdaptiveTheme.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading:
                  index == i || (index < 0 && i == AdaptiveTheme.values.length)
                      ? IconTheme(
                          data: selectedIconTheme,
                          child: ColorSchemeBox(
                            backgroundColor: scheme.primary,
                            borderColor: Colors.transparent,
                            child: _TooltipIcon(index: i),
                          ),
                        )
                      : IconTheme(
                          data: unSelectedIconTheme,
                          child: ColorSchemeBox(
                            backgroundColor: Colors.transparent,
                            borderColor: scheme.primary,
                            child: _TooltipIcon(index: i),
                          ),
                        ),
              title: i >= AdaptiveTheme.values.length
                  // If we reached max length make default label.
                  ? Text(
                      'Undefined (${AdaptiveTheme.off.label})',
                      style: txtStyle,
                    )
                  : Text(AdaptiveTheme.values[i].label, style: txtStyle),
            ),
          )
      ],
      child: ListTileReveal(
        enabled: enabled,
        contentPadding: contentPadding,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (title != null) title!,
            Text(tileLabel),
          ],
        ),
        subtitleDense: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (subtitle != null) subtitle!,
            Text(styleDescribe),
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: IconTheme(
            data: selectedIconTheme,
            child: ColorSchemeBox(
              backgroundColor: scheme.primary,
              borderColor: Colors.transparent,
              child: _TooltipIcon(
                  index: useDefault ? AdaptiveTheme.values.length : index),
            ),
          ),
        ),
      ),
    );
  }
}

class _TooltipIcon extends StatelessWidget {
  const _TooltipIcon({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final String message = index < 0 || index >= AdaptiveTheme.values.length
        ? 'Undefined (${AdaptiveTheme.off.label})'
        : AdaptiveTheme.values[index].label;

    final IconData icon = index < 0 || index >= AdaptiveTheme.values.length
        ? Icons.texture_outlined
        : AdaptiveTheme.values[index].icon;

    return Tooltip(
      message: message,
      child: Icon(icon),
    );
  }
}
