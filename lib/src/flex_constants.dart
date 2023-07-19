import 'package:flutter/material.dart';

// ignore_for_file: comment_references

// Constants used when FCS computes generated colors from primary color.
//
// This is FCS way of creating "seed generated" ColorSchemes, it was used before
// the seed generation algorithm existed in Flutter. It still works well as an
// alternative look. It creates a more M2 colored look, but applied to M3
// ColorScheme, in a way compatible with both M2 and M3 color system.

/// The percentage amount the primary container color is darkened from the
/// primary color when primary container color is not given.
const int kDarkenPrimaryContainer = 10;

/// The percentage amount the secondary color is darkened from the
/// primary color when secondary color is not given.
const int kDarkenSecondary = 5;

/// The percentage amount the secondary container color is darkened from the
/// secondary color, when secondary container color is not given, but the
/// secondary color is given.
const int kDarkenSecondaryContainerFromSecondary = 10;

/// The percentage amount the secondary container color is darkened from the
/// primary color, when secondary container color and secondary color are not
/// given.
const int kDarkenSecondaryContainer = 14;

// Component defaults, typically elevation and radius.
//
// Listed in alphabetical order.

/// Default border radius on top edge of bottom sheet.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/bottom-sheets/specs
const double kBottomSheetBorderRadius = 28;

/// Default for elevation of [BottomNavigationBar].
///
/// Changed in version 7.2.0 to 3, in order to bring default elevation
/// of BottomNavigationBar and NavigationBar to same value in M3.
const double kBottomNavigationBarElevation = 3;

/// Default elevation of none modal Material 3 [BottomSheet].
///
/// Based https://m3.material.io/components/bottom-sheets/specs
/// and https://m3.material.io/styles/elevation/tokens
///
/// M2 spec did not specify a value Nov 9,. 2022. FCS uses 1,
/// and uses 2 for modal version to make them different.
const double kBottomSheetElevation = 1;

/// Default elevation of none modal Material 2 [BottomSheet].
///
/// This is FCS default when opting in on opinionated component sub-themes
/// but not opting in on using Material 3.
const double kBottomSheetElevationM2 = 4;

/// Default elevation of modal Material 3 [BottomSheet].
///
/// Based https://m3.material.io/components/bottom-sheets/specs
/// and https://m3.material.io/styles/elevation/tokens
///
/// Spec says 1, but FCS uses 2, and uses 1 for none modal
/// version.
const double kBottomSheetModalElevation = 2;

/// Default for elevation of modal Material 2 [BottomSheet].
///
/// This is FCS default when opting in on opinionated component sub-themes
/// but not opting in on using Material 3.
const double kBottomSheetModalElevationM2 = 8;

/// Default minimum button size.
///
/// Applies to [TextButton], [ElevatedButton], [OutlinedButton] and
/// [ToggleButtons].
///
/// The values results in width 40 and height 40.
/// The Material guide 3 specifies width 48 and height 40. This is an
/// opinionated choice in order to make ToggleButtons min size squared.
const Size kButtonMinSize =
    Size(kMinInteractiveDimension - 8, kMinInteractiveDimension - 8);

/// Default padding on legacy buttons.
///
/// This padding is used on `ButtonThemeData` for legacy `RaisedButton`,
/// `OutlineButton` and `FlatButton` making the look like the default
/// padding used on [TextButton], [ElevatedButton] and [OutlinedButton]
/// whe style with `styleFrom`.
const EdgeInsetsGeometry kButtonPadding = EdgeInsets.symmetric(horizontal: 16);

/// Default border radius on all buttons.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/buttons/specs
///
/// Originally FCS used 20dp that was is from older M3 spec version when it was
/// using 20dp instead of Stadium. When it later changed to Stadium the radius
/// for FCS M2 buttons was in version 7.2 changed to use 40 dp radius as an M3
/// visual matching default for buttons in M2, since it for most used sizes will
/// result in a Stadium border as well.
///
/// By default FCS uses Stadium border on buttons in M3 mode if not specified.
const double kButtonRadius = 40;

