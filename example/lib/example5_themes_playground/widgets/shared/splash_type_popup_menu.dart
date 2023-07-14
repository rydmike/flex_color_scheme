import 'package:flutter/material.dart';

import '../../../shared/model/splash_type_enum.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';
import 'color_scheme_box.dart';

/// Widget used to select used splash type using a popup menu.
///
/// Uses index out out of range of [SplashTypeEnum] to represent
/// and select no selection of [SplashTypeEnum] which sets its
/// value to null in parent, so we can use a selectable item as null input,
/// to represent default value via no value definition.
class SplashTypePopupMenu extends StatelessWidget {
  const SplashTypePopupMenu({
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
        index < 0 || index >= SplashTypeEnum.values.length || !enabled;

    final String tileLabel = !useDefault
        ? SplashTypeEnum.values[index].label
        : 'Undefined (${SplashTypeEnum.defaultSplash.label})';

    final String styleDescribe = !useDefault
        ? SplashTypeEnum.values[index].describe
        : SplashTypeEnum.defaultSplash.describe;

    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.primary);

    return PopupMenuButton<int>(
      initialValue: useDefault ? SplashTypeEnum.values.length : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached max length or any negative
        // value will cause controller for a SplashTypeEnum to be set to
        // "null", we need to be able to do that to input "null" property
        // value to SplashTypeEnum configs.
        onChanged?.call(index >= SplashTypeEnum.values.length ? -1 : index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= SplashTypeEnum.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading:
                  index == i || (index < 0 && i == SplashTypeEnum.values.length)
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
              title: i >= SplashTypeEnum.values.length
                  // If we reached max length make default label.
                  ? Text(
                      'Undefined (${SplashTypeEnum.defaultSplash.label})',
                      style: txtStyle,
                    )
                  : Text(SplashTypeEnum.values[i].label, style: txtStyle),
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
                  index: useDefault ? SplashTypeEnum.values.length : index),
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
    final String message = index < 0 || index >= SplashTypeEnum.values.length
        ? 'Undefined (${SplashTypeEnum.defaultSplash.label})'
        : SplashTypeEnum.values[index].label;

    final IconData icon = index < 0 || index >= SplashTypeEnum.values.length
        ? Icons.texture_outlined
        : SplashTypeEnum.values[index].icon;

    return Tooltip(
      message: message,
      child: Icon(icon),
    );
  }
}
