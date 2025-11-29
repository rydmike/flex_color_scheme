part of '../flex_sub_themes.dart';

/// An opinionated [DropdownMenuThemeData] theme.
DropdownMenuThemeData _dropdownMenuTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// The [TextStyle] of the text entry in a [DropDownMenu].
  ///
  /// If not defined, defaults to Flutter SDK default via widget default
  /// [TextTheme.labelLarge].
  final TextStyle? textStyle,

  /// An [InputDecorationThemeData] for the text input part of
  /// the [DropDownMenu].
  ///
  /// Typically you want it to match the input decorator on your TextField.
  final InputDecorationThemeData? inputDecorationTheme,

  /// Overrides the default value for DropdownMenuThemeData
  /// [menuStyle.surfaceTintColor].
  final Color? surfaceTintColor,

  // TODO(rydmike): Remove maximumSize fallback when fixed in Flutter SDK.
  /// The maximum size of the dropdown menu itself.
  ///
  /// A [Size.infinite] or null value for this property means that the menu's
  /// maximum size is not constrained.
  ///
  /// This value must be greater than or equal to `minimumSize`.
  ///
  /// If not defined, this property temporarily defaults to
  /// `WidgetStatePropertyAll<Size>(Size.infinite)`. This default fallback is
  /// added to avoid a breaking style bug in Flutter SDK 3.32.0 and later,
  /// at least up to 3.35.1 and maybe later versions too.
  /// It is a temporary fix for this issue
  /// https://github.com/flutter/flutter/issues/170970 and it will be
  /// removed in a future release when
  /// this PR fix https://github.com/flutter/flutter/pull/169438
  /// has landed in the stable Flutter release. It has landed in master, but
  /// not yet in Flutter 3.35.1.
  final WidgetStateProperty<Size?>? maximumSize,
}) {
  return DropdownMenuThemeData(
    inputDecorationTheme: inputDecorationTheme,
    textStyle: textStyle,
    menuStyle: MenuStyle(
      surfaceTintColor: surfaceTintColor == null
          ? null
          : WidgetStatePropertyAll<Color>(surfaceTintColor),
      maximumSize:
          maximumSize ?? const WidgetStatePropertyAll<Size>(Size.infinite),
    ),
  );
}
