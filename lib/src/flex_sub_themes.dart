import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'flex_color_scheme.dart';
import 'flex_constants.dart';
import 'flex_extensions.dart';

// ignore_for_file: comment_references

/// Enum used to select the type of border used on by the input decorator in
/// [FlexSubThemes.inputDecorationTheme].
enum FlexInputBorderType {
  /// Used to select [OutlineInputBorder] as input decorator in
  /// [FlexSubThemes.inputDecorationTheme].
  outline,

  /// Used to select [UnderlineInputBorder] as input decorator in
  /// [FlexSubThemes.inputDecorationTheme].
  underline,
}

/// Enum used to described which color from the active theme's
/// [ColorScheme] should be used by certain widget sub-themes.
///
/// This enum can be used for quick color scheme based customization
/// of sub-themes for:
///
/// - [TextField] in [FlexSubThemes.inputDecorationTheme].
/// - [TabBar] indicator color.
/// - [BottomNavigationBar] in [FlexSubThemes.bottomNavigationBar].
/// - [NavigationBar] in [FlexSubThemes.navigationBarTheme].
/// - [ChipThemeData] from [FlexSubThemes.chipTheme].
///
/// It can be used when opting in on opinionated sub-themes. The opinionated
/// sub-theme for these widgets have one or more properties called
/// `nnnSchemeColor` where `nnn` describes the color feature that can be set
/// to a none standard [ColorScheme] based color.
/// If not set the property is null and the default [ColorScheme] based
/// color behavior of the opinionated sub-theme will be used. This may differ
/// from the corresponding Widget's SDK default un-themed color behavior, but
/// is mostly the same if defined at all.
///
/// The enum selection `primaryVariant` and `secondaryVariant` colors have been
/// deprecated in Flutter SDK 2.1.0 master after after v2.6.0-0.0.pre landed.
///
/// This enum to select and override default Widget colors when using
/// opinionated sub-themes might be applied to more widgets in later release
/// if so requested and desired. It should be noted though all will not be since
/// you can still customize FlexColorScheme themes and its sub-themes
/// totally [ThemeData.copyWith] methods.
enum SchemeColor {
  /// The active theme's color scheme primary color will be used.
  primary,

  /// The active theme's color scheme  onPrimary color will be used.
  onPrimary,

  /// The active theme's color scheme primaryContainer color will be used.
  primaryContainer,

  /// The active theme's color scheme onPrimaryContainer color will be used.
  onPrimaryContainer,

  /// The active theme's color scheme secondary color will be used.
  secondary,

  /// The active theme's color scheme onSecondary color will be used.
  onSecondary,

  /// The active theme's color scheme secondaryContainer color will be used.
  secondaryContainer,

  /// The active theme's color scheme onSecondaryContainer color will be used.
  onSecondaryContainer,

  /// The active theme's color scheme tertiary color will be used.
  tertiary,

  /// The active theme's color scheme onTertiary color will be used.
  onTertiary,

  /// The active theme's color scheme tertiaryContainer color will be used.
  tertiaryContainer,

  /// The active theme's color scheme onTertiaryContainer color will be used.
  onTertiaryContainer,

  /// The active theme's color scheme error color will be used.
  error,

  /// The active theme's color scheme onError color will be used.
  onError,

  /// The active theme's color scheme errorContainer color will be used.
  errorContainer,

  /// The active theme's color scheme onErrorContainer color will be used.
  onErrorContainer,

  /// The active theme's color scheme background color will be used.
  background,

  /// The active theme's color scheme onBackground color will be used.
  onBackground,

  /// The active theme's color scheme surface color will be used.
  surface,

  /// The active theme's color scheme outline color will be used.
  outline,

  /// The active theme's color scheme shadow color will be used.
  shadow,

  /// The active theme's color scheme  onSurface color will be used.
  onSurface,

  /// The active theme's color scheme surfaceVariant color will be used.
  surfaceVariant,

  /// The active theme's color scheme onSurfaceVariant color will be used.
  onSurfaceVariant,

  /// The active theme's color scheme inverseSurface color will be used.
  inverseSurface,

  /// The active theme's color scheme onInverseSurface color will be used.
  onInverseSurface,

  /// The active theme's color scheme inversePrimary color will be used.
  inversePrimary,

  /// The active theme's color scheme primaryVariant color will be used.
  @Deprecated('Use primaryContainer instead. Deprecated after version 4.2.0')
  primaryVariant,

  /// The active theme's color scheme secondaryVariant color will be used.
  @Deprecated('Use secondaryContainer instead. Deprecated after version 4.2.0')
  secondaryVariant,
}

/// Static sub-theme helpers used by opt-in widget sub theming
/// in [FlexColorScheme].
///
/// FlexSubTheme offers opinionated static theme helpers that are opt-in via
/// [FlexColorScheme.useSubThemes]. You can also change many properties of the
/// the opt-in setup by defining custom configuration values in the
/// [FlexSubThemesData] configuration class, and passing it to the
/// [FlexColorScheme.subThemesData] property.
///
/// The configuration class [FlexSubThemesData] offers easy to use configuration
/// properties for using these sub-themes in FlexColorScheme. You can also
/// the static sub-themes without using FlexColorScheme based theming.
/// However, the [FlexSubThemesData] has no impact on the static helpers, it
/// is [FlexColorScheme] that uses the [FlexSubThemesData] class to configure
/// the opt in sub-themes. You can of course also do this if you use
/// [FlexSubThemesData] outside of [FlexColorScheme] or in `copyWith` on each
/// sub-theme with custom [ThemeData].
///
/// Sub themes for the following widgets are provided and used via opt-in
/// property [FlexColorScheme.useSubThemes] :
///
/// * [TextButton]
/// * [ElevatedButton]
/// * [OutlinedButton]
/// * Older buttons using [ButtonThemeData]
/// * [ToggleButtons]
/// * [Switch]
/// * [Checkbox]
/// * [Radio]
/// * [InputDecoration]
/// * [FloatingActionButton]
/// * [Chip]
/// * [Card]
/// * [PopupMenuButton]
/// * [Dialog]
/// * [TimePickerDialog]
/// * [SnackBar]
/// * [Tooltip]
/// * [BottomSheet]
/// * [BottomNavigationBar]
/// * [NavigationBar]
/// * [NavigationRail]
///
/// In [ToggleButtons] hover, press, selected and focus states are not
/// an exact match for the main buttons. It does not have as flexible styling
/// as the main buttons. The theme mimics the style of the [OutlinedButton] for
/// not selected buttons and the style of [ElevatedButton] for selected
/// button. It does not support [MaterialStateProperty] and has only
/// one state for different parts of the button. The selected and not selected,
/// states would need different property values to be able to match the general
/// buttons. It can therefore not fully match the same theme style as the
/// Material states used on two different [ButtonStyleButton] buttons that
/// it should match.
///
/// The theme [ButtonThemeData] is included to provide a very similar
/// theme style on the deprecated legacy buttons `RaisedButton`,
/// `OutlineButton` and `FlatButton` as on the current main buttons. It is not
/// an exact match, since the legacy buttons do not offer as flexible
/// styling as the newer buttons. They do follow and match the styling on
/// [ToggleButtons] when it comes to hover, press, selected and focus.
/// Please consider phasing out the legacy buttons, as they are deprecated and
/// may soon be removed from the Flutter SDK.
///
/// The following widgets that have rounded corners are excluded from the
/// sub theming:
/// * [Tooltip], generally so small that larger prominent rounding the
///   opinionated sub-theming is designed for, is not a good fit.
///   FlexColorScheme does include out of the box theming options for tooltips,
///   that also adapts to color branding when opting in on sub themes,
///   it also gets a bit more rounded than when not opting in on sub themes.
/// * [Scrollbar], rounding on edges of scrollbars are left to platform default.
/// * [AppBar] and [BottomAppBar] shape properties are left to their defaults.
/// * [SnackBar] the floating snackbar should be sub themed to also include
///   border radius, but the none floating one should remain
///   straight. Unclear if it can be done via SDK's current theming features,
///   will investigate more in future version.
/// * [Drawer] should have have rounding on shown side edge, it is in recent
///   version (2.8.0) now possible to assign a Shape in drawer theme. But
///   Drawer uses same theme when used as Drawer and EndDrawer and the rounding
///   should be on end edge on Drawer and start edge in EndDrawer, we cannot do
///   that without having two Shapes in its theme or other usage behaviour
///   modifying. A default behaviour in SDK can implement by looking up
///   if Drawer is being used in Scaffold as Drawer or EndDrawer, but still
///   messy and has limitations. Also the M3 16dp rounding on visible edge was
///   no longer mentioned in M3 guide. Will still have to wait and see with
///   this one.
class FlexSubThemes {
  /// Private constructor for the FlexSubThemes static class to prevent it from
  /// being instantiated or extended.
  FlexSubThemes._(); // coverage:ignore-line

  /// Returns the [Color] from passed in [ColorScheme] in [colorScheme]
  /// corresponding to the [SchemeColor] enum selection in [value].
  ///
  /// This function is used to select a none default color available in the
  /// theme's [ColorScheme] in opinionated sub-themes for:
  ///
  /// - [TextField] in [FlexSubThemes.inputDecorationTheme]
  /// - [TabBar] indicator color
  /// - [BottomNavigationBar] in [FlexSubThemes.bottomNavigationBar]
  /// - [NavigationBar] in [FlexSubThemes.navigationBarTheme]
  /// - [ChipThemeData] from [FlexSubThemes.chipTheme].
  /// - [FloatingActionButton] from [FlexSubThemes.floatingActionButtonTheme]
  ///
  /// More adjustable color properties may be added in later versions.
  static Color schemeColor(SchemeColor value, ColorScheme colorScheme) {
    switch (value) {
      case SchemeColor.primary:
        return colorScheme.primary;
      case SchemeColor.onPrimary:
        return colorScheme.onPrimary;
      case SchemeColor.primaryContainer:
        return colorScheme.primaryContainer;
      case SchemeColor.onPrimaryContainer:
        return colorScheme.onPrimaryContainer;
      case SchemeColor.secondary:
        return colorScheme.secondary;
      case SchemeColor.onSecondary:
        return colorScheme.onSecondary;
      case SchemeColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case SchemeColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case SchemeColor.tertiary:
        return colorScheme.tertiary;
      case SchemeColor.onTertiary:
        return colorScheme.onTertiary;
      case SchemeColor.tertiaryContainer:
        return colorScheme.tertiaryContainer;
      case SchemeColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case SchemeColor.error:
        return colorScheme.error;
      case SchemeColor.onError:
        return colorScheme.onError;
      case SchemeColor.errorContainer:
        return colorScheme.errorContainer;
      case SchemeColor.onErrorContainer:
        return colorScheme.onErrorContainer;
      case SchemeColor.background:
        return colorScheme.background;
      case SchemeColor.onBackground:
        return colorScheme.onBackground;
      case SchemeColor.surface:
        return colorScheme.surface;
      case SchemeColor.onSurface:
        return colorScheme.onSurface;
      case SchemeColor.surfaceVariant:
        return colorScheme.surfaceVariant;
      case SchemeColor.onSurfaceVariant:
        return colorScheme.onSurfaceVariant;
      case SchemeColor.outline:
        return colorScheme.outline;
      case SchemeColor.shadow:
        return colorScheme.shadow;
      case SchemeColor.inverseSurface:
        return colorScheme.inverseSurface;
      case SchemeColor.onInverseSurface:
        return colorScheme.onInverseSurface;
      case SchemeColor.inversePrimary:
        return colorScheme.inversePrimary;
      case SchemeColor.primaryVariant:
        return colorScheme.primaryContainer;
      case SchemeColor.secondaryVariant:
        return colorScheme.secondaryContainer;
    }
  }

