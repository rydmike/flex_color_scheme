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
/// * `ButtonThemeData` for old deprecated buttons, via `buttonTheme`.
/// * [BottomNavigationBarThemeData] for [BottomNavigationBar] via
///   [bottomNavigationBar].
/// * [BottomSheetThemeData] for [BottomSheet] via [bottomSheetTheme].
/// * [CardTheme] for [Card] via [cardTheme].
/// * [CheckboxThemeData] for [Checkbox] via [checkboxTheme].
/// * [ChipThemeData] for [Chip] via [chipTheme].
/// * [DialogTheme] for [Dialog] via [dialogTheme].
/// * [ElevatedButtonThemeData] for [ElevatedButton] via [elevatedButtonTheme].
/// * [FilledButtonThemeData] for [FilledButton] via
///   [FlexSubThemes.filledButtonTheme].
/// * [FloatingActionButtonThemeData] for [FloatingActionButton] via
///   [floatingActionButtonTheme].
/// * [InputDecorationTheme] for [InputDecoration] via [inputDecorationTheme].
/// * [NavigationBarThemeData] for [NavigationBar] via [navigationBarTheme].
/// * [NavigationRailThemeData] for [NavigationRail] via [navigationRailTheme].
/// * [OutlinedButtonThemeData] for [OutlinedButton] via [outlinedButtonTheme].
/// * [PopupMenuThemeData] for [PopupMenuButton] via [popupMenuTheme].
/// * [RadioThemeData] for [Radio] via [radioTheme].
/// * [SliderThemeData] for [Slider] via [sliderTheme].
/// * [SnackBarThemeData] for [SnackBar] via [snackBarTheme].
/// * [SwitchThemeData] for [Switch] via [switchTheme].
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
        return colorScheme.onPrimaryContainer;
      case SchemeColor.onPrimaryContainer:
        return colorScheme.primaryContainer;
      case SchemeColor.secondary:
        return colorScheme.onSecondary;
      case SchemeColor.onSecondary:
        return colorScheme.secondary;
      case SchemeColor.secondaryContainer:
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
      case SchemeColor.outlineVariant:
        return colorScheme.background;
      case SchemeColor.shadow:
        return colorScheme.background;
      case SchemeColor.scrim:
        return colorScheme.background;
      case SchemeColor.inverseSurface:
        return colorScheme.onInverseSurface;
      case SchemeColor.onInverseSurface:
        return colorScheme.inverseSurface;
      case SchemeColor.inversePrimary:
        return colorScheme.primary;
    }
  }

  /// An opinionated `ButtonThemeData` theme.
  ///
  /// This `ButtonThemeData` is marked as **obsolete** in Flutter SDK
  /// documentation, but not yet deprecated in Flutter SDK 3.3.0.
  /// It will be removed in FCS after Flutter SDK deprecates ButtonThemeData.
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

    /// Card elevation.
    ///
    /// If not defined, defaults to [kCardElevation] = 0dp.
    final double? elevation,

    /// The clipBehavior of the card theme, defaults to
    /// [Clip.antiAlias] for smooth clipping when using rounded corners.
    ///
    /// There is no config property in [FlexSubThemesData] for [clipBehavior],
    /// if needed it can be exposed. Feel free to make a PR or submit an issue.
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      CardTheme(
        clipBehavior: clipBehavior,
        elevation: elevation ?? kCardElevation,
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

    /// Set to true to opt in on Material 3 styled chips.
    ///
    /// If false widgets will use more opinionated FlexColorScheme defaults.
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
      surfaceTintColor: useM3Defaults ? null : colorScheme.surfaceTint,

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

    /// A temporary flag used to opt-in to new Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated defaults values.
    ///
    /// The M2/M3 SDK defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    final bool useMaterial3 = false,
  }) {
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    // On color logic with M3 reversal of roles.
    final Color onBaseColor = onBaseSchemeColor == null
        ? useMaterial3
            ? schemeColor(SchemeColor.surface, colorScheme)
            : schemeColorPair(baseScheme, colorScheme)
        : schemeColor(onBaseSchemeColor, colorScheme);

    // We are using FCS M2 buttons, styled in M3 fashion.
    if (!useMaterial3) {
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
      // but where we can modify the base degree. If elevation 1, is passed
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

    /// A temporary flag used to opt-in to new Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated defaults values.
    ///
    /// The M2/M3 SDK defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    final bool useMaterial3 = false,
  }) {
    // Used color scheme is for dark mode.
    final bool isDark = colorScheme.brightness == Brightness.dark;

    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // TODO(rydmike): Define consts for tinted disabled.
    final Color usedFillColor = fillColor ??
        MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return tintedDisabled
                ? baseColor
                    .blendAlpha(colorScheme.onSurface, 0x30)
                    .withAlpha(0x08)
                : colorScheme.onSurface.withOpacity(0.04);
          }
          return baseSchemeColor == null && useMaterial3
              ? colorScheme.surfaceVariant
              : (colorScheme.brightness == Brightness.dark
                  ? baseColor.withAlpha(kFillColorAlphaDark)
                  : baseColor.withAlpha(kFillColorAlphaLight));
        });

    // Some Flutter "magic" theme colors from ThemeData.
    final Color hintColor =
        isDark ? Colors.white60 : Colors.black.withAlpha(0x99); // 60%
    final Color suffixIconColorM2 = isDark ? Colors.white70 : Colors.black45;
    final Color disabledColor = isDark ? Colors.white38 : Colors.black38;

    final Color enabledBorder = unfocusedBorderIsColored
        ? baseColor.withAlpha(kEnabledBorderAlpha)
        : useMaterial3
            ? borderType == FlexInputBorderType.underline
                ? colorScheme.onSurfaceVariant
                : colorScheme.outline
            : colorScheme.onSurface.withOpacity(0.38);

    // Default border radius.
    final double effectiveRadius = radius ??
        (useMaterial3 ? kInputDecoratorM3Radius : kInputDecoratorRadius);

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
            color: useMaterial3 ? colorScheme.onSurfaceVariant : hintColor);
      }),
      floatingLabelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.error)) {
          if (states.contains(MaterialState.focused)) {
            return TextStyle(color: colorScheme.error);
          }

          if (states.contains(MaterialState.hovered)) {
            return
                // TODO(rydmike): Default M3, excluding it. Opinionated.
                // useMaterial3
                //   ? TextStyle(color: colorScheme.onErrorContainer)
                //   :
                TextStyle(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
            );
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
              : TextStyle(
                  color: useMaterial3
                      ? colorScheme.onSurface.withOpacity(0.38)
                      : disabledColor);
        }
        return TextStyle(
            color: useMaterial3 ? colorScheme.onSurfaceVariant : hintColor);
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
                  color: useMaterial3
                      ? colorScheme.onSurface.withOpacity(0.38)
                      : Colors.transparent);
        }
        return TextStyle(
            color: useMaterial3 ? colorScheme.onSurfaceVariant : hintColor);
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
          return useMaterial3 ? colorScheme.onSurfaceVariant : baseColor;
        }
        return useMaterial3 ? colorScheme.onSurfaceVariant : suffixIconColorM2;
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
          return useMaterial3 ? colorScheme.onSurfaceVariant : baseColor;
        }
        return useMaterial3 ? colorScheme.onSurfaceVariant : suffixIconColorM2;
      }),
      suffixIconColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.error)) {
          // TODO(rydmike): Default M3 does this, excluding it. Opinionated.
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
          return useMaterial3 ? colorScheme.onSurfaceVariant : baseColor;
        }
        return useMaterial3 ? colorScheme.onSurfaceVariant : suffixIconColorM2;
      }),
      filled: filled,
      fillColor: usedFillColor,
      hoverColor: tintedInteractions
          ? baseColor.withAlpha(kHoverBackgroundAlpha)
          : null,
      focusColor: tintedInteractions
          ? baseColor.withAlpha(kFocusBackgroundAlpha)
          : null,
      focusedBorder: effectiveInputBorder.copyWith(
        borderSide: focusedHasBorder
            ? BorderSide(
                color: baseColor,
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
                    ? baseColor
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
                    .withAlpha(useMaterial3 ? 0xFF : kEnabledBorderAlpha),
                width: unfocusedWidth,
              )
            : BorderSide.none,
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
    /// blend and opacity, if [bottomNavigationBarMutedUnselectedLabel] is true.
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
            backgroundSchemeColor ?? SchemeColor.background, colorScheme)
        .withOpacity(opacity ?? 1.0);

    // Indicator color, when using normal default, falls back to primary.
    final Color indicatorColor =
        schemeColor(indicatorSchemeColor ?? SchemeColor.primary, colorScheme)
            .withAlpha(indicatorAlpha ?? kNavigationBarIndicatorAlpha);

    return NavigationBarThemeData(
      height: height ?? (useFlutterDefaults ? null : kNavigationBarHeight),
      elevation: elevation,
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
                    ? useMaterial3
                        ? SchemeColor.secondaryContainer
                        : SchemeColor.secondary
                    : SchemeColor.primary),
            colorScheme)
        .withAlpha(indicatorAlpha ??
            ((useMaterial3 && useFlutterDefaults)
                ? 0xFF
                : kNavigationBarIndicatorAlpha));

    // Effective usage value for indicator.
    final bool effectiveUseIndicator =
        (useMaterial3 && useIndicator == null) || (useIndicator ?? false);

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

    /// A temporary flag used to opt-in to new Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated defaults values.
    ///
    /// The M2/M3 SDK defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    final bool useMaterial3 = false,
  }) {
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // Outline color logic with different M2 and M3 defaults.
    final Color outlineColor = outlineSchemeColor == null
        ? useMaterial3
            ? schemeColor(SchemeColor.outline, colorScheme)
            : baseColor
        : schemeColor(outlineSchemeColor, colorScheme);

    // Default outline widths.
    final double normalWidth = outlineWidth ?? kThinBorderWidth;
    final double pressedWidth =
        pressedOutlineWidth ?? (useMaterial3 ? 1 : kThickBorderWidth);

    // We are using FCS M2 buttons, styled in M3 fashion.
    if (!useMaterial3) {
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

    /// Popup menu elevation.
    ///
    /// If not defined, then if [useMaterial3] is:
    /// - false : defaults to 8 dp.
    /// - true  : defaults to 3 dp.
    /// Usually they are the same.
    final double? elevation,

    /// The background color of the popup menu.
    ///
    /// If not defined, then if [useMaterial3] is:
    /// - false : defaults to theme.cardColor.
    /// - true  : defaults to theme.colorScheme.surface.
    /// Usually they are the same.
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

  /// An opinionated [SliderThemeData] theme.
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

    /// The color given to the [valueIndicatorShape] to draw itself with.
    ///
    /// If undefined, defaults to using Flutter SDK's logic for the color.
    final Color? valueIndicatorColor,

    /// The text style for the text on the value indicator.
    ///
    /// If undefined, defaults to using Flutter SDK's logic for the TextStyle.
    final TextStyle? valueIndicatorTextStyle,
  }) {
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);
    final Color onBaseColor =
        schemeColorPair(baseSchemeColor ?? SchemeColor.primary, colorScheme);

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
      valueIndicatorColor: valueIndicatorColor,
      valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
      valueIndicatorTextStyle: valueIndicatorTextStyle,
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

    /// The background color of the themed SnackBar. Typically one of inverse
    /// brightness compared to theme's surface color brightness.
    ///
    /// If null, then FlexColorScheme (FCS) sets own default when used via
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
    /// [backgroundColor] will be used, which may be null too and SnackBar then
    /// falls back Flutter defaults.
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

    // TODO(rydmike): Maybe add customization of action and close colors.
    return SnackBarThemeData(
      elevation: elevation ?? kSnackBarElevation,
      backgroundColor: background,
      contentTextStyle: snackTextStyle,
      actionTextColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        return foreground?.withAlpha(0xDD) ?? Colors.grey;
      }),
      disabledActionTextColor: foreground?.withAlpha(0x11),
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
    /// Defaults to false.
    final bool unselectedIsColored = false,

    /// A temporary flag used to opt-in to new Material 3 features.
    final bool useMaterial3 = false,
  }) {
    // Get colorScheme brightness.
    final bool isLight = colorScheme.brightness == Brightness.light;
    // Get selected base color, and its pair, defaults to primary and onPrimary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    final Color onBaseColor =
        schemeColorPair(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // Get selected thumb color, and its pair, defaults to
    // M2: primary and onPrimary.
    // M3: primaryContainer and onPrimaryContainer
    final Color thumbColor = schemeColor(
        thumbSchemeColor ??
            (useMaterial3
                ? SchemeColor.primaryContainer
                : baseSchemeColor ?? SchemeColor.primary),
        colorScheme);

    if (!useMaterial3) {
      return SwitchThemeData(
        splashRadius: splashRadius,
        thumbColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
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
              return isLight ? Colors.black12 : Colors.white10;
            }
            if (states.contains(MaterialState.selected)) {
              return baseColor.withAlpha(isLight ? 0x70 : 0x80);
            }
            // Opinionated color on track when not selected
            if (unselectedIsColored) {
              return baseColor.withAlpha(isLight ? 0x50 : 0x65);
            }
            // This is SDK default.
            return isLight ? const Color(0x52000000) : Colors.white30;
          },
        ),
      );
    } else {
      return SwitchThemeData(
        thumbColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.surface.withOpacity(1.0);
            }
            return colorScheme.onSurface.withOpacity(0.38);
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
              return colorScheme.onSurface.withOpacity(0.12);
            }
            return colorScheme.surfaceVariant.withOpacity(0.12);
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
            return unselectedIsColored
                ? baseColor.withAlpha(isLight ? 0x33 : 0x44)
                : colorScheme.surfaceVariant;
          }
          if (states.contains(MaterialState.hovered)) {
            return unselectedIsColored
                ? baseColor.withAlpha(isLight ? 0x33 : 0x44)
                : colorScheme.surfaceVariant;
          }
          if (states.contains(MaterialState.focused)) {
            return unselectedIsColored
                ? baseColor.withAlpha(isLight ? 0x33 : 0x44)
                : colorScheme.surfaceVariant;
          }
          return unselectedIsColored
              ? baseColor.withAlpha(isLight ? 0x33 : 0x44)
              : colorScheme.surfaceVariant;
        }),
        overlayColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.pressed)) {
              return baseColor.withOpacity(0.12);
            }
            if (states.contains(MaterialState.hovered)) {
              return baseColor.withOpacity(0.08);
            }
            if (states.contains(MaterialState.focused)) {
              return baseColor.withOpacity(0.12);
            }
            return null;
          }
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.onSurface.withOpacity(0.08);
          }
          if (states.contains(MaterialState.focused)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }
          return null;
        }),
      );
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

    /// A temporary flag used to opt-in to new Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated defaults values.
    ///
    /// The M2/M3 SDK defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    final bool useMaterial3 = false,
  }) {
    // Get selected color, defaults to primary.
    final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

    // We are using FCS M2 buttons, styled in M3 fashion.
    if (!useMaterial3) {
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
      elevation: elevation ?? kDialogElevation,
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

    /// A temporary flag used to opt-in to new Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated defaults values.
    ///
    /// The M2/M3 SDK defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    final bool useMaterial3 = false,
  }) {
    // Get selected color, defaults to primary.
    final SchemeColor baseScheme = baseSchemeColor ?? SchemeColor.primary;
    final Color baseColor = schemeColor(baseScheme, colorScheme);
    final Color onBaseColor = schemeColorPair(baseScheme, colorScheme);

    // Effective minimum button size.
    final Size effectiveMinButtonSize = minButtonSize ?? kButtonMinSize;
    // Effective border width, default different with M3.
    final double effectiveWidth =
        borderWidth ?? (useMaterial3 ? 1.0 : kThinBorderWidth);
    // Effective visual density.
    final VisualDensity usedVisualDensity =
        visualDensity ?? VisualDensity.adaptivePlatformDensity;
    return ToggleButtonsThemeData(
      borderWidth: effectiveWidth,
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
    /// If backgroundSchemeColor is defined, its Scheme color pair will be
    /// used instead.
    final Color? foregroundColor,

    /// Alpha value for the background color.
    ///
    /// If not defined, default to 0xFF, fully opaque.
    final int? backgroundAlpha,

    /// The border radius of the tooltip.
    ///
    /// If not defined, defaults to 4.
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
    /// If this property is null, the default margin is
    /// 0.0 logical pixels on all sides.
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
