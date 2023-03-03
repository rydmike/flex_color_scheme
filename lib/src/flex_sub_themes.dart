import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

/// Enum used to select the type of built-in value indicator used by [Slider].
///
/// The current two options included Material 2 default
/// [RectangularSliderValueIndicatorShape] and Material 3 default
/// [DropSliderValueIndicatorShape].
///
/// This enum is used by [FlexSubThemes.sliderTheme].
enum FlexSliderIndicatorType {
  /// Used to select [RectangularSliderValueIndicatorShape] as value indicator
  /// in [FlexSubThemes.sliderTheme].
  ///
  /// It is a rounded rectangle with talk bubble pointer to slider thumb.
  rectangular,

  /// Used to select [DropSliderValueIndicatorShape] as value indicator
  /// in [FlexSubThemes.sliderTheme].
  ///
  /// It is a like an inverted water drop, or a map pin drop pointing
  /// towards the slider thumb.
  drop,
}

/// Enum used to described which color from the active theme's 30
/// [ColorScheme] colors, should be used for by color properties available in
/// component sub-themes.
///
/// Used when opting in on component themes. The opinionated component themes
/// typically have one or more properties called `nnnSchemeColor`. Where
/// `nnn` describes the color feature that can be set to a none default
/// [ColorScheme] based color.
/// If not set, the property is null and the default [ColorScheme] based
/// color behavior of the opinionated component theme will be used. This may
/// differ from the corresponding Widget's SDK default un-themed color behavior,
/// but is often the same if defined at all.
///
/// The enum selection `primaryVariant` and `secondaryVariant` colors have been
/// deprecated in v4.2.0 as they were deprecated in Flutter SDK stable 2.10.0.
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

  /// The active theme's color scheme  onSurface color will be used.
  onSurface,

  /// The active theme's color scheme surfaceVariant color will be used.
  surfaceVariant,

  /// The active theme's color scheme onSurfaceVariant color will be used.
  onSurfaceVariant,

  /// The active theme's color scheme outline color will be used.
  outline,

  /// The active theme's color scheme outlineVariant color will be used.
  outlineVariant,

  /// The active theme's color scheme shadow color will be used.
  shadow,

  /// The active theme's color scheme scrim color will be used.
  scrim,

  /// The active theme's color scheme inverseSurface color will be used.
  inverseSurface,

  /// The active theme's color scheme onInverseSurface color will be used.
  onInverseSurface,

  /// The active theme's color scheme inversePrimary color will be used.
  inversePrimary,

  /// The active theme's color scheme surfaceTint color will be used.
  surfaceTint,
}

