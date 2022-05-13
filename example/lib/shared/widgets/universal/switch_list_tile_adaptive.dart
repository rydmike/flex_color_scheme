import 'package:flutter/material.dart';

// ignore_for_file: comment_references

/// A theme following wrapper for [SwitchListTileAdaptive].
///
/// The wrapper sets the active thumb color for the switch to
/// SwitchTheme.active color, and if not define to theme.colorscheme.secondary.
///
/// NOTE: toggleableActiveColor will be deprecated soon in Flutter SDK,
/// so we are using its replacement fallback already now. See:
/// https://docs.flutter.dev/release/breaking-changes/toggleable-active-color
///
/// The theme sets this color too, and that is fine for the Material mode.
/// However, if we want the color to also have an effect on the switch
/// when it is in its Cupertino mode, we actually have to set the [activeColor]
/// the the same color for the switch thumb. The Cupertino thumb switch button
/// cannot be changed via Material dependent theme. It cannot even be changed
/// with a Cupertino theme in a Cupertino app. It is so by design, since Apple
/// wants it to always be bright green when it is on.
///
/// In this app we want it to follow the selected theme color for consistency,
/// so we wrap the widget in a simple wrapper that sets the color to its
/// themed color, then it works and we get the themed color also in its
/// adaptive Cupertino mode.
///
/// This wrapper only wraps most common properties that we needed for the
/// SwitchListTileAdaptive in this application. Easy to add more when needed.
class SwitchListTileAdaptive extends StatelessWidget {
  const SwitchListTileAdaptive({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.title,
    this.subtitle,
    this.secondary,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
  });

  /// Whether this switch is checked.
  ///
  /// This property must not be null.
  final bool value;

  /// Called when the user toggles the switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch tile with the
  /// new value.
  ///
  /// If null, the switch will be displayed as disabled.
  final ValueChanged<bool>? onChanged;

  /// The color to use when this switch is on.
  ///
  /// Defaults to selected thumb color of SwitchTheme, and if not defined to
  /// [Colorscheme.secondary] color of the current [Theme].
  ///
  /// The Material mode of this switch does this by default, but the iOS remain
  /// iOS active green despite the theme, unless explicitly set via the
  /// active color. We make custom version to make it behave as we want it to.
  ///
  /// NOTE: It is not really an SDK themed widget, but our custom wrapped
  /// version now follow effective theme in the desired way.
  final Color? activeColor;

  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display on the opposite side of the tile from the switch.
  ///
  /// Typically an [Icon] widget.
  final Widget? secondary;

  /// Whether this list tile is intended to display three lines of text.
  ///
  /// If false, the list tile is treated as having one line if the subtitle is
  /// null and treated as having two lines if the subtitle is non-null.
  final bool isThreeLine;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null then its value is based
  /// on [ListTileThemeData.dense].
  final bool? dense;

  /// The tile's internal padding.
  ///
  /// Insets a [SwitchListTile]'s contents: its [title], [subtitle],
  /// [secondary], and [Switch] widgets.
  ///
  /// If null, [ListTile]'s default of `EdgeInsets.symmetric(horizontal: 16.0)`
  /// is used.
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      activeColor: activeColor ??
          Theme.of(context)
              .switchTheme
              .thumbColor
              ?.resolve(<MaterialState>{MaterialState.selected}) ??
          Theme.of(context).colorScheme.secondary,
      value: value,
      onChanged: onChanged,
      title: title,
      subtitle: subtitle,
      secondary: secondary,
      isThreeLine: isThreeLine,
      dense: dense,
      contentPadding: contentPadding,
    );
  }
}
