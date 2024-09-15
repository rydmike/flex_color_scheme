import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/list_tile_reveal.dart';
import 'color_scheme_box.dart';

// TODO(rydmike): Refactor to be more like EnumPopupMenu.

/// Widget used to select ColorScheme based colors via a SchemeColor enum.
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
class ColorSchemePopupMenuNew extends StatelessWidget {
  const ColorSchemePopupMenuNew({
    super.key,
    this.value,
    this.onChanged,
    this.enabled = true,
    this.title,
    this.subtitle,
    this.subtitleReveal,
    this.colorPrefix = '',
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
  /// If provided, this text label is added to selected color value displayed
  /// in the  subtitle of the selected item ListTile label.
  final String colorPrefix;

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
  /// Default to true.
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
          // TODO(rydmike): Remove debugPrints when done testing.
          debugPrint('ColorSchemePopupMenuNew index: $index');
          debugPrint('ColorSchemePopupMenuNew enabled: $enabled');
          onChanged?.call(
              index == 0 || !enabled ? null : SchemeColor.values[index - 1]);
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
              Text('$colorPrefix$selectedLabel'),
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

/// Widget used to select a ColorScheme based colors in example 5.
///
/// Uses index out out of range of [SchemeColor] to represent and select
/// no selection of [SchemeColor] which sets its value to null in parent,
/// so we can use a selectable item as null input, to represent default value
/// via no value definition. A bit ugly/pragmatic approach.
class ColorSchemePopupMenu extends StatelessWidget {
  const ColorSchemePopupMenu({
    super.key,
    required this.value,
    this.onChanged,
    this.title,
    this.subtitle,
    this.colorPrefix = '',
    this.contentPadding,
    this.defaultLabel = 'default (primary)',
  });
  final int value;
  final ValueChanged<int>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final String colorPrefix;
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.
  final String defaultLabel;
  // final String? popupLabelDefault;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;
    final bool useDefault = value < 0 || value >= SchemeColor.values.length;
    final String colorName =
        enabled && !useDefault ? SchemeColor.values[value].name : defaultLabel;

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
        initialValue: useDefault ? 0 : value + 1,
        tooltip: '',
        padding: EdgeInsets.zero,
        onSelected: (int index) {
          onChanged?.call(index <= 0 ? -1 : index - 1);
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
                  selected: i == value + 1 || (value < 0 && i == 0),
                  borderColor: i == value + 1 || (value < 0 && i == 0)
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.outline,
                  defaultOption: i <= 0,
                ),
                title: i <= 0
                    ? Text(defaultLabel, style: txtStyle)
                    : Text(SchemeColor.values[i - 1].name, style: txtStyle),
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
              Text('$colorPrefix$colorName'),
              if (subtitle != null) subtitle!,
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5.0),
            child: ColorSchemeBox(
              foregroundColor: enabled && !useDefault
                  ? FlexSubThemes.schemeColor(
                      FlexSubThemes.onSchemeColor(SchemeColor.values[value]),
                      colorScheme)
                  : colorScheme.onSurface.withOpacity(enabled ? 1 : 0.5),
              backgroundColor: enabled && !useDefault
                  ? FlexSubThemes.schemeColor(
                      SchemeColor.values[value], colorScheme)
                  : colorScheme.surface,
              borderColor: colorScheme.outline.withOpacity(enabled ? 1 : 0.5),
              defaultOption: useDefault,
            ),
          ),
        ),
      ),
    );
  }
}

// TODO(rydmike): Remove ColorSchemePopupMenuAnchor if not used later.
// Experiment with a new version of the ColorSchemePopupMenu 24.8.2024
//
// This is MenuAnchor based so it can open from tap point.
// It reopens in new position if tapped again.
// For now only used as a test. Not actively used, it was a test to see if it
// would be a better solution.
//
// If used later, this should be refactored to use same API as above new
// ColorSchemePopupMenu that was refactored to its improved API Sep 8, 2024.

