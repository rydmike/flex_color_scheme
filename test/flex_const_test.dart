import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//****************************************************************************
// These simple constants unit test just monitors that the used constant values
// have not been changed, deliberately or by accident.
//****************************************************************************

void main() {
  //****************************************************************************
  // Flex constant units - Test the constant value definitions.
  //
  // This tests that ALL the constant values defined in the code, are as
  // they were originally defined.
  //
  // We can of course still change the definition of a used value definition,
  // but such a change would need to ve very deliberate and also update the
  // tests. Basically the values should not be changed. If they are,
  // or need to be changed it is a breaking change.
  //
  //****************************************************************************
  group('FCT: Test that const value definitions are as specified', () {
    test('FCT kDarkenPrimaryVariant is 10', () {
      expect(kDarkenPrimaryContainer, 10);
    });
    test('FCT kDarkenSecondary is 5', () {
      expect(kDarkenSecondary, 5);
    });
    test('FCT kDarkenSecondaryVariantFromSecondary is 10', () {
      expect(kDarkenSecondaryContainerFromSecondary, 10);
    });
    test('FCT kDarkenSecondaryVariant is 14', () {
      expect(kDarkenSecondaryContainer, 14);
    });
    //
    // ---------------
    // Component defaults, typically elevation and radius.
    //
    // Tested in alphabetical order.
    // ---------------
    //
    test('FCT kBottomSheetBorderRadius is 28', () {
      expect(kBottomSheetBorderRadius, 28);
    });
    test('FCT kBottomNavigationBarElevation is 3.0', () {
      expect(kBottomNavigationBarElevation, 3.0);
    });

    test('FCT kBottomSheetElevation is 1', () {
      expect(kBottomSheetElevation, 1);
    });
    test('FCT kBottomSheetElevationM2 is 4', () {
      expect(kBottomSheetElevationM2, 4);
    });

    test('FCT kBottomSheetModalElevation is 2', () {
      expect(kBottomSheetModalElevation, 2);
    });

    test('FCT kBottomSheetModalElevationM2 is 8', () {
      expect(kBottomSheetModalElevationM2, 8);
    });

    test('FCT kButtonMinSize is Size(40,40)', () {
      expect(kButtonMinSize, const Size(40, 40));
    });
    test('FCT kButtonPadding is horizontal 16', () {
      expect(kButtonPadding, const EdgeInsets.symmetric(horizontal: 16));
    });
    test('FCT kButtonRadius is 40', () {
      expect(kButtonRadius, 40);
    });

    test('FCT kCardRadius is 12', () {
      expect(kCardRadius, 12);
    });
    test('FCT kChipRadius is 8', () {
      expect(kChipRadius, 8);
    });
    test('FCT kDialogElevation is 6', () {
      expect(kDialogElevation, 6);
    });
    test('FCT kDialogRadius is 28', () {
      expect(kDialogRadius, 28);
    });
    test('FCT kDrawerRadius is 16', () {
      expect(kDrawerRadius, 16);
    });
    test('FCT kElevatedButtonElevation is 1', () {
      expect(kElevatedButtonElevation, 1);
    });
    test('FCT kFabRadius is 16', () {
      expect(kFabRadius, 16);
    });
    test('FCT kInputDecoratorM3Radius is 4', () {
      expect(kInputDecoratorM3Radius, 4);
    });
    test('FCT kInputDecoratorRadius is 10', () {
      expect(kInputDecoratorRadius, 10);
    });
    test('FCT kNavigationBarIndicatorAlpha is 0x3D', () {
      expect(kNavigationBarIndicatorAlpha, 0x3D);
    });
    test('FCT kNavigationBarIndicatorAlphaFloat is 0x3D / 255', () {
      expect(kNavigationBarIndicatorAlphaFloat, 0x3D / 255);
    });
    test('FCT kNavigationDrawerM2Width is 304', () {
      expect(kNavigationDrawerM2Width, 304);
    });
    test('FCT kNavigationDrawerM3Width is 304', () {
      expect(kNavigationDrawerM3Width, 304);
    });
    test('FCT kNavigationDrawerIndicatorPadding is 12', () {
      expect(kNavigationDrawerIndicatorPadding, 12);
    });
    test('FCT kNavigationRailElevation is 0', () {
      expect(kNavigationRailElevation, 0);
    });
    test('FCT kPopupMenuElevation is 3', () {
      expect(kPopupMenuM3Elevation, 3);
    });
    test('FCT kPopupMenuElevationFCS is 6', () {
      expect(kPopupMenuM2Elevation, 6);
    });
    test('FCT kSnackBarElevation is 4', () {
      expect(kSnackBarElevation, 4);
    });
    test('FCT kThickBorderWidth is 2', () {
      expect(kThickBorderWidth, 2);
    });
    test('FCT kThinBorderWidth is 1', () {
      expect(kThinBorderWidth, 1);
    });
    test('FCT kTimeElementRadius is 8', () {
      expect(kTimeElementRadius, 8);
    });
    test('FCT kTooltipRadius is 8', () {
      expect(kTooltipRadius, 8);
    });
    //
    // -------------
    // Alpha, opacity and blend values
    //
    test('FCT kFillColorAlphaLightFloat is 0x0D/255', () {
      expect(kFillColorLightOpacity, 0x0D / 255);
    });
    test('FCT kFillColorAlphaDarkFloat is 0x14/255', () {
      expect(kFillColorDarkOpacity, 0x14 / 255);
    });

    // test('FCT kEnabledBorderAlpha is 0xA7', () {
    //   expect(kEnabledBorderAlpha, 0xA7);
    // });
    test('FCT kEnabledBorderAlphaFloat is 0xA7/255', () {
      expect(kEnabledBorderOpacity, 0xA7 / 255);
    });

    test('FCT kChipBackgroundAlphaBlend is 0xCC', () {
      expect(kChipBackgroundAlphaBlend, 0xCC);
    });
    test('FCT kChipBackgroundAlphaBlendFloat is 0xCC/255', () {
      expect(kChipBackgroundAlphaBlendFloat, 0xCC / 255);
    });

    test('FCT kChipSelectedBackgroundAlphaBlend is 0x96', () {
      expect(kChipSelectedBackgroundAlphaBlend, 0x96);
    });
    test('FCT kChipSelectedBackgroundAlphaBlendFloat is 0x96/255', () {
      expect(kChipSelectedBackgroundAlphaBlendFloat, 0x96 / 255);
    });

    test('FCT kUnselectedBackgroundPrimaryAlphaBlend is 0x66', () {
      expect(kUnselectedBackgroundPrimaryAlphaBlend, 0x66);
    });
    test('FCT kUnselectedBackgroundPrimaryAlphaBlendFloat is 0x66/255', () {
      expect(kUnselectedBackgroundPrimaryAlphaBlendFloat, 0x66 / 255);
    });

    test('FCT kUnselectedAlphaBlend is 0xA5', () {
      expect(kUnselectedAlphaBlend, 0xA5);
    });
    test('FCT kUnselectedAlphaBlendFloat is 0xA5/255', () {
      expect(kUnselectedAlphaBlendFloat, 0xA5 / 255);
    });
    //
    // Tint constants
    //
    test('FCT kTintHover is 0xB2', () {
      expect(kTintHover, 0xB2);
    });
    test('FCT kTintHoverFloat is 0xB2/255', () {
      expect(kTintHoverFloat, 0xB2 / 255);
    });

    test('FCT kAlphaHover is 0x14', () {
      expect(kAlphaHovered, 0x14);
    });
    test('FCT kAlphaHoverFloat is 0x14/255', () {
      expect(kAlphaHoveredFloat, 0x14 / 255);
    });

    test('FCT kAlphaHover is 0x14', () {
      expect(kAlphaHovered, 0x14);
    });
    test('FCT kAlphaHoverFloat is 0x14/255', () {
      expect(kAlphaHoveredFloat, 0x14 / 255);
    });

    test('FCT kAlphaTintedHovered is 0x11', () {
      expect(kAlphaTintedHovered, 0x11);
    });
    test('FCT kAlphaTintedHoveredFloat is 0x11/255', () {
      expect(kAlphaTintedHoveredFloat, 0x11 / 255);
    });

    test('FCT kTintHighlight is 0xA5', () {
      expect(kTintHighlight, 0xA5);
    });
    test('FCT kTintHighlightFloat is 0xA5/255', () {
      expect(kTintHighlightFloat, 0xA5 / 255);
    });

    test('FCT kAlphaHighlight is 0x14', () {
      expect(kAlphaHighlight, 0x14);
    });
    test('FCT kAlphaHighlightFloat is 0x14/255', () {
      expect(kAlphaHighlightFloat, 0x14 / 255);
    });

    test('FCT kAlphaTintedHighlight is 0x0F', () {
      expect(kAlphaTintedHighlight, 0x0F);
    });
    test('FCT kAlphaTintedHighlightFloat is 0x0F/255', () {
      expect(kAlphaTintedHighlightFloat, 0x0F / 255);
    });

    test('FCT kTintPressed is 0xA5', () {
      expect(kTintPressed, 0xA5);
    });
    test('FCT kTintPressedFloat is 0xA5/255', () {
      expect(kTintPressedFloat, 0xA5 / 255);
    });

    test('FCT kAlphaPressed is 0x1F', () {
      expect(kAlphaPressed, 0x1F);
    });
    test('FCT kAlphaPressedFloat is 0x1F/255', () {
      expect(kAlphaPressedFloat, 0x1F / 255);
    });

    test('FCT kAlphaTintPressed is 0x10', () {
      expect(kAlphaTintPressed, 0x10);
    });
    test('FCT kAlphaTintPressedFloat is 0x10/255', () {
      expect(kAlphaTintPressedFloat, 0x10 / 255);
    });

    test('FCT kAlphaInputPressed is 0x19 - New in V8', () {
      expect(kAlphaInputPressed, 0x19);
    });
    test('FCT kAlphaInputPressedFloat is 0x19/255 - New in V8', () {
      expect(kAlphaInputPressedFloat, 0x19 / 255);
    });

    test('FCT kTintSplash is 0xA5', () {
      expect(kTintSplash, 0xA5);
    });
    test('FCT kTintSplashFloat is 0xA5/255', () {
      expect(kTintSplashFloat, 0xA5 / 255);
    });

    test('FCT kAlphaSplash is 0x1F', () {
      expect(kAlphaSplash, 0x1F);
    });
    test('FCT kAlphaSplashFloat is 0x1F/255', () {
      expect(kAlphaSplashFloat, 0x1F / 255);
    });

    test('FCT kAlphaTintSplash is 0x10', () {
      expect(kAlphaTintSplash, 0x10);
    });
    test('FCT kAlphaTintSplashFloat is 0x10/255', () {
      expect(kAlphaTintSplashFloat, 0x10 / 255);
    });

    test('FCT kTintFocus is 0xB2', () {
      expect(kTintFocus, 0xB2);
    });
    test('FCT kTintFocusFloat is 0xB2/255', () {
      expect(kTintFocusFloat, 0xB2 / 255);
    });

    test('FCT kAlphaFocus is 0x1F', () {
      expect(kAlphaFocused, 0x1F);
    });
    test('FCT kAlphaFocusFloat is 0x1F/255', () {
      expect(kAlphaFocusedFloat, 0x1F / 255);
    });

    test('FCT kAlphaTintFocused is 0x1C', () {
      expect(kAlphaTintFocused, 0x1C);
    });
    test('FCT kAlphaTintFocusedFloat is 0x1C/255', () {
      expect(kAlphaTintFocusedFloat, 0x1C / 255);
    });

    test('FCT kTintDisabled is 0x66', () {
      expect(kTintDisabled, 0x66);
    });
    test('FCT kTintDisabledFloat is 0x66/255', () {
      expect(kTintDisabledFloat, 0x66 / 255);
    });

    test('FCT kAlphaDisabled is 0x61', () {
      expect(kAlphaDisabled, 0x61);
    });
    test('FCT kAlphaDisabledFloat is 0x61/255', () {
      expect(kAlphaDisabledFloat, 0x61 / 255);
    });

    test('FCT kAlphaMediumDisabled is 0x52', () {
      expect(kAlphaMediumDisabled, 0x52);
    });
    test('FCT kAlphaMediumDisabledFloat is 0x52/255', () {
      expect(kAlphaMediumDisabledFloat, 0x52 / 255);
    });

    test('FCT kAlphaLowDisabled is 0x3D', () {
      expect(kAlphaLowDisabled, 0x3D);
    });
    test('FCT kAlphaLowDisabledFloat is 0x3D/255', () {
      expect(kAlphaLowDisabledFloat, 0x3D / 255);
    });

    test('FCT kAlphaVeryLowDisabled is 0x1F', () {
      expect(kAlphaVeryLowDisabled, 0x1F);
    });
    test('FCT kAlphaVeryLowDisabledFloat is 0x1F/255', () {
      expect(kAlphaVeryLowDisabledFloat, 0x1F / 255);
    });

    test('FCT kAlphaUltraLowDisabled is 0x0A', () {
      expect(kAlphaUltraLowDisabled, 0x0A);
    });
    test('FCT kAlphaUltraLowDisabledFloat is 0x0A/255', () {
      expect(kAlphaUltraLowDisabledFloat, 0x0A / 255);
    });

    test('FCT kSwitchM2LightTrackColor is Color(0x52000000)', () {
      expect(kSwitchM2LightTrackColor, const Color(0x52000000));
    });
    test('FCT kSwitchM2LightTrackColor is Color(0x52000000)', () {
      expect(kSwitchM2LightTrackColor, const Color(0x52000000));
    });

    test('FCT kAlphaUnselect is 0xDD', () {
      expect(kAlphaUnselect, 0xDD);
    });
    test('FCT kAlphaUnselectFloat is 0xDD/255', () {
      expect(kAlphaUnselectFloat, 0xDD / 255);
    });

    test('FCT kAlphaM2SwitchTrackLight is 0x70', () {
      expect(kAlphaM2SwitchTrackLight, 0x70);
    });
    test('FCT kAlphaM2SwitchTrackLightFloat is 0x70/255', () {
      expect(kAlphaM2SwitchTrackLightFloat, 0x70 / 255);
    });

    test('FCT kAlphaM2SwitchTrackDark is 0x80', () {
      expect(kAlphaM2SwitchTrackDark, 0x80);
    });
    test('FCT kAlphaM2SwitchTrackDarkFloat is 0x80/255', () {
      expect(kAlphaM2SwitchTrackDarkFloat, 0x80 / 255);
    });

    test('FCT kAlphaM2SwitchUnselectTrackLight is 0x50', () {
      expect(kAlphaM2SwitchUnselectTrackLight, 0x50);
    });
    test('FCT kAlphaM2SwitchUnselectTrackLightFloat is 0x50/255', () {
      expect(kAlphaM2SwitchUnselectTrackLightFloat, 0x50 / 255);
    });

    test('FCT kAlphaM2SwitchUnselectTrackDark is 0x65', () {
      expect(kAlphaM2SwitchUnselectTrackDark, 0x65);
    });
    test('FCT kAlphaM2SwitchUnselectTrackDarkFloat is 0x65/255', () {
      expect(kAlphaM2SwitchUnselectTrackDarkFloat, 0x65 / 255);
    });

    test('FCT kAlphaM3SwitchUnselectTrackLight is 0x33', () {
      expect(kAlphaM3SwitchUnselectTrackLight, 0x33);
    });
    test('FCT kAlphaM3SwitchUnselectTrackLightFloat is 0x33/255', () {
      expect(kAlphaM3SwitchUnselectTrackLightFloat, 0x33 / 255);
    });

    test('FCT kAlphaM3SwitchUnselectTrackDark is 0x44', () {
      expect(kAlphaM3SwitchUnselectTrackDark, 0x44);
    });
    test('FCT kAlphaM3SwitchUnselectTrackDarkFloat is 0x44/255', () {
      expect(kAlphaM3SwitchUnselectTrackDarkFloat, 0x44 / 255);
    });

    test('FCT kAlphaSliderTickMark is 0x8A', () {
      expect(kAlphaSliderTickMark, 0x8A);
    });
    test('FCT kAlphaSliderTickMarkFloat is 0x8A/255', () {
      expect(kAlphaSliderTickMarkFloat, 0x8A / 255);
    });

    test('FCT kInputDecoratorLightBgDarken is 3', () {
      expect(kInputDecoratorLightBgDarken, 3);
    });
    test('FCT kInputDecoratorDarkBgLighten is 5', () {
      expect(kInputDecoratorDarkBgLighten, 5);
    });

    // New in FCS 7.1.1
    // Blended text theme values, deprecated in V8, but keeping consts around.
    test('FCT kHiLightTextBlend is 20', () {
      expect(kHiLightTextBlend, 20);
    });
    test('FCT kHiDarkTextBlend is 15', () {
      expect(kHiDarkTextBlend, 15);
    });
    test('FCT kMedLightTextBlend is 20', () {
      expect(kMedLightTextBlend, 20);
    });
    test('FCT kMedDarkTextBlend is 12', () {
      expect(kMedDarkTextBlend, 12);
    });
    test('FCT kLoLightTextBlend is 23', () {
      expect(kLoLightTextBlend, 23);
    });
    test('FCT kLoDarkTextBlend is 15', () {
      expect(kLoDarkTextBlend, 15);
    });

    test('FCT kHiLightTextAlpha is 0xD8', () {
      expect(kHiLightTextAlpha, 0xD8);
    });
    test('FCT kHiLightTextAlphaFloat is 0xD8/255', () {
      expect(kHiLightTextAlphaFloat, 0xD8 / 255);
    });

    test('FCT kHiDarkTextAlpha is 0xE2', () {
      expect(kHiDarkTextAlpha, 0xE2);
    });
    test('FCT kHiDarkTextAlphaFloat is 0xE2/255', () {
      expect(kHiDarkTextAlphaFloat, 0xE2 / 255);
    });

    test('FCT kMedLightTextAlpha is 0xF4', () {
      expect(kMedLightTextAlpha, 0xF4);
    });
    test('FCT kMedLightTextAlphaFloat is 0xF4/255', () {
      expect(kMedLightTextAlphaFloat, 0xF4 / 255);
    });

    test('FCT kMedDarkTextAlpha is 0xFF', () {
      expect(kMedDarkTextAlpha, 0xFF);
    });
    test('FCT kMedDarkTextAlphaFloat is 0xFF/255', () {
      expect(kMedDarkTextAlphaFloat, 0xFF / 255);
    });

    test('FCT kLoLightTextAlpha is 0xFF', () {
      expect(kLoLightTextAlpha, 0xFF);
    });
    test('FCT kLoLightTextAlphaFloat is 0xFF/255', () {
      expect(kLoLightTextAlphaFloat, 0xFF / 255);
    });

    test('FCT kLoDarkTextAlpha is 0xFF', () {
      expect(kLoDarkTextAlpha, 0xFF);
    });
    test('FCT kLoDarkTextAlphaFloat is 0xFF/255', () {
      expect(kLoDarkTextAlphaFloat, 0xFF / 255);
    });

    test('FCT kHiLightPrimTextBlend is 10', () {
      expect(kHiLightPrimTextBlend, 10);
    });
    test('FCT kHiDarkPrimTextBlend is 10', () {
      expect(kHiDarkPrimTextBlend, 10);
    });
    test('FCT kMedLightPrimTextBlend is 5', () {
      expect(kMedLightPrimTextBlend, 5);
    });

    test('FCT kAlphaUnselect is 0xDD', () {
      expect(kAlphaUnselect, 0xDD);
    });
    test('FCT kAlphaUnselectFloat is 0xDD/255', () {
      expect(kAlphaUnselectFloat, 0xDD / 255);
    });

    test('FCT kMedDarkPrimTextBlend is 9', () {
      expect(kMedDarkPrimTextBlend, 9);
    });
    test('FCT kLoLightPrimTextBlend is 4', () {
      expect(kLoLightPrimTextBlend, 4);
    });
    test('FCT kLoDarkPrimTextBlend is 7', () {
      expect(kLoDarkPrimTextBlend, 7);
    });

    test('FCT kHiLightPrimTextAlpha is 0xD8', () {
      expect(kHiLightPrimTextAlpha, 0xD8);
    });
    test('FCT kHiLightPrimTextAlphaFloat is 0xD8/255', () {
      expect(kHiLightPrimTextAlphaFloat, 0xD8 / 255);
    });

    test('FCT kHiDarkPrimTextAlpha is 0xE5', () {
      expect(kHiDarkPrimTextAlpha, 0xE5);
    });
    test('FCT kHiDarkPrimTextAlphaFloat is 0xE5/255', () {
      expect(kHiDarkPrimTextAlphaFloat, 0xE5 / 255);
    });

    test('FCT kMedLightPrimTextAlpha is 0xF2', () {
      expect(kMedLightPrimTextAlpha, 0xF2);
    });
    test('FCT kMedLightPrimTextAlphaFloat is 0xF2/255', () {
      expect(kMedLightPrimTextAlphaFloat, 0xF2 / 255);
    });

    test('FCT kMedDarkPrimTextAlpha is 0xFF', () {
      expect(kMedDarkPrimTextAlpha, 0xFF);
    });
    test('FCT kMedDarkPrimTextAlphaFloat is 0xFF/255', () {
      expect(kMedDarkPrimTextAlphaFloat, 0xFF / 255);
    });

    test('FCT kLoLightPrimTextAlpha is 0xFF', () {
      expect(kLoLightPrimTextAlpha, 0xFF);
    });
    test('FCT kLoLightPrimTextAlphaFloat is 0xFF/255', () {
      expect(kLoLightPrimTextAlphaFloat, 0xFF / 255);
    });

    test('FCT kLoDarkPrimTextAlpha is 0xFF', () {
      expect(kLoDarkPrimTextAlpha, 0xFF);
    });
    test('FCT kLoDarkPrimTextAlphaFloat is 0xFF/255', () {
      expect(kLoDarkPrimTextAlphaFloat, 0xFF / 255);
    });

    test('FCT kTextSelectionOpacity is 0.4', () {
      expect(kTextSelectionOpacity, 0.4);
    });
    test('FCT kTextSelectionLightOpacity is 0.3', () {
      expect(kTextSelectionLightOpacity, 0.3);
    });
    test('FCT kTextSelectionDarkOpacity is 0.5', () {
      expect(kTextSelectionDarkOpacity, 0.5);
    });
  });
}
