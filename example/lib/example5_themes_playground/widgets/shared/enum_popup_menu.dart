import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../shared/model/adaptive_response.dart';
import '../../../shared/model/splash_type_enum.dart';
import '../../../shared/model/visual_density_enum.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';
import 'color_scheme_box.dart';

/// Widget used to select used an enum value of type [T] using a popup menu.
///
/// Returns null for the default selection, which is the first item in the
/// popup menu. For other selections, it returns the corresponding enum value
/// for the enum of type [T].
///
/// It contains custom icons and label usage for some enum types, but can be
/// used for any enum type. If the enum type is not added, it will use the
/// default label and icon for the enum type. This just indicates that the
/// enum type needs to be added to the widget to get custom icons and labels.
///
/// The [EnumPopupMenu] can use passed in [defaultLabel] and
/// [defaultDisabledLabel] if the built in ones are not suitable when more
/// complex external conditions needs to set it.
///
/// The [subtitleReveal] is used to show an info icon that if presses
/// uses reveal animation with a longer description of the feature and
/// optionally value selected value.
///
/// The [EnumPopupMenu] has a dedicate [enabled] control, so setting callback
/// to null is not needed to disable, it can be more easily controlled with
/// the enabled flag.
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
  /// _popupItemLabel(null, isLight, useMaterial3) as default value.
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
                  ? Text(_popupItemLabel(null, useMaterial3, false),
                      style: txtStyle)
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
    if (T == FlexTabBarStyle) {
      switch (value) {
        case FlexTabBarStyle.forAppBar:
          return useLongLabel
              ? 'Style: forAppbar\n'
                  'Works with themed AppBar background color '
                  '(FCS default for M2 mode)'
              : 'Suitable for AppBar usage';
        case FlexTabBarStyle.forBackground:
          return useLongLabel
              ? 'Style: forBackground\n'
                  'Works on surface colors, like scaffold '
                  'and surface colored AppBar'
              : 'Suitable for surface colors usage';
        case FlexTabBarStyle.flutterDefault:
          return useLongLabel
              ? useMaterial3
                  ? 'Style: flutterDefault\n'
                      'In M3, this style works on surface colors in light '
                      'and dark mode (FCS default for M3)'
                  : 'Style: flutterDefault\n'
                      'In M2, this style works on primary color in '
                      'light mode and surface colors in dark mode'
              : 'Flutter SDK style';
        case FlexTabBarStyle.universal:
          return useLongLabel
              ? 'Style: universal\n'
                  'Experimental style, typically has too low contrast. '
                  'May change in future versions'
              : 'Universal style';
        case null:
          return useLongLabel
              ? useMaterial3
                  ? 'Default uses the "flutterDefault" option in M3 mode'
                  : 'Default uses the "forAppBar" option in M2 mode'
              : useMaterial3
                  ? 'Default (flutterDefault)'
                  : 'Default (forAppBar)';
      }
    }
    if (T == TabBarIndicatorSize) {
      switch (value) {
        case TabBarIndicatorSize.tab:
          return useLongLabel
              ? 'Size: tab\n'
                  'Indicator covers entire tab width'
              : 'Covers entire tab';
        case TabBarIndicatorSize.label:
          return useLongLabel
              ? 'Size: label\n'
                  'Indicator only spans width of the tab label'
              : 'Covers only label';
        case null:
          return useMaterial3 ? 'Default (only label)' : 'Default (entire tab)';
      }
    }
    if (T == FlexSliderIndicatorType) {
      switch (value) {
        case FlexSliderIndicatorType.rectangular:
          return 'Rectangle (rounded)';
        case FlexSliderIndicatorType.drop:
          return 'Drop (inverted)';
        case null:
          {
            if (useMaterial3) {
              return 'Default (drop)';
            } else {
              return 'Default (rectangle)';
            }
          }
      }
    }
    if (T == ShowValueIndicator) {
      switch (value) {
        case ShowValueIndicator.onlyForDiscrete:
          return 'Only for discrete';
        case ShowValueIndicator.onlyForContinuous:
          return 'Only for continuous';
        case ShowValueIndicator.always:
          return 'Show on all types';
        case ShowValueIndicator.never:
          return 'Never show';
        case null:
          return 'Default (Only for discrete)';
      }
    }
    if (T == TabAlignment) {
      switch (value) {
        case TabAlignment.start:
          return 'Aligned to the start\n'
              'Only allowed when TabBar is scrollable';
        case TabAlignment.startOffset:
          return 'Aligned to start with 52dp offset\n'
              'Only allowed when TabBar is scrollable';
        case TabAlignment.fill:
          return 'Stretched to fill the bar\n'
              'Only allowed when TabBar is fixed';
        case TabAlignment.center:
          return 'Aligned to the center of the bar';
        case null:
          return 'Default\n'
              'scrollable  M3 startOffset, M2 start\n'
              'fixed          M3 and M2 fill';
      }
    }
    if (T == FlexFixedColorStyle) {
      switch (value) {
        case FlexFixedColorStyle.computed:
          return useLongLabel
              ? 'Computed by FlexColorScheme (FCS)\n'
                  'No seed generation, less expressive'
              : 'Computed by FCS';
        case FlexFixedColorStyle.seeded:
          return useLongLabel
              ? 'Seeded by FlexSeedScheme (FSS)\n'
                  'Using MCU standard tones'
              : 'Seeded by FSS';
        case FlexFixedColorStyle.seededHighContrast:
          return useLongLabel
              ? 'Seeded by FlexSeedScheme (FSS)\n'
                  'Using FSS high contrast tones'
              : 'Seeded high contrast by FSS';
        case null:
          return useLongLabel
              ? 'Default (computed) by FlexColorScheme (FCS)\n'
                  'No seed generation, less expressive'
              : 'Default (computed)';
      }
    }
    if (T == ListTileStyle) {
      switch (value) {
        case ListTileStyle.list:
          return 'For lists (TextStyle.titleMedium)';
        case ListTileStyle.drawer:
          return 'For drawers (TextStyle.bodyLarge)';
        case null:
          return 'Default (usage based)';
      }
    }
    if (T == ListTileTitleAlignment) {
      switch (value) {
        case ListTileTitleAlignment.threeLine:
          return 'Three line';
        case ListTileTitleAlignment.titleHeight:
          return 'Title height';
        case ListTileTitleAlignment.top:
          return 'Top';
        case ListTileTitleAlignment.center:
          return 'center';
        case ListTileTitleAlignment.bottom:
          return 'Bottom';
        case null:
          if (useMaterial3) {
            return 'Default (Three line)';
          } else {
            return 'Default (Title height)';
          }
      }
    }
    if (T == ListTileControlAffinity) {
      switch (value) {
        case ListTileControlAffinity.leading:
          return 'Control on leading';
        case ListTileControlAffinity.trailing:
          return 'Control on trailing';
        case ListTileControlAffinity.platform:
          return 'Platform standard';
        case null:
          return 'Default (Platform standard)';
      }
    }
    if (T == MaterialTapTargetSize) {
      switch (value) {
        case MaterialTapTargetSize.padded:
          return 'Padded (for Mobile)';
        case MaterialTapTargetSize.shrinkWrap:
          return 'ShrinkWrap (for Desktop)';
        case null:
          return 'Default\nM:padded, D:shrinkWrap';
      }
    }
    if (T == AdaptiveResponse) {
      final AdaptiveResponse? castValue = value as AdaptiveResponse?;
      return castValue?.label ?? 'Default (${AdaptiveResponse.off.label})';
    }
    if (T == SplashTypeEnum) {
      final SplashTypeEnum? castValue = value as SplashTypeEnum?;
      return castValue?.label ??
          'Default (${SplashTypeEnum.defaultSplash.label})';
    }
    if (T == VisualDensityEnum) {
      final VisualDensityEnum? castValue = value as VisualDensityEnum?;
      return castValue?.label ??
          'Default (${VisualDensityEnum.platform.label})';
    }
    // For an unknown enum type, return its name as a default label.
    return value?.name ?? 'Default';
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
          message: 'Width equals label',
          child: Icon(Icons.format_underlined_outlined),
        ),
        Tooltip(
          message: 'Width equals entire tab',
          child: Icon(Icons.border_bottom_outlined),
        ),
      ];
    }
    if (T == FlexSliderIndicatorType) {
      return const <Widget>[
        Tooltip(
          message: 'Default indicator',
          child: Icon(Icons.texture_outlined),
        ),
        Tooltip(
          message: 'Rounded rectangular indicator',
          child: Icon(Icons.assistant),
        ),
        Tooltip(
          message: 'Inverted water drop',
          child: Icon(Icons.pin_drop),
        ),
      ];
    }
    if (T == FlexFixedColorStyle) {
      return const <Widget>[
        Tooltip(
          message: 'Default (computed)',
          child: Icon(Icons.texture_outlined),
        ),
        Tooltip(
          message: 'Computed (FCS)',
          child: Icon(Icons.gradient_outlined),
        ),
        Tooltip(
          message: 'Seeded (FSS)',
          child: Icon(Icons.lens_blur_outlined),
        ),
        Tooltip(
          message: 'Seeded higher contrast (FSS)',
          child: Icon(Icons.contrast_outlined),
        ),
      ];
    }
    //
    if (T == ShowValueIndicator) {
      return const <Widget>[
        Tooltip(
          message: 'Default (discrete)',
          child: Icon(Icons.texture_outlined),
        ),
        Tooltip(
          message: 'Discrete',
          child: Icon(Icons.linear_scale),
        ),
        Tooltip(
          message: 'Continuous',
          child: Icon(Icons.horizontal_rule),
        ),
        Tooltip(
          message: 'All',
          child: Icon(Icons.done_outline),
        ),
        Tooltip(
          message: 'Never',
          child: Icon(Icons.block),
        ),
      ];
    }
    if (T == TabAlignment) {
      return const <Widget>[
        Tooltip(
          message: 'Default',
          child: Icon(Icons.texture_outlined),
        ),
        Tooltip(
          message: 'start',
          child: Icon(Icons.start_outlined),
        ),
        Tooltip(
          message: 'startOffset',
          child: Icon(Icons.space_bar_outlined),
        ),
        Tooltip(
          message: 'fill',
          child: Icon(Icons.view_column_outlined),
        ),
        Tooltip(
          message: 'center',
          child: Icon(Icons.horizontal_distribute_outlined),
        ),
      ];
    }
    if (T == ListTileStyle) {
      return const <Widget>[
        Tooltip(
          message: 'Default (usage based)',
          child: Icon(Icons.texture_outlined),
        ),
        Tooltip(
          message: 'list',
          child: Icon(Icons.format_list_bulleted_outlined),
        ),
        Tooltip(
          message: 'drawer',
          child: Icon(Icons.list_outlined),
        ),
      ];
    }
    if (T == ListTileTitleAlignment) {
      return const <Widget>[
        Tooltip(
          message: 'Default',
          child: Icon(Icons.texture_outlined),
        ),
        Tooltip(
          message: 'threeLine',
          child: Icon(Icons.segment_outlined),
        ),
        Tooltip(
          message: 'titleHeight',
          child: Icon(Icons.align_vertical_top_outlined),
        ),
        Tooltip(
          message: 'top',
          child: Icon(Icons.vertical_align_top_outlined),
        ),
        Tooltip(
          message: 'center',
          child: Icon(Icons.vertical_align_center_outlined),
        ),
        Tooltip(
          message: 'bottom',
          child: Icon(Icons.vertical_align_bottom_outlined),
        ),
      ];
    }
    if (T == ListTileControlAffinity) {
      return const <Widget>[
        Tooltip(
          message: 'Default (Platform standard)',
          child: Icon(Icons.texture_outlined),
        ),
        Tooltip(
          message: 'leading',
          child: Icon(Icons.list_outlined),
        ),
        Tooltip(
          message: 'trailing',
          child: Icon(Icons.toc_outlined),
        ),
        Tooltip(
          message: 'platform',
          child: Icon(Icons.dns_outlined),
        ),
      ];
    }
    if (T == MaterialTapTargetSize) {
      return const <Widget>[
        Tooltip(
          message: 'Default',
          child: Icon(Icons.texture_outlined),
        ),
        Tooltip(
          message: 'padded',
          child: Icon(Icons.settings_overscan_outlined),
        ),
        Tooltip(
          message: 'shrinkWrap',
          child: Icon(Icons.fit_screen_outlined),
        ),
      ];
    }
    if (T == AdaptiveResponse) {
      return <Widget>[
        Tooltip(
          message: 'Default (${AdaptiveResponse.off.label})',
          child: const Icon(Icons.texture_outlined),
        ),
        for (final AdaptiveResponse enumValue in AdaptiveResponse.values)
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
    if (T == VisualDensityEnum) {
      return <Widget>[
        Tooltip(
          message: 'Default (${VisualDensityEnum.platform.label})',
          child: const Icon(Icons.texture_outlined),
        ),
        for (final VisualDensityEnum enumValue in VisualDensityEnum.values)
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
