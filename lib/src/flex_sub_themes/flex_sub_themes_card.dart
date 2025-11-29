part of '../flex_sub_themes.dart';

/// An opinionated [CardThemeData] for [Card] with custom
/// corner radius and elevation.
CardThemeData _cardTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  ///
  /// If null, any provided [SchemeColor] values will be ignored and
  /// component theme color defaults will be used.
  final ColorScheme? colorScheme,

  /// Selects which color from the passed in [colorScheme] to use as the
  /// background color of Cards.
  ///
  /// If not defined, defaults to:
  /// - M2: [ThemeData.cardColor]
  /// - M3: Card (elevated): [ColorScheme.surfaceContainerLow]
  /// - M3: Card.filled: [ColorScheme.surfaceContainerHighest]
  /// - M3: Card.outlined: [ColorScheme.surface]
  ///
  /// Warning: The Card variants cannot be themed separately in Flutter, if
  /// you provide a color, all card variants will share the same color.
  /// See issue: https://github.com/flutter/flutter/issues/153912
  final SchemeColor? backgroundSchemeColor,

  /// Corner radius
  ///
  /// If not defined, defaults to [kCardRadius] 12dp,
  /// based on M3 Specification, this is also the opinionated
  /// default for M2 in this package.
  final double? radius,

  /// Selects which color from the passed in [colorScheme] to use as the
  /// border color for Cards.
  ///
  /// If not defined, defaults to:
  /// - M2: no border
  /// - M3: Card (elevated): no border
  /// - M3: Card.filled: no border
  /// - M3: Card.outlined: [ColorScheme.outlineVariant]
  ///
  /// Warning: The Card variants cannot be themed separately in Flutter, if
  /// you provide a color, all card variants will share the same color.
  /// See issue: https://github.com/flutter/flutter/issues/153912
  final SchemeColor? borderSchemeColor,

  /// Defines the border width of the border on Cards.
  ///
  /// Only used if [borderSchemeColor] is also defined.
  ///
  /// If not defined, defaults to:
  /// - M2: no border
  /// - M3: Card (elevated): no border
  /// - M3: Card.filled: no border
  /// - M3: Card.outlined: 1.0
  ///
  /// Warning: The Card variants cannot be themed separately in Flutter, if
  /// you provide a color, all card variants will share the same color.
  /// See issue: https://github.com/flutter/flutter/issues/153912
  final double? borderWidth,

  /// Card elevation.
  ///
  /// If not defined, defaults to:
  /// - M2: 1.0
  /// - M3: Card (elevated): 1.0
  /// - M3: Card.filled: 0.0
  /// - M3: Card.outlined: 0.0
  ///
  /// Warning: The Card variants cannot be themed separately in Flutter, if
  /// you provide an elevation, all Card variants will get same elevation.
  /// See issue: https://github.com/flutter/flutter/issues/153912
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

  // Effective background color, if null, keep null defaults.
  final Color? backgroundColor =
      colorScheme == null || backgroundSchemeColor == null
          ? null
          : FlexSubThemes.schemeColor(backgroundSchemeColor, colorScheme);

  // Effective border color, if null, keep null defaults.
  final Color? borderColor = colorScheme == null || borderSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(borderSchemeColor, colorScheme);

  // Effective border width, set to 1.0 as default but will never be used if
  // borderColor is null.
  final double effectiveBorderWidth = borderWidth ?? 1.0;

  // Define the shape only if we have a non-default radius or a border color.
  ShapeBorder? shape;
  if (!usesDefaultRadius && (borderColor == null)) {
    shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? kCardRadius),
      ),
    );
  }
  if (borderColor != null) {
    shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? kCardRadius),
      ),
    ).copyWith(
      side: BorderSide(
        width: effectiveBorderWidth,
        color: borderColor,
      ),
    );
  }

  return CardThemeData(
    color: backgroundColor,
    clipBehavior: clipBehavior,
    elevation: elevation,
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    shape: shape,
  );
}
