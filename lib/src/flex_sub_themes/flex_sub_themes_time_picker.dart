part of '../flex_sub_themes.dart';

/// An opinionated [TimePickerThemeData] with custom corner radius.
///
/// Corner [radius] defaults to [kDialogRadius] 28dp. The internal shapes
/// in the picker also have rounding, their corner radii are defined by
/// [elementRadius] that defaults to [kCardRadius] 12.
///
/// In the InputDecorator, if you pass it an input decoration style
/// that matches the main input decoration style and corner rounding it
/// will be used on the data entry elements in the picker.
///
/// ## [colorScheme]
///
/// Typically the same [ColorScheme] that is also used for your [ThemeData].
///
/// ## [backgroundSchemeColor]
///
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
///
/// ## [backgroundColor]
///
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
///
/// ## [elevation]
///
/// Dialog elevation.
///
/// If not defined, defaults to [kDialogElevation] = 6.
///
/// ## [radius]
///
/// Corner radius of the [TimePickerDialog] dialog.
///
/// If not defined, defaults to [kDialogRadius] = 28.
///
/// ## [elementRadius]
///
/// Corner radius of the [TimePickerDialog] internal elements.
///
/// If not defined, defaults to [kTimeElementRadius] = 12.
///
/// ## [dayPeriodTextStyle]
///
/// The text style of the day period text.
///
/// ## [dialTextStyle]
///
/// The text style of the dial text.
///
/// ## [helpTextStyle]
///
/// The text style of the help text.
///
/// ## [hourMinuteTextStyle]
///
/// The text style of the hour/minute text.
///
/// ## [inputDecorationTheme]
///
/// A custom input decoration theme for the time picker's input fields.
///
/// ## [useInputDecoratorTheme]
///
/// Use the [inputDecorationTheme] if defined.
///
/// If this is false, the input decoration theme is not used, even if
/// defined. If true, it is used if defined.
///
/// Defaults to false.
///
/// ## [useMaterial3]
///
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
TimePickerThemeData _timePickerTheme({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required ColorScheme colorScheme,

  /// Dialog background color.
  ///
  /// If null and `backgroundSchemeColor` is also null, then it
  /// gets default via Dialog's default null theme behavior.
  SchemeColor? backgroundSchemeColor,

  /// Dialog background color.
  ///
  /// If null and `backgroundSchemeColor` is also null, then it
  /// gets default via Dialog's default null theme behavior.
  Color? backgroundColor,

  /// Dialog elevation.
  ///
  /// If not defined, defaults to `kDialogElevation` = 6.
  double? elevation,

  /// Corner radius of the `TimePickerDialog` dialog.
  ///
  /// If not defined, defaults to `kDialogRadius` = 28.
  double? radius,

  /// Corner radius of the `TimePickerDialog` internal elements.
  ///
  /// If not defined, defaults to `kTimeElementRadius` = 12.
  double? elementRadius,

  /// The text style of the day period text.
  TextStyle? dayPeriodTextStyle,

  /// The text style of the dial text.
  TextStyle? dialTextStyle,

  /// The text style of the help text.
  TextStyle? helpTextStyle,

  /// The text style of the hour/minute text.
  TextStyle? hourMinuteTextStyle,

  /// A custom input decoration theme for the time picker's input fields.
  InputDecorationThemeData? inputDecorationTheme,

  /// Use the `inputDecorationTheme` if defined.
  bool? useInputDecoratorTheme,

  /// A temporary flag used to disable Material-3 design and use legacy
  /// Material-2 design instead. Material-3 design is the default.
  /// Material-2 will be deprecated in Flutter.
  bool? useMaterial3,
}) {
  final bool useM3 = useMaterial3 ?? true;
  final bool useDecorator = useInputDecoratorTheme ?? false;

  final Color? background = backgroundSchemeColor == null
      ? backgroundColor // might be null, then SDK theme defaults.
      : FlexSubThemes.schemeColor(backgroundSchemeColor, colorScheme);

  Color defaultHourMinuteColor() {
    return WidgetStateColor.resolveWith((Set<WidgetState> states) {
      // These styles are copied for M# default, we are not going to test
      // them again.
      // coverage:ignore-start
      if (states.contains(WidgetState.selected)) {
        Color overlayColor = colorScheme.primaryContainer;
        if (states.contains(WidgetState.pressed)) {
          overlayColor = colorScheme.onPrimaryContainer;
        } else if (states.contains(WidgetState.hovered)) {
          const double hoverOpacity = 0.08;
          overlayColor = colorScheme.onPrimaryContainer.withValues(
            alpha: hoverOpacity,
          );
        } else if (states.contains(WidgetState.focused)) {
          const double focusOpacity = 0.12;
          overlayColor = colorScheme.onPrimaryContainer.withValues(
            alpha: focusOpacity,
          );
        }
        return Color.alphaBlend(overlayColor, colorScheme.primaryContainer);
      } else {
        Color overlayColor = colorScheme.surfaceContainerHighest;
        if (states.contains(WidgetState.pressed)) {
          overlayColor = colorScheme.onSurface;
        } else if (states.contains(WidgetState.hovered)) {
          const double hoverOpacity = 0.08;
          overlayColor = colorScheme.onSurface.withValues(
            alpha: hoverOpacity,
          );
        } else if (states.contains(WidgetState.focused)) {
          const double focusOpacity = 0.12;
          overlayColor = colorScheme.onSurface.withValues(
            alpha: focusOpacity,
          );
        }
        return Color.alphaBlend(
          overlayColor,
          colorScheme.surfaceContainerHighest,
        );
      }
      // coverage:ignore-end
    });
  }

  InputDecorationThemeData timePickerDefaultInputDecorationTheme() {
    const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(8.0));
    return InputDecorationThemeData(
      contentPadding: EdgeInsets.zero,
      filled: true,
      hoverColor: colorScheme.brightness == Brightness.dark
          ? Colors.white.withValues(alpha: 0.04)
          : Colors.black.withValues(alpha: 0.04),
      fillColor: defaultHourMinuteColor(),
      focusColor: colorScheme.primaryContainer,
      enabledBorder: const OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(
          color: colorScheme.onSurface.withValues(alpha: 0.12),
          width: 1,
        ),
      ),
      errorStyle: const TextStyle(fontSize: 0, height: 0),
    );
  }

  WidgetStateProperty<Color> dayPeriodForegroundColor() {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      Color? textColor;
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          textColor = colorScheme.onTertiaryContainer;
        } else {
          // not pressed
          if (states.contains(WidgetState.focused)) {
            textColor = colorScheme.onTertiaryContainer;
          } else {
            // not focused
            if (states.contains(WidgetState.hovered)) {
              textColor = colorScheme.onTertiaryContainer;
            }
          }
        }
      } else {
        // unselected
        if (states.contains(WidgetState.pressed)) {
          textColor = colorScheme.onSurfaceVariant;
        } else {
          // not pressed
          if (states.contains(WidgetState.focused)) {
            textColor = colorScheme.onSurfaceVariant;
          } else {
            // not focused
            if (states.contains(WidgetState.hovered)) {
              textColor = colorScheme.onSurfaceVariant;
            }
          }
        }
      }
      return textColor ?? colorScheme.onTertiaryContainer;
    });
  }

  return TimePickerThemeData(
    // Optional text styles
    dayPeriodTextStyle: dayPeriodTextStyle,
    dialTextStyle: dialTextStyle,
    helpTextStyle: helpTextStyle,
    hourMinuteTextStyle: hourMinuteTextStyle,
    //
    backgroundColor: background,
    elevation: elevation ?? kDialogElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? kDialogRadius),
      ),
    ),
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(elementRadius ?? kTimeElementRadius),
      ),
    ),
    dayPeriodShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(elementRadius ?? kTimeElementRadius),
      ),
    ),
    // TODO(rydmike): Add theming for dialBackgroundColor
    // dialBackgroundColor: ,
    dayPeriodColor: useM3
        ? WidgetStateColor.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return colorScheme.tertiaryContainer;
            }
            return Colors.transparent;
          })
        : null,
    dayPeriodTextColor: useM3
        ? WidgetStateColor.resolveWith((Set<WidgetState> states) {
            return dayPeriodForegroundColor().resolve(states);
          })
        : null,
    // M3 styling Flutter 3.7 does not do this yet, but we can du in M3 mode.
    hourMinuteColor: useM3
        ? WidgetStateColor.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              Color overlayColor = colorScheme.primaryContainer;
              if (states.contains(WidgetState.pressed)) {
                overlayColor = colorScheme.onPrimaryContainer;
              } else if (states.contains(WidgetState.focused)) {
                overlayColor = colorScheme.onPrimaryContainer.withAlpha(
                  kAlphaFocused,
                );
              } else if (states.contains(WidgetState.hovered)) {
                overlayColor = colorScheme.onPrimaryContainer.withAlpha(
                  kAlphaHovered,
                );
              }
              return Color.alphaBlend(
                overlayColor,
                colorScheme.primaryContainer,
              );
            } else {
              Color overlayColor = colorScheme.surfaceContainerHighest;
              if (states.contains(WidgetState.pressed)) {
                overlayColor = colorScheme.onSurface;
              } else if (states.contains(WidgetState.focused)) {
                overlayColor = colorScheme.onSurface.withAlpha(
                  kAlphaFocused,
                );
              } else if (states.contains(WidgetState.hovered)) {
                overlayColor = colorScheme.onSurface.withAlpha(
                  kAlphaHovered,
                );
              }
              return Color.alphaBlend(
                overlayColor,
                colorScheme.surfaceContainerHighest,
              );
            }
          })
        : null,
    //
    // Custom additions the Widget does internally, but for some reason
    // only does to null default theme. If you use a custom decorator
    // you are supposed to know that you have to add these shenanigans
    // for it to work and look right.
    inputDecorationTheme: useDecorator
        ? inputDecorationTheme?.copyWith(
                contentPadding: EdgeInsets.zero,
                // Prevent the error text from appearing.
                // See https://github.com/flutter/flutter/issues/54104
                errorStyle: const TextStyle(fontSize: 0, height: 0),
              ) ??
              const InputDecorationThemeData().copyWith(
                contentPadding: EdgeInsets.zero,
                // Prevent the error text from appearing.
                // See https://github.com/flutter/flutter/issues/54104
                errorStyle: const TextStyle(fontSize: 0, height: 0),
              )
        // To get back to a default style, we have to provide an explicit
        // default matching style, very tedious.
        // Read more about this here:
        // https://github.com/flutter/flutter/pull/128950#issuecomment-1657177393
        : timePickerDefaultInputDecorationTheme(),
  );
}
