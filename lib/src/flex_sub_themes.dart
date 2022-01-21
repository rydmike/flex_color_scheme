import 'package:flex_color_scheme/flex_color_scheme.dart';
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
/// from the corresponding Widget's SDK default un-themed color behavior.
///
/// The enum selection [primaryVariant] and [secondaryVariant] colors might be
/// best to avoid since they will deprecated in Flutter SDK soon and replaced
/// with new Material 3 based color properties. All the new color properties in
/// the new M3 based [ColorScheme] will be added when they reach the
/// Flutter stable channel.
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

  /// The active theme's color scheme primaryVariant color will be used.
  primaryVariant,

  /// The active theme's color scheme secondary color will be used.
  secondary,

  /// The active theme's color scheme onSecondary color will be used.
  onSecondary,

  /// The active theme's color scheme secondaryVariant color will be used.
  secondaryVariant,

  /// The active theme's color scheme surface color will be used.
  surface,

  /// The active theme's color scheme  onSurface color will be used.
  onSurface,

  /// The active theme's color scheme background color will be used.
  background,

  /// The active theme's color scheme onBackground color will be used.
  onBackground,

  /// The active theme's color scheme error color will be used.
  error,

  /// The active theme's color scheme onError color will be used.
  onError,
}

/// Static sub-theme helpers used by opt-in widget sub theming
/// in [FlexColorScheme].
///
/// FlexSubTheme offers opinionated static theme helpers that are opt-in via
/// [FlexColorScheme.subThemesOptIn]. You can also change many properties of the
/// the opt-in setup by defining custom configuration values in the
/// [FlexSubThemesData] configuration class, and passing it to the
/// [FlexColorScheme.flexThemesData] property.
///
/// The configuration class [FlexSubThemesData] offers easy to use configuration
/// properties for using these sub-themes in FlexColorScheme. You can also use
/// the static sub-themes without using FlexColorScheme based theming,
/// however the [FlexSubThemesData] has no impact on the static helpers, it
/// is [FlexColorScheme] that uses the [FlexSubThemesData] class to configure
/// the opt in sub-themes. You can of course also do this if you use
/// [FlexSubThemesData] outside of [FlexColorScheme] or in copyWith on each
/// sub-theme with custom [ThemeData].
///
/// Sub themes for the following widgets are provided and used via opt-in
/// flag [useSubThemes] in [FlexColorScheme] :
///
/// * [TextButton]
/// * [ElevatedButton]
/// * [OutlinedButton]
/// * Older buttons using [ButtonThemeData]
/// * [ToggleButtons]
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
/// * [Drawer] should have 16dp default rounding on shown side edge, but in
///   current version of Flutter SDK (2.8.1) it has no theme property to enable
///   this. It is coming in later Flutter version since it is requird by the
///   Material 3 design. When it is available, it will be added.
class FlexSubThemes {
  /// Private constructor for the FlexSubThemes static class to prevent it from
  /// being instantiated or extended.
  FlexSubThemes._(); // coverage:ignore-line

