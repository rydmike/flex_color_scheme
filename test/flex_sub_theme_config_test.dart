import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexSubThemesData unit tests.
  //
  // Basic object tests, equality, none equal, copyWith. Factory creation
  // same result as matching one with default constructor.
  //****************************************************************************
  group('FSTC1: WITH FlexSubThemesData ', () {
    // m1 = Default FlexSubThemeConfig
    const FlexSubThemesData m1 = FlexSubThemesData();
    // m2, same definition as m1, but using default values to create.
    const FlexSubThemesData m2 = FlexSubThemesData(
      themedEffects: true,
      cornerRadius: 16,
      cardElevation: 0,
      elevatedButtonElevation: 0,
      popupMenuElevation: 2,
      dialogElevation: 10,
      snackBarElevation: 4,
      bottomSheetElevation: 4,
      bottomSheetModalElevation: 8,
      bottomNavigationBarElevation: 0,
      minButtonSize: Size(46, 46),
      buttonPadding: EdgeInsets.symmetric(horizontal: 16),
      thickBorderWidth: 2,
      thinBorderWidth: 1.5,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
    );
    // m3, one different values than m1 and m2.
    const FlexSubThemesData m3 = FlexSubThemesData(
      themedEffects: true,
      cornerRadius: 16,
      cardElevation: 0,
      elevatedButtonElevation: 0,
      popupMenuElevation: 2,
      dialogElevation: 10,
      snackBarElevation: 4,
      bottomSheetElevation: 4,
      bottomSheetModalElevation: 8,
      bottomNavigationBarElevation: 0,
      minButtonSize: Size(46, 46),
      buttonPadding: EdgeInsets.symmetric(horizontal: 16),
      thickBorderWidth: 2,
      thinBorderWidth: 1.5,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType:
          FlexInputBorderType.underline, // <==This differs
      inputDecoratorUnfocusedHasBorder: true,
    );
    // m4, all values different from m1 and m2.
    const FlexSubThemesData m4 = FlexSubThemesData(
      themedEffects: false,
      cornerRadius: 12,
      cardElevation: 1,
      elevatedButtonElevation: 2,
      popupMenuElevation: 4,
      dialogElevation: 16,
      snackBarElevation: 5,
      bottomSheetElevation: 3,
      bottomSheetModalElevation: 10,
      bottomNavigationBarElevation: 1,
      minButtonSize: Size(36, 36),
      buttonPadding: EdgeInsets.symmetric(horizontal: 24),
      thickBorderWidth: 3,
      thinBorderWidth: 2.5,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedHasBorder: false,
    );
    // Identity and quality tests
    test(
        'FSTC1.01a: GIVEN the same FlexSubThemeConfig object '
        'EXPECT them to be equal', () {
      expect(m1, equals(m1));
    });
    test(
        'FSTC1.01b: GIVEN the same FlexSubThemeConfig object '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FSTC1.01c: GIVEN two equal FlexSubThemeConfig objects '
        'EXPECT them to be equal', () {
      expect(m1, equals(m2));
    });
    test(
        'FSTC1.01d: GIVEN two equal FlexSubThemeConfig objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m2), true);
    });
    test(
        'FSTC1.01e: GIVEN two equal FlexSubThemeConfig objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FSTC1.02a: GIVEN none equal FlexSubThemeConfig objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSTC1.02b: GIVEN none equal FlexSubThemeConfig objects '
        'EXPECT them to be unequal with operator', () {
      expect(m1 != m3, true);
    });
    test(
        'FSTC1.03a: GIVEN a FlexSubThemeConfig object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(
        m4.copyWith(
          themedEffects: true,
          cornerRadius: 16,
          cardElevation: 0,
          elevatedButtonElevation: 0,
          popupMenuElevation: 2,
          dialogElevation: 10,
          snackBarElevation: 4,
          bottomSheetElevation: 4,
          bottomSheetModalElevation: 8,
          bottomNavigationBarElevation: 0,
          minButtonSize: const Size(46, 46),
          buttonPadding: const EdgeInsets.symmetric(horizontal: 16),
          thickBorderWidth: 2,
          thinBorderWidth: 1.5,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorUnfocusedHasBorder: true,
        ),
        equals(m1),
      );
    });
    test(
        'FSTC1.03b: GIVEN a FlexSubThemeConfig object EXPECT it to be '
        'unchanged after and empty copyWith.', () {
      expect(m4.copyWith(), equals(m4));
    });

    //**************************************************************************
    // FlexSubThemesData unit tests.
    //
    // toString and hashcode.
    //**************************************************************************
    test(
        'FSTC1.06: Test toString implemented via debugFillProperties '
        'EXPECT exact print string.', () {
      expect(
          m1.toString(),
          //
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexSubThemesData#00000(themedEffects: true, cornerRadius: 16.0, cornerRadiusBottomSheet: null, cornerRadiusCard: null, cornerRadiusDialog: null, cornerRadiusPopupMenuButton: null, cornerRadiusTimePickerDialog: null, cornerRadiusInputDecoration: null, cornerRadiusTextButton: null, cornerRadiusElevatedButton: null, cornerRadiusOutlinedButton: null, cornerRadiusToggleButtons: null, cardElevation: 0.0, elevatedButtonElevation: 0.0, popupMenuElevation: 2.0, dialogElevation: 10.0, snackBarElevation: 4.0, bottomSheetElevation: 4.0, bottomSheetModalElevation: 8.0, bottomNavigationBarElevation: 0.0, bottomNavigationBarOpacity: null, bottomNavigationBarLandscapeLayout: null, minButtonSize: Size(46.0, 46.0), buttonPadding: EdgeInsets(16.0, 0.0, 16.0, 0.0), thickBorderWidth: 2.0, thinBorderWidth: 1.5, inputDecoratorIsFilled: true, inputDecoratorFillColor: null, inputDecoratorBorderType: outline, inputDecoratorUnfocusedHasBorder: true)'));
    });
    test(
        'FSTC1.07: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout string.', () {
      expect(m1.toStringShort(),
          equalsIgnoringHashCodes('FlexSubThemesData#00000'));
    });
    test('FSTC1.08a: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    // This weird hashcode madness happens here and on few other cases,
    // to coe changes from run to run. I have observed this to happen with
    // classes with a lot of properties, with smaller classes it does not happen
    // it remains the same from run to run. But this is one more case where
    // it changes from run to run, so we cannot expect same hashCode as below:
    //
    // test('FSTC1.08b: Test hashCode exact value.', () {
    //   expect(m1.hashCode, equals(350189422));
    // });
    //
    // We can hover test this, even with a copyWith with a value that is same
    // as it was, we get a new object with same hashCode, so the variation
    // above is a bit strange, it depends on something that changes the
    // outcome of the hashCode. Some rainy day I would like to understand why.
    test('FSTC1.08c: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith(themedEffects: true).hashCode));
    });
  });
}
