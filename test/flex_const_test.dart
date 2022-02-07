import 'package:flex_color_scheme/src/flex_constants.dart';
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
    test('FCT kLightBlendSurfaceLight is 0', () {
      expect(kLightBlendSurfaceLight, 0);
    });
    test('FCT kLightBlendSurfaceMedium is 1', () {
      expect(kLightBlendSurfaceMedium, 1);
    });
    test('FCT kLightBlendSurfaceStrong is 2', () {
      expect(kLightBlendSurfaceStrong, 2);
    });
    test('FCT kLightBlendSurfaceHeavy is 3', () {
      expect(kLightBlendSurfaceHeavy, 3);
    });
    test('FCT kLightBlendBackgroundLight is 2', () {
      expect(kLightBlendBackgroundLight, 2);
    });
    test('FCT kLightBlendBackgroundMedium is 4', () {
      expect(kLightBlendBackgroundMedium, 4);
    });
    test('FCT kLightBlendBackgroundStrong is 6', () {
      expect(kLightBlendBackgroundStrong, 6);
    });
    test('FCT kLightBlendBackgroundHeavy is 8', () {
      expect(kLightBlendBackgroundHeavy, 8);
    });
    test('FCT kLightBlendScaffoldHeavy is 1', () {
      expect(kLightBlendScaffoldHeavy, 1);
    });
    test('FCT kDarkBlendSurfaceLight is 2', () {
      expect(kDarkBlendSurfaceLight, 2);
    });
    test('FCT kDarkBlendSurfaceMedium is 4', () {
      expect(kDarkBlendSurfaceMedium, 4);
    });
    test('FCT kDarkBlendSurfaceStrong is 6', () {
      expect(kDarkBlendSurfaceStrong, 6);
    });
    test('FCT kDarkBlendSurfaceHeavy is 8', () {
      expect(kDarkBlendSurfaceHeavy, 8);
    });
    test('FCT kDarkBlendBackgroundLight is 5', () {
      expect(kDarkBlendBackgroundLight, 5);
    });
    test('FCT kDarkBlendBackgroundMedium is 8', () {
      expect(kDarkBlendBackgroundMedium, 8);
    });
    test('FCT kDarkBlendBackgroundStrong is 11', () {
      expect(kDarkBlendBackgroundStrong, 11);
    });
    test('FCT kDarkBlendBackgroundHeavy is 14', () {
      expect(kDarkBlendBackgroundHeavy, 14);
    });
    test('FCT kDarkBlendScaffoldHeavy is 2', () {
      expect(kDarkBlendScaffoldHeavy, 2);
    });
  });
}