  /// Returns the [Color] from passed in [ColorScheme] in [colorScheme]
  /// that is the color pair corresponding to the [SchemeColor] enum
  /// value passed in via [value].
  ///
  /// This function is used to get the color value for the color pair to the
  /// passed in scheme enum value, thus giving the correct Colorscheme based
  /// contrast color for the provided [SchemeColor]. For example passing in
  /// [SchemeColor.primary] enum value, will return the [ColorScheme.onPrimary].
  /// Wise versa, passing in [SchemeColor.onPrimary] will return the color
  /// [ColorScheme.primary].
  static Color schemeColorPair(SchemeColor value, ColorScheme colorScheme) {
    switch (value) {
      case SchemeColor.primary:
        return colorScheme.onPrimary;
      case SchemeColor.onPrimary:
        return colorScheme.primary;
      case SchemeColor.primaryContainer:
      case SchemeColor.primaryVariant:
        return colorScheme.onPrimaryContainer;
      case SchemeColor.onPrimaryContainer:
        return colorScheme.primaryContainer;
      case SchemeColor.secondary:
        return colorScheme.onSecondary;
      case SchemeColor.onSecondary:
        return colorScheme.secondary;
      case SchemeColor.secondaryContainer:
      case SchemeColor.secondaryVariant:
        return colorScheme.onSecondaryContainer;
      case SchemeColor.onSecondaryContainer:
        return colorScheme.secondaryContainer;
      case SchemeColor.tertiary:
        return colorScheme.onTertiary;
      case SchemeColor.onTertiary:
        return colorScheme.tertiary;
      case SchemeColor.tertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case SchemeColor.onTertiaryContainer:
        return colorScheme.tertiaryContainer;
      case SchemeColor.error:
        return colorScheme.onError;
      case SchemeColor.onError:
        return colorScheme.error;
      case SchemeColor.errorContainer:
        return colorScheme.onErrorContainer;
      case SchemeColor.onErrorContainer:
        return colorScheme.errorContainer;
      case SchemeColor.background:
        return colorScheme.onBackground;
      case SchemeColor.onBackground:
        return colorScheme.background;
      case SchemeColor.surface:
        return colorScheme.onSurface;
      case SchemeColor.onSurface:
        return colorScheme.surface;
      case SchemeColor.surfaceVariant:
        return colorScheme.onSurfaceVariant;
      case SchemeColor.onSurfaceVariant:
        return colorScheme.surfaceVariant;
      case SchemeColor.outline:
        return colorScheme.background;
      case SchemeColor.shadow:
        return colorScheme.background;
      case SchemeColor.inverseSurface:
        return colorScheme.onInverseSurface;
      case SchemeColor.onInverseSurface:
        return colorScheme.inverseSurface;
      case SchemeColor.inversePrimary:
        return colorScheme.primary;
    }
  }