/// Default border radius on Card.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/cards/specs
const double kCardRadius = 12;

/// Default border radius on Chips.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/chips/specs
const double kChipRadius = 8;

/// Default elevation of [Dialog].
///
/// Based on https://m3.material.io/components/dialogs/specs
/// and https://m3.material.io/styles/elevation/tokens
/// and Flutter M3 implementation.
const double kDialogElevation = 6;

/// Default border radius on dialogs.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/dialogs/specs
const double kDialogRadius = 28;

/// Default border radius on Navigation drawer menu.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/navigation-drawer/specs
const double kDrawerRadius = 16;

/// Default for elevation of [ElevatedButton].
///
/// Based on https://m3.material.io/components/buttons/specs
/// and https://m3.material.io/styles/elevation/tokens
const double kElevatedButtonElevation = 1;

/// Default border radius on Floating Action Buttons.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/floating-action-button/specs
const double kFabRadius = 16;

/// Default border radius on input decoration when using
/// opinionated component themes in M3 mode.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/text-fields/specs
const double kInputDecoratorM3Radius = 4;

/// Default border radius on input decoration when using
/// opinionated component themes in M2 mode.
///
/// Using a more rounded design 10dp, instead of 4dp which is M3's default.
/// https://m3.material.io/components/text-fields/specs
const double kInputDecoratorRadius = 10;

/// Alpha value for the indicator color on the [NavigationBar] and
/// [NavigationRail].
///
/// The value is the same as Flutter SDK uses in Material 2. Material 3 may
/// often use no alpha and just different solid color hue instead.
///
/// Value: 0x3D = 61 = 24%
const int kNavigationBarIndicatorAlpha = 0x3D;

/// The width of a Material 2 Drawer.
///
/// Found in Flutter source code.
const double kNavigationDrawerM2Width = 304;

/// The width of a Material 3 Drawer.
///
/// From M3 spec https://m3.material.io/components/navigation-drawer/specs
const double kNavigationDrawerM3Width = 360;

/// The edge padding on start and end side of the indicator of
/// the indicator in a Material 3 Drawer.
///
/// From M3 spec https://m3.material.io/components/navigation-drawer/specs
const double kNavigationDrawerIndicatorPadding = 12;

/// Default for elevation of [NavigationRail].
///
/// M3 based https://m3.material.io/components/snackbar/specs
/// and https://m3.material.io/styles/elevation/tokens.
const double kNavigationRailElevation = 0;

/// Default elevation of [PopupMenuButton] in Material 3.
///
/// Based on https://m3.material.io/components/menus/specs
/// and https://m3.material.io/styles/elevation/tokens
const double kPopupMenuM3Elevation = 3;

/// Default elevation of [PopupMenuButton] in Material 2 mode.
///
/// Opinionated value, M2 spec is 8.
const double kPopupMenuM2Elevation = 6;

/// Default for elevation of [SnackBar].
///
/// M3 uses https://m3.material.io/components/snackbar/specs
/// and https://m3.material.io/styles/elevation/tokens, level 3 which is 6 dp.
///
/// FCS thinks it is too high and uses opinionated style 4.
const double kSnackBarElevation = 4;

/// Default width of thick outline borders.
///
/// Applies to pressed [OutlinedButton] border and selected
/// state of [InputDecorator] border.
const double kThickBorderWidth = 2;

/// Default width of thin outline borders.
///
/// Applies to disabled [OutlinedButton] border and to un-selected state of
/// [InputDecorator] when using [OutlineInputBorder], and to all states of
/// [ToggleButtons].
const double kThinBorderWidth = 1;

/// Default border radius on time entry elements in [TimePicker] dialog.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/time-pickers/specs.
const double kTimeElementRadius = 8;

/// Default border radius on [Tooltip].
///
/// The border radius on tooltips when opting on on sub-themes.
///
/// Flutter SDK defaults to 4, FCS uses 8 as default.
/// It can be changed via API.
const double kTooltipRadius = 8;

