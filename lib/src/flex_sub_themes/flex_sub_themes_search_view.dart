part of '../flex_sub_themes.dart';

/// An opinionated [SearchViewThemeData] theme for the [SearchBar]'s view.
SearchViewThemeData _searchViewTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// The search view's background fill color.
  ///
  /// If null, the default value is `surfaceContainerHigh`.
  final SchemeColor? backgroundSchemeColor,

  /// The elevation of the search view's [Material].
  ///
  /// If null, the default value is 6.0.
  final double? elevation,

  // TODO(rydmike): Doing just a radius for now. Shapes later
  // The color and weight of the search view's outline.
  //
  // This value is combined with [shape] to create a shape decorated
  // with an outline. This will be ignored if the view is full-screen.
  //
  // If null, the search view doesn't have a side by default.
  // final BorderSide? side,
  //
  // The shape of the search view's underlying [Material].
  //
  // This shape is combined with [side] to create a shape decorated
  // with an outline.
  //
  // If null, then the default value is a rectangle shape for full-screen
  // mode and a [RoundedRectangleBorder] shape with a 28.0 radius otherwise.
  // final OutlinedBorder? shape,

  /// The border radius of the search view's underlying [Material].
  ///
  /// If not defined defaults to 28.0.
  /// If in full screen defaults to 0.
  final double? radius,

  /// The height of the search field on the search view.
  ///
  /// If null, the default value is 56.0.
  final double? headerHeight,

  /// The style to use for the text being edited on the search view.
  ///
  /// If null, defaults to the `bodyLarge` text style from the current
  /// [Theme]. The default text color is [ColorScheme.onSurface].
  final TextStyle? headerTextStyle,

  /// The style to use for the [viewHintText] on the search view.
  ///
  /// If null, defaults to the `bodyLarge` text style from the current
  /// [Theme]. The default text color is [ColorScheme.onSurfaceVariant].
  final TextStyle? headerHintStyle,

  /// The color of the divider on the search view.
  ///
  /// If this property is null, the default value is [ColorScheme.outline].
  final Color? dividerColor,

  /// Optional size constraints for the search view.
  ///
  /// By default, the search view has the same width as the anchor and is 2/3
  /// the height of the screen. If the width and height of the view are within
  /// the [viewConstraints], the view will show its default size. Otherwise,
  /// the size of the view will be constrained by this property.
  ///
  /// If null, the constraints defaults to:
  ///
  /// ```dart
  /// const BoxConstraints(minWidth: 360.0, minHeight: 240.0)
  /// ```
  final BoxConstraints? constraints,
}) {
  // Get selected color, defaults to primary.
  final Color backgroundColor = FlexSubThemes.schemeColor(
    backgroundSchemeColor ?? SchemeColor.surfaceContainerHigh,
    colorScheme,
  );

  return SearchViewThemeData(
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: radius != null
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          )
        : null,
    headerHeight: headerHeight,
    headerTextStyle: headerTextStyle,
    headerHintStyle: headerHintStyle,
    dividerColor: dividerColor,
    constraints: constraints,
  );
}
