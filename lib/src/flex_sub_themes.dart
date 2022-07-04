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
/// [ColorScheme], should be used for by color properties available in
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
/// deprecated in Flutter SDK 2.10.0 stable, after master v2.6.0-0.0.pre landed.
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

  /// The active theme's color scheme surfaceTint color will be used.
  surfaceTint,

  /// The active theme's color scheme primaryVariant color will be used.
  @Deprecated('Use primaryContainer instead. Deprecated after version 4.2.0.')
  primaryVariant,

  /// The active theme's color scheme secondaryVariant color will be used.
  @Deprecated('Use secondaryContainer instead. Deprecated after version 4.2.0.')
  secondaryVariant,
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
/// * [ButtonThemeData] for old deprecated buttons, via [buttonTheme].
/// * [BottomNavigationBarThemeData] for [BottomNavigationBar] via
///   [bottomNavigationBar].
/// * [BottomSheetThemeData] for [BottomSheet] via [bottomSheetTheme].
/// * [CardTheme] for [Card] via [cardTheme].
/// * [CheckboxThemeData] for [Checkbox] via [checkboxTheme].
/// * [ChipThemeData] for [Chip] via [chipTheme].
/// * [DialogTheme] for [Dialog] via [dialogTheme].
/// * [ElevatedButtonThemeData] for [ElevatedButton] via [elevatedButtonTheme].
/// * [FloatingActionButtonThemeData] for [FloatingActionButton] via
///   [floatingActionButtonTheme].
/// * [InputDecorationTheme] for [InputDecoration] via [inputDecorationTheme].
/// * [NavigationBarThemeData] for [NavigationBar] via [navigationBarTheme].
/// * [NavigationRailThemeData] for [NavigationRail] via [navigationRailTheme].
/// * [OutlinedButtonThemeData] for [OutlinedButton] via [outlinedButtonTheme].
/// * [PopupMenuThemeData] for [PopupMenuButton] via [popupMenuTheme].
/// * [RadioThemeData] for [Radio] via [radioTheme].
/// * [SnackBarThemeData] for [SnackBar] via [snackBarTheme].
/// * [SwitchThemeData] for [Switch] via [switchTheme].
/// * [TextButtonThemeData] for [TextButton] via [textButtonTheme].
/// * [TimePickerThemeData] for [TimePickerDialog] via [timePickerTheme].
/// * [ToggleButtonsThemeData] for [ToggleButtons] via [toggleButtonsTheme].
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
/// will be removed from the Flutter SDK in next stable release. Their theme
/// the [ButtonThemeData] will also soon be deprecated and later removed.
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
      case SchemeColor.shadow:
        return colorScheme.shadow;
      case SchemeColor.inverseSurface:
        return colorScheme.inverseSurface;
      case SchemeColor.onInverseSurface:
        return colorScheme.onInverseSurface;
      case SchemeColor.inversePrimary:
        return colorScheme.inversePrimary;
      case SchemeColor.surfaceTint:
        return colorScheme.surfaceTint;
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
      case SchemeColor.surfaceTint:
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

  // TODO(rydmike): Remove buttonTheme, when ButtonThemeData is deprecated.
  /// DEPRECATED: An opinionated [ButtonThemeData] theme.
  ///
  /// This [ButtonThemeData] is marked as **obsolete** in Flutter SDK
  /// documentation, but not yet deprecated in Flutter SDK 3.0.0.
  /// FlexColorscheme now marks it as deprecated. It will be removed in FCS
  /// released after Flutter SDK fully deprecates ButtonThemeData.
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
  @Deprecated('The ButtonThemeData is marked as obsolete in Flutter SDK, but '
      'not yet deprecated in Flutter version 3.0.0. FlexColorscheme now marks '
      'it as deprecated. It will be removed in FCS released after Flutter SDK '
      'fully deprecates ButtonThemeData.')
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
    /// based on M3 Specification
    /// https://m3.material.io/components/buttons/specs
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
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

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

    /// Deprecated and replaced by [selectedLabelSchemeColor].
    ///
    /// This property will be completely removed in version 6.0.0.
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'selectedLabelSchemeColor. '
        'This property will be completely removed in version 6.0.0.')
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
        baseSchemeColor == null &&
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
            baseSchemeColor ??
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
        .withOpacity(opacity);

    return BottomNavigationBarThemeData(
      backgroundColor: backgroundSchemeColor == null
          ? useFlutterDefaults
              ? null
              : backgroundColor
          : backgroundColor,
      elevation: elevation,
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
  /// Corner [radius] defaults to [kBottomSheetBorderRadius] = 16,
  /// [elevation] to [kBottomSheetElevation] = 4 and [modalElevation] to
  /// [kBottomSheetModalElevation] = 8.
  static BottomSheetThemeData bottomSheetTheme({
    /// The corner radius of the top corners.
    ///
    /// If not defined, defaults to [kBottomSheetBorderRadius] 16p.
    ///
    /// This value is not mentioned in the M3 Specification.
    /// It is based on an assumption that a sliding in
    /// surface from the bottom should have the same rounding on its top corners
    /// as the [Drawer] does on its visible side edges.
    /// https://m3.material.io/components/navigation-drawer/specs
    final double? radius,

    /// The bottom sheet elevation defaults to [kBottomSheetElevation] = 4.
    final double elevation = kBottomSheetElevation,

    /// The bottom sheet elevation defaults to [kBottomSheetModalElevation] = 8.
    final double modalElevation = kBottomSheetModalElevation,

    /// The clipBehavior of the bottom sheet theme, defaults to
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
            topLeft: Radius.circular(radius ?? kBottomSheetBorderRadius),
            topRight: Radius.circular(radius ?? kBottomSheetBorderRadius),
          ),
        ),
      );

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

    /// Card elevation defaults to [kCardElevation] = 0.
    final double elevation = kCardElevation,

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
    /// If false, it is grey like in Flutter SDK. Defaults to true.
    final bool unselectedIsColored = true,
  }) {
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
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

  /// An opinionated [ChipThemeData] theme with custom border radius and a
  /// custom theme that partially mimics the M3 style and works well with
  /// FlexColorScheme surface blends.
  ///
  /// The border radius defaults to 8dp [kChipRadius], new M3 default.
  /// https://m3.material.io/components/chips/specs
  ///
  /// This is inspired by M3 Chip design and applies it using the limited
  /// theming features for old M2 chips in Flutter, to some extent. It is
  /// tricky to get this theme to play nicely, but this setup is pretty ok
  /// and fits well with the FlexColorScheme color blended themes.
  ///
  /// It is possible that there will be new Chips entirely for Material 3 in
  /// Flutter. This theme brings the M2 Chips look closer to M3 design, but
  /// cannot reach it all the way.
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
    /// If not defined, defaults to [kChipRadius] 8dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/chips/specs
    final double? radius,
  }) {
    // Get base color, defaults to primary.
    final Color usedBaseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // Foreground color for all Chips except disabled Chip.
    final Color foreground = usedBaseColor.blendAlpha(
        colorScheme.onSurface, kChipForegroundAlphaBlend);
    // For selected InputChip & ChoiceChip.
    final Color selectedBackgroundColor = usedBaseColor.blendAlpha(
        colorScheme.surface, kChipSelectedBackgroundAlphaBlend);
    // Text color, uses the foreground color for all chip styles.
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
      // a built in scrim for disabled state, making it look a bit different,
      // but it is pretty close.
      disabledColor: usedBaseColor
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledBackgroundAlpha),
      // Same label style on selected and not selected chips, their different
      // background style make them stand out enough.
      labelStyle: effectiveLabelStyle,
      secondaryLabelStyle: effectiveLabelStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kChipRadius),
        ),
      ),
    );
  }

  // TODO(rydmike): No padding in Flutter dialog theme, add when available.
  // The M3 guide https://m3.material.io/components/dialogs/specs specs 24 dp.
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
    /// If not defined, defaults to [kButtonRadius] 20dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/buttons/specs
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
    /// `theme.colorScheme.primaryContainer` will be used.
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

    /// Selects which color from the passed in colorScheme to use for the border
    /// and fill color of the input decorator.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [colorScheme.primary] will be used.
    final SchemeColor? baseSchemeColor,

    /// The decorated input fields corner border radius.
    ///
    /// If not defined, defaults to [kInputDecoratorRadius] 20dp.
    ///
    /// Was not specified in M3 guide what it should be.
    /// Will be adjusted when known. Now set to same as button radius (20dp), so
    /// it matches them. The M3 design intent may also be that it should
    /// be same as FAB and Drawer, ie 16dp.
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
  }) {
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    final Color usedFillColor = fillColor ??
        (colorScheme.brightness == Brightness.dark
            ? baseColor.withAlpha(kFillColorAlphaDark)
            : baseColor.withAlpha(kFillColorAlphaLight));

    final Color enabledBorder = unfocusedBorderIsColored
        ? baseColor.withAlpha(kEnabledBorderAlpha)
        : colorScheme.onSurface.withOpacity(0.38);

    final double effectiveRadius = radius ?? kInputDecoratorRadius;

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
            borderRadius: BorderRadius.all(Radius.circular(effectiveRadius)),
            borderSide: BorderSide(
              color: baseColor,
              width: focusedBorderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius: BorderRadius.all(Radius.circular(effectiveRadius)),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: enabledBorder,
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius: BorderRadius.all(Radius.circular(effectiveRadius)),
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
            borderRadius: BorderRadius.all(Radius.circular(effectiveRadius)),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: focusedBorderWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius: BorderRadius.all(Radius.circular(effectiveRadius)),
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
              topLeft: Radius.circular(effectiveRadius),
              topRight: Radius.circular(effectiveRadius),
            ),
            borderSide: BorderSide(
              color: baseColor,
              width: focusedBorderWidth,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(effectiveRadius),
              topRight: Radius.circular(effectiveRadius),
            ),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: enabledBorder,
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(effectiveRadius),
              topRight: Radius.circular(effectiveRadius),
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
              topLeft: Radius.circular(effectiveRadius),
              topRight: Radius.circular(effectiveRadius),
            ),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: focusedBorderWidth,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(effectiveRadius),
              topRight: Radius.circular(effectiveRadius),
            ),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              width: unfocusedBorderWidth,
            ),
          ),
        );
    }
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
    /// [theme.textTheme.labelMedium]
    /// will be used as base style for the text style.
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

    /// Deprecated and replaced by [selectedLabelSchemeColor].
    ///
    /// This property will be completely removed in version 6.0.0.
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'selectedLabelSchemeColor. '
        'This property will be completely removed in version 6.0.0.')
        final SchemeColor? textSchemeColor,

    /// Select which color from the theme's [ColorScheme] to use as base for
    /// the [NavigationBar]'s unselected label text color.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
    /// blend and opacity, if [bottomNavigationBarMutedUnselectedLabel] is true.
    ///
    /// If [useFlutterDefaults] is true, and this property and all other
    /// label modifying properties are undefined, including the text style,
    /// the effective color will be [SchemeColor.onSurface] in M2 and
    /// [SchemeColor.onSurfaceVariant] in M3.
    final SchemeColor? unselectedLabelSchemeColor,

    /// Deprecated and replaced by [unselectedLabelSchemeColor].
    ///
    /// This property will be completely removed in version 6.0.0.
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'unselectedLabelSchemeColor. '
        'This property will be completely removed in version 6.0.0.')
        final SchemeColor? unselectedTextSchemeColor,

    /// If true, the unselected label in the [NavigationBar] use a more
    /// muted color version of the color defined by
    /// [navigationBarUnselectedLabelSchemeColor].
    /// The muting is unselected color with
    /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
    /// and withAlpha([kUnselectedAlphaBlend]).
    ///
    /// If undefined, defaults to true.
    final bool? mutedUnselectedLabel,

    /// Deprecated and replaced by [mutedUnselectedLabel].
    ///
    /// This property will be completely removed in version 6.0.0.
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'mutedUnselectedLabel. '
        'This property will be completely removed in version 6.0.0.')
        final bool? mutedUnselectedText,

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

    /// Deprecated and replaced by [selectedIconSchemeColor].
    ///
    /// This property will be completely removed in version 6.0.0.
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'selectedIconSchemeColor. '
        'This property will be completely removed in version 6.0.0.')
        final SchemeColor? iconSchemeColor,

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
    /// the effective color will be [SchemeColor.onSurface] in M2 and
    /// [SchemeColor.onSurfaceVariant] in M3.
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

    /// Deprecated, was used to select which color from the passed in
    /// [ColorScheme] to use as base for the selected [NavigationBar]'s
    /// indicator item highlight color.
    ///
    /// Replaced with indicatorSchemeColor.
    ///
    /// This property will be completely removed in version 6.0.0.
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'indicatorSchemeColor. '
        'This property will be completely removed in version 6.0.0.')
        final SchemeColor? highlightSchemeColor,

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
    /// FlexColorScheme sets background defaults of [BottomNavigationBar],
    /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
    /// when it using opinionated component sub-themes.
    /// Flutter SDK uses different colors on all three widgets. Our opinion is
    /// that they should all default to using the same [ColorScheme] based
    /// color. FlexColorScheme uses and recommend background color as this
    /// default.
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

    /// Height of the container for the Material 3 [NavigationBar].
    ///
    /// In undefined, defaults to [kNavigationBarHeight] which is 62 dp.
    ///
    /// If [useFlutterDefaults] true, and this property is undefined, it
    /// defaults to 80.
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
    /// If not defined in M2 defaults to [kNavigationBarIndicatorAlpha],
    /// which is 0x3D = 61 = 24%. In M3 alpha is 0xFF, or opacity 1.
    ///
    /// The default is the same value as Widget SDK default behavior uses on its
    /// used secondary color on its indicator color on the [NavigationBar] in
    /// its M2 mode.
    final int? indicatorAlpha,

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
    final bool useMaterial3 = false,

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
    /// - background       background     surface with      surface with
    ///                                   onSurface overlay primary overlay
    ///                                   elev 3.           elev 3.
    /// - height           62             80                80
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
    // Determine if we can even use default icon styles, only when all are null,
    // can we fall back to Flutter SDK default.
    final bool useDefaultTextStyle = labelTextStyle == null &&
        selectedLabelSize == null &&
        unselectedLabelSize == null &&
        selectedLabelSchemeColor == null &&
        textSchemeColor == null &&
        unselectedLabelSchemeColor == null &&
        unselectedTextSchemeColor == null &&
        useFlutterDefaults;

    // Determine if we can even use default icon styles, only when all are null,
    // can we fall back to Flutter SDK default.
    final bool useDefaultIconTheme = selectedIconSize == null &&
        unselectedIconSize == null &&
        selectedIconSchemeColor == null &&
        iconSchemeColor == null &&
        unselectedIconSchemeColor == null &&
        useFlutterDefaults;

    // Get text color, defaults to primary.
    final Color labelColor = schemeColor(
        selectedLabelSchemeColor ?? textSchemeColor ?? SchemeColor.primary,
        colorScheme);

    // Get unselected label color, defaults to colorScheme.onSurface
    final Color unselectedLabelColor = schemeColor(
        unselectedLabelSchemeColor ??
            unselectedTextSchemeColor ??
            SchemeColor.onSurface,
        colorScheme);

    // Get text style, defaults to TextStyle(), we can use it since
    // size and color are applied to is separately.
    final TextStyle textStyle = labelTextStyle ?? const TextStyle();

    // Get effective text sizes.
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 12;
    final double effectiveUnselectedLabelSize =
        unselectedLabelSize ?? labelSize;

    // Get icon color, default to primary.
    final Color iconColor = schemeColor(
        selectedIconSchemeColor ?? iconSchemeColor ?? SchemeColor.primary,
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
        .withOpacity(opacity);

    // Indicator color, when using normal default, falls back to primary.
    final Color indicatorColor = schemeColor(
            indicatorSchemeColor ?? highlightSchemeColor ?? SchemeColor.primary,
            colorScheme)
        .withAlpha(indicatorAlpha ?? kNavigationBarIndicatorAlpha);

    return NavigationBarThemeData(
      height: height ?? (useFlutterDefaults ? null : kNavigationBarHeight),
      backgroundColor: backgroundSchemeColor == null
          ? useFlutterDefaults || useMaterial3
              ? null
              : backgroundColor
          : backgroundColor,
      indicatorColor: indicatorSchemeColor == null
          ? useFlutterDefaults
              ? null
              : indicatorColor
          : indicatorColor,
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
                  color: (mutedUnselectedLabel ?? mutedUnselectedText ?? true)
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
    /// [FlexColorScheme.m3TextTheme.bodyMedium]
    /// will be used as base style for the text style.
    ///
    /// If [useFlutterDefaults] is true, null will be passed to
    /// [FlexSubThemes.bottomNavigationBar] and along to theme creation, if all
    /// labeling modifying properties (size and scheme color) are also null, it
    /// will then be passed along as null, allowing it to remain undefined
    /// and widget default behavior sets the default. If label size or scheme
    /// is defined, a default TextStyle() will be created, if
    /// [navigationBarLabelTextStyle] is undefined, that gets the size and
    /// color applied.
    ///
    /// The size and colors defined in any of the text size and color properties
    /// are applied as overrides on the text style.
    final TextStyle? labelTextStyle,

    /// The size of the text label on selected [NavigationRail] item.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on selected item, 11 is used as fallback if needed.
    final double? selectedLabelSize,

    /// The size of the text label on unselected [NavigationRail] items.
    ///
    /// If defined, it overrides the font size on effective label TextStyle
    /// on unselected items, 11 is used as fallback if needed.
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
    /// the effective color will also be [ColorScheme.primary].
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
    /// the effective color will be [SchemeColor.onSurface] with opacity 64%.
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
    /// also be [ColorScheme.primary].
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
    /// the effective color will be [SchemeColor.onSurface] with 64% opacity.
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
    /// with opacity 24%.
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
    /// FlexColorScheme sets background defaults of [BottomNavigationBar],
    /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
    /// when it is using component sub-themes.
    /// Flutter SDK uses different colors on all three widgets. Our opinion is
    /// that they should all default to using the same [ColorScheme] based
    /// color. FlexColorScheme uses the background color as this default.
    final SchemeColor? backgroundSchemeColor,

    /// NavigationRail background opacity.
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
    /// I undefined, defaults to [kNavigationBarIndicatorAlpha],
    /// which is 0x3D = 61 = 24%.
    ///
    /// The default is the same value as Widget SDK default behavior uses on its
    /// used secondary color on its indicator color on the [NavigationBar],
    /// here we use same value on the [NavigationRail].
    /// needed later.
    final int? indicatorAlpha,

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
    /// Used internally to enable this sub-theme to when used by
    /// [FlexColorScheme] respect the [ThemeData.useMaterial3] flag.
    ///
    /// Flutter SDK [useMaterial3] documentation:
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
    /// - Selected label   primary         primary          onSurface
    /// - unselected icon  onSurface       onSurface op64%  onSurfaceVariant
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
    /// If undefined, defaults to false.
    final bool useFlutterDefaults = false,
  }) {
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
    final double labelSize = selectedLabelSize ?? textStyle.fontSize ?? 14;
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
                    ? SchemeColor.secondary
                    : SchemeColor.primary),
            colorScheme)
        .withAlpha(indicatorAlpha ?? kNavigationBarIndicatorAlpha);

    // Effective usage value for indicator.
    final bool effectiveUseIndicator =
        (useMaterial3 && useIndicator == null) || (useIndicator ?? false);

    // Background color, when using normal default, falls back to background.
    final Color backgroundColor = schemeColor(
            backgroundSchemeColor ?? SchemeColor.background, colorScheme)
        .withOpacity(opacity);

    // Property order here as in NavigationRailThemeData
    return NavigationRailThemeData(
      backgroundColor: backgroundSchemeColor == null
          ? useFlutterDefaults
              ? null
              : backgroundColor
          : backgroundColor,
      elevation: elevation,
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
      // Logic to avoid SDKs over eager asserts and get same result.
      useIndicator: true,
      indicatorColor: effectiveUseIndicator
          ? effectiveIndicatorColor
          : Colors.black.withAlpha(0x00),
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
    /// If not defined, defaults to [kButtonRadius] 20dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/buttons/specs
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
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

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

  /// An opinionated [PopupMenuThemeData] with custom corner radius.
  ///
  /// Corner [radius] defaults to [kMenuRadius] (4) and [elevation] to
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
  static PopupMenuThemeData popupMenuTheme({
    /// Popup menu corner radius.
    ///
    /// Defaults to [kMenuRadius] = 4, M3 specification.
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
            Radius.circular(radius ?? kMenuRadius),
          ),
        ),
      );

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
    final bool unselectedIsColored = true,
  }) {
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);
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

  // TODO(rydmike): Consider a SliderTheme with value popup using primary blend.
  //
  // /// An opinionated [SliderThemeData].
  // static SliderThemeData sliderTheme() {
  //   return const SliderThemeData();
  // }

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
  //   straight. However, I think M3 will need it too, so it might come then.
  //
  /// An opinionated [SnackBarThemeData] with custom elevation.
  ///
  /// The [elevation] defaults to [kSnackBarElevation] (4).
  static SnackBarThemeData snackBarTheme({
    /// SnackBar elevation defaults to [kSnackBarElevation] 4.
    final double? elevation = kSnackBarElevation,

    /// The background color of the themed SnackBar. Typically one of inverse
    /// brightness compared to theme's surface color brightness.
    ///
    /// If null, then FlexColorScheme (FCS) sets onw default when used via
    /// FlexSubThemesData as follows, the SDK default is used if this is not
    /// used via FlexSubThemesData:
    ///
    /// * In light theme mode:
    ///   * FCS: onSurface with primary blend at 45% opacity, with
    ///     total opacity 95%
    ///   * Flutter SDK uses: onSurface with surface at opacity 80%, blended on
    ///     top of surface.
    ///
    /// * In dark theme mode:
    ///   * FCS: onSurface with primary blend at 39% opacity, with total
    ///     opacity 93%
    ///   * Flutter SDK uses: colorScheme.onSurface
    ///
    /// SnackBar uses ColorScheme.inverseSurface in M3 schemes.
    /// While FlexColorScheme has own custom default primary tinted SnackBar
    /// color, it can also easily be themed also to [ColorScheme.inverseSurface]
    /// via the [backgroundSchemeColor].
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
    /// falls back to to dark grey: `Color(0xFF323232)`, via M2
    /// Flutter SDK defaults if not defined.
    ///
    /// FlexColorScheme uses this property via [FlexSubThemesData] and defines
    /// its default as [SchemeColor.surface].
    final SchemeColor? backgroundSchemeColor,
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

    final TextStyle? snackTextStyle = foreground != null
        ? ThemeData(brightness: Brightness.light)
            .textTheme
            .titleMedium!
            .copyWith(color: foreground)
        : null;

    return SnackBarThemeData(
      elevation: elevation,
      backgroundColor: background,
      contentTextStyle: snackTextStyle,
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
    /// switches, primary color works better.
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
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);
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
            return baseColor.withAlpha(0x70);
          }
          // This is SDK default.
          return isLight ? const Color(0x52000000) : Colors.white30;
        },
      ),
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
    /// If not defined, defaults to [kButtonRadius] 20dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/buttons/specs
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
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

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

    /// Outer corner radius.
    ///
    /// If not defined, defaults to [kDialogRadius] 28dp,
    /// based on M3 Specification
    /// https://m3.material.io/components/dialogs/specs
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
        // uses. This defaults to same value that ThemeData uses by default.
        minWidth: minButtonSize.width -
            borderWidth * 2 +
            usedVisualDensity.baseSizeAdjustment.dx,
        minHeight: minButtonSize.height -
            borderWidth * 2 +
            usedVisualDensity.baseSizeAdjustment.dy,
      ),
    );
  }
}
