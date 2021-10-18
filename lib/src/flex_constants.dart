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

/// Default minimum button size.
///
/// Applies to [TextButton], [ElevatedButton], [OutlinedButton] and
/// [ToggleButtons].
const Size kMinButtonSize =
    Size(kMinInteractiveDimension, kMinInteractiveDimension);

/// Default padding on buttons.
///
/// Applies to [TextButton], [ElevatedButton] and [OutlinedButton].
const EdgeInsetsGeometry kButtonPadding = EdgeInsets.symmetric(horizontal: 16);

/// Default width of thick outline borders.
///
/// Applies to pressed [OutlinedButton] border and , as well as selected
/// state of [InputDecorator] border.
const double kThickOutlineWidth = 2;

/// Default width of thin outline borders.
///
/// Applies to disabled [OutlinedButton] border and to un-selected state of
/// [InputDecorator] when using [OutlineInputBorder], and to all states of
/// [ToggleButtons].
const double kThinOutlineWidth = 0.5;