  // TODO(rydmike): Add M3 ColorScheme colors when they reach stable.
  /// Returns the [Color] from passed in [ColorScheme] in [colorScheme]
  /// corresponding to the [SchemeColor] enum selection in [value].
  ///
  /// This function is used to select a none default color available in the
  /// theme's [ColorScheme] in opinionated sub-themes:
  ///
  /// - [TextField] in [FlexSubThemes.inputDecorationTheme]
  /// - [TabBar] indicator color
  /// - [BottomNavigationBar] in [FlexSubThemes.bottomNavigationBar]
  /// - [NavigationBar] in [FlexSubThemes.navigationBarTheme]
  /// - [ChipThemeData] from [FlexSubThemes.chipTheme].
  static Color schemeColor(SchemeColor value, ColorScheme colorScheme) {
    switch (value) {
      case SchemeColor.primary:
        return colorScheme.primary;
      case SchemeColor.onPrimary:
        return colorScheme.onPrimary;
      case SchemeColor.primaryVariant:
        return colorScheme.primaryVariant;
      case SchemeColor.secondary:
        return colorScheme.secondary;
      case SchemeColor.onSecondary:
        return colorScheme.onSecondary;
      case SchemeColor.secondaryVariant:
        return colorScheme.secondaryVariant;
      case SchemeColor.surface:
        return colorScheme.surface;
      case SchemeColor.onSurface:
        return colorScheme.onSurface;
      case SchemeColor.background:
        return colorScheme.background;
      case SchemeColor.onBackground:
        return colorScheme.onBackground;
      case SchemeColor.error:
        return colorScheme.error;
      case SchemeColor.onError:
        return colorScheme.onError;
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
      // There is no onColor pair for primaryVariant, we return onPrimary,
      // this issue will go away when primaryVariant is deprecated and
      // replaced with new container color that has a defined onColor pair.
      case SchemeColor.primaryVariant:
        return colorScheme.onPrimary;
      case SchemeColor.secondary:
        return colorScheme.onSecondary;
      case SchemeColor.onSecondary:
        return colorScheme.secondary;
      // There is no onColor pair for secondaryVariant, we return onSecondary,
      // this issue will go away when secondaryVariant is deprecated and
      // replaced with new container color that has a defined onColor pair.
      case SchemeColor.secondaryVariant:
        return colorScheme.onSecondary;
      case SchemeColor.surface:
        return colorScheme.onSurface;
      case SchemeColor.onSurface:
        return colorScheme.surface;
      case SchemeColor.background:
        return colorScheme.onBackground;
      case SchemeColor.onBackground:
        return colorScheme.background;
      case SchemeColor.error:
        return colorScheme.onError;
      case SchemeColor.onError:
        return colorScheme.error;
    }
  }

