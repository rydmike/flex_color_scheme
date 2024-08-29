import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../shared/color_scheme_box.dart';

/// Widget used to select used [TabBarIndicatorSize] using a popup menu.
class TabBarIndicatorSizePopupMenu extends StatelessWidget {
  const TabBarIndicatorSizePopupMenu({
    super.key,
    this.value,
    this.onChanged,
    this.enabled = true,
    this.title,
    this.subtitle,
    this.subtitleReveal,
    this.contentPadding,
    this.defaultLabel,
    this.defaultDisabledLabel,
    this.dense,
    this.revealDense,
  });

  /// The currently selected value for this popup.
  ///
  /// A null value represents the default value selection.
  final TabBarIndicatorSize? value;

  /// Called when a new value is selected.
  ///
  /// The default value selection calls this with null value.
  /// The other with the choice corresponding to the selected enum value.
  final ValueChanged<TabBarIndicatorSize?>? onChanged;

  /// Whether this PopupMenu is enabled.
  ///
  /// Set to false to disable the popup, it will be displayed as disabled
  /// along with the title and value trailing labels.
  final bool enabled;

  /// The main heading content of the Slider tile.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// Additional content displayed below the subtitle in a reveal animation.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitleReveal;

  /// The [ListTileReveal]'s internal padding.
  ///
  /// Insets a [ListTileReveal]'s contents.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used in M2
  /// and `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` in M3.
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.

  /// If not defined will use response from
  /// _explainSelection(null, useMaterial3) as default value.
  final String? defaultLabel;

  /// Override for default selection display label when the control is
  /// disabled.
  ///
  /// If not defined will use defaultLabel.
  final String? defaultDisabledLabel;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null then its value is based on [ListTileTheme.dense].
  ///
  /// Dense list tiles default to a smaller height.
  final bool? dense;

  /// Whether the used reveal part of the ListTile is dense.
  ///
  /// If not defined, defaults to true.
  final bool? revealDense;

  String _explainSelection(
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
      message: 'Default',
      child: Icon(Icons.texture_outlined),
    ),
    Tooltip(
      message: 'Width equals entire tab',
      child: Icon(Icons.border_bottom_outlined),
    ),
    Tooltip(
      message: 'Width equals label',
      child: Icon(Icons.format_underlined_outlined),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelMedium!;

    final String defaultSelectionLabel =
        (enabled ? null : defaultDisabledLabel) ??
            defaultLabel ??
            _explainSelection(null, useMaterial3);
    final String selectionLabel = enabled && value != null
        ? _explainSelection(value, useMaterial3)
        : defaultSelectionLabel;

    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.primary);

    return PopupMenuButton<int>(
      popUpAnimationStyle: AnimationStyle.noAnimation,
      position: PopupMenuPosition.under,
      offset: const Offset(0, -4),
      constraints: const BoxConstraints(maxHeight: 560),
      initialValue: !enabled || value == null ? 0 : value!.index + 1,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        onChanged
            ?.call(index == 0 ? null : TabBarIndicatorSize.values[index - 1]);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= TabBarIndicatorSize.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: (value?.index ?? -1) + 1 == i
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
              title: i == 0
                  // If first position use default label.
                  ? Text(defaultSelectionLabel, style: txtStyle)
                  : Text(TabBarIndicatorSize.values[i - 1].name,
                      style: txtStyle),
            ),
          )
      ],
      child: ListTileReveal(
        dense: dense,
        revealDense: revealDense,
        enabled: enabled,
        contentPadding: contentPadding,
        title: title,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (subtitle != null) subtitle!,
            Text(selectionLabel),
          ],
        ),
        subtitleReveal: subtitleReveal,
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 10.0),
          child: IconTheme(
            data: selectedIconTheme,
            child: ColorSchemeBox(
              backgroundColor: scheme.primary,
              borderColor: Colors.transparent,
              child: _tabBarWidget[
                  !enabled || value == null ? 0 : (value?.index ?? 0) + 1],
            ),
          ),
        ),
      ),
    );
  }
}
