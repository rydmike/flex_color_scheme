part of '../flex_sub_themes.dart';

/// An opinionated [DialogThemeData] with custom corner radius and elevation.
///
/// Corner [radius] defaults to [kDialogRadius] = 28 and [elevation] to
/// [kDialogElevation] = 10.
///
/// The default radius follows Material M3 guide
/// [specification](https://m3.material.io/components/dialogs/specs).
DialogThemeData _dialogTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  final ColorScheme? colorScheme,

  /// Dialog background color.
  ///
  /// If null and [backgroundSchemeColor] is also null, then it
  /// gets default via Dialog's default null theme behavior.
  ///
  /// If [backgroundSchemeColor] is defined, it will override any color
  /// passed in here.
  ///
  /// Can be used to make a custom themed dialog with own background color,
  /// even after the [ThemeData.dialogBackgroundColor] property is
  /// is deprecated in Flutter SDK. See
  /// https://github.com/flutter/flutter/issues/91772)
  final SchemeColor? backgroundSchemeColor,

  /// Dialog background color.
  ///
  /// If null and [backgroundSchemeColor] is also null, then it
  /// gets default via Dialog's default null theme behavior.
  ///
  /// If [backgroundSchemeColor] is defined, it will override any color
  /// passed in here.
  ///
  /// Can be used to make a custom themed dialog with own background color,
  /// even after the [ThemeData.dialogBackgroundColor] property is
  /// is deprecated in Flutter SDK. See
  /// https://github.com/flutter/flutter/issues/91772)
  final Color? backgroundColor,

  /// Dialog elevation.
  ///
  /// If not defined, defaults to [kDialogElevation] = 6.
  final double? elevation,

  /// Dialog shadow color.
  final Color? shadowColor,

  /// Dialog surface tint color.
  final Color? surfaceTintColor,

  /// Corner radius of the [Dialog] dialog.
  ///
  /// If not defined, defaults to [kDialogRadius] = 28.
  final double? radius,

  /// The padding of the actions in the dialog.
  final EdgeInsetsGeometry? actionsPadding,

  /// The text style of the title.
  final TextStyle? titleTextStyle,

  /// The text style of the content.
  final TextStyle? contentTextStyle,
}) {
  final Color? background = colorScheme == null || backgroundSchemeColor == null
      ? backgroundColor // might be null, then SDK theme defaults.
      : FlexSubThemes.schemeColor(backgroundSchemeColor, colorScheme);

  return DialogThemeData(
    elevation: elevation ?? kDialogElevation,
    backgroundColor: background,
    actionsPadding: actionsPadding ??
        const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? kDialogRadius),
      ),
    ),
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    titleTextStyle: titleTextStyle,
    contentTextStyle: contentTextStyle,
  );
}
