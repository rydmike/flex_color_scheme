part of '../flex_sub_themes.dart';

/// A theme helper for [BottomSheetThemeData] for customizing the theme
/// for [BottomSheet].
///
/// Corner [radius] defaults to [kBottomSheetBorderRadius] = 28,
/// [elevation] to [kBottomSheetElevation] = 4 and [modalElevation] to
/// [kBottomSheetModalElevation] = 8.
BottomSheetThemeData _bottomSheetTheme({
  /// Default value for [BottomSheet.backgroundColor].
  ///
  /// If null, defaults to Flutter's default, which is theme canvas color in
  /// M2 mode and surfaceContainerLow in M3 mode.
  final Color? backgroundColor,

  /// Value for [BottomSheet.backgroundColor] when the Bottom sheet is
  /// presented as a modal bottom sheet.
  ///
  /// If null, defaults to Flutter's default, which is theme canvas color in
  /// M2 mode and surfaceContainerLow in M3 mode.
  final Color? modalBackgroundColor,

  /// The none modal bottom sheet elevation.
  ///
  /// If null, defaults to [kBottomSheetElevation] = 1.
  final double? elevation,

  /// The modal bottom sheet elevation.
  ///
  /// If null, defaults to [kBottomSheetModalElevation] = 2.
  final double? modalElevation,

  /// The corner radius of the top corners.
  ///
  /// If not defined, defaults to [kBottomSheetBorderRadius] 28p.
  ///
  /// Follows Material M3 guide as default value.
  /// https://m3.material.io/components/bottom-sheets/specs
  final double? radius,

  /// Defines the bottom sheet's [Material.clipBehavior]
  /// by overriding the default value for [BottomSheet.clipBehavior].
  ///
  /// Use this property to enable clipping of content when the bottom sheet
  /// has a custom [shape] and the content can extend past this shape.
  /// For example, a bottom sheet with rounded corners and an edge-to-edge
  /// [Image] at the top.
  ///
  /// If this property is null then then the behavior will be [Clip.none],
  /// via Flutter's default values.
  final Clip? clipBehavior,

  /// Constrains the size of the [BottomSheet].
  ///
  /// If null, the bottom sheet's size will be unconstrained.
  final BoxConstraints? constraints,

  /// Overrides the default value of [BottomSheet.shadowColor].
  final Color? shadowColor,

  /// Overrides the default value for surfaceTintColor.
  ///
  /// See [Material.surfaceTintColor] for more details.
  final Color? surfaceTintColor,
}) =>
    BottomSheetThemeData(
      backgroundColor: backgroundColor,
      modalBackgroundColor: modalBackgroundColor,
      elevation: elevation ?? kBottomSheetElevation,
      modalElevation: modalElevation ?? kBottomSheetModalElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius ?? kBottomSheetBorderRadius),
          topRight: Radius.circular(radius ?? kBottomSheetBorderRadius),
        ),
      ),
      clipBehavior: clipBehavior,
      constraints: constraints,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
    );
