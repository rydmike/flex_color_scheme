import 'package:flutter/material.dart';

/// The percentage amount the primary variant color is darkened from the
/// primary color when primary variant color is not given.
const int kDarkenPrimaryVariant = 10;

/// The percentage amount the secondary color is darkened from the
/// primary color when secondary color is not given.
const int kDarkenSecondary = 5;

/// The percentage amount the secondary variant color is darkened from the
/// secondary color, when secondary variant color is not given, but the
/// secondary color is given.
const int kDarkenSecondaryVariantFromSecondary = 10;

/// The percentage amount the secondary variant color is darkened from the
/// primary color, when secondary variant color and secondary color are not
/// given.
const int kDarkenSecondaryVariant = 14;

/// Primary surface color light blend percentage value for light theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kLightBlendSurfaceLight = 0;

/// Primary surface color medium blend percentage value for light theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kLightBlendSurfaceMedium = 1;

/// Primary surface color strong blend percentage value for light theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kLightBlendSurfaceStrong = 2;

/// Primary surface color heavy blend percentage value for light theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kLightBlendSurfaceHeavy = 3;

/// Primary background color light blend percentage value for light theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kLightBlendBackgroundLight = 2;

/// Primary background color medium blend percentage value for light theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kLightBlendBackgroundMedium = 4;

/// Primary background color strong blend percentage value for light theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kLightBlendBackgroundStrong = 6;

/// Primary background color heavy blend percentage value for light theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kLightBlendBackgroundHeavy = 8;

/// Primary scaffoldBackground color heavy blend percentage value, light theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kLightBlendScaffoldHeavy = 1;

/// Primary surface color light blend percentage value for dark theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kDarkBlendSurfaceLight = 2;

/// Primary surface color medium blend percentage value for dark theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kDarkBlendSurfaceMedium = 4;

/// Primary surface color strong blend percentage value for dark theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kDarkBlendSurfaceStrong = 6;

/// Primary surface color heavy blend percentage value for dark theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kDarkBlendSurfaceHeavy = 8;

/// Primary background color light blend percentage value for dark theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kDarkBlendBackgroundLight = 5;

/// Primary background color medium blend percentage value for dark theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kDarkBlendBackgroundMedium = 8;

/// Primary background color strong blend percentage value for dark theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kDarkBlendBackgroundStrong = 11;

/// Primary background color heavy blend percentage value for dark theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kDarkBlendBackgroundHeavy = 14;

/// Primary scaffoldBackground color heavy blend percentage value, dark theme.
///
/// Used by FlexColorScheme.surfaceStyle based surface branding.
const int kDarkBlendScaffoldHeavy = 2;

/// Default border radius on Widgets that support corner radius rounding.
const double kCornerRadius = 16;

/// Default elevation on [Card] Widget.
const double kCardElevation = 0;

/// Default for elevation of [ElevatedButton].
const double kElevatedButtonElevation = 0;

/// Default elevation of [PopupMenuButton].
const double kPopupMenuElevation = 2;

/// Default elevation of [Dialog].
const double kDialogElevation = 12;

/// Default for elevation of none modal [BottomSheet].
const double kBottomSheetElevation = 4;

/// Default for elevation of modal [BottomSheet].
const double kBottomSheetModalElevation = 12;

/// Default for elevation of [BottomNavigationBar].
const double kBottomNavigationBarElevation = 0;

/// Default for elevation of [SnackBar].
const double kSnackBarElevation = 4;

/// Default minimum button size.
///
/// Applies to [TextButton], [ElevatedButton], [OutlinedButton] and
/// [ToggleButtons].
const Size kMinButtonSize =
    Size(kMinInteractiveDimension - 2, kMinInteractiveDimension - 2);

/// Default padding on buttons.
///
/// Applies to [TextButton], [ElevatedButton] and [OutlinedButton].
const EdgeInsetsGeometry kButtonPadding = EdgeInsets.symmetric(horizontal: 16);

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
const double kThinBorderWidth = 1.5;

// TODO(rydmike): For ref, consider adding SDK defaults to doc comments below.

/// Fill color opacity for [InputDecorator] when fill color is not specified.
const double kFillColorOpacityDefault = 0.06;

/// Fill color opacity [InputDecorator] used by FlexColorScheme in light theme.
const double kFillColorOpacityLight = 0.05;

/// Fill color opacity [InputDecorator] used by FlexColorScheme in dark theme.
const double kFillColorOpacityDark = 0.08;

/// Hover opacity on background.
///
/// Used on opt in sub-themes by [InputDecorator],
/// [ElevatedButton], [OutlinedButton] and [TextButton].
const double kHoverBackgroundOpacity = 0.05; // E:0.08 D:0.04 FO:0.08

/// Focus opacity on background.
///
/// Used on opt in sub-themes by [InputDecorator],
/// [ElevatedButton], [OutlinedButton] and [TextButton].
const double kFocusBackgroundOpacity = 0.15; // E:0.24 D:0.12, FO:0.01

/// Pressed opacity on background.
///
/// Used on opt in sub-themes by [OutlinedButton] and [TextButton].
const double kPressedBackgroundOpacity = 0.2; // E:0.24 D:? E:0.24

/// Disabled opacity on background elements.
///
/// Used on opt in sub-themes by [InputDecorator], [ElevatedButton],
/// [OutlinedButton], [TextButton], [ButtonThemeData] for legacy buttons and
/// by [ToggleButtons].
const double kDisabledBackgroundOpacity = 0.12; // E:0.12 D0.12

/// Disabled opacity on foreground elements.
///
/// Used on opt in sub-themes by [ElevatedButton], [OutlinedButton] and by
/// [ToggleButtons] as well as by [ThemeData.disabledColor] when opting in
/// on sub-theme effects, for consistent disable colors.
const double kDisabledForegroundOpacity = 0.38; // E:0.38 D:0.38

/// Enabled border opacity on border sides.
///
/// Used on opt in sub-themes by [InputDecorator], [OutlinedButton] and by
/// [ToggleButtons].
const double kEnabledBorderOpacity = 0.65; // D:?

/// White alpha blend for primary colored hover opt in effects theming.
const int kHoverAlphaBlend = 40;

/// White alpha blend for primary colored focus opt in effects theming.
const int kFocusAlphaBlend = 20;

/// White alpha blend for primary colored highlight opt in effects theming.
const int kHighlightAlphaBlend = 20;

/// White alpha blend for primary colored splash opt in effects theming.
const int kSplashAlphaBlend = 25;

/// Opacity value for hover on the custom opt in effects.
const double kHoverOpacity = 0.12;

/// Opacity value for focus on the custom opt in effects.
const double kFocusOpacity = 0.25;

/// Opacity value for highlight on the custom opt in effects.
const double kHighlightOpacity = 0.25;

/// Opacity value for splash on the custom opt in effects.
const double kSplashOpacity = 0.30;
