part of '../flex_sub_themes.dart';

/// An opinionated [CardThemeData] for [Card] with custom
/// corner radius and elevation.
///
/// Corner [radius] defaults to [kCardRadius] = 12 and [elevation]
/// defaults to Flutter SDK defaults if not defined.
CardThemeData _cardTheme({
  /// Corner radius
  ///
  /// If not defined, defaults to [kCardRadius] 12dp,
  /// based on M3 Specification
  /// https://m3.material.io/components/cards/specs
  final double? radius,

  /// Card elevation.
  ///
  /// If not defined, defaults to 1 via M2 and M3 defaults.
  final double? elevation,

  /// Overrides the default value for [Card.shadowColor].
  ///
  /// If null, [Card] defaults to fully opaque black.
  final Color? shadowColor,

  /// Overrides the default value for [Card.surfaceTintColor].
  ///
  /// If null, [Card] will not display an overlay color.
  ///
  /// See [Material.surfaceTintColor] for more details.
  final Color? surfaceTintColor,

  /// The clipBehavior of the card theme, defaults to
  /// [Clip.antiAlias] for smooth clipping when using rounded corners.
  ///
  /// There is no config property in [FlexSubThemesData] for [clipBehavior],
  /// if needed it can be exposed. Feel free to make a PR or submit an issue.
  final Clip clipBehavior = Clip.antiAlias,

  /// A temporary flag used to disable Material-3 design and use legacy
  /// Material-2 design instead. Material-3 design is the default.
  /// Material-2 will be deprecated in Flutter.
  ///
  /// If set to true, the theme will use Material3 default styles when
  /// properties are undefined, if false defaults will use FlexColorScheme's
  /// own opinionated default values.
  ///
  /// The M2/M3 defaults will only be used for properties that are not
  /// defined, if defined they keep their defined values.
  ///
  /// If undefined, defaults to true.
  final bool? useMaterial3,
}) {
  final bool useM3 = useMaterial3 ?? true;

  // We use this to only create a RoundedRectangleBorder when radius differs
  // from default in M2 and M3 mode. This is done in order to not make a
  // a radius that destroys the default style of the `Card.outlined` style.
  // since its variant get destroyed as soon as you make a theme with a radius
  // that does not use a border. Which you want for the default elevated
  // one and filled one.
  //
  // See issue: https://github.com/flutter/flutter/issues/153912
  final bool usesDefaultRadius =
      (radius == null || (useM3 && radius == kCardRadius)) && useM3;

  return CardThemeData(
    clipBehavior: clipBehavior,
    elevation: elevation,
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    shape: usesDefaultRadius
        ? null
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kCardRadius),
            ),
          ),
  );
}