  /// An opinionated [TextButtonThemeData] theme.
  ///
  /// Requires a `ColorScheme`. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The adjustable button corner [radius] defaults to 20. This is the new
  /// default in M3, Flutter SDK M2 defaults to 4.
  static TextButtonThemeData textButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The button corner radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// Padding for the button theme.
    ///
    /// Defaults to null and uses `styleFrom` default padding.
    ///
    /// M3 has more horizontal padding 24, but this tighter default padding
    /// in M2 with 16dp looks fine as well using stadium borders as in M3.
    /// Making the custom scalable padding and separate one for icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) =>
      TextButtonThemeData(
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
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledForegroundAlpha);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withAlpha(kHoverBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withAlpha(kFocusBackgroundAlpha);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withAlpha(kPressedBackgroundAlpha);
              }
              return Colors.transparent;
            },
          ),
        ),
      );

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
    /// Defaults to null and uses `styleFrom` default padding.
    ///
    /// M3 has more horizontal padding 24, but this tighter default padding
    /// in M2 with 16dp looks fine as well using stadium borders as in M3.
    /// Making the custom scalable padding and separate one for with icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) =>
      ElevatedButtonThemeData(
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
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledForegroundAlpha);
              }
              return colorScheme.onPrimary;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.onPrimary.withAlpha(kHoverBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.onPrimary.withAlpha(kFocusBackgroundAlpha);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.onPrimary.withAlpha(kPressedBackgroundAlpha);
              }
              return Colors.transparent;
            },
          ),
        ),
      );

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
    /// Defaults to null and uses `styleFrom` default padding.
    ///
    /// M3 has more horizontal padding 24, but this tighter default padding
    /// in M2 with 16dp looks fine as well using stadium borders as in M3.
    /// Making the custom scalable padding and separate one for with icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) =>
      OutlinedButtonThemeData(
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
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledForegroundAlpha);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withAlpha(kHoverBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withAlpha(kFocusBackgroundAlpha);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withAlpha(kPressedBackgroundAlpha);
              }
              return Colors.transparent;
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide?>(
            (final Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: colorScheme.primary
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
                  color: colorScheme.primary,
                  width: pressedOutlineWidth,
                );
              }
              return BorderSide(
                color: colorScheme.primary.withAlpha(kEnabledBorderAlpha),
                width: outlineWidth,
              );
            },
          ),
        ),
      );

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
  static ButtonThemeData buttonTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

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
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) =>
      ButtonThemeData(
        colorScheme: colorScheme,
        minWidth: minButtonSize.width,
        height: minButtonSize.height,
        padding: padding,
        layoutBehavior: ButtonBarLayoutBehavior.constrained,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        hoverColor: colorScheme.primary
            .blendAlpha(Colors.white, kHoverAlphaBlend)
            .withAlpha(kHoverAlpha),
        focusColor: colorScheme.primary
            .blendAlpha(Colors.white, kFocusAlphaBlend)
            .withAlpha(kFocusAlpha),
        highlightColor: colorScheme.primary
            .blendAlpha(Colors.white, kHighlightAlphaBlend)
            .withAlpha(kHighlightAlpha),
        splashColor: colorScheme.primary
            .blendAlpha(Colors.white, kSplashAlphaBlend)
            .withAlpha(kSplashAlpha),
        disabledColor: colorScheme.primary
            .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
            .withAlpha(kDisabledBackgroundAlpha),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kButtonRadius),
          ),
        ),
        textTheme: ButtonTextTheme.primary,
      );

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
    final VisualDensity _visualDensity =
        visualDensity ?? VisualDensity.adaptivePlatformDensity;
    return ToggleButtonsThemeData(
      borderWidth: borderWidth,
      selectedColor: colorScheme.onPrimary.withAlpha(kSelectedAlpha),
      color: colorScheme.primary,
      fillColor:
          colorScheme.primary.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
      borderColor: colorScheme.primary.withAlpha(kEnabledBorderAlpha),
      selectedBorderColor:
          colorScheme.primary.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
      hoverColor: colorScheme.primary
          .blendAlpha(Colors.white, kHoverAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kHoverAlpha),
      focusColor: colorScheme.primary
          .blendAlpha(Colors.white, kFocusAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kFocusAlpha),
      highlightColor: colorScheme.primary
          .blendAlpha(
              Colors.white, kHighlightAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kHighlightAlpha),
      splashColor: colorScheme.primary
          .blendAlpha(Colors.white, kSplashAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kSplashAlpha),
      disabledColor: colorScheme.primary
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledForegroundAlpha),
      disabledBorderColor: colorScheme.primary
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
            _visualDensity.baseSizeAdjustment.dx,
        minHeight: minButtonSize.height -
            borderWidth * 2 +
            _visualDensity.baseSizeAdjustment.dy,
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
    final Color _baseColor = baseSchemeColor == null
        ? colorScheme.primary
        : schemeColor(baseSchemeColor, colorScheme);

    final Color _fillColor = fillColor ??
        (colorScheme.brightness == Brightness.dark
            ? _baseColor.withAlpha(kFillColorAlphaDark)
            : _baseColor.withAlpha(kFillColorAlphaLight));

    switch (borderType) {
      case FlexInputBorderType.outline:
        return InputDecorationTheme(
          filled: filled,
          fillColor: _fillColor,
          hoverColor: _baseColor.withAlpha(kHoverBackgroundAlpha),
          focusColor: _baseColor.withAlpha(kFocusBackgroundAlpha),
          focusedBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: _baseColor,
              width: focusedBorderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: _baseColor.withAlpha(kEnabledBorderAlpha),
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
                    color: _baseColor
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
          filled: filled,
          fillColor: _fillColor,
          hoverColor: _baseColor.withAlpha(kHoverBackgroundAlpha),
          focusColor: _baseColor.withAlpha(kFocusBackgroundAlpha),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: _baseColor,
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
                    color: _baseColor.withAlpha(kEnabledBorderAlpha),
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
                    color: _baseColor
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
    /// Corner radius of FAB.
    ///
    /// Defaults to [kDefaultRadius] = 16.
    final double? radius,

    /// Set to false, to not apply Shape theming to the FAB. It will then keep
    /// using its M2 default round shape and stadium shape for extended FAB.
    final bool useShape = true,
  }) =>
      FloatingActionButtonThemeData(
        shape: useShape
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? kDefaultRadius),
                ),
              )
            : null,
      );

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
    final Color _baseColor = baseSchemeColor == null
        ? colorScheme.primary
        : schemeColor(baseSchemeColor, colorScheme);

    // For all Chips  except disabled Chip.
    final Color foreground =
        _baseColor.blendAlpha(colorScheme.onSurface, kChipForegroundAlphaBlend);
    // For selected InputChip & ChoiceChip.
    final Color selectedBackgroundColor = _baseColor.blendAlpha(
        colorScheme.surface, kChipSelectedBackgroundAlphaBlend);
    // Text color, uses the foreground color for all chip style.
    final TextStyle effectiveLabelStyle =
        labelStyle.copyWith(color: foreground);

    return ChipThemeData(
      brightness: ThemeData.estimateBrightnessForColor(colorScheme.primary),
      padding: const EdgeInsets.all(4),
      // For all Chip types, except disabled, InputChip & ChoiceChip.
      backgroundColor:
          _baseColor.blendAlpha(colorScheme.surface, kChipBackgroundAlphaBlend),
      selectedColor: selectedBackgroundColor, // Selected InputChip
      secondarySelectedColor: selectedBackgroundColor, // Selected ChoiceChip
      checkmarkColor: foreground,
      deleteIconColor: _baseColor,
      // Same formula as on Elevated button and ToggleButtons. The Chip has
      // a built in scrim for disabled state, making it look a bit different
      // but it is pretty close.
      disabledColor: _baseColor
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
  //  The M3 guide https://m3.material.io/components/dialogs/specs specs 24 dp

  // TODO(rydmike): Dialog content has no padding property, add when supported.

  /// An opinionated [DialogTheme] with custom corner radius and elevation.
  ///
  /// Corner [radius] defaults to [kDialogRadius] = 28 and [elevation] to
  /// [kDialogElevation] = 10.
  ///
  /// The default radius follows Material M3 guide:
  /// https://m3.material.io/components/dialogs/specs
  static DialogTheme dialogTheme({
    /// Corner radius.
    ///
    /// Defaults to [kDialogRadius] = 28.
    final double? radius,

    /// Dialog elevation defaults to 10 [kDialogElevation].
    final double? elevation = kDialogElevation,

    /// Dialog background color.
    ///
    /// Defaults to null and gets default via Dialog's default null theme
    /// behavior.
    ///
    /// This property is here so we can provide a custom themed dialog
    /// background color when the ThemeData property dialogBackgroundColor
    /// is deprecated in Flutter SDK, which it will be in 2022.
    final Color? backgroundColor,
  }) =>
      DialogTheme(
        elevation: elevation,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kDialogRadius),
          ),
        ),
      );

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
    /// If null, this dialog defaults to using surface color and it may
    /// not match dialogColor used by other dialogs.
    ///
    /// FlexColorScheme sub-theming uses this property to match the background
    /// color to other dialogs.
    final Color? backgroundColor,

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
  }) =>
      TimePickerThemeData(
        backgroundColor: backgroundColor,
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

    /// Default value for [backgroundColor].
    ///
    /// If null, [SnackBar] defaults to dark grey: `Color(0xFF323232)`.
    ///
    /// FlexColorScheme set a dark primary tinted color instead when it uses
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

    /// Select which color from the passed in [ColorScheme] to use as base
    /// for the bottom navigation bar's text and icon.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined it defaults to primary color. This differs from the
    /// BottomNavigationBar's default theme that uses secondary color.
    /// If you use value [FlexUsedColor.secondary] you get the default design.
    final SchemeColor? baseSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as background
    /// color for the bottom navigation bar.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined it defaults to colorScheme.background color, same as
    /// Flutter default theme.
    final SchemeColor? backgroundSchemeColor,

    /// BottomNavigationBar container elevation.
    ///
    /// Defaults to [kBottomNavigationBarElevation] = 0.
    final double elevation = kBottomNavigationBarElevation,

    /// BottomNavigationBar background opacity.
    ///
    /// Default to 1, fully opaque.
    final double opacity = 1,

    /// The onBackground alpha blend value for unselected item.
    ///
    /// Defaults to 0x00, no blend of primary, use onBackground color as is.
    ///
    /// FlexColorScheme uses value [kUnselectedBackgroundPrimaryAlphaBlend]
    /// = 0x66 when it uses this sub theme.
    final int unselectedAlphaBlend = 0x00,

    /// The alpha value for unselected item.
    ///
    /// Defaults to 0xFF, fully opaque.
    ///
    /// FlexColorScheme uses value [kUnselectedAlphaBlend] = 0xA5 when
    /// it uses this sub theme.
    final int unselectedAlpha = 0xFF,

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
    /// Defaults to [BottomNavigationBarLandscapeLayout.spread].
    final BottomNavigationBarLandscapeLayout landscapeLayout =
        BottomNavigationBarLandscapeLayout.spread,
  }) {
    // Get item base color, defaults to primary.
    final Color _baseColor = baseSchemeColor == null
        ? colorScheme.primary
        : schemeColor(baseSchemeColor, colorScheme);
    // Get bottom bar background, defaults to background.
    final Color _backgroundColor = backgroundSchemeColor == null
        ? colorScheme.background
        : schemeColor(backgroundSchemeColor, colorScheme);
    // Get the on color pair for the chosen background color.
    final Color _backgroundOnColor = schemeColorPair(
        backgroundSchemeColor ?? SchemeColor.background, colorScheme);
    return BottomNavigationBarThemeData(
      elevation: elevation,
      backgroundColor: _backgroundColor.withOpacity(opacity),
      landscapeLayout: landscapeLayout,
      selectedItemColor: _baseColor,
      selectedIconTheme: IconThemeData(
        color: _baseColor,
      ),
      unselectedItemColor: _backgroundOnColor
          .blendAlpha(_baseColor, unselectedAlphaBlend)
          .withAlpha(unselectedAlpha),
      unselectedIconTheme: IconThemeData(
        color: _backgroundOnColor
            .blendAlpha(_baseColor, unselectedAlphaBlend)
            .withAlpha(unselectedAlpha),
      ),
    );
  }

  /// An opinionated [NavigationBarThemeData] with simpler API.
  ///
  /// The navigation bar can use opinionated color choices from the passed
  /// [colorScheme] to style the bottom navigation bar.
  ///
  /// [FlexColorScheme] uses this sub theme based on a large number of
  /// properties in [FlexSubThemesData] to make custom default styled sub-theme
  /// that matches its other themes, it can also use a config that uses the
  /// M3 defaults as starting point. In both cases overridden value can
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

    /// Optional text style for the labels without complicated MaterialState.
    ///
    /// If null, it is kept as null if all other text styling properties are
    /// also null, resulting in default built text style being used by the
    /// [NavigationBar] widget.
    ///
    /// If null, but if any of the text styling properties are defined, the text
    /// style [FlexColorScheme.m3TextTheme.overline] will be used as base style
    /// for the sub-theme text style, but with any none null values defined
    /// in labelTextStyle, selectedLabelSize or textSchemeColor applied as
    /// overrides on it. If a labelTextStyle is provided the same overrides
    /// are applied on it.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item.
    final double? selectedLabelSize,

    /// The size of the text label on unselected items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on unselected items.
    final double? unselectedLabelSize,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the navigation bar's text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, it defaults to using onSurface color via default widget
    /// behavior, or sets it to onSurface color if null and other properties
    /// dictate that we need to assign a color to the none null labelTextStyle.
    final SchemeColor? textSchemeColor,

    /// If true, the unselected text in the [NavigationBar] use a more muted
    /// color version of the color defined by [textSchemeColor].
    ///
    /// This feature only works when there is a textSchemeColor defined, if it
    /// is also null, and all other text settings are also null, then setting
    /// this property to true has no effect since it has no color value to
    /// operate on.
    ///
    /// Defaults to false.
    final bool mutedUnselectedText = false,

    /// The size of the text label on selected item.
    ///
    /// If null, it defaults to 24.
    final double? selectedIconSize,

    /// The size of the text label on unselected items.
    ///
    /// If null, it defaults to 24.
    final double? unselectedIconSize,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the navigation bar's icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If null, it defaults to using onSurface color via default widget
    /// behavior, or sets it to onSurface color if null and icon size properties
    /// dictate that we need to assign a color to the iconTheme created.
    final SchemeColor? iconSchemeColor,

    /// If true, the unselected icon in the [NavigationBar] use a more muted
    /// color version of the color defined by [iconSchemeColor].
    ///
    /// This feature only works when there is a iconSchemeColor defined, if it
    /// is also null, and all other all icon size settings are also null,
    /// then setting this property to true has no effect since it has no color
    /// value to operate on.
    ///
    /// Defaults to false.
    final bool mutedUnselectedIcon = false,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the selected navigation bar's highlighted item highlight color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined it defaults to using secondary color via [NavigationBar]
    /// widgets default highlight color.
    final SchemeColor? highlightSchemeColor,

    /// The alpha value used on selection color of the selected indicator.
    ///
    /// Defaults to [kNavigationBarIndicatorAlpha] = 0x3D = 61 = 24%.
    /// The default is the same value as Widget default behavior uses on its
    /// used secondary color on its indicator color.
    final int indicatorAlpha = kNavigationBarIndicatorAlpha,

    /// Select which color from the passed in [ColorScheme] to use as background
    /// color for the navigation bar.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// Defaults to null, if null the result is [NavigationBar]'s default
    /// background which is surface color with a hard coded elevation overlay
    /// color of elevation 3 in both light and dark theme mode.
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

    /// The icon color alpha blend value for unselected item.
    ///
    /// Defaults to 0x00, no blend of unselected color, use color as is.
    ///
    /// FlexColorScheme uses value [kUnselectedBackgroundPrimaryAlphaBlend] when
    /// it uses this sub theme, if defined to use muted unselected icon via
    /// `FlexSubThemesData.navigationBarMutedUnselectedIcon`.
    final int unselectedAlphaBlend = 0x00,

    /// The icon alpha value for unselected item.
    ///
    /// Defaults to 0xFF, fully opaque.
    ///
    /// FlexColorScheme uses value [kUnselectedAlphaBlend] when
    /// it uses this sub theme, if defined to use muted unselected icon via
    /// `FlexSubThemesData.navigationBarMutedUnselectedIcon`.
    final int unselectedAlpha = 0xFF,
  }) {
    // Get text color, defaults to onSurface.
    final Color _textColor = textSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(textSchemeColor, colorScheme);

    // Get selected text style, defaults to FlexColorScheme.m3TextTheme.overline
    // if not defined.
    final TextStyle _textStyle =
        labelTextStyle ?? FlexColorScheme.m3TextTheme.overline!;

    // Get effective text sizes.
    final double _selectedLabelSize =
        selectedLabelSize ?? _textStyle.fontSize ?? 11;
    final double _unselectedLabelSize =
        unselectedLabelSize ?? _textStyle.fontSize ?? 11;

    // Determine if we should use a custom text style at all, if these props
    // are null, we should not and just fall back to widget defaults.
    final bool _useTextStyle = labelTextStyle != null ||
        selectedLabelSize != null ||
        unselectedLabelSize != null ||
        textSchemeColor != null;

    // Get icon color, defaults to onSurface.
    final Color _iconColor = iconSchemeColor == null
        ? colorScheme.onSurface
        : schemeColor(iconSchemeColor, colorScheme);

    // Determine if we should use a custom icon theme at all, if these props
    // are null, we should not and just fall back to widget defaults.
    final bool _useIconTheme = selectedIconSize != null ||
        unselectedIconSize != null ||
        iconSchemeColor != null;

    return NavigationBarThemeData(
      height: height,
      labelBehavior: labelBehavior,
      backgroundColor: backgroundSchemeColor != null
          ? schemeColor(backgroundSchemeColor, colorScheme).withOpacity(opacity)
          : null,
      indicatorColor: highlightSchemeColor != null
          ? schemeColor(highlightSchemeColor, colorScheme)
              .withAlpha(indicatorAlpha)
          : null,
      labelTextStyle: _useTextStyle
          ? MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return _textStyle.copyWith(
                    fontSize: _selectedLabelSize,
                    color: _textColor,
                  );
                }
                return _textStyle.copyWith(
                  fontSize: _unselectedLabelSize,
                  color: mutedUnselectedText
                      ? _textColor
                          .blendAlpha(_textColor, unselectedAlphaBlend)
                          .withAlpha(unselectedAlpha)
                      : _textColor,
                );
              },
            )
          : null,
      iconTheme: _useIconTheme
          ? MaterialStateProperty.resolveWith<IconThemeData>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return IconThemeData(
                    size: selectedIconSize ?? 24,
                    color: _iconColor,
                  );
                }
                return IconThemeData(
                  size: unselectedIconSize ?? 24,
                  color: mutedUnselectedIcon
                      ? _iconColor
                          .blendAlpha(_iconColor, unselectedAlphaBlend)
                          .withAlpha(unselectedAlpha)
                      : _iconColor,
                );
              },
            )
          : null,
    );
  }
}
