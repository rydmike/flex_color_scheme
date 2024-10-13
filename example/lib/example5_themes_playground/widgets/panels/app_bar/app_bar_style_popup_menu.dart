import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/color_scheme_box.dart';

/// Widget used to select used AppBarStyle using a popup menu.
///
/// Uses index out out of range of [FlexAppBarStyle] to represent and select
/// no selection of [FlexAppBarStyle] which sets its value to null in parent,
/// so we can use a selectable item as null input, to represent default value
/// via no value definition. A bit ugly/pragmatic approach.
///
/// This class is on purpose not using the EnumPopupMenu, since
/// it has quite different logic and style than most of them.
class AppBarStylePopupMenu extends StatelessWidget {
  const AppBarStylePopupMenu({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.defaultLabel,
    this.defaultDisabledLabel,
    this.customAppBarColor,
    this.isBlended = false,
  });

  /// The currently selected value for this popup.
  ///
  /// A null value represents the default value selection.
  final FlexAppBarStyle? value;

  /// Called when a new value is selected.
  ///
  /// The default value selection calls this with null value.
  /// The other with the choice corresponding to the selected enum value.
  final ValueChanged<FlexAppBarStyle?>? onChanged;

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

  /// The [ListTile]'s internal padding.
  ///
  /// Insets a [ListTile]'s contents.
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

  /// The color usd when the custom style is selected.
  final Color? customAppBarColor;

  /// Flag to say if the selected indicate if color blended is on or not.
  final bool isBlended;

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
        return colorScheme.surfaceContainerLow;
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

  String _popupItemLabel(
    final FlexAppBarStyle? style,
    final bool isLight,
    final bool useMaterial3,
  ) {
    switch (style) {
      case FlexAppBarStyle.primary:
        return 'Primary\n(M2 light default)';
      case FlexAppBarStyle.material:
        return isLight
            ? 'Material white\n(M2 light spec)'
            : 'Material #121212\n(M2 dark spec)';
      case FlexAppBarStyle.surface:
        return 'Surface${isBlended ? '\nwith blend (M3 spec)' : ''}';
      case FlexAppBarStyle.background:
        return 'SurfaceContainerLow${isBlended ? '\nwith blend' : ''}';
      case FlexAppBarStyle.scaffoldBackground:
        return 'ScaffoldBackground${isBlended ? '\nwith blend' : ''}';
      case FlexAppBarStyle.custom:
        return 'Custom';
      case null:
        {
          if (useMaterial3) {
            return 'Default (surface)${isBlended ? '\n'
                'with blend ' : '\n'}(M3 spec)';
          } else {
            if (isLight) {
              return 'Default primary\n(M2 spec)';
            } else {
              return 'Default #121212\n(M2 spec)';
            }
          }
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelMedium!;

    final String defaultSelectionValuePopupLabel =
        (enabled ? null : defaultDisabledLabel) ??
            defaultLabel ??
            _popupItemLabel(null, isLight, useMaterial3);

    final String selectedPopupLabel = enabled && value != null
        ? _popupItemLabel(value, isLight, useMaterial3)
        : defaultSelectionValuePopupLabel;

    return PopupMenuButton<int>(
      popUpAnimationStyle: AnimationStyle.noAnimation,
      position: PopupMenuPosition.under,
      offset: const Offset(0, -4),
      constraints: const BoxConstraints(maxHeight: 560),
      initialValue: !enabled || value == null ? 0 : value!.index + 1,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        onChanged?.call(index == 0 ? null : FlexAppBarStyle.values[index - 1]);
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
                borderColor: (value?.index ?? -1) + 1 == i
                    ? theme.colorScheme.onSurface
                    : theme.dividerColor,
                selected: (value?.index ?? -1) + 1 == i,
                backgroundColor: i == 0
                    ? _appBarStyleColor(
                        null,
                        colorScheme,
                        theme.scaffoldBackgroundColor,
                        isLight,
                        useMaterial3,
                      )
                    : _appBarStyleColor(
                        FlexAppBarStyle.values[i - 1],
                        colorScheme,
                        theme.scaffoldBackgroundColor,
                        isLight,
                        useMaterial3,
                      ),
                defaultOption: i == 0,
              ),
              title: i == 0
                  // If first position use default label.
                  ? Text(defaultSelectionValuePopupLabel, style: txtStyle)
                  : Text(
                      _popupItemLabel(
                          FlexAppBarStyle.values[i - 1], isLight, useMaterial3),
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
            Text(selectedPopupLabel),
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: ColorSchemeBox(
            borderColor: !enabled || value == null
                ? colorScheme.outline.withOpacity(enabled ? 1 : 0.5)
                : colorScheme.outline,
            backgroundColor: !enabled || value == null
                ? _appBarStyleColor(
                    null,
                    colorScheme,
                    theme.scaffoldBackgroundColor,
                    isLight,
                    useMaterial3,
                  )
                : _appBarStyleColor(
                    value,
                    colorScheme,
                    theme.scaffoldBackgroundColor,
                    isLight,
                    useMaterial3,
                  ),
            defaultOption: !enabled || value == null,
          ),
        ),
      ),
    );
  }
}
