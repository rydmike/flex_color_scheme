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
      interactionEffects: true,
      blendOnColors: true,
      blendTextTheme: true,
      useTextTheme: true,
      buttonMinSize: Size(40, 40),
      thickBorderWidth: 2,
      thinBorderWidth: 1.5,
      elevatedButtonElevation: 1,
      unselectedToggleIsColored: false,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      fabUseShape: true,
      cardElevation: 0,
      popupMenuElevation: 3,
      popupMenuOpacity: 1,
      dialogElevation: 10,
      snackBarElevation: 4,
      bottomSheetElevation: 4,
      bottomSheetModalElevation: 8,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 1,
      navigationBarIsStyled: true,
      navigationBarOpacity: 1,
      navigationRailOpacity: 1,
      navigationRailElevation: 0,
    );
    // m3, one different values than m1 and m2.
    const FlexSubThemesData m3 = FlexSubThemesData(
      interactionEffects: true,
      blendOnColors: true,
      blendTextTheme: true,
      useTextTheme: true,
      buttonMinSize: Size(40, 40),
      thickBorderWidth: 2,
      thinBorderWidth: 1.5,
      elevatedButtonElevation: 1,
      unselectedToggleIsColored: false,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.underline, // <--diff
      inputDecoratorUnfocusedHasBorder: true,
      fabUseShape: true,
      cardElevation: 0,
      popupMenuElevation: 3,
      popupMenuOpacity: 1,
      dialogElevation: 10,
      snackBarElevation: 4,
      bottomSheetElevation: 4,
      bottomSheetModalElevation: 8,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 1,
      navigationBarIsStyled: true,
      navigationBarOpacity: 1,
      navigationRailOpacity: 1,
      navigationRailElevation: 0,
    );
    // m4, all values different from m1 and m2.
    const FlexSubThemesData m4 = FlexSubThemesData(
      interactionEffects: false,
      blendOnColors: false,
      blendTextTheme: false,
      useTextTheme: false,
      buttonMinSize: Size(44, 49),
      thickBorderWidth: 3,
      thinBorderWidth: 2,
      elevatedButtonElevation: 3,
      unselectedToggleIsColored: false,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedHasBorder: false,
      fabUseShape: false,
      cardElevation: 1,
      popupMenuElevation: 5,
      popupMenuOpacity: 0.95,
      dialogElevation: 10,
      snackBarElevation: 5,
      bottomSheetElevation: 3,
      bottomSheetModalElevation: 10,
      bottomNavigationBarElevation: 1,
      bottomNavigationBarOpacity: 0.96,
      navigationBarIsStyled: false,
      navigationBarOpacity: 0.55,
      navigationRailOpacity: 0.43,
      navigationRailElevation: 7,
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
        'FSTC1.02c: GIVEN none equal FlexSubThemeConfig objects '
        'EXPECT them to be equal after copy with change to make equal', () {
      expect(
        m1,
        equals(
          m3.copyWith(inputDecoratorBorderType: FlexInputBorderType.outline),
        ),
      );
    });
    test(
        'FSTC1.03a: GIVEN a FlexSubThemeConfig object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(
        m4.copyWith(
          interactionEffects: true,
          blendOnColors: true,
          blendTextTheme: true,
          useTextTheme: true,
          buttonMinSize: const Size(40, 40),
          thickBorderWidth: 2,
          thinBorderWidth: 1.5,
          elevatedButtonElevation: 1,
          unselectedToggleIsColored: false,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorUnfocusedHasBorder: true,
          fabUseShape: true,
          cardElevation: 0,
          popupMenuElevation: 3,
          popupMenuOpacity: 1,
          dialogElevation: 10,
          snackBarElevation: 4,
          bottomSheetElevation: 4,
          bottomSheetModalElevation: 8,
          bottomNavigationBarElevation: 0,
          bottomNavigationBarOpacity: 1,
          navigationBarIsStyled: true,
          navigationBarOpacity: 1,
          navigationRailOpacity: 1,
          navigationRailElevation: 0,
        ),
        equals(m1),
      );
    });
    test(
        'FSTC1.03b: GIVEN a FlexSubThemeConfig object EXPECT it to be '
        'unchanged after and empty copyWith.', () {
      expect(m4.copyWith(), equals(m4));
    });

    // m5, define all values in FlexSubThemesData.
    const FlexSubThemesData m5 = FlexSubThemesData(
      interactionEffects: true,
      blendOnColors: true,
      blendTextTheme: true,
      useTextTheme: true,
      defaultRadius: 14,
      buttonMinSize: Size(41, 41),
      buttonPadding: EdgeInsets.symmetric(horizontal: 14),
      thickBorderWidth: 2,
      thinBorderWidth: 1,
      textButtonRadius: 10,
      elevatedButtonRadius: 12,
      elevatedButtonElevation: 2,
      outlinedButtonRadius: 14,
      toggleButtonsRadius: 10,
      inputDecorationRadius: 8,
      inputDecoratorSchemeColor: SchemeColor.secondary,
      inputDecoratorIsFilled: true,
      inputDecoratorFillColor: null,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      fabRadius: 12,
      fabUseShape: true,
      fabSchemeColor: SchemeColor.primary,
      chipRadius: 20,
      chipSchemeColor: SchemeColor.secondaryContainer,
      unselectedToggleIsColored: true,
      cardRadius: 20,
      cardElevation: 2,
      popupMenuRadius: 8,
      popupMenuElevation: 10,
      popupMenuOpacity: 0.95,
      dialogRadius: 24,
      dialogElevation: 16,
      timePickerDialogRadius: 24,
      snackBarElevation: 8,
      tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
      bottomSheetRadius: 20,
      bottomSheetElevation: 10,
      bottomSheetModalElevation: 8,
      bottomNavigationBarElevation: 1,
      bottomNavigationBarOpacity: 0.9,
      bottomNavigationBarSchemeColor: SchemeColor.secondary,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
      bottomNavigationBarLandscapeLayout:
          BottomNavigationBarLandscapeLayout.centered,
      navigationBarIsStyled: true,
      navigationBarHeight: 68,
      navigationBarOpacity: 0.9,
      navigationBarIconSchemeColor: SchemeColor.secondary,
      navigationBarTextSchemeColor: SchemeColor.secondary,
      navigationBarHighlightSchemeColor: SchemeColor.secondary,
      navigationBarBackgroundSchemeColor: SchemeColor.surface,
      navigationBarMutedUnselectedIcon: true,
      navigationBarMutedUnselectedText: true,
      navigationBarSelectedLabelSize: 12,
      navigationBarUnselectedLabelSize: 12,
      navigationBarSelectedIconSize: 40,
      navigationBarUnselectedIconSize: 38,
      navigationBarLabelBehavior:
          NavigationDestinationLabelBehavior.onlyShowSelected,
      //
      navigationRailBackgroundSchemeColor: SchemeColor.secondaryContainer,
      navigationRailOpacity: 1,
      navigationRailElevation: 2,
      navigationRailIconSchemeColor: SchemeColor.secondaryContainer,
      navigationRailUseIndicator: true,
      navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
      navigationRailTextSchemeColor: SchemeColor.secondaryContainer,
      navigationRailMutedUnselectedIcon: true,
      navigationRailMutedUnselectedText: true,
      navigationRailSelectedLabelSize: 12,
      navigationRailUnselectedLabelSize: 11,
      navigationRailSelectedIconSize: 40,
      navigationRailUnselectedIconSize: 41,
      navigationRailLabelType: NavigationRailLabelType.all,
      navigationRailGroupAlignment: -1,
    );

    test(
        'FSTC1.03c: GIVEN a FULL FlexSubThemeConfig object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(
        m5,
        equals(m4.copyWith(
          interactionEffects: true,
          blendOnColors: true,
          blendTextTheme: true,
          useTextTheme: true,
          defaultRadius: 14,
          buttonMinSize: const Size(41, 41),
          buttonPadding: const EdgeInsets.symmetric(horizontal: 14),
          thickBorderWidth: 2,
          thinBorderWidth: 1,
          textButtonRadius: 10,
          elevatedButtonRadius: 12,
          elevatedButtonElevation: 2,
          outlinedButtonRadius: 14,
          toggleButtonsRadius: 10,
          inputDecorationRadius: 8,
          inputDecoratorSchemeColor: SchemeColor.secondary,
          inputDecoratorIsFilled: true,
          inputDecoratorFillColor: null,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorUnfocusedHasBorder: true,
          fabRadius: 12,
          fabUseShape: true,
          fabSchemeColor: SchemeColor.primary,
          chipRadius: 20,
          chipSchemeColor: SchemeColor.secondaryContainer,
          unselectedToggleIsColored: true,
          cardRadius: 20,
          cardElevation: 2,
          popupMenuRadius: 8,
          popupMenuElevation: 10,
          popupMenuOpacity: 0.95,
          dialogRadius: 24,
          dialogElevation: 16,
          timePickerDialogRadius: 24,
          snackBarElevation: 8,
          tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
          bottomSheetRadius: 20,
          bottomSheetElevation: 10,
          bottomSheetModalElevation: 8,
          bottomNavigationBarElevation: 1,
          bottomNavigationBarOpacity: 0.9,
          bottomNavigationBarSchemeColor: SchemeColor.secondary,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
          bottomNavigationBarLandscapeLayout:
              BottomNavigationBarLandscapeLayout.centered,
          navigationBarIsStyled: true,
          navigationBarHeight: 68,
          navigationBarOpacity: 0.9,
          navigationBarIconSchemeColor: SchemeColor.secondary,
          navigationBarTextSchemeColor: SchemeColor.secondary,
          navigationBarHighlightSchemeColor: SchemeColor.secondary,
          navigationBarBackgroundSchemeColor: SchemeColor.surface,
          navigationBarMutedUnselectedIcon: true,
          navigationBarMutedUnselectedText: true,
          navigationBarSelectedLabelSize: 12,
          navigationBarUnselectedLabelSize: 12,
          navigationBarSelectedIconSize: 40,
          navigationBarUnselectedIconSize: 38,
          navigationBarLabelBehavior:
              NavigationDestinationLabelBehavior.onlyShowSelected,
          //
          navigationRailBackgroundSchemeColor: SchemeColor.secondaryContainer,
          navigationRailOpacity: 1,
          navigationRailElevation: 2,
          navigationRailIconSchemeColor: SchemeColor.secondaryContainer,
          navigationRailUseIndicator: true,
          navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
          navigationRailTextSchemeColor: SchemeColor.secondaryContainer,
          navigationRailMutedUnselectedIcon: true,
          navigationRailMutedUnselectedText: true,
          navigationRailSelectedLabelSize: 12,
          navigationRailUnselectedLabelSize: 11,
          navigationRailSelectedIconSize: 40,
          navigationRailUnselectedIconSize: 41,
          navigationRailLabelType: NavigationRailLabelType.all,
          navigationRailGroupAlignment: -1,
        )),
      );
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
              'FlexSubThemesData#00000(interactionEffects: true, blendOnLevel : 0, blendOnColors: true, blendTextTheme: true, useTextTheme: true, defaultRadius: null, buttonMinSize: Size(40.0, 40.0), buttonPadding: EdgeInsets(16.0, 0.0, 16.0, 0.0), thickBorderWidth: 2.0, thinBorderWidth: 1.5, textButtonRadius: null, elevatedButtonRadius: null, elevatedButtonElevation: 1.0, outlinedButtonRadius: null, toggleButtonsRadius: null, textButtonSchemeColor: null, elevatedButtonSchemeColor: null, outlinedButtonSchemeColor: null, materialButtonSchemeColor: null, toggleButtonsSchemeColor: null, switchSchemeColor: null, checkboxSchemeColor: null, radioSchemeColor: null, unselectedToggleIsColored: false, inputDecorationRadius: null, inputDecoratorSchemeColor: null, inputDecoratorIsFilled: true, inputDecoratorFillColor: null, inputDecoratorBorderType: outline, inputDecoratorUnfocusedHasBorder: true, fabRadius: null, fabUseShape: true, fabSchemeColor: null, chipRadius: null, chipSchemeColor: null, cardRadius: null, cardElevation: 0.0, popupMenuRadius: null, popupMenuElevation: 3.0, popupMenuOpacity: 1.0, dialogRadius: null, dialogElevation: 10.0, dialogBackgroundSchemeColor: null, timePickerDialogRadius: null, snackBarElevation: 4.0, appBarBackgroundSchemeColor: null, tabBarItemSchemeColor: null, tabBarIndicatorSchemeColor: null, bottomSheetRadius: null, bottomSheetElevation: 4.0, bottomSheetModalElevation: 8.0, bottomNavigationBarElevation: 0.0, bottomNavigationBarOpacity: 1.0, bottomNavigationBarSchemeColor: null, bottomNavigationBarBackgroundSchemeColor: null, bottomNavigationBarLandscapeLayout: null, navigationBarIsStyled: true, navigationBarHeight: null, navigationBarOpacity: 1.0, navigationBarIconSchemeColor: null, navigationBarIconSchemeColor: null, navigationBarHighlightSchemeColor: null, navigationBarBackgroundSchemeColor: null, navigationBarMutedUnselectedIcon: null, navigationBarMutedUnselectedText: null, navigationBarSelectedLabelSize: null, navigationBarUnselectedLabelSize: null, navigationBarSelectedIconSize: null, navigationBarUnselectedIconSize: null, navigationBarLabelBehavior: null, navigationRailBackgroundSchemeColor: null, navigationRailOpacity: 1.0, navigationRailElevation: 0.0, navigationRailIconSchemeColor: null, navigationRailUseIndicator: null, navigationRailIndicatorSchemeColor: null, navigationRailTextSchemeColor: null, navigationRailMutedUnselectedIcon: null, navigationRailMutedUnselectedText: null, navigationRailSelectedLabelSize: null, navigationRailUnselectedLabelSize: null, navigationRailSelectedIconSize: null, navigationRailUnselectedIconSize: null, navigationRailGroupAlignment: null, navigationRailGroupAlignment: null)'));
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
    // the code changes from run to run. I have observed this to happen with
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
      expect(
          m1.hashCode, equals(m1.copyWith(interactionEffects: true).hashCode));
    });
  });
}
