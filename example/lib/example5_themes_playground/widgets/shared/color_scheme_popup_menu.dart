import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/list_tile_reveal.dart';
import 'color_scheme_box.dart';

/// Widget used to select ColorScheme based colors via a [SchemeColor] enum.
///
/// Uses null [value] of [SchemeColor] to represent and select
/// no selection of [SchemeColor] which represents default color behavior
/// for the widget using the selected color.
///
/// The user can pass in different labels to use as default label value, when
/// the widget is:
///
/// * enabled: [defaultLabel] if not provided defaults to 'unknown'.
/// * enabled darkMode: [defaultLabelDark], if not provided uses [defaultLabel].
/// * enabled in M2 mode: [defaultLabelM2], if not provided uses [defaultLabel].
/// * enabled in M2 darkMode, if not provided uses [defaultLabelDark].
/// * disabled: [defaultDisabledLabel], if not provided uses [defaultLabel].
/// * disabled darkMode: [defaultDisabledLabelDark], if not provided
///   uses [defaultDisabledLabel].
/// * disabled in M2 mode: [defaultDisabledLabelM2], if not provided uses
///   [defaultDisabledLabel].
/// * disabled in M2 darkMode, if not provided uses [defaultDisabledLabelDark].
class ColorSchemePopupMenu extends StatelessWidget {
  const ColorSchemePopupMenu({
    super.key,
    this.value,
    this.onChanged,
    this.enabled = true,
    this.title,
    this.subtitle,
    this.subtitleReveal,
    this.colorPrefix = '',
    this.colorSuffix = '',
    this.contentPadding,
    this.dense,
    this.revealDense,
    this.defaultLabel,
    this.defaultLabelDark,
    this.defaultLabelM2,
    this.defaultLabelDarkM2,
    this.defaultDisabledLabel,
    this.defaultDisabledLabelDark,
    this.defaultDisabledLabelM2,
    this.defaultDisabledLabelDarkM2,
    this.wrapWithDefaultLabel = true,
  });

  /// The currently selected SchemeColor value for this popup.
  ///
  /// A null value represents the default value selection.
  final SchemeColor? value;

  /// Called when a new SchemeColor is selected.
  ///
  /// The default value selection calls this with null value.
  /// The other with the choice corresponding to the selected enum value.
  final ValueChanged<SchemeColor?>? onChanged;

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

  /// A prefix to the color name displayed in the subtitle of the selected item.
  ///
  /// If provided, this text label is added before the selected color value
  /// displayed in the  subtitle of the selected item ListTile label.
  final String colorPrefix;

  /// A suffix to the color name displayed in the subtitle of the selected item.
  ///
  /// If provided, this text label is added after the selected color value
  /// displayed in the  subtitle of the selected item ListTile label.
  final String colorSuffix;

  /// The [ListTileReveal]'s internal padding.
  ///
  /// Insets a [ListTileReveal]'s contents.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used in M2
  /// and `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` in M3.
  final EdgeInsetsGeometry? contentPadding;

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

  /// The label to display when [value] is null representing the
  /// default color value.
  ///
  /// If not defined, defaults to 'unknown'.
  final String? defaultLabel;

  /// The label to display when [value] is null in dark mode, representing the
  /// default color value.
  ///
  /// If not defined defaults to [defaultLabel].
  final String? defaultLabelDark;

  /// The label to display when [value] is null in M2 mode, representing the
  /// default color value.
  ///
  /// If not defined defaults to [defaultLabel].
  final String? defaultLabelM2;

  /// The label to display when [value] is null in M2 dark mode, representing
  /// the default color value.
  ///
  /// If not defined defaults to [defaultLabelM2], if not defined then to
  /// [defaultLabelDark], that if it is not defined defaults to [defaultLabel].
  ///
  /// M2 mode prioritize M2 defaults over dark dark defaults.
  final String? defaultLabelDarkM2;

  /// The label to display when [value] is null when the control is disabled,
  /// representing the default color value then.
  ///
  /// If not defined defaults to [defaultLabel].
  final String? defaultDisabledLabel;

  /// The label to display when [value] is null when the control is disabled
  /// in dark mode, representing the default color value then.
  ///
  /// If not defined defaults to [defaultDisabledLabel].
  final String? defaultDisabledLabelDark;

  /// The label to display when [value] is null when the control is disabled,
  /// in M2 mode, representing the default color value then.
  ///
  /// If not defined defaults to [defaultDisabledLabel].
  final String? defaultDisabledLabelM2;

  /// The label to display when [value] is null when the control is disabled
  /// in M2 mode,
  /// representing the default color value then.
  ///
  /// If not defined defaults to [defaultDisabledLabelM2], if not defined then
  /// to [defaultDisabledLabelDark], that if it is not defined defaults to
  /// [defaultDisabledLabel], which default to [defaultLabel].
  ///
  /// M2 mode prioritize M2 defaults over dark dark defaults.
  final String? defaultDisabledLabelDarkM2;

