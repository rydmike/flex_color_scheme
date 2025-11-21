part of '../flex_sub_themes.dart';

/// An opinionated [ElevatedButtonThemeData] theme.
///
/// Requires a [ColorScheme] in [colorScheme]. The color scheme would
/// typically be equal the color scheme also used to define the color scheme
/// for your app theme.
///
/// The button [elevation] defaults to 1 [kElevatedButtonElevation], making
/// the elevated button a bit more flat. Flutter SDK ElevatedButton
/// defaults to elevation 2.
///
/// The adjustable button corner [radius] defaults to 20. This is the new
/// default in M3, Flutter SDK M2 defaults to 4.
ElevatedButtonThemeData _elevatedButtonTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the main
  /// color for the button.
  ///
  /// If [useMaterial3] is false, the [baseSchemeColor] is used as button
  /// background color in M2 style, and if it is true, it is used as the
  /// button foreground color for text and icon.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, [colorScheme.primary] will be used.
  final SchemeColor? baseSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the
  /// secondary color, or on color for for the button.
  ///
  /// If [useMaterial3] is false, the [onBaseSchemeColor] is used as button
  /// foreground color in M2 style, and if it is true, it is used as the
  /// button background color..
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, the [baseSchemeColor] on color will be used if
  /// [useMaterial3] is false, if it is true, then
  /// [colorScheme.surfaceContainerLow] will be used.
  final SchemeColor? onBaseSchemeColor,

  /// The button corner radius.
  ///
  /// If not defined, defaults to [kButtonRadius] 40dp in M2. When using
  /// M3 it defaults to Stadium border based on
  /// https://m3.material.io/components/buttons/specs
  final double? radius,

  /// The button elevation.
  ///
  /// If null and passed in [useMaterial3] is false then it defaults to using
  /// [kElevatedButtonElevation] 1 with [ElevatedButton.styleFrom], making it
  /// a bit more flat in its elevation state than Flutter M2, that defaults
  /// to 2.
  ///
  /// If null and passed in [useMaterial3] is true, then it defaults to using
  /// the M3 elevation defaults by keeping elevation null and using default
  /// M3 elevated button style. This requires that the ambient theme also uses
  /// Material 3.
  ///
  /// If a value is passed in, the [ElevatedButton.styleFrom] constructor used
  /// for M2 style elevation is used with the passed in value in M2 mode. In
  /// M3 the given elevation value is used as baseline, with M3 state
  /// modifiers, this means disabled is fat, zero elevation, and pressed is
  /// elevation + 2, other states are at given elevation.
  final double? elevation,

  /// Padding for the button theme.
  ///
  /// Defaults to null and uses `styleFrom` constructors default padding.
  ///
  /// M3 has more horizontal padding 24dp, but the tighter default padding
  /// in M2 that is 16dp looks fine as well when using stadium borders
  /// as in M3.
  ///
  /// If null and [useMaterial3] is true in the context, the correct M3
  /// button theme default computed button padding for M3 will be used.
  final EdgeInsetsGeometry? padding,

  /// Minimum button size.
  ///
  /// If null, defaults to [kButtonMinSize] (`const Size(64.0, 40.0)`) when
  /// [useMaterial3] is false and to `const Size(64.0, 40.0)` when
  /// [useMaterial3] is true.
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
  final bool tintDisable = useTintedDisable ?? false;
  final bool tintInteract = useTintedInteraction ?? false;
  // Get selected color, defaults to primary.
  final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
  final Color baseColor = FlexSubThemes.schemeColor(baseScheme, colorScheme);
  // On color logic for M2 and M3 are different. Elevated button is a mess.
  final Color onBaseColor = onBaseSchemeColor == null
      ? useM3
          ? FlexSubThemes.schemeColor(
              SchemeColor.surfaceContainerLow, colorScheme)
          : FlexSubThemes.schemeColorPair(baseScheme, colorScheme)
      : FlexSubThemes.schemeColor(onBaseSchemeColor, colorScheme);

  // To not mess up let's define button foreground and background colors.
  final Color background = useM3 ? onBaseColor : baseColor;
  final Color foreground = useM3 ? baseColor : onBaseColor;

  // The logic below is used to give a nice tinted interaction and disable
  // color regardless of how we customize the foreground and background
  // of the elevated button. Due to its role reversal of coloring in M2
  // versus M3, we need to provide a good tint for both use cases.
  // With the logic below, this is doable for both modes.
  //
  // We are using a light colorScheme.
  final bool isLight = colorScheme.brightness == Brightness.light;
  // Get brightness of button background color.
  final bool buttonBgIsLight =
      ThemeData.estimateBrightnessForColor(background) == Brightness.light;
  // For tint color use the one that is more likely to give a colored effect.
  final Color tint = isLight
      ? buttonBgIsLight
          ? foreground
          : background
      : buttonBgIsLight
          ? background
          : foreground;
  // The reverse color is used for overlay
  final Color overlay = isLight
      ? buttonBgIsLight
          ? background
          : foreground
      : buttonBgIsLight
          ? foreground
          : background;
  // We use surface mode tint factor, if it is light theme and background
  // is light OR if it is a dark theme and background is dark.
  final bool surfaceMode =
      (isLight && buttonBgIsLight) || (!isLight && !buttonBgIsLight);
  final double factor = FlexSubThemes._tintAlphaFactor(
    tint,
    colorScheme.brightness,
    surfaceMode,
  );

  // We are using FCS M2 buttons, styled in M3 fashion by FCS.
  if (!useM3) {
    final WidgetStateProperty<Color> foregroundColor =
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (tintDisable) {
          return FlexSubThemes.tintedDisable(colorScheme.onSurface, tint);
        }
        return colorScheme.onSurface.withAlpha(kAlphaDisabled);
      }
      return foreground;
    });
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        splashFactory: splashFactory,
        minimumSize: minButtonSize ?? kButtonMinSize,
        padding: padding,
        elevation: elevation ?? kElevatedButtonElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kButtonRadius),
          ),
        ), //buttonShape,
      ).copyWith(
        textStyle: textStyle,
        foregroundColor: foregroundColor,
        iconColor: foregroundColor,
        backgroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return FlexSubThemes.tintedDisable(
                colorScheme.onSurface,
                tint,
              ).withAlpha(kAlphaVeryLowDisabled);
            }
            return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
          }
          return background;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.hovered)) {
            if (tintInteract) {
              return FlexSubThemes.tintedHovered(overlay, tint, factor);
            }
            return overlay.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) {
              return FlexSubThemes.tintedFocused(overlay, tint, factor);
            }
            return overlay.withAlpha(kAlphaFocused);
          }
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) {
              return FlexSubThemes.tintedPressed(overlay, tint, factor);
            }
            return overlay.withAlpha(kAlphaPressed);
          }
          return Colors.transparent;
        }),
      ),
    );
  } else {
    //
    // We are using M3 style buttons, with potentially custom radius,
    // elevation, foregroundColor, backgroundColor, overlayColor, padding
    // and minButtonSize.
    WidgetStateProperty<Color?>? backgroundColor;
    WidgetStateProperty<Color?>? foregroundColor;
    WidgetStateProperty<Color?>? overlayColor;

    // If a baseSchemeColor was given we need to define all M3 color in
    // all states, if it was not defined, we can keeping them all null
    // and let M3 widget defaults handle the colors.
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
        return foreground;
      });
      backgroundColor = WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              tint,
            ).withAlpha(kAlphaVeryLowDisabled);
          }
          return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
        }
        return background;
      });
      overlayColor = WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.hovered)) {
          if (tintInteract) {
            return FlexSubThemes.tintedHovered(overlay, tint, factor);
          }
          return foreground.withAlpha(kAlphaHovered);
        }
        if (states.contains(WidgetState.focused)) {
          if (tintInteract) {
            return FlexSubThemes.tintedFocused(overlay, tint, factor);
          }
          return foreground.withAlpha(kAlphaFocused);
        }
        if (states.contains(WidgetState.pressed)) {
          if (tintInteract) {
            return FlexSubThemes.tintedPressed(overlay, tint, factor);
          }
          return foreground.withAlpha(kAlphaPressed);
        }
        return null;
      });
    }
    // If the baseSchemeColor was null, but onBaseSchemeColor was not,
    // we need to define background color. Otherwise it will have value from
    // above or be left at defaults and let widget default define it.
    if (baseSchemeColor == null && onBaseSchemeColor != null) {
      backgroundColor = WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(
              colorScheme.onSurface,
              tint,
            ).withAlpha(kAlphaVeryLowDisabled);
          }
          return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
        }
        return background;
      });
    }

    // If elevation is null, we use widget defaults, otherwise we define a
    // custom elevation behavior that is based on how M3 elevation works,
    // but where we can modify the base level. If elevation 1, is passed
    // the result is the same as M3 elevation behavior.
    final WidgetStateProperty<double?>? elevationM3 = elevation == null
        ? null
        : WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return 0.0;
            }
            if (states.contains(WidgetState.hovered)) {
              return elevation + 2.0;
            }
            if (states.contains(WidgetState.focused)) {
              return elevation;
            }
            if (states.contains(WidgetState.pressed)) {
              return elevation;
            }
            return elevation;
          });

    return ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: splashFactory,
        textStyle: textStyle,
        foregroundColor: foregroundColor,
        iconColor: foregroundColor,
        backgroundColor: backgroundColor,
        overlayColor: overlayColor,
        minimumSize: ButtonStyleButton.allOrNull<Size>(minButtonSize),
        padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
        elevation: elevationM3,
        shape: radius == null
            ? null
            : ButtonStyleButton.allOrNull<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
              ),
      ),
    );
  }
}