/// Widget used to select a ColorScheme based colors in example 5.
///
/// Uses index out out of range of [SchemeColor] to represent and select
/// no selection of [SchemeColor] which sets its value to null in parent,
/// so we can use a selectable item as null input, to represent default value
/// via no value definition. A bit ugly/pragmatic approach.
class ColorSchemePopupMenuAnchor extends StatefulWidget {
  const ColorSchemePopupMenuAnchor({
    super.key,
    required this.index,
    this.onChanged,
    this.title,
    this.subtitle,
    this.colorPrefix = '',
    this.contentPadding,
    this.labelForDefault = 'default (primary)',
    this.popupLabelDefault,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final String colorPrefix;
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.
  final String labelForDefault;
  final String? popupLabelDefault;

  @override
  State<ColorSchemePopupMenuAnchor> createState() =>
      _ColorSchemePopupMenuAnchorState();
}

class _ColorSchemePopupMenuAnchorState
    extends State<ColorSchemePopupMenuAnchor> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  final FocusNode _itemFocusNode = FocusNode(debugLabel: 'Menu Button');
  final MenuController _menuController = MenuController();
  late List<GlobalKey> buttonItemKeys;

  @override
  void initState() {
    super.initState();
    buttonItemKeys = List<GlobalKey>.generate(
        SchemeColor.values.length + 1, (int index) => GlobalKey());
    scrollToHighlight();
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    _itemFocusNode.dispose();
    super.dispose();
  }

  void scrollToHighlight() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final BuildContext? highlightContext =
          buttonItemKeys[widget.index].currentContext;
      if (highlightContext != null) {
        unawaited(Scrollable.ensureVisible(highlightContext));
      }
    }, debugLabel: 'DropdownMenu.scrollToHighlight');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelMedium!;
    final bool enabled = widget.onChanged != null;
    final bool useDefault =
        widget.index < 0 || widget.index >= SchemeColor.values.length;
    final String colorName = enabled && !useDefault
        ? SchemeColor.values[widget.index].name
        : widget.labelForDefault;

    return InkWell(
      focusNode: _buttonFocusNode,
      onTapDown: enabled
          ? (TapDownDetails details) {
              _menuController.open(position: details.localPosition);
            }
          : null,
      onTap: enabled ? _menuController.open : null,
      child: MenuAnchor(
        controller: _menuController,
        childFocusNode: _buttonFocusNode,
        clipBehavior: Clip.antiAlias,
        consumeOutsideTap: true,
        crossAxisUnconstrained: false,
        onOpen: _buttonFocusNode.unfocus,
        onClose: _buttonFocusNode.unfocus,
        menuChildren: <Widget>[
          for (int i = 0; i <= SchemeColor.values.length; i++)
            MenuItemButton(
              key: buttonItemKeys[i],
              requestFocusOnHover: false,
              onPressed: () {
                widget.onChanged?.call(i >= SchemeColor.values.length ? -1 : i);
              },
              leadingIcon: ColorSchemeBox(
                foregroundColor: i >= SchemeColor.values.length
                    ? colorScheme.onSurface
                    : FlexSubThemes.schemeColor(
                        FlexSubThemes.onSchemeColor(SchemeColor.values[i]),
                        colorScheme),
                backgroundColor: i >= SchemeColor.values.length
                    ? colorScheme.surface
                    : FlexSubThemes.schemeColor(
                        SchemeColor.values[i],
                        colorScheme,
                      ),
                selected: i == widget.index ||
                    (widget.index < 0 && i == SchemeColor.values.length),
                borderColor: i == widget.index ||
                        (widget.index < 0 && i == SchemeColor.values.length)
                    ? theme.colorScheme.onSurface
                    : theme.dividerColor,
                defaultOption: i >= SchemeColor.values.length,
              ),
              child: i >= SchemeColor.values.length
                  // If we are over enum length, make default label.
                  ? Text(widget.popupLabelDefault ?? widget.labelForDefault,
                      style: txtStyle)
                  : Text(SchemeColor.values[i].name, style: txtStyle),
            ),
        ],
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return ListTile(
            enabled: enabled,
            contentPadding: widget.contentPadding,
            title: widget.title,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Color ${widget.colorPrefix}$colorName'),
                if (widget.subtitle != null) widget.subtitle!,
              ],
            ),
            trailing: Padding(
              padding: const EdgeInsetsDirectional.only(end: 5.0),
              child: ColorSchemeBox(
                foregroundColor: enabled && !useDefault
                    ? FlexSubThemes.schemeColor(
                        FlexSubThemes.onSchemeColor(
                            SchemeColor.values[widget.index]),
                        colorScheme)
                    : colorScheme.onSurface,
                backgroundColor: enabled && !useDefault
                    ? FlexSubThemes.schemeColor(
                        SchemeColor.values[widget.index], colorScheme)
                    : colorScheme.surface,
                borderColor: theme.dividerColor,
                defaultOption: useDefault,
              ),
            ),
          );
        },
      ),
    );
  }
}
