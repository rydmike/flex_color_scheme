import 'package:flutter/material.dart';

import '../flex_color_scheme.dart' show FlexColorScheme; // For comment refs.
import 'flex_sub_themes.dart' show FlexSubThemes; // For comment refs.

// These constants are not exported by FlexColorScheme, they are only used
// internally and in some document comments as reference information of
// default values.
//
// These constants do also have tests, mainly to prevent accidental
// changes that could break the produced styles. Occasionally these values may
// need to be changed as Material styles evolve. Such changes are treated as
// style breaking changes. Flutter SDK breaks defaults left and right without
// even reporting them.

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

/// Float version of the alpha value [kNavigationBarIndicatorAlpha].
const double kNavigationBarIndicatorAlphaFloat = 0x3D / 255;

/// The width of a Material 2 Drawer.
///
/// Found in Flutter source code.
const double kNavigationDrawerM2Width = 304;

/// The width of a Material 3 Drawer.
///
/// The M3 spec https://m3.material.io/components/navigation-drawer/specs
/// says the width should 360dp, but Flutter still uses M2 spec 304dp as
/// default width.
///
/// FCS v8.0.0 was revised to default to 304 M2 width in M3 mode as well.
/// Using 360dp is actually a bit too wide for most phones.
/// For more info see issue: https://github.com/flutter/flutter/issues/123380
const double kNavigationDrawerM3Width = kNavigationDrawerM2Width;

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

/// Default border radius on time entry elements in [TimePickerDialog] dialog.
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

// Alpha, opacity and blend constant values.
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
const double kFillColorLightOpacity = 0x0D / 255;

/// Fill color alpha value for [InputDecorator] used by FlexColorScheme
/// in dark theme for M2 defaults.
///
/// Value: 0x14 = 20 = 8%
const double kFillColorDarkOpacity = 0x14 / 255;

/// Enabled border alpha value on border sides.
///
/// Used on opt in sub-themes by [InputDecorator] in M2 mode.
/// And when unfocused border uses color in M3 mode too. Creates a slight
/// diff when it receives focus, even if unfocused color is based on
/// a color used for focus. Error focus/unfocus color also uses this alpha.
///
/// Value: 0xA7 = 167 = 65%
const double kEnabledBorderOpacity = 0xA7 / 255;

/// The surface color alpha blend, for primary colored Chip background.
///
/// Used in FCS opinionated M2 mode Chip design, a mix of M2 and M3 look.
///
/// Value: 0xCC = 204 = 80%
const int kChipBackgroundAlphaBlend = 0xCC;

/// Float version of [kChipBackgroundAlphaBlend].
const double kChipBackgroundAlphaBlendFloat = 0xCC / 255;

/// The surface color alpha blend, for primary colored selected Chip background.
///
/// Used in FCS opinionated M2 mode Chip design, a mix of M2 and M3 look.
///
/// Value: 0x96 = 150 = 59%
const int kChipSelectedBackgroundAlphaBlend = 0x96;

/// Float version of [kChipSelectedBackgroundAlphaBlend].
const double kChipSelectedBackgroundAlphaBlendFloat = 0x96 / 255;

/// The onBackground primary alpha blend value for an unselected item, typically
/// an icon in a TabBar, BottomNavigationBar, NavigationBar or NavigationRail.
///
/// Value: 0x66 = 102 = 40%
const int kUnselectedBackgroundPrimaryAlphaBlend = 0x66;

/// Float version of [kUnselectedBackgroundPrimaryAlphaBlend].
const double kUnselectedBackgroundPrimaryAlphaBlendFloat = 0x66 / 255;

/// The alpha value for an unselected item, typically an icon or text
/// in a TabBar, BottomNavigationBar, NavigationBar or NavigationRail.
///
/// Value: 0xA5 = 165 = 65%
const int kUnselectedAlphaBlend = 0xA5;

/// Float version of [kUnselectedAlphaBlend].
const double kUnselectedAlphaBlendFloat = 0xA5 / 255;

// The v7 new tinted interactions effects and disable constants start here.
// -----------------------------------------------------------------------------

/// The amount of alpha blend used on tinted hover effect that is blended
/// into overlay color.
///
/// Value: 0xB2 = 178 = 69.8%
const int kTintHover = 0xB2;

/// Float version of [kTintHover].
const double kTintHoverFloat = 0xB2 / 255;

