part of '../flex_sub_themes.dart';

/// An opinionated [TextButtonThemeData] theme.
///
/// Requires a [ColorScheme], the color scheme would
/// typically be equal the color scheme also used to define the color scheme
/// for your app theme.
///
/// The adjustable button corner [radius] defaults to 20. This is the new
/// default in M3, Flutter SDK M2 defaults to 4.
TextButtonThemeData _textButtonTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the main
  /// color for the button.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, [colorScheme.primary] will be used.
  final SchemeColor? baseSchemeColor,

  /// The button corner radius.
  ///
  /// If not defined, defaults to [kButtonRadius] 40dp in M2. When using
  /// M3 it defaults to Stadium border based on
  /// https://m3.material.io/components/buttons/specs
  final double? radius,

  /// Padding for the button theme.
  ///
  /// Defaults to null and uses M3's default scaled padding function.
  final EdgeInsetsGeometry? padding,

  /// Minimum button size.
  ///
  /// If null, defaults to [kButtonMinSize] (`const Size(40.0, 40.0)`) when
  /// [useMaterial3] is false and to `const Size(64.0, 40.0)` when
  /// [useMaterial3] is true via widget defaults.
  final Size? minButtonSize,

  /// The style for the button's [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundColor] is used instead.
  final WidgetStateProperty<TextStyle?>? textStyle,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedInteraction,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedDisable,

  /// Creates the [InkWell] splash factory, which defines the appearance of
  /// "ink" splashes that occur in response to taps.
  ///
  /// In M2 mode FlexColorScheme passes in the effective splashFactory
  /// from splashFactory override value or the result from
  /// [FlexSubThemesData] adaptive splash settings. In M3 mode it is kept
  /// null and the default comes via ThemeData.splashFactory, that is has
  /// also defined.
  final InteractiveInkFeatureFactory? splashFactory,

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
  final bool tintInteract = useTintedInteraction ?? false;
  final bool tintDisable = useTintedDisable ?? false;
  // Get selected color, defaults to primary.
  final Color baseColor = FlexSubThemes.schemeColor(
    baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Using these tinted overlay variables in all themes for ease of
  // reasoning and duplication.
  final Color overlay = colorScheme.surface;
  final Color tint = baseColor;
  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness, true);

  // We only define theme props for foregroundColor and overlayColor, if we
  // have some settings the default widget behavior does not handle.
  WidgetStateProperty<Color?>? foregroundColor;
  WidgetStateProperty<Color?>? overlayColor;
  if (baseSchemeColor != null || tintInteract || tintDisable) {
    foregroundColor = WidgetStateProperty.resolveWith((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        if (tintDisable) {
          return FlexSubThemes.tintedDisable(colorScheme.onSurface, tint);
        }
        return colorScheme.onSurface.withAlpha(kAlphaDisabled);
      }
      return baseColor;
    });

    overlayColor = WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered)) {
        if (tintInteract) {
          return FlexSubThemes.tintedHovered(overlay, tint, factor);
        }
        return baseColor.withAlpha(kAlphaHovered);
      }
      if (states.contains(WidgetState.focused)) {
        if (tintInteract) {
          return FlexSubThemes.tintedFocused(overlay, tint, factor);
        }
        return baseColor.withAlpha(kAlphaFocused);
      }
      if (states.contains(WidgetState.pressed)) {
        if (tintInteract) {
          return FlexSubThemes.tintedPressed(overlay, tint, factor);
        }
        return baseColor.withAlpha(kAlphaPressed);
      }
      return null;
    });
  }

  return TextButtonThemeData(
    style: ButtonStyle(
      splashFactory: splashFactory,
      textStyle: textStyle,
      foregroundColor: foregroundColor,
      iconColor: foregroundColor,
      overlayColor: overlayColor,
      minimumSize: ButtonStyleButton.allOrNull<Size>(
        minButtonSize ?? (useM3 ? null : kButtonMinSize),
      ),
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      shape: radius == null && useM3
          ? null
          : ButtonStyleButton.allOrNull<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? kButtonRadius),
                ),
              ),
            ),
    ),
  );
}
