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
    // m1 = Default FlexSubThemesData
    const FlexSubThemesData m1 = FlexSubThemesData();
    // m2, same definition as m1, but using default values to create.
    const FlexSubThemesData m2 = FlexSubThemesData(
      interactionEffects: true,
      blendOnColors: true,
      useFlutterDefaults: false,
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
      inputDecoratorUnfocusedBorderIsColored: true,
      fabUseShape: true,
      cardElevation: 0,
      popupMenuElevation: 3,
      popupMenuOpacity: 1,
      dialogElevation: 10,
      snackBarElevation: 4,
      bottomSheetElevation: 4,
      bottomSheetModalElevation: 8,
      bottomNavigationBarMutedUnselectedLabel: true,
      bottomNavigationBarMutedUnselectedIcon: true,
      bottomNavigationBarOpacity: 1,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarShowSelectedLabels: true,
      bottomNavigationBarShowUnselectedLabels: true,
      bottomNavigationBarType: BottomNavigationBarType.fixed,
      navigationBarMutedUnselectedIcon: true,
      navigationBarOpacity: 1,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      navigationRailMutedUnselectedLabel: true,
      navigationRailMutedUnselectedIcon: true,
      navigationRailUseIndicator: true,
      navigationRailOpacity: 1,
      navigationRailElevation: 0,
      navigationRailLabelType: NavigationRailLabelType.all,
    );
    // m3, one different values than m1 and m2.
    const FlexSubThemesData m3 = FlexSubThemesData(
      interactionEffects: true,
      blendOnColors: true,
      useFlutterDefaults: false,
      blendTextTheme: true,
      useTextTheme: true,
      buttonMinSize: Size(40, 40),
      thickBorderWidth: 2,
      thinBorderWidth: 1.5,
      elevatedButtonElevation: 1,
      unselectedToggleIsColored: false,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.underline, //<- Diff
      inputDecoratorUnfocusedHasBorder: true,
      inputDecoratorUnfocusedBorderIsColored: true,
      fabUseShape: true,
      cardElevation: 0,
      popupMenuElevation: 3,
      popupMenuOpacity: 1,
      dialogElevation: 10,
      snackBarElevation: 4,
      bottomSheetElevation: 4,
      bottomSheetModalElevation: 8,
      bottomNavigationBarMutedUnselectedLabel: true,
      bottomNavigationBarMutedUnselectedIcon: true,
      bottomNavigationBarOpacity: 1,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarShowSelectedLabels: true,
      bottomNavigationBarShowUnselectedLabels: true,
      bottomNavigationBarType: BottomNavigationBarType.fixed,
      navigationBarMutedUnselectedLabel: true,
      navigationBarMutedUnselectedIcon: true,
      navigationBarOpacity: 1,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      navigationRailMutedUnselectedLabel: true,
      navigationRailMutedUnselectedIcon: true,
      navigationRailUseIndicator: true,
      navigationRailOpacity: 1,
      navigationRailElevation: 0,
      navigationRailLabelType: NavigationRailLabelType.all,
    );
    // m4, all values different from m1 and m2.
    const FlexSubThemesData m4 = FlexSubThemesData(
      interactionEffects: false,
      blendOnColors: false,
      useFlutterDefaults: true,
      blendTextTheme: false,
      useTextTheme: false,
      buttonMinSize: Size(41, 42),
      thickBorderWidth: 4,
      thinBorderWidth: 2.5,
      elevatedButtonElevation: 5,
      unselectedToggleIsColored: true,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      fabUseShape: false,
      cardElevation: 2,
      popupMenuElevation: 4,
      popupMenuOpacity: 5,
      dialogElevation: 12,
      snackBarElevation: 6,
      bottomSheetElevation: 6,
      bottomSheetModalElevation: 12,
      bottomNavigationBarMutedUnselectedLabel: false,
      bottomNavigationBarMutedUnselectedIcon: false,
      bottomNavigationBarOpacity: 0.6,
      bottomNavigationBarElevation: 3,
      bottomNavigationBarShowSelectedLabels: false,
      bottomNavigationBarShowUnselectedLabels: false,
      bottomNavigationBarType: BottomNavigationBarType.shifting,
      navigationBarMutedUnselectedLabel: false,
      navigationBarMutedUnselectedIcon: false,
      navigationBarOpacity: 0.4,
      navigationBarLabelBehavior:
          NavigationDestinationLabelBehavior.onlyShowSelected,
      navigationRailMutedUnselectedLabel: false,
      navigationRailMutedUnselectedIcon: false,
      navigationRailUseIndicator: false,
      navigationRailOpacity: 0.3,
      navigationRailElevation: 3,
      navigationRailLabelType: NavigationRailLabelType.none,
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
          useFlutterDefaults: false,
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
          inputDecoratorUnfocusedBorderIsColored: true,
          fabUseShape: true,
          cardElevation: 0,
          popupMenuElevation: 3,
          popupMenuOpacity: 1,
          dialogElevation: 10,
          snackBarElevation: 4,
          bottomSheetElevation: 4,
          bottomSheetModalElevation: 8,
          bottomNavigationBarMutedUnselectedLabel: true,
          bottomNavigationBarMutedUnselectedIcon: true,
          bottomNavigationBarOpacity: 1,
          bottomNavigationBarElevation: 0,
          bottomNavigationBarShowSelectedLabels: true,
          bottomNavigationBarShowUnselectedLabels: true,
          bottomNavigationBarType: BottomNavigationBarType.fixed,
          navigationBarMutedUnselectedLabel: true,
          navigationBarMutedUnselectedIcon: true,
          navigationBarOpacity: 1,
          navigationBarLabelBehavior:
              NavigationDestinationLabelBehavior.alwaysShow,
          navigationRailMutedUnselectedLabel: true,
          navigationRailMutedUnselectedIcon: true,
          navigationRailUseIndicator: true,
          navigationRailOpacity: 1,
          navigationRailElevation: 0,
          navigationRailLabelType: NavigationRailLabelType.all,
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
      blendOnLevel: 5,
      blendOnColors: true,
      useFlutterDefaults: true,
      blendTextTheme: false,
      useTextTheme: true,
      defaultRadius: 14,
      buttonMinSize: Size(41, 41),
      buttonPadding: EdgeInsets.symmetric(horizontal: 14),
      thickBorderWidth: 3,
      thinBorderWidth: 2,
      textButtonRadius: 10,
      elevatedButtonRadius: 12,
      elevatedButtonElevation: 4,
      outlinedButtonRadius: 14,
      toggleButtonsRadius: 10,
      textButtonSchemeColor: SchemeColor.background,
      elevatedButtonSchemeColor: SchemeColor.primary,
      outlinedButtonSchemeColor: SchemeColor.surface,
      materialButtonSchemeColor: SchemeColor.tertiary,
      toggleButtonsSchemeColor: SchemeColor.tertiaryContainer,
      switchSchemeColor: SchemeColor.inversePrimary,
      checkboxSchemeColor: SchemeColor.inverseSurface,
      radioSchemeColor: SchemeColor.error,
      unselectedToggleIsColored: true,
      inputDecoratorRadius: 8,
      inputDecoratorSchemeColor: SchemeColor.secondary,
      inputDecoratorIsFilled: true,
      inputDecoratorFillColor: Color(0xFF348924),
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      inputDecoratorUnfocusedBorderIsColored: false,
      fabRadius: 12,
      fabUseShape: true,
      fabSchemeColor: SchemeColor.primary,
      chipRadius: 20,
      chipSchemeColor: SchemeColor.secondaryContainer,
      cardRadius: 20,
      cardElevation: 2,
      popupMenuRadius: 8,
      popupMenuElevation: 10,
      popupMenuOpacity: 0.95,
      dialogRadius: 24,
      dialogElevation: 16,
      dialogBackgroundSchemeColor: SchemeColor.errorContainer,
      timePickerDialogRadius: 24,
      snackBarElevation: 8,
      snackBarBackgroundSchemeColor: SchemeColor.onPrimary,
      appBarBackgroundSchemeColor: SchemeColor.primary,
      appBarCenterTitle: true,
      tabBarItemSchemeColor: SchemeColor.onSecondary,
      tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
      bottomSheetRadius: 20,
      bottomSheetElevation: 10,
      bottomSheetModalElevation: 8,
      //
      bottomNavigationBarLabelTextStyle: TextStyle(),
      bottomNavigationBarSelectedLabelSize: 14,
      bottomNavigationBarUnselectedLabelSize: 12,
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onPrimary,
      bottomNavigationBarMutedUnselectedLabel: true,
      bottomNavigationBarSelectedIconSize: 24,
      bottomNavigationBarUnselectedIconSize: 22,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
      bottomNavigationBarMutedUnselectedIcon: true,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surfaceVariant,
      bottomNavigationBarOpacity: 0.89,
      bottomNavigationBarElevation: 4,
      bottomNavigationBarShowSelectedLabels: true,
      bottomNavigationBarShowUnselectedLabels: true,
      bottomNavigationBarType: BottomNavigationBarType.fixed,
      bottomNavigationBarLandscapeLayout:
          BottomNavigationBarLandscapeLayout.centered,
      //
      navigationBarLabelTextStyle: TextStyle(),
      navigationBarSelectedLabelSize: 14,
      navigationBarUnselectedLabelSize: 12,
      navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      navigationBarUnselectedLabelSchemeColor: SchemeColor.primary,
      navigationBarMutedUnselectedLabel: true,
      navigationBarSelectedIconSize: 30,
      navigationBarUnselectedIconSize: 28,
      navigationBarSelectedIconSchemeColor: SchemeColor.secondaryContainer,
      navigationBarUnselectedIconSchemeColor: SchemeColor.inverseSurface,
      navigationBarMutedUnselectedIcon: true,
      navigationBarIndicatorSchemeColor: SchemeColor.primary,
      navigationBarIndicatorOpacity: 0.6,
      navigationBarBackgroundSchemeColor: SchemeColor.tertiaryContainer,
      navigationBarOpacity: 0.5,
      navigationBarHeight: 58,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      //
      navigationRailLabelTextStyle: TextStyle(),
      navigationRailSelectedLabelSize: 36,
      navigationRailUnselectedLabelSize: 30,
      navigationRailSelectedLabelSchemeColor: SchemeColor.secondaryContainer,
      navigationRailUnselectedLabelSchemeColor: SchemeColor.secondaryContainer,
      navigationRailMutedUnselectedLabel: true,
      navigationRailSelectedIconSize: 40,
      navigationRailUnselectedIconSize: 35,
      navigationRailSelectedIconSchemeColor: SchemeColor.secondary,
      navigationRailUnselectedIconSchemeColor: SchemeColor.secondaryContainer,
      navigationRailMutedUnselectedIcon: true,
      navigationRailUseIndicator: true,
      navigationRailIndicatorSchemeColor: SchemeColor.onSecondary,
      navigationRailBackgroundSchemeColor: SchemeColor.background,
      navigationRailIndicatorOpacity: 0.8,
      navigationRailOpacity: 1,
      navigationRailElevation: 6,
      navigationRailLabelType: NavigationRailLabelType.all,
      navigationRailGroupAlignment: 1,
    );

    test(
        'FSTC1.03c: GIVEN a FULL FlexSubThemeConfig object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(
        m5,
        equals(m4.copyWith(
          interactionEffects: true,
          blendOnLevel: 5,
          blendOnColors: true,
          useFlutterDefaults: true,
          blendTextTheme: false,
          useTextTheme: true,
          defaultRadius: 14,
          buttonMinSize: const Size(41, 41),
          buttonPadding: const EdgeInsets.symmetric(horizontal: 14),
          thickBorderWidth: 3,
          thinBorderWidth: 2,
          textButtonRadius: 10,
          elevatedButtonRadius: 12,
          elevatedButtonElevation: 4,
          outlinedButtonRadius: 14,
          toggleButtonsRadius: 10,
          textButtonSchemeColor: SchemeColor.background,
          elevatedButtonSchemeColor: SchemeColor.primary,
          outlinedButtonSchemeColor: SchemeColor.surface,
          materialButtonSchemeColor: SchemeColor.tertiary,
          toggleButtonsSchemeColor: SchemeColor.tertiaryContainer,
          switchSchemeColor: SchemeColor.inversePrimary,
          checkboxSchemeColor: SchemeColor.inverseSurface,
          radioSchemeColor: SchemeColor.error,
          unselectedToggleIsColored: true,
          inputDecoratorRadius: 8,
          inputDecoratorSchemeColor: SchemeColor.secondary,
          inputDecoratorIsFilled: true,
          inputDecoratorFillColor: const Color(0xFF348924),
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorUnfocusedHasBorder: true,
          inputDecoratorUnfocusedBorderIsColored: false,
          fabRadius: 12,
          fabUseShape: true,
          fabSchemeColor: SchemeColor.primary,
          chipRadius: 20,
          chipSchemeColor: SchemeColor.secondaryContainer,
          cardRadius: 20,
          cardElevation: 2,
          popupMenuRadius: 8,
          popupMenuElevation: 10,
          popupMenuOpacity: 0.95,
          dialogRadius: 24,
          dialogElevation: 16,
          dialogBackgroundSchemeColor: SchemeColor.errorContainer,
          timePickerDialogRadius: 24,
          snackBarElevation: 8,
          snackBarBackgroundSchemeColor: SchemeColor.onPrimary,
          appBarBackgroundSchemeColor: SchemeColor.primary,
          appBarCenterTitle: true,
          tabBarItemSchemeColor: SchemeColor.onSecondary,
          tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
          bottomSheetRadius: 20,
          bottomSheetElevation: 10,
          bottomSheetModalElevation: 8,
          //
          bottomNavigationBarLabelTextStyle: const TextStyle(),
          bottomNavigationBarSelectedLabelSize: 14,
          bottomNavigationBarUnselectedLabelSize: 12,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarMutedUnselectedLabel: true,
          bottomNavigationBarSelectedIconSize: 24,
          bottomNavigationBarUnselectedIconSize: 22,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
          bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
          bottomNavigationBarMutedUnselectedIcon: true,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.surfaceVariant,
          bottomNavigationBarOpacity: 0.89,
          bottomNavigationBarElevation: 4,
          bottomNavigationBarShowSelectedLabels: true,
          bottomNavigationBarShowUnselectedLabels: true,
          bottomNavigationBarType: BottomNavigationBarType.fixed,
          bottomNavigationBarLandscapeLayout:
              BottomNavigationBarLandscapeLayout.centered,
          //
          navigationBarLabelTextStyle: const TextStyle(),
          navigationBarSelectedLabelSize: 14,
          navigationBarUnselectedLabelSize: 12,
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.primary,
          navigationBarMutedUnselectedLabel: true,
          navigationBarSelectedIconSize: 30,
          navigationBarUnselectedIconSize: 28,
          navigationBarSelectedIconSchemeColor: SchemeColor.secondaryContainer,
          navigationBarUnselectedIconSchemeColor: SchemeColor.inverseSurface,
          navigationBarMutedUnselectedIcon: true,
          navigationBarIndicatorSchemeColor: SchemeColor.primary,
          navigationBarIndicatorOpacity: 0.6,
          navigationBarBackgroundSchemeColor: SchemeColor.tertiaryContainer,
          navigationBarOpacity: 0.5,
          navigationBarHeight: 58,
          navigationBarLabelBehavior:
              NavigationDestinationLabelBehavior.alwaysShow,
          //
          navigationRailLabelTextStyle: const TextStyle(),
          navigationRailSelectedLabelSize: 36,
          navigationRailUnselectedLabelSize: 30,
          navigationRailSelectedLabelSchemeColor:
              SchemeColor.secondaryContainer,
          navigationRailUnselectedLabelSchemeColor:
              SchemeColor.secondaryContainer,
          navigationRailMutedUnselectedLabel: true,
          navigationRailSelectedIconSize: 40,
          navigationRailUnselectedIconSize: 35,
          navigationRailSelectedIconSchemeColor: SchemeColor.secondary,
          navigationRailUnselectedIconSchemeColor:
              SchemeColor.secondaryContainer,
          navigationRailMutedUnselectedIcon: true,
          navigationRailUseIndicator: true,
          navigationRailIndicatorSchemeColor: SchemeColor.onSecondary,
          navigationRailBackgroundSchemeColor: SchemeColor.background,
          navigationRailIndicatorOpacity: 0.8,
          navigationRailOpacity: 1,
          navigationRailElevation: 6,
          navigationRailLabelType: NavigationRailLabelType.all,
          navigationRailGroupAlignment: 1,
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
              'FlexSubThemesData#00000(interactionEffects: true, blendOnLevel : 0, blendOnColors: true, useFlutterDefaults: false, blendTextTheme: true, useTextTheme: true, defaultRadius: null, buttonMinSize: Size(40.0, 40.0), buttonPadding: EdgeInsets(16.0, 0.0, 16.0, 0.0), thickBorderWidth: 2.0, thinBorderWidth: 1.5, textButtonRadius: null, elevatedButtonRadius: null, elevatedButtonElevation: 1.0, outlinedButtonRadius: null, toggleButtonsRadius: null, textButtonSchemeColor: null, elevatedButtonSchemeColor: null, outlinedButtonSchemeColor: null, materialButtonSchemeColor: null, toggleButtonsSchemeColor: null, switchSchemeColor: null, checkboxSchemeColor: null, radioSchemeColor: null, unselectedToggleIsColored: false, inputDecoratorRadius: null, inputDecoratorSchemeColor: null, inputDecoratorIsFilled: true, inputDecoratorFillColor: null, inputDecoratorBorderType: outline, inputDecoratorUnfocusedHasBorder: true, inputDecoratorUnfocusedBorderIsColored: true, fabRadius: null, fabUseShape: true, fabSchemeColor: null, chipRadius: null, chipSchemeColor: null, cardRadius: null, cardElevation: 0.0, popupMenuRadius: null, popupMenuElevation: 3.0, popupMenuOpacity: 1.0, dialogRadius: null, dialogElevation: 10.0, dialogBackgroundSchemeColor: null, timePickerDialogRadius: null, snackBarElevation: 4.0, snackBarBackgroundSchemeColor: null, appBarBackgroundSchemeColor: null, appBarCenterTitle: null, tabBarItemSchemeColor: null, tabBarIndicatorSchemeColor: null, bottomSheetRadius: null, bottomSheetElevation: 4.0, bottomSheetModalElevation: 8.0, bottomNavigationBarLabelTextStyle: null, bottomNavigationBarSelectedLabelSize: null, bottomNavigationBarUnselectedLabelSize: null, bottomNavigationBarSelectedLabelSchemeColor: null, bottomNavigationBarUnselectedLabelSchemeColor: null, bottomNavigationBarMutedUnselectedLabel: true, bottomNavigationBarSelectedIconSize: null, bottomNavigationBarUnselectedIconSize: null, bottomNavigationBarSelectedIconSchemeColor: null, bottomNavigationBarUnselectedIconSchemeColor: null, bottomNavigationBarMutedUnselectedIcon: true, bottomNavigationBarBackgroundSchemeColor: null, bottomNavigationBarOpacity: 1.0, bottomNavigationBarElevation: 0.0, bottomNavigationBarShowSelectedLabels: true, bottomNavigationBarShowUnselectedLabels: true, bottomNavigationBarType: fixed, bottomNavigationBarLandscapeLayout: null, navigationBarLabelTextStyle: null, navigationBarSelectedLabelSize: null, navigationBarUnselectedLabelSize: null, navigationBarSelectedLabelSchemeColor: null, navigationBarUnselectedLabelSchemeColor: null, navigationBarMutedUnselectedLabel: true, navigationBarSelectedIconSize: null, navigationBarUnselectedIconSize: null, navigationBarSelectedIconSchemeColor: null, navigationBarUnselectedIconSchemeColor: null, navigationBarMutedUnselectedIcon: true, navigationBarIndicatorSchemeColor: null, navigationBarHighlightOpacity: null, navigationBarBackgroundSchemeColor: null, navigationBarOpacity: 1.0, navigationBarHeight: null, navigationBarLabelBehavior: alwaysShow, navigationRailLabelTextStyle: null, navigationRailSelectedLabelSize: null, navigationRailUnselectedLabelSize: null, navigationRailSelectedLabelSchemeColor: null, navigationRailUnselectedLabelSchemeColor: null, navigationRailMutedUnselectedLabel: true, navigationRailSelectedIconSize: null, navigationRailUnselectedIconSize: null, navigationRailSelectedIconSchemeColor: null, navigationRailUnselectedIconSchemeColor: null, navigationRailMutedUnselectedIcon: true, navigationRailUseIndicator: true, navigationRailIndicatorSchemeColor: null, navigationRailIndicatorOpacity: null, navigationRailBackgroundSchemeColor: null, navigationRailOpacity: 1.0, navigationRailElevation: 0.0, navigationRailLabelType: all, navigationRailGroupAlignment: null)'));
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
    test(
        'FSTC1.09: GIVEN input on deprecated renamed properties '
        'EXPECT to find them on new properties', () {
      const FlexSubThemesData newGetsOld = FlexSubThemesData(
        inputDecorationRadius: 10.0,
        bottomNavigationBarSchemeColor: SchemeColor.error,
        navigationBarTextSchemeColor: SchemeColor.onSurface,
        navigationBarMutedUnselectedText: false,
        navigationBarIconSchemeColor: SchemeColor.onBackground,
        navigationBarHighlightSchemeColor: SchemeColor.inversePrimary,
      );
      expect(newGetsOld.inputDecoratorRadius, equals(10));
      expect(
        newGetsOld.bottomNavigationBarSelectedLabelSchemeColor,
        SchemeColor.error,
      );
      expect(
        newGetsOld.bottomNavigationBarSelectedIconSchemeColor,
        SchemeColor.error,
      );
      expect(
        newGetsOld.navigationBarSelectedLabelSchemeColor,
        SchemeColor.onSurface,
      );
      expect(
        newGetsOld.navigationBarMutedUnselectedLabel,
        false,
      );
      expect(
        newGetsOld.navigationBarSelectedIconSchemeColor,
        SchemeColor.onBackground,
      );
      expect(
        newGetsOld.navigationBarIndicatorSchemeColor,
        SchemeColor.inversePrimary,
      );
    });
  });
}
