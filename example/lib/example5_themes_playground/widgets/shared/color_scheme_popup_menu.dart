import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'color_scheme_box.dart';

// TODO(rydmike): Refactor to be more like EnumPopupMenu.

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
    this.colorPrefix = '',
    this.contentPadding,
    this.labelForDefault = 'default (primary)',
    // this.popupLabelDefault,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final String colorPrefix;
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.
  final String labelForDefault;
  // final String? popupLabelDefault;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;
    final bool useDefault = index < 0 || index >= SchemeColor.values.length;
    final String colorName = enabled && !useDefault
        ? SchemeColor.values[index].name
        : labelForDefault;

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
        initialValue: useDefault ? 0 : index + 1,
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
                  selected: i == index + 1 || (index < 0 && i == 0),
                  borderColor: i == index + 1 || (index < 0 && i == 0)
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.outline,
                  defaultOption: i <= 0,
                ),
                title: i <= 0
                    ? Text(labelForDefault, style: txtStyle)
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
                      FlexSubThemes.onSchemeColor(SchemeColor.values[index]),
                      colorScheme)
                  : colorScheme.onSurface.withOpacity(enabled ? 1 : 0.5),
              backgroundColor: enabled && !useDefault
                  ? FlexSubThemes.schemeColor(
                      SchemeColor.values[index], colorScheme)
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

// OLD Experimental new version of the ColorSchemePopupMenu.
// 24.8.2024
//
// This is MenuAnchor based so it can open from tap point.
// It reopens in new position if tapped again.
// For now only used as a test on Buttons panel on ElevatedButton color.
// Not actively used, it was a test to see if it would be a better solution.
// TODO(rydmike): Remove ColorSchemePopupMenuAnchor if not used later.
//
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
