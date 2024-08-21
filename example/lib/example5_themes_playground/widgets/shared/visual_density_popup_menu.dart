import 'package:flutter/material.dart';

import '../../../shared/model/visual_density_enum.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';
import 'color_scheme_box.dart';

/// Widget used to select used VisualDensity using a popup menu.
///
/// Uses index out out of range of [VisualDensityEnum] to represent
/// and select no selection of [VisualDensityEnum] which sets its
/// value to null in parent, so we can use a selectable item as null input,
/// to represent default value via no value definition.
class VisualDensityPopupMenu extends StatelessWidget {
  const VisualDensityPopupMenu({
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
    final TextStyle txtStyle = theme.textTheme.labelMedium!;
    final bool enabled = onChanged != null;
    // Negative value, or index over range are used as null and default value.
    final bool useDefault =
        index < 0 || index >= VisualDensityEnum.values.length || !enabled;

    final String tileLabel = !useDefault
        ? VisualDensityEnum.values[index].label
        : 'Undefined (${VisualDensityEnum.platform.label})';

    final String styleDescribe = !useDefault
        ? VisualDensityEnum.values[index].describe
        : VisualDensityEnum.platform.describe;

    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.primary);

    return PopupMenuButton<int>(
      popUpAnimationStyle: AnimationStyle.noAnimation,
      position: PopupMenuPosition.under,
      offset: const Offset(0, -4),
      constraints: const BoxConstraints(
        // minWidth: 500,
        // maxWidth: 500,
        maxHeight: 540,
      ),
      initialValue: useDefault ? VisualDensityEnum.values.length : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached max length or any negative
        // value will cause controller for a VisualDensityEnum to be set to
        // "null", we need to be able to do that to input "null" property
        // value to VisualDensityEnum configs.
        onChanged?.call(index >= VisualDensityEnum.values.length ? -1 : index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= VisualDensityEnum.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: index == i ||
                      (index < 0 && i == VisualDensityEnum.values.length)
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
              title: i >= VisualDensityEnum.values.length
                  // If we reached max length make default label.
                  ? Text(
                      'Undefined (${VisualDensityEnum.platform.label})',
                      style: txtStyle,
                    )
                  : Text(VisualDensityEnum.values[i].label, style: txtStyle),
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
                  index: useDefault ? VisualDensityEnum.values.length : index),
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
    final String message = index < 0 || index >= VisualDensityEnum.values.length
        ? 'Undefined (${VisualDensityEnum.platform.label})'
        : VisualDensityEnum.values[index].label;

    final IconData icon = index < 0 || index >= VisualDensityEnum.values.length
        ? Icons.texture_outlined
        : VisualDensityEnum.values[index].icon;

    return Tooltip(
      message: message,
      child: Icon(icon),
    );
  }
}
