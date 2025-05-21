import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flex_color_scheme.dart';
import 'flex_constants.dart';
import 'flex_extensions.dart';
import 'flex_sub_themes_data.dart' show FlexSubThemesData;

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

  /// The active theme's color scheme primaryFixed color will be used.
  primaryFixed,

  /// The active theme's color scheme primaryFixedDim color will be used.
  primaryFixedDim,

  /// The active theme's color scheme onPrimaryFixed color will be used.
  onPrimaryFixed,

  /// The active theme's color scheme onPrimaryFixedVariant color will be used.
  onPrimaryFixedVariant,

  /// The active theme's color scheme secondary color will be used.
  secondary,

  /// The active theme's color scheme onSecondary color will be used.
  onSecondary,

  /// The active theme's color scheme secondaryContainer color will be used.
  secondaryContainer,

  /// The active theme's color scheme onSecondaryContainer color will be used.
  onSecondaryContainer,

  /// The active theme's color scheme secondaryFixed color will be used.
  secondaryFixed,

  /// The active theme's color scheme secondaryFixedDim color will be used.
  secondaryFixedDim,

  /// The active theme's color scheme onSecondaryFixed color will be used.
  onSecondaryFixed,

  /// The active theme's color scheme onSecondaryFixedVariant color will
  /// be used.
  onSecondaryFixedVariant,

  /// The active theme's color scheme tertiary color will be used.
  tertiary,

  /// The active theme's color scheme onTertiary color will be used.
  onTertiary,

  /// The active theme's color scheme tertiaryContainer color will be used.
  tertiaryContainer,

  /// The active theme's color scheme onTertiaryContainer color will be used.
  onTertiaryContainer,

  /// The active theme's color scheme tertiaryFixed color will be used.
  tertiaryFixed,

  /// The active theme's color scheme tertiaryFixedDim color will be used.
  tertiaryFixedDim,

  /// The active theme's color scheme onTertiaryFixed color will be used.
  onTertiaryFixed,

  /// The active theme's color scheme onTertiaryFixedVariant color will be used.
  onTertiaryFixedVariant,

  /// The active theme's color scheme error color will be used.
  error,

  /// The active theme's color scheme onError color will be used.
  onError,

  /// The active theme's color scheme errorContainer color will be used.
  errorContainer,

  /// The active theme's color scheme onErrorContainer color will be used.
  onErrorContainer,

  /// The active theme's color scheme surface color will be used.
  surface,

  /// The active theme's color scheme  onSurface color will be used.
  onSurface,

  /// The active theme's color scheme surfaceDim color will be used.
  surfaceDim,

  /// The active theme's color scheme surfaceBright color will be used.
  surfaceBright,

  /// The active theme's color scheme surfaceContainerLowest color will be used.
  surfaceContainerLowest,

  /// The active theme's color scheme surfaceContainerLow color will be used.
  surfaceContainerLow,

  /// The active theme's color scheme surfaceContainer color will be used.
  surfaceContainer,

  /// The active theme's color scheme surfaceContainerHigh color will be used.
  surfaceContainerHigh,

  /// The active theme's color scheme surfaceContainerHighest color will
  /// be used.
  surfaceContainerHighest,

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

  /// Black color will be used.
  black,

  /// White color will be used.
  white,

  /// Transparent color will be used.
  transparent,
}

/// Enum used to select the type of built-in value indicator used by [Slider].
///
/// The current two options included are Material-2 default
/// [RectangularSliderValueIndicatorShape] and Material-3 default
/// [DropSliderValueIndicatorShape].
///
/// The current implementation of the drop in Flutter, at least up and until
/// version 3.24, does not match the official Material-3 specification.
/// More options will be added when they are supported in Flutter.
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