/// Contains static sub-theme helpers used by opt-in widget sub theming
/// in [FlexColorScheme].
///
/// [FlexSubTheme] offers optional opinionated static theme helpers. You can
/// change many properties of the the opt-in setup by defining custom
/// configuration values in the [FlexSubThemesData] configuration class,
/// and passing it to the [FlexColorScheme.subThemesData] property.
///
/// To enable the component sub-themes using default settings, pass a
/// default constructor [FlexSubThemesData] to [FlexColorScheme.subThemesData].
///
/// The configuration class [FlexSubThemesData] offers easy to use configuration
/// properties for using these sub-themes in FlexColorScheme.
///
/// You can if you wish, also the static sub-themes without even using
/// FlexColorScheme based theming. The [FlexSubThemesData] configuration has
/// no direct impact on these static helpers. It is [FlexColorScheme] that uses
/// the [FlexSubThemesData] class to configure the opt-in sub-themes based on
/// the setup information provided via [FlexColorScheme.subThemesData].
///
/// These component themes are available:
///
/// * [AppBarTheme] for [AppBar] via [appBarTheme].
/// * [BottomAppBarTheme] for [BottomAppBar] via [bottomAppBarTheme].
/// * [BottomNavigationBarThemeData] for [BottomNavigationBar] via
///   [bottomNavigationBar].
/// * [BottomSheetThemeData] for [BottomSheet] via [bottomSheetTheme].
/// * [ButtonThemeData] for old deprecated buttons, via [buttonTheme].
/// * [CardTheme] for [Card] via [cardTheme].
/// * [CheckboxThemeData] for [Checkbox] via [checkboxTheme].
/// * [ChipThemeData] for [Chip] via [chipTheme].
/// * [DialogTheme] for [Dialog] via [dialogTheme].
/// * [DrawerThemeData] for [Drawer] via [drawerTheme].
/// * [DropdownMenuThemeData] for [DropDownMenu] via [dropdownMenuTheme].
/// * [ElevatedButtonThemeData] for [ElevatedButton] via [elevatedButtonTheme].
/// * [FilledButtonThemeData] for [FilledButton] via
///   [FlexSubThemes.filledButtonTheme].
/// * [FloatingActionButtonThemeData] for [FloatingActionButton] via
///   [floatingActionButtonTheme].
/// * [InputDecorationTheme] for [InputDecoration] via [inputDecorationTheme].
/// * [MenuBarThemeData] for [MenuBar] via [menuBarTheme].
/// * [MenuButtonThemeData] for [MenuButton] via [menuButtonTheme].
/// * [MenuThemeData] for [MenuBar], [MenuAnchor] and [DropDownMenu] via
///   [menuTheme].
/// * [NavigationBarThemeData] for [NavigationBar] via [navigationBarTheme].
/// * [NavigationDrawerThemeData] for [NavigationDrawer] via
///   [navigationDrawerTheme].
/// * [NavigationRailThemeData] for [NavigationRail] via [navigationRailTheme].
/// * [OutlinedButtonThemeData] for [OutlinedButton] via [outlinedButtonTheme].
/// * [PopupMenuThemeData] for [PopupMenuButton] via [popupMenuTheme].
/// * [RadioThemeData] for [Radio] via [radioTheme].
/// * [SegmentedButtonThemeData] for [SegmentedButton] via
///   [segmentedButtonTheme].
/// * [SliderThemeData] for [Slider] via [sliderTheme].
/// * [SnackBarThemeData] for [SnackBar] via [snackBarTheme].
/// * [SwitchThemeData] for [Switch] via [switchTheme].
/// * [TabBarTheme] for [TabBar] via [tabBarTheme].
/// * [TextButtonThemeData] for [TextButton] via [textButtonTheme].
/// * [TimePickerThemeData] for [TimePickerDialog] via [timePickerTheme].
/// * [ToggleButtonsThemeData] for [ToggleButtons] via [toggleButtonsTheme].
/// * [TooltipThemeData] for [Tooltip] via [tooltipTheme].
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
/// The theme `ButtonThemeData` is included to provide a very similar
/// theme style on the deprecated legacy buttons `RaisedButton`,
/// `OutlineButton` and `FlatButton` as on the current main buttons. It is not
/// an exact match, since the legacy buttons do not offer as flexible
/// styling as the newer buttons. They do follow and match the styling on
/// [ToggleButtons] when it comes to hover, press, selected and focus.
/// Please consider phasing out the legacy buttons, as they are deprecated and
/// will be removed from the Flutter SDK. Their theme
/// the `ButtonThemeData` will also soon be deprecated and later removed.
///
/// The following widgets that have rounded corners, but are excluded from the
/// component theming for now:
///
/// * [Tooltip], generally so small that larger prominent rounding the
///   opinionated sub-theming is designed for, is not a good fit.
///   FlexColorScheme does include out of the box theming options for tooltips,
///   that also adapts to color branding when opting in on sub themes,
///   it also gets a bit more rounded than when not opting in on sub themes.
/// * [Scrollbar], rounding on edges of scrollbars are left to platform default.
/// * The `AppBar` and `BottomAppBar` shape properties are left to defaults.
/// * `SnackBar` the floating SnackBar should be themed to also include
///   border radius, but the none floating one should remain
///   straight. This cannot can be done via current theming features.
/// * `Drawer` should have have rounding on shown side edge, it is in recent
///   version (2.8.0) possible to assign a Shape in the drawer theme. But
///   Drawer uses same theme, when used as Drawer and EndDrawer and the rounding
///   should be on end edge on Drawer and start edge in EndDrawer. It seem we
///   cannot do   this without having two Shapes in its theme or other usage
///   behavior modifying it. A default behavior in SDK can implement it by
///   looking up if the Drawer is being used in Scaffold as Drawer or EndDrawer,
///   but support via theme is needed too.
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
      case SchemeColor.outlineVariant:
        return colorScheme.outlineVariant;
      case SchemeColor.shadow:
        return colorScheme.shadow;
      case SchemeColor.scrim:
        return colorScheme.scrim;
      case SchemeColor.inverseSurface:
        return colorScheme.inverseSurface;
      case SchemeColor.onInverseSurface:
        return colorScheme.onInverseSurface;
      case SchemeColor.inversePrimary:
        return colorScheme.inversePrimary;
      case SchemeColor.surfaceTint:
        return colorScheme.surfaceTint;
    }
  }

  /// Returns the correct [SchemeColor] to be used as contrasting on
  /// [SchemeColor] pair for [SchemeColor] passed in via [value].
  static SchemeColor onSchemeColor(SchemeColor value) {
    switch (value) {
      case SchemeColor.primary:
      case SchemeColor.surfaceTint:
        return SchemeColor.onPrimary;
      case SchemeColor.onPrimary:
        return SchemeColor.primary;
      case SchemeColor.primaryContainer:
        return SchemeColor.onPrimaryContainer;
      case SchemeColor.onPrimaryContainer:
        return SchemeColor.primaryContainer;
      case SchemeColor.secondary:
        return SchemeColor.onSecondary;
      case SchemeColor.onSecondary:
        return SchemeColor.secondary;
      case SchemeColor.secondaryContainer:
        return SchemeColor.onSecondaryContainer;
      case SchemeColor.onSecondaryContainer:
        return SchemeColor.secondaryContainer;
      case SchemeColor.tertiary:
        return SchemeColor.onTertiary;
      case SchemeColor.onTertiary:
        return SchemeColor.tertiary;
      case SchemeColor.tertiaryContainer:
        return SchemeColor.onTertiaryContainer;
      case SchemeColor.onTertiaryContainer:
        return SchemeColor.tertiaryContainer;
      case SchemeColor.error:
        return SchemeColor.onError;
      case SchemeColor.onError:
        return SchemeColor.error;
      case SchemeColor.errorContainer:
        return SchemeColor.onErrorContainer;
      case SchemeColor.onErrorContainer:
        return SchemeColor.errorContainer;
      case SchemeColor.background:
        return SchemeColor.onBackground;
      case SchemeColor.onBackground:
        return SchemeColor.background;
      case SchemeColor.surface:
        return SchemeColor.onSurface;
      case SchemeColor.onSurface:
        return SchemeColor.surface;
      case SchemeColor.surfaceVariant:
        return SchemeColor.onSurfaceVariant;
      case SchemeColor.onSurfaceVariant:
        return SchemeColor.surfaceVariant;
      case SchemeColor.outline:
        return SchemeColor.background;
      case SchemeColor.outlineVariant:
        return SchemeColor.onBackground;
      case SchemeColor.shadow:
        return SchemeColor.background;
      case SchemeColor.scrim:
        return SchemeColor.background;
      case SchemeColor.inverseSurface:
        return SchemeColor.onInverseSurface;
      case SchemeColor.onInverseSurface:
        return SchemeColor.inverseSurface;
      case SchemeColor.inversePrimary:
        return SchemeColor.onSurface;
    }
  }

  /// Returns the [Color] from passed in [ColorScheme] in [colorScheme]
  /// that is the "on" color pair corresponding to the [SchemeColor] enum
  /// value passed in via [value].
  ///
  /// This function is used to get the color value for the color pair to the
  /// passed in scheme enum value, thus giving the correct Colorscheme based
  /// contrast color for the provided [SchemeColor]. For example passing in
  /// [SchemeColor.primary] enum value, will return the [ColorScheme.onPrimary].
  /// Wise versa, passing in [SchemeColor.onPrimary] will return the color
  /// [ColorScheme.primary].
  static Color schemeColorPair(SchemeColor value, ColorScheme colorScheme) =>
      schemeColor(onSchemeColor(value), colorScheme);

  /// Returns the FCS opinionated tinted hover color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedHover(Color overlay, Color tint) =>
      // Tint color alpha blend into overlay #99=60%
      // Opacity of result #14=8%, same as M3 opacity on hover.
      overlay.blendAlpha(tint, kTintHover).withAlpha(kAlphaHover);

  /// Returns the FCS opinionated tinted highlight color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedHighlight(Color overlay, Color tint) =>
      // Tint color alpha blend into overlay #A5=65%
      // Opacity of result #14=8%, same as M3 opacity on hover.
      overlay.blendAlpha(tint, kTintHighlight).withAlpha(kAlphaHighlight);

  /// Returns the FCS opinionated tinted splash color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedSplash(Color overlay, Color tint) =>
      // Tint color alpha blend into overlay #A5=65%
      // Opacity of result #1F=12%, same as M3 opacity on pressed.
      overlay.blendAlpha(tint, kTintSplash).withAlpha(kAlphaSplash);

  /// Returns the FCS opinionated tinted focus color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedFocus(Color overlay, Color tint) =>
      // Tint color alpha blend into overlay #B2=70%
      // Opacity of result #1F=12%, same as M3 opacity on pressed.
      overlay.blendAlpha(tint, kTintFocus).withAlpha(kAlphaFocus);

  /// Returns the FCS opinionated tinted disabled color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedDisable(Color overlay, Color tint) =>
      // Tint color alpha blend into overlay #66=40%
      // Opacity of result #61=38%, same as M3 opacity on disable.
      overlay.blendAlpha(tint, kTintDisabled).withAlpha(kAlphaDisabled);

  /// An opinionated [AppBarTheme] theme.
  ///
  /// Contrary to the other opinionated static [FlexSubThemes] sub-theme
  /// function, this one is only a sub-set of the original and does not do or
  /// contain any feature shortcuts.
  ///
  /// The [FlexColorScheme.toTheme] needs some of the properties, like fore-
  /// and background colors used here, for other component theme definitions as
  /// well, and has already computed them once, so they are only reused here.
  ///
  /// At the moment the [FlexSubThemes.appBarTheme] is mostly included to
  /// keep and have all [FlexColorScheme] used sub-themes in the [FlexSubThemes]
  /// class. Actual convenience features may be added to
  /// [FlexSubThemes.appBarTheme] later.
  static AppBarTheme appBarTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Whether the AppBar title should be centered.
    ///
    /// Overrides the default value of [AppBar.centerTitle] property in all
    /// descendant [AppBar] widgets. If this property is null, then value
    /// is adapted to the current [TargetPlatform].
    final bool? centerTitle,

    /// Overrides the default value of [AppBar.backgroundColor] in all
    /// descendant [AppBar] widgets.
    ///
    /// See also:
    ///
    ///  * [foregroundColor], which overrides the default value of
    ///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
    final Color? backgroundColor,

    /// Overrides the default value of [AppBar.foregroundColor] in all
    /// descendant [AppBar] widgets.
    ///
    /// See also:
    ///
    ///  * [backgroundColor], which overrides the default value of
    ///    [AppBar.backgroundColor] in all descendant [AppBar] widgets.
    final Color? foregroundColor,

    /// Overrides the default value of [AppBar.elevation] in all
    /// descendant [AppBar] widgets.
    final double? elevation,

    /// Overrides the default value of [AppBar.scrolledUnderElevation] in all
    /// descendant [AppBar] widgets.
    ///
    /// If not defined, defaults to 3.
    final double? scrolledUnderElevation,

    /// Overrides the default value of [AppBar.iconTheme] in all
    /// descendant [AppBar] widgets.
    ///
    /// See also:
    ///
    ///  * [actionsIconTheme], which overrides the default value of
    ///    [AppBar.actionsIconTheme] in all descendant [AppBar] widgets.
    ///  * [foregroundColor], which overrides the default value
    ///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
    final IconThemeData? iconTheme,

    /// Overrides the default value of [AppBar.actionsIconTheme] in all
    /// descendant [AppBar] widgets.
    ///
    /// See also:
    ///
    ///  * [iconTheme], which overrides the default value of
    ///    [AppBar.iconTheme] in all descendant [AppBar] widgets.
    ///  * [foregroundColor], which overrides the default value
    ///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
    final IconThemeData? actionsIconTheme,

    /// Overrides the default value of [AppBar.shadowColor] in all
    /// descendant [AppBar] widgets.
    final Color? shadowColor,

    /// Overrides the default value of [AppBar.surfaceTintColor] in all
    /// descendant [AppBar] widgets.
    final Color? surfaceTintColor,

    /// Overrides the default value of [AppBar.systemOverlayStyle]
    /// property in all descendant [AppBar] widgets.
    final SystemUiOverlayStyle? systemOverlayStyle,
  }) {
    return AppBarTheme(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      systemOverlayStyle: systemOverlayStyle,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
    );
  }

  // TODO(rydmike): Monitor BottomAppBar M3 background issue.
  /// An opinionated [BottomAppBarTheme] theme.
  ///
  /// The [BottomAppBarTheme] allows setting only of background color in FCS.
  /// Other properties are not used by FCS at this stage.
  /// The [BottomAppBarTheme] has no properties for foreground color. If you use
  /// a background color that requires different contrast color than the
  /// active theme's surface colors, you will need to set their colors on
  /// widget level.
  ///
  /// Due to an issue in Flutter 3.7 and 3.7.1, that has been resolved in
  /// master channel, the background color of the [BottomAppBar] cannot
  /// be changed when using M3. See issue:
  /// https://github.com/flutter/flutter/pull/117082 and more explanation here:
  /// https://github.com/rydmike/flex_color_scheme/issues/115.
  static BottomAppBarTheme bottomAppBarTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the
    /// background color for the bottomAppBar.
    ///
    /// If not defined, [colorScheme.surface] will be used via default M2 and
    /// M3 widget behaviour.
    final SchemeColor? backgroundSchemeColor,

    /// Overrides the default value for [BottomAppBar.elevation].
    ///
    /// If this is null, default 3 in M3 and in M2 to 8.
    /// In FCS M2 it default to 0, or same elevation as AppBar if it is defined
    /// to another elevation than 0. This logic is handled by
    /// [FlexColorScheme.toTheme] that passes in the elevation here.
    final double? elevation,

    /// Overrides the default value for [BottomAppBar.shape].
    final NotchedShape? shape,

    /// Overrides the default value for [BottomAppBar.height].
    ///
    /// If this is null, then in M2 the default value is the minimum in relation
    /// to the content, in M3 defaults to 80.0.
    final double? height,

    /// Overrides the default value for [BottomAppBar.padding].
    ///
    /// In M3 the padding will default to
    /// `EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0)`
    /// In M2 the value will default to EdgeInsets.zero.
    final EdgeInsetsGeometry? padding,

    /// Overrides the default value for [BottomAppBar.surfaceTintColor].
    ///
    /// If null, [BottomAppBar] will not display an overlay color.
    ///
    /// See [Material.surfaceTintColor] for more details.
    final Color? surfaceTintColor,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    // Effective color, if null, keep null for M3 defaults via widget.
    final Color backgroundColor =
        schemeColor(backgroundSchemeColor ?? SchemeColor.surface, colorScheme);
    final Color? effectiveColor =
        backgroundSchemeColor == null && useM3 ? null : backgroundColor;

    return BottomAppBarTheme(
      color: effectiveColor,
      elevation: elevation,
      height: height,
      padding: padding,
      surfaceTintColor: surfaceTintColor,
    );
  }

  /// An opinionated [BottomNavigationBarThemeData] with custom elevation.
  ///
  /// This sub-theme uses a style that prefers single use config parameters over
  /// the ones that combines many styling options into TextStyle and icon
  /// sub-theme properties. This is simpler to use when you want to
  /// modify a single property like size and rest is fine. This of course comes
  /// at the expense that the sub-theme instead has more properties.
  ///
  /// Its [elevation] defaults to [kBottomNavigationBarElevation] = 0.
  ///
  /// The bottom navigation bar uses opinionated colors choices from the passed
  /// [colorScheme] to style the bottom navigation bar.
  ///
  /// Background [opacity] can be set.
  static BottomNavigationBarThemeData bottomNavigationBar({
    /// Typically you would pass the same [ColorScheme] that is also used in
    /// your [ThemeData] definition.
    required final ColorScheme colorScheme,

    /// Optional text style for the [BottomNavigationBar] labels.
    ///
    /// If [useFlutterDefaults] is false, the text style
    /// [FlexColorScheme.m3TextTheme.bodyMedium]
    /// will be used as base style for the text style.
    ///
    /// If [useFlutterDefaults] is true, null will be passed to
    /// [FlexSubThemes.bottomNavigationBar] and along to theme creation, if all
    /// labeling modifying properties (size and scheme color) are also null, it
    /// will then be passed along as null, allowing it to remain undefined
    /// and widget default behavior sets the default. If label size or scheme
    /// is defined, a default TextStyle() will be created, if
    /// [bottomNavigationBarLabelTextStyle] is undefined, that gets th size and
    /// color applied.
    ///
    /// The size and colors defined in any of the text size and color properties
    /// are applied as overrides on the text style.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected [BottomNavigationBar] item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item, 14 is used as fallback if needed.
    final double? selectedLabelSize,

    /// The size of the text label on unselected [BottomNavigationBar] items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on unselected items. Defaults to [selectedLabelSize] - 2, but min 8.
    /// Smaller than 8dp is not legible on most screens.
    ///
    /// [BottomNavigationBar] uses this -2dp smaller font on the unselected
    /// label as default, since it is so based on Material 2 spec. By assigning
    /// same value as to selectedLabelSize, you can make them the same size.
    final double? unselectedLabelSize,

    /// Select which color from the theme's [ColorScheme] to use as base for
    /// the [BottomNavigationBar]'s selected label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// Defaults to [SchemeColor.primary].
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// label modifying properties are undefined, including the text style,
    /// the effective color will be [ColorScheme.primary] in light theme and
    /// [ColorScheme.dark] theme mode.
    final SchemeColor? selectedLabelSchemeColor,

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
    /// If null, defaults to true.
    final bool? mutedUnselectedLabel,

    /// The size of the icon on selected [BottomNavigationBar] item.
    ///
    /// If undefined, it defaults to 24.
    final double? selectedIconSize,

    /// The size of the icons on unselected [BottomNavigationBar] items.
    ///
    /// If undefined, defaults to [selectedIconSize].
    final double? unselectedIconSize,

    /// Select which color from the theme's [ColorScheme] to use as base for
    /// the [BottomNavigationBar]'s selected item icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.primary].
    ///
    /// If [useFlutterDefaults] is true, and this property and all other icon
    /// modifying properties are undefined, the effective color will be
    /// [ColorScheme.dark] in dark theme mode.
    final SchemeColor? selectedIconSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [BottomNavigationBar]'s unselected items icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// Defaults to [SchemeColor.onSurface], and adds an alpha blend and
    /// opacity, if [bottomNavigationBarMutedUnselectedLabel] is true.
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// icon modifying properties are undefined,
    /// the effective color will be [ThemeData.unselectedWidgetColor]
    /// which is [Colors.black54] in light mode and [Colors.white70] in dark.
    final SchemeColor? unselectedIconSchemeColor,

    /// If true, the unselected icon in the [BottomNavigationBar] use a more
    /// muted color version of the color defined by
    /// [bottomNavigationBarUnselectedIconSchemeColor].
    /// The muting is unselected color with
    /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    /// and withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to true.
    final bool? mutedUnselectedIcon,

    /// Select which color from the theme's [ColorScheme] to use as background
    /// color for the [BottomNavigationBar].
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.background].
    ///
    /// If [useFlutterDefaults] true, and this property is undefined,
    /// the effective background color will also be [ColorScheme.background].
    ///
    /// FlexColorScheme sets background defaults of [BottomNavigationBar],
    /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
    /// when it is using component sub-themes.
    /// Flutter SDK uses different colors on all three widgets. Our opinion is
    /// that they should all default to using the same [ColorScheme] based
    /// color. FlexColorScheme uses the background color as this default.
    final SchemeColor? backgroundSchemeColor,

    /// BottomNavigationBar background opacity.
    ///
    /// The opacity value is only applied when a none null value is selected
    /// in [backgroundSchemeColor], it cannot be applied to the default
    /// Flutter SDK background color available when backgroundSchemeColor is
    /// null.
    ///
    /// If undefined, defaults to 1, fully opaque.
    final double? opacity,

    /// [BottomNavigationBar] container elevation.
    ///
    /// If not defined, defaults to [kBottomNavigationBarElevation] = 0.
    final double? elevation,

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
    ///
    /// If undefined, defaults to Flutter SDK default. Where
    /// If type is provided, it is returned. Next, if the bottom navigation bar
    /// theme provides a type, it is used. Finally, the default behavior will be
    /// [BottomNavigationBarType.fixed] for 3 or fewer items, and
    /// [BottomNavigationBarType.shifting] is used for 4+ items.
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

    /// Set to true to use Flutter SDK defaults for [BottomNavigationBar]
    /// theme when its color, size and text style properties are undefined,
    /// instead of using [FlexColorScheme]'s own defaults.
    ///
    /// Recommend keeping it **false** for a more color harmonized component
    /// theme starting point. This flag may be helpful if you want to create
    /// custom sub-themes starting from less opinionated settings.
    ///
    /// When all required properties are undefined and flag is false or true,
    /// the effective default styles for undefined inputs become:
    ///
    /// ```
    ///                    FCS defaults   Flutter defaults
    /// useFlutterDefaults false          true
    /// - background       background     background
    /// - selected icon    primary        light: theme primary, dark: secondary
    /// - Selected label   primary        light: theme primary, dark: secondary
    /// - unselected icon  onSurface      light: black54, dark: white70
    /// - unSelected label onSurface      light: black54, dark: white70
    /// ```
    /// FCS further applies both an alpha blend and slight opacity to
    /// unselected icon and unselected label, but only if
    /// [bottomNavigationBarMutedUnselectedIcon] and
    /// [bottomNavigationBarMutedUnselectedLabel] are true respectively,
    /// this also applies to undefined color inputs.
    ///
    /// When muted unselected options are true, the difference to Flutter
    /// default for unselected items is subtle, FCS has a bit more contrast.
    final bool useFlutterDefaults = false,
  }) {
    // Determine if we can even use default text styles, only when all are null,
    // can we fall back to Flutter SDK default.
    final bool useDefaultTextStyle = labelTextStyle == null &&
        selectedLabelSize == null &&
        unselectedLabelSize == null &&
        selectedLabelSchemeColor == null &&
        unselectedLabelSchemeColor == null &&
        useFlutterDefaults;

    // Determine if we can even use default icon styles, only when all are null,
    // can we fall back to Flutter SDK default.
    final bool useDefaultIconTheme = selectedIconSize == null &&
        unselectedIconSize == null &&
        selectedIconSchemeColor == null &&
        unselectedIconSchemeColor == null &&
        useFlutterDefaults;

    // Get text color, defaults to primary in light and to secondary in dark.
    final Color labelColor = schemeColor(
        selectedLabelSchemeColor ??
            (colorScheme.brightness == Brightness.dark && useDefaultTextStyle
                ? SchemeColor.secondary
                : SchemeColor.primary),
        colorScheme);

    // Get unselected label color, defaults to onSurface.
    final Color unselectedLabelColor = schemeColor(
        unselectedLabelSchemeColor ?? SchemeColor.onSurface, colorScheme);

    // Get selected text style, defaults to TextStyle(), we can use it since
    // size and color are applied to is separately.
    final TextStyle textStyle = labelTextStyle ?? const TextStyle();

    // Get effective text sizes.
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 14;
    // If not specified, unselected is label size, use 2dp smaller than
    // selected, but always at least 8dp.
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? math.max(labelSize - 2, 8);

    // Get icon color, defaults to primary in light, and secondary in dark.
    final Color iconColor = schemeColor(
        selectedIconSchemeColor ??
            (useDefaultIconTheme && colorScheme.brightness == Brightness.dark
                ? SchemeColor.secondary
                : SchemeColor.primary),
        colorScheme);

    // Get unselected icon color, defaults to onSurface.
    final Color unselectedIconColor = schemeColor(
        unselectedIconSchemeColor ?? SchemeColor.onSurface, colorScheme);

    // Get effective icons sizes.
    final double iconSize = selectedIconSize ?? 24;
    final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

    // Background color, when using normal default, falls back to background.
    final Color backgroundColor = schemeColor(
            backgroundSchemeColor ?? SchemeColor.background, colorScheme)
        .withOpacity(opacity ?? 1.0);

    return BottomNavigationBarThemeData(
      backgroundColor: backgroundSchemeColor == null
          ? useFlutterDefaults
              ? null
              : backgroundColor
          : backgroundColor,
      elevation: elevation ?? kBottomNavigationBarElevation,
      unselectedIconTheme: useDefaultIconTheme
          ? null
          : IconThemeData(
              size: effectiveUnselectedIconSize,
              opacity: 1,
              color: (mutedUnselectedIcon ?? true)
                  ? unselectedIconColor
                      .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                      .withAlpha(unselectedAlpha)
                  : unselectedIconColor,
            ),
      selectedIconTheme: useDefaultIconTheme
          ? null
          : IconThemeData(
              size: iconSize,
              opacity: 1,
              color: iconColor,
            ),
      selectedItemColor: useDefaultTextStyle ? null : labelColor,
      unselectedItemColor: useDefaultTextStyle
          ? null
          : (mutedUnselectedLabel ?? true)
              ? unselectedLabelColor
                  .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                  .withAlpha(unselectedAlpha)
              : unselectedLabelColor,
      unselectedLabelStyle: useDefaultTextStyle
          ? null
          : textStyle.copyWith(
              fontSize: effectiveUnselectedLabelSize,
              color: (mutedUnselectedLabel ?? true)
                  ? unselectedLabelColor
                      .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                      .withAlpha(unselectedAlpha)
                  : unselectedLabelColor,
            ),
      selectedLabelStyle: useDefaultTextStyle
          ? null
          : textStyle.copyWith(
              fontSize: labelSize,
              color: labelColor,
            ),
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      type: type,
      landscapeLayout: landscapeLayout,
    );
  }

  /// An opinionated [BottomSheetThemeData] with custom top corner
  /// radius.
  ///
  /// Corner [radius] defaults to [kBottomSheetBorderRadius] = 28,
  /// [elevation] to [kBottomSheetElevation] = 4 and [modalElevation] to
  /// [kBottomSheetModalElevation] = 8.
  static BottomSheetThemeData bottomSheetTheme({
    /// Default value for [BottomSheet.backgroundColor].
    ///
    /// If null, defaults to [Material]'s default.
    final Color? backgroundColor,

    /// Value for [BottomSheet.backgroundColor] when the Bottom sheet is
    /// presented as a modal bottom sheet.
    ///
    /// If null, defaults to [Material]'s default.
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

    /// The clipBehavior of the bottom sheet theme, defaults to
    /// [Clip.antiAlias] for smoother clipping when using rounded corners.
    ///
    /// This property is not available in [FlexSubThemeData] but you can use
    /// it if you otherwise use this as theme helper.
    final Clip clipBehavior = Clip.antiAlias,

    /// Constrains the size of the [BottomSheet].
    ///
    /// If null, the bottom sheet's size will be unconstrained.
    final BoxConstraints? constraints,

    /// Overrides the default value for surfaceTintColor.
    ///
    /// If null, [BottomSheet] will not display an overlay color.
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
        surfaceTintColor: surfaceTintColor,
      );

  /// An opinionated [ButtonThemeData] theme.
  ///
  /// The `ButtonThemeData` is marked as **obsolete** in Flutter SDK
  /// documentation, but not yet deprecated in Flutter stable SDK 3.7.x.
  ///
  /// This sub-theme will be removed in FCS when Flutter SDK deprecates
  /// [ButtonThemeData].
  ///
  /// This theme is used to provide the same opinionated theme and style on
  /// the deprecated buttons `RaisedButton`, `OutlineButtons` and `FlatButton`.
  /// Button theme has more limited theming capability and cannot match
  /// the Material style buttons fully, this is an approximation.
  ///
  /// The adjustable button corner [radius] defaults to 20. This was an early
  /// default in M3 for buttons, it was later changed to stadium border.
  /// Flutter SDK M2 defaults to 4.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is used to make the buttons match the padding on the newer buttons.
  ///
  /// The above legacy buttons this sub theme is for, will be completely
  /// removed in Flutter stable version. The `ButtonThemeData` this helper uses
  /// will however remain available after that, because widgets
  /// [ButtonBar] and [DropdownButton], plus [MaterialButton] (marked as
  /// obsolete in SDK docs though) still use this theme. It is thus kept around
  /// in FlexColorScheme package as long as it might have some use and exists
  /// in Flutter stable SDK.
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
    /// If not defined, defaults to [kButtonRadius] 20dp,
    /// based on earlier M3 specification, that was later changed to stadium.
    /// https://m3.material.io/components/buttons/specs
    final double? radius,

    /// Padding for legacy button.
    ///
    /// If not defined,
    /// defaults to [kButtonPadding] = `EdgeInsets.symmetric(horizontal: 16)`.
    /// This makes the legacy buttons same size as default margin on new ones.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// If undefined, defaults to [kButtonMinSize] = Size(40, 40).
    final Size? minButtonSize,
  }) {
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // Effective minimum button size.
    final Size effectiveMinButtonSize = minButtonSize ?? kButtonMinSize;

    return ButtonThemeData(
      colorScheme: colorScheme,
      minWidth: effectiveMinButtonSize.width,
      height: effectiveMinButtonSize.height,
      padding: padding ?? kButtonPadding,
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

  /// An opinionated [CardTheme] with custom corner radius and elevation.
  ///
  /// Corner [radius] defaults to [kCardRadius] = 12 and [elevation]
  /// defaults to [kCardElevation] = 0.
  ///
  /// The corner radius 12 is the new default on Cards in M3
  /// [specification](https://m3.material.io/components/cards/specs).
  static CardTheme cardTheme({
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
  }) =>
      CardTheme(
        clipBehavior: clipBehavior,
        elevation: elevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kCardRadius),
          ),
        ),
      );

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
    /// If not defined, [colorScheme.primary] will be used. This is more in-line
    /// with M3 design, but applied to M2 switch. The M3 color design
    /// specification for the secondary color, is a poor choice for toggles and
    /// switches, primary color works better.
    final SchemeColor? baseSchemeColor,

    /// The splash radius of the circular Material ink response.
    ///
    /// Defaults to kRadialReactionRadius = 20.
    final double? splashRadius,

    /// Defines if unselected [Checkbox] is also themed to be [baseSchemeColor].
    ///
    /// If false, it is grey like in Flutter SDK.
    ///
    /// If undefined, defaults to false.
    final bool? unselectedIsColored,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    final Color onBaseColor = schemeColorPair(baseScheme, colorScheme);
    final bool isLight = colorScheme.brightness == Brightness.light;
    final bool unselectedColored = unselectedIsColored ?? false;
    final bool tintInteract = useTintedInteraction ?? false;
    final bool tintDisable = useTintedDisable ?? false;

    return CheckboxThemeData(
      splashRadius: splashRadius,
      checkColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (useM3) {
            if (states.contains(MaterialState.disabled)) {
              if (states.contains(MaterialState.selected)) {
                return colorScheme.surface;
              }
              return Colors.transparent;
            }
            if (states.contains(MaterialState.selected)) {
              if (states.contains(MaterialState.error)) {
                return colorScheme.onError;
              }
              return onBaseColor;
            }
            return Colors.transparent;
          } else {
            if (states.contains(MaterialState.disabled)) {
              return isLight ? Colors.grey.shade200 : Colors.grey.shade900;
            }
            if (states.contains(MaterialState.selected)) {
              return onBaseColor;
            }
            return isLight ? Colors.grey.shade50 : Colors.grey.shade400;
          }
        },
      ),
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (useM3) {
            if (states.contains(MaterialState.disabled)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return colorScheme.onSurface.withOpacity(0.38);
            }
            if (states.contains(MaterialState.error)) {
              return colorScheme.error;
            }
            if (states.contains(MaterialState.selected)) {
              return baseColor;
            }
            if (states.contains(MaterialState.pressed)) {
              if (unselectedColored) return baseColor;
              return colorScheme.onSurface;
            }
            if (states.contains(MaterialState.hovered)) {
              if (unselectedColored) return baseColor;
              return colorScheme.onSurface;
            }
            if (states.contains(MaterialState.focused)) {
              if (unselectedColored) return baseColor;
              return colorScheme.onSurface;
            }
            if (unselectedColored) return baseColor.withAlpha(0xDD);
            return colorScheme.onSurfaceVariant;
          } else {
            if (states.contains(MaterialState.disabled)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
            }
            if (states.contains(MaterialState.selected)) {
              return baseColor;
            }
            // Opinionated color on unselected checkbox.
            if (unselectedColored) {
              return baseColor.withAlpha(0xDD);
            }
            // This is M2 SDK default.
            return isLight ? Colors.black54 : Colors.white70;
          }
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          // Error state only exists in M3 mode.
          if (states.contains(MaterialState.error) && useM3) {
            if (states.contains(MaterialState.pressed)) {
              return colorScheme.error.withOpacity(0.12);
            }
            if (states.contains(MaterialState.hovered)) {
              return colorScheme.error.withOpacity(0.08);
            }
            if (states.contains(MaterialState.focused)) {
              return colorScheme.error.withOpacity(0.12);
            }
          }
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.pressed)) {
              if (tintInteract) return baseColor.withOpacity(0.12);
              return colorScheme.onSurface.withOpacity(0.12);
            }
            if (states.contains(MaterialState.hovered)) {
              return baseColor.withOpacity(0.08);
            }
            if (states.contains(MaterialState.focused)) {
              return baseColor.withOpacity(0.12);
            }
            return Colors.transparent;
          }
          if (states.contains(MaterialState.pressed)) {
            return baseColor.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            if (tintInteract) return baseColor.withOpacity(0.08);
            return colorScheme.onSurface.withOpacity(0.08);
          }
          if (states.contains(MaterialState.focused)) {
            if (tintInteract) return baseColor.withOpacity(0.12);
            return colorScheme.onSurface.withOpacity(0.12);
          }
          return Colors.transparent;
        },
      ),
    );
  }

  /// An opinionated [ChipThemeData] theme with custom border radius and a
  /// custom theme that partially mimics the M3 style in M2 and works well with
  /// FlexColorScheme surface blends.
  ///
  /// The border radius defaults to 8dp [kChipRadius], new M3 default.
  /// https://m3.material.io/components/chips/specs
  static ChipThemeData chipTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Defines which [Theme] based [ColorScheme] based color the selected Chips
    /// use as their selected state color.
    ///
    /// The color scheme contrast pair color is used for text and icons, on the
    /// [selectedSchemeColor]
    ///
    /// If not defined and [useMaterial3] is true, defaults to
    /// [SchemeColor.secondaryContainer].
    final SchemeColor? selectedSchemeColor,

    /// Defines which [Theme] based [ColorScheme] based color the Chips
    /// use as their color tint base color.
    ///
    /// The selected color is only used as base for the [Chip] colors, it also
    /// uses alpha blend and opacity to create the effective Chip colors using
    /// the selected scheme color as base.
    ///
    /// If not defined it defaults to effective theme based color from using
    /// [SchemeColor.primary], when [useMaterial3] is false.
    ///
    /// If [useMaterial3] is true, using a null [chipSchemeColor] will
    /// result in M3 default Chip coloring being used without opacity and alpha
    /// blends. To get the same coloring for M3 as when [useMaterial3] is false,
    /// pass in [SchemeColor.primary].
    final SchemeColor? baseSchemeColor,

    /// Defines which [Theme] based [ColorScheme] based color the Chips
    /// use as color of the delete icon.
    ///
    /// The selected color is only used as base for the [Chip] colors, it also
    /// uses alpha blend and opacity to create the effective Chip colors using
    /// the selected scheme color as base.
    ///
    /// If not defined it defaults to effective theme based color from using
    /// [SchemeColor.onSurface].
    final SchemeColor? deleteIconSchemeColor,

    /// The style to be applied to the chip's label.
    ///
    /// This only has an effect on label widgets that respect the
    /// [DefaultTextStyle], such as [Text].
    required TextStyle labelStyle,

    /// Corner radius of the Chip.
    ///
    /// If not defined, defaults to [kChipRadius] 8dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/chips/specs
    final double? radius,

    /// Overrides the default for [ChipAttributes.surfaceTintColor], the
    /// Color of the chip's surface tint overlay when its elevation is
    /// greater than 0.
    ///
    /// This property applies to [ActionChip], [Chip], [ChoiceChip],
    /// [FilterChip], [InputChip], [RawChip].
    final Color? surfaceTintColor,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    // Function used to increase icon color for selections resulting in poor
    // icon color.
    Color fixContrast(Color color) {
      if (colorScheme.brightness == Brightness.light) {
        if (ThemeData.estimateBrightnessForColor(color) == Brightness.light) {
          return color.darken(25);
        } else {
          return color;
        }
      } else {
        if (ThemeData.estimateBrightnessForColor(color) == Brightness.dark) {
          return color.lighten(25);
        } else {
          return color;
        }
      }
    }

    // Used to toggle between different defaults from M2 and M3.
    final bool useM3 = useMaterial3 ?? false;

    // Flag for not using any defined color values in M3 mode, but instead
    // falling back to M3 theme defaults, when using Material 3.
    // We do this when no Scheme colors are selected to get the exact M3
    // theme default. It is not possible due to SDK Chip theming issues
    // and limitations to recreate the exact M3 Chip themes with any other
    // theme colors than the default built-in ones.
    // TODO(rydmike): Chip https://github.com/flutter/flutter/issues/115364
    final bool useM3Defaults =
        useM3 && baseSchemeColor == null && selectedSchemeColor == null;

    // Get blend color, defaults to surface for M3 and to primary for M2.
    final SchemeColor fallbackBlend =
        useM3 ? SchemeColor.surface : SchemeColor.primary;
    final Color blendColor =
        schemeColor(baseSchemeColor ?? fallbackBlend, colorScheme);

    // Selected color
    final SchemeColor fallbackSelected =
        useM3 ? SchemeColor.secondaryContainer : SchemeColor.surface;
    final Color selectedColor = useM3 || selectedSchemeColor != null
        ? schemeColor(selectedSchemeColor ?? fallbackSelected, colorScheme)
        : blendColor.blendAlpha(
            colorScheme.surface, kChipSelectedBackgroundAlphaBlend);
    // The onSelected onColor
    final Color onSelectedColor =
        schemeColorPair(selectedSchemeColor ?? fallbackSelected, colorScheme);

    // The onSelected onColor
    final Color deleteIconColor = schemeColor(
        deleteIconSchemeColor ?? SchemeColor.onSurface, colorScheme);

    // Icon color.
    final Color iconColor;
    if (blendColor == colorScheme.surface ||
        blendColor == colorScheme.background) {
      iconColor = selectedColor;
    } else {
      iconColor = blendColor;
    }
    // Text color, uses the foreground color for all chip styles.
    final TextStyle effectiveLabelStyle =
        labelStyle.copyWith(color: colorScheme.onSurface);

    // Text color, uses the foreground color for all chip styles.
    final TextStyle effectiveSelectedLabelStyle =
        labelStyle.copyWith(color: onSelectedColor);

    return ChipThemeData(
      // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
      // [InputChip], [RawChip], but NOT to ANY selected or disabled Chip.
      backgroundColor: useM3Defaults
          ? null
          : blendColor.blendAlpha(
              colorScheme.surface, kChipBackgroundAlphaBlend),

      // Applies to [Chip], [InputChip], [RawChip].
      deleteIconColor: useM3Defaults && deleteIconSchemeColor == null
          ? null
          : deleteIconColor,

      // Applies to [ChoiceChip], [FilterChip], [InputChip], [RawChip].
      // Same formula as on FCS Elevated button and ToggleButtons.
      disabledColor: useM3Defaults
          ? null
          : blendColor
              .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
              .withAlpha(kDisabledBackgroundAlpha),

      // Applies to [ChoiceChip], [FilterChip], [InputChip], [RawChip].
      selectedColor: useM3Defaults ? null : selectedColor,

      // Applies to [ChoiceChip.selectedColor], if set it overrides the
      // [selectedColor], for ChoiceChips.
      secondarySelectedColor: useM3Defaults ? null : selectedColor,

      // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
      // [InputChip] and [RawChip].
      surfaceTintColor:
          useM3Defaults ? surfaceTintColor : colorScheme.surfaceTint,

      // Applies to [FilterChip], [InputChip], [RawChip].
      checkmarkColor: onSelectedColor,

      // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
      // [InputChip] and [RawChip].
      padding: useM3 ? null : const EdgeInsets.all(4),

      // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
      // [InputChip] and [RawChip].
      shape: useM3 && radius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? kChipRadius),
              ),
            ),

      // Applies to [ActionChip], [Chip], [FilterChip], [InputChip], [RawChip].
      labelStyle: useM3Defaults ? null : effectiveLabelStyle,

      // Applies to [ChoiceChip.labelStyle],
      secondaryLabelStyle: useM3Defaults ? null : effectiveSelectedLabelStyle,

      // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
      // [InputChip] and [RawChip].
      iconTheme: useM3Defaults
          ? null
          : IconThemeData(
              color: fixContrast(iconColor),
              size: 18.0,
            ),
    );
  }

  /// An opinionated [DialogTheme] with custom corner radius and elevation.
  ///
  /// Corner [radius] defaults to [kDialogRadius] = 28 and [elevation] to
  /// [kDialogElevation] = 10.
  ///
  /// The default radius follows Material M3 guide
  /// [specification](https://m3.material.io/components/dialogs/specs).
  static DialogTheme dialogTheme({
    /// Dialog background color.
    ///
    /// Defaults to null and gets default via Dialog's default null theme
    /// behavior.
    ///
    /// Can be used to make a custom themed dialog with own background color,
    /// even after the [ThemeData.dialogBackgroundColor] property is
    /// is deprecated in Flutter SDK. Which it will be in 2022, see
    /// [issue](https://github.com/flutter/flutter/issues/91772).
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

    /// Corner radius of the dialog.
    ///
    /// If not defined, defaults to [kDialogRadius] 28dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/dialogs/specs
    final double? radius,

    /// Dialog elevation.
    ///
    /// If not defined, defaults to [kDialogElevation] = 6.
    final double? elevation,

    /// Overrides the default value for [Dialog.shadowColor].
    final Color? shadowColor,

    /// Overrides the default value for [Dialog.surfaceTintColor].
    final Color? surfaceTintColor,

    /// Padding around the set of [actions] at the bottom of the dialog.
    ///
    /// Typically used to provide padding to the button bar between the button
    /// bar and the edges of the dialog.
    ///
    /// If there are no [actions], then no padding will be included. It is also
    /// important to note that [buttonPadding] may contribute to the padding on
    /// the edges of [actions] as well.
    ///
    /// If null defaults to:
    /// const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0)
    /// same as M3 default.
    final EdgeInsetsGeometry? actionsPadding,
  }) {
    final Color? background =
        (colorScheme == null || backgroundSchemeColor == null)
            ? backgroundColor // might be null, then SDK theme defaults.
            : schemeColor(backgroundSchemeColor, colorScheme);

    return DialogTheme(
      elevation: elevation ?? kDialogElevation,
      backgroundColor: background,
      actionsPadding: actionsPadding ??
          const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kDialogRadius),
        ),
      ),
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
    );
  }

  /// An opinionated [DrawerThemeData] theme for the [Drawer].
  ///
  /// The [NavigationDrawer] also uses these value for its drawer parts. Its
  /// menu part has an own theme in Flutter SDK.
  static DrawerThemeData drawerTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in [colorScheme] to use as
    /// [Drawer] background color.
    ///
    /// If not defined, defaults to [SchemeColor.surface]. Flutter
    /// SDK uses surface color as default in M3, and background in M2.
    /// FCS uses surface in both modes.
    final SchemeColor? backgroundSchemeColor,

    /// Corner radius of the [Drawer]'s visible edge.
    ///
    /// If not defined, defaults to [kDrawerRadius] 16 dp in M2 mode,
    /// in M3 mode, null is kept but gets 16 via M3 mode defaults.
    /// The 16 dp values is based on M3 specification:
    /// https://m3.material.io/components/navigation-drawer/specs
    final double? radius,

    /// Drawer elevation.
    ///
    /// If not defined, defaults to Flutter default values, in M2 mode (16)
    /// and in M3 (1) via SDK defaults.
    final double? elevation,

    /// Drawer elevation shadow color.
    ///
    /// In M2 defaults to [Colors.black] and elevation casts a shadow.
    /// In M3 it defaults [Colors.transparent] and there is no shadow.
    final Color? shadowColor,

    /// Overrides the default value for [Drawer.surfaceTintColor].
    final Color? surfaceTintColor,

    /// Themes the default width of the [Drawer].
    ///
    /// Currently not available as a property in [FlexSubThemesData], may be
    /// added later.
    final double? width,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    // Get selected background color, defaults to surface.
    final Color backgroundColor =
        schemeColor(backgroundSchemeColor ?? SchemeColor.surface, colorScheme);

    return DrawerThemeData(
      backgroundColor: backgroundColor,
      elevation: elevation,
      width: width,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: useM3 && radius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.horizontal(
                end: Radius.circular(radius ?? kDrawerRadius),
              ),
            ),
      endShape: useM3 && radius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.horizontal(
                start: Radius.circular(radius ?? kDrawerRadius),
              ),
            ),
    );
  }

  /// An opinionated [DropdownMenuThemeData] theme.
  static DropdownMenuThemeData dropdownMenuTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// The [TextStyle] of the text entry in a [DropDownMenu].
    ///
    /// If not defined, defaults to Flutter SDK default via widget default
    /// [TextTheme.labelLarge].
    final TextStyle? textStyle,

    /// An [InputDecorationTheme] for the text input part of the [DropDownMenu].
    /// Typically you want it to match the input decorator on your TextField.
    final InputDecorationTheme? inputDecorationTheme,

    /// Overrides the default value for DropdownMenuThemeData
    /// [menuStyle.surfaceTintColor].
    final Color? surfaceTintColor,
  }) {
    return DropdownMenuThemeData(
      inputDecorationTheme: inputDecorationTheme,
      textStyle: textStyle,
      menuStyle: MenuStyle(
        surfaceTintColor: surfaceTintColor == null
            ? null
            : MaterialStatePropertyAll<Color>(surfaceTintColor),
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
    /// [useMaterial3] is false, if it is true, then [colorScheme.surface] will
    /// be used.
    final SchemeColor? onBaseSchemeColor,

    /// The button corner radius.
    ///
    /// If not defined, defaults to [kButtonRadius] 20dp in M2. When using
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
    final MaterialStateProperty<TextStyle?>? textStyle,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    // On color logic with M3 reversal of roles.
    final Color onBaseColor = onBaseSchemeColor == null
        ? useM3
            ? schemeColor(SchemeColor.surface, colorScheme)
            : schemeColorPair(baseScheme, colorScheme)
        : schemeColor(onBaseSchemeColor, colorScheme);

    // We are using FCS M2 buttons, styled in M3 fashion by FCS.
    if (!useM3) {
      return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
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
    } else {
      //
      // We are using M3 style buttons, with potentially custom radius,
      // elevation, foregroundColor, backgroundColor, overlayColor, padding
      // and minButtonSize.
      MaterialStateProperty<Color?>? backgroundColor;
      MaterialStateProperty<Color?>? foregroundColor;
      MaterialStateProperty<Color?>? overlayColor;

      // If a baseSchemeColor was given we need to define all M3 color in
      // all states, if it was not defined, we can keeping them all null
      // and let M3 widget defaults handle the colors.
      if (baseSchemeColor != null) {
        foregroundColor =
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }
          return baseColor;
        });

        overlayColor =
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return baseColor.withOpacity(0.08);
          }
          if (states.contains(MaterialState.focused)) {
            return baseColor.withOpacity(0.12);
          }
          if (states.contains(MaterialState.pressed)) {
            return baseColor.withOpacity(0.12);
          }
          return null;
        });
        backgroundColor =
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }
          return onBaseColor;
        });
      }
      // If the baseSchemeColor was null, but onBaseSchemeColor was not,
      // we ned to define background color. Otherwise it will have value from
      // above or be left at defaults and let widget default define it.
      if (baseSchemeColor == null && onBaseSchemeColor != null) {
        backgroundColor =
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }
          return onBaseColor;
        });
      }

      // If elevation is null, we use widget defaults, otherwise we define a
      // custom elevation behavior that is based on how M3 elevation works,
      // but where we can modify the base level. If elevation 1, is passed
      // the result is the same as M3 elevation behavior.
      final MaterialStateProperty<double?>? elevationM3 = elevation == null
          ? null
          : MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return 0.0;
              }
              if (states.contains(MaterialState.hovered)) {
                return elevation + 2.0;
              }
              if (states.contains(MaterialState.focused)) {
                return elevation;
              }
              if (states.contains(MaterialState.pressed)) {
                return elevation;
              }
              return elevation;
            });

      return ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: textStyle,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          overlayColor: overlayColor,
          minimumSize: ButtonStyleButton.allOrNull<Size>(minButtonSize),
          padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
          elevation: elevationM3,
          shape: radius == null
              ? null
              : ButtonStyleButton.allOrNull<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
                ),
        ),
      );
    }
  }

  /// An opinionated [FilledButtonThemeData] theme.
  ///
  /// Requires a [ColorScheme], the color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The adjustable button corner [radius] defaults to Stadium in M3, and FCS
  /// uses 20 in M2, where SDK M2 defaults to 4.
  static FilledButtonThemeData filledButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the main
    /// color for the button.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.primary] will be used.
    final SchemeColor? baseSchemeColor,

    /// If not defined, defaults to Stadium border based on
    /// https://m3.material.io/components/buttons/specs
    final double? radius,

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
    /// If null, defaults to [kButtonMinSize] (`const Size(40.0, 40.0)`) when
    /// [useMaterial3] is false and to `const Size(64.0, 40.0)` when
    /// [useMaterial3] is true.
    final Size? minButtonSize,

    /// The style for the button's [Text] widget descendants.
    ///
    /// The color of the [textStyle] is typically not used directly, the
    /// [foregroundColor] is used instead.
    final MaterialStateProperty<TextStyle?>? textStyle,
  }) {
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // Get selected color, defaults to primary.
    final Color onBaseColor =
        schemeColorPair(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    MaterialStateProperty<Color?>? backgroundColor;
    MaterialStateProperty<Color?>? foregroundColor;
    MaterialStateProperty<Color?>? overlayColor;

    if (baseSchemeColor != null) {
      backgroundColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.12);
        }
        return baseColor;
      });

      foregroundColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        return onBaseColor;
      });

      overlayColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return onBaseColor.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return onBaseColor.withOpacity(0.12);
        }
        if (states.contains(MaterialState.pressed)) {
          return onBaseColor.withOpacity(0.12);
        }
        return null;
      });
    }

    return FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: textStyle,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        overlayColor: overlayColor,
        minimumSize: ButtonStyleButton.allOrNull<Size>(minButtonSize),
        padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
        shape: radius == null
            ? null
            : ButtonStyleButton.allOrNull<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
              ),
      ),
    );
    // }
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
    /// If not defined, or if passed in `colorScheme` is null, then if
    /// `ThemeData.useMaterial3` is false `theme.colorScheme.secondary` will be
    /// used, but if `ThemeData.useMaterial3` is true, then
    /// `ThemeData.colorScheme.primaryContainer` will be used.
    ///
    /// The foreground color automatically uses the selected background
    /// color's contrast color pair in the passed in [colorScheme] property.
    final SchemeColor? backgroundSchemeColor,

    /// Corner radius of the [FloatingActionButton].
    ///
    /// If not defined, defaults to [kFabRadius] 16dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/floating-action-button/specs
    final double? radius,

    /// Set to false to not apply any Shape theming to the FAB.
    ///
    /// If set to false, the Shape property will be kept null, regardless
    /// of what border radius was given, also via `alwaysCircular` property.
    /// This results in that the FAB theme data, will use and implement its
    /// Flutter SDK default shape behavior. Other properties are still used.
    ///
    /// Default to true.
    final bool useShape = true,

    /// Set to true to always use circular and stadium shapes on the FAB.
    ///
    /// If set to true, it overrides `radius` and shape is always circular
    /// or stadium shaped.
    ///
    /// Implementation is via `StadiumBorder` to be able
    /// to support the extended FAB as well. It looks same with Stadium on
    /// the circular cases as the actual Circular FAB using ones in M2, but
    /// implementation is different since we cannot use different themed
    /// shapes for different types of FAB, like the hard coded default
    /// none themed behavior does. See issue
    /// [#107946](https://github.com/flutter/flutter/issues/107946) for
    /// more information.
    ///
    /// Has no impact if `useShape` is false.
    ///
    /// Defaults to false.
    final bool alwaysCircular = false,
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
          ? alwaysCircular
              ? const StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? kFabRadius),
                  ),
                )
          : null,
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
  /// The corner [radius] can be adjusted, it defaults to
  /// [kInputDecoratorRadius] (20), which currently matches the border radius
  /// default used used on buttons in M3 specification. This value is not
  /// specified in the M3 design guide, and this default border radius may be
  /// changed later to match the M3 spec when it is known.
  static InputDecorationTheme inputDecorationTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Optional provided effective TextTheme to use as base for the
    /// input decorations.
    ///
    /// A default one is used if not provided.
    final TextTheme? textTheme,

    /// Selects which color from the passed in colorScheme to use for the border
    /// and fill color of the input decorator.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    /// You can give the border a separate color value by defining
    /// [borderSchemeColor].
    ///
    /// If not defined, [colorScheme.primary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The decorated input fields corner border radius.
    ///
    /// If not defined, defaults to [kInputDecoratorRadius] 16dp.
    /// When opting in on using Material3 with `useMaterial3` set to true,
    /// FlexColorScheme will [kInputDecoratorM3Radius] is value is not
    /// otherwise specified.
    final double? radius,

    /// Selects input border type.
    ///
    /// If undefined, defaults to [FlexInputBorderType.outline].
    final FlexInputBorderType? borderType,

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

    /// Defines the alpha, opacity channel value used as opacity on effective
    /// [InputDecorator] background color.
    ///
    /// If defined, the valid range is 0 to 255 (0x00 to 0xFF), if out of bounds
    /// it is capped at closer value.
    ///
    /// If not defined, in M3 mode it defaults to 0xFF fully opaque. In M2 mode
    /// defaults to [kFillColorAlphaLight] (0x0D = 5% opacity) in light theme
    /// and to [kFillColorAlphaDark] (0x14 = 8% opacity) in dark mode.
    ///
    /// The border [inputDecoratorBorderSchemeColor] can be used to define the
    /// border color separately, but it defaults to this color if not defined.
    final int? backgroundAlpha,

    /// The icon color of the prefixIcon in a focused [InputDecoration].
    ///
    /// If not defined defaults to [baseSchemeColor] in FCS M2 and to
    /// [SchemeColor.onSurface] in FCS M3.
    final SchemeColor? prefixIconSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the border
    /// color of the input decorator.
    ///
    /// The color is used by the focused border, but also as slight opacity
    /// based color on unfocused border, when [unfocusedHasBorder] and
    /// [unfocusedBorderIsColored] are true.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [baseSchemeColor] will be used.
    final SchemeColor? borderSchemeColor,

    /// The border width when the input is selected.
    ///
    /// If null, defaults to [kThickBorderWidth] = 2.
    final double? focusedBorderWidth,

    /// The border width when the input is unselected or disabled.
    ///
    /// If null, defaults to [kThinBorderWidth] = 1.
    final double? unfocusedBorderWidth,

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

    /// Focused input decoration has a border.
    ///
    /// Defaults to true.
    ///
    /// Applies to both outline and underline mode. You would typically
    /// use this in a design where you use a fill color and want focused
    /// input fields to only be highlighted by the fill color and not even
    /// have an unfocused input border style.
    ///
    /// When set to false, there is no border bored on states enabledBorder and
    /// disabledBorder, there is a border on focusedBorder, focusedErrorBorder
    /// and errorBorder, so error thus has a border also when it is not focused.
    final bool focusedHasBorder = true,

    /// Unfocused input decoration border uses the color baseScheme color.
    ///
    /// Applies to both outline and underline mode.
    ///
    /// When set to true, the unfocused borders also uses the [baseSchemeColor]
    /// as its border color, but with alpha [kEnabledBorderAlpha] (90%).
    ///
    /// If set to false, the color uses the SDK default unselected border color,
    /// which is [ColorScheme.onSurface] with 38% opacity.
    ///
    /// The unfocused border color selection also applies to it hovered state.
    ///
    /// Defaults to true.
    final bool unfocusedBorderIsColored = true,

    /// Use [baseSchemeColor] color tint on disabled state.
    ///
    /// Set to false to use default grey only disabled controls.
    ///
    /// Defaults to true.
    final bool tintedInteractions = true,

    /// Use [baseSchemeColor] color tint on disabled state.
    ///
    /// Set to false to use default grey only disabled controls.
    ///
    /// Defaults to true.
    final bool tintedDisabled = true,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    // Used color scheme is for dark mode.
    final bool isDark = colorScheme.brightness == Brightness.dark;

    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // Used border color, for focus and unfocused when that option is used.
    final Color borderColor = schemeColor(
        borderSchemeColor ?? baseSchemeColor ?? SchemeColor.primary,
        colorScheme);

    // Get effective alpha value for background color.
    final int effectiveAlpha = backgroundAlpha?.clamp(0, 255) ??
        (useM3
            ? 0xFF
            : isDark
                ? kFillColorAlphaDark
                : kFillColorAlphaLight);

    // TODO(rydmike): Decide and define consts for tinted disabled TextField.
    // Effective used fill color, can also be a totally custom color value.
    final Color usedFillColor = fillColor?.withAlpha(effectiveAlpha) ??
        MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return tintedDisabled
                ? baseColor
                    .blendAlpha(colorScheme.onSurface, 0x30)
                    .withAlpha(0x08)
                : colorScheme.onSurface.withOpacity(0.04); // M3 spec
          }
          return baseSchemeColor == null && useM3
              ? colorScheme.surfaceVariant.withAlpha(effectiveAlpha)
              : baseColor.withAlpha(effectiveAlpha);
        });

    // PrefixIconColor
    final SchemeColor prefixFallback =
        useM3 ? SchemeColor.onSurface : baseSchemeColor ?? SchemeColor.primary;
    final Color prefixIconColor =
        schemeColor(prefixIconSchemeColor ?? prefixFallback, colorScheme);

    // Some Flutter "magic" theme colors from ThemeData.
    final Color hintColor =
        isDark ? Colors.white60 : Colors.black.withAlpha(0x99); // 60%
    final Color suffixIconColorM2 = isDark ? Colors.white70 : Colors.black45;
    final Color disabledColor = isDark ? Colors.white38 : Colors.black38;

    final Color enabledBorder = unfocusedBorderIsColored
        ? borderColor.withAlpha(kEnabledBorderAlpha)
        : useM3
            ? borderType == FlexInputBorderType.underline
                ? colorScheme.onSurfaceVariant
                : colorScheme.outline
            : colorScheme.onSurface.withOpacity(0.38);

    // Default border radius.
    final double effectiveRadius =
        radius ?? (useM3 ? kInputDecoratorM3Radius : kInputDecoratorRadius);

    // Default outline widths.
    final double unfocusedWidth = unfocusedBorderWidth ?? kThinBorderWidth;
    final double focusedWidth = focusedBorderWidth ?? kThickBorderWidth;

    final InputBorder effectiveInputBorder =
        borderType == FlexInputBorderType.underline
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(effectiveRadius),
                  topRight: Radius.circular(effectiveRadius),
                ),
              )
            : OutlineInputBorder(
                gapPadding: gapPadding,
                borderRadius: BorderRadius.all(
                  Radius.circular(effectiveRadius),
                ),
              );

    return InputDecorationTheme(
      labelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.error)) {
          if (states.contains(MaterialState.focused)) {
            return TextStyle(color: colorScheme.error);
          }
          if (states.contains(MaterialState.hovered)) {
            return TextStyle(color: colorScheme.onErrorContainer);
          }
          return TextStyle(color: colorScheme.error);
        }
        if (states.contains(MaterialState.focused)) {
          return TextStyle(color: baseColor);
        }
        if (states.contains(MaterialState.hovered)) {
          return TextStyle(color: colorScheme.onSurfaceVariant);
        }
        if (states.contains(MaterialState.disabled)) {
          return tintedDisabled
              ? TextStyle(
                  color: baseColor
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                )
              : TextStyle(color: colorScheme.onSurface.withOpacity(0.38));
        }
        return TextStyle(
            color: useM3 ? colorScheme.onSurfaceVariant : hintColor);
      }),
      floatingLabelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.error)) {
          if (states.contains(MaterialState.focused)) {
            return TextStyle(color: colorScheme.error);
          }

          if (states.contains(MaterialState.hovered)) {
            return
                // TODO(rydmike): Default M3, excluding it. FCS opinionated.
                // useM3
                //   ? TextStyle(color: colorScheme.onErrorContainer)
                //   :
                TextStyle(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
            );
          }
          return TextStyle(color: colorScheme.error);
        }
        if (states.contains(MaterialState.focused)) {
          // TODO(rydmike): Verify that border color usage is correct here.
          return TextStyle(color: borderColor);
        }
        if (states.contains(MaterialState.hovered)) {
          return TextStyle(color: colorScheme.onSurfaceVariant);
        }
        if (states.contains(MaterialState.disabled)) {
          return tintedDisabled
              ? TextStyle(
                  color: baseColor
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                )
              : TextStyle(
                  color: useM3
                      ? colorScheme.onSurface.withOpacity(0.38)
                      : disabledColor);
        }
        return TextStyle(
            color: useM3 ? colorScheme.onSurfaceVariant : hintColor);
      }),
      helperStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return tintedDisabled
              ? TextStyle(
                  color: baseColor
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                )
              : TextStyle(
                  color: useM3
                      ? colorScheme.onSurface.withOpacity(0.38)
                      : Colors.transparent);
        }
        return TextStyle(
            color: useM3 ? colorScheme.onSurfaceVariant : hintColor);
      }),
      hintStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return TextStyle(
              color: tintedDisabled
                  ? baseColor
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha)
                  : disabledColor);
        }
        return TextStyle(color: hintColor);
      }),
      iconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return tintedDisabled
              ? baseColor
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledBackgroundAlpha)
              : colorScheme.onSurface.withOpacity(0.38);
        }
        if (states.contains(MaterialState.focused)) {
          return useM3 ? colorScheme.onSurfaceVariant : baseColor;
        }
        return useM3 ? colorScheme.onSurfaceVariant : suffixIconColorM2;
      }),
      prefixIconColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return tintedDisabled
              ? baseColor
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledBackgroundAlpha)
              : colorScheme.onSurface.withOpacity(0.38);
        }
        if (states.contains(MaterialState.focused)) {
          return prefixIconColor;
        }
        return useM3 ? colorScheme.onSurfaceVariant : suffixIconColorM2;
      }),
      suffixIconColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.error)) {
          // TODO(rydmike): Default M3 does this, excluding it. FCS Opinionated.
          // if (states.contains(MaterialState.hovered)) {
          //   return colorScheme.onErrorContainer;
          // }
          return colorScheme.error;
        }
        if (states.contains(MaterialState.disabled)) {
          return tintedDisabled
              ? baseColor
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledBackgroundAlpha)
              : colorScheme.onSurface.withOpacity(0.38);
        }
        if (states.contains(MaterialState.focused)) {
          return useM3 ? colorScheme.onSurfaceVariant : baseColor;
        }
        return useM3 ? colorScheme.onSurfaceVariant : suffixIconColorM2;
      }),
      filled: filled,
      fillColor: usedFillColor,
      hoverColor: tintedInteractions
          ? (fillColor ?? baseColor).withAlpha(kHoverBackgroundAlpha)
          : null,
      focusColor: tintedInteractions
          ? (fillColor ?? baseColor).withAlpha(kFocusBackgroundAlpha)
          : null,
      focusedBorder: effectiveInputBorder.copyWith(
        borderSide: focusedHasBorder
            ? BorderSide(
                color: borderColor,
                width: focusedWidth,
              )
            : BorderSide.none,
      ),
      enabledBorder: effectiveInputBorder.copyWith(
        borderSide: unfocusedHasBorder
            ? BorderSide(
                color: enabledBorder,
                width: unfocusedWidth,
              )
            : BorderSide.none,
      ),
      disabledBorder: effectiveInputBorder.copyWith(
        borderSide: unfocusedHasBorder
            ? BorderSide(
                color: tintedDisabled
                    ? borderColor
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha)
                    : borderType == FlexInputBorderType.underline
                        ? colorScheme.onSurface.withOpacity(0.38)
                        : colorScheme.onSurface.withOpacity(0.12),
                width: unfocusedWidth,
              )
            : BorderSide.none,
      ),
      focusedErrorBorder: effectiveInputBorder.copyWith(
        borderSide: focusedHasBorder
            ? BorderSide(
                color: colorScheme.error,
                width: focusedWidth,
              )
            : BorderSide.none,
      ),
      errorBorder: effectiveInputBorder.copyWith(
        borderSide: focusedHasBorder
            ? BorderSide(
                color: colorScheme.error
                    .withAlpha(useM3 ? 0xFF : kEnabledBorderAlpha),
                width: unfocusedWidth,
              )
            : BorderSide.none,
      ),
    );
  }

  /// An opinionated [MenuBarThemeData] theme.
  ///
  /// Only offers scheme color and elevation theming at the moment.
  static MenuBarThemeData menuBarTheme({
    // Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the MenuBar background color.
    final SchemeColor? backgroundSchemeColor,

    /// The shadow color of the MenuBar's [Material].
    ///
    /// The material's elevation shadow can be difficult to see for dark themes,
    /// so by default the menu classes add a semi-transparent overlay to
    /// indicate elevation. See [ThemeData.applyElevationOverlayColor].
    final Color? shadowColor,

    /// The surface tint color of the MnuBar's [Material].
    ///
    /// See [Material.surfaceTintColor] for more details.
    final Color? surfaceTintColor,

    /// The elevation of the MenuBar's [Material].
    final double? elevation,

    /// MenuBar corner radius.
    ///
    /// If not defined, defaults to 4, the M3 specification, via Flutter SDK
    /// widget default values.
    final double? radius,
  }) {
    final Color surface =
        schemeColor(backgroundSchemeColor ?? SchemeColor.surface, colorScheme);

    return MenuBarThemeData(
      style: MenuStyle(
        backgroundColor: MaterialStatePropertyAll<Color?>(surface),
        surfaceTintColor: surfaceTintColor != null
            ? MaterialStatePropertyAll<Color?>(surfaceTintColor)
            : null,
        shadowColor: shadowColor != null
            ? MaterialStatePropertyAll<Color?>(shadowColor)
            : null,
        elevation: MaterialStatePropertyAll<double?>(elevation),
        shape: radius != null
            ? MaterialStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
              )
            : null,
      ),
    );
  }

  /// An opinionated [MenuButtonThemeData] theme.
  static MenuButtonThemeData menuButtonTheme({
    // Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the MenuButton background color.
    ///
    /// If not defined, default to surface.
    ///
    /// Currently in FCS the [backgroundSchemeColor] is only used to set
    /// foreground color based on its color pair. The background is actually
    /// controlled via [MenuThemeData] in [menuTheme].
    final SchemeColor? backgroundSchemeColor,
  }) {
    final Color onSurface = schemeColorPair(
        backgroundSchemeColor ?? SchemeColor.surface, colorScheme);

    return MenuButtonThemeData(
      style: ButtonStyle(
        // Foreground color, use same for icon.
        foregroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return onSurface.withOpacity(0.38);
            }
            if (states.contains(MaterialState.pressed)) {
              return onSurface;
            }
            if (states.contains(MaterialState.hovered)) {
              return onSurface;
            }
            if (states.contains(MaterialState.focused)) {
              return onSurface;
            }
            return onSurface;
          },
        ),
        // icon foreground color.
        iconColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return onSurface.withOpacity(0.38);
            }
            if (states.contains(MaterialState.pressed)) {
              return onSurface;
            }
            if (states.contains(MaterialState.hovered)) {
              return onSurface;
            }
            if (states.contains(MaterialState.focused)) {
              return onSurface;
            }
            return onSurface;
          },
        ),
      ),
    );
  }

  /// An opinionated [MenuThemeData] theme.
  ///
  /// This theme is used by the menu for the [DropDownMenu], [MenuBar] and
  /// [MenuAnchor].
  static MenuThemeData menuTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Defines which [Theme] based [ColorScheme] based background color
    /// of [PopupMenuButton].
    ///
    /// If not defined, will remains null and via Flutter SDK defaults get
    /// [ColorScheme.surface] color.
    final SchemeColor? backgroundSchemeColor,

    /// Menu background opacity.
    ///
    /// Used by FlexColorScheme to modify the opacity the themed [MenuBar],
    /// [MenuAnchor] and [DropDownMenu] background color.
    ///
    /// Defaults to undefined (null).
    /// If undefined, produced result is same as 1, fully opaque.
    ///
    /// If opacity is defined and [backgroundSchemeColor] is undefined,
    /// then [ColorScheme.surface] will be used as background color to
    /// make a background color with opacity.
    final double? opacity,

    /// Menu corner radius.
    ///
    /// If not defined, default to 4 via Menu widget Flutter SDK defaults.
    final double? radius,

    /// Popup menu elevation.
    ///
    /// If not defined, defaults to 3 dp via Flutter widget SDK defaults.
    final double? elevation,

    /// Overrides the default value for MenuThemeData
    /// [menuStyle.surfaceTintColor].
    final Color? surfaceTintColor,
  }) {
    // Get effective background color.
    final Color? backgroundColor = backgroundSchemeColor != null
        ? schemeColor(backgroundSchemeColor, colorScheme)
            .withOpacity(opacity ?? 1.0)
        : opacity != null
            ? colorScheme.surface.withOpacity(opacity)
            : null;

    return MenuThemeData(
      style: MenuStyle(
        elevation: MaterialStatePropertyAll<double?>(elevation),
        backgroundColor: MaterialStatePropertyAll<Color?>(backgroundColor),
        surfaceTintColor: surfaceTintColor == null
            ? null
            : MaterialStatePropertyAll<Color>(surfaceTintColor),
        shape: radius != null
            ? MaterialStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
              )
            : null,
      ),
    );
  }

  /// An opinionated [NavigationBarThemeData] with a flat API.
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
  /// a custom sub-theme for [NavigationBarThemeData], as thins one does not
  /// need the complicated [MaterialStateProperty] which can be difficult to
  /// use. It instead exposes properties for the usable states.
  ///
  /// It can also set an [opacity] on the background color.
  static NavigationBarThemeData navigationBarTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Optional text style for the [NavigationBar] labels.
    ///
    /// If [useFlutterDefaults] is false, the text style
    /// [ThemeData.textTheme.labelMedium]  will be used as base style for the
    /// text style.
    ///
    /// If [useFlutterDefaults] is true, null will be passed to
    /// [FlexSubThemes.navigationBarTheme] and along to theme creation, if all
    /// labeling modifying properties (size and scheme color) are also null, it
    /// will then be passed along as null, allowing it to remain undefined
    /// and widget default behavior sets the default. If label size or scheme
    /// is defined, a default TextStyle() will be created, if
    /// [navigationBarLabelTextStyle] is undefined, that gets the requested size
    /// and color applied.
    ///
    /// The size and colors defined in any of the text size and color properties
    /// are applied as overrides on the text style.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected [NavigationBar] item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item, 12 is used as fallback if needed.
    final double? selectedLabelSize,

    /// The size of the text label on unselected [NavigationBar] items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on unselected items, 12 is used as fallback if needed.
    final double? unselectedLabelSize,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [NavigationBar]'s label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.primary].
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// label modifying properties are undefined, including the text style,
    /// the effective color will be [ColorScheme.onSurface] in M2 and M3.
    final SchemeColor? selectedLabelSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use as base for
    /// the [NavigationBar]'s unselected label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
    /// blend and opacity, if [mutedUnselectedLabel] is true.
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// label modifying properties are undefined, including the text style,
    /// the effective color will be [ColorScheme.onSurface] in M2 and
    /// [ColorScheme.onSurfaceVariant] in M3.
    final SchemeColor? unselectedLabelSchemeColor,

    /// If true, the unselected label in the [NavigationBar] use a more
    /// muted color version of the color defined by
    /// [navigationBarUnselectedLabelSchemeColor].
    /// The muting is unselected color with
    /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    /// and withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to true.
    final bool? mutedUnselectedLabel,

    /// The size of the icon on selected [NavigationBar] item.
    ///
    /// If undefined, defaults to 24.
    final double? selectedIconSize,

    /// The size of the icons on unselected [NavigationBar] items.
    ///
    /// If null, defaults to [selectedIconSize].
    final double? unselectedIconSize,

    /// Select which color from the theme's [ColorScheme] to use as base for
    /// the [NavigationBar]'s selected item icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.primary].
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// icon modifying properties are undefined, the effective color will be
    /// [ColorScheme.onSurface] in M2 and [ColorScheme.onSecondaryContainer]
    /// in M3.
    final SchemeColor? selectedIconSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use as base for
    /// the [NavigationBar]'s unselected item icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
    /// blend and opacity, if [mutedUnselectedIcon] is true.
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// icon modifying properties are undefined,
    /// the effective color will be [ColorScheme.onSurface] in M2 and
    /// [ColorScheme.onSurfaceVariant] in M3.
    final SchemeColor? unselectedIconSchemeColor,

    /// If true, the unselected icon in the [NavigationBar] use a more muted
    /// color version of the color defined by [unselectedIconSchemeColor].
    /// The muting is unselected color with
    /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    /// and withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to true.
    final bool? mutedUnselectedIcon,

    /// Select which color from the theme [ColorScheme] to use as base for
    /// the [NavigationBar]'s selected item indicator.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.primary], additionally
    /// a default [navigationBarIndicatorOpacity] is applied.
    ///
    /// If [useFlutterDefaults] true, and this property is undefined,
    /// the effective indicator color will be [ColorScheme.secondary]
    /// with opacity 24% in M2 and [ColorScheme.secondaryContainer] in M3.
    final SchemeColor? indicatorSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use as background
    /// color for the [NavigationBar].
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.background] in M2 and in M3 to
    /// [ColorScheme.surface], with an [ColorScheme.primary] used as overlay
    /// color with hard coded overlay elevation 3.
    ///
    /// If [useFlutterDefaults] true, and this property is undefined,
    /// the effective M2 background color will be [ColorScheme.surface],
    /// with an [ColorScheme.onSurface] used as overlay color with hard
    /// coded overlay elevation 3. The actual Flutter SDK elevation is also
    /// hard coded to 0.
    ///
    /// FlexColorScheme sets background defaults of [NavigationRail],
    /// [NavigationBar] and [BottomNavigationBar] to [ColorScheme.background]
    /// when it using opinionated component sub-themes.
    /// Flutter SDK uses different colors on all three widgets. Our opinion is
    /// that they should all default to using the same [ColorScheme] based
    /// color. FlexColorScheme uses and recommends background color as this
    /// default. The [ColorScheme.background] was chosen as it is the same that
    /// the Drawer uses as well, so when using tinted backgrounds where surface
    /// and background are different, they will still match.
    final SchemeColor? backgroundSchemeColor,

    /// NavigationBar background opacity.
    ///
    /// The opacity value is only applied when a none null value is selected
    /// in [backgroundSchemeColor], it cannot be applied to the default
    /// Flutter SDK background color available when backgroundSchemeColor is
    /// null.
    ///
    /// If undefined, defaults to 1, fully opaque.
    final double? opacity,

    /// [NavigationBar] elevation.
    ///
    /// If undefined, defaults to default Flutter SDK [NavigationBar] elevation,
    /// which if:
    ///  - If [useMaterial] if true, is 3 dp.
    ///  - If [useMaterial] if false, is 0 dp.
    final double? elevation,

    /// Overrides the default value of [NavigationBar.surfaceTintColor].
    final Color? surfaceTintColor,

    /// Overrides the default value of [NavigationBar.shadowColor].
    final Color? shadowColor,

    /// Height of the container for the Material 3 [NavigationBar].
    ///
    /// If undefined defaults to M3 spec 80dp.
    final double? height,

    /// Specifies when each [NavigationDestination]'s label should appear.
    ///
    /// This is used to determine the behavior of NavigationBar's destinations.
    ///
    /// If null, theme behavior defaults to
    /// `NavigationDestinationLabelBehavior.alwaysShow` via Flutter SDK default.
    final NavigationDestinationLabelBehavior? labelBehavior,

    /// The alpha value used on selection color of the selection indicator on
    /// the [NavigationBar].
    ///
    /// If not defined in M2 defaults to [kNavigationBarIndicatorAlpha],
    /// which is 0x3D = 61 = 24%. In M3 alpha is 0xFF, or opacity 1.
    ///
    /// The default is the same value as Widget SDK default behavior uses on its
    /// used secondary color on its indicator color on the [NavigationBar] in
    /// its M2 mode.
    final int? indicatorAlpha,

    /// Border radius of the selection indicator on the [NavigationBar].
    ///
    /// If not defined, defaults to [StadiumBorder].
    ///
    /// FCS default, follows the Material M3 guide:
    /// https://m3.material.io/components/navigation-bar/specs
    final double? indicatorRadius,

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
    /// Use Material3 default style when properties are undefined and Flutter
    /// defaults are requested with `useFlutterDefaults` property.
    ///
    /// This setting will override the default undefined background color, from
    /// background color to surface with primary overlay at elevation 3.
    ///
    /// Other defaults will still use FlexColorScheme's own opinionated
    /// defaults values, unless `useFlutterDefaults` is also set to true. In
    /// that case the Material 3 default will be used if `useMaterial3` is true,
    /// and Material 2 defaults will be used if it is false.
    ///
    /// The M2/M3 SDK defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,

    /// Set to true to use Flutter SDK defaults for [NavigationBar]
    /// theme when its properties are undefined (null), instead of using
    /// FlexColorScheme's own opinionated defaults.
    ///
    /// Recommend keeping it **false** for a more color harmonized component
    /// theme starting point. This flag can be helpful if you want to create
    /// custom sub-themes starting from less opinionated settings.
    ///
    /// When all required properties are undefined and flag is false or true,
    /// the effective default styles for undefined inputs become:
    ///
    /// ```
    ///                    FCS defaults   M2 defaults       useMaterial3:true
    /// useFlutterDefaults false          true              true
    /// results in:
    ///
    /// - background       surfaceVariant surface with      surface with
    ///                                   onSurface overlay primary overlay
    ///                    elev 0         elev 3            elev 3
    /// - height           80             80                80
    /// - indicator        primary op24%  secondary op24%   secondaryContainer
    /// - selected icon    primary        onSurface         onSecondaryContainer
    /// - unselected icon  onSurface      onSurface         onSurfaceVariant
    /// - Selected label   primary        onSurface         onSurface
    /// - unSelected label onSurface      onSurface         onSurfaceVariant
    /// - TextTheme        labelMedium    overline          labelMedium
    /// ```
    /// FCS further applies both an alpha blend and slight opacity to
    /// unselected icon and unselected label, but only if
    /// [navigationBarMutedUnselectedIcon] and
    /// [navigationBarMutedUnselectedLabel] are true respectively, this
    /// also applies to undefined color inputs.
    final bool useFlutterDefaults = false,
  }) {
    final bool useM3 = useMaterial3 ?? false;

    // Determine if we can even use default icon styles, only when all are null,
    // can we fall back to Flutter SDK default.
    final bool useDefaultTextStyle = labelTextStyle == null &&
        selectedLabelSize == null &&
        unselectedLabelSize == null &&
        selectedLabelSchemeColor == null &&
        unselectedLabelSchemeColor == null &&
        useFlutterDefaults;

    // Determine if we can even use default icon styles, only when all are null,
    // can we fall back to Flutter SDK default.
    final bool useDefaultIconTheme = selectedIconSize == null &&
        unselectedIconSize == null &&
        selectedIconSchemeColor == null &&
        unselectedIconSchemeColor == null &&
        useFlutterDefaults;

    // Get text color, defaults to primary.
    final Color labelColor = schemeColor(
        selectedLabelSchemeColor ?? SchemeColor.primary, colorScheme);

    // Get unselected label color, defaults to colorScheme.onSurface
    final Color unselectedLabelColor = schemeColor(
        unselectedLabelSchemeColor ?? SchemeColor.onSurface, colorScheme);

    // Get text style, defaults to TextStyle(), we can use it since
    // size and color are applied to is separately.
    final TextStyle textStyle = labelTextStyle ?? const TextStyle();

    // Get effective text sizes.
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 12;
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? labelSize;

    // Get icon color, default to primary.
    final Color iconColor = schemeColor(
        selectedIconSchemeColor ?? SchemeColor.primary, colorScheme);

    // Get unselected icon color, defaults to onSurface.
    final Color unselectedIconColor = schemeColor(
        unselectedIconSchemeColor ?? SchemeColor.onSurface, colorScheme);

    // Get effective icons sizes.
    final double iconSize = selectedIconSize ?? 24;
    final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

    // Background color, when using normal default, falls back to background.
    final Color backgroundColor = schemeColor(
            backgroundSchemeColor ?? SchemeColor.surfaceVariant, colorScheme)
        .withOpacity(opacity ?? 1.0);

    // Indicator color, when using normal default, falls back to primary.
    final Color indicatorColor =
        schemeColor(indicatorSchemeColor ?? SchemeColor.primary, colorScheme)
            .withAlpha(indicatorAlpha ?? kNavigationBarIndicatorAlpha);

    return NavigationBarThemeData(
      height: height,
      elevation: elevation,
      backgroundColor: backgroundSchemeColor == null
          ? useFlutterDefaults || useM3
              ? null
              : backgroundColor
          : backgroundColor,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      indicatorColor: indicatorSchemeColor == null
          ? useFlutterDefaults
              ? null
              : indicatorColor
          : indicatorColor,
      indicatorShape: indicatorRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(indicatorRadius),
              ),
            ),
      labelTextStyle: useDefaultTextStyle
          ? null
          : MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return textStyle.copyWith(
                    fontSize: labelSize,
                    color: labelColor,
                  );
                }
                return textStyle.copyWith(
                  fontSize: effectiveUnselectedLabelSize,
                  color: (mutedUnselectedLabel ?? true)
                      ? unselectedLabelColor
                          .blendAlpha(
                              unselectedLabelColor, unselectedAlphaBlend)
                          .withAlpha(unselectedAlpha)
                      : unselectedLabelColor,
                );
              },
            ),
      iconTheme: useDefaultIconTheme
          ? null
          : MaterialStateProperty.resolveWith<IconThemeData>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return IconThemeData(
                    size: iconSize,
                    color: iconColor,
                  );
                }
                return IconThemeData(
                  size: effectiveUnselectedIconSize,
                  color: (mutedUnselectedIcon ?? true)
                      ? unselectedIconColor
                          .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                          .withAlpha(unselectedAlpha)
                      : unselectedIconColor,
                );
              },
            ),
      labelBehavior: labelBehavior,
    );
  }

  /// An opinionated [NavigationDrawerThemeData] theme with simpler API.
  ///
  /// Can set [indicatorWidth], [indicatorRadius], [backgroundSchemeColor] and
  /// [indicatorSchemeColor] plus its opacity [indicatorOpacity] and colors
  /// for selected and unselected items [selectedItemSchemeColor],
  /// [unselectedItemSchemeColor].
  static NavigationDrawerThemeData navigationDrawerTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Defines which [Theme] based [ColorScheme] based background color
    /// of [NavigationDrawer].
    ///
    /// If not defined will default to [Drawer] theme
    /// background color. If it is not defined, then Flutter default uses
    /// uses surface color as default in M3, and background in M2.
    /// FCS uses surface in both modes.
    final SchemeColor? backgroundSchemeColor,

    /// Defines the width of [NavigationDrawer]'s indicator.
    ///
    /// If not defined, defaults to 336dp
    /// via Flutter SDK defaults for M3/M2. The 336dp width values is derived
    /// from the M3 padding spec of 12dp around both sides of the M3 drawers
    /// default width of 360dp.
    final double? indicatorWidth,

    /// Border radius of the selection indicator on the [NavigationDrawer].
    ///
    /// If not defined, defaults to [StadiumBorder].
    ///
    /// FCS default, follows the Material M3 guide:
    /// https://m3.material.io/components/navigation-drawer/specs
    final double? indicatorRadius,

    /// The TextStyle of the labels.
    ///
    /// You would pass in Theme.of(context).textTheme.labelLarge
    /// for correct M3 style.
    final TextStyle? textStyle,

    /// Defines which [Theme] based [ColorScheme] based color [NavigationDrawer]
    /// uses as as its background color on the selection indicator.
    ///
    /// If undefined, defaults to [SchemeColor.secondaryContainer].
    final SchemeColor? indicatorSchemeColor,

    /// The opacity of the used indicator.
    ///
    /// Defaults to 1, fully opaque if not defined.
    final double? indicatorOpacity,

    /// Defines which [Theme] based [ColorScheme] based color [NavigationDrawer]
    /// uses as as its selected item color.
    ///
    /// If undefined, defaults to correct contrast color pair
    /// for [indicatorSchemeColor].
    final SchemeColor? selectedItemSchemeColor,

    /// Defines which [Theme] based [ColorScheme] based color [NavigationDrawer]
    /// uses as as its unselected item color.
    ///
    /// If undefined, defaults to correct contrast color pair for
    /// [backgroundSchemeColor].
    final SchemeColor? unselectedItemSchemeColor,

    /// Overrides the default value of [NavigationDrawer.shadowColor].
    final Color? shadowColor,

    /// Overrides the default value of [NavigationDrawer.surfaceTintColor].
    final Color? surfaceTintColor,
  }) {
    // Get selected background color, defaults to surface.
    final Color backgroundColor =
        schemeColor(backgroundSchemeColor ?? SchemeColor.surface, colorScheme);
    final Color onBackGroundColorFallback = schemeColorPair(
        backgroundSchemeColor ?? SchemeColor.surface, colorScheme);
    final Color onBackgroundColor = unselectedItemSchemeColor != null
        ? schemeColor(unselectedItemSchemeColor, colorScheme)
        : onBackGroundColorFallback;

    // Selected indicator color
    final Color indicatorColor = schemeColor(
        indicatorSchemeColor ?? SchemeColor.secondaryContainer, colorScheme);
    final Color onIndicatorColorFallback = schemeColorPair(
        indicatorSchemeColor ?? SchemeColor.secondaryContainer, colorScheme);
    final Color onIndicatorColor = selectedItemSchemeColor != null
        ? schemeColor(selectedItemSchemeColor, colorScheme)
        : onIndicatorColorFallback;

    // Indicator size based on provided width
    final Size indicatorSize = Size(indicatorWidth ?? 336, 56);

    // TextStyle
    final TextStyle style = textStyle ?? const TextStyle();

    return NavigationDrawerThemeData(
      backgroundColor: backgroundColor,
      indicatorColor: indicatorColor.withOpacity(indicatorOpacity ?? 1.0),
      indicatorSize: indicatorSize,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      indicatorShape: indicatorRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(indicatorRadius),
              ),
            ),
      labelTextStyle:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        return style.apply(
          color: states.contains(MaterialState.selected)
              ? onIndicatorColor
              : onBackgroundColor,
        );
      }),
      iconTheme: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        return IconThemeData(
          size: 24.0,
          color: states.contains(MaterialState.selected)
              ? onIndicatorColor
              : onBackgroundColor,
        );
      }),
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
    /// If [useFlutterDefaults] is false, the text style
    /// [ThemeData.textTheme.labelMedium] will be used as base style for
    /// the text style.
    ///
    /// If [useFlutterDefaults] is true, null will be passed to
    /// [FlexSubThemes.navigationRailTheme] and along to theme creation, if all
    /// labeling modifying properties (size and scheme color) are also null, it
    /// will then be passed along as null, allowing it to remain undefined
    /// and widget default behavior sets the default. If label size or scheme
    /// is defined, a default TextStyle() will be created, if
    /// [navigationRailLabelTextStyle] is undefined, that gets the requested
    /// size and color applied.
    ///
    /// The size and colors defined in any of the text size and color properties
    /// are applied as overrides on the text style.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected [NavigationRail] item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item, 12 is used as fallback if needed.
    final double? selectedLabelSize,

    /// The size of the text label on unselected [NavigationRail] items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on unselected items, 12 is used as fallback if needed.
    final double? unselectedLabelSize,

    /// Select which color from the theme's [ColorScheme] to use as base for
    /// the [NavigationRail]'s selected label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.primary].
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// label modifying properties are undefined, including the text style,
    /// the effective color will be [ColorScheme.primary] in M2 and
    /// [ColorScheme.onSurface] in M3.
    final SchemeColor? selectedLabelSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use as base for
    /// the [NavigationRails]'s unselected label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
    /// blend and opacity, if [mutedUnselectedLabel] is true.
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// label modifying properties are undefined, including the text style,
    /// the effective color will be [ColorScheme.onSurface] with opacity 64% in
    /// M2 and [ColorScheme.onSurface] in M3.
    final SchemeColor? unselectedLabelSchemeColor,

    /// If true, the unselected label in the [NavigationRail] use a more
    /// muted color version of the color defined by
    /// [unselectedLabelSchemeColor]. The muting is unselected color with
    /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    /// and withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to true.
    final bool? mutedUnselectedLabel,

    /// The size of the icon on selected [NavigationRail] item.
    ///
    /// If undefined, it defaults to 24.
    final double? selectedIconSize,

    /// The size of the icon on unselected [NavigationRail] items.
    ///
    /// If undefined, defaults to [selectedIconSize].
    final double? unselectedIconSize,

    /// Select which color from the theme's [ColorScheme] to use as base for
    /// the [NavigationRail]'s selected item icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.primary].
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// icon modifying properties are undefined, the effective color will
    /// also be [ColorScheme.primary] in M2 and
    /// [ColorScheme.onSecondaryContainer] in M3.
    final SchemeColor? selectedIconSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [NavigationRail]'s unselected items icon color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
    /// blend and opacity,if [navigationRailMutedUnselectedLabel] is true.
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// icon modifying properties are undefined,
    /// the effective color will be [ColorScheme.onSurface] with 64% opacity
    /// in M2 and [ColorScheme.onSurfaceVariant] in M3.
    final SchemeColor? unselectedIconSchemeColor,

    /// If true, the unselected icon in the [NavigationRail] use a more muted
    /// color version of the color defined by
    /// [navigationBarUnselectedIconSchemeColor].
    /// The muting is unselected color with
    /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    /// and withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to true.
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
    /// If `undefined`, defaults to [NavigationRailThemeData.useIndicator].
    /// If that is also undefined, then it defaults to [ThemeData.useMaterial3].
    ///
    /// Defaults to true. Can be set to null and then uses above default
    /// widget behavior.
    final bool? useIndicator,

    /// Select which color from the theme [ColorScheme] to use as base for
    /// the selected [NavigationRails]'s highlighted item.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.primary], additionally
    /// a default [navigationBarIndicatorOpacity] is applied.
    ///
    /// If [useFlutterDefaults] true, and this property is undefined,
    /// the effective background color will also be [ColorScheme.secondary]
    /// with opacity 24% in M2 and [ColorScheme.secondaryContainer] in M3.
    final SchemeColor? indicatorSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use as background
    /// color for the [NavigationRail].
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.background].
    ///
    /// If [useFlutterDefaults] true, and this property is undefined,
    /// the effective background color will be [ColorScheme.surface].
    ///
    /// FlexColorScheme sets background defaults of [NavigationRail],
    /// [NavigationBar] and [BottomNavigationBar] to [ColorScheme.background]
    /// when it using opinionated component sub-themes.
    /// Flutter SDK uses different colors on all three widgets. Our opinion is
    /// that they should all default to using the same [ColorScheme] based
    /// color. FlexColorScheme uses and recommends background color as this
    /// default. The [ColorScheme.background] was chosen as it is the same that
    /// the Drawer uses as well, so when using tinted backgrounds where surface
    /// and background are different, they will still match.
    final SchemeColor? backgroundSchemeColor,

    /// NavigationRail background opacity.
    ///
    /// If undefined, defaults to 1, fully opaque.
    final double? opacity,

    /// [NavigationRail] elevation.
    ///
    /// If undefined, defaults to [kNavigationRailElevation] = 0.
    final double? elevation,

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
    /// I undefined, defaults to [kNavigationBarIndicatorAlpha],
    /// which is 0x3D = 61 = 24%.
    ///
    /// The default is the same value as Widget SDK default behavior uses on its
    /// used secondary color on its indicator color on the [NavigationBar],
    /// here we use same value on the [NavigationRail].
    /// needed later.
    final int? indicatorAlpha,

    /// Border radius of the selection indicator on the [NavigationBar].
    ///
    /// In M2 mode and when rail is extended, the indicator is always circular.
    ///
    /// If not defined, defaults to [StadiumBorder].
    ///
    /// FCS default, follows the Material M3 guide:
    /// https://m3.material.io/components/navigation-rail/specs.
    final double? indicatorRadius,

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
    /// Use Material3 default style when properties are undefined and Flutter
    /// defaults are requested with `useFlutterDefaults` property.
    ///
    /// Defaults will still use FlexColorScheme's own opinionated
    /// defaults values, unless `useFlutterDefaults` is also set to true. In
    /// that case the Material 3 default will be used if `useMaterial3` is true,
    /// and Material 2 defaults will be used if it is false.
    ///
    /// The M2/M3 SDK defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,

    /// Set to true to use Flutter SDK defaults for [NavigationRail]
    /// theme when its properties are undefined (null) instead of using
    /// [FlexColorScheme]'s own defaults.
    ///
    /// Recommend keeping it **false** for a more color harmonized component
    /// theme starting point. This flag may be helpful if you want to create
    /// custom sub-themes starting from less opinionated settings.
    ///
    /// Differences when flag is false versus true are:
    ///
    /// ```
    ///                    FCS defaults    M2 defaults      useMaterial3:true
    /// useFlutterDefaults false           true             true
    /// results in:
    ///
    /// - background       background      surface          surface
    /// - indicator        primary op24%   secondary op24%  secondaryContainer
    /// - selected icon    primary         primary          onSecondaryContainer
    /// - unselected icon  onSurface       onSurface op64%  onSurfaceVariant
    /// - selected label   primary         primary          onSurface
    /// - unSelected label onSurface       onSurface op64%  onSurface
    /// - TextTheme        labelMedium     bodyText1        labelMedium
    /// ```
    /// FCS further applies both an alpha blend and slight opacity to
    /// unselected icon and unselected label, but only if
    /// [navigationRailMutedUnselectedIcon] and
    /// are [navigationRailMutedUnselectedLabel] true respectively,
    /// this also applies to undefined color inputs.
    ///
    /// If you want a style that is consistent by default across
    /// [BottomNavigationBar], [NavigationBar] and [NavigationRail],
    /// prefer keeping this setting false.
    ///
    /// Defaults to false.
    final bool useFlutterDefaults = false,
  }) {
    final bool useM3 = useMaterial3 ?? false;

    // Determine if we can even use default icon styles, only when all are null,
    // can we fall back to Flutter SDK default.
    final bool useDefaultTextStyle = labelTextStyle == null &&
        selectedLabelSize == null &&
        unselectedLabelSize == null &&
        selectedLabelSchemeColor == null &&
        unselectedLabelSchemeColor == null &&
        useFlutterDefaults;

    // Determine if we can even use default icon styles, only when all are null,
    // can we fall back to Flutter SDK default.
    final bool useDefaultIconTheme = selectedIconSize == null &&
        unselectedIconSize == null &&
        selectedIconSchemeColor == null &&
        unselectedIconSchemeColor == null &&
        useFlutterDefaults;

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
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 12;
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? labelSize;

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

    // Effective indicator color.
    final Color effectiveIndicatorColor = schemeColor(
            indicatorSchemeColor ??
                (useFlutterDefaults
                    ? useM3
                        ? SchemeColor.secondaryContainer
                        : SchemeColor.secondary
                    : SchemeColor.primary),
            colorScheme)
        .withAlpha(indicatorAlpha ??
            ((useM3 && useFlutterDefaults)
                ? 0xFF
                : kNavigationBarIndicatorAlpha));

    // Effective usage value for indicator.
    final bool effectiveUseIndicator =
        (useM3 && useIndicator == null) || (useIndicator ?? false);

    // Background color, when using normal default, falls back to background.
    final Color backgroundColor = schemeColor(
            backgroundSchemeColor ?? SchemeColor.background, colorScheme)
        .withOpacity(opacity ?? 1.0);

    // Property order here as in NavigationRailThemeData
    return NavigationRailThemeData(
      backgroundColor: backgroundSchemeColor == null
          ? useFlutterDefaults
              ? null
              : backgroundColor
          : backgroundColor,
      elevation: elevation ?? kNavigationRailElevation,
      unselectedLabelTextStyle: useDefaultTextStyle
          ? null
          : textStyle.copyWith(
              fontSize: effectiveUnselectedLabelSize,
              color: (mutedUnselectedLabel ?? true)
                  ? unselectedLabelColor
                      .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                      .withAlpha(unselectedAlpha)
                  : unselectedLabelColor,
            ),
      selectedLabelTextStyle: useDefaultTextStyle
          ? null
          : textStyle.copyWith(
              fontSize: labelSize,
              color: labelColor,
            ),
      unselectedIconTheme: useDefaultIconTheme
          ? null
          : IconThemeData(
              size: effectiveUnselectedIconSize,
              opacity: 1,
              color: (mutedUnselectedIcon ?? true)
                  ? unselectedIconColor
                      .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                      .withAlpha(unselectedAlpha)
                  : unselectedIconColor,
            ),
      selectedIconTheme: useDefaultIconTheme
          ? null
          : IconThemeData(
              size: iconSize,
              opacity: 1,
              color: iconColor,
            ),
      groupAlignment: groupAlignment,
      labelType: labelType,
      // TODO(rydmike): This hack used to be needed, but is it still F3.7?
      // Logic to avoid SDKs over eager asserts and get same result.
      useIndicator: true,
      indicatorColor: effectiveUseIndicator
          ? effectiveIndicatorColor
          : Colors.black.withAlpha(0x00),
      indicatorShape: indicatorRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(indicatorRadius),
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

    /// Defines which [Theme] based [ColorScheme] based color, that the
    /// [OutlinedButton] uses as its outline color.
    ///
    /// If [useMaterial3] is false, and the [baseSchemeColor] is not defined,
    /// the [baseSchemeColor] is used as default button
    /// outline color, following M2 style.
    ///
    /// If [useMaterial3] is true, and the [outlineSchemeColor] is
    /// not defined, the [colorScheme.outline] is used as default button
    /// outline color in M3 style.
    final SchemeColor? outlineSchemeColor,

    /// The button corner border radius.
    ///
    /// If not defined, defaults to [kButtonRadius] 20dp in M2. When using
    /// M3 it defaults to Stadium border based on
    /// https://m3.material.io/components/buttons/specs
    final double? radius,

    /// The outline thickness when the button is pressed or in error state.
    ///
    /// If null, defaults to [kThickBorderWidth] = 2, when
    /// [useMaterial3] is false, and to 1 when [useMaterial3] is true.
    final double? pressedOutlineWidth,

    /// The outline thickness when the button is not selected and not pressed.
    ///
    /// If null, defaults to [kThinBorderWidth] = 1.0.
    final double? outlineWidth,

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
    final MaterialStateProperty<TextStyle?>? textStyle,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;

    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // Outline color logic with different M2 and M3 defaults.
    final Color outlineColor = outlineSchemeColor == null
        ? useM3
            ? schemeColor(SchemeColor.outline, colorScheme)
            : baseColor
        : schemeColor(outlineSchemeColor, colorScheme);

    // Default outline widths.
    final double normalWidth = outlineWidth ?? kThinBorderWidth;
    final double pressedWidth =
        pressedOutlineWidth ?? (useM3 ? 1 : kThickBorderWidth);

    // We are using FCS M2 buttons, styled in M3 fashion.
    if (!useM3) {
      return OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: minButtonSize ?? kButtonMinSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kButtonRadius),
            ),
          ), //buttonShape,
          padding: padding,
        ).copyWith(
          textStyle: textStyle,
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
                  color: outlineColor
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                  width: normalWidth,
                );
              }
              if (states.contains(MaterialState.error)) {
                return BorderSide(
                  color: colorScheme.error,
                  width: pressedWidth,
                );
              }
              if (states.contains(MaterialState.pressed)) {
                return BorderSide(
                  color: outlineColor,
                  width: pressedWidth,
                );
              }
              return BorderSide(
                color: outlineColor.withAlpha(kEnabledBorderAlpha),
                width: normalWidth,
              );
            },
          ),
        ),
      );
    } else {
      // We are using M3 style buttons, with potentially custom radius,
      // foregroundColor, outlineColor, overlayColor, padding
      // and minButtonSize.
      MaterialStateProperty<Color?>? foregroundColor;
      MaterialStateProperty<Color?>? overlayColor;
      // If a baseSchemeColor was given we need to define all M3 color in
      // all states, if it was not defined, we can keeping them all null
      // and let M3 widget defaults handle the colors.
      if (baseSchemeColor != null) {
        foregroundColor =
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }
          return baseColor;
        });

        overlayColor =
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return baseColor.withOpacity(0.08);
          }
          if (states.contains(MaterialState.focused)) {
            return baseColor.withOpacity(0.12);
          }
          if (states.contains(MaterialState.pressed)) {
            return baseColor.withOpacity(0.12);
          }
          return null;
        });
      }

      MaterialStateProperty<BorderSide>? side;
      // Define side it its widths or color has any custom definition,
      // If not we fall back to default theme.
      if (outlineSchemeColor != null ||
          outlineWidth != null ||
          pressedOutlineWidth != null) {
        side = MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: colorScheme.onSurface.withOpacity(0.12),
              width: normalWidth,
            );
          }
          if (states.contains(MaterialState.error)) {
            return BorderSide(
              color: colorScheme.error,
              width: pressedWidth,
            );
          }
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              color: outlineColor,
              width: pressedWidth,
            );
          }
          return BorderSide(
            color: outlineColor,
            width: normalWidth,
          );
        });
      }

      return OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: textStyle,
          foregroundColor: foregroundColor,
          overlayColor: overlayColor,
          minimumSize: ButtonStyleButton.allOrNull<Size>(minButtonSize),
          padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
          side: side,
          shape: radius == null
              ? null
              : ButtonStyleButton.allOrNull<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
                ),
        ),
      );
    }
  }

  /// An opinionated [PopupMenuThemeData] with custom corner radius.
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
  static PopupMenuThemeData popupMenuTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    final ColorScheme? colorScheme,

    /// Defines which [Theme] based [ColorScheme] based color is use as
    /// background color by [PopupMenuButton].
    ///
    /// Any passed in background color via the [color] property
    /// will override this [backgroundSchemeColor] value.
    ///
    /// If not defined, and [color] is undefined, then it defaults via Flutter
    /// SDK defaults to:
    /// - [useMaterial3] = false : defaults to theme.cardColor.
    /// - [useMaterial3] = true  : defaults to theme.colorScheme.surface.
    /// Usually they are the same.
    final SchemeColor? backgroundSchemeColor,

    /// Defines which [Theme] based [ColorScheme] based color is use as
    /// foreground color by [PopupMenuButton].
    ///
    /// If not defined and [backgroundSchemeColor] is, then it will default to
    /// the schemeColorPair for the [backgroundSchemeColor]. If
    /// [backgroundSchemeColor] is also null, then it defaults to Flutter SDK
    /// default foreground color [ColorScheme.onSurface].
    final SchemeColor? foregroundSchemeColor,

    /// The background color of [PopupMenuButton].
    ///
    /// If not defined, and [backgroundSchemeColor] is undefined, then it
    /// defaults via Flutter SDK defaults to:
    /// - [useMaterial3] = false : defaults to theme.cardColor.
    /// - [useMaterial3] = true  : defaults to theme.colorScheme.surface.
    /// Usually they are the same.
    final Color? color,

    /// The TextStyle of the selectable items on the [PopupMenuButton].
    ///
    /// The default is [textTheme.labelLarge], via Flutter SDK defaults.
    final TextStyle? textStyle,

    /// Popup menu corner radius.
    ///
    /// If not defined, defaults to 4 via Flutter SDK defaults.
    final double? radius,

    /// The elevation of the [PopupMenuButton].
    ///
    /// If not defined, then if [useMaterial3] is:
    /// - false : defaults to 8 dp
    /// - true  : defaults to 3 dp.
    /// via Flutter SDK widget default values.
    /// FCS will pass in [kPopupMenuM3Elevation] (3), if Material3 is true
    /// and [kPopupMenuM2Elevation] (6), if it is false.
    final double? elevation,

    /// The color used as an alpha overlay tint color on the effective
    /// [PopupMenuButton] background color.
    final Color? surfaceTintColor,
  }) {
    // Get selected background color, defaults to surface in M3 if not defined
    // ands to theme.cardColor in M2, typically they are the same.
    final Color? backgroundColor = color ??
        (colorScheme != null && backgroundSchemeColor != null
            ? schemeColor(backgroundSchemeColor, colorScheme)
            : null);
    final Color? onBackgroundColor =
        colorScheme != null && backgroundSchemeColor != null
            ? schemeColorPair(backgroundSchemeColor, colorScheme)
            : null;

    final Color? foregroundColor =
        colorScheme != null && foregroundSchemeColor != null
            ? schemeColor(foregroundSchemeColor, colorScheme)
            : onBackgroundColor;

    return PopupMenuThemeData(
      elevation: elevation,
      color: backgroundColor,
      surfaceTintColor: surfaceTintColor,
      textStyle: textStyle?.apply(color: foregroundColor),
      labelTextStyle: textStyle != null
          ? MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return textStyle.apply(
                    color: foregroundColor?.withOpacity(0.38));
              }
              return textStyle.apply(color: foregroundColor);
            })
          : null,
      shape: radius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            )
          : null,
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
    /// If not defined, [colorScheme.primary] will be used. This is more in-line
    /// with M3 design, but applied to M2 Radio. The M3 color design
    /// specification for the secondary color, is a poor choice for toggles and
    /// switches, primary color works better.
    final SchemeColor? baseSchemeColor,

    /// The splash radius of the circular Material ink response.
    ///
    /// Defaults to kRadialReactionRadius = 20.
    final double? splashRadius,

    /// Defines if unselected [Radio] is also themed to be [baseSchemeColor].
    ///
    /// If false, it is grey like in Flutter SDK. Defaults to true.
    ///
    /// If undefined, defaults to false.
    final bool? unselectedIsColored,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);
    final bool isLight = colorScheme.brightness == Brightness.light;

    final bool unselectedColored = unselectedIsColored ?? false;
    final bool tintInteract = useTintedInteraction ?? false;
    final bool tintDisable = useTintedDisable ?? false;

    return RadioThemeData(
      splashRadius: splashRadius,
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (useM3) {
            if (states.contains(MaterialState.selected)) {
              if (states.contains(MaterialState.disabled)) {
                if (tintDisable) {
                  return tintedDisable(colorScheme.onSurface, baseColor);
                }
                return colorScheme.onSurface.withOpacity(0.38);
              }
              if (states.contains(MaterialState.pressed)) {
                return baseColor;
              }
              if (states.contains(MaterialState.hovered)) {
                return baseColor;
              }
              if (states.contains(MaterialState.focused)) {
                return baseColor;
              }
              return baseColor;
            }
            if (states.contains(MaterialState.disabled)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return colorScheme.onSurface.withOpacity(0.38);
            }
            if (states.contains(MaterialState.pressed)) {
              if (unselectedColored) return baseColor.withAlpha(0xDD);
              return colorScheme.onSurface;
            }
            if (states.contains(MaterialState.hovered)) {
              if (unselectedColored) return baseColor.withAlpha(0xDD);
              return colorScheme.onSurface;
            }
            if (states.contains(MaterialState.focused)) {
              if (unselectedColored) return baseColor.withAlpha(0xDD);
              return colorScheme.onSurface;
            }
            if (unselectedColored) return baseColor.withAlpha(0xDD);
            return colorScheme.onSurfaceVariant;
          } else {
            if (states.contains(MaterialState.disabled)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
            }
            if (states.contains(MaterialState.selected)) {
              return baseColor;
            }
            if (unselectedColored) {
              return baseColor.withAlpha(0xDD);
            }
            // This is SDK default.
            return isLight ? Colors.black54 : Colors.white70;
          }
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.pressed)) {
              if (tintInteract) return baseColor.withOpacity(0.12);
              return colorScheme.onSurface.withOpacity(0.12);
            }
            if (states.contains(MaterialState.hovered)) {
              return baseColor.withOpacity(0.08);
            }
            if (states.contains(MaterialState.focused)) {
              return baseColor.withOpacity(0.12);
            }
            return Colors.transparent;
          }
          if (states.contains(MaterialState.pressed)) {
            return baseColor.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            if (tintInteract) return baseColor.withOpacity(0.08);
            return colorScheme.onSurface.withOpacity(0.08);
          }
          if (states.contains(MaterialState.focused)) {
            if (tintInteract) return baseColor.withOpacity(0.12);
            return colorScheme.onSurface.withOpacity(0.12);
          }
          return Colors.transparent;
        },
      ),
    );
  }

  /// An opinionated [SegmentedButtonThemeData] theme for the [SegmentedButton].
  static SegmentedButtonThemeData segmentedButtonTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as background
    /// color for the selected button.
    ///
    /// Defines the background color for selected button, and
    /// it's onColor pair defines the foreground for selected button.
    ///
    /// If not defined, [SchemeColor.secondaryContainer] will be used.
    final SchemeColor? selectedSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the
    /// background color for unselected segmented button.
    ///
    /// If not defined, [SchemeColor.surface] will be used.
    final SchemeColor? unselectedSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the
    /// foreground color for unselected segmented button.
    ///
    /// If not defined, [SchemeColor.onSurface] will be used.
    final SchemeColor? unselectedForegroundSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the border
    /// color for the toggle buttons.
    ///
    /// If not defined, [ColorScheme.outline] will be the effective result.
    final SchemeColor? borderSchemeColor,

    /// The button corner radius.
    ///
    /// If not defined, defaults to defaults to Stadium border.
    final double? radius,

    /// The width of the borders around the segmented button.
    ///
    /// If null, defaults to [kThinBorderWidth] = 1.0.
    final double? borderWidth,
  }) {
    // Get selected color, defaults to primary.
    final SchemeColor selectedScheme =
        selectedSchemeColor ?? SchemeColor.secondaryContainer;
    final Color selectedColor = schemeColor(selectedScheme, colorScheme);
    final Color onSelectedColor = schemeColorPair(selectedScheme, colorScheme);

    final Color unselectedColor =
        schemeColor(unselectedSchemeColor ?? SchemeColor.surface, colorScheme);
    final Color onUnselectedColor = schemeColor(
        unselectedForegroundSchemeColor ?? SchemeColor.onSurface, colorScheme);
    final Color borderColor =
        schemeColor(borderSchemeColor ?? SchemeColor.outline, colorScheme);
    // Effective border width.
    final double effectiveWidth = borderWidth ?? kThinBorderWidth;

    return SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return selectedColor;
          }
          // TODO(rydmike): Report Flutter transparency bug on SegmentedButton.
          return unselectedSchemeColor == null ? null : unselectedColor;
        }),
        foregroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.pressed)) {
              return onSelectedColor;
            }
            if (states.contains(MaterialState.hovered)) {
              return onSelectedColor;
            }
            if (states.contains(MaterialState.focused)) {
              return onSelectedColor;
            }
            return onSelectedColor;
          } else {
            if (states.contains(MaterialState.pressed)) {
              return unselectedForegroundSchemeColor == null
                  ? colorScheme.onSurface
                  : onUnselectedColor;
            }
            if (states.contains(MaterialState.hovered)) {
              return unselectedForegroundSchemeColor == null
                  ? colorScheme.onSurface
                  : onUnselectedColor;
            }
            if (states.contains(MaterialState.focused)) {
              return unselectedForegroundSchemeColor == null
                  ? colorScheme.onSurface
                  : onUnselectedColor;
            }
            return onUnselectedColor;
          }
        }),
        overlayColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.hovered)) {
              return unselectedColor.withOpacity(0.08);
            }
            if (states.contains(MaterialState.focused)) {
              return unselectedColor.withOpacity(0.12);
            }
            if (states.contains(MaterialState.pressed)) {
              return unselectedColor.withOpacity(0.12);
            }
          } else {
            if (states.contains(MaterialState.hovered)) {
              return unselectedSchemeColor == null
                  ? colorScheme.onSurface.withOpacity(0.08)
                  : onUnselectedColor.withOpacity(0.08);
            }
            if (states.contains(MaterialState.focused)) {
              return unselectedSchemeColor == null
                  ? colorScheme.onSurface.withOpacity(0.12)
                  : onUnselectedColor.withOpacity(0.12);
            }
            if (states.contains(MaterialState.pressed)) {
              return unselectedSchemeColor == null
                  ? colorScheme.onSurface.withOpacity(0.12)
                  : onUnselectedColor.withOpacity(0.12);
            }
          }
          return null;
        }),
        side: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: colorScheme.onSurface.withOpacity(0.12),
              width: effectiveWidth,
            );
          }
          return BorderSide(
            color: borderColor,
            width: effectiveWidth,
          );
        }),
        shape: radius == null
            ? null
            : ButtonStyleButton.allOrNull<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
              ),
      ),
    );
  }

  /// An opinionated [SliderThemeData] theme for the [Slider].
  ///
  /// Requires a [ColorScheme] in [colorscheme]. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  static SliderThemeData sliderTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the main
    /// color for the Slider.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.primary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The height of the [Slider] track.
    ///
    /// If not defined, defaults to 4 via Flutter SDK defaults.
    final double? trackHeight,

    /// Whether the value indicator should be shown for different types of
    /// sliders.
    ///
    /// By default, [showValueIndicator] is set to
    /// [ShowValueIndicator.onlyForDiscrete]. The value indicator is only shown
    /// when the thumb is being touched.
    final ShowValueIndicator? showValueIndicator,

    /// Enum used to select the type of built-in value indicator used by
    /// [Slider].
    ///
    /// The current two options included Material 2 default
    /// [RectangularSliderValueIndicatorShape] and Material 3 default
    /// [DropSliderValueIndicatorShape].
    ///
    /// If not defined, the default for the M2/M3 mode is used.
    final FlexSliderIndicatorType? valueIndicatorType,

    /// The color given to the [valueIndicatorShape] to draw itself with.
    ///
    /// If undefined, defaults to using Flutter SDK's logic for the color.
    final Color? valueIndicatorColor,

    /// The text style for the text on the value indicator.
    ///
    /// If undefined, defaults to using Flutter SDK's logic for the TextStyle.
    final TextStyle? valueIndicatorTextStyle,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);
    final Color onBaseColor =
        schemeColorPair(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    SliderComponentShape effectiveIndicatorShape() {
      if (valueIndicatorType == null) {
        return useM3
            ? const DropSliderValueIndicatorShape()
            : const RectangularSliderValueIndicatorShape();
      } else {
        switch (valueIndicatorType) {
          case FlexSliderIndicatorType.rectangular:
            return const RectangularSliderValueIndicatorShape();
          case FlexSliderIndicatorType.drop:
            return const DropSliderValueIndicatorShape();
        }
      }
    }

    final SliderComponentShape indicatorShape = effectiveIndicatorShape();

    return SliderThemeData(
      trackHeight: trackHeight,
      activeTrackColor: baseColor,
      inactiveTrackColor: baseColor.withOpacity(0.24),
      disabledActiveTrackColor: colorScheme.onSurface.withOpacity(0.32),
      disabledInactiveTrackColor: colorScheme.onSurface.withOpacity(0.12),
      activeTickMarkColor: onBaseColor.withOpacity(0.54),
      inactiveTickMarkColor: baseColor.withOpacity(0.54),
      disabledActiveTickMarkColor: onBaseColor.withOpacity(0.12),
      disabledInactiveTickMarkColor: colorScheme.onSurface.withOpacity(0.12),
      thumbColor: baseColor,
      disabledThumbColor: Color.alphaBlend(
          colorScheme.onSurface.withOpacity(.38), colorScheme.surface),
      overlayColor: baseColor.withOpacity(0.12),
      showValueIndicator: showValueIndicator,
      valueIndicatorColor: valueIndicatorColor,
      valueIndicatorShape: indicatorShape,
      valueIndicatorTextStyle: valueIndicatorTextStyle,
      // TODO(rydmike): RangeSlider to use real M3 style drop when supported.
      // Use the almost matching drop style for RangeSlider
      rangeValueIndicatorShape: indicatorShape is DropSliderValueIndicatorShape
          ? const PaddleRangeSliderValueIndicatorShape()
          : null,
    );
  }

  // TODO(rydmike): SnackBar needs two different corner radius versions.
  // The fixed one should not have a shape, but the floating one should.
  // Not possible to do via its theme, if it could be then the floating one
  // should follow the themed corner radius setting and pinned one
  // remain straight. The SnackBar implements different shapes for its
  // enum based [SnackBarBehavior], but only if [Shape] property is null:
  // If null, [SnackBar] provides different defaults depending on the
  // [SnackBarBehavior]. For [SnackBarBehavior.fixed], no overriding shape
  // is specified, so the [SnackBar] is rectangular. For
  // [SnackBarBehavior.floating], it uses a [RoundedRectangleBorder] with a
  // circular corner radius of 4.0.
  //
  // Opened issue: https://github.com/flutter/flutter/issues/108539

  /// An opinionated [SnackBarThemeData] with custom elevation.
  ///
  /// The [elevation] defaults to [kSnackBarElevation] (4).
  static SnackBarThemeData snackBarTheme({
    /// SnackBar elevation
    ///
    /// If undefined defaults to [kSnackBarElevation] = 4.
    final double? elevation,

    /// Corner radius of the [SnackBar].
    ///
    /// If not defined, defaults to 4 dp, but only when
    /// [SnackBar.behavior] style [SnackBarBehavior.floating] is used. This
    /// default is based on SDK widget default behavior and is  based on
    /// M3 Specification https://m3.material.io/components/snackbar/specs.
    ///
    /// NOTE: If this theme property is set, both SnackBars with behavior
    /// fixed and floating will get the assigned radius. See issue:
    /// https://github.com/flutter/flutter/issues/108539
    final double? radius,

    /// The background color of the themed SnackBar. Typically one of inverse
    /// brightness compared to theme's surface color brightness.
    ///
    /// If null then it default to Flutter SDK theme defaults below.
    /// When FlexColorScheme sub themes are used and [backgroundSchemeColor]
    /// has not been defined, it defaults to FCS default shown below:
    ///
    /// * Default in light theme mode:
    ///   * Via FCS: onSurface with primary blend at 45% opacity, with
    ///     total opacity 95%
    ///   * Flutter SDK M2 uses: colorScheme.onSurface with opacity 80%,
    ///     alpha blended on top of colorScheme.surface.
    ///   * Flutter SDK M3 uses: colorScheme.inverseSurface.
    ///
    /// * In dark theme mode:
    ///   * FCS: onSurface with primary blend at 39% opacity, with total
    ///     opacity 93%
    ///   * Flutter SDK M2 uses: colorScheme.onSurface
    ///   * Flutter SDK M2 uses: colorScheme.inverseSurface
    ///
    ///  If a [colorScheme] is passed in and [backgroundSchemeColor] is defined,
    ///  it will override [backgroundColor] and be used instead.
    final Color? backgroundColor,

    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    final ColorScheme? colorScheme,

    /// Selects which color from the passed in [colorScheme] to use as
    /// [SnackBar] background color.
    ///
    /// If not defined or [colorScheme] is not defined, then the passed in
    /// [backgroundColor] will be used, which may be null too and SnackBar then
    /// falls back Flutter SDK defaults, or to FCS default if this is used by
    /// FCS that passes in its one custom default.
    final SchemeColor? backgroundSchemeColor,

    /// Overrides the default value for [SnackBarAction.textColor].
    ///
    /// If null, [SnackBarAction] and [colorScheme] is defined, defaults to
    /// [ColorScheme.inversePrimary], if a [colorScheme] was not defined, then
    /// defaults to effective foreground color with alpha 0xDD.
    final SchemeColor? actionTextSchemeColor,
  }) {
    final Color? background =
        (colorScheme == null || backgroundSchemeColor == null)
            ? backgroundColor // might be null, then SDK theme defaults.
            : schemeColor(backgroundSchemeColor, colorScheme);

    final Color? foreground =
        (colorScheme != null && backgroundSchemeColor != null)
            ? schemeColorPair(backgroundSchemeColor, colorScheme)
            : background != null
                ? ThemeData.estimateBrightnessForColor(background) ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white
                : null;

    final Color? actionForeground = colorScheme != null
        ? schemeColor(
            actionTextSchemeColor ?? SchemeColor.inversePrimary, colorScheme)
        : null;

    final TextStyle? snackTextStyle = foreground != null
        ? ThemeData(brightness: Brightness.light)
            .textTheme
            .titleMedium!
            .copyWith(color: foreground)
        : null;

    return SnackBarThemeData(
      elevation: elevation ?? kSnackBarElevation,
      shape: radius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            )
          : null,
      backgroundColor: background,
      contentTextStyle: snackTextStyle,
      actionTextColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        return actionForeground ?? foreground?.withAlpha(0xDD) ?? Colors.grey;
      }),
      disabledActionTextColor:
          actionForeground?.withAlpha(0x11) ?? foreground?.withAlpha(0x11),

      // This is using same foreground as the text, but slightly muted from it
      // as the default should be, this just works with any resulting foreground
      // color and does not rely on M3 default onInverseSurface for similar
      // result, that only works on inverseSurface.
      closeIconColor: foreground?.withAlpha(0xAA),
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
    /// If not defined, [colorScheme.primary] will be used. This is more in-line
    /// with M3 design, but applied to M2 switch. The M3 color design
    /// specification for the secondary color, is a poor choice for toggles and
    /// switches, if such colors are used in M2 mode, primary color works
    /// better.
    final SchemeColor? baseSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the thumb
    /// color for the switch.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.primary] will be used in M2 mode.
    /// This is more in-line
    /// with M3 design, but applied to M2 switch. The M3 color design
    /// specification for the secondary color, is a poor choice for toggles and
    /// switches, if such colors are used in M2 mode, primary color works
    /// better.
    ///
    /// If not defined, defaults to:
    ///
    /// - If useMaterial3 is false [baseSchemeColor].
    /// - If useMaterial3 is true [SchemeColor.primaryContainer].
    final SchemeColor? thumbSchemeColor,

    /// The splash radius of the circular Material ink response.
    ///
    /// If null, default via SDK defaults to [kRadialReactionRadius] = 20.
    final double? splashRadius,

    /// Defines if unselected [Switch] is also themed to be [baseSchemeColor].
    ///
    /// If false, it is grey like in Flutter SDK.
    ///
    /// If undefined, defaults to false.
    final bool? unselectedIsColored,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;

    // Get colorScheme brightness.
    final bool isLight = colorScheme.brightness == Brightness.light;
    // Get selected base color, and its pair, defaults to primary and onPrimary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    final Color onBaseColor =
        schemeColorPair(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    final bool unselectedColored = unselectedIsColored ?? false;
    final bool tintInteract = useTintedInteraction ?? false;
    final bool tintDisable = useTintedDisable ?? false;

    // Get selected thumb color, and its pair, defaults to
    // M2: primary and onPrimary.
    // M3: primaryContainer and onPrimaryContainer
    final Color thumbColor = schemeColor(
        thumbSchemeColor ??
            (useM3
                ? SchemeColor.primaryContainer
                : baseSchemeColor ?? SchemeColor.primary),
        colorScheme);

    // Material 2 style Switch
    if (!useM3) {
      return SwitchThemeData(
        splashRadius: splashRadius,
        thumbColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              if (states.contains(MaterialState.selected)) {
                if (tintDisable) {
                  return tintedDisable(colorScheme.onSurface, baseColor);
                }
                return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
              }
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor)
                    .withAlpha(kAlphaLowDisabled);
              }
              return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
            }
            if (states.contains(MaterialState.selected)) {
              return thumbColor;
            }
            return isLight ? Colors.grey.shade50 : Colors.grey.shade400;
          },
        ),
        trackColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor)
                    .withAlpha(kAlphaVeryLowDisabled);
              }
              return isLight ? Colors.black12 : Colors.white10;
            }
            if (states.contains(MaterialState.selected)) {
              // TODO(rydmike): Add these alpha values as constants.
              return baseColor.withAlpha(isLight ? 0x70 : 0x80);
            }
            // Opinionated color on track when not selected
            if (unselectedColored) {
              // TODO(rydmike): Add these alpha values as constants.
              return baseColor.withAlpha(isLight ? 0x50 : 0x65);
            }
            // This is SDK default, yes that value is hard coded in SDK too.
            return isLight ? kSwitchM2LightTrackColor : Colors.white30;
          },
        ),
        overlayColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.pressed)) {
              return baseColor.withAlpha(kAlphaPressed);
            }
            if (states.contains(MaterialState.hovered)) {
              return baseColor.withAlpha(kAlphaHover);
            }
            if (states.contains(MaterialState.focused)) {
              return baseColor.withAlpha(kAlphaFocus);
            }
            return null;
          }
          if (states.contains(MaterialState.pressed)) {
            if (tintInteract) return baseColor.withAlpha(kAlphaPressed);
            return colorScheme.onSurface.withAlpha(kAlphaPressed);
          }
          if (states.contains(MaterialState.hovered)) {
            if (tintInteract) return baseColor.withAlpha(kAlphaHover);
            return colorScheme.onSurface.withAlpha(kAlphaHover);
          }
          if (states.contains(MaterialState.focused)) {
            if (tintInteract) return baseColor.withAlpha(kAlphaFocus);
            return colorScheme.onSurface.withAlpha(kAlphaFocus);
          }
          return null;
        }),
      );
    }
    // Material 3 style Switch
    else {
      return SwitchThemeData(
        splashRadius: splashRadius,
        thumbColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.surface;
            }
            if (tintDisable) {
              return tintedDisable(colorScheme.onSurface, baseColor);
            }
            return colorScheme.onSurface.withAlpha(kAlphaDisabled);
          }
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.pressed)) {
              return thumbColor;
            }
            if (states.contains(MaterialState.hovered)) {
              return thumbColor;
            }
            if (states.contains(MaterialState.focused)) {
              return thumbColor;
            }
            return onBaseColor;
          }
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.onSurfaceVariant;
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.onSurfaceVariant;
          }
          if (states.contains(MaterialState.focused)) {
            return colorScheme.onSurfaceVariant;
          }
          return colorScheme.outline;
        }),
        trackColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            if (states.contains(MaterialState.selected)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
            }
            return colorScheme.surfaceVariant.withAlpha(kAlphaVeryLowDisabled);
          }
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.pressed)) {
              return baseColor;
            }
            if (states.contains(MaterialState.hovered)) {
              return baseColor;
            }
            if (states.contains(MaterialState.focused)) {
              return baseColor;
            }
            return baseColor;
          }
          if (states.contains(MaterialState.pressed)) {
            return unselectedColored
                // TODO(rydmike): Add these alpha values as constants.
                ? baseColor.withAlpha(isLight ? 0x33 : 0x44)
                : colorScheme.surfaceVariant;
          }
          if (states.contains(MaterialState.hovered)) {
            return unselectedColored
                ? baseColor.withAlpha(isLight ? 0x33 : 0x44)
                : colorScheme.surfaceVariant;
          }
          if (states.contains(MaterialState.focused)) {
            return unselectedColored
                ? baseColor.withAlpha(isLight ? 0x33 : 0x44)
                : colorScheme.surfaceVariant;
          }
          return unselectedColored
              ? baseColor.withAlpha(isLight ? 0x33 : 0x44)
              : colorScheme.surfaceVariant;
        }),
        trackOutlineColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.transparent;
          }
          if (states.contains(MaterialState.disabled)) {
            if (tintDisable) {
              return tintedDisable(colorScheme.onSurface, baseColor);
            }
            return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
          }
          return colorScheme.outline;
        }),
        overlayColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.pressed)) {
              return baseColor.withAlpha(kAlphaPressed);
            }
            if (states.contains(MaterialState.hovered)) {
              return baseColor.withAlpha(kAlphaHover);
            }
            if (states.contains(MaterialState.focused)) {
              return baseColor.withAlpha(kAlphaFocus);
            }
            return null;
          }
          if (states.contains(MaterialState.pressed)) {
            if (tintInteract) return baseColor.withAlpha(kAlphaPressed);
            return colorScheme.onSurface.withAlpha(kAlphaPressed);
          }
          if (states.contains(MaterialState.hovered)) {
            if (tintInteract) return baseColor.withAlpha(kAlphaHover);
            return colorScheme.onSurface.withAlpha(kAlphaHover);
          }
          if (states.contains(MaterialState.focused)) {
            if (tintInteract) return baseColor.withAlpha(kAlphaFocus);
            return colorScheme.onSurface.withAlpha(kAlphaFocus);
          }
          return null;
        }),
      );
    }
  }

  /// An opinionated [TabBarTheme] theme.
  ///
  /// Contrary to the other opinionated static [FlexSubThemes] sub-theme
  /// function, this one is only a sub-set of the original and does not do or
  /// contain any feature shortcuts.
  ///
  /// The [FlexColorScheme.toTheme] needs some of the properties, like fore-
  /// and background colors used here, for other component theme definitions as
  /// well and has already computed them once, so they are reused here.
  static TabBarTheme tabBarTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Overrides the default value for [TabBar.labelStyle].
    final TextStyle? labelStyle,

    /// Overrides the default value for [TabBar.labelColor].
    final Color? labelColor,

    /// Overrides the default value for [TabBar.unselectedLabelColor].
    final Color? unselectedLabelColor,

    /// Overrides the default value for [TabBar.indicatorSize].
    final TabBarIndicatorSize? indicatorSize,

    /// The thickness of the underline border indicator on the [TabBar].
    ///
    /// If not defined, defaults to 2 in M2 and to 3 in M3.
    final double? indicatorWeight,

    /// The top left and right corner radius of the underline border
    /// indicator on the [TabBar].
    ///
    /// If not defined, defaults to 0 in M2 and to 3 in M3.
    final double? indicatorTopRadius,

    /// Overrides the default value for [TabBar.indicatorColor].
    final Color? indicatorColor,

    /// Overrides the default value for [TabBar.unselectedLabelStyle].
    final TextStyle? unselectedLabelStyle,

    // TODO(rydmike): Monitor when dividerColor bug fix lands in stable.
    /// The color of the divider.
    ///
    /// If null and [useMaterial3] is true, [TabBarTheme.dividerColor]
    /// color is used. If that is null and [useMaterial3] is true,
    /// [ColorScheme.surfaceVariant] will be used,
    /// otherwise divider will not be drawn.
    ///
    /// This feature does not work in Flutter 3.7 stable, at least not up until
    /// version 3.7.6. It is caused by a bug in Flutter SDK. The issue has
    /// been fixed via PR https://github.com/flutter/flutter/pull/119690 in
    /// master channel, but until the fix lands in Flutter stable, this
    /// feature does not work.
    final Color? dividerColor,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    final bool tintInteract = useTintedInteraction ?? false;
    final double weight = indicatorWeight ?? (useM3 ? 3 : 2);
    final double radius = indicatorTopRadius ?? (useM3 ? 3 : 0);

    final Decoration indicator = UnderlineTabIndicator(
      borderRadius: useM3 || indicatorWeight != null
          ? BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            )
          : null,
      borderSide: BorderSide(
        width: weight,
        color: indicatorColor ??
            (useM3 ? colorScheme.primary : colorScheme.onSurface),
      ),
    );

    final Color overlayBase =
        labelColor ?? (useM3 ? colorScheme.primary : colorScheme.onPrimary);

    // TODO(rydmike): Report TabBar overlayColor bug around row 1395 in TabBar.
    // This is a work-around to TabBar overlay theme bug in SDK.
    final bool useCustomOverlay = tintInteract ||
        (useM3 && labelColor != colorScheme.primary && labelColor != null) ||
        (!useM3 && labelColor != colorScheme.onPrimary && labelColor != null);

    return TabBarTheme(
      labelStyle: labelStyle,
      labelColor: labelColor,
      unselectedLabelStyle: unselectedLabelStyle,
      unselectedLabelColor: unselectedLabelColor,
      //
      indicatorSize: indicatorSize ??
          (useM3 ? TabBarIndicatorSize.label : TabBarIndicatorSize.tab),
      indicatorColor: indicatorColor,
      indicator: (indicatorWeight != null || indicatorTopRadius != null)
          ? indicator
          : null,
      dividerColor: dividerColor,
      //
      overlayColor: useCustomOverlay
          ? MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                if (states.contains(MaterialState.hovered)) {
                  return overlayBase.withAlpha(kAlphaHover);
                }
                if (states.contains(MaterialState.focused)) {
                  return overlayBase.withAlpha(kAlphaFocus);
                }
                if (states.contains(MaterialState.pressed)) {
                  return overlayBase.withAlpha(kAlphaPressed);
                }
                return null;
              }
              if (states.contains(MaterialState.hovered)) {
                if (tintInteract) return overlayBase.withAlpha(kAlphaHover);
                return colorScheme.onSurface.withAlpha(kAlphaHover);
              }
              if (states.contains(MaterialState.focused)) {
                if (tintInteract) return overlayBase.withAlpha(kAlphaFocus);
                return colorScheme.onSurface.withAlpha(kAlphaFocus);
              }
              if (states.contains(MaterialState.pressed)) {
                if (tintInteract) return overlayBase.withAlpha(kAlphaPressed);
                return overlayBase.withAlpha(kAlphaPressed);
              }
              return null;
            })
          : null,
    );
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
    /// If not defined, defaults to [kButtonRadius] 20dp in M2. When using
    /// M3 it defaults to Stadium border based on
    /// https://m3.material.io/components/buttons/specs
    final double? radius,

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
    /// If null, defaults to [kButtonMinSize] (`const Size(40.0, 40.0)`) when
    /// [useMaterial3] is false and to `const Size(64.0, 40.0)` when
    /// [useMaterial3] is true.
    final Size? minButtonSize,

    /// The style for the button's [Text] widget descendants.
    ///
    /// The color of the [textStyle] is typically not used directly, the
    /// [foregroundColor] is used instead.
    final MaterialStateProperty<TextStyle?>? textStyle,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // We are using FCS M2 buttons, styled in M3 fashion.
    if (!useM3) {
      return TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: minButtonSize ?? kButtonMinSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kButtonRadius),
            ),
          ), // buttonShape,
          padding: padding,
        ).copyWith(
          textStyle: textStyle,
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
    } else {
      // We are using M3 style buttons, with potentially custom radius,
      // foregroundColor, overlayColor, padding and minButtonSize.
      MaterialStateProperty<Color?>? foregroundColor;
      MaterialStateProperty<Color?>? overlayColor;

      // If a baseSchemeColor was given we need to define all M3 color in
      // all states, if it was not defined, we can keeping them all null
      // and let M3 widget defaults handle the colors.
      if (baseSchemeColor != null) {
        foregroundColor =
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }
          return baseColor;
        });

        overlayColor =
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return baseColor.withOpacity(0.08);
          }
          if (states.contains(MaterialState.focused)) {
            return baseColor.withOpacity(0.12);
          }
          if (states.contains(MaterialState.pressed)) {
            return baseColor.withOpacity(0.12);
          }
          return null;
        });
      }

      return TextButtonThemeData(
        style: ButtonStyle(
          textStyle: textStyle,
          foregroundColor: foregroundColor,
          overlayColor: overlayColor,
          minimumSize: ButtonStyleButton.allOrNull<Size>(minButtonSize),
          padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
          shape: radius == null
              ? null
              : ButtonStyleButton.allOrNull<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
                ),
        ),
      );
    }
  }

  /// An opinionated [TimePickerThemeData] with custom corner radius.
  ///
  /// Corner [radius] defaults to [kDialogRadius] 28dp. The internal shapes
  /// in the picker also have rounding, their corner radii are defined by
  /// [elementRadius] that defaults to [kCardRadius] 12.
  ///
  /// In the InputDecorator, if you pass it an input decoration style
  /// that matches the main input decoration style and corner rounding it
  /// will be used on the data entry elements in the picker.
  static TimePickerThemeData timePickerTheme({
    /// Pass in value you will you in your ThemeData use for your main
    /// [DialogTheme], if you let
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

    // TODO(rydmike): Elevation does not exist in beta 3.7.0-1.4.pre.
    // Probably wont exist in next stable after 3.3 either.
    /// Dialog elevation.
    ///
    /// If not defined, defaults to [kDialogElevation] = 6.
    ///
    /// NOTE:
    ///
    /// This elevation does not exist in beta 3.7.0-1.4.pre. It has no
    /// function until support from master lands.
    final double? elevation,

    /// Outer corner radius.
    ///
    /// If not defined, defaults to [kDialogRadius] 28dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/dialogs/specs
    final double? radius,

    /// Elements corner radius.
    ///
    /// Defaults to [kTimeElementRadius] = 8.
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
      dialBackgroundColor: colorScheme?.surfaceVariant,
      // TODO(rydmike): This elevation does not exist in beta 3.7.0-1.4.pre
      // elevation: elevation ?? kDialogElevation,
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
    /// base color for the toggle buttons.
    ///
    /// Always defines the background color for selected button, and
    /// it's onColor pair defines the foreground for selected button.
    ///
    /// If [unselectedSchemeColor] is not defined, [baseSchemeColor] is also
    /// used as foreground color for unselected buttons.
    ///
    /// If [borderSchemeColor] is not defined, then in M2 it is also used as
    /// color base for the border color, in M3 and undefined borderSchemeColor
    /// results in [ColorScheme.outline] color being used.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [SchemeColor.primary] will be used.
    final SchemeColor? baseSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the
    /// foreground color for unselected toggle buttons.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [baseSchemeColor] will be used as base.
    final SchemeColor? unselectedSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the border
    /// color for the toggle buttons.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [baseSchemeColor] will be used as base in M2, in M3
    /// [ColorScheme.outline] will be the effective result.
    final SchemeColor? borderSchemeColor,

    /// The button corner radius.
    ///
    /// If not defined, defaults to [kButtonRadius] 20dp.
    ///
    /// This is not in M3 specification, but FlexColorScheme component
    /// sub-themes harmonizes [ToggleButtons] size
    /// and border radius with the other Material buttons.
    final double? radius,

    /// The width of the borders around the toggle buttons.
    ///
    /// In this design it uses the same default as outline thickness for
    /// selected outline button and input decorator.
    ///
    /// If null, defaults to [kThinBorderWidth] = 1.0, when
    /// [useMaterial3] is false, and to 1 when [useMaterial3] is true.
    final double? borderWidth,

    /// Minimum button size.
    ///
    /// If undefined, defaults to [kButtonMinSize] = Size(40, 40).
    final Size? minButtonSize,

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

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    final bool? useMaterial3,
  }) {
    final bool useM3 = useMaterial3 ?? false;
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    final Color unselectedColor =
        schemeColor(unselectedSchemeColor ?? baseScheme, colorScheme);
    final Color onBaseColor = schemeColorPair(baseScheme, colorScheme);
    final SchemeColor borderDefault = useM3 ? SchemeColor.outline : baseScheme;
    final Color borderColor =
        schemeColor(borderSchemeColor ?? borderDefault, colorScheme);

    // Effective minimum button size.
    final Size effectiveMinButtonSize = minButtonSize ?? kButtonMinSize;
    // Effective border width.
    final double effectiveWidth =
        borderWidth ?? (useM3 ? 1.0 : kThinBorderWidth);
    // Effective visual density.
    final VisualDensity usedVisualDensity =
        visualDensity ?? VisualDensity.adaptivePlatformDensity;
    return ToggleButtonsThemeData(
      borderWidth: effectiveWidth,
      selectedColor: onBaseColor.withAlpha(kSelectedAlpha),
      color: unselectedColor,
      fillColor: baseColor.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
      borderColor:
          useM3 ? borderColor : borderColor.withAlpha(kEnabledBorderAlpha),
      selectedBorderColor: useM3
          ? borderColor
          : borderColor.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
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
      disabledBorderColor: borderColor
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
        // uses. This defaults to same value that ThemeData uses by default.
        minWidth: effectiveMinButtonSize.width -
            effectiveWidth * 2 +
            usedVisualDensity.baseSizeAdjustment.dx,
        minHeight: effectiveMinButtonSize.height -
            effectiveWidth * 2 +
            usedVisualDensity.baseSizeAdjustment.dy,
      ),
    );
  }

  /// An opinionated [TooltipThemeData]
  static TooltipThemeData tooltipTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in [colorScheme] to use as
    /// dialog background color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, defaults to [SchemeColor.onSurface].
    ///
    final SchemeColor? backgroundSchemeColor,

    /// Background color of the tooltip.
    ///
    /// If backgroundSchemeColor is defined, it will be used instead.
    final Color? backgroundColor,

    /// Foreground color of the tooltip.
    ///
    /// If backgroundSchemeColor is defined, its SchemeColor pair will be
    /// used instead.
    final Color? foregroundColor,

    /// Alpha value for the background color.
    ///
    /// If not defined, defaults to 0xFF, fully opaque.
    final int? backgroundAlpha,

    /// The border radius of the tooltip.
    ///
    /// If not defined, defaults to 4 same as Flutter SDK default.
    /// FCS sets it to 8 by default when using sub-themes and
    /// passes it here.
    final double? borderRadius,

    /// The color of the tooltip border.
    ///
    /// If not defined, defaults to fully transparent.
    final Color? borderColor,

    /// The tooltip text style.
    ///
    /// If not defined defaults to bodyMedium, with effective foregroundColor.
    final TextStyle? textStyle,

    /// The amount of space by which to inset the tooltip's [child].
    ///
    /// On mobile,
    ///   defaults to 16.0 logical pixels horizontally and 4.0 vertically.
    /// On desktop,
    ///   defaults to 8.0 logical pixels horizontally and 4.0 vertically.
    final EdgeInsetsGeometry? padding,

    /// If provided, the amount of empty space to surround the [Tooltip].
    ///
    /// Defines the tooltip's outer [Container.margin]. By default, a
    /// long tooltip will span the width of its window. If long enough,
    /// a tooltip might also span the window's height. This property allows
    /// one to define how much space the tooltip must be inset from the edges
    /// of their display window.
    ///
    /// If this property is null, the default margin is 0.0 logical
    /// pixels on all sides.
    final EdgeInsetsGeometry? margin,

    /// The length of time that a pointer must hover over a tooltip's widget
    /// before the tooltip will be shown.
    ///
    /// Defaults to 0 milliseconds (tooltips are shown immediately upon hover).
    final Duration? waitDuration,

    /// The length of time that the tooltip will be shown after a long press is
    /// released (if triggerMode is [TooltipTriggerMode.longPress]) or a tap is
    /// released (if triggerMode is [TooltipTriggerMode.tap]) or mouse pointer
    /// exits the widget.
    ///
    /// Defaults to 1.5 seconds for long press and tap released or 0.1 seconds
    /// for mouse pointer exits the widget.
    final Duration? showDuration,
  }) {
    final Color background =
        (backgroundSchemeColor == null && backgroundColor != null)
            ? backgroundColor
            : schemeColor(
                backgroundSchemeColor ?? SchemeColor.onSurface, colorScheme);

    final Color foreground =
        (backgroundSchemeColor == null && foregroundColor != null)
            ? foregroundColor
            : schemeColorPair(
                backgroundSchemeColor ?? SchemeColor.onSurface, colorScheme);

    final TextStyle tooltipTextStyle = textStyle == null
        ? ThemeData(brightness: Brightness.light)
            .textTheme
            .bodyMedium!
            .copyWith(color: foreground)
        : textStyle.copyWith(color: foreground);

    return TooltipThemeData(
      padding: padding,
      margin: margin,
      textStyle: tooltipTextStyle,
      decoration: BoxDecoration(
        color: background.withAlpha(backgroundAlpha ?? 0xFF),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 4)),
        border: Border.all(color: borderColor ?? Colors.transparent),
      ),
      waitDuration: waitDuration,
      showDuration: showDuration,
    );
  }
}