  /// When set to true, wraps the resolved default label with the
  /// text 'default ($resolvedLabel)'.
  ///
  /// If false there is no such wrapping, the default label is used as is.
  ///
  /// Defaults to true.
  final bool wrapWithDefaultLabel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isLight = theme.brightness == Brightness.light;
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;

    final String usedLabel = defaultLabel ?? 'unknown';
    final String usedLabelM2 = defaultLabelM2 ?? usedLabel;
    final String usedLabelDark = defaultLabelDark ?? usedLabel;
    final String usedLabelDarkM2 =
        defaultLabelDarkM2 ?? defaultLabelM2 ?? defaultLabelDark ?? usedLabel;

    final String resolvedEnabledLabel = useMaterial3
        ? isLight
            ? usedLabel
            : usedLabelDark
        : isLight
            ? usedLabelM2
            : usedLabelDarkM2;

    final String disabledLabel = defaultDisabledLabel ?? usedLabel;
    final String disabledLabelDark = defaultDisabledLabelDark ??
        defaultDisabledLabel ??
        defaultLabelDark ??
        usedLabel;
    final String disabledLabelM2 = defaultDisabledLabelM2 ??
        defaultDisabledLabel ??
        defaultLabelM2 ??
        usedLabel;
    final String disabledLabelDarkM2 = defaultDisabledLabelDarkM2 ??
        defaultDisabledLabelM2 ??
        defaultDisabledLabelDark ??
        defaultDisabledLabel ??
        defaultLabelDark ??
        defaultLabelM2 ??
        usedLabel;

    final String resolvedDisabledLabel = useMaterial3
        ? isLight
            ? disabledLabel
            : disabledLabelDark
        : isLight
            ? disabledLabelM2
            : disabledLabelDarkM2;

    final String resolvedLabel =
        enabled ? resolvedEnabledLabel : resolvedDisabledLabel;

    final String effectiveDefaultLabel =
        wrapWithDefaultLabel ? 'default ($resolvedLabel)' : resolvedLabel;

    final String selectedLabel =
        enabled && value != null ? value?.name ?? '' : effectiveDefaultLabel;

    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: Theme.of(context).scrollbarTheme.copyWith(
              thumbVisibility: WidgetStateProperty.all<bool>(true),
            ),
      ),
      child: PopupMenuButton<int>(
        popUpAnimationStyle: AnimationStyle.noAnimation,
        position: PopupMenuPosition.under,
        offset: const Offset(0, -4),
        constraints: const BoxConstraints(
          minWidth: 300,
          maxWidth: 300,
          maxHeight: 600,
        ),
        initialValue: !enabled || value == null ? 0 : value!.index + 1,
        tooltip: '',
        padding: EdgeInsets.zero,
        onSelected: (int index) {
          onChanged?.call(index == 0 ? null : SchemeColor.values[index - 1]);
        },
        enabled: enabled,
        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
          for (int i = 0; i <= SchemeColor.values.length; i++)
            PopupMenuItem<int>(
              value: i,
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: ColorSchemeBox(
                  foregroundColor: i <= 0
                      ? colorScheme.onSurface
                      : FlexSubThemes.schemeColor(
                          FlexSubThemes.onSchemeColor(
                              SchemeColor.values[i - 1]),
                          colorScheme),
                  backgroundColor: i <= 0
                      ? colorScheme.surface
                      : FlexSubThemes.schemeColor(
                          SchemeColor.values[i - 1],
                          colorScheme,
                        ),
                  selected: (value?.index ?? -1) + 1 == i,
                  borderColor: (value?.index ?? -1) + 1 == i
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.outline,
                  defaultOption: i <= 0,
                ),
                title: i <= 0
                    ? Text(effectiveDefaultLabel, style: txtStyle)
                    : Text(SchemeColor.values[i - 1].name, style: txtStyle),
              ),
            )
        ],
        child: ListTileReveal(
          enabled: enabled,
          dense: dense,
          revealDense: revealDense,
          contentPadding: contentPadding,
          title: title,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('$colorPrefix$selectedLabel$colorSuffix'),
              if (subtitle != null) subtitle!,
            ],
          ),
          subtitleReveal: subtitleReveal,
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5.0),
            child: ColorSchemeBox(
              foregroundColor: enabled && value != null
                  ? FlexSubThemes.schemeColor(
                      FlexSubThemes.onSchemeColor(value ?? SchemeColor.primary),
                      colorScheme)
                  : colorScheme.onSurface.withOpacity(enabled ? 1 : 0.5),
              backgroundColor: enabled && value != null
                  ? FlexSubThemes.schemeColor(
                      value ?? SchemeColor.primary, colorScheme)
                  : colorScheme.surface,
              borderColor: colorScheme.outline.withOpacity(enabled ? 1 : 0.5),
              defaultOption: value == null,
            ),
          ),
        ),
      ),
    );
  }
}
