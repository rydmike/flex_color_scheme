part of '../flex_sub_themes.dart';

/// An opinionated [TextSelectionThemeData] theme.
///
/// Requires a [ColorScheme], the color scheme would
/// typically be equal the color scheme also used to define the color scheme
/// for your app theme.
TextSelectionThemeData _textSelectionTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// The [SchemeColor] based color of the cursor in the text field.
  ///
  /// The cursor indicates the current location of text insertion point in
  /// the field.
  ///
  /// If not defined, [colorScheme.primary] is used.
  final SchemeColor? cursorSchemeColor,

  /// The [SchemeColor] based background color of selected text.
  ///
  /// If not defined, [colorScheme.primary] is used.
  final SchemeColor? selectionSchemeColor,

  /// The opacity applied to [selectionSchemeColor].
  ///
  /// If not defined, default to [kTextSelectionOpacity] = 0.4 (40%).
  /// Same as Flutter SDK default.
  final double? selectionOpacity,

  /// The [SchemeColor] based color of the selection handles on the
  /// text field.
  ///
  /// Selection handles are used to indicate the bounds of the selected text,
  /// or as a handle to drag the cursor to a new location in the text.
  ///
  /// If not defined, [colorScheme.primary] is used.
  final SchemeColor? selectionHandleSchemeColor,

  /// A custom override color that
  /// [TextSelectionThemeData.selectionHandleColor] will use if it is defined.
  ///
  /// If not defined, the result from [selectionHandleSchemeColor] is used.
  final Color? selectionHandleCustomColor,
}) {
  // Get used cursorColor, defaults to primary.
  final Color cursorColor = FlexSubThemes.schemeColor(
    cursorSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Get used selectionColor, defaults to primary.
  // Get around the opacity optimized out assert by using alpha.
  final Color selectionColor = FlexSubThemes.schemeColor(
    selectionSchemeColor ?? SchemeColor.primary,
    colorScheme,
  ).withValues(alpha: selectionOpacity ?? kTextSelectionOpacity);

  // Get used selectionHandleColor, defaults to primary.
  final Color selectionHandleColor = selectionHandleCustomColor ??
      FlexSubThemes.schemeColor(
        selectionHandleSchemeColor ?? SchemeColor.primary,
        colorScheme,
      );

  return TextSelectionThemeData(
    cursorColor: cursorColor,
    selectionColor: selectionColor,
    selectionHandleColor: selectionHandleColor,
  );
}