/// A class container with static sub-theme helper functions used by
/// component theming in [FlexColorScheme].
///
/// [FlexSubThemes] offers optional opinionated component theme helpers. You can
/// change many properties of the opt-in setup by defining custom
/// configuration values in the [FlexSubThemesData] configuration class,
/// and passing it to the [FlexColorScheme.subThemesData] property.
///
/// To enable the component sub-themes using default settings, pass a
/// default constructor [FlexSubThemesData] to [FlexColorScheme.subThemesData].
///
/// The configuration class [FlexSubThemesData] offers easy to use configuration
/// properties for using these sub-themes in [FlexColorScheme].
///
/// It is also possible to use the [FlexSubThemes] static sub-theming helpers
/// without even using [FlexColorScheme] based theming.
///
/// The [FlexSubThemesData] configuration class does not use these static
/// helpers. It is [FlexColorScheme] that uses the [FlexSubThemesData] class
/// to configure the opt-in sub-themes, based on the setup information provided
/// via [FlexColorScheme.subThemesData], by passing properties defined in it, to
/// the sub-theme helpers below, that are then used to define the component
/// sub-themes for the produced [ThemeData].
///
/// These component theme helpers are currently available:
///
/// * [AppBarTheme] for [AppBar] via [appBarTheme].
/// * [BottomAppBarTheme] for [BottomAppBar] via [bottomAppBarTheme].
/// * [BottomNavigationBarThemeData] for [BottomNavigationBar] via
///   [bottomNavigationBarTheme].
/// * [BottomSheetThemeData] for [BottomSheet] via [bottomSheetTheme].
/// * [ButtonThemeData] for old deprecated buttons, via [buttonTheme].
/// * [CardThemeData] for [Card] via [cardTheme].
/// * [CheckboxThemeData] for [Checkbox] via [checkboxTheme].
/// * [ChipThemeData] for [Chip] via [chipTheme].
/// * [DatePickerThemeData] for [DatePickerDialog] via [datePickerTheme].
/// * [DialogThemeData] for [Dialog] via [dialogTheme].
/// * [DrawerThemeData] for [Drawer] via [drawerTheme].
/// * [DropdownMenuThemeData] for [DropdownMenu] via [dropdownMenuTheme].
/// * [ElevatedButtonThemeData] for [ElevatedButton] via [elevatedButtonTheme].
/// * [FilledButtonThemeData] for [FilledButton] via
///   [FlexSubThemes.filledButtonTheme].
/// * [FloatingActionButtonThemeData] for [FloatingActionButton] via
///   [floatingActionButtonTheme].
/// * [IconButtonThemeData] for [IconButton] via [iconButtonTheme].
/// * [InputDecorationTheme] for [InputDecoration] via [inputDecorationTheme].
/// * [ListTileThemeData] for [ListTile] via [listTileTheme].
/// * [MenuBarThemeData] for [MenuBar] via [menuBarTheme].
/// * [MenuButtonThemeData] for [MenuItemButton] and [SubmenuButton] via
///   [menuButtonTheme].
/// * [MenuThemeData] for [MenuBar], [MenuAnchor] and [DropdownMenu] via
///   [menuTheme].
/// * [NavigationBarThemeData] for [NavigationBar] via [navigationBarTheme].
/// * [NavigationDrawerThemeData] for [NavigationDrawer] via
///   [navigationDrawerTheme].
/// * [NavigationRailThemeData] for [NavigationRail] via [navigationRailTheme].
/// * [OutlinedButtonThemeData] for [OutlinedButton] via [outlinedButtonTheme].
/// * [PopupMenuThemeData] for [PopupMenuButton] via [popupMenuTheme].
/// * [RadioThemeData] for [Radio] via [radioTheme].
/// * [SearchBarThemeData] for [SearchBar] via [searchBarTheme].
/// * [SearchViewThemeData] for [SearchBar] and its open view via
///   [searchViewTheme].
/// * [SegmentedButtonThemeData] for [SegmentedButton] via
///   [segmentedButtonTheme].
/// * [SliderThemeData] for [Slider] via [sliderTheme].
/// * [SnackBarThemeData] for [SnackBar] via [snackBarTheme].
/// * [SwitchThemeData] for [Switch] via [switchTheme].
/// * [TabBarThemeData] for [TabBar] via [tabBarTheme].
/// * [TextButtonThemeData] for [TextButton] via [textButtonTheme].
/// * [TextSelectionThemeData] for [TextField] via [textSelectionTheme].
/// * [TimePickerThemeData] for [TimePickerDialog] via [timePickerTheme].
/// * [ToggleButtonsThemeData] for [ToggleButtons] via [toggleButtonsTheme].
/// * [TooltipThemeData] for [Tooltip] via [tooltipTheme].
///
/// While it is possible to use them without [FlexColorScheme] it may not be
/// ideal, as they are designed with the features used and needed by
/// [FlexColorScheme] and its configuration class [FlexSubThemesData] in mind.
///
/// The [FlexSubThemes] may have more frequent breaking changes than
/// [FlexColorScheme] and [FlexSubThemesData] as it is a more secondary level.
/// It was decided to keep their APIs public as the may also be useful for
/// other theming solutions.
abstract final class FlexSubThemes {
  /// Returns the [Color] from passed in [ColorScheme] in [colorScheme]
  /// corresponding to the [SchemeColor] enum selection in [value].
  ///
  /// This function is used to select a none default color available in the
  /// theme's [ColorScheme] in opinionated sub-themes, used for example by:
  ///
  /// - [TextField] in [FlexSubThemes.inputDecorationTheme]
  /// - [TabBar] indicator color
  /// - [BottomNavigationBar] in [FlexSubThemes.bottomNavigationBarTheme]
  /// - [NavigationBar] in [FlexSubThemes.navigationBarTheme]
  /// - [ChipThemeData] from [FlexSubThemes.chipTheme].
  /// - [FloatingActionButton] from [FlexSubThemes.floatingActionButtonTheme]
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
      case SchemeColor.primaryFixed:
        return colorScheme.primaryFixed;
      case SchemeColor.primaryFixedDim:
        return colorScheme.primaryFixedDim;
      case SchemeColor.onPrimaryFixed:
        return colorScheme.onPrimaryFixed;
      case SchemeColor.onPrimaryFixedVariant:
        return colorScheme.onPrimaryFixedVariant;
      case SchemeColor.secondary:
        return colorScheme.secondary;
      case SchemeColor.onSecondary:
        return colorScheme.onSecondary;
      case SchemeColor.secondaryContainer:
        return colorScheme.secondaryContainer;
      case SchemeColor.onSecondaryContainer:
        return colorScheme.onSecondaryContainer;
      case SchemeColor.secondaryFixed:
        return colorScheme.secondaryFixed;
      case SchemeColor.secondaryFixedDim:
        return colorScheme.secondaryFixedDim;
      case SchemeColor.onSecondaryFixed:
        return colorScheme.onSecondaryFixed;
      case SchemeColor.onSecondaryFixedVariant:
        return colorScheme.onSecondaryFixedVariant;
      case SchemeColor.tertiary:
        return colorScheme.tertiary;
      case SchemeColor.onTertiary:
        return colorScheme.onTertiary;
      case SchemeColor.tertiaryContainer:
        return colorScheme.tertiaryContainer;
      case SchemeColor.onTertiaryContainer:
        return colorScheme.onTertiaryContainer;
      case SchemeColor.tertiaryFixed:
        return colorScheme.tertiaryFixed;
      case SchemeColor.tertiaryFixedDim:
        return colorScheme.tertiaryFixedDim;
      case SchemeColor.onTertiaryFixed:
        return colorScheme.onTertiaryFixed;
      case SchemeColor.onTertiaryFixedVariant:
        return colorScheme.onTertiaryFixedVariant;
      case SchemeColor.error:
        return colorScheme.error;
      case SchemeColor.onError:
        return colorScheme.onError;
      case SchemeColor.errorContainer:
        return colorScheme.errorContainer;
      case SchemeColor.onErrorContainer:
        return colorScheme.onErrorContainer;
      case SchemeColor.surface:
        return colorScheme.surface;
      case SchemeColor.onSurface:
        return colorScheme.onSurface;
      case SchemeColor.surfaceDim:
        return colorScheme.surfaceDim;
      case SchemeColor.surfaceBright:
        return colorScheme.surfaceBright;
      case SchemeColor.surfaceContainerLowest:
        return colorScheme.surfaceContainerLowest;
      case SchemeColor.surfaceContainerLow:
        return colorScheme.surfaceContainerLow;
      case SchemeColor.surfaceContainer:
        return colorScheme.surfaceContainer;
      case SchemeColor.surfaceContainerHigh:
        return colorScheme.surfaceContainerHigh;
      case SchemeColor.surfaceContainerHighest:
        return colorScheme.surfaceContainerHighest;
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
      case SchemeColor.black:
        return Colors.black;
      case SchemeColor.white:
        return Colors.white;
      case SchemeColor.transparent:
        return Colors.transparent;
    }
  }

  /// Returns the correct [SchemeColor] to be used as contrasting on
  /// [SchemeColor] pair for [SchemeColor] passed in via [value].
  static SchemeColor onSchemeColor(
    SchemeColor value, {
    bool useOnSurfaceVariant = false,
  }) {
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
      case SchemeColor.primaryFixed:
        return SchemeColor.onPrimaryFixed;
      case SchemeColor.onPrimaryFixed:
        return SchemeColor.primaryFixed;
      case SchemeColor.primaryFixedDim:
        return SchemeColor.onPrimaryFixedVariant;
      case SchemeColor.onPrimaryFixedVariant:
        return SchemeColor.primaryFixedDim;
      case SchemeColor.secondary:
        return SchemeColor.onSecondary;
      case SchemeColor.onSecondary:
        return SchemeColor.secondary;
      case SchemeColor.secondaryContainer:
        return SchemeColor.onSecondaryContainer;
      case SchemeColor.onSecondaryContainer:
        return SchemeColor.secondaryContainer;
      case SchemeColor.secondaryFixed:
        return SchemeColor.onSecondaryFixed;
      case SchemeColor.onSecondaryFixed:
        return SchemeColor.secondaryFixed;
      case SchemeColor.secondaryFixedDim:
        return SchemeColor.onSecondaryFixedVariant;
      case SchemeColor.onSecondaryFixedVariant:
        return SchemeColor.secondaryFixedDim;
      case SchemeColor.tertiary:
        return SchemeColor.onTertiary;
      case SchemeColor.onTertiary:
        return SchemeColor.tertiary;
      case SchemeColor.tertiaryContainer:
        return SchemeColor.onTertiaryContainer;
      case SchemeColor.onTertiaryContainer:
        return SchemeColor.tertiaryContainer;
      case SchemeColor.tertiaryFixed:
        return SchemeColor.onTertiaryFixed;
      case SchemeColor.onTertiaryFixed:
        return SchemeColor.tertiaryFixed;
      case SchemeColor.tertiaryFixedDim:
        return SchemeColor.onTertiaryFixedVariant;
      case SchemeColor.onTertiaryFixedVariant:
        return SchemeColor.tertiaryFixedDim;
      case SchemeColor.error:
        return SchemeColor.onError;
      case SchemeColor.onError:
        return SchemeColor.error;
      case SchemeColor.errorContainer:
        return SchemeColor.onErrorContainer;
      case SchemeColor.onErrorContainer:
        return SchemeColor.errorContainer;
      case SchemeColor.surface:
      case SchemeColor.surfaceDim:
      case SchemeColor.surfaceBright:
      case SchemeColor.surfaceContainerLowest:
      case SchemeColor.surfaceContainerLow:
      case SchemeColor.surfaceContainer:
      case SchemeColor.surfaceContainerHigh:
      case SchemeColor.surfaceContainerHighest:
      case SchemeColor.transparent:
        return useOnSurfaceVariant
            ? SchemeColor.onSurfaceVariant
            : SchemeColor.onSurface;
      case SchemeColor.onSurface:
        return SchemeColor.surface;
      case SchemeColor.onSurfaceVariant:
        return SchemeColor.surfaceContainerLowest;
      case SchemeColor.outline:
        return SchemeColor.surface;
      case SchemeColor.outlineVariant:
        return SchemeColor.onSurface;
      case SchemeColor.shadow:
        return SchemeColor.outline;
      case SchemeColor.scrim:
        return SchemeColor.outline;
      case SchemeColor.inverseSurface:
        return SchemeColor.onInverseSurface;
      case SchemeColor.onInverseSurface:
        return SchemeColor.inverseSurface;
      case SchemeColor.inversePrimary:
        return SchemeColor.onSurface;
      case SchemeColor.black:
        return SchemeColor.white;
      case SchemeColor.white:
        return SchemeColor.black;
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
  ///
  /// For the extra colors, black is pair for white and wise versa and
  /// transparent is paired with onSurface.
  static Color schemeColorPair(
    SchemeColor value,
    ColorScheme colorScheme, {
    bool useOnSurfaceVariant = false,
  }) =>
      schemeColor(
        onSchemeColor(value, useOnSurfaceVariant: useOnSurfaceVariant),
        colorScheme,
      );

  /// A factor used by tinted interactions to increase the alpha based
  /// opacity Material-3 baseline based opacity values for hover, focus and
  /// splash under certain conditions.
  ///
  /// Used by component themes. The factor is different depending on
  /// if the color is light or dark. This factor increases the opacity of
  /// the overlay color compared to the opacity used by M3 default. It works
  /// well because the overlay color is also alpha blend colored. This extra
  /// factor is used for interaction effects on colored widgets, when
  /// using interactions on surface colors a lower factor is used.
  static double _tintAlphaFactor(
    Color color,
    Brightness mode, [
    bool surfaceMode = false,
  ]) {
    if (mode == Brightness.light) {
      return surfaceMode
          ? ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 1.5
              : 4.0
          : ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 5.0
              : 2.0;
    } else {
      return surfaceMode
          ? ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 5.0
              : 2.0
          : ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 5.0
              : 4.0;
    }
  }

  /// Returns the FCS opinionated tinted hover color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedHovered(Color overlay, Color tint, [double factor = 1]) {
    // Used kAlphaTintedHighlight 0x11 = 17 = 6.7%
    final double usedAlpha =
        (kAlphaTintedHovered * factor).round().clamp(0x00, 0xFF) / 255;
    // Tint color alpha blend into overlay kTintHover 0xB2 = 178 = 69.8%
    return overlay.blendAlpha(tint, kTintHover).withValues(alpha: usedAlpha);
  }

  /// Returns the FCS opinionated tinted highlight color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedHighlight(Color overlay, Color tint, [double factor = 1]) {
    // Used kAlphaTintedHighlight 0x0F = 15 = 5.9%
    final double usedAlpha =
        (kAlphaTintedHighlight * factor).round().clamp(0x00, 0xFF) / 255;
    // Tint color alpha blend into overlay kTintHighlight 0xA5 = 165 = 65%
    return overlay
        .blendAlpha(tint, kTintHighlight)
        .withValues(alpha: usedAlpha);
  }

  /// Returns the FCS opinionated tinted splash color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedSplash(Color overlay, Color tint, [double factor = 1]) {
    // Used kAlphaTintSplash 0x10 = 16 = 6.3%
    final double usedAlpha =
        (kAlphaTintSplash * factor).round().clamp(0x00, 0xFF) / 255;
    // Tint color alpha blend into overlay kTintSplash 0xA5 = 165 = 65%
    return overlay.blendAlpha(tint, kTintSplash).withValues(alpha: usedAlpha);
  }

  /// Returns the FCS opinionated tinted splash color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedPressed(Color overlay, Color tint, [double factor = 1]) {
    // Used kAlphaTintPressed 0x10 = 16 = 6.3%
    final double usedAlpha =
        (kAlphaTintPressed * factor).round().clamp(0x00, 0xFF) / 255;
    // Tint color alpha blend into overlay kTintPressed 0xA5 = 165 = 65%
    return overlay.blendAlpha(tint, kTintPressed).withValues(alpha: usedAlpha);
  }

  /// Returns the FCS opinionated tinted focus color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedFocused(Color overlay, Color tint, [double factor = 1]) {
    // Used kAlphaTintFocused 0x1C = 28 = 11%
    final double usedAlpha =
        (kAlphaTintFocused * factor).round().clamp(0x00, 0xFF) / 255;
    // Tint color alpha blend into overlay kTintFocus 0xB2 = 178 = 70%.
    return overlay.blendAlpha(tint, kTintFocus).withValues(alpha: usedAlpha);
  }

  /// Returns the FCS opinionated tinted disabled color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  static Color tintedDisable(Color overlay, Color tint) =>
      // Tint color alpha blend into overlay #66=40%
      // Opacity of result #61=38%, same as M3 opacity on disable.
      overlay
          .blendAlpha(tint, kTintDisabled)
          .withValues(alpha: kAlphaDisabledFloat);

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
    final ColorScheme? colorScheme,

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

    /// Overrides the default value of the [AppBar.toolbarTextStyle]
    /// property in all descendant [AppBar] widgets.
    final TextStyle? toolbarTextStyle,

    /// Overrides the default value of [AppBar.titleTextStyle]
    /// property in all descendant [AppBar] widgets.
    final TextStyle? titleTextStyle,

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
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
      // TODO(rydmike): This is a workaround to make tint elevation animate.
      // See issue https://github.com/flutter/flutter/issues/131042.
      shape: const RoundedRectangleBorder(),
    );
  }

  /// An opinionated [BottomAppBarTheme] theme.
  ///
  /// The [BottomAppBarTheme] allows setting only of background color in FCS.
  /// Other properties are not used by FCS at this stage.
  ///
  /// The [BottomAppBarTheme] has no properties for foreground color. If you use
  /// a background color that requires different contrast color than the
  /// active theme's surface colors, you will need to set their colors on
  /// widget level on elements placed on the [BottomAppBar].
  static BottomAppBarTheme bottomAppBarTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the
    /// background color for the [BottomAppBar].
    ///
    /// If not defined, [colorScheme.surfaceContainer] will be used via default
    /// widget behavior for M3 mode and explicitly set to [surface] for M2 mode.
    final SchemeColor? backgroundSchemeColor,

    /// Overrides the default value for [BottomAppBar.elevation].
    ///
    /// If undefined (null), defaults to 3 in M3 and to 8 in M2 mode.
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

    /// Overrides the default value of [BottomSheet.shadowColor].
    final Color? shadowColor,

    /// Overrides the default value for [BottomAppBar.surfaceTintColor].
    ///
    /// See [Material.surfaceTintColor] for more details.
    final Color? surfaceTintColor,

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
    // Effective color, if null, keep null for M3 defaults via widget, but
    // set to surface for M2 mode.
    final Color backgroundColor = schemeColor(
      backgroundSchemeColor ?? SchemeColor.surface,
      colorScheme,
    );
    final Color? effectiveColor =
        backgroundSchemeColor == null && useM3 ? null : backgroundColor;

    return BottomAppBarTheme(
      color: effectiveColor,
      elevation: elevation,
      height: height,
      padding: padding,
      shadowColor: shadowColor,
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
  static BottomNavigationBarThemeData bottomNavigationBarTheme({
    /// Typically you would pass the same [ColorScheme] that is also used in
    /// your [ThemeData] definition.
    required final ColorScheme colorScheme,

    /// Optional text style for the [BottomNavigationBar] labels.
    ///
    /// If not defined [bodyMedium] will be used as base style for the style.
    ///
    /// The size and colors defined in any of the text size and color properties
    /// are applied as overrides on the text style.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected [BottomNavigationBar] item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item
    ///
    /// Defaults to 14.
    final double? selectedLabelSize,

    /// The size of the text label on unselected [BottomNavigationBar] items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on unselected items. Defaults to [selectedLabelSize] - 2, but min 8.
    /// Smaller than 8dp is not legible on most screens.
    ///
    /// [BottomNavigationBar] uses this -2dp smaller font on the unselected
    /// label as default, since it is so based on Material-2 spec. By assigning
    /// same value as to selectedLabelSize, you can make them the same size.
    final double? unselectedLabelSize,

    /// Select which color from the theme's [ColorScheme] to use for
    /// the [BottomNavigationBar]'s selected label text color.
    ///
    /// If undefined, defaults to [SchemeColor.primary].
    final SchemeColor? selectedLabelSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use for
    /// the [BottomNavigationBar]'s unselected label text color.
    ///
    /// When undefined, if [backgroundSchemeColor] is
    /// using any of the surface colors, the default on pair used will be
    /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
    /// that is the typical contrast color for surface colors.
    /// This is to make the unselected labels and icons look more muted.
    ///
    /// If other [backgroundSchemeColor] colors are used,
    /// while this value is undefined, their default contrasting onColor will
    /// be used. If the [backgroundSchemeColor] is also
    /// undefined, then in Material-3 this defaults to
    /// [SchemeColor.onSurfaceVariant] and in Material-2 to
    /// [SchemeColor.onSurface].
    ///
    /// Flutter SDK defaults to [ThemeData.unselectedWidgetColor] which is
    /// [Colors.black54] in light mode and [Colors.white70] in dark.
    final SchemeColor? unselectedLabelSchemeColor,

    /// If true, the unselected labels in the [BottomNavigationBar] use a
    /// more muted color version of the color defined by
    /// [unselectedLabelSchemeColor].
    ///
    /// If undefined, defaults to true in Material-2 and to false in Material-3.
    ///
    /// When true, this is visually similar to the default styling used in
    /// Material-2, but it is on purpose not an exact match, it is bit more
    /// color expressive.
    final bool? mutedUnselectedLabel,

    /// The size of the icon on selected [BottomNavigationBar] item.
    ///
    /// If undefined, it defaults to 24.
    final double? selectedIconSize,

    /// The size of the icons on unselected [BottomNavigationBar] items.
    ///
    /// If undefined, defaults to [selectedIconSize].
    final double? unselectedIconSize,

    /// Select which color from the theme's [ColorScheme] to use for
    /// the [BottomNavigationBar]'s selected item icon color.
    ///
    /// If undefined, defaults to [SchemeColor.primary].
    final SchemeColor? selectedIconSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use as base for
    /// the [BottomNavigationBar]'s unselected items icon color.
    ///
    /// When undefined, if [backgroundSchemeColor] is
    /// using any of the surface colors, the default on pair used will be
    /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
    /// that is the typical contrast color for surface colors.
    /// This is to make the unselected labels and icons look more muted.
    ///
    /// If other [backgroundSchemeColor] colors are used,
    /// while this value is undefined, their default contrasting onColor will
    /// be used. If the [backgroundSchemeColor] is also
    /// undefined, then in Material-3 this defaults to
    /// [SchemeColor.onSurfaceVariant] and in Material-2 to
    /// [SchemeColor.onSurface].
    ///
    /// Flutter SDK defaults to [ThemeData.unselectedWidgetColor] which is
    /// [Colors.black54] in light mode and [Colors.white70] in dark.
    final SchemeColor? unselectedIconSchemeColor,

    // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
    // An alternative unselected item color.
    //
    // It is used as fallback if [unselectedIconSchemeColor] is not specified,
    // before its normal default fallbacks.
    //
    // The color is typically used to provide the color created by blended or
    // tinted text theme, when it is being used by FlexColorScheme as an
    // `onSurfaceVariant` equivalent style, but a bit more primary tinted.
    //
    // FlexColorScheme passes in its `onSurfaceVariantBlendedTextStyle` when
    // a blended TextTheme is being used.
    // final Color? altUnselectedColor,

    /// If true, the unselected icon in the [BottomNavigationBar] use a more
    /// muted color version of the color defined by
    /// [bottomNavigationBarUnselectedIconSchemeColor].
    ///
    /// The muting is unselected color with
    /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    /// and withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to true in Material-2 and to false in Material-3.
    ///
    /// When true, this is visually similar to the default styling used in
    /// Material-2, but it is on purpose not an exact match, it is bit more
    /// color expressive.
    final bool? mutedUnselectedIcon,

    /// Select which color from the theme's [ColorScheme] to use as background
    /// color for the [BottomNavigationBar].
    ///
    /// If undefined, defaults to [SchemeColor.surface].
    ///
    /// Flutter defaults to [ThemeData.canvasColor] from the [Material] widgets
    /// default color. Typically this is same as [ColorScheme.surface], or it
    /// should and will be, since [ColorScheme.background] is deprecated.
    final SchemeColor? backgroundSchemeColor,

    /// BottomNavigationBar background opacity.
    ///
    /// If undefined, defaults to 1, fully opaque.
    final double? opacity,

    /// [BottomNavigationBar] container elevation.
    ///
    /// If not defined, defaults to component theme defaults to
    /// [kBottomNavigationBarElevation] = 3.
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
    /// ```text
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
    /// [FlexSubThemesData.bottomNavigationBarMutedUnselectedIcon] and
    /// [FlexSubThemesData.bottomNavigationBarMutedUnselectedLabel] are true,
    /// respectively, this also applies to undefined color inputs.
    ///
    /// When muted unselected options are true, the difference to Flutter
    /// default for unselected items is subtle, FCS has a bit more contrast.
    @Deprecated(
      'The `useFlutterDefaults` is deprecated, it no longer has any '
      'function and will be removed in v9. FlexColorScheme in M3 mode '
      'defaults to using mostly Flutter defaults styles. '
      'For other configurations modify the theme as desired. '
      'In M2 mode FCS will continue to use its own opinionated defaults for '
      'as long as M2 exists.',
    )
    final bool? useFlutterDefaults,
  }) {
    final bool useM3 = useMaterial3 ?? true;

    // Background color, when using normal default, falls back to surface
    final Color backgroundColor = (opacity ?? 1.0) != 1.0 &&
            backgroundSchemeColor != SchemeColor.transparent
        ? schemeColor(
            backgroundSchemeColor ?? SchemeColor.surface,
            colorScheme,
          ).withValues(alpha: opacity ?? 1.0)
        : schemeColor(
            backgroundSchemeColor ?? SchemeColor.surface,
            colorScheme,
          );

    // Use onSurfaceVariant as contrast for all unselected on surface colors !!
    final Color onVariantBackGroundColorFallback = schemeColorPair(
      backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
      colorScheme,
      useOnSurfaceVariant: useM3,
    );

    // Get text color, defaults to primary.
    final Color labelColor = schemeColor(
      selectedLabelSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Get unselected label color, defaults to onSurfaceVariant.
    final Color unselectedLabelColor = unselectedLabelSchemeColor == null
        ? onVariantBackGroundColorFallback
        : schemeColor(unselectedLabelSchemeColor, colorScheme);

    // Get selected text style, defaults to TextStyle(), we can use it since
    // size and color are applied to is separately.
    final TextStyle textStyle = labelTextStyle ?? const TextStyle();

    // Get effective text sizes.
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 14;
    // If not specified, unselected is label size, use 2dp smaller than
    // selected, but always at least 8dp.
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? math.max(labelSize - 2, 8);

    // Get icon color, defaults to primary.
    final Color iconColor = schemeColor(
      selectedIconSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Get unselected icon color, defaults to onSurfaceVariant.
    final Color unselectedIconColor = unselectedIconSchemeColor == null
        ? onVariantBackGroundColorFallback
        : schemeColor(unselectedIconSchemeColor, colorScheme);

    // Get effective icons sizes.
    final double iconSize = selectedIconSize ?? 24;
    final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

    return BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      elevation: elevation ?? kBottomNavigationBarElevation,
      unselectedIconTheme: IconThemeData(
        size: effectiveUnselectedIconSize,
        opacity: 1,
        color: (mutedUnselectedIcon ?? !useM3)
            ? unselectedIconColor
                .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                .withAlpha(unselectedAlpha)
            : unselectedIconColor,
      ),
      selectedIconTheme: IconThemeData(
        size: iconSize,
        opacity: 1,
        color: iconColor,
      ),
      selectedItemColor: labelColor,
      unselectedItemColor: (mutedUnselectedLabel ?? !useM3)
          ? unselectedLabelColor
              .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
              .withAlpha(unselectedAlpha)
          : unselectedLabelColor,
      unselectedLabelStyle: textStyle.copyWith(
        fontSize: effectiveUnselectedLabelSize,
        color: (mutedUnselectedLabel ?? !useM3)
            ? unselectedLabelColor
                .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                .withAlpha(unselectedAlpha)
            : unselectedLabelColor,
      ),
      selectedLabelStyle: textStyle.copyWith(
        fontSize: labelSize,
        color: labelColor,
      ),
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      type: type,
      landscapeLayout: landscapeLayout,
    );
  }

  /// A theme helper for [BottomSheetThemeData] for customizing the theme
  /// for [BottomSheet].
  ///
  /// Corner [radius] defaults to [kBottomSheetBorderRadius] = 28,
  /// [elevation] to [kBottomSheetElevation] = 4 and [modalElevation] to
  /// [kBottomSheetModalElevation] = 8.
  static BottomSheetThemeData bottomSheetTheme({
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

  /// An opinionated [ButtonThemeData] theme.
  ///
  /// The `ButtonThemeData` is marked as **obsolete** in Flutter SDK
  /// documentation, but not yet deprecated in Flutter stable SDK 3.24.x.
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
  /// [DropdownButton], plus [MaterialButton] (marked as
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
    /// If not defined, defaults to [kButtonRadius] 40dp,
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

    /// If true, then a [DropdownButton] menu's width will match the button's
    /// width.
    ///
    /// If false (the default), then the dropdown's menu will be wider than
    /// its button. In either case the dropdown button will line up the leading
    /// edge of the menu's value with the leading edge of the values
    /// displayed by the menu items.
    ///
    /// This property only affects [DropdownButton] and its menu.
    ///
    /// If not defined default to false.
    final bool? alignedDropdown,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,
  }) {
    final bool tintInteract = useTintedInteraction ?? false;
    final bool tintDisable = useTintedDisable ?? false;
    // Get selected color, defaults to primary.
    final Color baseColor = schemeColor(
      baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = colorScheme.surface;
    final Color tint = baseColor;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness);

    // Effective minimum button size.
    final Size effectiveMinButtonSize = minButtonSize ?? kButtonMinSize;

    return ButtonThemeData(
      colorScheme: colorScheme,
      alignedDropdown: alignedDropdown ?? false,
      minWidth: effectiveMinButtonSize.width,
      height: effectiveMinButtonSize.height,
      padding: padding ?? kButtonPadding,
      layoutBehavior: ButtonBarLayoutBehavior.constrained,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      hoverColor: tintInteract
          ? tintedHovered(overlay, tint, factor)
          : baseColor.withAlpha(kAlphaHovered),
      focusColor: tintInteract
          ? tintedFocused(overlay, tint, factor)
          : baseColor.withAlpha(kAlphaFocused),
      highlightColor: tintInteract
          ? tintedHighlight(overlay, tint, factor)
          : baseColor.withAlpha(kAlphaHighlight),
      splashColor: tintInteract
          ? tintedSplash(overlay, tint, factor)
          : baseColor.withAlpha(kAlphaSplash),
      disabledColor: tintDisable
          ? tintedDisable(
              colorScheme.onSurface,
              tint,
            ).withAlpha(kAlphaLowDisabled)
          : colorScheme.onSurface.withAlpha(kAlphaLowDisabled),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kButtonRadius),
        ),
      ),
      textTheme: ButtonTextTheme.primary,
    );
  }

  /// An opinionated [CardThemeData] for [Card] with custom
  /// corner radius and elevation.
  ///
  /// Corner [radius] defaults to [kCardRadius] = 12 and [elevation]
  /// defaults to Flutter SDK defaults if not defined.
  static CardThemeData cardTheme({
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

  /// An opinionated [CheckboxThemeData] theme.
  ///
  /// Requires a [ColorScheme] in [colorScheme]. The color scheme would
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
    final bool isBaseColor = unselectedIsColored ?? false;
    final bool tintInteract = useTintedInteraction ?? false;
    final bool tintDisable = useTintedDisable ?? false;
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    final Color onBaseColor = schemeColorPair(baseScheme, colorScheme);
    final bool isLight = colorScheme.brightness == Brightness.light;

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = colorScheme.surface;
    final Color tint = baseColor;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness, true);

    return CheckboxThemeData(
      splashRadius: splashRadius,
      side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
        if (useM3) {
          if (states.contains(WidgetState.disabled)) {
            if (states.contains(WidgetState.selected)) {
              return const BorderSide(width: 2.0, color: Colors.transparent);
            }
            if (tintDisable) {
              return BorderSide(
                width: 2.0,
                color: tintedDisable(colorScheme.onSurface, baseColor),
              );
            }
            return BorderSide(
              width: 2.0,
              color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
            );
          }

          if (states.contains(WidgetState.selected)) {
            return const BorderSide(width: 0.0, color: Colors.transparent);
          }
          if (states.contains(WidgetState.error)) {
            return BorderSide(width: 2.0, color: colorScheme.error);
          }
          if (states.contains(WidgetState.pressed)) {
            if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
            return BorderSide(width: 2.0, color: colorScheme.onSurface);
          }
          if (states.contains(WidgetState.hovered)) {
            if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
            return BorderSide(width: 2.0, color: colorScheme.onSurface);
          }
          if (states.contains(WidgetState.focused)) {
            if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
            return BorderSide(width: 2.0, color: colorScheme.onSurface);
          }
          if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
          return BorderSide(width: 2.0, color: colorScheme.onSurfaceVariant);
        }
        // M2 version
        else {
          if (states.contains(WidgetState.disabled)) {
            if (states.contains(WidgetState.selected)) {
              return const BorderSide(width: 2.0, color: Colors.transparent);
            }
            if (tintDisable) {
              return BorderSide(
                width: 2.0,
                color: tintedDisable(colorScheme.onSurface, baseColor),
              );
            }
            return BorderSide(
              width: 2.0,
              color: colorScheme.onSurface.withAlpha(kAlphaDisabled),
            );
          }
          if (states.contains(WidgetState.selected)) {
            return const BorderSide(width: 2.0, color: Colors.transparent);
          }
          if (isBaseColor) return BorderSide(width: 2.0, color: baseColor);
          // This is M2 SDK default.
          return BorderSide(
            width: 2.0,
            color: isLight ? Colors.black54 : Colors.white70,
          );
        }
      }),
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (useM3) {
          if (states.contains(WidgetState.disabled)) {
            if (states.contains(WidgetState.selected)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return colorScheme.onSurface.withAlpha(kAlphaDisabled);
            }
            return Colors.transparent;
          }
          if (states.contains(WidgetState.selected)) {
            if (states.contains(WidgetState.error)) {
              return colorScheme.error;
            }
            return baseColor;
          }
          return Colors.transparent;
        }
        // M2 version
        else {
          if (states.contains(WidgetState.disabled)) {
            if (states.contains(WidgetState.selected)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
            }
            return Colors.transparent;
          }
          if (states.contains(WidgetState.selected)) {
            return baseColor;
          }
          return Colors.transparent;
        }
      }),
      checkColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (useM3) {
          if (states.contains(WidgetState.disabled)) {
            if (states.contains(WidgetState.selected)) {
              return colorScheme.surface;
            }
            return Colors.transparent;
          }
          if (states.contains(WidgetState.selected)) {
            if (states.contains(WidgetState.error)) {
              return colorScheme.onError;
            }
            return onBaseColor;
          }
          return Colors.transparent;
        }
        // M2 version
        else {
          if (states.contains(WidgetState.disabled)) {
            return isLight ? Colors.grey.shade200 : Colors.grey.shade900;
          }
          if (states.contains(WidgetState.selected)) {
            return onBaseColor;
          }
          return isLight ? Colors.grey.shade50 : Colors.grey.shade400;
        }
      }),
      overlayColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        // Error state only exists in M3 mode.
        if (states.contains(WidgetState.error) && useM3) {
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.error.withAlpha(kAlphaPressed);
          }
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.error.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            return colorScheme.error.withAlpha(kAlphaFocused);
          }
        }
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) return tintedPressed(overlay, tint, factor);
            return colorScheme.onSurface.withAlpha(kAlphaPressed);
          }
          if (states.contains(WidgetState.hovered)) {
            if (tintInteract) return tintedHovered(overlay, tint, factor);
            return baseColor.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) return tintedFocused(overlay, tint, factor);
            return baseColor.withAlpha(kAlphaFocused);
          }
          return Colors.transparent;
        }
        if (states.contains(WidgetState.pressed)) {
          if (tintInteract) return tintedPressed(overlay, tint, factor);
          return baseColor.withAlpha(kAlphaPressed);
        }
        if (states.contains(WidgetState.hovered)) {
          if (tintInteract) return tintedHovered(overlay, tint, factor);
          return colorScheme.onSurface.withAlpha(kAlphaHovered);
        }
        if (states.contains(WidgetState.focused)) {
          if (tintInteract) return tintedFocused(overlay, tint, factor);
          return colorScheme.onSurface.withAlpha(kAlphaFocused);
        }
        return Colors.transparent;
      }),
    );
  }

  /// An opinionated [ChipThemeData] theme.
  static ChipThemeData chipTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Defines if the [baseSchemeColor] and [selectedSchemeColor] are
    /// alpha blended with the surface color.
    ///
    /// If not defined, defaults to false in Material-3 mode and to true
    /// in Material-2 mode.
    ///
    /// When true, the [baseSchemeColor] is alpha blended with the surface
    /// color using [kChipBackgroundAlphaBlend] alpha blend value.
    /// The [selectedSchemeColor] is alpha blended with the surface color
    /// using [kChipSelectedBackgroundAlphaBlend] alpha blend value.
    final bool? blendColors,

    /// Defines which [Theme] based [ColorScheme] based color the Chips
    /// use as their background base color.
    ///
    /// If not defined and [useMaterial3] is true, it defaults
    /// [SchemeColor.surface].
    ///
    /// If not defined and [useMaterial3] is false, it defaults
    /// [SchemeColor.primary] with a surface alpha blend of
    /// [kChipBackgroundAlphaBlend] applied, if [blendColors] is true,
    /// which it defaults to in Material-2 mode.
    final SchemeColor? baseSchemeColor,

    /// Defines which [Theme] based [ColorScheme] based color the selected Chips
    /// use as their selected state color.
    ///
    /// The color scheme contrast pair color is used for text and icons, on the
    /// [selectedSchemeColor].
    ///
    /// If not defined and [useMaterial3] is true, defaults to
    /// [SchemeColor.secondaryContainer].
    ///
    /// If not defined and [useMaterial3] is false, defaults to
    /// [SchemeColor.secondaryContainer] if [blendColors] is false.
    /// If [blendColors] is true, defaults to [SchemeColor.primary] with
    /// a surface alpha blend of [kChipSelectedBackgroundAlphaBlend] applied.
    final SchemeColor? selectedSchemeColor,

    /// Defines which [Theme] based [ColorScheme] based color the selected
    /// ChoiceChips use as their selected state color.
    ///
    /// The color scheme contrast pair color is used for text and icons, on the
    /// [secondarySelectedSchemeColor]
    ///
    /// If not defined and [useMaterial3] is true, defaults to
    /// [selectedSchemeColor].
    final SchemeColor? secondarySelectedSchemeColor,

    /// Defines which [Theme] based [ColorScheme] based color the Chips
    /// use as color of the delete icon.
    ///
    /// The selected color is only used as base for the [Chip] colors, it also
    /// uses alpha blend and opacity to create the effective Chip colors using
    /// the selected scheme color as base.
    ///
    /// If not defined it defaults to effective theme based color from using
    /// [SchemeColor.onSurfaceVariant] same as Material-3 default.
    final SchemeColor? deleteIconSchemeColor,

    /// Overrides the default for [ChipAttributes.labelStyle],
    /// the style of the [DefaultTextStyle] that contains the
    /// chip's label.
    ///
    /// This only has an effect on label widgets that respect the
    /// [DefaultTextStyle], such as [Text].
    ///
    /// This property applies to [ActionChip], [Chip],
    /// [FilterChip], [InputChip], [RawChip].
    ///
    /// If not defined, the font size in the style defaults to 14.
    final TextStyle? labelStyle,

    /// Overrides the default for [ChoiceChip.labelStyle],
    /// the style of the [DefaultTextStyle] that contains the
    /// chip's label.
    ///
    /// This only has an effect on label widgets that respect the
    /// [DefaultTextStyle], such as [Text].
    ///
    /// If not defined, the font size in the style defaults to 14.
    final TextStyle? secondaryLabelStyle,

    /// Font size of the [labelStyle].
    ///
    /// If defined, overrides the default font size used by either the
    /// default font of the default [labelStyle] or the font size of the
    /// passed in [labelStyle].
    ///
    /// If not defined the default text style font sizes are used, but if they
    /// did not have size defined, defaults 14.
    final double? fontSize,

    /// Font size of the [secondaryLabelStyle].
    ///
    /// If defined, overrides the default font size used by either the
    /// default font of the default [secondaryLabelStyle] or the font size of
    /// the passed in [secondaryLabelStyle].
    ///
    /// If not defined, defaults to [fontSize].
    final double? secondaryFontSize,

    /// Icon size used by the [IconTheme] used by [Chip]s.
    ///
    /// If not defined defaults to 18.
    final double? iconSize,

    /// Overrides the default for [ChipAttributes.padding],
    /// the padding between the contents of the chip and the outside [shape].
    ///
    /// This property applies to [ActionChip], [Chip], [ChoiceChip],
    /// [FilterChip], [InputChip], [RawChip].
    ///
    /// If not defined, defaults to EdgeInsets.symmetric(horizontal: 8) in
    /// Material mode and to EdgeInsets.symmetric(horizontal: 4) in
    /// Material2 mode.
    final EdgeInsetsGeometry? padding,

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

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,

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
    // Used to toggle between different defaults from M2 and M3.
    final bool useM3 = useMaterial3 ?? true;
    final bool tintDisable = useTintedDisable ?? false;
    final bool blend = blendColors ?? !useM3;

    // Function used to make a contrast color for blended background, we cannot
    // be sure the blended colors contrast is OK, with its source onPair,
    // so we need to compute one.
    Color blendedContrast(Color color) {
      if (ThemeData.estimateBrightnessForColor(color) == Brightness.light) {
        return Colors.black87;
      } else {
        return Colors.white70;
      }
    }

    // TODO(rydmike): Monitor Chip issue #115364
    // https://github.com/flutter/flutter/issues/115364

    // Get fallback color, defaults to surface for M3 and to primary for M2.
    final SchemeColor fallbackSchemeColor = baseSchemeColor == null && blend
        ? SchemeColor.primary
        : useM3
            ? SchemeColor.surface
            : SchemeColor.primaryContainer;
    Color backgroundColor = schemeColor(
      baseSchemeColor ?? fallbackSchemeColor,
      colorScheme,
    );
    // Selected color
    final SchemeColor fallbackSelected = useM3
        ? SchemeColor.secondaryContainer
        : blend
            ? SchemeColor.primary
            : SchemeColor.secondaryContainer;
    Color selectedColor = schemeColor(
      selectedSchemeColor ?? fallbackSelected,
      colorScheme,
    );

    // Secondary selected color
    final SchemeColor fallbackSecondarySelected =
        selectedSchemeColor ?? fallbackSelected;
    Color secondarySelectedColor = schemeColor(
      secondarySelectedSchemeColor ?? fallbackSecondarySelected,
      colorScheme,
    );

    // Do all the blending of colors if blend is true.
    if (blend) {
      if (selectedSchemeColor == null) {
        selectedColor = backgroundColor.blendAlpha(
          colorScheme.surface,
          kChipSelectedBackgroundAlphaBlend,
        );
      } else {
        selectedColor = selectedColor.blendAlpha(
          colorScheme.surface,
          kChipSelectedBackgroundAlphaBlend,
        );
      }
      if (secondarySelectedSchemeColor == null) {
        secondarySelectedColor = backgroundColor.blendAlpha(
          colorScheme.surface,
          kChipSelectedBackgroundAlphaBlend,
        );
      } else {
        secondarySelectedColor = secondarySelectedColor.blendAlpha(
          colorScheme.surface,
          kChipSelectedBackgroundAlphaBlend,
        );
      }
      backgroundColor = backgroundColor.blendAlpha(
        colorScheme.surface,
        kChipBackgroundAlphaBlend,
      );
    }

    // Set the onColors
    Color onBackgroundColor = schemeColorPair(
      baseSchemeColor ?? fallbackSchemeColor,
      colorScheme,
      useOnSurfaceVariant: true,
    );
    Color onSelectedColor = schemeColorPair(
      selectedSchemeColor ?? fallbackSelected,
      colorScheme,
      useOnSurfaceVariant: true,
    );
    Color onSecondarySelectedColor = schemeColorPair(
      secondarySelectedSchemeColor ?? fallbackSecondarySelected,
      colorScheme,
    );
    if (blend) {
      onBackgroundColor = blendedContrast(backgroundColor);
      onSelectedColor = blendedContrast(selectedColor);
      onSecondarySelectedColor = blendedContrast(secondarySelectedColor);
    }

    // The deleted icon color
    final Color deleteIconColor = schemeColor(
      deleteIconSchemeColor ?? SchemeColor.onSurfaceVariant,
      colorScheme,
    );

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color tint = selectedColor;

    // Icon color.
    Color iconColor = onBackgroundColor;
    if (iconColor != colorScheme.onSurfaceVariant) {
      iconColor = blendedContrast(backgroundColor);
    }
    //
    // Text color, uses the onBackground.
    final TextStyle baseLabelStyle = (labelStyle ?? const TextStyle()).copyWith(
      color: onBackgroundColor,
      fontSize: fontSize ?? labelStyle?.fontSize ?? 14,
      // These two needed to match size of default M3.
      letterSpacing: labelStyle?.letterSpacing ?? 0.1,
      height: labelStyle?.height ?? 1.43,
    );

    // TODO(rydmike): We need widget state to use this! Not supported. Issue?
    // Text color, uses the selected foreground color for selected chip styles.
    // final TextStyle effectiveSelectedLabelStyle =
    //     baseLabelStyle.copyWith(color: onSelectedColor);

    // Text color, uses the foreground color for all chip styles.
    final TextStyle effectiveSecondarySelectedLabelStyle =
        (secondaryLabelStyle ?? labelStyle ?? const TextStyle()).copyWith(
      color: onSecondarySelectedColor,
      fontSize: secondaryFontSize ??
          fontSize ??
          secondaryLabelStyle?.fontSize ??
          labelStyle?.fontSize ??
          14,
      // These two needed to match size of default M3.
      letterSpacing: secondaryLabelStyle?.letterSpacing ??
          labelStyle?.letterSpacing ??
          0.1,
      height: secondaryLabelStyle?.height ?? labelStyle?.height ?? 1.43,
    );

    // TODO(rydmike): M3 is 34dp high, should only be 32dp. Report issue?

    return ChipThemeData(
      // TODO(rydmike): This works, but it overrides secondarySelectedColor.
      //  Raise issue! We cannot use due to that, but it would be nice
      //  if we could for creating a better disabled color.
      //
      // color: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      //   if (states.contains(WidgetState.selected) &&
      //       states.contains(WidgetState.disabled)) {
      //     return !tintDisable && useM3
      //         ? null
      //         : tintDisable
      //             ? tintedDisable(colorScheme.onSurface, tint)
      //                 .withAlpha(kAlphaVeryLowDisabled)
      //             : colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
      //   }
      //   if (states.contains(WidgetState.disabled)) {
      //     return !tintDisable && useM3
      //         ? null
      //         : tintDisable
      //             ? tintedDisable(colorScheme.onSurface, tint)
      //                 .withAlpha(kAlphaVeryLowDisabled)
      //             : colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
      //   }
      //   if (states.contains(WidgetState.selected)) {
      //     return selectedSchemeColor == null && !blend
      //         ? useM3
      //             ? null
      //             : selectedColor
      //         : selectedColor;
      //   }
      //   return backgroundColor;
      // }),

      // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
      // [InputChip], [RawChip], but NOT to ANY selected or disabled Chip.
      backgroundColor: backgroundColor,

      // Applies to [Chip], [InputChip], [RawChip].
      deleteIconColor: deleteIconSchemeColor == null ? null : deleteIconColor,
      // Applies to [ChoiceChip], [FilterChip], [InputChip], [RawChip].
      // Same formula as on FCS Elevated button and ToggleButtons.
      disabledColor: !tintDisable &&
              useM3 &&
              onBackgroundColor == colorScheme.onSurfaceVariant
          ? null
          : onBackgroundColor == colorScheme.onSurfaceVariant
              ? tintDisable
                  ? tintedDisable(
                      colorScheme.onSurface,
                      tint,
                    ).withValues(alpha: kAlphaLowDisabledFloat)
                  : colorScheme.onSurface.withValues(
                      alpha: kAlphaLowDisabledFloat,
                    )
              : tintDisable
                  ? tintedDisable(
                      backgroundColor,
                      tint,
                    ).withValues(alpha: kAlphaLowDisabledFloat)
                  : backgroundColor.withValues(alpha: kAlphaLowDisabledFloat),
      // Applies to [ChoiceChip], [FilterChip], [InputChip], [RawChip].
      selectedColor: selectedSchemeColor == null && !blend
          ? useM3
              ? null
              : selectedColor
          : selectedColor,

      // Applies to [ChoiceChip.selectedColor], if set it overrides the
      // [selectedColor], for ChoiceChips.
      secondarySelectedColor: secondarySelectedSchemeColor == null && !blend
          ? null
          : secondarySelectedColor,
      // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
      // [InputChip] and [RawChip].
      surfaceTintColor: surfaceTintColor,
      // Applies to [FilterChip], [InputChip], [RawChip].
      checkmarkColor: onSelectedColor,
      // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
      // [InputChip] and [RawChip].
      padding: useM3 ? padding : padding ?? const EdgeInsets.all(4),
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
      // If it needs different color fr selected and unselected state it cannot
      // be themed correctly.
      labelStyle: baseLabelStyle,

      // TODO(rydmike): We need widget state to use this! Not supported. Issue?
      // To always get correct color for selected state text, we would need to
      // use WidgetStateTextStyle, but it is not supported. Docs says it should
      // be, but it does not work. Issue?
      //
      //labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      //   if (states.contains(WidgetState.disabled)) {
      //     return baseLabelStyle.copyWith(
      //         color: colorScheme.onSurface.withValues(alpha: 0.38));
      //   }
      //   if (states.contains(WidgetState.selected)) {
      //     return baseLabelStyle.copyWith(color: onSelectedColor);
      //   }
      //   return baseLabelStyle;
      // }),

      // Applies to [ChoiceChip.labelStyle],
      secondaryLabelStyle: effectiveSecondarySelectedLabelStyle,

      // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
      // [InputChip] and [RawChip].
      iconTheme: IconThemeData(size: iconSize ?? 18, color: iconColor),
    );
  }

  /// A slightly opinionated [DatePickerThemeData] helper for FlexColorScheme.
  static DatePickerThemeData datePickerTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Dialog background color.
    ///
    /// If null and [backgroundSchemeColor] is also null, then it
    /// gets default via Dialog's default null theme behavior,
    /// which is [surfaceContainerHigh]
    /// in Material-3 mode and in Material-2 mode in light theme
    /// [Colors.white] and in a dark theme [Colors.grey800].
    ///
    /// If [backgroundSchemeColor] is defined, it will override any color
    /// give to [backgroundColor].
    ///
    /// Can be used to make a custom themed dialog with own background color,
    /// even after the [ThemeData.dialogBackgroundColor] property is
    /// is deprecated in Flutter SDK. See
    /// https://github.com/flutter/flutter/issues/91772).
    final Color? backgroundColor,

    /// Selects which color from the passed in colorScheme to use as the dialog
    /// background color.
    ///
    /// If not defined, then the passed in [backgroundColor] will be used,
    /// which may be null too and dialog then falls back to Flutter SDK default
    /// value for DatePickerDialog, which is [surfaceContainerHigh]
    /// in Material-3 mode and in Material-2 mode in light theme
    /// [Colors.white] and in a dark theme [Colors.grey800].
    final SchemeColor? backgroundSchemeColor,

    /// The color of the divider in the [DatePickerDialog].
    ///
    /// If not defined, defaults to [ColorScheme.outlineVariant] in Material-3.
    /// In Material-2 the divider does not exist in the [DatePickerDialog]
    /// build.
    ///
    /// Use [SchemeColor.transparent] to remove the divider in Material-3.
    final SchemeColor? dividerSchemeColor,

    /// Defines the header's default background fill color.
    ///
    /// The dialog's header displays the currently selected date.
    ///
    /// Defaults to [surfaceContainerHigh] in Material-3 and Material-2 mode
    /// to [primary] in light mode and to [surface] in dark mode.
    final SchemeColor? headerBackgroundSchemeColor,

    /// Defines the header's default color used for text labels and icons.
    ///
    /// The dialog's header displays the currently selected date.
    ///
    /// This is used instead of the [TextStyle.color] property of
    /// [headerHeadlineStyle] and [headerHelpStyle].
    ///
    /// If not defined, defaults to correct contrast pair for the used
    /// [headerBackgroundSchemeColor], with a preference to
    /// [SchemeColor.onSurfaceVariant] if any surface color is used as the
    /// background color.
    final SchemeColor? headerForegroundSchemeColor,

    /// Dialog elevation.
    ///
    /// If not defined, defaults to [kDialogElevation] = 6.
    final double? elevation,

    /// Outer corner radius.
    ///
    /// If not defined, defaults to [kDialogRadius] 28dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/dialogs/specs
    final double? radius,

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

    /// Set to true to not use the provided [inputDecorationTheme].
    ///
    /// If this flag is false, the provided [inputDecorationTheme] is not used,
    /// additionally the theme fix this theme helper does internally is
    /// not applied and pure null value is passed. This enables getting the
    /// default widget behavior input decorator, or opting in on getting the
    /// provided inputDecorationTheme with the internal style fix for issue
    /// https://github.com/flutter/flutter/issues/54104 applied automatically
    /// to the provided inputDecorationTheme.
    ///
    /// If not defined, defaults to false.
    final bool? useInputDecoratorTheme,

    /// Overrides the default value of [Dialog.shadowColor].
    final Color? shadowColor,

    /// Overrides the default value of [Dialog.surfaceTintColor].
    final Color? surfaceTintColor,

    /// Overrides the header's default headline text style.
    ///
    /// The dialog's header displays the currently selected date.
    ///
    /// The [TextStyle.color] of the [headerHeadlineStyle] is not used,
    /// [headerForegroundColor] is used instead.
    final TextStyle? headerHeadlineStyle,

    /// Overrides the header's default help text style.
    ///
    /// The help text (also referred to as "supporting text" in the Material
    /// spec) is usually a prompt to the user at the top of the header
    /// (i.e. 'Select date').
    ///
    /// The [TextStyle.color] of the [headerHelpStyle] is not used,
    /// [headerForegroundColor] is used instead.
    ///
    /// See also:
    ///   [DatePickerDialog.helpText], which specifies the help text.
    final TextStyle? headerHelpStyle,

    /// Overrides the default text style used for the row of weekday
    /// labels at the top of the date picker grid.
    final TextStyle? weekdayStyle,

    /// Overrides the default text style used for each individual day
    /// label in the grid of the date picker.
    ///
    /// The [TextStyle.color] of the [dayStyle] is not used,
    /// [dayForegroundColor] is used instead.
    final TextStyle? dayStyle,

    /// Overrides the default color used to paint the day labels in the
    /// grid of the date picker.
    ///
    /// This will be used instead of the color provided in [dayStyle].
    final WidgetStateProperty<Color?>? dayForegroundColor,

    /// Overrides the default color used to paint the background of the
    /// day labels in the grid of the date picker.
    final WidgetStateProperty<Color?>? dayBackgroundColor,

    /// Overrides the default highlight color that's typically used to
    /// indicate that a day in the grid is focused, hovered, or pressed.
    final WidgetStateProperty<Color?>? dayOverlayColor,

    /// Overrides the default shape used to paint the shape decoration of the
    /// day labels in the grid of the date picker.
    ///
    /// If the selected day is the current day, the provided shape with the
    /// value of [todayBackgroundColor] is used to paint the shape decoration of
    /// the day label and the value of [todayBorder] and [todayForegroundColor]
    /// is used to paint the border.
    ///
    /// If the selected day is not the current day, the provided shape with the
    /// value of [dayBackgroundColor] is used to paint the shape decoration of
    /// the day label.
    final WidgetStateProperty<OutlinedBorder?>? dayShape,

    /// Overrides the default color used to paint the
    /// [DatePickerDialog.currentDate] label in the grid of the dialog's
    /// [CalendarDatePicker] and the corresponding year in the dialog's
    /// [YearPicker].
    ///
    /// This will be used instead of the [TextStyle.color] provided in
    /// [dayStyle].
    final WidgetStateProperty<Color?>? todayForegroundColor,

    /// Overrides the default color used to paint the background of the
    /// [DatePickerDialog.currentDate] label in the grid of the date picker.
    final WidgetStateProperty<Color?>? todayBackgroundColor,

    /// Overrides the border used to paint the
    /// [DatePickerDialog.currentDate] label in the grid of the date
    /// picker.
    ///
    /// The border side's [BorderSide.color] is not used,
    /// [todayForegroundColor] is used instead.
    final BorderSide? todayBorder,

    /// Overrides the default text style used to paint each of the year
    /// entries in the year selector of the date picker.
    ///
    /// The [TextStyle.color] of the [yearStyle] is not used,
    /// [yearForegroundColor] is used instead.
    final TextStyle? yearStyle,

    /// Overrides the default color used to paint the year labels in the year
    /// selector of the date picker.
    ///
    /// This will be used instead of the color provided in [yearStyle].
    final WidgetStateProperty<Color?>? yearForegroundColor,

    /// Overrides the default color used to paint the background of the
    /// year labels in the year selector of the of the date picker.
    final WidgetStateProperty<Color?>? yearBackgroundColor,

    /// Overrides the default highlight color that's typically used to
    /// indicate that a year in the year selector is focused, hovered,
    /// or pressed.
    final WidgetStateProperty<Color?>? yearOverlayColor,

    /// Overrides the default [Scaffold.backgroundColor] for
    /// [DateRangePickerDialog].
    final Color? rangePickerBackgroundColor,

    /// Overrides the default elevation of the full screen
    /// [DateRangePickerDialog].
    final double? rangePickerElevation,

    /// Overrides the color of the shadow painted below a full screen
    /// [DateRangePickerDialog].
    final Color? rangePickerShadowColor,

    /// Overrides the default overall shape of a full screen
    /// [DateRangePickerDialog].
    ///
    /// If [elevation] is greater than zero then a shadow is shown and the
    /// shadow's shape mirrors the shape of the dialog.
    final ShapeBorder? rangePickerShape,

    /// Overrides the default background fill color for [DateRangePickerDialog].
    ///
    /// The dialog's header displays the currently selected date range.
    final Color? rangePickerHeaderBackgroundColor,

    /// Overrides the default color used for text labels and icons in
    /// the header of a full screen [DateRangePickerDialog]
    ///
    /// The dialog's header displays the currently selected date range.
    ///
    /// This is used instead of any colors provided by
    /// [rangePickerHeaderHeadlineStyle] or [rangePickerHeaderHelpStyle].
    final Color? rangePickerHeaderForegroundColor,

    /// Overrides the default text style used for the headline text in
    /// the header of a full screen [DateRangePickerDialog].
    ///
    /// The dialog's header displays the currently selected date range.
    ///
    /// The [TextStyle.color] of [rangePickerHeaderHeadlineStyle] is not used,
    /// [rangePickerHeaderForegroundColor] is used instead.
    final TextStyle? rangePickerHeaderHeadlineStyle,

    /// Overrides the default text style used for the help text of the
    /// header of a full screen [DateRangePickerDialog].
    ///
    /// The help text (also referred to as "supporting text" in the Material
    /// spec) is usually a prompt to the user at the top of the header
    /// (i.e. 'Select date').
    ///
    /// The [TextStyle.color] of the [rangePickerHeaderHelpStyle] is not used,
    /// [rangePickerHeaderForegroundColor] is used instead.
    final TextStyle? rangePickerHeaderHelpStyle,

    /// Overrides the default background color used to paint days
    /// selected between the start and end dates in a
    /// [DateRangePickerDialog].
    final Color? rangeSelectionBackgroundColor,

    /// Overrides the default highlight color that's typically used to
    /// indicate that a date in the selected range of a
    /// [DateRangePickerDialog] is focused, hovered, or pressed.
    final WidgetStateProperty<Color?>? rangeSelectionOverlayColor,

    /// Overrides the default style of the cancel button of a
    /// [DatePickerDialog].
    final ButtonStyle? cancelButtonStyle,

    /// Overrides the default style of the confirm (OK) button of a
    /// [DatePickerDialog].
    final ButtonStyle? confirmButtonStyle,

    /// An optional [locale] argument can be used to set the locale for the date
    /// picker. It defaults to the ambient locale provided by [Localizations].
    final Locale? locale,
  }) {
    // This InputDecorationTheme is here to help work around this issue:
    // https://github.com/flutter/flutter/issues/131666
    // It is reasonably successful in fixing the issue, but it is not perfect.
    InputDecorationTheme datePickerDefaultInputDecorationTheme() {
      const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(4.0));
      // The input decoration theme is used to style the input fields in the
      // date picker dialog. This matches the default input decoration theme
      // used by the date picker dialog.
      // TODO(rydmike): Check that Flutter's defaults have not changed.
      // If it has the changes are probably subtle enough to not matter for now.
      return InputDecorationTheme(
        filled: false,
        hoverColor: colorScheme.brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.04)
            : Colors.black.withValues(alpha: 0.04),
        focusColor: colorScheme.brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.12)
            : Colors.black.withValues(alpha: 0.12),
        border: OutlineInputBorder(
          borderRadius: defaultRadius,
          borderSide: BorderSide(color: colorScheme.primary, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: defaultRadius,
          borderSide: BorderSide(color: colorScheme.outline, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: defaultRadius,
          borderSide: BorderSide(color: colorScheme.error, width: 1),
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
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((
          Set<WidgetState> states,
        ) {
          // These styles are copied from M3 default, we are not going to test
          // them again.
          // coverage:ignore-start
          if (states.contains(WidgetState.disabled)) {
            return TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.38),
            );
          }
          if (states.contains(WidgetState.error)) {
            if (states.contains(WidgetState.hovered)) {
              return TextStyle(color: colorScheme.onErrorContainer);
            }
            if (states.contains(WidgetState.focused)) {
              return TextStyle(color: colorScheme.error);
            }
            return TextStyle(color: colorScheme.error);
          }
          if (states.contains(WidgetState.hovered)) {
            return TextStyle(color: colorScheme.onSurfaceVariant);
          }
          if (states.contains(WidgetState.focused)) {
            return TextStyle(color: colorScheme.primary);
          }
          return TextStyle(color: colorScheme.onSurfaceVariant);
          // coverage:ignore-end
        }),
      );
    }

    final bool useDecorator = useInputDecoratorTheme ?? false;
    final Color? background = backgroundSchemeColor == null
        ? backgroundColor // might be null, then SDK theme defaults.
        : schemeColor(backgroundSchemeColor, colorScheme);
    final Color? headerBackgroundColor = headerBackgroundSchemeColor == null
        ? null
        : schemeColor(headerBackgroundSchemeColor, colorScheme);

    final Color? headerForeground = headerForegroundSchemeColor == null
        ? null
        : schemeColor(headerForegroundSchemeColor, colorScheme);
    final Color? headerForegroundColor = headerForeground ??
        (headerBackgroundSchemeColor == null
            ? null
            : schemeColorPair(
                headerBackgroundSchemeColor,
                colorScheme,
                useOnSurfaceVariant: true,
              ));

    final Color? dividerColor = dividerSchemeColor == null
        ? null
        : schemeColor(dividerSchemeColor, colorScheme);

    return DatePickerThemeData(
      backgroundColor: background,
      headerBackgroundColor: headerBackgroundColor,
      headerForegroundColor: headerForegroundColor,
      dividerColor: dividerColor,
      //
      elevation: elevation ?? kDialogElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kDialogRadius),
        ),
      ),
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      inputDecorationTheme: useDecorator
          ? inputDecorationTheme
          // TODO(rydmike): Raise DatePicker decorator merge issue.
          // Getting back to default style with an elaborate back to default
          // input decorator does not work due to this:
          // https://github.com/flutter/flutter/pull/128950#issuecomment-1657177393
          : datePickerDefaultInputDecorationTheme(),
      //
      headerHeadlineStyle: headerHeadlineStyle,
      headerHelpStyle: headerHelpStyle,
      weekdayStyle: weekdayStyle,
      dayStyle: dayStyle,
      dayForegroundColor: dayForegroundColor,
      dayBackgroundColor: dayBackgroundColor,
      dayOverlayColor: dayOverlayColor,
      dayShape: dayShape,
      todayForegroundColor: todayForegroundColor,
      todayBackgroundColor: todayBackgroundColor,
      todayBorder: todayBorder,
      yearStyle: yearStyle,
      yearForegroundColor: yearForegroundColor,
      yearBackgroundColor: yearBackgroundColor,
      yearOverlayColor: yearOverlayColor,
      //
      rangePickerBackgroundColor: rangePickerBackgroundColor,
      rangePickerElevation: rangePickerElevation,
      rangePickerShadowColor: rangePickerShadowColor,
      rangePickerShape: rangePickerShape,
      rangePickerHeaderBackgroundColor: rangePickerHeaderBackgroundColor,
      rangePickerHeaderForegroundColor: rangePickerHeaderForegroundColor,
      rangePickerHeaderHeadlineStyle: rangePickerHeaderHeadlineStyle,
      rangePickerHeaderHelpStyle: rangePickerHeaderHelpStyle,
      rangeSelectionBackgroundColor: rangeSelectionBackgroundColor,
      rangeSelectionOverlayColor: rangeSelectionOverlayColor,
      //
      cancelButtonStyle: cancelButtonStyle,
      confirmButtonStyle: confirmButtonStyle,
      // This API is supported in Flutter 3.24.0 and later.
      locale: locale,
    );
  }

  /// An opinionated [DialogThemeData] with custom corner radius and elevation.
  ///
  /// Corner [radius] defaults to [kDialogRadius] = 28 and [elevation] to
  /// [kDialogElevation] = 10.
  ///
  /// The default radius follows Material M3 guide
  /// [specification](https://m3.material.io/components/dialogs/specs).
  static DialogThemeData dialogTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    final ColorScheme? colorScheme,

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
    /// https://github.com/flutter/flutter/issues/91772).
    final Color? backgroundColor,

    /// Selects which color from the passed in colorScheme to use as the dialog
    /// background color.
    ///
    /// If not defined, then the passed in [backgroundColor] will be used,
    /// which may be null too and dialog then falls back to Flutter SDK default
    /// value for TimePickerDialog, which is [colorScheme.surface].
    ///
    /// FlexColorScheme sub-theming uses this property to match the background
    /// color of this dialog to other standard dialogs. It sets it via
    /// [FlexSubThemesData] to [SchemeColor.surface].
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

    /// Overrides the default value for [DefaultTextStyle] for
    /// [SimpleDialog.title] and [AlertDialog.title].
    final TextStyle? titleTextStyle,

    /// Overrides the default value for [DefaultTextStyle] for
    /// [SimpleDialog.children] and [AlertDialog.content].
    final TextStyle? contentTextStyle,

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
        colorScheme == null || backgroundSchemeColor == null
            ? backgroundColor // might be null, then SDK theme defaults.
            : schemeColor(backgroundSchemeColor, colorScheme);

    return DialogThemeData(
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
      titleTextStyle: titleTextStyle,
      contentTextStyle: contentTextStyle,
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
    /// If not defined, defaults to [SchemeColor.surfaceContainerLow].
    ///
    /// Flutter SDK uses surfaceContainerLow color as default in M3 and
    /// ThemeData's canvasColor in M2 mode, which is Colors.grey[50] in
    /// light mode and Colors.grey[850] in dark mode.
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
    /// If not defined, defaults to 304dp via Flutter SDK defaults for both
    /// M2 and M3.
    ///
    /// M3 spec has it at 360dp for [NavigationDrawer], but
    /// Flutter still uses 304dp as default in M3 mode.
    ///
    /// For more info see issue:
    /// https://github.com/flutter/flutter/issues/123380
    final double? width,

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
    // Get selected background color, defaults to surface.
    final Color backgroundColor = schemeColor(
      backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
      colorScheme,
    );

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
            : WidgetStatePropertyAll<Color>(surfaceTintColor),
      ),
    );
  }

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
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    // On color logic for M2 and M3 are different. Elevated button is a mess.
    final Color onBaseColor = onBaseSchemeColor == null
        ? useM3
            ? schemeColor(SchemeColor.surfaceContainerLow, colorScheme)
            : schemeColorPair(baseScheme, colorScheme)
        : schemeColor(onBaseSchemeColor, colorScheme);

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
    final double factor = _tintAlphaFactor(
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
            return tintedDisable(colorScheme.onSurface, tint);
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
                return tintedDisable(
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
              if (tintInteract) return tintedHovered(overlay, tint, factor);
              return overlay.withAlpha(kAlphaHovered);
            }
            if (states.contains(WidgetState.focused)) {
              if (tintInteract) return tintedFocused(overlay, tint, factor);
              return overlay.withAlpha(kAlphaFocused);
            }
            if (states.contains(WidgetState.pressed)) {
              if (tintInteract) return tintedPressed(overlay, tint, factor);
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
              return tintedDisable(colorScheme.onSurface, tint);
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
              return tintedDisable(
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
            if (tintInteract) return tintedHovered(overlay, tint, factor);
            return foreground.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) return tintedFocused(overlay, tint, factor);
            return foreground.withAlpha(kAlphaFocused);
          }
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) return tintedPressed(overlay, tint, factor);
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
              return tintedDisable(
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

    /// Selects which color from the passed in colorScheme to use as the
    /// background  color for the filled button.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// The foreground color automatically uses the contrast complementary color
    /// from the SchemeColor.
    ///
    /// If not defined, [colorScheme.primary] will be used.
    final SchemeColor? backgroundSchemeColor,

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
    /// [useMaterial3] is true, via M3 built in defaults.
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

    // Get background color, defaults to primary.
    final Color background = schemeColor(
      backgroundSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Get right foreground on color for background, defaults to onPrimary.
    final Color foreground = schemeColorPair(
      backgroundSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = foreground;
    final Color tint = background;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness);

    WidgetStateProperty<Color?>? backgroundColor;
    WidgetStateProperty<Color?>? foregroundColor;
    WidgetStateProperty<Color?>? overlayColor;

    // TODO(rydmike): Monitor FilledButton no variants theming issue.
    // We only define theme props if we have some settings the default
    // widget behavior does not do.
    // We Should do this:
    // if (baseSchemeColor != null || tintInteract || tintDisable) {
    // But due to the theming issue
    // https://github.com/flutter/flutter/issues/118063
    // we only apply the tintInteract and tintDisable if we have a custom
    // color that anyway kills their separate designs.
    if (backgroundSchemeColor != null) {
      backgroundColor = WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return tintedDisable(
              colorScheme.onSurface,
              background,
            ).withAlpha(kAlphaVeryLowDisabled);
          }
          return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
        }
        return background;
      });
      foregroundColor = WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return tintedDisable(colorScheme.onSurface, background);
          }
          return colorScheme.onSurface.withAlpha(kAlphaDisabled);
        }
        return foreground;
      });
    } else {
      // We can in fact do tinted disabled TonalButtons, since they have the
      // same style.
      if (tintDisable) {
        backgroundColor = WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return tintedDisable(
                colorScheme.onSurface,
                background,
              ).withAlpha(kAlphaVeryLowDisabled);
            }
          }
          return null; // We get default backgroundColor.
        });
        foregroundColor = WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return tintedDisable(colorScheme.onSurface, background);
            }
          }
          return null; // We get default foregroundColor.
        });
      }
    }
    // TODO(rydmike): Monitor FilledButton no variants theming issue.
    // Temp if, so we get pure default style when tint interact is false, avoids
    // destroying, the correct overlay for default button when we have different
    // tonal and normal filled button. Added as workaround for issue:
    // https://github.com/flutter/flutter/issues/118063
    if (tintInteract) {
      overlayColor = WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          if (tintInteract) return tintedHovered(overlay, tint, factor);
          // TODO(rydmike): Temp comment, can't be reached due temp if above.
          // return foreground.withAlpha(kAlphaHovered);
        }
        if (states.contains(WidgetState.focused)) {
          if (tintInteract) return tintedFocused(overlay, tint, factor);
          // TODO(rydmike): Temp comment, can't be reached due temp if above.
          // return foreground.withAlpha(kAlphaFocused);
        }
        if (states.contains(WidgetState.pressed)) {
          if (tintInteract) return tintedPressed(overlay, tint, factor);
          // TODO(rydmike): Temp comment, can't be reached due temp if above.
          // return foreground.withAlpha(kAlphaPressed);
        }
        return null; // We get default overlayColor.
      });
    }

    return FilledButtonThemeData(
      style: ButtonStyle(
        splashFactory: splashFactory,
        textStyle: textStyle,
        foregroundColor: foregroundColor,
        iconColor: foregroundColor,
        backgroundColor: backgroundColor,
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
    // }
  }

  /// An opinionated [FloatingActionButtonThemeData] with custom border radius.
  ///
  /// The border radius defaults to [kFabRadius] = 16, the new M3 default.
  /// https://m3.material.io/components/floating-action-button/specs for the
  /// standard sized FAB.
  ///
  /// By setting [useShape] to false, it is possible to opt out of all
  /// shape theming on FABs and keep their defaults, while still eg.
  /// keeping M3 defaults on other widgets or changing their border radius
  /// with the shared global value.
  ///
  /// You may want to continue to keep the FAB circular and extended FAB stadium
  /// (pill) shaped as before, despite otherwise using a rounder or M3 design.
  /// The circular M2 FAB goes well with those designs too and is more familiar.
  static FloatingActionButtonThemeData floatingActionButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the floating action button background color.
    ///
    /// If not defined, then if [useMaterial3] `colorScheme.secondary` will
    /// be. If [useMaterial3] is true, then `colorScheme.primaryContainer`
    /// will be used.
    ///
    /// The foreground color automatically uses the selected background
    /// color's contrast color pair in the passed in [colorScheme] property.
    final SchemeColor? backgroundSchemeColor,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the floating action button foreground color.
    ///
    /// If not defined, effective default is the complement color to used
    /// [backgroundSchemeColor].
    final SchemeColor? foregroundSchemeColor,

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

    /// The text style for an extended [FloatingActionButton]'s label.
    final TextStyle? extendedTextStyle,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

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
    final Color? background = backgroundSchemeColor == null
        ? null
        : schemeColor(backgroundSchemeColor, colorScheme);
    final Color? foreground =
        backgroundSchemeColor == null && foregroundSchemeColor == null
            ? null
            : foregroundSchemeColor != null
                ? schemeColor(foregroundSchemeColor, colorScheme)
                : schemeColorPair(
                    backgroundSchemeColor ??
                        (useM3
                            ? SchemeColor.onPrimaryContainer
                            : SchemeColor.onSecondary),
                    colorScheme,
                  );

    final Color overlay = foreground ??
        (useM3 ? colorScheme.onPrimaryContainer : colorScheme.onSecondary);
    final Color tint = background ??
        (useM3 ? colorScheme.primaryContainer : colorScheme.secondary);

    final double factor = _tintAlphaFactor(tint, colorScheme.brightness);

    return FloatingActionButtonThemeData(
      extendedTextStyle: extendedTextStyle,
      foregroundColor: foreground,
      backgroundColor: background,
      splashColor: tintInteract ? tintedSplash(overlay, tint, factor) : null,
      focusColor: tintInteract ? tintedFocused(overlay, tint, factor) : null,
      hoverColor: tintInteract ? tintedHovered(overlay, tint, factor) : null,
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

  /// An opinionated [IconButtonThemeData].
  ///
  /// Current only used to set tinted interaction and disable style on
  /// [IconButtonThemeData] when these feature are opted in on in FCS.
  static IconButtonThemeData iconButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,
  }) {
    final bool tintInteract = useTintedInteraction ?? false;
    final bool tintDisable = useTintedDisable ?? false;

    // Due to issue:
    // https://github.com/flutter/flutter/pull/121884#issuecomment-1458505977
    // Only supports default colors for now, the colors below are only used
    // for default color matching tinted ink effects.

    // Get right foreground on color for background, defaults to primary.
    final Color foreground = schemeColor(SchemeColor.primary, colorScheme);
    // Get background color, defaults to onPrimary.
    final Color background = schemeColorPair(SchemeColor.primary, colorScheme);

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = background;
    final Color tint = foreground;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness, false);

    // TODO(rydmike): Conditional tintInteract and tintDisabled due to issue.
    // See https://github.com/flutter/flutter/issues/123829
    return tintInteract || tintDisable
        ? IconButtonThemeData(
            style: ButtonStyle(
              // TODO(rydmike): Add tinted disable support when doable in SDK.
              // Due to above mentioned issue backgroundColor cannot be added
              // yet without destroying the different styles.
              // backgroundColor:
              //  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              //   if (states.contains(WidgetState.disabled)) {
              //     if (tintDisable) {
              //       return tintedDisable(colorScheme.onSurface, tint)
              //           .withAlpha(kAlphaVeryLowDisabled);
              //     }
              //     if (states.contains(WidgetState.selected)) {
              //       return colorScheme.onSurface.withValues(alpha: 0.12);
              //     }
              //     return Colors.transparent;
              //   }
              //   if (states.contains(WidgetState.selected)) {
              //     return colorScheme.inverseSurface;
              //   }
              //   return Colors.transparent;
              // }),
              foregroundColor: WidgetStateProperty.resolveWith((
                Set<WidgetState> states,
              ) {
                // We can do a tinted foreground color when requested, since it
                // is the same for all variants by default as well.
                if (states.contains(WidgetState.disabled)) {
                  if (tintDisable) {
                    return tintedDisable(colorScheme.onSurface, tint);
                  }
                  // return colorScheme.onSurface.withValues(alpha: 0.38);
                }
                // if (states.contains(WidgetState.selected)) {
                //   return colorScheme.onInverseSurface;
                // }
                // return colorScheme.onSurfaceVariant;
                return null; // Gets us default for foregroundColor
              }),
              overlayColor: tintInteract
                  ? WidgetStateProperty.resolveWith<Color>((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.selected)) {
                        if (states.contains(WidgetState.pressed)) {
                          if (tintInteract) {
                            return tintedPressed(overlay, tint, factor);
                          }
                          // TODO(rydmike): Add option when Flutter issue fixed.
                          // return
                          // colorScheme.onSurface.withAlpha(kAlphaPressed);
                        }
                        if (states.contains(WidgetState.hovered)) {
                          if (tintInteract) {
                            return tintedHovered(overlay, tint, factor);
                          }
                          // TODO(rydmike): Add option when Flutter issue fixed.
                          // return foreground.withAlpha(kAlphaHovered);
                        }
                        if (states.contains(WidgetState.focused)) {
                          if (tintInteract) {
                            return tintedFocused(overlay, tint, factor);
                          }
                          // TODO(rydmike): Add option when Flutter issue fixed.
                          // return foreground.withAlpha(kAlphaFocused);
                        }
                        return Colors.transparent;
                      }
                      if (states.contains(WidgetState.pressed)) {
                        if (tintInteract) {
                          return tintedPressed(overlay, tint, factor);
                        }
                        // TODO(rydmike): Add option when Flutter issue fixed.
                        // return foreground.withAlpha(kAlphaPressed);
                      }
                      if (states.contains(WidgetState.hovered)) {
                        if (tintInteract) {
                          return tintedHovered(overlay, tint, factor);
                        }
                        // TODO(rydmike): Add option when Flutter issue fixed.
                        //return colorScheme.onSurface.withAlpha(kAlphaHovered);
                      }
                      if (states.contains(WidgetState.focused)) {
                        if (tintInteract) {
                          return tintedFocused(overlay, tint, factor);
                        }
                        // TODO(rydmike): Add option when Flutter issue fixed.
                        //return colorScheme.onSurface.withAlpha(kAlphaFocused);
                      }
                      return Colors.transparent;
                    })
                  : null, // Gets us default for overlayColor.
            ),
          )
        : const IconButtonThemeData();
  }

  /// An opinionated [InputDecorationTheme], with optional fill color and
  /// adjustable corner radius.
  ///
  /// Requires a [ColorScheme] in [colorScheme]. The color
  /// scheme would typically be equal the color scheme also used to define the
  /// color scheme for your app theme.
  ///
  /// Comes with many parameters to adjust the style of the input decorator.
  /// For example the the corner [radius] can be adjusted. In Material 2 mode
  /// it defaults to [kInputDecoratorRadius] which is 16, in Material 3 mode it
  /// defaults to [kInputDecoratorM3Radius] which is 4, following the Material
  /// 3 design specification.
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
    /// If not defined, in M3 mode border color defaults to primary and fill
    /// color to surfaceContainerHighest. In M2 mode border and fill color both
    /// default to primary.
    ///
    /// The border [borderSchemeColor] can be used to define the
    /// border color separately. It defaults to this color, if
    /// [borderSchemeColor] is not defined, and this color is.
    final SchemeColor? baseSchemeColor,

    /// The decorated input fields corner border radius.
    ///
    /// If not defined, in Material-2 mode defaults to [kInputDecoratorRadius]
    /// which is 16, in Material-3 mode it defaults to
    /// [kInputDecoratorM3Radius] which is 4, following the Material
    /// 3 design specification.
    final double? radius,

    /// Selects input border type.
    ///
    /// If undefined, defaults to [FlexInputBorderType.underline].
    ///
    /// THe underline style is default in Flutter too.
    final FlexInputBorderType? borderType,

    /// The padding for the input decoration's container.
    ///
    /// The decoration's container is the area which is filled if
    /// [InputDecoration.filled] is true and bordered per the [border].
    /// It's the area adjacent to [InputDecoration.icon] and above the
    /// [InputDecoration.icon] and above the widgets that contain
    /// [InputDecoration.helperText], [InputDecoration.errorText], and
    /// [InputDecoration.counterText].
    ///
    /// By default the [contentPadding] reflects [isDense] and the type of the
    /// [border]. If [isCollapsed] is true then [contentPadding] is
    /// [EdgeInsets.zero].
    ///
    /// When [isDense] is true, the content padding can be made smaller and
    /// tighter than when it is false.
    ///
    /// If no [contentPadding] is given, Flutter SDK uses default padding values
    /// that depends on if [isDense] is true or false and if we use outline or
    /// underline border.
    final EdgeInsetsGeometry? contentPadding,

    /// Whether the input decorator's child is part of a dense form (i.e., uses
    /// less vertical space).
    ///
    /// Defaults to false.
    final bool? isDense,

    /// If true the decoration's container is filled with [fillColor].
    ///
    /// Typically this field set to true if [border] is an
    /// [UnderlineInputBorder].
    ///
    /// The decoration's container is the area, defined by the border's
    /// [InputBorder.getOuterPath], which is filled if [filled] is
    /// true and bordered per the [border].
    ///
    /// Defaults to false, like Flutter SDK does. Filled is nicer, try it.
    final bool? filled,

    /// An optional totally custom fill color used to fill the
    /// `InputDecorator` background with, when `filled` is true.
    ///
    /// If null, defaults to color scheme color defined by `baseColor`
    /// withAlpha(0x0D) (5%) if color scheme is light and withAlpha(0x14) (8%)
    /// if color scheme is dark.
    final Color? fillColor,

    // TODO(rydmike): Migrate backgroundAlpha to backgroundOpacity.
    /// Defines the alpha, opacity channel value used as opacity on effective
    /// [InputDecorator] background color.
    ///
    /// If defined, the valid range is 0 to 255 (0x00 to 0xFF), if out of bounds
    /// it is capped to closest valid value.
    ///
    /// If not defined, in M3 mode it defaults to 0xFF fully opaque. In M2 mode
    /// defaults to [kFillColorLightOpacity] (0x0D = 5% opacity) in light theme
    /// and to [kFillColorDarkOpacity] (0x14 = 8% opacity) in dark mode.
    ///
    /// NOTE: This will be migrated to use o 0.0 to 1.0 opacity values in
    /// version 9.0. A parallel API wil be introduced in v8.0 to allow for
    /// a smooth migration path.
    final int? backgroundAlpha,

    /// The icon color of the prefixIcon in a focused [InputDecoration].
    ///
    /// If not defined defaults to [baseSchemeColor] in FCS M2 and to
    /// [SchemeColor.onSurface] in FCS M3.
    final SchemeColor? prefixIconSchemeColor,

    /// The icon color of the suffixIcon in a focused [InputDecoration].
    ///
    /// If not defined, defaults to [prefixIconSchemeColor] in FCS M2 and to
    /// [SchemeColor.onSurface] in FCS M3.
    final SchemeColor? suffixIconSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the border
    /// color of the input decorator.
    ///
    /// The color is used by the focused border, but also as slight opacity
    /// based color on unfocused border, when [unfocusedHasBorder] and
    /// [unfocusedBorderIsColored] are true.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined and [baseSchemeColor] is also not defined, then
    /// in M3 and M2 mode, the border color defaults to primary.
    ///
    /// If not defined and [baseSchemeColor] is defined, it defaults
    /// to the color given by [baseSchemeColor].
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
    /// If undefined, defaults to false.
    final bool? unfocusedBorderIsColored,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? tintedInteractions,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? tintedDisabled,

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
    final bool tintInteract = tintedInteractions ?? false;
    final bool tintDisable = tintedDisabled ?? false;
    final bool isFilled = filled ?? false;

    // Used color scheme is for dark mode.
    final bool isDark = colorScheme.brightness == Brightness.dark;

    // Get selected color, defaults to primary.
    final Color baseColor = schemeColor(
      baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Used border color, for focus and unfocused when that option is used.
    final Color borderColor = schemeColor(
      borderSchemeColor ?? baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Tinted disabled colors
    final Color tintDisabledColor = tintedDisable(
      colorScheme.onSurface,
      fillColor ?? baseColor,
    );
    final Color tintDisabledUltraLowColor = tintedDisable(
      colorScheme.onSurface,
      fillColor ?? baseColor,
    ).withValues(alpha: kAlphaUltraLowDisabledFloat);

    // Get effective alpha value for background fill color.
    final double effectiveOpacity = backgroundAlpha == null
        ? useM3
            ? 1.0
            : isDark
                ? kFillColorDarkOpacity
                : kFillColorLightOpacity
        : backgroundAlpha.clamp(0, 255) / 255;

    // Effective used fill color, can also be a totally custom color value.
    // These alpha blends remove the actual opacity and create a none opaque
    // color of the result of as if InputDecorator was used on surface color.
    // Usually this is close enough. This operations makes it possible to
    // use a simple lighter and dark color color of this net effect for
    // the hover effect, which is also actually not transparent.
    final Color usedFillColor = fillColor != null
        ? Color.alphaBlend(
            fillColor.withValues(alpha: effectiveOpacity),
            colorScheme.surface,
          )
        : WidgetStateColor.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return tintDisable
                  ? tintDisabledUltraLowColor
                  : colorScheme.onSurface.withValues(
                      alpha: kAlphaUltraLowDisabledFloat,
                    ); // M3 spec, 4%, 0x0A
            }
            return baseSchemeColor == null && useM3
                ? Color.alphaBlend(
                    colorScheme.surfaceContainerHighest.withValues(
                      alpha: effectiveOpacity,
                    ),
                    colorScheme.surface,
                  )
                : Color.alphaBlend(
                    baseColor.withValues(alpha: effectiveOpacity),
                    colorScheme.surface,
                  );
          });

    // A custom lighter and darker version of the effective background
    // color on the input decorator as hover color. This is a different formula
    // than otherwise used for the overall based hover colors by FCS. It was the
    // only way it was possible to make a nice tinted version that worked well
    // with any config that it is possible to create for the background on
    // the InputDecorator.
    final Color tintedHover =
        ThemeData.estimateBrightnessForColor(usedFillColor) == Brightness.light
            ? usedFillColor.darken(kInputDecoratorLightBgDarken)
            : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

    // Focused prefix iconColor defaults
    final SchemeColor focusedIconDefault = useM3
        ? SchemeColor.onSurfaceVariant
        : baseSchemeColor ?? SchemeColor.primary;
    // Effective focused prefix icon color.
    final Color focusedPrefixIconColor = schemeColor(
      prefixIconSchemeColor ?? focusedIconDefault,
      colorScheme,
    );
    // Effective focused suffix icon color.
    final Color focusedSuffixIconColor = schemeColor(
      suffixIconSchemeColor ?? focusedIconDefault,
      colorScheme,
    );

    // Flutter SDK "magic" theme colors from ThemeData, with old M1/M2 roots.
    final Color hintColorM2 = isDark
        ? Colors.white60
        : Colors.black.withValues(alpha: kTintHoverFloat); // 60%
    final Color unfocusedIconDefaultM2 =
        isDark ? Colors.white70 : Colors.black45;
    final Color disabledDefaultM2 = isDark ? Colors.white38 : Colors.black38;
    final Color disabledDefaultM3 = colorScheme.onSurface.withValues(
      alpha: kAlphaDisabledFloat,
    );
    final Color disabledDefault = useM3 ? disabledDefaultM3 : disabledDefaultM2;

    // Enabled border color.
    final Color enabledBorderColor = unfocusedBorderIsColored ?? false
        ? borderColor.withValues(alpha: kEnabledBorderOpacity)
        : useM3
            ? isFilled
                ? colorScheme.onSurfaceVariant
                : colorScheme.outline
            : colorScheme.onSurface.withValues(alpha: kAlphaDisabledFloat);
    // TODO(rydmike): Review M3 border hover, defaults are not very distinct.
    // Enabled hovered border color.
    final Color enabledHoveredBorderColor = unfocusedBorderIsColored ?? false
        ? borderColor //.withAlpha(kEnabledBorderAlpha)
        : isFilled
            ? colorScheme.onSurface
            : colorScheme.onSurfaceVariant; // .withAlpha(kAlphaDisabled);

    // Default border radius.
    final double effectiveRadius =
        radius ?? (useM3 ? kInputDecoratorM3Radius : kInputDecoratorRadius);

    // Default outline widths.
    final double unfocusedWidth = unfocusedBorderWidth ?? kThinBorderWidth;
    final double focusedWidth = focusedBorderWidth ?? kThickBorderWidth;

    final BorderRadius effectiveUnderlineBorder = BorderRadius.only(
      topLeft: Radius.circular(effectiveRadius),
      topRight: Radius.circular(effectiveRadius),
    );
    final BorderRadius effectiveOutlineBorder = BorderRadius.circular(
      effectiveRadius,
    );

    return InputDecorationTheme(
      labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return tintDisable
              ? TextStyle(color: tintDisabledColor)
              : TextStyle(
                  color: colorScheme.onSurface.withValues(
                    alpha: kAlphaDisabledFloat,
                  ),
                );
        }
        if (states.contains(WidgetState.error)) {
          if (states.contains(WidgetState.focused)) {
            return TextStyle(color: colorScheme.error);
          }
          if (states.contains(WidgetState.hovered)) {
            // TODO(rydmike): Info: M3 default uses onErrorContainer.
            // Excluding it, prefer suffix icon uses error color, opinionated.
            // Maybe add option to choose between error and onErrorContainer?
            return TextStyle(color: colorScheme.error);
          }
          return TextStyle(color: colorScheme.error);
        }
        if (states.contains(WidgetState.focused)) {
          return TextStyle(color: baseColor);
        }
        if (states.contains(WidgetState.hovered)) {
          return TextStyle(color: colorScheme.onSurfaceVariant);
        }

        return TextStyle(
          color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2,
        );
      }),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.error)) {
          if (states.contains(WidgetState.focused)) {
            return TextStyle(color: colorScheme.error);
          }

          if (states.contains(WidgetState.hovered)) {
            // TODO(rydmike): Info: M3 uses onErrorContainer.
            // Excluding it, prefer error as float label color, FCS opinionated.
            // Maybe include with option to choose style?
            return TextStyle(color: colorScheme.error);
          }
          return TextStyle(
            // TODO(rydmike): Info: M3 error, with this we get a hover diff.
            // Prefer this as a diff to the hover state.
            color: colorScheme.error.withValues(
              alpha: kEnabledBorderOpacity,
            ),
          );
        }
        if (states.contains(WidgetState.focused)) {
          return TextStyle(color: borderColor);
        }
        if (states.contains(WidgetState.hovered)) {
          return TextStyle(color: colorScheme.onSurfaceVariant);
        }
        if (states.contains(WidgetState.disabled)) {
          return tintDisable
              ? TextStyle(color: tintDisabledColor)
              : TextStyle(color: disabledDefault);
        }
        return TextStyle(
          color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2,
        );
      }),
      helperStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return tintDisable
              ? TextStyle(color: tintDisabledColor)
              : TextStyle(
                  color: useM3
                      ? colorScheme.onSurface.withValues(
                          alpha: kAlphaDisabledFloat,
                        )
                      : Colors.transparent,
                );
        }
        return TextStyle(
          color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2,
        );
      }),
      hintStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return TextStyle(
            color: tintDisable ? tintDisabledColor : disabledDefault,
          );
        }
        return TextStyle(
          color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2,
        );
      }),
      iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return tintDisable ? tintDisabledColor : disabledDefault;
        }
        if (states.contains(WidgetState.focused)) {
          return useM3 ? colorScheme.onSurfaceVariant : baseColor;
        }
        return useM3 ? colorScheme.onSurfaceVariant : unfocusedIconDefaultM2;
      }),
      prefixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return tintDisable ? tintDisabledColor : disabledDefault;
        }
        if (states.contains(WidgetState.focused)) {
          return focusedPrefixIconColor;
        }
        return useM3 ? colorScheme.onSurfaceVariant : unfocusedIconDefaultM2;
      }),
      suffixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.error)) {
          if (states.contains(WidgetState.focused)) {
            return colorScheme.error;
          }
          if (states.contains(WidgetState.hovered)) {
            // TODO(rydmike): Info: M3 default uses onErrorContainer.
            // Excluding it, prefer suffix icon uses error color, opinionated.
            // Maybe add option to choose between error and onErrorContainer?
            return colorScheme.error;
          }
          return colorScheme.error;
        }
        if (states.contains(WidgetState.disabled)) {
          return tintDisable ? tintDisabledColor : disabledDefault;
        }
        if (states.contains(WidgetState.focused)) {
          return focusedSuffixIconColor;
        }
        return useM3 ? colorScheme.onSurfaceVariant : unfocusedIconDefaultM2;
      }),
      contentPadding: contentPadding,
      isDense: isDense ?? false,
      filled: isFilled,
      fillColor: usedFillColor,
      hoverColor: tintInteract ? tintedHover : null,
      //
      // Complex custom BORDER theming, now with hover effects.
      //
      border: (borderType ?? FlexInputBorderType.underline) ==
              FlexInputBorderType.underline
          ? WidgetStateInputBorder.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: unfocusedHasBorder
                      ? BorderSide(
                          color: tintDisable
                              ? tintDisabledColor.withValues(
                                  alpha: kAlphaLowDisabledFloat,
                                )
                              : colorScheme.onSurface.withValues(
                                  alpha: kAlphaVeryLowDisabledFloat,
                                ),
                          width: unfocusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: focusedHasBorder
                        ? BorderSide(
                            color: colorScheme.error,
                            width: focusedWidth,
                          )
                        : BorderSide.none,
                  );
                }
                if (states.contains(WidgetState.hovered)) {
                  return UnderlineInputBorder(
                    borderRadius: effectiveUnderlineBorder,
                    borderSide: unfocusedHasBorder
                        ? BorderSide(
                            // TODO(rydmike): Info: M3 uses onErrorContainer
                            color: colorScheme.error,
                            width: unfocusedWidth,
                          )
                        : BorderSide.none,
                  );
                }
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: unfocusedHasBorder
                      ? BorderSide(
                          // TODO(rydmike): Info: M3 uses error
                          color: colorScheme.error.withValues(
                            alpha: kEnabledBorderOpacity,
                          ),
                          width: unfocusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              if (states.contains(WidgetState.focused)) {
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: focusedHasBorder
                      ? BorderSide(
                          color: borderColor,
                          width: focusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              if (states.contains(WidgetState.hovered)) {
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: unfocusedHasBorder
                      ? BorderSide(
                          color: enabledHoveredBorderColor,
                          width: unfocusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              return UnderlineInputBorder(
                borderRadius: effectiveUnderlineBorder,
                borderSide: unfocusedHasBorder
                    ? BorderSide(
                        color: enabledBorderColor,
                        width: unfocusedWidth,
                      )
                    : BorderSide.none,
              );
            })
          //
          // The outline version
          : WidgetStateInputBorder.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return OutlineInputBorder(
                  borderRadius: effectiveOutlineBorder,
                  borderSide: unfocusedHasBorder
                      ? BorderSide(
                          color: tintDisable
                              ? tintDisabledColor.withValues(
                                  alpha: kAlphaLowDisabledFloat,
                                )
                              : colorScheme.onSurface.withValues(
                                  alpha: kAlphaVeryLowDisabledFloat,
                                ),
                          width: unfocusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              if (states.contains(WidgetState.error)) {
                if (states.contains(WidgetState.focused)) {
                  return OutlineInputBorder(
                    borderRadius: effectiveOutlineBorder,
                    borderSide: focusedHasBorder
                        ? BorderSide(
                            color: colorScheme.error,
                            width: focusedWidth,
                          )
                        : BorderSide.none,
                  );
                }
                if (states.contains(WidgetState.hovered)) {
                  return OutlineInputBorder(
                    borderRadius: effectiveOutlineBorder,
                    borderSide: unfocusedHasBorder
                        ? BorderSide(
                            // TODO(rydmike): Info: M3 uses onErrorContainer
                            color: colorScheme.error,
                            width: unfocusedWidth,
                          )
                        : BorderSide.none,
                  );
                }
                return OutlineInputBorder(
                  borderRadius: effectiveOutlineBorder,
                  borderSide: unfocusedHasBorder
                      ? BorderSide(
                          // TODO(rydmike): Info: M3 uses error
                          color: colorScheme.error.withValues(
                            alpha: kEnabledBorderOpacity,
                          ),
                          width: unfocusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              if (states.contains(WidgetState.focused)) {
                return OutlineInputBorder(
                  borderRadius: effectiveOutlineBorder,
                  borderSide: focusedHasBorder
                      ? BorderSide(
                          color: borderColor,
                          width: focusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              if (states.contains(WidgetState.hovered)) {
                return OutlineInputBorder(
                  borderRadius: effectiveOutlineBorder,
                  borderSide: unfocusedHasBorder
                      ? BorderSide(
                          color: enabledHoveredBorderColor,
                          width: unfocusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              return OutlineInputBorder(
                borderRadius: effectiveOutlineBorder,
                borderSide: unfocusedHasBorder
                    ? BorderSide(
                        color: enabledBorderColor,
                        width: unfocusedWidth,
                      )
                    : BorderSide.none,
              );
            }),
    );
  }

  /// An opinionated [ListTileThemeData] theme.
  static ListTileThemeData listTileTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Defines the color used for icons and text when the list tile is
    /// selected.
    ///
    /// If not defined, defaults to [ColorScheme.primary].
    final SchemeColor? selectedSchemeColor,

    /// Defines the default color for ListTile [leading] and [trailing] icons.
    ///
    /// If this property is null and [selected] is false then this color is
    /// used.
    ///
    /// If null and [ThemeData.useMaterial3] is true,
    /// [ColorScheme.onSurfaceVariant] is used, otherwise in M2 and if
    /// [ThemeData.brightness] is [Brightness.light], [Colors.black54] is used,
    /// and if [ThemeData.brightness] is [Brightness.dark], the value is null.
    ///
    /// If [selected] is true then [selectedSchemeColor] is used. If
    /// it is null then [ColorScheme.primary] is used.
    final SchemeColor? iconSchemeColor,

    /// Defines the text color for the [title], [subtitle], [leading], and
    /// [trailing].
    ///
    /// If this property is null and [selected] is false then
    /// [textSchemeColor] is used. If that is also null then
    /// default text color is used for the [title], [subtitle], [leading], and
    /// [trailing]. Except for [subtitle], if [ThemeData.useMaterial3] is false,
    /// [TextTheme.bodySmall] is used.
    ///
    /// If this property is null and [selected] is true then
    /// [selectedSchemeColor is used. If that is also null
    /// then [ColorScheme.primary] is used.
    ///
    /// If this color is a [WidgetStateColor] it will be resolved against
    /// [WidgetState.selected] and [WidgetState.disabled] states.
    final SchemeColor? textSchemeColor,

    /// The text style for ListTile's [title].
    ///
    /// If this property is null, then [ListTileThemeData.titleTextStyle] is
    /// used.
    ///
    /// If that is also null and [ThemeData.useMaterial3] is true,
    /// [TextTheme.bodyLarge] with [ColorScheme.onSurface] will be used.
    ///
    /// Otherwise, If ListTile style is [ListTileStyle.list],
    /// [TextTheme.titleMedium] will be used and if ListTile style
    /// is [ListTileStyle.drawer], [TextTheme.bodyLarge] will be used.
    final TextStyle? titleTextStyle,

    /// The text style for ListTile's [subtitle].
    ///
    /// If this property is null, then [ListTileThemeData.subtitleTextStyle]
    /// is used.
    ///
    /// If that is also null and [ThemeData.useMaterial3] is true,
    /// [TextTheme.bodyMedium] with [ColorScheme.onSurfaceVariant] will be used,
    /// otherwise [TextTheme.bodyMedium] with [TextTheme.bodySmall] color will
    /// be used.
    final TextStyle? subtitleTextStyle,

    /// The text style for ListTile's [leading] and [trailing].
    ///
    /// If this property is null, then
    /// [ListTileThemeData.leadingAndTrailingTextStyle] is used.
    ///
    /// If that is also null and [ThemeData.useMaterial3] is true,
    /// [TextTheme.labelSmall] with [ColorScheme.onSurfaceVariant] will be used,
    /// otherwise [TextTheme.bodyMedium] will be used.
    final TextStyle? leadingAndTrailingTextStyle,

    /// Defines the background color of `ListTile` when [selected] is false.
    ///
    /// If this property is null and [selected] is false then
    /// [ListTileThemeData.tileColor] is used. If that is also null and
    /// [selected] is true, [selectedTileColor] is used.
    ///
    /// When that is also null, the [ListTileTheme.selectedTileColor] is used,
    /// otherwise [Colors.transparent] is used.
    final SchemeColor? tileSchemeColor,

    /// Defines the background color of `ListTile` when [selected] is true.
    ///
    /// When the value if null, the [selectedTileColor] is set to
    /// [ListTileTheme.selectedTileColor] if it's not null and to
    /// [Colors.transparent] if it's null.
    final SchemeColor? selectedTileSchemeColor,

    // TODO(rydmike): Default is incorrect for M3 in Flutter doc comment. Fix!
    /// The tile's internal padding.
    ///
    /// Insets a [ListTile]'s contents: its [leading], [title], [subtitle],
    /// and [trailing] widgets.
    ///
    ///
    /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used, if
    /// `useMaterial3` is `false`. If `useMaterial3` is `true` then
    /// `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` is used.
    final EdgeInsetsGeometry? contentPadding,

    /// The horizontal gap between the titles and the leading/trailing widgets.
    ///
    /// If not defined, defaults to 16.
    final double? horizontalTitleGap,

    /// The minimum padding on the top and bottom of the title and subtitle
    /// widgets.
    ///
    /// If not defined, defaults to 4.
    final double? minVerticalPadding,

    /// Defines the font used for the [title].
    ///
    /// If this property is null then [ListTileThemeData.style] is used. If that
    /// is also null then [ListTileStyle.list] is used.
    final ListTileStyle? style,

    /// Defines how [ListTile.leading] and [ListTile.trailing] are
    /// vertically aligned relative to the [ListTile]'s titles
    /// ([ListTile.title] and [ListTile.subtitle]).
    ///
    /// If this property is null then [ListTileThemeData.titleAlignment]
    /// is used. If that is also null then [ListTileTitleAlignment.threeLine]
    /// is used.
    final ListTileTitleAlignment? titleAlignment,

    /// If specified, overrides the default value of
    /// [CheckboxListTile.controlAffinity] or [ExpansionTile.controlAffinity]
    /// or [SwitchListTile.controlAffinity] or [RadioListTile.controlAffinity].
    final ListTileControlAffinity? controlAffinity,
  }) {
    final Color selectedColor = schemeColor(
      selectedSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    final Color? iconColor = iconSchemeColor == null
        ? null
        : schemeColor(iconSchemeColor, colorScheme);

    final Color? textColor = textSchemeColor == null
        ? null
        : schemeColor(textSchemeColor, colorScheme);

    final Color? tileColor = tileSchemeColor == null
        ? null
        : schemeColor(tileSchemeColor, colorScheme);

    final Color? selectedTileColor = selectedTileSchemeColor == null
        ? null
        : schemeColor(selectedTileSchemeColor, colorScheme);

    return ListTileThemeData(
      selectedColor: selectedColor,
      iconColor: iconColor,
      textColor: textColor,
      //
      titleTextStyle: titleTextStyle,
      subtitleTextStyle: subtitleTextStyle,
      leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
      //
      tileColor: tileColor,
      selectedTileColor: selectedTileColor,
      contentPadding: contentPadding,
      horizontalTitleGap: horizontalTitleGap,
      minVerticalPadding: minVerticalPadding,
      style: style,
      titleAlignment: titleAlignment,
      controlAffinity: controlAffinity,
    );
  }

  /// An opinionated [MenuBarThemeData] theme.
  static MenuBarThemeData menuBarTheme({
    // Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the MenuBar background color.
    ///
    /// If not defined, default to [colorScheme.surfaceContainer].
    ///
    /// FlexColorScheme passes in
    /// [FlexSubThemesData.menuBarBackgroundSchemeColor] first, can be null, and
    /// uses [FlexSubThemesData.menuSchemeColor] as fallback, can also be null.
    final SchemeColor? backgroundSchemeColor,

    /// The shadow color of the MenuBar's [Material].
    ///
    /// The material's elevation shadow can be difficult to see for dark themes,
    /// so by default the menu classes add a semi-transparent overlay to
    /// indicate elevation. See [ThemeData.applyElevationOverlayColor].
    final Color? shadowColor,

    /// The surface tint color of the MenuBar's [Material].
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
    final Color background = schemeColor(
      backgroundSchemeColor ?? SchemeColor.surfaceContainer,
      colorScheme,
    );

    final bool allDefault = backgroundSchemeColor == null &&
        shadowColor == null &&
        surfaceTintColor == null &&
        elevation == null &&
        radius == null;

    return MenuBarThemeData(
      style: allDefault
          ? null
          : MenuStyle(
              backgroundColor: backgroundSchemeColor != null
                  ? WidgetStatePropertyAll<Color?>(background)
                  : null,
              surfaceTintColor: surfaceTintColor != null
                  ? WidgetStatePropertyAll<Color?>(surfaceTintColor)
                  : null,
              shadowColor: shadowColor != null
                  ? WidgetStatePropertyAll<Color?>(shadowColor)
                  : null,
              elevation: elevation != null
                  ? WidgetStatePropertyAll<double?>(elevation)
                  : null,
              shape: radius != null
                  ? WidgetStatePropertyAll<OutlinedBorder>(
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
  ///
  /// Provides complex styling for themed [SubmenuButton]s and [MenuItemButton]s
  /// with [SchemeColor] selections. Border radius on the indicator, highlighted
  /// menu item.
  ///
  /// If highlight colors are not defined, the highlighted item uses default
  /// [WidgetState] property response os overlay for highlighted item.
  /// These states can optionally also use FlexColorScheme tinted style.
  /// Disabled items can also to use the optional FCS tinted style.
  static MenuButtonThemeData menuButtonTheme({
    // Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Provide info on which color from the passed in [colorScheme] parameter
    /// that is used as background color of menu containers defined by
    /// [FlexSubThemes.menuTheme] and [FlexSubThemes.menuBarTheme]. The menu
    /// container is used by [MenuAnchor], [DropDownMenu] and menus on
    /// [MenuBar].
    ///
    /// If not defined, defaults to [colorScheme.surfaceContainer].
    final SchemeColor? menuBackgroundSchemeColor,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the [SubmenuButton]s and [MenuItemButton]s background color for
    /// unselected, i.e. not highlighted via hover, focus or pressed state.
    ///
    /// If not defined, defaults to [menuBackgroundSchemeColor].
    final SchemeColor? backgroundSchemeColor,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the [SubmenuButton]s and [MenuItemButton]s foreground color.
    ///
    /// If not defined, defaults to the contrast pair for
    /// [backgroundSchemeColor].
    final SchemeColor? foregroundSchemeColor,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the highlighted [SubmenuButton]s and [MenuItemButton]s indicator
    /// background color.
    ///
    /// If not defined, defaults to [backgroundSchemeColor] and the indicator
    /// only get overlay color hover, focus and press states.
    final SchemeColor? indicatorBackgroundSchemeColor,

    /// Select which color from the passed in [colorScheme] parameter to use as
    /// the highlighted [SubmenuButton]s and [MenuItemButton]s indicator
    /// foreground color.
    ///
    /// If not defined, defaults to the contrast pair for
    /// [indicatorBackgroundSchemeColor], without its overlay color.
    /// If [indicatorBackgroundSchemeColor] is not defined the result of
    /// this is same color as [foregroundSchemeColor].
    final SchemeColor? indicatorForegroundSchemeColor,

    /// The MenuButton corner border radius.
    ///
    /// If not defined, defaults to 0 via Widget's default behavior.
    final double? radius,

    /// The style for a menu button's [Text] widget descendants.
    ///
    /// The color of the [textStyle] is typically not used directly, the
    /// [foregroundSchemeColor] is used instead.
    final WidgetStateProperty<TextStyle?>? textStyle,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,
  }) {
    final bool tintInteract = useTintedInteraction ?? false;
    final bool tintDisable = useTintedDisable ?? false;

    // Get foreground color used on not active menu item, by default
    // contrast to menu background color, which defaults to surface.
    // FCS passes in the generally defined menu background, if it has been
    // defined, to ensure buttons are based on their background color.
    // The buttons can have another un-highlighted background color than the
    // menu container, but it is probably not a very useful design.
    final SchemeColor menuBgScheme =
        menuBackgroundSchemeColor ?? SchemeColor.surfaceContainer;
    final SchemeColor bgScheme = backgroundSchemeColor ?? menuBgScheme;
    final Color backgroundColor = schemeColor(bgScheme, colorScheme);
    final SchemeColor fgScheme =
        foregroundSchemeColor ?? onSchemeColor(bgScheme);
    final Color foregroundColor = schemeColor(fgScheme, colorScheme);

    // Get background color of highlighted menu item.
    final SchemeColor indBgScheme = indicatorBackgroundSchemeColor ?? bgScheme;
    final Color indicatorBgColor = schemeColor(indBgScheme, colorScheme);
    final SchemeColor indFgScheme =
        indicatorForegroundSchemeColor ?? onSchemeColor(indBgScheme);
    final Color indicatorFgColor = schemeColor(indFgScheme, colorScheme);

    final bool transparentBackground =
        backgroundSchemeColor == null || menuBgScheme == bgScheme;

    // If foreground is plain contrast to a standard surface, we cannot use it
    // for tint, in that case we will use primary color for tint.
    final bool fgIsPlain = fgScheme == SchemeColor.onSurface ||
        fgScheme == SchemeColor.onSurfaceVariant;
    final bool indFgIsPlain = indFgScheme == SchemeColor.onSurface ||
        indFgScheme == SchemeColor.onSurfaceVariant;
    // We are using a light colorScheme.
    final bool isLight = colorScheme.brightness == Brightness.light;
    // Get brightness of background color.
    final bool bgIsLight =
        ThemeData.estimateBrightnessForColor(indicatorBgColor) ==
            Brightness.light;
    // We use surface mode tint factor, if it is light theme and background
    // is light OR if it is a dark theme and background is dark.
    final bool surfaceMode = (isLight && bgIsLight) || (!isLight && !bgIsLight);
    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = indicatorBgColor;
    final Color tint = indFgIsPlain ? colorScheme.primary : indicatorFgColor;
    final Color disabledTint =
        fgIsPlain ? colorScheme.primary : foregroundColor;
    // Custom factor for menu buttons.
    final double factor = surfaceMode ? 1 : 2;

    return MenuButtonThemeData(
      style: ButtonStyle(
        textStyle: textStyle,
        // MenuButtons text and background changes should not animate.
        // If they do we get this issue:
        // https://github.com/flutter/flutter/issues/123615
        // We do not want that. This Duration fixes the issue.
        animationDuration: Duration.zero,
        // Foreground color, use same for icon.
        foregroundColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return tintedDisable(foregroundColor, disabledTint);
            }
            return foregroundColor.withAlpha(kAlphaDisabled);
          }
          if (states.contains(WidgetState.pressed)) {
            return indicatorFgColor;
          }
          if (states.contains(WidgetState.hovered)) {
            return indicatorFgColor;
          }
          if (states.contains(WidgetState.focused)) {
            return indicatorFgColor;
          }
          return foregroundColor;
        }),
        // icon foreground color.
        iconColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return tintedDisable(foregroundColor, disabledTint);
            }
            return foregroundColor.withAlpha(kAlphaDisabled);
          }
          if (states.contains(WidgetState.pressed)) {
            return indicatorFgColor;
          }
          if (states.contains(WidgetState.hovered)) {
            return indicatorFgColor;
          }
          if (states.contains(WidgetState.focused)) {
            return indicatorFgColor;
          }
          return foregroundColor;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (indicatorBackgroundSchemeColor != null) {
            if (states.contains(WidgetState.pressed)) {
              return indicatorBgColor;
            }
            if (states.contains(WidgetState.hovered)) {
              return indicatorBgColor;
            }
            if (states.contains(WidgetState.focused)) {
              return indicatorBgColor;
            }
          }
          return transparentBackground ? Colors.transparent : backgroundColor;
        }),
        overlayColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) return tintedPressed(overlay, tint, factor);
            return foregroundColor.withAlpha(kAlphaPressed);
          }
          if (states.contains(WidgetState.selected)) {
            if (tintInteract) return tintedSplash(overlay, tint, factor);
            return foregroundColor.withAlpha(kAlphaSplash);
          }
          if (states.contains(WidgetState.focused)) {
            if (indicatorBackgroundSchemeColor != null) {
              return Colors.transparent;
            }
            if (tintInteract) return tintedFocused(overlay, tint, factor);
            return foregroundColor.withAlpha(kAlphaFocused);
          }
          if (states.contains(WidgetState.hovered)) {
            if (indicatorBackgroundSchemeColor != null) {
              return Colors.transparent;
            }
            if (tintInteract) return tintedHovered(overlay, tint, factor);
            return foregroundColor.withAlpha(kAlphaFocused);
          }
          return Colors.transparent;
        }),
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

  /// An opinionated [MenuThemeData] theme.
  ///
  /// This theme is used by the menu for the [DropdownMenu], [MenuBar] and
  /// [MenuAnchor].
  static MenuThemeData menuTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Defines which [Theme] based [ColorScheme] based background color
    /// of [PopupMenuButton].
    ///
    /// If not defined, will remains null and via Flutter SDK defaults get
    /// [ColorScheme.surfaceContainer] color.
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
    /// then [ColorScheme.surfaceContainer] will be used as background color to
    /// make a background color with opacity.
    final double? opacity,

    /// Menu corner radius.
    ///
    /// If not defined, default to 4 via Menu widget Flutter SDK defaults.
    final double? radius,

    /// The padding between the menu's boundary and its child.
    final EdgeInsetsGeometry? padding,

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
        ? schemeColor(
            backgroundSchemeColor,
            colorScheme,
          ).withValues(alpha: opacity ?? 1.0)
        : opacity != null
            ? colorScheme.surfaceContainer.withValues(alpha: opacity)
            : null;

    final bool allDefaults = backgroundSchemeColor == null &&
        opacity == null &&
        radius == null &&
        padding == null &&
        elevation == null &&
        surfaceTintColor == null;

    return MenuThemeData(
      style: allDefaults
          ? null
          : MenuStyle(
              elevation: elevation == null
                  ? null
                  : WidgetStatePropertyAll<double?>(elevation),
              backgroundColor: backgroundSchemeColor == null && opacity == null
                  ? null
                  : WidgetStatePropertyAll<Color?>(backgroundColor),
              padding: padding == null
                  ? null
                  : WidgetStatePropertyAll<EdgeInsetsGeometry?>(padding),
              surfaceTintColor: surfaceTintColor == null
                  ? null
                  : WidgetStatePropertyAll<Color>(surfaceTintColor),
              shape: radius == null
                  ? null
                  : WidgetStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(radius),
                        ),
                      ),
                    ),
            ),
    );
  }

  /// An opinionated [NavigationBarThemeData] with a flat API.
  ///
  /// The navigation bar can use opinionated color choices from the passed
  /// [colorScheme] to style the bottom navigation bar, it uses "quick"
  /// settings not requiring usage of WidgetState property resolutions.
  ///
  /// This sub-theme uses a style that prefers single use config parameters over
  /// the ones that combines many styling options into sub-themes and
  /// WidgetState properties. This is simpler to use when you want to just
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
  /// need the complicated [WidgetStateProperty] which can be difficult to
  /// use. It instead exposes properties for the usable states.
  ///
  /// It can also set an [opacity] on the background color.
  static NavigationBarThemeData navigationBarTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// Optional text style for the [NavigationBar] labels.
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

    /// Select which color from the passed in [ColorScheme] to use for
    /// the [NavigationBar]'s label text color.
    ///
    /// When undefined, if [backgroundSchemeColor] is defined, its
    /// contrasting on color will be used, if it is also undefined
    /// [SchemeColor.onSurface] will be used.
    ///
    /// Flutter is default is onSurface.
    final SchemeColor? selectedLabelSchemeColor,

    /// Select which color from the theme's [ColorScheme] to for
    /// the [NavigationBar]'s unselected label text color.
    ///
    /// When undefined, if [backgroundSchemeColor] is
    /// using any of the surface colors, the default on pair used will be
    /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
    /// that is the typical contrast color for surface colors.
    /// This is to make the unselected labels and icons look more muted.
    ///
    /// If other [backgroundSchemeColor] colors are used,
    /// while this value is undefined, their default contrasting onColor will
    /// be used. If the [backgroundSchemeColor] is also undefined,
    /// then this defaults to [SchemeColor.onSurfaceVariant].
    ///
    /// Flutter SDK defaults to [ColorScheme.onSurface] in M2 mode and
    /// [ColorScheme.onSurfaceVariant] in M3 mode.
    final SchemeColor? unselectedLabelSchemeColor,

    // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
    //
    // An alternative unselected item color.
    //
    // It is used as fallback if [unselectedIconSchemeColor] is not specified,
    // before its normal default fallbacks.
    //
    // The color is typically used to provide the color created by blended or
    // tinted text theme, when it is being used by FlexColorScheme as an
    // `onSurfaceVariant` equivalent style, but a bit more primary tinted.
    //
    // FlexColorScheme passes in its `onSurfaceVariantBlendedTextStyle` when
    // a blended TextTheme is being used.
    // final Color? altUnselectedColor,

    /// If true, the unselected label in the [NavigationBar] use a more
    /// muted color version of the color defined by
    /// [unselectedLabelSchemeColor].
    ///
    /// The muting is unselected color with
    /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    /// and withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to false.
    final bool? mutedUnselectedLabel,

    /// The size of the icon on selected [NavigationBar] item.
    ///
    /// If undefined, defaults to 24.
    final double? selectedIconSize,

    /// The size of the icons on unselected [NavigationBar] items.
    ///
    /// If null, defaults to [selectedIconSize].
    final double? unselectedIconSize,

    /// Select which color from the theme's [ColorScheme] to use for
    /// the [NavigationBar]'s selected item icon color.
    ///
    /// If undefined, and [indicatorSchemeColor] is also
    /// undefined, then defaults to [SchemeColor.onSecondaryContainer].
    /// If undefined, but [indicatorSchemeColor] is defined, then
    /// it defaults to the contrast onColor pair of the indicator color
    /// [indicatorSchemeColor]
    ///
    /// Flutter SDK defaults to [ColorScheme.onSurface] in M2 mode and
    /// [ColorScheme.onSecondaryContainer] in M3.
    final SchemeColor? selectedIconSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use for
    /// the [NavigationBar]'s unselected item icon color.
    ///
    /// When undefined, if [backgroundSchemeColor] is
    /// using any of the surface colors, the default on pair used will be
    /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
    /// that is the typical contrast color for surface colors.
    /// This is to make the unselected labels and icons look more muted.
    ///
    /// If other [backgroundSchemeColor] colors are used,
    /// while this value is undefined, their default contrasting onColor will
    /// be used. If the [backgroundSchemeColor] is also undefined,
    /// then this defaults to [SchemeColor.onSurfaceVariant].
    ///
    /// Flutter SDK defaults to [ColorScheme.onSurface] in M2 mode and to
    /// [ColorScheme.onSurfaceVariant] in M3 mode.
    final SchemeColor? unselectedIconSchemeColor,

    /// If true, the unselected icon in the [NavigationBar] use a more muted
    /// color version of the color defined by [unselectedIconSchemeColor].
    ///
    /// The muting is unselected color with
    /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    /// and withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to false.
    final bool? mutedUnselectedIcon,

    /// Select which color from the theme [ColorScheme] to use as base for
    /// the [NavigationBar]'s selected item indicator.
    ///
    /// If undefined, defaults to [SchemeColor.secondaryContainer].
    ///
    /// Flutter SDK defaults to secondaryContainer in M3 mode and to
    /// secondary in M2 mode with opacity 24%.
    final SchemeColor? indicatorSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use as background
    /// color for the [NavigationBar].
    ///
    /// If undefined, defaults to [SchemeColor.surfaceContainer]
    ///
    /// Flutter SDK defaults to surfaceContainer in M3 and in M2 mode to
    /// surface color, with a color overlay using onSurface at
    /// fixed elevation 3.
    final SchemeColor? backgroundSchemeColor,

    /// NavigationBar background opacity.
    ///
    /// If undefined, defaults to 1, fully opaque.
    final double? opacity,

    /// NavigationBar elevation.
    ///
    /// If undefined, defaults to default in M3 mode which is 3 and in
    /// M2 mode 0.
    ///
    /// In M2 mode it defaults [kBottomNavigationBarElevation] = 3.
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
    /// If not defined, defaults to is 0xFF, or opacity 1.
    ///
    /// Flutter SDK uses 24% in M2 and 100% in M3,
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

    /// A temporary flag used to disable Material-3 design and use legacy
    /// Material-2 design instead. Material-3 design is the default.
    /// Material-2 will be deprecated in Flutter.
    ///
    /// The M2/M3 SDK defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to true.
    @Deprecated(
      'The useMaterial3 flag no longer has any function in this '
      'component theme and is deprecated here. It will be removed in v9',
    )
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
    /// ```text
    ///                    FCS defaults   M2 defaults       useMaterial3:true
    /// useFlutterDefaults false          true              true
    /// results in:
    ///
    /// - background       surfaceVariant surface with      surface with
    ///                                   onSurface overlay primary overlay
    ///                    elev 3         elev 0            elev 3
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
    /// [FlexSubThemesData.navigationBarMutedUnselectedIcon] and
    /// [FlexSubThemesData.navigationBarMutedUnselectedLabel] are true
    /// respectively, this also applies to undefined color inputs.
    @Deprecated(
      'The `useFlutterDefaults` is deprecated, it no longer has any '
      'function and will be removed in v9. FlexColorScheme in M3 mode '
      'defaults to using mostly Flutter defaults styles. '
      'For other configurations modify the theme as desired. '
      'In M2 mode FCS will continue to use its own opinionated defaults for '
      'as long as M2 exists.',
    )
    final bool? useFlutterDefaults,
  }) {
    // Background color, when using normal default, falls back to
    // surfaceContainer.
    final Color backgroundColor = (opacity ?? 1.0) != 1.0 &&
            backgroundSchemeColor != SchemeColor.transparent
        ? schemeColor(
            backgroundSchemeColor ?? SchemeColor.surfaceContainer,
            colorScheme,
          ).withValues(alpha: opacity ?? 1.0)
        : schemeColor(
            backgroundSchemeColor ?? SchemeColor.surfaceContainer,
            colorScheme,
          );

    // Use onSurface as contrast for all selected on surface label colors !!
    final Color onBackGroundColorFallback = schemeColorPair(
      backgroundSchemeColor ?? SchemeColor.surface,
      colorScheme,
    );

    // Use onSurfaceVariant as contrast for all unselected on surface colors !!
    final Color onVariantBackGroundColorFallback = schemeColorPair(
      backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
      colorScheme,
      useOnSurfaceVariant: true,
    );

    // Get text color, defaults to onSurface.
    final Color labelColor = selectedLabelSchemeColor == null
        ? onBackGroundColorFallback
        : schemeColor(selectedLabelSchemeColor, colorScheme);

    // Get unselected label color, defaults to onSurfaceVariant.
    final Color unselectedLabelColor = unselectedLabelSchemeColor == null
        ? onVariantBackGroundColorFallback
        : schemeColor(unselectedLabelSchemeColor, colorScheme);

    // Get text style, defaults to TextStyle(), we can use it since
    // size and color are applied to is separately.
    final TextStyle textStyle = labelTextStyle ?? const TextStyle();

    // Get effective text sizes.
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 12;
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? labelSize;

    // Use color pair for indicator, as contrast for selected icon color.
    final Color onIndicatorColorFallback = schemeColorPair(
      indicatorSchemeColor ?? SchemeColor.secondaryContainer,
      colorScheme,
    );

    // Get icon color, defaults to onSecondaryContainer.
    final Color iconColor = selectedIconSchemeColor == null
        ? onIndicatorColorFallback
        : schemeColor(selectedIconSchemeColor, colorScheme);

    // Get unselected icon color, defaults to onSurfaceVariant.
    final Color unselectedIconColor = unselectedIconSchemeColor == null
        ? onVariantBackGroundColorFallback
        : schemeColor(unselectedIconSchemeColor, colorScheme);

    // Get effective icons sizes.
    final double iconSize = selectedIconSize ?? 24;
    final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

    // Indicator color, when using normal default, falls back to
    // secondaryContainer.
    final Color indicatorColor = schemeColor(
      indicatorSchemeColor ?? SchemeColor.secondaryContainer,
      colorScheme,
    ).withAlpha(indicatorAlpha ?? 0xFF);

    return NavigationBarThemeData(
      height: height,
      elevation: elevation,
      backgroundColor: backgroundColor,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      indicatorColor: indicatorColor,
      indicatorShape: indicatorRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(indicatorRadius)),
            ),
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return textStyle.copyWith(fontSize: labelSize, color: labelColor);
        }
        return textStyle.copyWith(
          fontSize: effectiveUnselectedLabelSize,
          color: (mutedUnselectedLabel ?? false)
              ? unselectedLabelColor
                  .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                  .withAlpha(unselectedAlpha)
              : unselectedLabelColor,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(size: iconSize, color: iconColor);
        }
        return IconThemeData(
          size: effectiveUnselectedIconSize,
          color: (mutedUnselectedIcon ?? false)
              ? unselectedIconColor
                  .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                  .withAlpha(unselectedAlpha)
              : unselectedIconColor,
        );
      }),
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
    /// If it is not defined, FCS uses [surfaceContainerLow] color as default in
    /// both M2 and M3 mode
    ///
    /// Flutter SDK default uses [surfaceContainerLow] color as default in M3,
    /// and [ThemeData.canvasColor] in M2.
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

    // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
    //
    // An alternative unselected item color.
    //
    // It is used as fallback if [unselectedIconSchemeColor] is not specified,
    // before its normal default fallbacks.
    //
    // The color is typically used to provide the color created by blended or
    // tinted text theme, when it is being used by FlexColorScheme as an
    // `onSurfaceVariant` equivalent style, but a bit more primary tinted.
    //
    // FlexColorScheme passes in its `onSurfaceVariantBlendedTextStyle` when
    // a blended TextTheme is being used.
    // final Color? altUnselectedColor,

    /// Overrides the default value of [NavigationDrawer.shadowColor].
    final Color? shadowColor,

    /// Overrides the default value of [NavigationDrawer.surfaceTintColor].
    final Color? surfaceTintColor,
  }) {
    // TODO(rydmike): Drawer indicator tint effect, not supported in Flutter yet
    // See issue: https://github.com/flutter/flutter/issues/123507
    // final bool tintInteract = useTintedInteraction ?? true;

    // Get selected background color, defaults to surface.
    final Color backgroundColor = schemeColor(
      backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
      colorScheme,
    );

    // Use onSurfaceVariant as contrast for all surface colors !!
    final Color onBackGroundColorFallback = schemeColorPair(
      backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
      colorScheme,
      useOnSurfaceVariant: true,
    );

    final Color onBackgroundColor = unselectedItemSchemeColor != null
        ? schemeColor(unselectedItemSchemeColor, colorScheme)
        : onBackGroundColorFallback;

    // Selected indicator color
    final Color indicatorColor = schemeColor(
      indicatorSchemeColor ?? SchemeColor.secondaryContainer,
      colorScheme,
    );
    final Color onIndicatorColorFallback = schemeColorPair(
      indicatorSchemeColor ?? SchemeColor.secondaryContainer,
      colorScheme,
    );
    final Color onIndicatorColor = selectedItemSchemeColor != null
        ? schemeColor(selectedItemSchemeColor, colorScheme)
        : onIndicatorColorFallback;

    // Indicator size based on provided width
    final Size indicatorSize = Size(indicatorWidth ?? 336, 56);

    // TextStyle
    final TextStyle style = textStyle ?? const TextStyle();

    // TODO(rydmike): Removed interaction tint, not supported in Flutter yet.
    // See issue: https://github.com/flutter/flutter/issues/123507
    //
    // // Using these tinted overlay variables in all themes for ease of
    // // reasoning and duplication.
    // final Color overlay = backgroundColor;
    // final Color tint = indicatorColor;
    // final double factor =
    // _tintAlphaFactor(tint, colorScheme.brightness, true);

    // TODO(rydmike): Would need something like this for tinted indicator.
    // See issue: https://github.com/flutter/flutter/issues/123507
    //  This does not work due to limitations in Flutter SDK implementation.
    //  All we can get is ThemeData based themed hover, press, focus
    //  Report this limitation!

    // Color? indicatorStateColor() =>
    //     WidgetStateColor.resolveWith((Set<WidgetState> states) {
    //       if (states.contains(WidgetState.selected)) {
    //         if (states.contains(WidgetState.pressed)) {
    //           if (tintInteract) return tintedPressed(overlay, tint, factor);
    //           return indicatorColor.withAlpha(kAlphaPressed);
    //         }
    //         if (states.contains(WidgetState.hovered)) {
    //           if (tintInteract) return tintedHovered(overlay, tint, factor);
    //           return indicatorColor.withAlpha(kAlphaHovered);
    //         }
    //         if (states.contains(WidgetState.focused)) {
    //           if (tintInteract) return tintedFocused(overlay, tint, factor);
    //           return indicatorColor.withAlpha(kAlphaFocused);
    //         }
    //         return indicatorColor;
    //       }
    //
    //       if (states.contains(WidgetState.hovered)) {
    //         if (tintInteract) return tintedPressed(overlay, tint, factor);
    //         return colorScheme.primary.withAlpha(kAlphaPressed);
    //       }
    //       if (states.contains(WidgetState.hovered)) {
    //         if (tintInteract) return tintedHovered(overlay, tint, factor);
    //         return colorScheme.onSurface.withAlpha(kAlphaHovered);
    //       }
    //       if (states.contains(WidgetState.focused)) {
    //         if (tintInteract) return tintedHovered(overlay, tint, factor);
    //         return colorScheme.primary.withAlpha(kAlphaHovered);
    //       }
    //       return Colors.transparent;
    //     });

    return NavigationDrawerThemeData(
      backgroundColor: backgroundColor,
      indicatorColor: indicatorColor.withValues(alpha: indicatorOpacity ?? 1.0),
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
      labelTextStyle: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        return style.apply(
          color: states.contains(WidgetState.selected)
              ? onIndicatorColor
              : onBackgroundColor,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return IconThemeData(
          size: 24.0,
          color: states.contains(WidgetState.selected)
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
    /// The size and colors defined in any of the text size and color properties
    /// are applied as overrides on this text style.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected [NavigationRail] item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item.
    ///
    /// If not defined, defaults to 12.
    ///
    /// This is the same size as default labelMedium in the text theme.
    /// FCS uses this for both M2 and M3 mode. Flutter SDK uses 12 in M3 and
    /// 16 in M23 from its bodyLarge text theme.
    final double? selectedLabelSize,

    /// The size of the text label on unselected [NavigationRail] items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item.
    ///
    /// If not defined, defaults to 12.
    ///
    /// This is the same size as default labelMedium in the text theme.
    /// FCS uses this for both M2 and M3 mode. Flutter SDK uses 12 in M3 and
    /// 16 in M23 from its bodyLarge text theme.
    final double? unselectedLabelSize,

    /// Select which color from the theme's [ColorScheme] to use for
    /// the [NavigationRail]'s selected label text color.
    ///
    /// When undefined, if [backgroundSchemeColor] is defined, its
    /// contrasting on color will be used, if it is also undefined
    /// [SchemeColor.onSurface] will be used.
    ///
    /// Flutter M2 default is primary, M3 default is onSurface.
    final SchemeColor? selectedLabelSchemeColor,

    // TODO(rydmike): Report spec bug issue and add link
    /// Select which color from the theme's [ColorScheme] to use for
    /// the [NavigationRails]'s unselected label text color.
    ///
    /// When undefined, if [backgroundSchemeColor] is
    /// using any of the surface colors, the default on pair used will be
    /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
    /// that is the typical contrast color for surface colors.
    /// This is to make the unselected labels and icons look more muted.
    ///
    /// If other [backgroundSchemeColor] colors are used,
    /// while this value is undefined, their default contrasting onColor will
    /// be used. If the [backgroundSchemeColor] is also undefined,
    /// then this defaults to [SchemeColor.onSurfaceVariant].
    ///
    /// Flutter Material-2 default is onSurface with opacity 0.64,
    /// In Flutter version 3.24 and earlier,
    /// the Material-3 default is still also onSurface.
    /// This is a spec BUG in Flutter's Material-3 defaults, it should be
    /// onSurfaceVariant. See issue: <add new issue link here>
    final SchemeColor? unselectedLabelSchemeColor,

    // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
    //
    // An alternative unselected item color.
    //
    // It is used as fallback if [unselectedIconSchemeColor] is not specified,
    // before its normal default fallbacks.
    //
    // The color is typically used to provide the color created by blended or
    // tinted text theme, when it is being used by FlexColorScheme as an
    // `onSurfaceVariant` equivalent style, but a bit more primary tinted.
    //
    // FlexColorScheme passes in its `onSurfaceVariantBlendedTextStyle` when
    // a blended TextTheme is being used.
    // final Color? altUnselectedColor,

    /// If true, the unselected label in the [NavigationRail] use a more
    /// muted color version of the color defined by
    /// [unselectedLabelSchemeColor].
    ///
    /// The "muting" is done by using unselected [unselectedLabelSchemeColor]
    /// color and applying:
    ///
    /// .blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    ///
    /// on on it
    ///
    /// .withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to false.
    final bool? mutedUnselectedLabel,

    /// The size of the icon on selected [NavigationRail] item.
    ///
    /// If undefined, it defaults to 24.
    ///
    /// Flutter M2 and M3 defaults are 24.
    final double? selectedIconSize,

    /// The size of the icon on unselected [NavigationRail] items.
    ///
    /// If undefined, defaults to [selectedIconSize].
    final double? unselectedIconSize,

    /// Select which color from the theme's [ColorScheme] to use for
    /// the [NavigationRail]'s selected item icon color.
    ///
    /// If undefined, and [indicatorSchemeColor] is also
    /// undefined, then defaults to [SchemeColor.onSecondaryContainer].
    /// If undefined, but [indicatorSchemeColor] is defined, then
    /// it defaults to the contrast onColor pair of the indicator color
    /// [indicatorSchemeColor]
    ///
    /// Flutter Material-2 default is primary, Material-3 default is
    /// onSecondaryContainer.
    final SchemeColor? selectedIconSchemeColor,

    /// Select which color from the passed in [ColorScheme] to use for
    /// the [NavigationRail]'s unselected items icon color.
    ///
    /// When undefined, if [backgroundSchemeColor] is
    /// using any of the surface colors, the default on pair used will be
    /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
    /// that is the typical contrast color for surface colors.
    /// This is to make the unselected labels and icons look more muted.
    ///
    /// If other [backgroundSchemeColor] colors are used,
    /// while this value is undefined, their default contrasting onColor will
    /// be used. If the [backgroundSchemeColor] is also undefined,
    /// then this defaults to [SchemeColor.onSurfaceVariant].
    ///
    /// Flutter's Material-2 default is onSurface and in Material-3 it is
    /// onSurfaceVariant.
    final SchemeColor? unselectedIconSchemeColor,

    /// If true, the unselected icon in the [NavigationRail] use a more muted
    /// color version of the color defined by [unselectedIconSchemeColor].
    ///
    /// The "muting" is done by using unselected [unselectedIconSchemeColor]
    /// color and applying:
    ///
    /// .blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    ///
    /// on on it
    ///
    /// .withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to false.
    final bool? mutedUnselectedIcon,

    /// Whether or not the selected [NavigationRail] item should include a
    /// [NavigationIndicator].
    ///
    /// If `true`, adds a rounded [NavigationIndicator] behind the selected
    /// destination's icon.
    ///
    /// Defaults to true.
    ///
    /// In Flutter defaults, the default is true in M3 and false in M2.
    final bool? useIndicator,

    /// Select which color from the theme [ColorScheme] to use as base for
    /// the selected [NavigationRails]'s highlighted item.
    ///
    /// If undefined, defaults to [SchemeColor.secondaryContainer].
    ///
    /// Flutter defaults to secondary in M2 and to secondaryContainer in M3.
    final SchemeColor? indicatorSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use as background
    /// color for the [NavigationRail].
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.surface].
    final SchemeColor? backgroundSchemeColor,

    /// NavigationRail background opacity.
    ///
    /// If undefined, defaults to 1, fully opaque.
    final double? opacity,

    /// [NavigationRail] elevation.
    ///
    /// If undefined, defaults to [kNavigationRailElevation] = 0.
    ///
    /// Elevation 0 is default for Flutter SDK in both M2 and M3 mode as well.
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
    /// If null, then the default behavior is [NavigationRailLabelType.none].
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

    /// Overrides the default value of [NavigationRail]'s minimum width when it
    /// is not extended.
    ///
    /// If not defined, defaults to M3 spec default value 80 dp.
    ///
    /// Flutter SDK uses 72 in M2 mode and 80 dp in M3 mode.
    final double? minWidth,

    /// Overrides the default value of [NavigationRail]'s minimum width when it
    /// is extended.
    ///
    /// If not defined, defaults to M3 spec default value 256 dp.
    ///
    /// Flutter M2 and M3 use 256 dp as default.
    final double? minExtendedWidth,

    /// A temporary flag used to disable Material-3 design and use legacy
    /// Material-2 design instead. Material-3 design is the default.
    /// Material-2 will be deprecated in Flutter.
    ///
    /// The M2/M3 SDK defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to true.
    @Deprecated(
      'The useMaterial3 flag no longer has any function in this '
      'component theme and is deprecated. It will be removed in v9.',
    )
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
    /// ```text
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
    /// [FlexSubThemesData.navigationRailMutedUnselectedIcon] and
    /// are [FlexSubThemesData.navigationRailMutedUnselectedLabel] true
    /// respectively, this also applies to undefined color inputs.
    ///
    /// If you want a style that is consistent by default across
    /// [BottomNavigationBar], [NavigationBar] and [NavigationRail],
    /// prefer keeping this setting false.
    ///
    /// Defaults to null.
    @Deprecated(
      'The `useFlutterDefaults` is deprecated, it no longer has any '
      'function and will be removed in v9. FlexColorScheme in M3 mode '
      'defaults to using mostly Flutter defaults styles. '
      'For other configurations modify the theme as desired. '
      'In M2 mode FCS will continue to use its own opinionated defaults for '
      'as long as M2 exists.',
    )
    final bool? useFlutterDefaults,
  }) {
    // Background color, falls back to surface.
    final Color backgroundColor = (opacity ?? 1.0) != 1.0 &&
            backgroundSchemeColor != SchemeColor.transparent
        ? schemeColor(
            backgroundSchemeColor ?? SchemeColor.surface,
            colorScheme,
          ).withValues(alpha: opacity ?? 1.0)
        : schemeColor(
            backgroundSchemeColor ?? SchemeColor.surface,
            colorScheme,
          );

    // Use onSurface as contrast for all selected on surface label colors !!
    final Color onBackGroundColorFallback = schemeColorPair(
      backgroundSchemeColor ?? SchemeColor.surface,
      colorScheme,
    );

    // Use onSurfaceVariant as contrast for all unselected on surface colors !!
    final Color onVariantBackGroundColorFallback = schemeColorPair(
      backgroundSchemeColor ?? SchemeColor.surfaceContainerLow,
      colorScheme,
      useOnSurfaceVariant: true,
    );

    // Get text color, defaults to onSurface.
    final Color labelColor = selectedLabelSchemeColor == null
        ? onBackGroundColorFallback
        : schemeColor(selectedLabelSchemeColor, colorScheme);

    // Get unselected label color, defaults to onSurfaceVariant.
    final Color unselectedLabelColor = unselectedLabelSchemeColor == null
        ? onVariantBackGroundColorFallback
        : schemeColor(unselectedLabelSchemeColor, colorScheme);

    // Get text style, defaults to TextStyle(), we can use it since
    // size and color are applied to is separately.
    final TextStyle textStyle = labelTextStyle ?? const TextStyle();

    // Get effective text sizes.
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 12;
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? labelSize;

    // Use color pair for indicator, as contrast for selected icon color.
    final Color onIndicatorColorFallback = schemeColorPair(
      indicatorSchemeColor ?? SchemeColor.secondaryContainer,
      colorScheme,
    );

    // Get icon color, defaults to onSecondaryContainer.
    final Color iconColor = selectedIconSchemeColor == null
        ? onIndicatorColorFallback
        : schemeColor(selectedIconSchemeColor, colorScheme);

    // Get unselected icon color, defaults to onSurfaceVariant.
    final Color unselectedIconColor = unselectedIconSchemeColor == null
        ? onVariantBackGroundColorFallback
        : schemeColor(unselectedIconSchemeColor, colorScheme);

    // Get effective icons sizes.
    final double iconSize = selectedIconSize ?? 24;
    final double effectiveUnselectedIconSize = unselectedIconSize ?? iconSize;

    // Effective indicator color.
    final Color effectiveIndicatorColor = schemeColor(
      indicatorSchemeColor ?? SchemeColor.secondaryContainer,
      colorScheme,
    ).withAlpha(indicatorAlpha ?? 0xFF);

    // Property order here as in NavigationRailThemeData
    return NavigationRailThemeData(
      backgroundColor: backgroundColor,
      elevation: elevation ?? kNavigationRailElevation,
      unselectedLabelTextStyle: textStyle.copyWith(
        fontSize: effectiveUnselectedLabelSize,
        color: (mutedUnselectedLabel ?? false)
            ? unselectedLabelColor
                .blendAlpha(unselectedLabelColor, unselectedAlphaBlend)
                .withAlpha(unselectedAlpha)
            : unselectedLabelColor,
      ),
      selectedLabelTextStyle: textStyle.copyWith(
        fontSize: labelSize,
        color: labelColor,
      ),
      unselectedIconTheme: IconThemeData(
        size: effectiveUnselectedIconSize,
        opacity: 1,
        color: (mutedUnselectedIcon ?? false)
            ? unselectedIconColor
                .blendAlpha(unselectedIconColor, unselectedAlphaBlend)
                .withAlpha(unselectedAlpha)
            : unselectedIconColor,
      ),
      selectedIconTheme: IconThemeData(
        size: iconSize,
        opacity: 1,
        color: iconColor,
      ),
      groupAlignment: groupAlignment,
      labelType: labelType,
      minWidth: minWidth,
      minExtendedWidth: minExtendedWidth,
      useIndicator: useIndicator ?? true,
      indicatorColor: effectiveIndicatorColor,
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
    /// If not defined, defaults to [kButtonRadius] 40dp in M2. When using
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
    /// If null, defaults to [kButtonMinSize] (`const Size(40.0, 40.0)`) when
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

    /// Creates the [InkWell] splash factory, which defines the appearance of
    /// "ink" splashes that occur in response to taps.
    ///
    /// In M2 mode FlexColorScheme passes in the effective splashFactory
    /// from splashFactory override value or the result from
    /// [FlexSubThemesData] adaptive splash settings. In M3 mode it is kept
    /// null and the default comes via ThemeData.splashFactory, that is has
    /// also defined.
    final InteractiveInkFeatureFactory? splashFactory,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,

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
    final Color baseColor = schemeColor(
      baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Outline color logic with different M2 and M3 defaults.
    final Color outlineColor = outlineSchemeColor == null
        ? useM3
            ? schemeColor(SchemeColor.outline, colorScheme)
            : baseColor
        : schemeColor(outlineSchemeColor, colorScheme);

    // Using these tinted overlay variables in all themes for ease of
    // reasoning and duplication.
    final Color overlay = colorScheme.surface;
    final Color tint = baseColor;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness);

    // Default outline widths.
    final double normalWidth = outlineWidth ?? kThinBorderWidth;
    final double pressedWidth =
        pressedOutlineWidth ?? (useM3 ? kThinBorderWidth : kThickBorderWidth);

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
            return tintedDisable(colorScheme.onSurface, baseColor);
          }
          return colorScheme.onSurface.withValues(alpha: kAlphaDisabledFloat);
        }
        return baseColor;
      });

      overlayColor = WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          if (tintInteract) return tintedHovered(overlay, tint, factor);
          return baseColor.withValues(alpha: kAlphaHoveredFloat);
        }
        if (states.contains(WidgetState.focused)) {
          if (tintInteract) return tintedFocused(overlay, tint, factor);
          return baseColor.withValues(alpha: kAlphaFocusedFloat);
        }
        if (states.contains(WidgetState.pressed)) {
          if (tintInteract) return tintedPressed(overlay, tint, factor);
          return baseColor.withValues(alpha: kAlphaPressedFloat);
        }
        return null;
      });
    }

    // Define side if its widths or color has any custom definition, if not
    // we fall back to default theme.
    WidgetStateProperty<BorderSide?>? side;
    if (outlineSchemeColor != null ||
        outlineWidth != null ||
        pressedOutlineWidth != null ||
        tintDisable ||
        !useM3) {
      side = WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return BorderSide(
              color: tintedDisable(
                colorScheme.onSurface,
                outlineColor,
              ).withValues(alpha: kAlphaLowDisabledFloat),
              width: normalWidth,
            );
          }
          return BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: kAlphaVeryLowDisabledFloat,
            ),
            width: normalWidth,
          );
        }
        if (states.contains(WidgetState.error)) {
          return BorderSide(color: colorScheme.error, width: pressedWidth);
        }
        if (states.contains(WidgetState.pressed)) {
          return BorderSide(color: outlineColor, width: pressedWidth);
        }
        return BorderSide(color: outlineColor, width: normalWidth);
      });
    }

    return OutlinedButtonThemeData(
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
        side: side,
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

  /// An opinionated [PopupMenuThemeData] with custom corner radius.
  ///
  /// When used by [FlexColorScheme] the corner radius of popup menus follows
  /// the global [FlexSubThemesData.defaultRadius] if defined, until and
  /// including 10 dp. After which it stays at 10 dp. If you need a higher
  /// corner radius on popup menus than 10 dp, with [FlexColorScheme]
  /// you will have to explicitly override
  /// [FlexSubThemesData.popupMenuRadius].
  ///
  /// It will not look very good when it is
  /// over 10dp. The highlight inside the menu will start to overflow the
  /// corners and is not clipped along the border radius. The underlying Widget
  /// is not designed with this high border rounding in mind. This makes sense
  /// since it does not look good with too much rounding on a small menu.
  ///
  /// The built-in behavior in FlexColorScheme allows it to match at low
  /// inherited radius values from [FlexSubThemesData.defaultRadius] but to
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
    /// - [useMaterial3] = false : default theme.cardColor.
    /// - [useMaterial3] = true  : default theme.colorScheme.surfaceContainer.
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
    /// - [useMaterial3] = false : defaults theme.cardColor.
    /// - [useMaterial3] = true  : defaults theme.colorScheme.surfaceContainer.
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
    // and to theme.cardColor in M2, typically they are the same.
    final Color? backgroundColor = color ??
        (colorScheme != null && backgroundSchemeColor != null
            ? schemeColor(backgroundSchemeColor, colorScheme)
            : null);
    final Color? onBackgroundColor = colorScheme != null &&
            backgroundSchemeColor != null
        ? schemeColorPair(backgroundSchemeColor, colorScheme)
        : color != null
            ? ThemeData.estimateBrightnessForColor(color) == Brightness.light
                ? Colors.black
                : Colors.white
            : null;

    final Color? foregroundColor =
        colorScheme != null && foregroundSchemeColor != null
            ? schemeColor(foregroundSchemeColor, colorScheme)
            : onBackgroundColor;

    final bool inputsNull =
        color == null && backgroundColor == null && foregroundColor == null;

    final TextStyle? effectiveTextStyle =
        inputsNull ? null : textStyle ?? const TextStyle();

    return PopupMenuThemeData(
      elevation: elevation,
      color: backgroundColor,
      surfaceTintColor: surfaceTintColor,
      textStyle: effectiveTextStyle?.apply(color: foregroundColor),
      labelTextStyle: effectiveTextStyle != null
          ? WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return effectiveTextStyle.apply(
                  color: foregroundColor?.withAlpha(kAlphaDisabled),
                );
              }
              return effectiveTextStyle.apply(color: foregroundColor);
            })
          : null,
      shape: radius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            )
          : null,
    );
  }

  /// An opinionated [RadioThemeData] theme.
  ///
  /// Requires a [ColorScheme] in [colorScheme]. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The splashRadius is not used by FlexColorScheme sub-themes.
  static RadioThemeData radioTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// Selects which color from the passed in colorScheme to use as the main
    /// color for the radio button.
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
    final bool unselectedColored = unselectedIsColored ?? false;
    final bool tintInteract = useTintedInteraction ?? false;
    final bool tintDisable = useTintedDisable ?? false;

    // Get selected color, defaults to primary.
    final Color baseColor = schemeColor(
      baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );
    final bool isLight = colorScheme.brightness == Brightness.light;

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = colorScheme.surface;
    final Color tint = baseColor;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness, true);

    return RadioThemeData(
      splashRadius: splashRadius,
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (useM3) {
          if (states.contains(WidgetState.selected)) {
            if (states.contains(WidgetState.disabled)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return colorScheme.onSurface.withAlpha(kAlphaDisabled);
            }
            if (states.contains(WidgetState.pressed)) {
              return baseColor;
            }
            if (states.contains(WidgetState.hovered)) {
              return baseColor;
            }
            if (states.contains(WidgetState.focused)) {
              return baseColor;
            }
            return baseColor;
          }
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return tintedDisable(colorScheme.onSurface, baseColor);
            }
            return colorScheme.onSurface.withAlpha(kAlphaDisabled);
          }
          if (states.contains(WidgetState.pressed)) {
            if (unselectedColored) return baseColor.withAlpha(kAlphaUnselect);
            return colorScheme.onSurface;
          }
          if (states.contains(WidgetState.hovered)) {
            if (unselectedColored) return baseColor.withAlpha(kAlphaUnselect);
            return colorScheme.onSurface;
          }
          if (states.contains(WidgetState.focused)) {
            if (unselectedColored) return baseColor.withAlpha(kAlphaUnselect);
            return colorScheme.onSurface;
          }
          if (unselectedColored) return baseColor.withAlpha(kAlphaUnselect);
          return colorScheme.onSurfaceVariant;
        } else {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return tintedDisable(colorScheme.onSurface, baseColor);
            }
            return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
          }
          if (states.contains(WidgetState.selected)) {
            return baseColor;
          }
          if (unselectedColored) {
            return baseColor.withAlpha(kAlphaUnselect);
          }
          // This is SDK default.
          return isLight ? Colors.black54 : Colors.white70;
        }
      }),
      overlayColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) return tintedPressed(overlay, tint, factor);
            return colorScheme.onSurface.withAlpha(kAlphaPressed);
          }
          if (states.contains(WidgetState.hovered)) {
            if (tintInteract) return tintedHovered(overlay, tint, factor);
            return baseColor.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) return tintedFocused(overlay, tint, factor);
            return baseColor.withAlpha(kAlphaFocused);
          }
          return Colors.transparent;
        }
        if (states.contains(WidgetState.pressed)) {
          if (tintInteract) return tintedPressed(overlay, tint, factor);
          return baseColor.withAlpha(kAlphaPressed);
        }
        if (states.contains(WidgetState.hovered)) {
          if (tintInteract) return tintedHovered(overlay, tint, factor);
          return colorScheme.onSurface.withAlpha(kAlphaHovered);
        }
        if (states.contains(WidgetState.focused)) {
          if (tintInteract) return tintedFocused(overlay, tint, factor);
          return colorScheme.onSurface.withAlpha(kAlphaFocused);
        }
        return Colors.transparent;
      }),
    );
  }

  /// An opinionated [SearchBarThemeData] theme for the [SearchBar].
  static SearchBarThemeData searchBarTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// The search bar's background fill color.
    ///
    /// If null, the default value is `surfaceContainerHigh`.
    final SchemeColor? backgroundSchemeColor,

    /// The elevation of the search bar's [Material].
    ///
    /// If null, default value is 6.0.
    final double? elevation,

    /// The shadow color of the search bar's [Material].
    ///
    /// If null, the default value is [ColorScheme.shadow].
    final Color? shadowColor,

    /// The border radius of the search bar's underlying [Material].
    ///
    /// If not defined defaults to Stadium shape.
    final double? radius,

    // TODO(rydmike): Doing just a radius for now. Shapes later
    // The color and weight of the search bar's outline.
    //
    // This value is combined with [shape] to create a shape decorated
    // with an outline.
    //
    // If null, the search bar doesn't have a side by default.
    // final WidgetStateProperty<BorderSide?>? side,
    //
    // The shape of the search bar's underlying [Material].
    //
    // This shape is combined with [side] to create a shape decorated
    // with an outline.
    //
    // If null, defaults to [StadiumBorder].
    // final WidgetStateProperty<OutlinedBorder?>? shape,

    /// The padding between the search bar's boundary and its contents.
    ///
    /// If null, then the default value is 16.0 horizontally.
    final EdgeInsetsGeometry? padding,

    /// The style to use for the text being edited.
    ///
    /// If null, defaults to the `bodyLarge` text style from the current
    /// [Theme]. The default text color is [ColorScheme.onSurface].
    final WidgetStateProperty<TextStyle?>? textStyle,

    /// The style to use for the [hintText].
    ///
    /// If null, defaults to `bodyLarge` text style from the current [Theme].
    /// The default text color is [ColorScheme.onSurfaceVariant].
    final WidgetStateProperty<TextStyle?>? hintStyle,

    /// Optional size constraints for the search bar.
    ///
    /// If null, the value of [SearchBarThemeData.constraints] will be used. If
    /// this is also null, then the constraints defaults to:
    ///
    /// ```dart
    /// const BoxConstraints(minWidth: 360.0, maxWidth: 800.0, minHeight: 56.0)
    /// ```
    final BoxConstraints? constraints,

    /// Configures how the platform keyboard will select an uppercase or
    /// lowercase keyboard.
    ///
    /// Only supports text keyboards, other keyboard types will ignore this
    /// configuration. Capitalization is locale-aware.
    ///
    /// If not defined, defaults to [TextCapitalization.none]
    TextCapitalization? textCapitalization,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? tintedInteractions,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? tintedDisabled,
  }) {
    final bool tintInteract = tintedInteractions ?? false;
    final bool tintDisable = tintedDisabled ?? false;

    // Get selected color, defaults to primary.
    final Color backgroundColor = schemeColor(
      backgroundSchemeColor ?? SchemeColor.surfaceContainerHigh,
      colorScheme,
    );
    final Color onBackgroundColor = schemeColorPair(
      backgroundSchemeColor ?? SchemeColor.surfaceContainerHigh,
      colorScheme,
    );

    // The logic below is used to give a nice tinted interaction and disable
    // color regardless of how we customize the foreground and background
    // of the search bar.
    final bool isLight = colorScheme.brightness == Brightness.light;
    // Get brightness of the SearchBar background color.
    final bool buttonBgIsLight =
        ThemeData.estimateBrightnessForColor(backgroundColor) ==
            Brightness.light;
    // For tint color use the one that is more likely to give a colored effect.
    final Color tint = isLight
        ? buttonBgIsLight
            ? onBackgroundColor
            : backgroundColor
        : buttonBgIsLight
            ? backgroundColor
            : onBackgroundColor;
    // The reverse color is used for overlay
    final Color overlay = isLight
        ? buttonBgIsLight
            ? backgroundColor
            : onBackgroundColor
        : buttonBgIsLight
            ? onBackgroundColor
            : backgroundColor;
    // We use surface mode tint factor, if it is light theme and background
    // is light OR if it is a dark theme and background is dark.
    final bool surfaceMode =
        (isLight && buttonBgIsLight) || (!isLight && !buttonBgIsLight);
    final double factor = _tintAlphaFactor(
      tint,
      colorScheme.brightness,
      surfaceMode,
    );

    return SearchBarThemeData(
      backgroundColor: backgroundSchemeColor != null
          ? WidgetStatePropertyAll<Color?>(backgroundColor)
          : null,
      elevation: WidgetStatePropertyAll<double?>(elevation),
      shadowColor: WidgetStatePropertyAll<Color?>(shadowColor),
      shape: radius != null
          ? WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
            )
          : null,
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(padding),
      textStyle: textStyle,
      hintStyle: hintStyle,
      constraints: constraints,
      overlayColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        // TODO(rydmike): There is no disabled SearchBar, but there should be.
        // Maybe raise an issue about it, might be one already.
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return tintedDisable(
              colorScheme.onSurface,
              backgroundColor,
            ).withAlpha(kAlphaUltraLowDisabled);
          }
          return colorScheme.onSurface.withAlpha(kAlphaUltraLowDisabled);
        }
        if (states.contains(WidgetState.pressed)) {
          if (tintInteract) {
            return tintedPressed(backgroundColor, tint, factor);
          }
          return colorScheme.onSurface.withAlpha(kAlphaInputPressed);
        }
        if (states.contains(WidgetState.hovered)) {
          if (tintInteract) return tintedHovered(overlay, tint, factor);
          return colorScheme.onSurface.withAlpha(kAlphaHovered);
        }
        return Colors.transparent;
      }),
      textCapitalization: textCapitalization,
    );
  }

  /// An opinionated [SearchViewThemeData] theme for the [SearchBar]'s view.
  static SearchViewThemeData searchViewTheme({
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
    final Color backgroundColor = schemeColor(
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
    /// If not defined, secondaryContainer will be used.
    final SchemeColor? selectedSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the
    /// foreground color for the selected [SegmentedButton].
    ///
    /// If not defined, contrast color pair to [selectedSchemeColor]
    /// will be used.
    final SchemeColor? selectedForegroundSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the
    /// background color for unselected segmented button.
    ///
    /// If not defined, transparent will be used.
    final SchemeColor? unselectedSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the
    /// foreground color for unselected segmented button.
    ///
    /// If not defined, contrast color pair to [unselectedSchemeColor]
    /// will be used, for transparent it is onSurface.
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

    /// Padding for the individual segment buttons.
    ///
    /// Defaults to null and uses M3's default scaled padding function.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// If null, defaults to [kButtonMinSize] (`const Size(40.0, 40.0)`) when
    /// [useMaterial3] is false and to `const Size(64.0, 40.0)` when
    /// [useMaterial3] is true, via M3 built in defaults.
    final Size? minButtonSize,

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

    /// The style for the segmented button's [Text] widget descendants.
    ///
    /// The color of the [textStyle] is typically not used directly, the
    /// [selectedSchemeColor] and [unselectedForegroundSchemeColor] are
    /// used instead.
    final WidgetStateProperty<TextStyle?>? textStyle,

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
    // We are using a light colorScheme.
    final bool isLight = colorScheme.brightness == Brightness.light;

    // Get selected background color, defaults to secondaryContainer.
    final SchemeColor selectedScheme = selectedSchemeColor ??
        (useM3 ? SchemeColor.secondaryContainer : SchemeColor.primary);
    final Color selectedColor = schemeColor(selectedScheme, colorScheme);

    final Color onSelectedColor = selectedForegroundSchemeColor != null
        ? schemeColor(selectedForegroundSchemeColor, colorScheme)
        : schemeColorPair(selectedScheme, colorScheme);

    final Color unselectedColor = schemeColor(
      unselectedSchemeColor ?? SchemeColor.surface,
      colorScheme,
    );
    final Color onUnselectedColor = schemeColor(
      unselectedForegroundSchemeColor ??
          onSchemeColor(unselectedSchemeColor ?? SchemeColor.surface),
      colorScheme,
    );

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = onSelectedColor;
    final Color tint = selectedColor;
    // Get brightness of selectedColor color.
    final bool selectedBgIsLight =
        ThemeData.estimateBrightnessForColor(selectedColor) == Brightness.light;
    // We use surface mode tint factor, if it is light theme and selectedColor
    // is light OR if it is a dark theme and background is dark.
    final bool selectedSurfaceMode =
        (isLight && selectedBgIsLight) || (!isLight && !selectedBgIsLight);
    final double factor = _tintAlphaFactor(
      tint,
      colorScheme.brightness,
      selectedSurfaceMode,
    );

    final Color unOverlay = unselectedColor;
    final Color unTint = unselectedSchemeColor == null ||
            unselectedSchemeColor == SchemeColor.surface
        ? selectedColor
        : onUnselectedColor;
    // Get brightness of unselectedColor color.
    final bool unSelectedBgIsLight =
        ThemeData.estimateBrightnessForColor(unselectedColor) ==
            Brightness.light;
    // We use surface mode tint factor, if it is light theme and unselectedColor
    // is light OR if it is a dark theme and background is dark.
    final bool unSelectedSurfaceMode =
        (isLight && unSelectedBgIsLight) || (!isLight && !unSelectedBgIsLight);
    final double unFactor = _tintAlphaFactor(
      unTint,
      colorScheme.brightness,
      unSelectedSurfaceMode,
    );

    final Color disableTint = unselectedSchemeColor == null ||
            unselectedSchemeColor == SchemeColor.surface
        ? selectedColor
        : onUnselectedColor;

    final Color borderColor = schemeColor(
      borderSchemeColor ?? (useM3 ? SchemeColor.outline : SchemeColor.primary),
      colorScheme,
    );
    // Effective border width.
    final double effectiveWidth = borderWidth ?? kThinBorderWidth;

    final Color disableBorderTint = (borderSchemeColor == null && useM3) ||
            unselectedSchemeColor == SchemeColor.outline
        ? selectedColor
        : borderColor;

    final Color disabledForeground = unselectedSchemeColor == null
        ? colorScheme.onSurface
        : onUnselectedColor;

    final WidgetStateProperty<Color> foregroundColor =
        WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (tintDisable) {
          return tintedDisable(disabledForeground, disableTint);
        }
        return disabledForeground.withAlpha(kAlphaDisabled);
      }
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          return onSelectedColor;
        }
        if (states.contains(WidgetState.hovered)) {
          return onSelectedColor;
        }
        if (states.contains(WidgetState.focused)) {
          return onSelectedColor;
        }
        return onSelectedColor;
      } else {
        return onUnselectedColor;
      }
    });

    return SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: textStyle,
        splashFactory: splashFactory,
        // TODO(rydmike): Issue, minimumSize property does nothing.
        // https://github.com/flutter/flutter/issues/121493
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          minButtonSize ?? (useM3 ? null : kButtonMinSize),
        ),
        padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
        backgroundColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return unselectedSchemeColor == null ? null : unselectedColor;
          }
          if (states.contains(WidgetState.selected)) {
            return selectedColor;
          }
          return unselectedSchemeColor == null ? null : unselectedColor;
        }),
        foregroundColor: foregroundColor,
        iconColor: foregroundColor,
        // TODO(Rydmike): Issue: Flutter SDK SegmentedButton overlayColor bug.
        // https://github.com/flutter/flutter/issues/123308
        // SegmentedButton triggers overlay 3 times in Selected mode, 1st
        // time it is selected, next time it is no longer selected,
        // even it if actually is. This results is that we never see the
        // selected overlay state. It is also triggered 3 times when not
        // selected, but there we get the unselected mode all times, so
        // it is not noticed, still one call would be enough.
        overlayColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          // This nicer overlay for selected overlay never gets seen due
          // to above mentioned Flutter SDK bug. But if it is ever fixed it
          // will get used automatically, via code below.
          if (states.contains(WidgetState.selected)) {
            if (states.contains(WidgetState.hovered)) {
              if (tintInteract) return tintedHovered(overlay, tint, factor);
              return unselectedColor.withAlpha(kAlphaHovered);
            }
            if (states.contains(WidgetState.focused)) {
              if (tintInteract) return tintedFocused(overlay, tint, factor);
              return unselectedColor.withAlpha(kAlphaFocused);
            }
            if (states.contains(WidgetState.pressed)) {
              if (tintInteract) return tintedPressed(overlay, tint, factor);
              return unselectedColor.withAlpha(kAlphaPressed);
            }
          } else {
            if (states.contains(WidgetState.hovered)) {
              if (tintInteract) {
                return tintedHovered(unOverlay, unTint, unFactor);
              }
              return unselectedSchemeColor == null
                  ? colorScheme.onSurface.withAlpha(kAlphaHovered)
                  : onUnselectedColor.withAlpha(kAlphaHovered);
            }
            if (states.contains(WidgetState.focused)) {
              if (tintInteract) {
                return tintedFocused(unOverlay, unTint, unFactor);
              }
              return unselectedSchemeColor == null
                  ? colorScheme.onSurface.withAlpha(kAlphaFocused)
                  : onUnselectedColor.withAlpha(kAlphaFocused);
            }
            if (states.contains(WidgetState.pressed)) {
              if (tintInteract) {
                return tintedPressed(unOverlay, unTint, unFactor);
              }
              return unselectedSchemeColor == null
                  ? colorScheme.onSurface.withAlpha(kAlphaPressed)
                  : onUnselectedColor.withAlpha(kAlphaPressed);
            }
          }
          return null;
        }),
        side: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return BorderSide(
                color: tintedDisable(
                  colorScheme.onSurface,
                  disableBorderTint,
                ).withAlpha(kAlphaLowDisabled),
                width: effectiveWidth,
              );
            }
            return BorderSide(
              color: colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
              width: effectiveWidth,
            );
          }
          return BorderSide(color: borderColor, width: effectiveWidth);
        }),
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

  /// An opinionated [SliderThemeData] theme for the [Slider].
  ///
  /// Requires a [ColorScheme] in [colorScheme]. The color scheme would
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

    /// Selects which color from the passed in colorScheme to use as the thumb
    /// color for the Slider.
    ///
    /// If not defined, [baseSchemeColor] will be used.
    final SchemeColor? thumbSchemeColor,

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

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,

    /// Overrides the default value of [Slider.year2023].
    ///
    /// When true, the [Slider] will use the 2023 Material Design 3 appearance.
    ///
    /// If this is set to false, the [Slider] will use the latest Material-3
    /// appearance, which was introduced in December 2023.
    ///
    /// If undefined, defaults to true, via Flutter SDK default behavior.
    /// If [useMaterial3] is false, then this property is ignored.
    final bool? useOldM3Design,

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
    final Color baseColor = schemeColor(
      baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );
    final Color onBaseColor = schemeColorPair(
      baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    final Color thumbColor = schemeColor(
      thumbSchemeColor ?? baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = colorScheme.surface;
    final Color tint = baseColor;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness, true);

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

    Color? overlayColor() =>
        WidgetStateColor.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            if (tintInteract) return tintedHovered(overlay, tint, factor);
            return thumbColor.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) return tintedFocused(overlay, tint, factor);
            return thumbColor.withAlpha(kAlphaFocused);
          }
          if (states.contains(WidgetState.dragged)) {
            if (tintInteract) return tintedFocused(overlay, tint, factor);
            return thumbColor.withAlpha(kAlphaFocused);
          }
          return Colors.transparent;
        });

    final SliderComponentShape indicatorShape = effectiveIndicatorShape();

    // TODO(rydmike): Fidelity review of M3 theme for Slider.
    return SliderThemeData(
      // The year2023 property is directly deprecated in Flutter SDK, this is
      // a test to see if we can ignore that it is deprecated and not get a
      // package score penalty, when we use it to access this new feature.
      //
      // ignore: deprecated_member_use
      year2023: useOldM3Design,
      trackHeight: trackHeight,
      activeTrackColor: baseColor,
      inactiveTrackColor: baseColor.withAlpha(kAlphaLowDisabled),
      // TODO(rydmike): Add secondaryActiveTrackColor
      //
      disabledActiveTrackColor: tintDisable
          ? tintedDisable(colorScheme.onSurface, baseColor)
          : colorScheme.onSurface.withAlpha(kAlphaMediumDisabled),
      disabledInactiveTrackColor: colorScheme.onSurface.withAlpha(
        kAlphaVeryLowDisabled,
      ),
      // TODO(rydmike): Add disabledSecondaryActiveTrackColor
      //
      activeTickMarkColor: onBaseColor.withAlpha(kAlphaSliderTickMark),
      inactiveTickMarkColor: baseColor.withAlpha(kAlphaSliderTickMark),
      disabledActiveTickMarkColor: onBaseColor.withAlpha(kAlphaVeryLowDisabled),
      disabledInactiveTickMarkColor: colorScheme.onSurface.withAlpha(
        kAlphaVeryLowDisabled,
      ),
      //
      thumbColor: thumbColor,
      disabledThumbColor: tintDisable
          ? Color.alphaBlend(
              tintedDisable(colorScheme.onSurface, baseColor),
              colorScheme.surface,
            )
          : Color.alphaBlend(
              colorScheme.onSurface.withAlpha(kAlphaDisabled),
              colorScheme.surface,
            ),
      overlayColor: overlayColor(),
      //
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

    /// Used to configure the [DefaultTextStyle] for the [SnackBar.content]
    /// widget.
    ///
    /// If null, [SnackBar] defines its default using titleMedium
    final TextStyle? contentTextStyle,
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
            actionTextSchemeColor ?? SchemeColor.inversePrimary,
            colorScheme,
          )
        : null;

    final TextStyle? snackTextStyle = foreground != null
        ? contentTextStyle == null
            ? ThemeData(
                brightness: Brightness.light,
              ).textTheme.titleMedium!.copyWith(color: foreground)
            : contentTextStyle.copyWith(color: foreground)
        : contentTextStyle;

    return SnackBarThemeData(
      elevation: elevation ?? kSnackBarElevation,
      shape: radius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            )
          : null,
      backgroundColor: background,
      contentTextStyle: snackTextStyle,
      actionTextColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
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
  /// Requires a [ColorScheme] in [colorScheme]. The color scheme would
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

    /// Set to true to keep the [Switch] thumb size fixed.
    ///
    /// When true the [Switch] thumb size does not change from small size when
    /// OFF, to a larger size when ON. This makes the Material-3 Switch even
    /// more similar to the iOS style Switch.
    ///
    /// This setting only applies to the Material-3 mode, it has no effect in
    /// Material-2 mode.
    ///
    /// If undefined, defaults to false.
    final bool? thumbFixedSize,

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

    /// Defines if the theme uses Cupertino style switch.
    ///
    /// This option only works when [useMaterial3] is true. If it is false
    /// the setting has no impact.
    ///
    /// When used the Switch will be styled like a CupertinoSwitch, but with
    /// the colors defined by [baseSchemeColor]. The themed Switch is not
    /// an exact match for the CupertinoSwitch, but as close as you can
    /// get with the Material Switch theming features.
    ///
    /// If undefined, defaults to false.
    final bool? useCupertinoStyle,

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

    // Currently only supporting normal contrast color for the mock
    // adaptive Material themed like iOS Switch. We would need a context
    // passed in to get hih contrast and elevated to resolve those colors.
    const CupertinoDynamicColor cup = CupertinoColors.secondarySystemFill;

    // Get colorScheme brightness.
    final bool isLight = colorScheme.brightness == Brightness.light;
    // Get selected base color, and its pair, defaults to primary and onPrimary.
    final Color baseColor = schemeColor(
      baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    final Color onBaseColor = schemeColorPair(
      baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    final bool unselectedColored = unselectedIsColored ?? false;
    final bool tintInteract = useTintedInteraction ?? false;
    final bool tintDisable = useTintedDisable ?? false;

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = colorScheme.surface;
    final Color tint = baseColor;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness, true);

    // Get selected thumb color, and its pair, defaults to
    // M2: primary and onPrimary.
    // M3: primaryContainer and onPrimaryContainer
    final Color thumbColor = schemeColor(
      thumbSchemeColor ??
          (useM3
              ? SchemeColor.primaryContainer
              : baseSchemeColor ?? SchemeColor.primary),
      colorScheme,
    );

    // Material-2 mode theming.
    if (!useM3) {
      return SwitchThemeData(
        splashRadius: splashRadius,
        thumbColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (states.contains(WidgetState.selected)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
            }
            if (tintDisable) {
              return tintedDisable(
                colorScheme.onSurface,
                baseColor,
              ).withAlpha(kAlphaLowDisabled);
            }
            return isLight ? Colors.grey.shade400 : Colors.grey.shade800;
          }
          if (states.contains(WidgetState.selected)) {
            return thumbColor;
          }
          return isLight ? Colors.grey.shade50 : Colors.grey.shade400;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            if (tintDisable) {
              return tintedDisable(
                colorScheme.onSurface,
                baseColor,
              ).withAlpha(kAlphaVeryLowDisabled);
            }
            return isLight ? Colors.black12 : Colors.white10;
          }
          if (states.contains(WidgetState.selected)) {
            return baseColor.withAlpha(
              isLight ? kAlphaM2SwitchTrackLight : kAlphaM2SwitchTrackDark,
            );
          }
          // Custom themed color on track when not selected
          if (unselectedColored) {
            return baseColor.withAlpha(
              isLight
                  ? kAlphaM2SwitchUnselectTrackLight
                  : kAlphaM2SwitchUnselectTrackDark,
            );
          }
          // This is SDK default, yes that value is hard coded in SDK too.
          return isLight ? kSwitchM2LightTrackColor : Colors.white30;
        }),
        overlayColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            if (states.contains(WidgetState.pressed)) {
              if (tintInteract) return tintedPressed(overlay, tint, factor);
              return baseColor.withAlpha(kAlphaPressed);
            }
            if (states.contains(WidgetState.hovered)) {
              if (tintInteract) return tintedHovered(overlay, tint, factor);
              return baseColor.withAlpha(kAlphaHovered);
            }
            if (states.contains(WidgetState.focused)) {
              if (tintInteract) return tintedFocused(overlay, tint, factor);
              return baseColor.withAlpha(kAlphaFocused);
            }
            return null;
          }
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) return tintedPressed(overlay, tint, factor);
            return colorScheme.onSurface.withAlpha(kAlphaPressed);
          }
          if (states.contains(WidgetState.hovered)) {
            if (tintInteract) return tintedHovered(overlay, tint, factor);
            return colorScheme.onSurface.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) return tintedFocused(overlay, tint, factor);
            return colorScheme.onSurface.withAlpha(kAlphaFocused);
          }
          return null;
        }),
      );
    }
    // Material-3 mode theming.
    else {
      // Use a Cupertino style themed Material-3 Switch.
      if (useCupertinoStyle ?? false) {
        return SwitchThemeData(
          mouseCursor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return SystemMouseCursors.basic;
            }
            return kIsWeb ? SystemMouseCursors.click : SystemMouseCursors.basic;
          }),

          thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
            Set<WidgetState> states,
          ) {
            return const Icon(Icons.minimize, color: Colors.transparent);
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.focused)) {
              // This color grabbed from adaptive CupertinoSwitch focused state.
              return HSLColor.fromColor(
                baseColor.withValues(alpha: 0.80),
              ).withLightness(0.69).withSaturation(0.835).toColor();
            }
            return Colors.transparent;
          }),
          // The actual CupertinoSwitch has ring outside the track, this
          // ring is inside the track, but it is a color and style match.
          trackColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              if (states.contains(WidgetState.selected)) {
                return baseColor.withValues(alpha: 0.5);
              }
              return isLight
                  // Actual CupertinoSwitch wraps with Opacity(0.5) layer, this
                  // cannot be done here. This is picked to match the look.
                  ? cup.color.withValues(alpha: 0.07)
                  : cup.darkColor.withValues(alpha: 0.16);
            }
            if (states.contains(WidgetState.selected)) {
              return baseColor;
            }
            return isLight ? cup.color : cup.darkColor;
          }),
          thumbColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.white.withValues(alpha: 0.5);
            }
            return Colors.white;
          }),
          overlayColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            return Colors.transparent;
          }),
          // This is the width of the focused Cupertino outline ring, but
          // on an actual CupertinoSwitch it is outside the track and there
          // is special code to handle it the CupertinoSwitch case, we cannot
          // do that with a Theme on Material-3 Switch case, but it is style
          // wise a good match.
          trackOutlineWidth: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.focused)) {
              return 3.5;
            }
            return 0;
          }),
          splashRadius: 0,
        );
      } else {
        // Use a generally themed Material-3 style Switch
        return SwitchThemeData(
          splashRadius: splashRadius,
          thumbIcon: thumbFixedSize ?? false
              ? WidgetStateProperty.resolveWith<Icon?>((
                  Set<WidgetState> states,
                ) {
                  return const Icon(
                    Icons.minimize,
                    color: Colors.transparent,
                  );
                })
              : null,
          thumbColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              if (states.contains(WidgetState.selected)) {
                return colorScheme.surface;
              }
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return colorScheme.onSurface.withAlpha(kAlphaDisabled);
            }
            if (states.contains(WidgetState.selected)) {
              if (states.contains(WidgetState.pressed)) {
                return thumbColor;
              }
              if (states.contains(WidgetState.hovered)) {
                return thumbColor;
              }
              if (states.contains(WidgetState.focused)) {
                return thumbColor;
              }
              return onBaseColor;
            }
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.onSurfaceVariant;
            }
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.onSurfaceVariant;
            }
            if (states.contains(WidgetState.focused)) {
              return colorScheme.onSurfaceVariant;
            }
            return colorScheme.outline;
          }),
          trackColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              if (states.contains(WidgetState.selected)) {
                if (tintDisable) {
                  return tintedDisable(colorScheme.onSurface, baseColor);
                }
                return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
              }
              return colorScheme.surfaceContainerHighest.withAlpha(
                kAlphaVeryLowDisabled,
              );
            }
            if (states.contains(WidgetState.selected)) {
              if (states.contains(WidgetState.pressed)) {
                return baseColor;
              }
              if (states.contains(WidgetState.hovered)) {
                return baseColor;
              }
              if (states.contains(WidgetState.focused)) {
                return baseColor;
              }
              return baseColor;
            }
            if (states.contains(WidgetState.pressed)) {
              return unselectedColored
                  ? baseColor.withAlpha(
                      isLight
                          ? kAlphaM3SwitchUnselectTrackLight
                          : kAlphaM3SwitchUnselectTrackDark,
                    )
                  : colorScheme.surfaceContainerHighest;
            }
            if (states.contains(WidgetState.hovered)) {
              return unselectedColored
                  ? baseColor.withAlpha(
                      isLight
                          ? kAlphaM3SwitchUnselectTrackLight
                          : kAlphaM3SwitchUnselectTrackDark,
                    )
                  : colorScheme.surfaceContainerHighest;
            }
            if (states.contains(WidgetState.focused)) {
              return unselectedColored
                  ? baseColor.withAlpha(
                      isLight
                          ? kAlphaM3SwitchUnselectTrackLight
                          : kAlphaM3SwitchUnselectTrackDark,
                    )
                  : colorScheme.surfaceContainerHighest;
            }
            return unselectedColored
                ? baseColor.withAlpha(
                    isLight
                        ? kAlphaM3SwitchUnselectTrackLight
                        : kAlphaM3SwitchUnselectTrackDark,
                  )
                : colorScheme.surfaceContainerHighest;
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return Colors.transparent;
            }
            if (states.contains(WidgetState.disabled)) {
              if (tintDisable) {
                return tintedDisable(colorScheme.onSurface, baseColor);
              }
              return colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
            }
            return colorScheme.outline;
          }),
          overlayColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.selected)) {
              if (states.contains(WidgetState.pressed)) {
                if (tintInteract) return tintedPressed(overlay, tint, factor);
                return baseColor.withAlpha(kAlphaPressed);
              }
              if (states.contains(WidgetState.hovered)) {
                if (tintInteract) return tintedHovered(overlay, tint, factor);
                return baseColor.withAlpha(kAlphaHovered);
              }
              if (states.contains(WidgetState.focused)) {
                if (tintInteract) return tintedFocused(overlay, tint, factor);
                return baseColor.withAlpha(kAlphaFocused);
              }
              return null;
            }
            if (states.contains(WidgetState.pressed)) {
              if (tintInteract) return tintedPressed(overlay, tint, factor);
              return colorScheme.onSurface.withAlpha(kAlphaPressed);
            }
            if (states.contains(WidgetState.hovered)) {
              if (tintInteract) return tintedHovered(overlay, tint, factor);
              return colorScheme.onSurface.withAlpha(kAlphaHovered);
            }
            if (states.contains(WidgetState.focused)) {
              if (tintInteract) return tintedFocused(overlay, tint, factor);
              return colorScheme.onSurface.withAlpha(kAlphaFocused);
            }
            return null;
          }),
        );
      }
    }
  }

  /// An opinionated [TabBarThemeData] theme.
  ///
  /// Contrary to the other opinionated static [FlexSubThemes] sub-theme
  /// function, this one is only a sub-set of the original and does not do or
  /// contain any feature shortcuts.
  ///
  /// The [FlexColorScheme.toTheme] needs some of the properties, like fore-
  /// and background colors used here, for other component theme definitions as
  /// well and has already computed them once, so they are reused here.
  static TabBarThemeData tabBarTheme({
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

    // TODO(rydmike): Open issue about using TabAlignment. Theme variant issue.
    /// Overrides the default value for [TabBar.tabAlignment].
    ///
    /// In M3 the default is [TabAlignment.startOffset] if [TabBar] property
    /// [isScrollable] is true, if false the default is [TabAlignment.fill].
    ///
    /// In M2 the default is [TabAlignment.start] if [TabBar] property
    /// [isScrollable] is true, if false the default is [TabAlignment.fill].
    ///
    /// **NOTE:**
    ///
    /// [TabAlignment.start] and [TabAlignment.startOffset] are only usable
    /// when widget sets [TabBar.isScrollable] to true. If used when
    /// [TabBar.isScrollable] is false, the [TabBar] will throw an exception
    /// error.
    ///
    /// Likewise [TabAlignment.fill] is only usable when widgets sets
    /// [TabBar.isScrollable] to false. If used when [TabBar.isScrollable] is
    /// true, the [TabBar] will throw an exception error.
    ///
    /// Only universal theming option usable in a theme, other than widget
    /// default behavior is [TabAlignment.center]. This is not a good
    /// design setup. We need to be able to specify the themed alignment
    /// for both scrollable and non-scrollable [TabBar]s so we can style them
    /// with different alignments. That do not throw for the used [TabBar]
    /// variant.
    final TabAlignment? tabAlignment,

    // TODO(rydmike): Open issue, in 3.27 always linear even if elastic used.
    /// Specifies the animation behavior of the tab indicator in a [TabBar].
    ///
    /// If not defined, the tab indicator will animate linearly if
    /// the [indicatorSize] is [TabBarIndicatorSize.tab], otherwise it will
    /// animate with an elastic effect if the [indicatorSize] is
    /// [TabBarIndicatorSize.label].
    final TabIndicatorAnimation? indicatorAnimation,

    /// The top left and right corner radius of the underline border
    /// indicator on the [TabBar].
    ///
    /// If not defined, defaults to 0 in M2 and to 3 in M3.
    final double? indicatorTopRadius,

    /// Overrides the default value for [TabBar.indicatorColor].
    final Color? indicatorColor,

    /// Overrides the default value for [TabBar.unselectedLabelStyle].
    final TextStyle? unselectedLabelStyle,

    /// The color of the divider.
    ///
    /// If null and [useMaterial3] is true, [TabBarThemeData.dividerColor]
    /// color is used. If that is null and [useMaterial3] is true,
    /// [ColorScheme.surfaceVariant] will be used,
    /// otherwise divider will not be drawn.
    final Color? dividerColor,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

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

    // Only make a custom overlay when we have settings that require it.
    final bool useCustomOverlay = tintInteract ||
        (useM3 && labelColor != colorScheme.primary && labelColor != null) ||
        (!useM3 && labelColor != colorScheme.onPrimary && labelColor != null);

    return TabBarThemeData(
      labelStyle: labelStyle,
      labelColor: labelColor,
      unselectedLabelStyle: unselectedLabelStyle,
      unselectedLabelColor: unselectedLabelColor,
      //
      indicatorSize: indicatorSize,
      indicatorAnimation: indicatorAnimation,
      indicatorColor: indicatorColor,
      indicator: (indicatorWeight != null || indicatorTopRadius != null)
          ? indicator
          : null,
      tabAlignment: tabAlignment,
      dividerColor: dividerColor,
      //
      overlayColor: useCustomOverlay
          ? WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                if (states.contains(WidgetState.hovered)) {
                  return overlayBase.withAlpha(kAlphaHovered);
                }
                if (states.contains(WidgetState.focused)) {
                  return overlayBase.withAlpha(kAlphaFocused);
                }
                if (states.contains(WidgetState.pressed)) {
                  return overlayBase.withAlpha(kAlphaPressed);
                }
                return null;
              }
              if (states.contains(WidgetState.hovered)) {
                if (tintInteract) return overlayBase.withAlpha(kAlphaHovered);
                return colorScheme.onSurface.withAlpha(kAlphaHovered);
              }
              if (states.contains(WidgetState.focused)) {
                if (tintInteract) return overlayBase.withAlpha(kAlphaFocused);
                return colorScheme.onSurface.withAlpha(kAlphaFocused);
              }
              if (states.contains(WidgetState.pressed)) {
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
    final Color baseColor = schemeColor(
      baseSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Using these tinted overlay variables in all themes for ease of
    // reasoning and duplication.
    final Color overlay = colorScheme.surface;
    final Color tint = baseColor;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness, true);

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
            return tintedDisable(colorScheme.onSurface, tint);
          }
          return colorScheme.onSurface.withAlpha(kAlphaDisabled);
        }
        return baseColor;
      });

      overlayColor = WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          if (tintInteract) return tintedHovered(overlay, tint, factor);
          return baseColor.withAlpha(kAlphaHovered);
        }
        if (states.contains(WidgetState.focused)) {
          if (tintInteract) return tintedFocused(overlay, tint, factor);
          return baseColor.withAlpha(kAlphaFocused);
        }
        if (states.contains(WidgetState.pressed)) {
          if (tintInteract) return tintedPressed(overlay, tint, factor);
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

  /// An opinionated [TextSelectionThemeData] theme.
  ///
  /// Requires a [ColorScheme], the color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  static TextSelectionThemeData textSelectionTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The [SchemeColor] based color of the cursor in the text field.
    ///
    /// The cursor indicates the current location of text insertion point in
    /// the field.
    ///
    /// If not defined, [colorScheme.primary] is used.
    final SchemeColor? cursorSchemeColor,

    /// The [SchemeColor] based background color of selected text.
    ///
    /// If not defined, [colorScheme.primary] is used.
    final SchemeColor? selectionSchemeColor,

    /// The opacity applied to [selectionSchemeColor].
    ///
    /// If not defined, default to [kTextSelectionOpacity] = 0.4 (40%).
    /// Same as Flutter SDK default.
    final double? selectionOpacity,

    /// The [SchemeColor] based color of the selection handles on the
    /// text field.
    ///
    /// Selection handles are used to indicate the bounds of the selected text,
    /// or as a handle to drag the cursor to a new location in the text.
    ///
    /// If not defined, [colorScheme.primary] is used.
    final SchemeColor? selectionHandleSchemeColor,

    /// A custom override color that
    /// [TextSelectionThemeData.selectionHandleColor] will use if it is defined.
    ///
    /// If not defined, the result from [selectionHandleSchemeColor] is used.
    final Color? selectionHandleCustomColor,
  }) {
    // Get used cursorColor, defaults to primary.
    final Color cursorColor = schemeColor(
      cursorSchemeColor ?? SchemeColor.primary,
      colorScheme,
    );

    // Get used selectionColor, defaults to primary.
    // Get around the opacity optimized out assert by using alpha.
    final Color selectionColor = schemeColor(
      selectionSchemeColor ?? SchemeColor.primary,
      colorScheme,
    ).withValues(alpha: selectionOpacity ?? kTextSelectionOpacity);

    // Get used selectionHandleColor, defaults to primary.
    final Color selectionHandleColor = selectionHandleCustomColor ??
        schemeColor(
          selectionHandleSchemeColor ?? SchemeColor.primary,
          colorScheme,
        );

    return TextSelectionThemeData(
      cursorColor: cursorColor,
      selectionColor: selectionColor,
      selectionHandleColor: selectionHandleColor,
    );
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
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

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
    /// https://github.com/flutter/flutter/issues/91772).
    final Color? backgroundColor,

    /// Selects which color from the passed in colorScheme to use as the dialog
    /// background color.
    ///
    /// If not defined, then the passed in [backgroundColor] will be used,
    /// which may be null too and dialog then falls back to Flutter SDK default
    /// value for TimePickerDialog, which is [colorScheme.surface].
    ///
    /// FlexColorScheme sub-theming uses this property to match the background
    /// color of this dialog to other standard dialogs. It sets it via
    /// [FlexSubThemesData] to [SchemeColor.surface].
    final SchemeColor? backgroundSchemeColor,

    /// Dialog elevation.
    ///
    /// If not defined, defaults to [kDialogElevation] = 6.
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

    /// Set to true to not use the provided [inputDecorationTheme].
    ///
    /// If this flag is false, the provided [inputDecorationTheme] is not used,
    /// additionally the theme fix this theme helper does internally is
    /// not applied and pure null value is passed. This enables getting the
    /// default widget behavior input decorator, or opting in on getting the
    /// provided inputDecorationTheme with the internal style fix for issue
    /// https://github.com/flutter/flutter/issues/54104 applied automatically
    /// to the provided inputDecorationTheme.
    ///
    /// If not defined, defaults to false.
    final bool? useInputDecoratorTheme,

    /// Used to configure the [TextStyle]s for the day period control.
    ///
    /// If this is null, the time picker defaults to the overall theme's
    /// [TextTheme.titleMedium].
    final TextStyle? dayPeriodTextStyle,

    /// The [TextStyle] for the numbers on the time selection dial.
    ///
    /// If [dialTextStyle]'s [TextStyle.color] is a [WidgetStateColor], then
    /// the effective text color can depend on the [WidgetState.selected]
    /// state, i.e. if the text is selected or not.
    ///
    /// If this style is null then the dial's text style is based on the theme's
    /// [ThemeData.textTheme].
    final TextStyle? dialTextStyle,

    /// Used to configure the [TextStyle]s for the helper text in the header.
    ///
    /// If this is null, the time picker defaults to the overall theme's
    /// [TextTheme.labelSmall].
    final TextStyle? helpTextStyle,

    /// Used to configure the [TextStyle]s for the hour/minute controls.
    ///
    /// If this is null, the time picker defaults to the overall theme's
    /// [TextTheme.headline3].
    final TextStyle? hourMinuteTextStyle,

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
    final bool useDecorator = useInputDecoratorTheme ?? false;

    final Color? background = backgroundSchemeColor == null
        ? backgroundColor // might be null, then SDK theme defaults.
        : schemeColor(backgroundSchemeColor, colorScheme);

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

    InputDecorationTheme timePickerDefaultInputDecorationTheme() {
      const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(8.0));
      return InputDecorationTheme(
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
              const InputDecorationTheme().copyWith(
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
    /// base color for the [ToggleButtons].
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
    /// If not defined, primary will be used.
    final SchemeColor? baseSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the
    /// foreground color for the selected [ToggleButtons].
    ///
    /// If not defined, contrast color pair to [baseSchemeColor] will be used,
    /// which for its default value is onPrimary.
    final SchemeColor? selectedForegroundSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the
    /// foreground color for unselected [ToggleButtons].
    ///
    /// If not defined, [baseSchemeColor] will be used as base.
    final SchemeColor? unselectedSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the border
    /// color for the toggle buttons.
    ///
    /// If not defined, [baseSchemeColor] will be used as base in M2, in M3
    /// [ColorScheme.outline] will be the effective result.
    final SchemeColor? borderSchemeColor,

    /// The button corner radius.
    ///
    /// If not defined, defaults to [kButtonRadius] 40dp.
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

    /// The default text style for [ToggleButtons.children].
    ///
    /// [TextStyle.color] will be ignored and substituted by [color],
    /// [selectedColor] or [disabledColor] depending on whether the buttons
    /// are active, selected, or disabled.
    final TextStyle? textStyle,

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

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedInteraction,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    final bool? useTintedDisable,

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
    final SchemeColor selectedBackgroundSchemeColor =
        baseSchemeColor ?? SchemeColor.primary;
    final Color selectedBackground = schemeColor(
      selectedBackgroundSchemeColor,
      colorScheme,
    );
    final Color unselectedForeground = schemeColor(
      unselectedSchemeColor ?? selectedBackgroundSchemeColor,
      colorScheme,
    );
    final Color selectedForeground = selectedForegroundSchemeColor != null
        ? schemeColor(selectedForegroundSchemeColor, colorScheme)
        : schemeColorPair(selectedBackgroundSchemeColor, colorScheme);
    final SchemeColor borderDefault =
        useM3 ? SchemeColor.outline : selectedBackgroundSchemeColor;
    final Color borderColor = schemeColor(
      borderSchemeColor ?? borderDefault,
      colorScheme,
    );

    // Using these tinted overlay variable in all themes for ease of
    // reasoning and duplication.
    final Color overlay = colorScheme.surface;
    final Color tint = selectedBackground;
    final double factor = _tintAlphaFactor(tint, colorScheme.brightness);

    // Effective minimum button size.
    final Size effectiveMinButtonSize = minButtonSize ?? kButtonMinSize;
    // Effective border width.
    final double effectiveWidth = borderWidth ?? kThinBorderWidth;
    // Effective visual density.
    final VisualDensity usedVisualDensity =
        visualDensity ?? VisualDensity.adaptivePlatformDensity;
    return ToggleButtonsThemeData(
      textStyle: textStyle,
      borderWidth: effectiveWidth,
      color: unselectedForeground,
      selectedColor: selectedForeground,
      fillColor: selectedBackground,
      borderColor: borderColor,
      selectedBorderColor: borderColor,
      hoverColor: tintInteract
          ? tintedHovered(overlay, tint, factor)
          : selectedBackground.withAlpha(kAlphaHovered),
      focusColor: tintInteract
          ? tintedFocused(overlay, tint, factor)
          : selectedBackground.withAlpha(kAlphaFocused),
      highlightColor: tintInteract
          ? tintedHighlight(overlay, tint, factor)
          : selectedBackground.withAlpha(kAlphaHighlight),
      splashColor: tintInteract
          ? tintedSplash(overlay, tint, factor)
          : selectedBackground.withAlpha(kAlphaSplash),
      disabledColor: tintDisable
          ? tintedDisable(
              colorScheme.onSurface,
              tint,
            ).withAlpha(kAlphaLowDisabled)
          : colorScheme.onSurface.withAlpha(kAlphaDisabled),
      disabledBorderColor: tintDisable
          ? tintedDisable(
              colorScheme.onSurface,
              borderColor,
            ).withAlpha(kAlphaLowDisabled)
          : colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
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
                backgroundSchemeColor ?? SchemeColor.onSurface,
                colorScheme,
              );

    final Color foreground =
        (backgroundSchemeColor == null && foregroundColor != null)
            ? foregroundColor
            : schemeColorPair(
                backgroundSchemeColor ?? SchemeColor.onSurface,
                colorScheme,
              );

    final TextStyle tooltipTextStyle = textStyle == null
        ? ThemeData(
            brightness: Brightness.light,
          ).textTheme.bodyMedium!.copyWith(color: foreground)
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

  /// Deprecated, use [bottomNavigationBarTheme] instead.
  @Deprecated(
    'Use FlexSubThemes.bottomNavigationBarTheme instead. This '
    'function has been renamed to use the correct name that all other '
    'component theme helpers use, ending with "Theme". This deprecated '
    'pass-through version will be removed in FlexColorScheme 9.0.0.',
  )
  static BottomNavigationBarThemeData bottomNavigationBar({
    required final ColorScheme colorScheme,
    final TextStyle? labelTextStyle,
    final double? selectedLabelSize,
    final double? unselectedLabelSize,
    final SchemeColor? selectedLabelSchemeColor,
    final SchemeColor? unselectedLabelSchemeColor,
    final bool? mutedUnselectedLabel,
    final double? selectedIconSize,
    final double? unselectedIconSize,
    final SchemeColor? selectedIconSchemeColor,
    final SchemeColor? unselectedIconSchemeColor,
    final bool? mutedUnselectedIcon,
    final SchemeColor? backgroundSchemeColor,
    final double? opacity,
    final double? elevation,
    final bool? showSelectedLabels,
    final bool? showUnselectedLabels,
    final BottomNavigationBarType? type,
    final BottomNavigationBarLandscapeLayout? landscapeLayout,
    final int unselectedAlphaBlend = kUnselectedBackgroundPrimaryAlphaBlend,
    final int unselectedAlpha = kUnselectedAlphaBlend,
    final bool? useFlutterDefaults,
  }) {
    return bottomNavigationBarTheme(
      colorScheme: colorScheme,
      labelTextStyle: labelTextStyle,
      selectedLabelSize: selectedLabelSize,
      unselectedLabelSize: unselectedLabelSize,
      selectedLabelSchemeColor: selectedLabelSchemeColor,
      unselectedLabelSchemeColor: unselectedLabelSchemeColor,
      mutedUnselectedLabel: mutedUnselectedLabel,
      selectedIconSize: selectedIconSize,
      unselectedIconSize: unselectedIconSize,
      selectedIconSchemeColor: selectedIconSchemeColor,
      unselectedIconSchemeColor: unselectedIconSchemeColor,
      mutedUnselectedIcon: mutedUnselectedIcon,
      backgroundSchemeColor: backgroundSchemeColor,
      opacity: opacity,
      elevation: elevation,
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      type: type,
      landscapeLayout: landscapeLayout,
      unselectedAlphaBlend: unselectedAlphaBlend,
      unselectedAlpha: unselectedAlpha,
      useFlutterDefaults: useFlutterDefaults,
    );
  }
}