// Alpha, opacity and bland constant values.
//
// Used for disable, hover, focus and background color adjustments by menu
// components. Values are based on values from M2 and M3 as used
// in Flutter, but in some cases FCS also uses own opinionated values.
//
// Some of the values below for all the effects opacities and alpha blends are
// tricky. Getting them just right is magic and dark arts plus some pixie dust.
// These are the values I settled on for the opinionated themes.

/// Fill color alpha value for [InputDecorator] used by FlexColorScheme
/// in light theme for M2 defaults.
///
/// Value: 0x0D = 13 = 5%
const int kFillColorAlphaLight = 0x0D;

/// Fill color alpha value for [InputDecorator] used by FlexColorScheme
/// in dark theme for M2 defaults.
///
/// Value: 0x14 = 20 = 8%
const int kFillColorAlphaDark = 0x14;

/// Enabled border alpha value on border sides.
///
/// Used on opt in sub-themes by [InputDecorator] in M2 mode.
///
/// Value: 0xA7 = 167 = 65%
const int kEnabledBorderAlpha = 0xA7;

/// The surface color alpha blend, for primary colored Chip background.
///
/// Used in FCS opinionated M2 mode Chip design, a mix of M2 and M3 look.
///
/// Value: 0xCC = 204 = 80%
const int kChipBackgroundAlphaBlend = 0xCC;

/// The surface color alpha blend, for primary colored selected Chip background.
///
/// Used in FCS opinionated M2 mode Chip design, a mix of M2 and M3 look.
///
/// Value: 0x96 = 150 = 59%
const int kChipSelectedBackgroundAlphaBlend = 0x96;

/// The onBackground primary alpha blend value for an unselected item, typically
/// an icon in a TabBar, BottomNavigationBar, NavigationBar or NavigationRail.
///
/// Value: 0x66 = 102 = 40%
const int kUnselectedBackgroundPrimaryAlphaBlend = 0x66;

/// The alpha value for an unselected item, typically an icon or text
/// in a TabBar, BottomNavigationBar, NavigationBar or NavigationRail.
///
/// Value: 0xA5 = 165 = 65%
const int kUnselectedAlphaBlend = 0xA5;

// The v7 new tinted interactions effects and disable constants start here.
// -----------------------------------------------------------------------------

/// The amount of alpha blend used on tinted hover effect that is blended
/// into overlay color.
///
/// Value: 0x99 = 153 = 60%
const int kTintHover = 0x99;

/// The amount of alpha based opacity used on tinted hover effect.
///
/// Same value as used on Hover opacity on controls in M3, given as alpha.
///
/// Value: 0x14 = 20 = 8%
const int kAlphaHovered = 0x14;

/// The amount of alpha blend used on tinted highlight effect that is blended
/// into overlay color.
///
/// Value: 0xA5 = 165 = 65%
const int kTintHighlight = 0xA5;

/// The amount of alpha based opacity used on tinted highlight effect.
///
/// Same value as used on Hover opacity on controls in M3, given as alpha.
///
/// Value: 0x14 = 20 = 8%
const int kAlphaHighlight = 0x14;

/// The amount of alpha blend used on tinted pressed effect that is blended
/// into overlay color.
///
/// Value: 0xA5 = 165 = 65%
const int kTintPressed = 0xA5;

/// The amount of alpha based opacity used on tinted pressed effect.
///
/// Same value as used on pressed opacity on controls in M3, given as alpha.
///
/// Value: 0x1F = 31 = 12.16%
const int kAlphaPressed = 0x1F;

/// The amount of alpha blend used on tinted splash effect that is blended
/// into overlay color.
///
/// Value: 0xA5 = 165 = 65%
const int kTintSplash = 0xA5;

/// The amount of alpha based opacity used on tinted splash effect.
///
/// Same value as used on pressed opacity on controls in M3, given as alpha.
///
/// Value: 0x1F = 31 = 12.16%
const int kAlphaSplash = 0x1F;

/// The amount of alpha blend used on tinted focus effect that is blended
/// into overlay color.
///
/// Value: 0xB2 = 178 = 70%
const int kTintFocus = 0xB2;

