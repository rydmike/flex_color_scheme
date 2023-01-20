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
const double kBottomNavigationBarElevation = 0;

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
/// The 20dp was is from older M3 spec version when it was using 20dp instead
/// of Stadium. FCS M2 uses this as an M3 visual matching default for buttons.
/// By default FCS uses Stadium on buttons in M3 mode if not specified.
const double kButtonRadius = 20;

/// Default elevation on [Card] widgets.
///
/// Based on https://m3.material.io/components/cards/specs
/// and https://m3.material.io/styles/elevation/tokens
///
/// In M3 Elevated Card is level 1, 1 dp, the other Cards
/// Filled, Tonal and Outlined are Level 0 (0 dp). Since there in
/// Flutter is no constructor for the different types of Card
/// we default them all to 0 dp.
const double kCardElevation = 0;

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

/// Default border radius on input decoration when opting in on M3.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/text-fields/specs
const double kInputDecoratorM3Radius = 4;

/// Default border radius on input decoration when using
/// opinionated component themes.
///
/// Using a more rounded design 16dp, instead of 4dp which is M3's default.
/// https://m3.material.io/components/text-fields/specs
const double kInputDecoratorRadius = 16;

/// Default border radius on menus, typically small popup menus.
///
/// Follows Material M3 guide.
/// https://m3.material.io/components/menus/specs
const double kMenuRadius = 4;

/// Default height of [NavigationBar].
///
/// The Material 3 default design is 80dp, this is an opinionated reduced
/// container height default.
const double kNavigationBarHeight = 62;

/// Alpha value for the indicator color on the [NavigationBar] and
/// [NavigationRail].
///
/// The value is the same as Flutter SDK uses in Material 2. Material 3 may
/// often use no alpha and just different solid color hue instead.
///
/// Value: 0x3D = 61 = 24%
const int kNavigationBarIndicatorAlpha = 0x3D;

/// Default for elevation of [NavigationRail].
///
/// M3 based https://m3.material.io/components/snackbar/specs
/// and https://m3.material.io/styles/elevation/tokens.
const double kNavigationRailElevation = 0;

/// Default elevation of [PopupMenuButton] in Material 3.
///
/// Based on https://m3.material.io/components/menus/specs
/// and https://m3.material.io/styles/elevation/tokens
const double kPopupMenuElevation = 3;

/// Default elevation of [PopupMenuButton] in Material 2 mode.
///
/// Opinionated value, M2 spec is 8.
const double kPopupMenuElevationFCS = 6;

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
/// in light theme.
///
/// Value: 0x0D = 13 = 5%
const int kFillColorAlphaLight = 0x0D;

/// Fill color alpha value for [InputDecorator] used by FlexColorScheme
/// in dark theme.
///
/// Value: 0x14 = 20 = 8%
const int kFillColorAlphaDark = 0x14;

/// Hover state alpha value on background.
///
/// Used on opt in sub-themes by [InputDecorator],
/// [ElevatedButton], [OutlinedButton] and [TextButton].
///
/// Value: 0x0D = 13 = 5%
const int kHoverBackgroundAlpha = 0x0D;

/// Focus state alpha value on background.
///
/// Used on opt in sub-themes by [InputDecorator],
/// [ElevatedButton], [OutlinedButton] and [TextButton].
///
/// Value: 0x26 = 38 = 15%
const int kFocusBackgroundAlpha = 0x26;

/// Pressed state alpha value on background.
///
/// Used on opt in sub-themes by [OutlinedButton] and [TextButton].
///
/// Value: 0x33 = 51 = 20%
const int kPressedBackgroundAlpha = 0x33;

/// Disabled state alpha value on background elements.
///
/// Used on opt in sub-themes by [InputDecorator], [ElevatedButton],
/// [OutlinedButton], [TextButton], `ButtonThemeData` for legacy buttons and
/// by [ToggleButtons].
///
/// Value: 0x31 = 49 = 19%
const int kDisabledBackgroundAlpha = 0x31;

/// Disabled state alpha value on foreground elements.
///
/// Used on opt in sub-themes by [ElevatedButton], [OutlinedButton] and by
/// [ToggleButtons] as well as by [ThemeData.disabledColor] when opting in
/// on sub-theme effects, for consistent disable colors.
///
/// Value: 0x5E = 94 = 37%
const int kDisabledForegroundAlpha = 0x5E;

/// Disabled alpha blend value for background elements.
///
/// Typically used together with onSurface, to make the disabled color in
/// combination with [kDisabledBackgroundAlpha]. For example:
///
/// ```
/// Color disable = colorScheme.primary
///                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
///                  .withAlpha(kDisabledBackgroundAlpha);
/// ```
///
/// Value: 0xAA = 170 = 67%
const int kDisabledAlphaBlend = 0xAA;

/// Enabled border alpha value on border sides.
///
/// Used on opt in sub-themes by [InputDecorator], [OutlinedButton] and by
/// [ToggleButtons].
///
/// Value: 0xA7 = 167 = 65%
const int kEnabledBorderAlpha = 0xA7;

/// Alpha value, for transparency on selected onPrimary color on
/// [ToggleButtons].
///
/// Value: 0xE5 = 229 = 90%
const int kSelectedAlpha = 0xE5;

/// White alpha blend, for alternative less saturated primary color.
///
/// Used by selected button and selected border color on [ToggleButtons].
///
/// Value: 0x19 = 25 = 10%
const int kAltPrimaryAlphaBlend = 0x19;

/// White alpha blend, for primary colored hover FCS opt-in effects theming.
///
/// Value: 0x40 = 64 = 25%
const int kHoverAlphaBlend = 0x40;

/// White alpha blend, for primary colored focus FCS opt-in effects theming.
///
/// Value: 0x4C = 76 = 30%
const int kFocusAlphaBlend = 0x4C;

/// White alpha blend, for primary colored highlight FCS opt-in effects theming.
///
/// Value: 0x40 = 64 = 25%
const int kHighlightAlphaBlend = 0x40;

/// White alpha blend, for primary colored splash FCS opt-in theming.
///
/// Value: 0x1F = 31 = 12%
const int kSplashAlphaBlend = 0x1F;

/// Alpha value for hover on the custom FCS opt-in effects.
///
/// Value: 0x19 = 25 = 10%
const int kHoverAlpha = 0x19;

/// Alpha value for focus on the custom FCS opt-in effects.
///
/// Value: 0x4C = 76 = 30%
const int kFocusAlpha = 0x4C;

/// Alpha value for highlight on the custom FCS opt-in effects.
///
/// Value: 0x19 = 25 = 10%
const int kHighlightAlpha = 0x19;

/// Alpha value for splash on the custom FCS opt-in effects.
///
/// Value: 0x33 = 51 = 20%
const int kSplashAlpha = 0x33;

/// The OnSurface color alpha blend, for primary colored Chip foreground.
///
/// Used in FCS opinionated M2 mode Chip design, a mix of M2 and M3 look.
///
/// Value: 0x7F = 127 = 50%
const int kChipForegroundAlphaBlend = 0x7F;

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