/// The amount of alpha based opacity used on standard hover effect.
///
/// Same value as used on Hover opacity on controls in M3, given as alpha.
///
/// Value: 0x14 = 20 = 8%
const int kAlphaHovered = 0x14;

/// Float version of [kAlphaHovered].
const double kAlphaHoveredFloat = 0x14 / 255;

/// The amount of alpha based opacity used on tinted hover effect.
///
/// Value: 0x11 = 17 = 6.7%
const int kAlphaTintedHovered = 0x11;

/// Float version of [kAlphaTintedHovered].
const double kAlphaTintedHoveredFloat = 0x11 / 255;

/// The amount of alpha blend used on tinted highlight effect that is blended
/// into overlay color.
///
/// Value: 0xA5 = 165 = 65%
const int kTintHighlight = 0xA5;

/// Float version of [kTintHighlight].
const double kTintHighlightFloat = 0xA5 / 255;

/// The amount of alpha based opacity used on standard highlight effect.
///
/// Same value as used on Hover opacity on controls in M3, given as alpha.
///
/// Value: 0x14 = 20 = 8%
const int kAlphaHighlight = 0x14;

/// Float version of [kAlphaHighlight].
const double kAlphaHighlightFloat = 0x14 / 255;

/// The amount of alpha based opacity used on tinted highlight effect.
///
/// Value: 0x0F = 15 = 5.9%
const int kAlphaTintedHighlight = 0x0F;

/// Float version of [kAlphaTintedHighlight].
const double kAlphaTintedHighlightFloat = 0x0F / 255;

/// The amount of alpha blend used on tinted pressed effect that is blended
/// into overlay color.
///
/// Value: 0xA5 = 165 = 65%
const int kTintPressed = 0xA5;

/// Float version of [kTintPressed].
const double kTintPressedFloat = 0xA5 / 255;

/// The amount of alpha based opacity used on standard pressed effect.
///
/// Same value as used on pressed opacity on controls in M3, given as alpha.
///
/// Value: 0x1F = 31 = 12.16%
const int kAlphaPressed = 0x1F;

/// Float version of [kAlphaPressed].
const double kAlphaPressedFloat = 0x1F / 255;

/// The amount of alpha based opacity used on tinted pressed effect.
///
/// Value: 0x10 = 16 = 6.3%
const int kAlphaTintPressed = 0x10;

/// Float version of [kAlphaTintPressed].
const double kAlphaTintPressedFloat = 0x10 / 255;

/// The amount of alpha based opacity used on tinted input pressed effect,
/// like SearchBar.
///
/// Same value as used on pressed opacity on controls in M3, given as alpha.
/// This value was added in Version 8.0.0.
///
/// Value: 0x19 = 25 = 10% = 0.1
const int kAlphaInputPressed = 0x19;

/// Float version of [kAlphaInputPressed].
const double kAlphaInputPressedFloat = 0x19 / 255;

/// The amount of alpha blend used on tinted splash effect that is blended
/// into overlay color.
///
/// Value: 0xA5 = 165 = 65%
const int kTintSplash = 0xA5;

/// Float version of [kTintSplash].
const double kTintSplashFloat = 0xA5 / 255;

/// The amount of alpha based opacity used on standard splash effect.
///
/// Same value as used on pressed opacity on controls in M3, given as alpha.
///
/// Value: 0x1F = 31 = 12.16%
const int kAlphaSplash = 0x1F;

/// Float version of [kAlphaSplash].
const double kAlphaSplashFloat = 0x1F / 255;

/// The amount of alpha based opacity used on tinted splash effect.
///
/// Value: 0x10 = 16 = 6.3%
const int kAlphaTintSplash = 0x10;

/// Float version of [kAlphaTintSplash].
const double kAlphaTintSplashFloat = 0x10 / 255;

/// The amount of alpha blend used on tinted focus effect that is blended
/// into overlay color.
///
/// Value: 0xB2 = 178 = 70%
const int kTintFocus = 0xB2;

/// Float version of [kTintFocus].
const double kTintFocusFloat = 0xB2 / 255;

/// The amount of alpha based opacity used on standard focus effect.
///
/// Same value as used on focused opacity on controls in M3, given as alpha.
///
/// Value: 0x1F = 31 = 12.16%
const int kAlphaFocused = 0x1F;

/// Float version of [kAlphaFocused].
const double kAlphaFocusedFloat = 0x1F / 255;

/// The amount of alpha based opacity used on tinted focus effect.
///
/// Value: 0x1C = 28 = 11%
const int kAlphaTintFocused = 0x1C;