/// The amount of alpha based opacity used on tinted focus effect.
///
/// Same value as used on focused opacity on controls in M3, given as alpha.
///
/// Value: 0x1F = 31 = 12.16%
const int kAlphaFocused = 0x1F;

/// The amount of alpha blend used on tinted disabled effect that is blended
/// into overlay color.
///
/// Value: 0x66 = 102 = 40%
const int kTintDisabled = 0x66;

/// The amount of alpha based opacity used on tinted disabled effect.
///
/// Same value as used on focused opacity on controls in M3, given as alpha.
///
/// Value: 0x61 = 97 = 38.04%
const int kAlphaDisabled = 0x61;

/// An optional medium amount of alpha based opacity used on disabled
/// components.
///
/// This is used e.g. on Slider disabledActiveTrackColor.
///
/// Value: 0x52 = 82 = 32.16%
const int kAlphaMediumDisabled = 0x52;

/// An optional lower amount of alpha based opacity used on disabled components.
///
/// This is used e.g. on M2 switch thumb color.
///
/// Value: 0x3D = 61 = 24%
const int kAlphaLowDisabled = 0x3D;

/// An optional lower amount of alpha based opacity used on tinted disabled
/// effect.
///
/// This is used e.g. on disabled M2 switch track color, and M3 disabled track
/// and disabled trackOutline color.
///
/// Value: 0x1F = 31 = 12.16%
const int kAlphaVeryLowDisabled = 0x1F;

/// An optional ultra low amount of alpha based opacity used on tinted disabled
/// effect.
///
/// This is used e.g. on disabled M3 spec InputDecorator fill.
///
/// Value: 0x0A = 10 = 3.92%%
const int kAlphaUltraLowDisabled = 0x0A;

/// Default Color of disabled M2 Switch track color in M2
///
/// This is hard coded in the SDK, but adding a const for it for easier
/// mod if it would ever change.
const Color kSwitchM2LightTrackColor = Color(0x52000000);

/// Unselected colored Checkbox, Radio alpha value.
///
/// Value: 0xDD = 221 = 86.67%
const int kAlphaUnselect = 0xDD;

/// Switch in M2 mode selected light mode alpha.
///
/// Value: 0x70 = 112 = 43.92%
const int kAlphaM2SwitchTrackLight = 0x70;

/// Switch in M2 mode selected dark mode alpha.
///
/// Value: 0x80 = 128 = 50.20%
const int kAlphaM2SwitchTrackDark = 0x80;

/// Switch in M2 mode unselected light mode alpha.
///
/// Value: 0x50 = 80 = 31.37%
const int kAlphaM2SwitchUnselectTrackLight = 0x50;

/// Switch in M2 mode unselected dark mode alpha.
///
/// Value: 0x65 = 101 = 39.61%
const int kAlphaM2SwitchUnselectTrackDark = 0x65;

/// Switch in M3 mode unselected light mode alpha.
///
/// Value: 0x33 = 51 = 20.00%
const int kAlphaM3SwitchUnselectTrackLight = 0x33;

/// Switch in M3 mode unselected dark mode alpha.
///
/// Value: 0x44 = 68 = 26.67%
const int kAlphaM3SwitchUnselectTrackDark = 0x44;

/// Tick mark alpha for Slider and RangeSlider.
///
/// Value: 0x8A = 138 = 54.12%
const int kAlphaSliderTickMark = 0x8A;

/// Input decorator light color decorator background color, hover mode
/// darken level percentage.
///
/// Value: 3
const int kInputDecoratorLightBgDarken = 3;

/// Input decorator dark color decorator background color, hover mode
/// lighten level percentage.
///
/// Value: 3
const int kInputDecoratorDarkBgLighten = 5;

// The v7.1 Blended TextTheme magic values moved to constants
// -----------------------------------------------------------------------------

// Normal TextTheme

/// High blended light TextTheme alpha blend %
///
/// Value: 20
const int kHiLightTextBlend = 20;

/// High blended dark TextTheme alpha blend %
///
/// Value: 15
const int kHiDarkTextBlend = 15;

