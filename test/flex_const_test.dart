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
    test('FCT kDrawerRadius is 16', () {
      expect(kDrawerRadius, 16);
    });
    test('FCT kFabRadius is 16', () {
      expect(kFabRadius, 16);
    });
    test('FCT kChipRadius is 8', () {
      expect(kChipRadius, 8);
    });
    test('FCT kButtonRadius is 20', () {
      expect(kButtonRadius, 20);
    });
    test('FCT kInputDecoratorRadius is 16', () {
      expect(kInputDecoratorRadius, 16);
    });
    test('FCT kInputDecoratorM3Radius is 4', () {
      expect(kInputDecoratorM3Radius, 4);
    });
    test('FCT kBottomSheetBorderRadius is 28', () {
      expect(kBottomSheetBorderRadius, 28);
    });
    test('FCT kDialogRadius is 28', () {
      expect(kDialogRadius, 28);
    });
    test('FCT kCardRadius is 12', () {
      expect(kCardRadius, 12);
    });
    test('FCT kMenuRadius is 4', () {
      expect(kMenuRadius, 4);
    });
    test('FCT kCardElevation is 0', () {
      expect(kCardElevation, 0);
    });
    test('FCT kElevatedButtonElevation is 1', () {
      expect(kElevatedButtonElevation, 1);
    });
    test('FCT kPopupMenuElevation is 3', () {
      expect(kPopupMenuElevation, 3);
    });
    test('FCT kDialogElevation is 6', () {
      expect(kDialogElevation, 6);
    });
    test('FCT kBottomSheetElevation is 4', () {
      expect(kBottomSheetElevation, 4);
    });
    test('FCT kBottomSheetModalElevation is 8', () {
      expect(kBottomSheetModalElevation, 8);
    });
    test('FCT kBottomNavigationBarElevation is 0', () {
      expect(kBottomNavigationBarElevation, 0);
    });
    test('FCT kNavigationBarHeight is 62', () {
      expect(kNavigationBarHeight, 62);
    });
    test('FCT kNavigationBarIndicatorAlpha is 0x3D', () {
      expect(kNavigationBarIndicatorAlpha, 0x3D);
    });
    test('FCT kNavigationRailElevation is 0', () {
      expect(kNavigationRailElevation, 0);
    });
    test('FCT kSnackBarElevation is 4', () {
      expect(kSnackBarElevation, 4);
    });
    test('FCT kButtonMinSize is Size(40,40)', () {
      expect(kButtonMinSize, const Size(40, 40));
    });
    test('FCT kButtonPadding is horizontal 16', () {
      expect(kButtonPadding, const EdgeInsets.symmetric(horizontal: 16));
    });
    test('FCT kThickBorderWidth is 2', () {
      expect(kThickBorderWidth, 2);
    });
    test('FCT kThinBorderWidth is 1', () {
      expect(kThinBorderWidth, 1);
    });
    test('FCT kFillColorAlphaLight is 0x0D', () {
      expect(kFillColorAlphaLight, 0x0D);
    });
    test('FCT kFillColorAlphaDark is 0x14', () {
      expect(kFillColorAlphaDark, 0x14);
    });
    test('FCT kHoverBackgroundAlpha is 0x0D', () {
      expect(kHoverBackgroundAlpha, 0x0D);
    });
    test('FCT kFocusBackgroundAlpha is 0x26', () {
      expect(kFocusBackgroundAlpha, 0x26);
    });
    test('FCT kPressedBackgroundAlpha is 0x33', () {
      expect(kPressedBackgroundAlpha, 0x33);
    });
    test('FCT kDisabledBackgroundAlpha is 0x31', () {
      expect(kDisabledBackgroundAlpha, 0x31);
    });
    test('FCT kDisabledForegroundAlpha is 0x5E', () {
      expect(kDisabledForegroundAlpha, 0x5E);
    });
    test('FCT kDisabledAlphaBlend is 0x66', () {
      expect(kDisabledAlphaBlend, 0x66);
    });
    test('FCT kEnabledBorderAlpha is 0xA7', () {
      expect(kEnabledBorderAlpha, 0xA7);
    });
    test('FCT kSelectedAlpha is 0xE5', () {
      expect(kSelectedAlpha, 0xE5);
    });
    test('FCT kAltPrimaryAlphaBlend is 0x19', () {
      expect(kAltPrimaryAlphaBlend, 0x19);
    });
    test('FCT kHoverAlphaBlend is 0x40', () {
      expect(kHoverAlphaBlend, 0x40);
    });
    test('FCT kFocusAlphaBlend is 0x4C', () {
      expect(kFocusAlphaBlend, 0x4C);
    });
    test('FCT kHighlightAlphaBlend is 0x40', () {
      expect(kHighlightAlphaBlend, 0x40);
    });
    test('FCT kSplashAlphaBlend is 0x1F', () {
      expect(kSplashAlphaBlend, 0x1F);
    });
    test('FCT kHoverAlpha is 0x19', () {
      expect(kHoverAlpha, 0x19);
    });
    test('FCT kFocusAlpha is 0x4C', () {
      expect(kFocusAlpha, 0x4C);
    });
    test('FCT kHighlightAlpha is 0x19', () {
      expect(kHighlightAlpha, 0x19);
    });
    test('FCT kSplashAlpha is 0x33', () {
      expect(kSplashAlpha, 0x33);
    });
    test('FCT kChipForegroundAlphaBlend is 0x7F', () {
      expect(kChipForegroundAlphaBlend, 0x7F);
    });
    test('FCT kChipBackgroundAlphaBlend is 0xCC', () {
      expect(kChipBackgroundAlphaBlend, 0xCC);
    });
    test('FCT kChipSelectedBackgroundAlphaBlend is 0x96', () {
      expect(kChipSelectedBackgroundAlphaBlend, 0x96);
    });
    test('FCT kUnselectedBackgroundPrimaryAlphaBlend is 0x66', () {
      expect(kUnselectedBackgroundPrimaryAlphaBlend, 0x66);
    });
    test('FCT kUnselectedAlphaBlend is 0xA5', () {
      expect(kUnselectedAlphaBlend, 0xA5);
    });
  });
}