/// Float version of [kAlphaTintFocused].
const double kAlphaTintFocusedFloat = 0x1C / 255;

/// The amount of alpha blend used on tinted disabled effect that is blended
/// into overlay color.
///
/// Value: 0x66 = 102 = 40%
const int kTintDisabled = 0x66;

/// Float version of [kTintDisabled].
const double kTintDisabledFloat = 0x66 / 255;

/// The amount of alpha based opacity used on tinted disabled effect.
///
/// Same value as used on focused opacity on controls in M3, given as alpha.
///
/// Value: 0x61 = 97 = 38.04%
const int kAlphaDisabled = 0x61;

/// Float version of [kAlphaDisabled].
const double kAlphaDisabledFloat = 0x61 / 255;

/// An optional medium amount of alpha based opacity used on disabled
/// components.
///
/// This is used e.g. on Slider disabledActiveTrackColor.
///
/// Value: 0x52 = 82 = 32.16%
const int kAlphaMediumDisabled = 0x52;

/// Float version of [kAlphaMediumDisabled].
const double kAlphaMediumDisabledFloat = 0x52 / 255;

/// An optional lower amount of alpha based opacity used on disabled components.
///
/// This is used e.g. on M2 switch thumb color.
///
/// Value: 0x3D = 61 = 24%
const int kAlphaLowDisabled = 0x3D;

/// Float version of [kAlphaLowDisabled].
const double kAlphaLowDisabledFloat = 0x3D / 255;

/// An optional lower amount of alpha based opacity used on tinted disabled
/// effect.
///
/// This is used e.g. on disabled M2 switch track color, and M3 disabled track
/// and disabled trackOutline color.
///
/// Value: 0x1F = 31 = 12.16%
const int kAlphaVeryLowDisabled = 0x1F;

/// Float version of [kAlphaVeryLowDisabled].
const double kAlphaVeryLowDisabledFloat = 0x1F / 255;

/// An optional ultra low amount of alpha based opacity used on tinted disabled
/// effect.
///
/// This is used e.g. on disabled M3 spec InputDecorator fill.
///
/// Value: 0x0A = 10 = 3.92%%
const int kAlphaUltraLowDisabled = 0x0A;

/// Float version of [kAlphaUltraLowDisabled].
const double kAlphaUltraLowDisabledFloat = 0x0A / 255;

/// Default Color of disabled M2 Switch track color in M2
///
/// This is hard coded in the SDK, but adding a const for it for easier
/// mod if it would ever change.
const Color kSwitchM2LightTrackColor = Color(0x52000000);

/// Unselected colored Checkbox, Radio alpha value.
///
/// Value: 0xDD = 221 = 86.67%
const int kAlphaUnselect = 0xDD;

/// Float version of [kAlphaUnselect].
const double kAlphaUnselectFloat = 0xDD / 255;

/// Switch in M2 mode selected light mode alpha.
///
/// Value: 0x70 = 112 = 43.92%
const int kAlphaM2SwitchTrackLight = 0x70;

/// Float version of [kAlphaM2SwitchTrackLight].
const double kAlphaM2SwitchTrackLightFloat = 0x70 / 255;

/// Switch in M2 mode selected dark mode alpha.
///
/// Value: 0x80 = 128 = 50.20%
const int kAlphaM2SwitchTrackDark = 0x80;

/// Float version of [kAlphaM2SwitchTrackDark].
const double kAlphaM2SwitchTrackDarkFloat = 0x80 / 255;

/// Switch in M2 mode unselected light mode alpha.
///
/// Value: 0x50 = 80 = 31.37%
const int kAlphaM2SwitchUnselectTrackLight = 0x50;

/// Float version of [kAlphaM2SwitchUnselectTrackLight].
const double kAlphaM2SwitchUnselectTrackLightFloat = 0x50 / 255;

/// Switch in M2 mode unselected dark mode alpha.
///
/// Value: 0x65 = 101 = 39.61%
const int kAlphaM2SwitchUnselectTrackDark = 0x65;

/// Float version of [kAlphaM2SwitchUnselectTrackDark].
const double kAlphaM2SwitchUnselectTrackDarkFloat = 0x65 / 255;

/// Switch in M3 mode unselected light mode alpha.
///
/// Value: 0x33 = 51 = 20.00%
const int kAlphaM3SwitchUnselectTrackLight = 0x33;

/// Float version of [kAlphaM3SwitchUnselectTrackLight].
const double kAlphaM3SwitchUnselectTrackLightFloat = 0x33 / 255;

