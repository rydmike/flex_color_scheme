import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../shared/model/adaptive_theme.dart';
import '../../../shared/model/splash_type_enum.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';
import 'color_scheme_box.dart';

/// Widget used to select used [FlexTabBarStyle] using a popup menu.
///
/// Uses index out out of range of [FlexTabBarStyle] to represent
/// and select no selection of [FlexTabBarStyle] which sets its
/// value to null in parent, so we can use a selectable item as null input,
/// to represent default value via no value definition.
class EnumPopupMenu<T extends Enum> extends StatelessWidget {
  const EnumPopupMenu({
    super.key,
    this.value,
    required this.values,
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
  final T? value;

  /// The list of values in enum of type T.
  ///
  /// You need to pass in T.values of the type T enum used.
  final List<T> values;

  /// Called when a new value is selected.
  ///
  /// The default value selection calls this with null value.
  /// The other with the choice corresponding to the selected enum value.
  final ValueChanged<T?>? onChanged;

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

  /// Get the enum value from its index in the enum values list.
  T enumFromIndex(int index) {
    return values[index];
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelMedium!;

    final String defaultSelectionValuePopupLabel =
        (enabled ? null : defaultDisabledLabel) ??
            defaultLabel ??
            _popupItemLabel(null, useMaterial3);
    final String selectedPopupLabel = enabled && value != null
        ? _popupItemLabel(value, useMaterial3)
        : defaultSelectionValuePopupLabel;

    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.primary);
    final IconThemeData unSelectedTrailingIconTheme = theme.iconTheme
        .copyWith(color: scheme.onSurface.withOpacity(enabled ? 1 : 0.5));

    final List<Widget> iconWidgets = _popupIcons(values);

    return PopupMenuButton<int>(
      popUpAnimationStyle: AnimationStyle.noAnimation,
      position: PopupMenuPosition.under,
      offset: const Offset(0, -4),
      constraints: const BoxConstraints(maxHeight: 560),
      initialValue: !enabled || value == null ? 0 : value!.index + 1,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        onChanged?.call(index == 0 ? null : enumFromIndex(index - 1));
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= values.length; i++)
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
                        child: iconWidgets[i],
                      ),
                    )
                  : IconTheme(
                      data: unSelectedIconTheme,
                      child: ColorSchemeBox(
                        backgroundColor: Colors.transparent,
                        borderColor: scheme.primary,
                        child: iconWidgets[i],
                      ),
                    ),
              title: i == 0
                  // If first position use default label.
                  ? Text(defaultSelectionValuePopupLabel, style: txtStyle)
                  : Text(
                      _popupItemLabel(
                          enumFromIndex(i - 1), useMaterial3, false),
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
            Text(selectedPopupLabel),
          ],
        ),
        subtitleReveal: subtitleReveal,
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: !enabled || value == null
              ? IconTheme(
                  data: unSelectedTrailingIconTheme,
                  child: ColorSchemeBox(
                    foregroundColor: scheme.onSurface,
                    backgroundColor: scheme.surface,
                    borderColor: scheme.outline.withOpacity(enabled ? 1 : 0.5),
                    child: iconWidgets[0],
                  ),
                )
              : IconTheme(
                  data: selectedIconTheme,
                  child: ColorSchemeBox(
                    foregroundColor: scheme.onPrimary,
                    backgroundColor: scheme.primary,
                    borderColor: Colors.transparent,
                    child: iconWidgets[(value?.index ?? 0) + 1],
                  ),
                ),
        ),
      ),
    );
  }

  /// A label explaining the selection made in the popup menu.
  ///
  /// We must add specifics per used enum type here.
  /// Will get usable `name` default if the enum type is not added.
  ///
  /// The useLongLabel flag is used when we want to have a longer custom
  /// description of the selection in the ListTile subtitle. If false
  /// we return a shorter `label`, if the enum defines one, or
  /// just the `name`. Typically the short form is used in the
  /// popup menu items and the long form in the ListTile subtitle.
  String _popupItemLabel(final T? value, final bool useMaterial3,
      [final bool useLongLabel = true]) {
    if (T == FlexTabBarStyle && useLongLabel) {
      switch (value) {
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
    if (T == TabBarIndicatorSize && useLongLabel) {
      switch (value) {
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
    if (T == AdaptiveTheme) {
      final AdaptiveTheme? castValue = value as AdaptiveTheme?;
      return castValue?.label ?? 'Default (${AdaptiveTheme.off.label})';
    }
    if (T == SplashTypeEnum) {
      final SplashTypeEnum? castValue = value as SplashTypeEnum?;
      return castValue?.label ??
          'Default (${SplashTypeEnum.defaultSplash.label})';
    }
    // For an unknown enum type, return its name as a default label.
    return value?.name ?? '';
  }

  // A list of icons to use in the popup menu.
  //
  // Need to add specifics per used enum type here.
  // Will get dump defaults if type not added.
  List<Widget> _popupIcons(List<T> values) {
    if (T == FlexTabBarStyle) {
      return const <Widget>[
        Tooltip(
          message: 'Default',
          child: Icon(Icons.texture_outlined),
        ),
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
      ];
    }
    if (T == TabBarIndicatorSize) {
      return const <Widget>[
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
    }
    if (T == AdaptiveTheme) {
      return <Widget>[
        Tooltip(
          message: 'Default (${AdaptiveTheme.off.label})',
          child: const Icon(Icons.texture_outlined),
        ),
        for (final AdaptiveTheme enumValue in AdaptiveTheme.values)
          Tooltip(
            message: enumValue.label,
            child: Icon(enumValue.icon),
          ),
      ];
    }
    if (T == SplashTypeEnum) {
      return <Widget>[
        Tooltip(
          message: 'Default (${SplashTypeEnum.defaultSplash.label})',
          child: const Icon(Icons.texture_outlined),
        ),
        for (final SplashTypeEnum enumValue in SplashTypeEnum.values)
          Tooltip(
            message: enumValue.label,
            child: Icon(enumValue.icon),
          ),
      ];
    }

    // For an unknown enum type return a default icon list.
    // This is just here so we can see that we have to add the
    // correct icons for the enum type we are using.
    return <Widget>[
      const Tooltip(
        message: 'Default',
        child: Icon(Icons.texture_outlined),
      ),
      for (final T value in values)
        Tooltip(
          message: value.toString(),
          child: const Icon(Icons.texture_outlined),
        ),
    ];
  }
}