/// Medium blended light TextTheme alpha blend %
///
/// Value: 20
const int kMedLightTextBlend = 20;

/// Medium blended dark TextTheme alpha blend %
///
/// Value: 15
const int kMedDarkTextBlend = 12;

/// Low blended light TextTheme alpha blend %
///
/// Value: 23
const int kLoLightTextBlend = 23;

/// Low blended dark TextTheme alpha blend %
///
/// Value: 15
const int kLoDarkTextBlend = 15;

/// High blended light TextTheme alpha value
///
/// Value: 0xD8 = 85%
const int kHiLightTextAlpha = 0xD8;

/// High blended dark TextTheme alpha value
///
/// Value: 0xE2 = 92%
const int kHiDarkTextAlpha = 0xE2;

/// Medium blended light TextTheme alpha value
///
/// Value: 0xF4 = 96%
const int kMedLightTextAlpha = 0xF4;

/// Medium blended dark TextTheme alpha value
///
/// Value: 0xFF = 100%
const int kMedDarkTextAlpha = 0xFF;

/// Low blended light TextTheme alpha value
///
/// Value: 0xFF = 100%
const int kLoLightTextAlpha = 0xFF;

/// Low blended dark TextTheme alpha value
///
/// Value: 0xFF = 100%
const int kLoDarkTextAlpha = 0xFF;

// Primary TextTheme

/// High blended light PrimaryTextTheme alpha blend %
///
/// Value: 10
const int kHiLightPrimTextBlend = 10;

/// High blended dark PrimaryTextTheme alpha blend %
///
/// Value: 10
const int kHiDarkPrimTextBlend = 10;

/// Medium blended light PrimaryTextTheme alpha blend %
///
/// Value: 5
const int kMedLightPrimTextBlend = 5;

/// Medium blended dark PrimaryTextTheme alpha blend %
///
/// Value: 9
const int kMedDarkPrimTextBlend = 9;

/// Low blended light PrimaryTextTheme alpha blend %
///
/// Value: 4
const int kLoLightPrimTextBlend = 4;

/// Low blended dark PrimaryTextTheme alpha blend %
///
/// Value: 7
const int kLoDarkPrimTextBlend = 7;

/// High blended light PrimaryTextTheme alpha value
///
/// Value: 0xD8 = 85%
const int kHiLightPrimTextAlpha = 0xD8;

/// High blended dark PrimaryTextTheme alpha value
///
/// Value: 0xE5 = 90%
const int kHiDarkPrimTextAlpha = 0xE5;

/// Medium blended light PrimaryTextTheme alpha value
///
/// Value: 0xF2 = 95%
const int kMedLightPrimTextAlpha = 0xF2;

/// Medium blended dark PrimaryTextTheme alpha value
///
/// Value: 0xFF = 100%
const int kMedDarkPrimTextAlpha = 0xFF;

/// Low blended light PrimaryTextTheme alpha value
///
/// Value: 0xFF = 100%
const int kLoLightPrimTextAlpha = 0xFF;

/// Low blended dark PrimaryTextTheme alpha value
///
/// Value: 0xFF = 100%
const int kLoDarkPrimTextAlpha = 0xFF;

// Version 7.2 new const properties
// -----------------------------------------------------------------------------

/// Opacity on selected text applied to text selection color by default in
/// [FlexSubThemes.textSelectionTheme].
///
/// This is also what Flutter framework 3.10 uses as hardcoded default value in
/// Material. In Cupertino app it seems to be 0.2.
///
/// Value: 0.4 = 40%
const double kTextSelectionOpacity = 0.4;

/// Opacity on selected text applied to text selection color by default in
/// [FlexColorScheme.subThemesData] in light mode.
///
/// Value: 0.3 = 30%
const double kTextSelectionLightOpacity = 0.3;

/// Opacity on selected text applied to text selection color by default in
/// [FlexColorScheme.subThemesData] in dark mode.
///
/// Value: 0.5 = 50%
const double kTextSelectionDarkOpacity = 0.5;