  /// An opinionated [TextButtonThemeData] theme.
  ///
  /// Requires a [ColorScheme], the color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The adjustable button corner [radius] defaults to 20. This is the new
  /// default in M3, Flutter SDK M2 defaults to 4.
  static TextButtonThemeData textButtonTheme({
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
    /// Defaults to `kButtonRadius` = 20.
    final double? radius,

    /// Padding for the button theme.
    ///
    /// Defaults to null and uses `styleFrom` constructors default padding.
    ///
    /// M3 has more horizontal padding 24dp, but the tighter default padding
    /// in M2 that is 16dp looks fine as well when using stadium borders
    /// as in M3.
    /// Making the custom scalable padding and separate one for icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// Defaults to `kButtonMinSize` = Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) {
    // Get selected color, defaults to primary.
    final Color baseColor = baseSchemeColor == null
        ? colorScheme.primary
        : schemeColor(baseSchemeColor, colorScheme);

    return TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: minButtonSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kButtonRadius),
          ),
        ), // buttonShape,
        padding: padding,
      ).copyWith(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return baseColor
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledForegroundAlpha);
            }
            return baseColor;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return baseColor.withAlpha(kHoverBackgroundAlpha);
            }
            if (states.contains(MaterialState.focused)) {
              return baseColor.withAlpha(kFocusBackgroundAlpha);
            }
            if (states.contains(MaterialState.pressed)) {
              return baseColor.withAlpha(kPressedBackgroundAlpha);
            }
            return Colors.transparent;
          },
        ),
      ),
    );
  }

  /// An opinionated [ElevatedButtonThemeData] theme.
  ///
  /// Requires a [ColorScheme] in [colorscheme]. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The button [elevation] defaults to 1 [kElevatedButtonElevation], making
  /// the elevated button a bit more flat. Flutter SDK ElevatedButton
  /// defaults to elevation 2.
  ///
  /// The adjustable button corner [radius] defaults to 20. This is the new
  /// default in M3, Flutter SDK M2 defaults to 4.
  static ElevatedButtonThemeData elevatedButtonTheme({
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
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// The button elevation
    ///
    /// Defaults to [kElevatedButtonElevation] 1, making it a bit more flat in
    /// its elevation state than Flutter SDK, that defaults to 2.
    /// An opinionated choice.
    final double elevation = kElevatedButtonElevation,

    /// Padding for the button theme.
    ///
    /// Defaults to null and uses `styleFrom` constructors default padding.
    ///
    /// M3 has more horizontal padding 24dp, but the tighter default padding
    /// in M2 that is 16dp looks fine as well when using stadium borders
    /// as in M3.
    /// Making the custom scalable padding and separate one for icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// Defaults to `kButtonMinSize` = Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) {
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    final Color onBaseColor = schemeColorPair(baseScheme, colorScheme);

    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: minButtonSize,
        padding: padding,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kButtonRadius),
          ),
        ), //buttonShape,
      ).copyWith(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return baseColor
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledForegroundAlpha);
            }
            return onBaseColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return baseColor
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledBackgroundAlpha);
            }
            return baseColor;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return onBaseColor.withAlpha(kHoverBackgroundAlpha);
            }
            if (states.contains(MaterialState.focused)) {
              return onBaseColor.withAlpha(kFocusBackgroundAlpha);
            }
            if (states.contains(MaterialState.pressed)) {
              return onBaseColor.withAlpha(kPressedBackgroundAlpha);
            }
            return Colors.transparent;
          },
        ),
      ),
    );
  }

  /// An opinionated [OutlinedButtonThemeData] theme.
  ///
  /// Requires a [ColorScheme]. The color scheme would typically be equal the
  /// color scheme also used to define the color scheme for your app theme.
  ///
  /// The adjustable button corner [radius] defaults to 20. This is the new
  /// default in M3, Flutter SDK M2 defaults to 4.
  static OutlinedButtonThemeData outlinedButtonTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the main
    /// color for the button.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.primary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The button corner border radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// The outline thickness when the button is pressed.
    ///
    /// Defaults to 2.0.
    final double pressedOutlineWidth = kThickBorderWidth,

    /// The outline thickness when the button is not selected and not pressed.
    ///
    /// Defaults to 1.5.
    final double outlineWidth = kThinBorderWidth,

    /// Padding for the button theme.
    ///
    /// Defaults to null and uses `styleFrom` constructors default padding.
    ///
    /// M3 has more horizontal padding 24dp, but the tighter default padding
    /// in M2 that is 16dp looks fine as well when using stadium borders
    /// as in M3.
    /// Making the custom scalable padding and separate one for icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// Defaults to `kButtonMinSize` = Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) {
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    // final Color onBaseColor = schemeColorPair(baseScheme, colorScheme);

    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: minButtonSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kButtonRadius),
          ),
        ), //buttonShape,
        padding: padding,
      ).copyWith(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return baseColor
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledForegroundAlpha);
            }
            return baseColor;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return baseColor.withAlpha(kHoverBackgroundAlpha);
            }
            if (states.contains(MaterialState.focused)) {
              return baseColor.withAlpha(kFocusBackgroundAlpha);
            }
            if (states.contains(MaterialState.pressed)) {
              return baseColor.withAlpha(kPressedBackgroundAlpha);
            }
            return Colors.transparent;
          },
        ),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (final Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(
                color: baseColor
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha),
                width: outlineWidth,
              );
            }
            if (states.contains(MaterialState.error)) {
              return BorderSide(
                color: colorScheme.error,
                width: pressedOutlineWidth,
              );
            }
            if (states.contains(MaterialState.pressed)) {
              return BorderSide(
                color: baseColor,
                width: pressedOutlineWidth,
              );
            }
            return BorderSide(
              color: baseColor.withAlpha(kEnabledBorderAlpha),
              width: outlineWidth,
            );
          },
        ),
      ),
    );
  }

  /// An opinionated [ButtonThemeData] theme.
  ///
  /// This theme is used to provide the same opinionated theme and style on
  /// the deprecated buttons `RaisedButton`, `OutlineButtons` and `FlatButton`.
  /// Button theme has more limited theming capability and cannot match
  /// the Material style buttons fully, this is an approximation.
  ///
  /// The adjustable button corner [radius] defaults to 20. This is the new
  /// default in M3, Flutter SDK M2 defaults to 4.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is used to make the buttons match the padding on the newer buttons.
  ///
  /// The above legacy buttons this sub theme is primary for, will be completely
  /// removed in Flutter stable version after 2.10.x. The [ButtonThemeData]
  /// this helper uses will however remain available after that, because widgets
  /// [ButtonBar] and [DropdownButton], plus [MaterialButton] (marked as
  /// obsolete in SDK docs though) still use this theme. It is thus kept around
  /// in FlexColorScheme package as long as it might have some use.
  static ButtonThemeData buttonTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
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
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// Padding for legacy button.
    ///
    /// Defaults to EdgeInsets.symmetric(horizontal: 16).
    /// This makes the legacy buttons same size as default margin on new ones.
    final EdgeInsetsGeometry padding = kButtonPadding,

    /// Minimum button size.
    ///
    /// Defaults to `kButtonMinSize` = Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) {
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);

    return ButtonThemeData(
      colorScheme: colorScheme,
      minWidth: minButtonSize.width,
      height: minButtonSize.height,
      padding: padding,
      layoutBehavior: ButtonBarLayoutBehavior.constrained,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      hoverColor: baseColor
          .blendAlpha(Colors.white, kHoverAlphaBlend)
          .withAlpha(kHoverAlpha),
      focusColor: baseColor
          .blendAlpha(Colors.white, kFocusAlphaBlend)
          .withAlpha(kFocusAlpha),
      highlightColor: baseColor
          .blendAlpha(Colors.white, kHighlightAlphaBlend)
          .withAlpha(kHighlightAlpha),
      splashColor: baseColor
          .blendAlpha(Colors.white, kSplashAlphaBlend)
          .withAlpha(kSplashAlpha),
      disabledColor: baseColor
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledBackgroundAlpha),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kButtonRadius),
        ),
      ),
      textTheme: ButtonTextTheme.primary,
    );
  }

  /// An opinionated [SwitchThemeData] theme.
  ///
  /// Requires a [ColorScheme] in [colorscheme]. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The splashRadius is not used by FlexColorScheme sub-themes.
  static SwitchThemeData switchTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the main
    /// color for the switch.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.secondary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The splash radius of the circular Material ink response.
    ///
    /// Defaults to kRadialReactionRadius = 20.
    final double? splashRadius,

    /// Defines if unselected [Switch] is also themed to be [baseSchemeColor].
    ///
    /// If false, it is grey like in Flutter SDK. Defaults to true.
    final bool unselectedIsColored = true,
  }) {
    // Get selected color, defaults to secondary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.secondary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    final bool isLight = colorScheme.brightness == Brightness.light;

    return SwitchThemeData(
      splashRadius: splashRadius,
      thumbColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
          }
          if (states.contains(MaterialState.selected)) {
            return baseColor;
          }
          return isLight ? Colors.grey.shade50 : Colors.grey.shade400;
        },
      ),
      trackColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return isLight ? Colors.black12 : Colors.white10;
          }
          if (states.contains(MaterialState.selected)) {
            return baseColor.withAlpha(0x70);
          }
          // Opinionated color on track when not selected
          if (unselectedIsColored) {
            return isLight
                ? baseColor.withAlpha(0x30)
                : baseColor.withAlpha(0x25);
          }
          // This is SDK default.
          return isLight ? const Color(0x52000000) : Colors.white30;
        },
      ),
    );
  }

  /// An opinionated [CheckboxThemeData] theme.
  ///
  /// Requires a [ColorScheme] in [colorscheme]. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The splashRadius is not used by FlexColorScheme sub-themes.
  static CheckboxThemeData checkboxTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the main
    /// color for the checkbox.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.secondary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The splash radius of the circular Material ink response.
    ///
    /// Defaults to kRadialReactionRadius = 20.
    final double? splashRadius,

    /// Defines if unselected [Checkbox] is also themed to be [baseSchemeColor].
    ///
    /// If false, it is grey like in Flutter SDK. Defaults to true.
    final bool unselectedIsColored = true,
  }) {
    // Get selected color, defaults to secondary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.secondary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    final Color onBaseColor = schemeColorPair(baseScheme, colorScheme);
    final bool isLight = colorScheme.brightness == Brightness.light;

    return CheckboxThemeData(
      splashRadius: splashRadius,
      checkColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return isLight ? Colors.grey.shade200 : Colors.grey.shade600;
          }
          if (states.contains(MaterialState.selected)) {
            return onBaseColor;
          }
          return isLight ? Colors.grey.shade50 : Colors.grey.shade400;
        },
      ),
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
          }
          if (states.contains(MaterialState.selected)) {
            return baseColor;
          }
          // Opinionated color on unselected checkbox.
          if (unselectedIsColored) {
            return baseColor.withAlpha(0xDD);
          }
          // This is SDK default.
          return isLight ? Colors.black54 : Colors.white70;
        },
      ),
    );
  }

  /// An opinionated [RadioThemeData] theme.
  ///
  /// Requires a [ColorScheme] in [colorscheme]. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The splashRadius is not used by FlexColorScheme sub-themes.
  static RadioThemeData radioTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the main
    /// color for the switch.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.secondary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The splash radius of the circular Material ink response.
    ///
    /// Defaults to kRadialReactionRadius = 20.
    final double? splashRadius,

    /// Defines if unselected [Radio] is also themed to be [baseSchemeColor].
    ///
    /// If false, it is grey like in Flutter SDK. Defaults to true.
    final bool unselectedIsColored = true,
  }) {
    // Get selected color, defaults to secondary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.secondary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    final bool isLight = colorScheme.brightness == Brightness.light;

    return RadioThemeData(
      splashRadius: splashRadius,
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
          }
          if (states.contains(MaterialState.selected)) {
            return baseColor;
          }
          // Opinionated color on unselected checkbox.
          if (unselectedIsColored) {
            return baseColor.withAlpha(0xDD);
          }
          // This is SDK default.
          return isLight ? Colors.black54 : Colors.white70;
        },
      ),
    );
  }

  /// An opinionated [ToggleButtonsThemeData] theme.
  ///
  /// The adjustable button corner [radius] defaults to 20 this is new
  /// default in M3, Flutter SDK M2 defaults to 4.
  ///
  /// Button border width can be adjusted and defaults to same width
  /// as outline thickness on selected outline button and input decorator.
  ///
  /// Unfortunately [ToggleButtons] cannot be themed to have different border
  /// width in disabled mode than enabled mode, like [OutlinedButton] can.
  /// If it is important that the themed border appears similar to the disabled
  /// border width, then keep the thin and thick outlined borders same or
  /// reasonably close to each other.
  static ToggleButtonsThemeData toggleButtonsTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the main
    /// color for the toggle buttons.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.primary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The button corner radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// The width of the borders around the toggle buttons.
    ///
    /// In this design it uses the same default as outline thickness for
    /// selected outline button and input decorator.
    ///
    /// Defaults to 1.5.
    final double borderWidth = kThinBorderWidth,

    /// Minimum button size.
    ///
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,

    /// VisualDensity for ToggleButtons.
    ///
    /// The ToggleButtons do not implement VisualDensity from theme, but we can
    /// pass in what we use in ThemeData and adjust its size accordingly.
    ///
    /// You should pass in the same visual density that you set on your
    /// Theme to the ToggleButtons to make them keep the same size as the
    /// main buttons.
    ///
    /// Defaults to null, that results in VisualDensity.adaptivePlatformDensity
    /// being used, which is same as null default in ThemeData.
    final VisualDensity? visualDensity,
  }) {
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    final Color onBaseColor = schemeColorPair(baseScheme, colorScheme);

    final VisualDensity usedVisualDensity =
        visualDensity ?? VisualDensity.adaptivePlatformDensity;
    return ToggleButtonsThemeData(
      borderWidth: borderWidth,
      selectedColor: onBaseColor.withAlpha(kSelectedAlpha),
      color: baseColor,
      fillColor: baseColor.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
      borderColor: baseColor.withAlpha(kEnabledBorderAlpha),
      selectedBorderColor:
          baseColor.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
      hoverColor: baseColor
          .blendAlpha(Colors.white, kHoverAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kHoverAlpha),
      focusColor: baseColor
          .blendAlpha(Colors.white, kFocusAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kFocusAlpha),
      highlightColor: baseColor
          .blendAlpha(
              Colors.white, kHighlightAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kHighlightAlpha),
      splashColor: baseColor
          .blendAlpha(Colors.white, kSplashAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kSplashAlpha),
      disabledColor: baseColor
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledForegroundAlpha),
      disabledBorderColor: baseColor
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledBackgroundAlpha),
      borderRadius: BorderRadius.circular(radius ?? kButtonRadius),
      constraints: BoxConstraints(
        // ToggleButtons draws its border outside its constraints, the
        // ShapeBorder on ElevatedButton, OutlinedButton and TextButton keep
        // their border inside its size constraints, to make ToggleButtons
        // same sized, we must adjust the min size shared constraint with
        // the border width for every side as well as make the VisualDensity
        // adjustment that the other buttons do via Theme automatically
        // based on theme setting, to do so this theme can accept a
        // VisualDensity property. Give it the same value that your theme
        // uses, defaults to same value that ThemeData default.
        minWidth: minButtonSize.width -
            borderWidth * 2 +
            usedVisualDensity.baseSizeAdjustment.dx,
        minHeight: minButtonSize.height -
            borderWidth * 2 +
            usedVisualDensity.baseSizeAdjustment.dy,
      ),
    );
  }

  /// An opinionated [OutlineInputBorder] or [UnderlineInputBorder] using
  /// [InputDecorationTheme], with optional fill color and adjustable
  /// corner radius.
  ///
  /// Requires a [ColorScheme] in [colorScheme]. The color
  /// scheme would typically be equal the color scheme also used to define the
  /// color scheme for your app theme.
  ///
  /// Its corner [radius] can be adjusted, it defaults to [kButtonRadius] (20).
  static InputDecorationTheme inputDecorationTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use for the border
    /// and fill color of the input decorator.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.primary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The button corner radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// Selects input border type.
    ///
    /// Defaults to [FlexInputBorderType.outline].
    final FlexInputBorderType borderType = FlexInputBorderType.outline,

    /// If true the decoration's container is filled with [fillColor].
    ///
    /// Typically this field set to true if [border] is an
    /// [UnderlineInputBorder].
    ///
    /// The decoration's container is the area, defined by the border's
    /// [InputBorder.getOuterPath], which is filled if [filled] is
    /// true and bordered per the [border].
    ///
    /// Defaults to true.
    final bool filled = true,

    /// An optional totally custom fill color used to fill the
    /// `InputDecorator` background with, when `filled` is true.
    ///
    /// If null, defaults to color scheme color defined by `baseColor`
    /// withAlpha(0x0D) (5%) if color scheme is light and withAlpha(0x14) (8%)
    /// if color scheme is dark.
    final Color? fillColor,

    /// The border width when the input is selected.
    ///
    /// Defaults to 2.0.
    final double focusedBorderWidth = kThickBorderWidth,

    /// The border width when the input is unselected or disabled.
    ///
    /// Defaults to 1.5.
    final double unfocusedBorderWidth = kThinBorderWidth,

    /// Horizontal padding on either side of the border's
    /// [InputDecoration.labelText] width gap.
    ///
    /// Defaults to 4, which is also the default in SDK default input decorator.
    final double gapPadding = 4,

    /// Unfocused input decoration has a border.
    ///
    /// Defaults to true.
    ///
    /// Applies to both outline and underline mode. You would typically
    /// use this in a design where you use a fill color and want unfocused
    /// input fields to only be highlighted by the fill color and not even
    /// have an unfocused input border style.
    ///
    /// When set to false, there is no border bored on states enabledBorder and
    /// disabledBorder, there is a border on focusedBorder, focusedErrorBorder
    /// and errorBorder, so error thus has a border also when it is not focused.
    final bool unfocusedHasBorder = true,
  }) {
    // Get selected color, defaults to primary.
    final Color baseColor = baseSchemeColor == null
        ? colorScheme.primary
        : schemeColor(baseSchemeColor, colorScheme);

    final Color usedFillColor = fillColor ??
        (colorScheme.brightness == Brightness.dark
            ? baseColor.withAlpha(kFillColorAlphaDark)
            : baseColor.withAlpha(kFillColorAlphaLight));

    switch (borderType) {
      case FlexInputBorderType.outline:
        return InputDecorationTheme(
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.error) &&
                states.contains(MaterialState.focused)) {
              return TextStyle(color: colorScheme.error);
            }
            if (states.contains(MaterialState.error)) {
              return TextStyle(
                color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              );
            }
            if (states.contains(MaterialState.disabled)) {
              return TextStyle(
                color: baseColor
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha),
              );
            }
            return TextStyle(color: baseColor);
          }),
          filled: filled,
          fillColor: usedFillColor,
          hoverColor: baseColor.withAlpha(kHoverBackgroundAlpha),
          focusColor: baseColor.withAlpha(kFocusBackgroundAlpha),
          focusedBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: baseColor,
              width: focusedBorderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: baseColor.withAlpha(kEnabledBorderAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: baseColor
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: focusedBorderWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              width: unfocusedBorderWidth,
            ),
          ),
        );
      case FlexInputBorderType.underline:
        return InputDecorationTheme(
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.error) &&
                states.contains(MaterialState.focused)) {
              return TextStyle(color: colorScheme.error);
            }
            if (states.contains(MaterialState.error)) {
              return TextStyle(
                color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              );
            }
            if (states.contains(MaterialState.disabled)) {
              return TextStyle(
                color: baseColor
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha),
              );
            }
            return TextStyle(color: baseColor);
          }),
          filled: filled,
          fillColor: usedFillColor,
          hoverColor: baseColor.withAlpha(kHoverBackgroundAlpha),
          focusColor: baseColor.withAlpha(kFocusBackgroundAlpha),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: baseColor,
              width: focusedBorderWidth,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: baseColor.withAlpha(kEnabledBorderAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: baseColor
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: focusedBorderWidth,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              width: unfocusedBorderWidth,
            ),
          ),
        );
    }
  }

  /// An opinionated [FloatingActionButtonThemeData] with custom border radius.
  ///
  /// The border radius defaults to [kDefaultRadius] = 16, the new M3 default.
  /// https://m3.material.io/components/floating-action-button/specs
  ///
  /// By setting [useShape] to false, it is possible to opt out of all
  /// shape theming on FABs and keep their M2 defaults, while still eg.
  /// keeping M3 defaults on other widgets or changing their border radius
  /// with the shared global value.
  ///
  /// You may want to continue to keep the FAB circular and extended FAB stadium
  /// (pill) shaped as before, despite otherwise using a rounder or M3 design.
  /// The circular M2 FAB goes well with those designs too and is more familiar.
  static FloatingActionButtonThemeData floatingActionButtonTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    ///
    /// Unlike most other sub-themes that can use a passed in [ColorScheme],
    /// this one is optional. If not provided, the FABs default themed
    /// foreground and background colors are used. If a [colorScheme] is given,
    /// the color to use as FAB background color can be selected with the
    /// [backgroundSchemeColor] parameter.
    ///
    /// The optional colorScheme and its behavior was used to keep the API of
    /// this function backwards compatible with previous versions.
    final ColorScheme? colorScheme,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the floating action button background color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, or if passed in [colorScheme] is null, then
    /// [theme.colorScheme.secondary] will be used via FAB widget's default
    /// un-themed color behavior.
    ///
    /// The foreground color automatically uses the selected background
    /// color's contrast color pair in the passed in [colorScheme] property.
    final SchemeColor? backgroundSchemeColor,

    /// Corner radius of FAB.
    ///
    /// Defaults to [kDefaultRadius] = 16.
    final double? radius,

    /// Set to false, to not apply Shape theming to the FAB.
    ///
    /// If set to false, the Shape property will be kept null, regardless
    /// of what border radius was given. This results in that the FAB
    /// using fab theme data, will use and implement its SDK default
    /// shape behavior.
    final bool useShape = true,
  }) {
    final Color? background = colorScheme == null
        ? null
        : backgroundSchemeColor == null
            ? null
            : schemeColor(backgroundSchemeColor, colorScheme);
    final Color? foreground = background == null ||
            colorScheme == null ||
            backgroundSchemeColor == null
        ? null
        : schemeColorPair(backgroundSchemeColor, colorScheme);
    return FloatingActionButtonThemeData(
      foregroundColor: foreground,
      backgroundColor: background,
      shape: useShape
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? kDefaultRadius),
              ),
            )
          : null,
    );
  }

  /// An opinionated [ChipThemeData] with custom border radius and rather
  /// involved theme.
  ///
  /// The border radius default to 16 [kDefaultRadius], new M3 default.
  /// https://m3.material.io/components/floating-action-button/specs
  ///
  /// This is inspired by M3 Chip design and applies it to the limited theming
  /// features for old M2 chips, to some extent. Tricky to get this one
  /// to play nicely, but this setup is pretty ok and fits well with the
  /// color blended themes.
  ///
  /// It is possible that there will be new Chips entirely for
  /// Material 3. This theme brings the M2 Chips look closer to M3 design, but
  /// cannot reach all the way.
  static ChipThemeData chipTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Select which color from the passed in [ColorScheme] to use as the
    /// chip themes main color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.primary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The style to be applied to the chip's label.
    ///
    /// This only has an effect on label widgets that respect the
    /// [DefaultTextStyle], such as [Text].
    required TextStyle labelStyle,

    /// Corner radius of the Chip.
    ///
    /// Defaults to [kChipRadius] = 8, M3 defaults for Chips.
    final double? radius,
  }) {
    // Get base color, defaults to primary.
    final Color usedBaseColor = baseSchemeColor == null
        ? colorScheme.primary
        : schemeColor(baseSchemeColor, colorScheme);

    // For all Chips  except disabled Chip.
    final Color foreground = usedBaseColor.blendAlpha(
        colorScheme.onSurface, kChipForegroundAlphaBlend);
    // For selected InputChip & ChoiceChip.
    final Color selectedBackgroundColor = usedBaseColor.blendAlpha(
        colorScheme.surface, kChipSelectedBackgroundAlphaBlend);
    // Text color, uses the foreground color for all chip style.
    final TextStyle effectiveLabelStyle =
        labelStyle.copyWith(color: foreground);

    return ChipThemeData(
      brightness: ThemeData.estimateBrightnessForColor(colorScheme.primary),
      padding: const EdgeInsets.all(4),
      // For all Chip types, except disabled, InputChip & ChoiceChip.
      backgroundColor: usedBaseColor.blendAlpha(
          colorScheme.surface, kChipBackgroundAlphaBlend),
      selectedColor: selectedBackgroundColor, // Selected InputChip
      secondarySelectedColor: selectedBackgroundColor, // Selected ChoiceChip
      checkmarkColor: foreground,
      deleteIconColor: usedBaseColor,
      // Same formula as on Elevated button and ToggleButtons. The Chip has
      // a built in scrim for disabled state, making it look a bit different
      // but it is pretty close.
      disabledColor: usedBaseColor
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledBackgroundAlpha),
      // Same label style on selected and not selected chips, their different
      // background style make the stand out enough.
      labelStyle: effectiveLabelStyle,
      secondaryLabelStyle: effectiveLabelStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kChipRadius),
        ),
      ),
    );
  }

  /// An opinionated [CardTheme] with custom corner radius and elevation.
  ///
  /// Corner [radius] defaults to [kCardRadius] = 12 and [elevation]
  /// defaults to [kCardElevation] = 0.
  ///
  /// The corner radius 12 is the new default on Cards in M3:
  /// https://m3.material.io/components/cards/specs
  static CardTheme cardTheme({
    /// Corner radius
    ///
    /// Defaults to [kCardRadius] = 12, M3 defaults for Cards.
    final double? radius,

    /// Card elevation defaults to [kCardElevation] = 0.
    final double elevation = kCardElevation,

    /// The clipBehaviour of the card theme, defaults to
    /// [Clip.antiAlias] for smooth clipping when using rounded corners.
    ///
    /// There is no config property in [FlexSubThemesData] for [clipBehavior],
    /// if needed it can be exposed. Feel free to make a PR or submit an issue.
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      CardTheme(
        clipBehavior: clipBehavior,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kCardRadius),
          ),
        ),
      );

  /// An opinionated [PopupMenuThemeData] with custom corner radius.
  ///
  /// Corner [radius] defaults to [kPopupRadius] (10) and [elevation] to
  /// [kPopupMenuElevation] (2), Flutter SDK default is (8).
  ///
  /// When used by [FlexColorScheme] the corner radius of popup menus follows
  /// the global [FlexSubThemeData.defaultRadius] if defined, until and
  /// including 10 dp. After which it stays at 10 dp. If you need a higher
  /// corner radius on popup menus than 10 dp, with [FlexColorScheme]
  /// you will have to explicitly override
  /// [FlexSubThemeData.popupMenuRadius].
  ///
  /// It will not look very good when it is
  /// over 10dp. The highlight inside the menu will start to overflow the
  /// corners and is not clipped along the border radius. The underlying Widget
  /// is not designed with this high border rounding in mind. This makes sense
  /// since it does not look good with too much rounding on a small menu.
  ///
  /// The built-in behavior in FlexColorScheme allows it to match at low
  /// inherited radius values from [FlexSubThemeData.defaultRadius] but to
  /// also stay below the usable max rounding automatically at higher global
  /// border radius values.
  ///
  /// The default corner radius in M3 is not yet known, it might be 12  like
  /// on Card, but with current behaviour on popup menu Overlay in Flutter
  /// using 12 was not on option, 10 was the highest value that still worked
  /// OK visually with regards to highlighted item not be clipped on top and
  /// bottom choice.
  static PopupMenuThemeData popupMenuTheme({
    /// Popup menu corner radius.
    ///
    /// Defaults to [kPopupRadius] 10.
    final double? radius,

    /// Popup menu elevation defaults to 3, making it more subtle.
    final double elevation = kPopupMenuElevation,

    /// The background color of the popup menu.
    final Color? color,
  }) =>
      PopupMenuThemeData(
        elevation: elevation,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kPopupRadius),
          ),
        ),
      );

  // TODO(rydmike): Consider for Slider value popup background primary blend.

  // TODO(rydmike): Dialog content has no padding property, add when supported.
  //  The M3 guide https://m3.material.io/components/dialogs/specs specs 24 dp

  /// An opinionated [DialogTheme] with custom corner radius and elevation.
  ///
  /// Corner [radius] defaults to [kDialogRadius] = 28 and [elevation] to
  /// [kDialogElevation] = 10.
  ///
  /// The default radius follows Material M3 guide:
  /// https://m3.material.io/components/dialogs/specs
  static DialogTheme dialogTheme({
    /// Dialog background color.
    ///
    /// Defaults to null and gets default via Dialog's default null theme
    /// behavior.
    ///
    /// This property is here so we can provide a custom themed dialog
    /// background color when the ThemeData property dialogBackgroundColor
    /// is deprecated in Flutter SDK, which it will be in 2022, see issue:
    /// https://github.com/flutter/flutter/issues/91772
    final Color? backgroundColor,

    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    final ColorScheme? colorScheme,

    /// Selects which color from the passed in [colorScheme] to use as
    /// dialog background color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined or [colorScheme] is not defined, then the passed in
    /// [backgroundColor] will be used, which may be null too and dialog then
    /// falls back to Flutter SDK dialog background color
    /// [ThemeData.dialogBackgroundColor] which is [ColorScheme.background].
    ///
    /// FlexColorScheme uses this property via [FlexSubThemesData] and defines
    /// its default as [SchemeColor.surface].
    final SchemeColor? backgroundSchemeColor,

    /// Corner radius.
    ///
    /// Defaults to [kDialogRadius] = 28.
    final double? radius,

    /// Dialog elevation defaults to 10 [kDialogElevation].
    final double? elevation = kDialogElevation,
  }) {
    final Color? background =
        (colorScheme == null || backgroundSchemeColor == null)
            ? backgroundColor // might be null, then SDK theme defaults.
            : schemeColor(backgroundSchemeColor, colorScheme);

    return DialogTheme(
      elevation: elevation,
      backgroundColor: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kDialogRadius),
        ),
      ),
    );
  }

  /// An opinionated [TimePickerThemeData] with custom corner radius.
  ///
  /// Corner [radius] defaults to [kDialogRadius]. The internal shapes
  /// in the picker also have rounding, their corner radii are defined by
  /// [elementRadius] that defaults to [kCardRadius] 12.
  ///
  /// In the InputDecorator, if you pass it an input decoration style
  /// that matches the main input decoration style and corner rounding it
  /// will be used on the data entry elements in the picker.
  static TimePickerThemeData timePickerTheme({
    /// Pass the value the `theme.dialogColor` that is set to your `ThemeData`
    /// and used by other dialogs.
    ///
    /// If null and [colorScheme] and [backgroundSchemeColor] are also not
    /// defined, this dialog defaults to using [ColorScheme.surface] color and
    /// it may not match dialog color used by other dialogs that use
    /// [ColorScheme.background] by default, this is a peculiar default behavior
    /// in Flutter SDK.
    final Color? backgroundColor,

    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    final ColorScheme? colorScheme,

    /// Selects which color from the passed in colorScheme to use as the dialog
    /// background color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined or [colorScheme] is not defined, then the passed in
    /// [backgroundColor] will be used, which may be null too and dialog then
    /// falls back to Flutter SDK value for TimePickerDialog, which is
    /// [colorScheme.surface].
    ///
    /// FlexColorScheme sub-theming uses this property to match the background
    /// color of this dialog to other standard dialogs. It sets it via
    /// [FlexSubThemesData] to [SchemeColor.background].
    final SchemeColor? backgroundSchemeColor,

    /// Outer corner radius.
    ///
    /// Defaults to [kDialogRadius] = 28.
    final double? radius,

    /// Elements corner radius.
    ///
    /// Defaults to [kCardRadius] = 12.
    final double? elementRadius,

    /// An input decoration theme, for the time picker.
    ///
    /// You would typically pass in one that matches the main used input
    /// decoration theme in order to get same input style with possible
    /// rounding used in the app otherwise on the input fields in the picker.
    ///
    /// It adds the custom overrides to the passed in decorator, that the widget
    /// does internally to the default null InputDecorationTheme. There is
    /// no need to add those in the passed in InputDecorationTheme. Just pass
    /// in your overall used app InputDecorationTheme.
    final InputDecorationTheme? inputDecorationTheme,
  }) {
    final Color? background =
        (colorScheme == null || backgroundSchemeColor == null)
            ? backgroundColor // might be null, then SDK theme defaults.
            : schemeColor(backgroundSchemeColor, colorScheme);

    return TimePickerThemeData(
      backgroundColor: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kDialogRadius),
        ),
      ),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(elementRadius ?? kCardRadius),
        ),
      ),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(elementRadius ?? kCardRadius),
        ),
      ),
      // Custom additions the Widget does internally, but for some reason
      // only does to null default theme. If you use a custom decorator
      // you are supposed to know that you have to add these shenanigans
      // for it to work and look right.
      inputDecorationTheme: inputDecorationTheme?.copyWith(
            contentPadding: EdgeInsets.zero,
            // Prevent the error text from appearing.
            // See https://github.com/flutter/flutter/issues/54104
            errorStyle: const TextStyle(fontSize: 0, height: 0),
          ) ??
          const InputDecorationTheme().copyWith(
            contentPadding: EdgeInsets.zero,
            // Prevent the error text from appearing.
            // See https://github.com/flutter/flutter/issues/54104
            errorStyle: const TextStyle(fontSize: 0, height: 0),
          ),
    );
  }

  // TODO(rydmike): SnackBar needs two different corner radius versions.
  //   The pinned one should not have a shape, but the floating one should.
  //   Not possible to do via its theme, if it could be then the floating one
  //   should follow the themed corner radius setting and pinned one
  //   remain straight. The SnackBar implements different shapes for its
  //   enum based [SnackBarBehavior], but only if [Shape] property is null:
  //     If null, [SnackBar] provides different defaults depending on the
  //     [SnackBarBehavior]. For [SnackBarBehavior.fixed], no overriding shape
  //     is specified, so the [SnackBar] is rectangular. For
  //     [SnackBarBehavior.floating], it uses a [RoundedRectangleBorder] with a
  //     circular corner radius of 4.0.
  //   Maybe open an issue about the limitation that corner radius on none
  //   pinned one cannot be changed via theme while keeping straight one
  //   straight. However, I think M3 will need it too, so it will come then.

  /// An opinionated [SnackBarThemeData] with custom elevation.
  ///
  /// Its [elevation] defaults to [kSnackBarElevation] (4).
  static SnackBarThemeData snackBarTheme({
    /// SnackBar elevation defaults to [kSnackBarElevation] 4.
    final double? elevation = kSnackBarElevation,

    // TODO(rydmike): SnackBar to use ColorScheme.inverseSurface in M3 schemes.
    //   For now keeping FlexColorScheme own dark primary as snackbar color.

    /// Default value for [backgroundColor].
    ///
    /// If null, [SnackBar] defaults to dark grey: `Color(0xFF323232)`, via
    /// M2 Flutter SDK defaults.
    ///
    /// FlexColorScheme sets a dark primary tinted color instead when it uses
    /// this helper.
    final Color? backgroundColor,
  }) =>
      SnackBarThemeData(
        elevation: elevation,
        backgroundColor: backgroundColor,
      );

  /// An opinionated [BottomSheetThemeData] with custom top corner
  /// radius.
  ///
  /// Corner [radius] defaults to [kDefaultRadius] = 16, [elevation] to
  /// [kBottomSheetElevation] = 4 and [modalElevation] to
  /// [kBottomSheetModalElevation] = 8.
  static BottomSheetThemeData bottomSheetTheme({
    /// The corner radius defaults to 16 for the top corners.
    final double? radius,

    /// The bottom sheet elevation defaults to [kBottomSheetElevation] = 4.
    final double elevation = kBottomSheetElevation,

    /// The bottom sheet elevation defaults to [kBottomSheetModalElevation] = 8.
    final double modalElevation = kBottomSheetModalElevation,

    /// The clipBehaviour of the bottom sheet theme, defaults to
    /// [Clip.antiAlias] for smoother clipping when using rounded corners.
    ///
    /// This property is not available in [FlexSubThemeData] but you can use
    /// it if you otherwise use this as theme helper.
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      BottomSheetThemeData(
        clipBehavior: clipBehavior,
        elevation: elevation,
        modalElevation: modalElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius ?? kDefaultRadius),
            topRight: Radius.circular(radius ?? kDefaultRadius),
          ),
        ),
      );

  /// An opinionated [BottomNavigationBarThemeData] with custom elevation.
  ///
  /// This sub-theme uses a style that prefers single use config parameters over
  /// the ones that combines many styling options into TextStyle and icon
  /// sub-theme properties. This is simpler to use when you want to just
  /// modify a single property like size and rest is fine. This is done of
  /// course at the expense that the sub-theme instead has a lot of properties.
  ///
  /// Its [elevation] defaults to [kBottomNavigationBarElevation] = 0.
  ///
  /// The bottom navigation bar uses opinionated colors choices from the passed
  /// [colorScheme] to style the bottom navigation bar.
  ///
  /// Background [opacity] can be set. Unselected items' color, that is
  /// background based, can receive a variable blend of primary color using
  /// the [unselectedAlphaBlend] property.
  static BottomNavigationBarThemeData bottomNavigationBar({
    /// Typically you would pass the same [ColorScheme] that is also used in
    /// your [ThemeData] definition.
    required final ColorScheme colorScheme,

    /// Optional text style for the [BottomNavigationBar] labels.
    ///
    /// If null, it is kept as null if all text styling properties are
    /// also null, resulting in default SDK text style being used by the
    /// [BottomNavigationBar] widget.
    ///
    /// If null, but if any of the text styling properties for size and colors
    /// are defined a default TextStyle() is created that will get the
    /// effective sizes and colors applied. This optional TextStyle is useful
    /// when you want to apply a custom font or adjust letter spacing and
    /// baseline.
    ///
    /// FlexColorScheme uses [TextTheme.bodyMedium] as its base text style,
    /// which has size 14dp.
    /// The size is first controlled by the label size
    /// parameters if provided. If not provided, it uses the text style font
    /// size, if font size  has no size, selected item defaults to 14dp, and
    /// unselected items, defaults to 12dp as fallback values.
    ///
    /// The size and colors defined in any of the text size and color properties
    /// are applied as overrides on the effective text style.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected [BottomNavigationBar] item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item, 14 is used as fallback if needed.
    final double? selectedLabelSize,

    /// The size of the text label on unselected [BottomNavigationBar] items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on unselected items, defaults to [selectedLabelSize] - 2, but min 8.
    /// Smaller than 8dp is not legible on most screens.
    ///
    /// [BottomNavigationBar] uses this -2dp smaller font on the unselected
    /// label as default, since it is so based on Material 2 spec. By assigning
    /// same value as to selectedLabelSize, you can make them the same size.
    final double? unselectedLabelSize,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [BottomNavigationBar]'s label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, defaults to using [Theme]'s [ColorScheme.primary] via the
    /// [BottomNavigationBar]'s default un-themed behavior.
    ///
    /// FlexColorScheme will use [SchemeColor.primary] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? selectedLabelSchemeColor,

    /// Deprecated and replaced by [selectedLabelSchemeColor].
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'selectedLabelSchemeColor.')
        final SchemeColor? baseSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use for
    /// the [BottomNavigationBar]'s unselected items text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, defaults to using [Theme]'s [ColorScheme.onSurface] via the
    /// [NavigationRail]'s default un-themed behavior.
    ///
    /// FlexColorScheme will use [SchemeColor.onSurface] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? unselectedLabelSchemeColor,

    /// If true, the unselected labels in the [BottomNavigationBar] use a
    /// more muted color version of the color defined by
    /// [unselectedLabelSchemeColor].
    ///
    /// If null, defaults to false.
    final bool? mutedUnselectedLabel,

    /// The size of the icon on selected [BottomNavigationBar] item.
    ///
    /// If null, it defaults to 24.
    final double? selectedIconSize,

    /// The size of the icons on unselected [BottomNavigationBar] items.
    ///
    /// If null, defaults to [selectedIconSize].
    final double? unselectedIconSize,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [BottomNavigationBar]'s icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, effective result is [Theme]'s [ColorScheme.primary],
    /// like Flutter SDK default for this widget.
    ///
    /// FlexColorScheme will use [SchemeColor.primary] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? selectedIconSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [BottomNavigationBar]'s unselected items icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, effective result is [Theme]'s [ColorScheme.onSurface],
    /// like Flutter SDK default for this widget.
    ///
    /// FlexColorScheme will use [SchemeColor.onSurface] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? unselectedIconSchemeColor,

    /// If true, the unselected icon in the [BottomNavigationBar] use a more
    /// muted color version of the color defined by [iconSchemeColor].
    ///
    /// The [BottomNavigationBar] also defaults via Flutter SDK default to a
    /// more muted unselected color when it uses its defaults, which will happen
    /// here too when all item colors and sizes are set to their null default,
    /// even if [mutedUnselectedIcon] is set to false.
    ///
    /// If null, defaults to false.
    final bool? mutedUnselectedIcon,

    /// Select which color from the passed in [ColorScheme] to use as background
    /// color for the [BottomNavigationBar].
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// Defaults to null, if null the resulting background color defaults
    /// to Flutter SDK default which is [ColorScheme.surface].
    ///
    /// FlexColorScheme will use [SchemeColor.background] via
    /// [FlexSubThemesData] property default.
    ///
    /// NOTE:
    /// FlexColorScheme sets background defaults of [NavigationRail],
    /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
    /// when it is using component sub-themes.
    /// Flutter SDK uses different colors on all three widgets. Our opinion is
    /// that they should all default to using the same [ColorScheme] based
    /// color. FlexColorScheme uses the background color as that default.
    final SchemeColor? backgroundSchemeColor,

    /// BottomNavigationBar background opacity.
    ///
    /// The opacity value is only applied when a none null value is selected
    /// in [backgroundSchemeColor], it cannot be applied to the default
    /// Flutter SDK background color available when backgroundSchemeColor is
    /// null.
    ///
    /// Defaults to 1, fully opaque.
    final double opacity = 1,

    /// [BottomNavigationBar] container elevation.
    ///
    /// Defaults to [kBottomNavigationBarElevation] = 0.
    final double elevation = kBottomNavigationBarElevation,

    /// Whether the labels are shown for the selected
    /// [BottomNavigationBarItem].
    final bool? showSelectedLabels,

    /// Whether the labels are shown for the unselected
    /// [BottomNavigationBarItem]s.
    final bool? showUnselectedLabels,

    /// Defines the layout and behavior of a [BottomNavigationBar].
    ///
    /// With [BottomNavigationBarType.fixed] the items have fixed width.
    /// With [BottomNavigationBarType.shifting], the location and size of the
    /// items animate and labels fade in when they are tapped.
    final BottomNavigationBarType? type,

    /// The arrangement of the bar's [items] when the enclosing
    /// [MediaQueryData.orientation] is [Orientation.landscape].
    ///
    /// The following alternatives are supported:
    ///
    /// * [BottomNavigationBarLandscapeLayout.spread] - the items are
    ///   evenly spaced and spread out across the available width. Each
    ///   item's label and icon are arranged in a column.
    /// * [BottomNavigationBarLandscapeLayout.centered] - the items are
    ///   evenly spaced in a row but only consume as much width as they
    ///   would in portrait orientation. The row of items is centered within
    ///   the available width. Each item's label and icon are arranged
    ///   in a column.
    /// * [BottomNavigationBarLandscapeLayout.linear] - the items are
    ///   evenly spaced and each item's icon and label are lined up in a
    ///   row instead of a column.
    ///
    /// Defaults to [BottomNavigationBarLandscapeLayout.spread] via
    /// Widget's default un-themed behavior.
    final BottomNavigationBarLandscapeLayout? landscapeLayout,

    /// The icon color alpha blend value for unselected items, used on icon when
    /// [mutedUnselectedIcon] is true and on label when
    /// [mutedUnselectedLabel] is true.
    ///
    /// Defaults to [kUnselectedBackgroundPrimaryAlphaBlend], which is
    /// 0x66 = 102 = 40%.
    ///
    /// This setting is not exposed via [FlexSubThemesData], but can be if
    /// needed later.
    final int unselectedAlphaBlend = kUnselectedBackgroundPrimaryAlphaBlend,

    /// The icon alpha value for unselected item, used on icon when
    /// [mutedUnselectedIcon] is true and on label when
    /// [mutedUnselectedLabel] is true.
    ///
    /// Defaults to [kUnselectedAlphaBlend], which is
    /// 0xA5 = 165 = 65%
    ///
    /// This setting is not exposed via [FlexSubThemesData], but can be if
    /// needed later.
    final int unselectedAlpha = kUnselectedAlphaBlend,
  }) {
    // Get text color, defaults to primary.
    final Color labelColor = selectedLabelSchemeColor == null
        ? colorScheme.primary
        : schemeColor(selectedLabelSchemeColor, colorScheme);

    // Get unselected label color, defaults to onSurface.
    final Color unselectedLabelColor = unselectedLabelSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(unselectedLabelSchemeColor, colorScheme);

    // Get selected text style, defaults to TextStyle(), we can use it since
    // size and color are applied to is separately.
    final TextStyle textStyle = labelTextStyle ?? const TextStyle();

    // Get effective text sizes.
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 14;
    // If not specified, unselected is label size us 2dp smaller than selected,
    // but always at least 8dp.
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? math.max(labelSize - 2, 8);

    // Determine if we should use a custom text style at all, if all text
    // modifier props are null, we should fall back to widget defaults.
    final bool useTextStyle = labelTextStyle != null ||
        selectedLabelSize != null ||
        unselectedLabelSize != null ||
        selectedLabelSchemeColor != null ||
        unselectedLabelSchemeColor != null ||
        (mutedUnselectedLabel ?? false);

    // Get icon color, defaults to primary.
    final Color iconColor = selectedIconSchemeColor == null
        ? colorScheme.primary
        : schemeColor(selectedIconSchemeColor, colorScheme);

    // Get unselected icon color, defaults to onSurface.
    final Color unselectedIconColor = unselectedIconSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(unselectedIconSchemeColor, colorScheme);

    // Get effective icons sizes.
    final double iconSize = selectedIconSize ?? 24;
    final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

    // Determine if we should use a custom icon theme at all, if these props
    // are null, we should not and just fall back to widget defaults.
    final bool useIconTheme = selectedIconSize != null ||
        unselectedIconSize != null ||
        selectedIconSchemeColor != null ||
        unselectedIconSchemeColor != null ||
        (mutedUnselectedIcon ?? false);

    return BottomNavigationBarThemeData(
      backgroundColor: backgroundSchemeColor != null
          ? schemeColor(backgroundSchemeColor, colorScheme).withOpacity(opacity)
          : null,
      elevation: elevation,
      unselectedIconTheme: useIconTheme
          ? IconThemeData(
              size: effectiveUnselectedIconSize,
              opacity: 1,
              color: (mutedUnselectedIcon ?? false)
                  ? unselectedIconColor
                      .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                      .withAlpha(unselectedAlpha)
                  : unselectedIconColor,
            )
          : null,
      selectedIconTheme: useIconTheme
          ? IconThemeData(
              size: iconSize,
              opacity: 1,
              color: iconColor,
            )
          : null,
      selectedItemColor: useTextStyle ? labelColor : null,
      unselectedItemColor: useTextStyle
          ? (mutedUnselectedLabel ?? false)
              ? unselectedLabelColor
                  .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                  .withAlpha(unselectedAlpha)
              : unselectedLabelColor
          : null,
      unselectedLabelStyle: useTextStyle
          ? textStyle.copyWith(
              fontSize: effectiveUnselectedLabelSize,
              color: (mutedUnselectedLabel ?? false)
                  ? unselectedLabelColor
                      .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                      .withAlpha(unselectedAlpha)
                  : unselectedLabelColor,
            )
          : null,
      selectedLabelStyle: useTextStyle
          ? textStyle.copyWith(
              fontSize: labelSize,
              color: labelColor,
            )
          : null,
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      type: type,
      landscapeLayout: landscapeLayout,
    );
  }

  /// An opinionated [NavigationBarThemeData] with simpler API.
  ///
  /// The navigation bar can use opinionated color choices from the passed
  /// [colorScheme] to style the bottom navigation bar, it uses "quick"
  /// settings not requiring usage of MaterialState property resolutions.
  ///
  /// This sub-theme uses a style that prefers single use config parameters over
  /// the ones that combines many styling options into sub-themes and
  /// MaterialState properties. This is simpler to use when you want to just
  /// modify a single property like size and rest is fine. This is done of
  /// course at the expense that the sub-theme instead has a lot of properties.
  ///
  /// [FlexColorScheme] uses this sub theme based on a large number of
  /// properties in [FlexSubThemesData] to make custom default styled sub-theme
  /// that matches its other themes, it can also use a config that uses the
  /// M3 defaults as starting point. In both cases override values can
  /// be applied as well.
  ///
  /// You can also use the sub-theme helper as an alternative API for creating
  /// a custom sub-theme for [NavigationBarThemeData] as it does not need
  /// the complicated [MaterialStateProperty] which can be difficult to use. It
  /// instead exposes properties for the usable states.
  ///
  /// It can also set an [opacity] on the background color.
  static NavigationBarThemeData navigationBarTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Optional text style for the [NavigationBar] labels.
    ///
    /// If null, it is kept as null if all text styling properties are
    /// also null, resulting in default SDK text style being used by the
    /// [NavigationBar] widget.
    ///
    /// If null, but if any of the text styling properties for size and colors
    /// are defined a default TextStyle() is created that will get the
    /// effective sizes and colors applied. This optional TextStyle is useful
    /// when you want to apply a custom font or adjust letter spacing and
    /// baseline.
    ///
    /// Flutter SDK defaults to using the [Theme]'s [TextTheme.overline] which
    /// is size 10dp. FlexColorScheme uses [TextTheme.labelSmall], which
    /// has size 11dp, which is a more appropriate size for the text.
    /// The size is first controlled by the label size
    /// parameters if provided. If not provided, it uses the text style font
    /// size, if font size has no size, it defaults to 14dp.
    /// The text style provides the font and letter spacing.
    ///
    /// The size and colors defined in any of the text size and color properties
    /// are applied as overrides on the effective text style.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected [NavigationBar] item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item, 11 is used as fallback if needed.
    final double? selectedLabelSize,

    /// The size of the text label on unselected [NavigationBar] items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on unselected items, default to [selectedLabelSize].
    final double? unselectedLabelSize,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [NavigationBar]'s label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, defaults to using [Theme]'s [ColorScheme.onSurface] via the
    /// [NavigationRail]'s default un-themed behavior.
    ///
    /// FlexColorScheme will use [SchemeColor.primary] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? selectedLabelSchemeColor,

    /// Deprecated and replaced by [selectedLabelSchemeColor].
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'selectedLabelSchemeColor.')
        final SchemeColor? textSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [NavigationBar]'s label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, defaults to using [Theme]'s [ColorScheme.onSurface] via the
    /// [NavigationBar]'s default un-themed behavior.
    ///
    /// FlexColorScheme will use [SchemeColor.onSurface] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? unselectedLabelSchemeColor,

    /// Deprecated and replaced by [unselectedLabelSchemeColor].
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'unselectedLabelSchemeColor.')
        final SchemeColor? unselectedTextSchemeColor,

    /// If true, the unselected labels in the [NavigationBar] use a more muted
    /// color version of the color defined by [unselectedLabelSchemeColor].
    ///
    /// If null, defaults to false.
    final bool? mutedUnselectedLabel,

    /// Deprecated and replaced by [mutedUnselectedLabel].
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'mutedUnselectedLabel.')
        final bool? mutedUnselectedText,

    /// The size of the icon on selected [NavigationBar] item.
    ///
    /// If null, it defaults to 24.
    final double? selectedIconSize,

    /// The size of the icons on unselected [NavigationBar] items.
    ///
    /// If null, defaults to [selectedIconSize].
    final double? unselectedIconSize,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [NavigationBar]'s icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, defaults to using [Theme]'s [ColorScheme.onSurface], like SDK.
    ///
    /// FlexColorScheme will use [SchemeColor.primary] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? selectedIconSchemeColor,

    /// Deprecated and replaced by [selectedIconSchemeColor].
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'selectedIconSchemeColor.')
        final SchemeColor? iconSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [NavigationBar]'s unselected items icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, defaults to [Theme]'s [ColorScheme.onSurface], like SDK.
    ///
    /// FlexColorScheme will use [SchemeColor.onSurface] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? unselectedIconSchemeColor,

    /// If true, the unselected icon in the [NavigationBar] use a more muted
    /// color version of the color defined by [iconSchemeColor].
    ///
    /// If null, defaults to false.
    final bool? mutedUnselectedIcon,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the selected [NavigationBar]'s highlighted item highlight color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined it defaults to using secondary color via [NavigationBar]
    /// widgets default highlight color.
    ///
    /// FlexColorScheme will use [SchemeColor.primary] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? highlightSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as background
    /// color for the navigation bar.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// Defaults to null, if null the result is [NavigationBar]'s default
    /// background which is surface color with a hard coded elevation overlay
    /// color of elevation 3 in both light and dark theme mode.
    ///
    /// FlexColorScheme will use [SchemeColor.background] via
    /// [FlexSubThemesData] property default.
    ///
    /// NOTE:
    /// FlexColorScheme sets background defaults of [NavigationRail],
    /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
    /// when it is using component sub-themes.
    /// Flutter SDK uses different colors on all three widgets. Our opinion is
    /// that they should all default to using the same [ColorScheme] based
    /// color. FlexColorScheme uses the background color as that default.
    final SchemeColor? backgroundSchemeColor,

    /// NavigationBar background opacity.
    ///
    /// The opacity value is only applied when a none null value is selected
    /// in [backgroundSchemeColor], it cannot be applied to the default
    /// Flutter SDK background color available when backgroundSchemeColor is
    /// null.
    ///
    /// Defaults to 1, fully opaque.
    final double opacity = 1,

    /// NavigationBar height.
    ///
    /// If null, defaults to 80 dp via widget default height design.
    ///
    /// The styled opinionated reduced height is kNavigationBarHeight = 62 dp
    /// which is assigned by FlexColorScheme when it makes th style theme.
    final double? height,

    /// Specifies when each [NavigationDestination]'s label should appear.
    ///
    /// This is used to determine the behavior of NavigationBar's destinations.
    ///
    /// If null, theme behavior defaults to
    /// `NavigationDestinationLabelBehavior.alwaysShow`
    final NavigationDestinationLabelBehavior? labelBehavior,

    /// The alpha value used on selection color of the selection indicator on
    /// the [NavigationBar].
    ///
    /// Defaults to [kNavigationBarIndicatorAlpha], which is 0x3D = 61 = 24%.
    ///
    /// The default is the same value as Widget SDK default behavior uses on its
    /// used secondary color on its indicator color on the [NavigationBar].
    ///
    /// This setting is not exposed via [FlexSubThemesData], but can be if
    /// needed later.
    final int indicatorAlpha = kNavigationBarIndicatorAlpha,

    /// The icon color alpha blend value for unselected items, used on icon when
    /// [mutedUnselectedIcon] is true and on label when
    /// [mutedUnselectedLabel] is true.
    ///
    /// Defaults to [kUnselectedBackgroundPrimaryAlphaBlend], which is
    /// 0x66 = 102 = 40%.
    ///
    /// This setting is not exposed via [FlexSubThemesData], but can be if
    /// needed later.
    final int unselectedAlphaBlend = kUnselectedBackgroundPrimaryAlphaBlend,

    /// The icon alpha value for unselected item, used on icon when
    /// [mutedUnselectedIcon] is true and on label when
    /// [mutedUnselectedLabel] is true.
    ///
    /// Defaults to [kUnselectedAlphaBlend], which is
    /// 0xA5 = 165 = 65%
    ///
    /// This setting is not exposed via [FlexSubThemesData], but can be if
    /// needed later.
    final int unselectedAlpha = kUnselectedAlphaBlend,
  }) {
    // Get text color, defaults to onSurface.
    final Color labelColor = selectedLabelSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(selectedLabelSchemeColor, colorScheme);

    // Get unselected label color, defaults to colorScheme.onSurface
    final Color unselectedLabelColor = unselectedLabelSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(unselectedLabelSchemeColor, colorScheme);

    // Get text style, defaults to TextStyle(), we can use it since
    // size and color are applied to is separately.
    final TextStyle textStyle = labelTextStyle ?? const TextStyle();

    // Get effective text sizes.
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 11;
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? labelSize;

    // Determine if we should use a custom text style at all, if these props
    // are null, we should not and just fall back to widget defaults.
    final bool useTextStyle = labelTextStyle != null ||
        selectedLabelSize != null ||
        unselectedLabelSize != null ||
        selectedLabelSchemeColor != null ||
        unselectedLabelSchemeColor != null ||
        (mutedUnselectedLabel ?? false);

    // Get icon color, default to onSurface.
    final Color iconColor = selectedIconSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(selectedIconSchemeColor, colorScheme);

    // Get unselected icon color, defaults to onSurface.
    final Color unselectedIconColor = unselectedIconSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(unselectedIconSchemeColor, colorScheme);

    // Get effective icons sizes.
    final double iconSize = selectedIconSize ?? 24;
    final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

    // Determine if we should use a custom icon theme at all, if these props
    // are null, we should not and just fall back to widget defaults.
    final bool useIconTheme = selectedIconSize != null ||
        unselectedIconSize != null ||
        selectedIconSchemeColor != null ||
        unselectedIconSchemeColor != null ||
        (mutedUnselectedIcon ?? false);

    return NavigationBarThemeData(
      height: height,
      backgroundColor: backgroundSchemeColor != null
          ? schemeColor(backgroundSchemeColor, colorScheme).withOpacity(opacity)
          : null,
      indicatorColor: highlightSchemeColor != null
          ? schemeColor(highlightSchemeColor, colorScheme)
              .withAlpha(indicatorAlpha)
          : null,
      labelTextStyle: useTextStyle
          ? MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return textStyle.copyWith(
                    fontSize: labelSize,
                    color: labelColor,
                  );
                }
                return textStyle.copyWith(
                  fontSize: effectiveUnselectedLabelSize,
                  color: (mutedUnselectedLabel ?? false)
                      ? unselectedLabelColor
                          .blendAlpha(
                              unselectedLabelColor, unselectedAlphaBlend)
                          .withAlpha(unselectedAlpha)
                      : unselectedLabelColor,
                );
              },
            )
          : null,
      iconTheme: useIconTheme
          ? MaterialStateProperty.resolveWith<IconThemeData>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return IconThemeData(
                    size: iconSize,
                    color: iconColor,
                  );
                }
                return IconThemeData(
                  size: effectiveUnselectedIconSize,
                  color: (mutedUnselectedIcon ?? false)
                      ? unselectedIconColor
                          .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                          .withAlpha(unselectedAlpha)
                      : unselectedIconColor,
                );
              },
            )
          : null,
      labelBehavior: labelBehavior,
    );
  }

  /// An opinionated [NavigationRailThemeData] with simpler API.
  ///
  /// The navigation rail can use opinionated color choices from the passed
  /// [colorScheme] to style the navigation rail.
  ///
  /// This sub-theme uses a style that prefers single use config parameters over
  /// the ones that combines many styling options into TextStyle and icon
  /// sub-theme properties. This is simpler to use when you want to just
  /// modify a single property like size and rest is fine. This is done of
  /// course at the expense that the sub-theme instead has a lot of properties.
  ///
  /// [FlexColorScheme] uses this sub theme based on a large number of
  /// properties in [FlexSubThemesData] to make custom default styled sub-theme
  /// that matches its other themes.
  ///
  /// You can also use the sub-theme helper as an alternative API for creating
  /// a custom sub-theme for [NavigationRailThemeData].
  /// It can also set an [opacity] on the background color, although the use
  /// case for it is not as common as on bottom navigation bars.
  static NavigationRailThemeData navigationRailTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Optional text style for the [NavigationRail] labels.
    ///
    /// If null, it is kept as null if all text styling properties are
    /// also null, resulting in default SDK text style being used by the
    /// [NavigationRail] widget.
    ///
    /// If null, but if any of the text styling properties for size and colors
    /// are defined a default TextStyle() is created that will get the
    /// effective sizes and colors applied. This optional TextStyle is useful
    /// when you want to apply a custom font or adjust letter spacing and
    /// baseline.
    ///
    /// Flutter SDK defaults to using the [Theme]'s [TextTheme.bodyText1] which
    /// is size 16dp. FlexColorScheme uses bodyMedium, which has size 14dp,
    /// which is a more appropriate size for the rail's text.
    /// The size is first controlled by the label size
    /// parameters if provided. If not provided, it uses the text style font
    /// size, if font size  has no size, it defaults to 14dp.
    ///
    /// The size and colors defined in any of the text size and color properties
    /// are applied as overrides on the effective text style.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected [NavigationRail] item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item, 14 is used as fallback if needed.
    final double? selectedLabelSize,

    /// The size of the text label on unselected [NavigationRail] items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on unselected items, default to [selectedLabelSize].
    final double? unselectedLabelSize,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [NavigationRail]'s label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, defaults to using [Theme]'s [ColorScheme.primary] via the
    /// [NavigationRail]'s default un-themed behavior.
    ///
    /// FlexColorScheme will use [SchemeColor.primary] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? selectedLabelSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use for
    /// the [NavigationRail]'s unselected items text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, defaults to using [Theme]'s [ColorScheme.onSurface] via the
    /// [NavigationRail]'s default un-themed behavior.
    ///
    /// FlexColorScheme will use [SchemeColor.onSurface] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? unselectedLabelSchemeColor,

    /// If true, the unselected labels in the [NavigationRail] use a more muted
    /// color version of the color defined by [unselectedLabelSchemeColor].
    ///
    /// If null, defaults to false.
    final bool? mutedUnselectedLabel,

    /// The size of the icon on selected [NavigationRail] item.
    ///
    /// If null, it defaults to 24.
    final double? selectedIconSize,

    /// The size of the icons on unselected [NavigationRail] items.
    ///
    /// If null, defaults to [selectedIconSize].
    final double? unselectedIconSize,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [NavigationRail]'s icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, effective result is [Theme]'s [ColorScheme.primary],
    /// like Flutter SDK default for this widget.
    ///
    /// FlexColorScheme will use [SchemeColor.primary] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? selectedIconSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [NavigationRail]'s unselected items icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, effective result is [Theme]'s [ColorScheme.onSurface],
    /// like Flutter SDK default for this widget.
    ///
    /// FlexColorScheme will use [SchemeColor.onSurface] via [FlexSubThemesData]
    /// property default.
    final SchemeColor? unselectedIconSchemeColor,

    /// If true, the unselected icon in the [NavigationRail] use a more muted
    /// color version of the color defined by [iconSchemeColor].
    ///
    /// The [NavigationRail] also defaults via Flutter SDK default to a more
    /// muted unselected color when it uses its defaults, which will happen here
    /// too when all item colors and sizes are set to their null default,
    /// even if [mutedUnselectedIcon] is set to false.
    ///
    /// If null, defaults to false.
    final bool? mutedUnselectedIcon,

    /// Whether or not the selected [NavigationRail] item should include a
    /// [NavigationIndicator].
    ///
    /// If `true`, adds a rounded [NavigationIndicator] behind the selected
    /// destination's icon.
    ///
    /// The indicator's shape will be circular if [labelType] is
    /// [NavigationRailLabelType.none], or a [StadiumBorder] if [labelType] is
    /// [NavigationRailLabelType.all] or [NavigationRailLabelType.selected].
    ///
    /// If `null`, defaults to [NavigationRailThemeData.useIndicator]. If that
    /// is `null`, defaults to [ThemeData.useMaterial3].
    ///
    /// Defaults to true in FlexColorScheme. Can be set to null and then uses
    /// above default widget behavior.
    final bool? useIndicator,

    /// Select which color from the theme [ColorScheme] to use as base for
    /// the selected [NavigationRail]'s highlighted item's pill shaped indicator
    /// color.
    ///
    /// If not defined it defaults to using [ColorScheme.secondary] color via
    /// [NavigationRail]'s default indicator color behavior.
    ///
    /// FlexColorScheme will via [FlexSubThemesData] default it to
    /// [ColorScheme.primary] by using [SchemeColor.primary] as its default
    /// value here.
    final SchemeColor? indicatorSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as background
    /// color for the [NavigationRail].
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// Defaults to null, if null the resulting background color defaults
    /// to Flutter SDK default which is [ColorScheme.surface].
    ///
    /// FlexColorScheme will use [SchemeColor.background] via
    /// [FlexSubThemesData] property default.
    ///
    /// NOTE:
    /// FlexColorScheme sets background defaults of [NavigationRail],
    /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
    /// when it is using component sub-themes.
    /// Flutter SDK uses different colors on all three widgets. Our opinion is
    /// that they should all default to using the same [ColorScheme] based
    /// color. FlexColorScheme uses the background color as that default.
    final SchemeColor? backgroundSchemeColor,

    /// [NavigationRail] background opacity.
    ///
    /// The opacity value is only applied when a none null value is selected
    /// in [backgroundSchemeColor], it cannot be applied to the default
    /// Flutter SDK background color available when backgroundSchemeColor is
    /// null.
    ///
    /// Defaults to 1, fully opaque.
    final double opacity = 1,

    /// [NavigationRail] elevation.
    ///
    /// Defaults to [kNavigationRailElevation] = 0.
    final double elevation = kNavigationRailElevation,

    /// Defines the layout and behavior of the labels for the
    /// un-extended [NavigationRail].
    ///
    /// The type are:
    ///
    /// * [NavigationRailLabelType.none] labels on rail items are never shown.
    /// * [NavigationRailLabelType.selected] label is only shown on selected
    ///   rail item.
    /// * [NavigationRailLabelType.all] label is shown on all rail items.
    ///
    /// When a navigation rail is [extended], the labels are always shown.
    ///
    /// If null, then the default behavior [NavigationRailLabelType.none].
    ///
    /// FlexColorScheme uses [NavigationRailLabelType.all] as default when it
    /// uses this sub-theme.
    final NavigationRailLabelType? labelType,

    /// The vertical alignment for the group of [destinations] within the
    /// [NavigationRail].
    ///
    /// The [NavigationRailDestination]s are grouped together with the
    /// [trailing] widget, between the [leading] widget and the bottom
    /// of the rail.
    ///
    /// The value must be between -1.0 and 1.0.
    ///
    /// If [groupAlignment] is -1.0, then the items are aligned to the top. If
    /// [groupAlignment] is 0.0, then the items are aligned to the center. If
    /// [groupAlignment] is 1.0, then the items are aligned to the bottom.
    ///
    /// The default is -1.0.
    final double? groupAlignment,

    /// The alpha value used on selection color of the selection indicator on
    /// the [NavigationRail].
    ///
    /// Defaults to [kNavigationBarIndicatorAlpha], which is 0x3D = 61 = 24%.
    ///
    /// The default is the same value as Widget SDK default behavior uses on its
    /// used secondary color on its indicator color on the [NavigationBar],
    /// here we use same value on the [NavigationRail].
    ///
    /// This setting is not exposed via [FlexSubThemesData], but can be if
    /// needed later.
    final int indicatorAlpha = kNavigationBarIndicatorAlpha,

    /// The icon color alpha blend value for unselected items, used on icon when
    /// [mutedUnselectedIcon] is true and on label when
    /// [mutedUnselectedLabel] is true.
    ///
    /// Defaults to [kUnselectedBackgroundPrimaryAlphaBlend], which is
    /// 0x66 = 102 = 40%.
    ///
    /// This setting is not exposed via [FlexSubThemesData], but can be if
    /// needed later.
    final int unselectedAlphaBlend = kUnselectedBackgroundPrimaryAlphaBlend,

    /// The icon alpha value for unselected item, used on icon when
    /// [mutedUnselectedIcon] is true and on label when
    /// [mutedUnselectedLabel] is true.
    ///
    /// Defaults to [kUnselectedAlphaBlend], which is
    /// 0xA5 = 165 = 65%
    ///
    /// This setting is not exposed via [FlexSubThemesData], but can be if
    /// needed later.
    final int unselectedAlpha = kUnselectedAlphaBlend,

    /// A temporary flag used to opt-in to new Material 3 features.
    ///
    /// If true, then components that have been migrated to Material 3 will
    /// start using new colors, typography and other features of Material 3.
    /// If false, they will use the Material 2 look and feel.
    ///
    /// Currently no components have been migrated to support Material 3.
    /// As they are updated to include Material 3 support this documentation
    /// will be modified to indicate exactly what widgets this flag will affect.
    ///
    /// During the migration to Material 3, turning this on may yield
    /// inconsistent look and feel in your app. Some components will be migrated
    /// before others and typography changes will be coming in stages.
    ///
    /// [useMaterial3] defaults to false. After all the migrated components
    /// have landed on stable, we will change this to be true by default. After
    /// that change has landed on stable, we will deprecate this flag and remove
    /// all uses of it. Everything will use the Material 3 look and feel at
    /// that point.
    final bool useMaterial3 = false,
  }) {
    // Get text color, defaults to primary.
    final Color labelColor = selectedLabelSchemeColor == null
        ? colorScheme.primary
        : schemeColor(selectedLabelSchemeColor, colorScheme);

    // Get unselected label color, defaults to onSurface.
    final Color unselectedLabelColor = unselectedLabelSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(unselectedLabelSchemeColor, colorScheme);

    // Get text style, defaults to TextStyle(), we can use it since
    // size and color are applied to is separately.
    final TextStyle textStyle = labelTextStyle ?? const TextStyle();

    // Get effective text sizes.
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 14;
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? labelSize;

    // Determine if we should use a custom text style at all, if all text
    // modifier props are null, we should fall back to widget defaults.
    final bool useTextStyle = labelTextStyle != null ||
        selectedLabelSize != null ||
        unselectedLabelSize != null ||
        selectedLabelSchemeColor != null ||
        unselectedLabelSchemeColor != null ||
        (mutedUnselectedLabel ?? false);

    // Get icon color, defaults to primary.
    final Color iconColor = selectedIconSchemeColor == null
        ? colorScheme.primary
        : schemeColor(selectedIconSchemeColor, colorScheme);

    // Get unselected icon color, defaults to onSurface.
    final Color unselectedIconColor = unselectedIconSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(unselectedIconSchemeColor, colorScheme);

    // Get effective icons sizes.
    final double iconSize = selectedIconSize ?? 24;
    final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

    // Determine if we should use a custom icon theme at all, if these props
    // are null, we should not and just fall back to widget defaults.
    final bool useIconTheme = selectedIconSize != null ||
        unselectedIconSize != null ||
        selectedIconSchemeColor != null ||
        unselectedIconSchemeColor != null ||
        (mutedUnselectedIcon ?? false);

    // Effective indicator color.
    final Color effectiveIndicatorColor =
        schemeColor(indicatorSchemeColor ?? SchemeColor.secondary, colorScheme)
            .withAlpha(indicatorAlpha);

    // Effective usage value for indicator.
    final bool effectiveUseIndicator =
        (useMaterial3 && useIndicator == null) || (useIndicator ?? false);

    // Property order here as in NavigationRailThemeData
    return NavigationRailThemeData(
      backgroundColor: backgroundSchemeColor != null
          ? schemeColor(backgroundSchemeColor, colorScheme).withOpacity(opacity)
          : null,
      elevation: elevation,
      unselectedLabelTextStyle: useTextStyle
          ? textStyle.copyWith(
              fontSize: effectiveUnselectedLabelSize,
              color: (mutedUnselectedLabel ?? false)
                  ? unselectedLabelColor
                      .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                      .withAlpha(unselectedAlpha)
                  : unselectedLabelColor,
            )
          : null,
      selectedLabelTextStyle: useTextStyle
          ? textStyle.copyWith(
              fontSize: labelSize,
              color: labelColor,
            )
          : null,
      unselectedIconTheme: useIconTheme
          ? IconThemeData(
              size: effectiveUnselectedIconSize,
              opacity: 1,
              color: (mutedUnselectedIcon ?? false)
                  ? unselectedIconColor
                      .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                      .withAlpha(unselectedAlpha)
                  : unselectedIconColor,
            )
          : null,
      selectedIconTheme: useIconTheme
          ? IconThemeData(
              size: iconSize,
              opacity: 1,
              color: iconColor,
            )
          : null,
      groupAlignment: groupAlignment,
      labelType: labelType,
      // Logic to avoid SDKs over eager asserts and get same result.
      useIndicator: true,
      indicatorColor: effectiveUseIndicator
          ? effectiveIndicatorColor
          : Colors.black.withAlpha(0x00),
    );
  }
}