/// Switch in M3 mode unselected dark mode alpha.
///
/// Value: 0x44 = 68 = 26.67%
const int kAlphaM3SwitchUnselectTrackDark = 0x44;

/// Float version of [kAlphaM3SwitchUnselectTrackDark].
const double kAlphaM3SwitchUnselectTrackDarkFloat = 0x44 / 255;

/// Tick mark alpha for Slider and RangeSlider.
///
/// Value: 0x8A = 138 = 54.12%
const int kAlphaSliderTickMark = 0x8A;

/// Float version of [kAlphaSliderTickMark].
const double kAlphaSliderTickMarkFloat = 0x8A / 255;

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

// The v7.1 Blended TextTheme magic values moved to constants.
// Blended text themes were deprecated in version 8.0.0.
// Keeping the constants around, no need to remove them, they are not used
// anymore, but they are still here for reference, will be tree shaken
// away by the compiler if they are not referenced.
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

/// Float version of [kHiLightTextAlpha].
const double kHiLightTextAlphaFloat = 0xD8 / 255;

/// High blended dark TextTheme alpha value
///
/// Value: 0xE2 = 92%
const int kHiDarkTextAlpha = 0xE2;

/// Float version of [kHiDarkTextAlpha].
const double kHiDarkTextAlphaFloat = 0xE2 / 255;

/// Medium blended light TextTheme alpha value
///
/// Value: 0xF4 = 96%
const int kMedLightTextAlpha = 0xF4;

/// Float version of [kMedLightTextAlpha].
const double kMedLightTextAlphaFloat = 0xF4 / 255;

/// Medium blended dark TextTheme alpha value
///
/// Value: 0xFF = 100%
const int kMedDarkTextAlpha = 0xFF;

/// Float version of [kMedDarkTextAlpha].
const double kMedDarkTextAlphaFloat = 0xFF / 255;

/// Low blended light TextTheme alpha value
///
/// Value: 0xFF = 100%
const int kLoLightTextAlpha = 0xFF;

/// Float version of [kLoLightTextAlpha].
const double kLoLightTextAlphaFloat = 0xFF / 255;

/// Low blended dark TextTheme alpha value
///
/// Value: 0xFF = 100%
const int kLoDarkTextAlpha = 0xFF;

/// Float version of [kLoDarkTextAlpha].
const double kLoDarkTextAlphaFloat = 0xFF / 255;

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

/// Float version of [kHiLightPrimTextAlpha].
const double kHiLightPrimTextAlphaFloat = 0xD8 / 255;

/// High blended dark PrimaryTextTheme alpha value
///
/// Value: 0xE5 = 90%
const int kHiDarkPrimTextAlpha = 0xE5;

/// Float version of [kHiDarkPrimTextAlpha].
const double kHiDarkPrimTextAlphaFloat = 0xE5 / 255;

/// Medium blended light PrimaryTextTheme alpha value
///
/// Value: 0xF2 = 95%
const int kMedLightPrimTextAlpha = 0xF2;

/// Float version of [kMedLightPrimTextAlpha].
const double kMedLightPrimTextAlphaFloat = 0xF2 / 255;

/// Medium blended dark PrimaryTextTheme alpha value
///
/// Value: 0xFF = 100%
const int kMedDarkPrimTextAlpha = 0xFF;

/// Float version of [kMedDarkPrimTextAlpha].
const double kMedDarkPrimTextAlphaFloat = 0xFF / 255;

/// Low blended light PrimaryTextTheme alpha value
///
/// Value: 0xFF = 100%
const int kLoLightPrimTextAlpha = 0xFF;

/// Float version of [kLoLightPrimTextAlpha].
const double kLoLightPrimTextAlphaFloat = 0xFF / 255;

/// Low blended dark PrimaryTextTheme alpha value
///
/// Value: 0xFF = 100%
const int kLoDarkPrimTextAlpha = 0xFF;

/// Float version of [kLoDarkPrimTextAlpha].
const double kLoDarkPrimTextAlphaFloat = 0xFF / 255;

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
/// [FlexColorScheme.light], `subThemesData` parameter in light mode.
///
/// Value: 0.3 = 30%
const double kTextSelectionLightOpacity = 0.3;

/// Opacity on selected text applied to text selection color by default in
/// [FlexColorScheme.dark], `subThemesData` parameter in dark mode.
///
/// Value: 0.5 = 50%
const double kTextSelectionDarkOpacity = 0.5;
