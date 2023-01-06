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
      // TODO(rydmike): Add tintedDisabledControls feature in version 7.0?
      // tintedDisabledControls: true,
      blendOnColors: true,
      useFlutterDefaults: false,
      blendTextTheme: true,
      useTextTheme: true,
      unselectedToggleIsColored: false,
      sliderValueTinted: false,
      inputDecoratorIsFilled: true,
      inputDecoratorUnfocusedHasBorder: true,
      inputDecoratorUnfocusedBorderIsColored: true,
      fabUseShape: false,
      fabAlwaysCircular: false,
      bottomNavigationBarMutedUnselectedLabel: true,
      bottomNavigationBarMutedUnselectedIcon: true,
      bottomNavigationBarShowSelectedLabels: true,
      bottomNavigationBarShowUnselectedLabels: true,
      navigationBarMutedUnselectedIcon: true,
      navigationRailMutedUnselectedLabel: true,
      navigationRailMutedUnselectedIcon: true,
      navigationRailUseIndicator: true,
    );
    // m3, one different values than m1 and m2.
    const FlexSubThemesData m3 = FlexSubThemesData(
      interactionEffects: true,
      // TODO(rydmike): Add tintedDisabledControls feature in version 7.0?
      // tintedDisabledControls: true,
      blendOnColors: true,
      useFlutterDefaults: false,
      blendTextTheme: true,
      useTextTheme: true,
      unselectedToggleIsColored: false,
      sliderValueTinted: false,
      inputDecoratorIsFilled: false, //<- Diff
      inputDecoratorUnfocusedHasBorder: true,
      inputDecoratorUnfocusedBorderIsColored: true,
      fabUseShape: false,
      fabAlwaysCircular: false,
      bottomNavigationBarMutedUnselectedLabel: true,
      bottomNavigationBarMutedUnselectedIcon: true,
      bottomNavigationBarShowSelectedLabels: true,
      bottomNavigationBarShowUnselectedLabels: true,
      navigationBarMutedUnselectedLabel: true,
      navigationBarMutedUnselectedIcon: true,
      navigationRailMutedUnselectedLabel: true,
      navigationRailMutedUnselectedIcon: true,
      navigationRailUseIndicator: true,
    );
    // m4, all values different from m1 and m2.
    const FlexSubThemesData m4 = FlexSubThemesData(
      interactionEffects: false,
      // TODO(rydmike): Add tintedDisabledControls feature in version 7.0?
      // tintedDisabledControls: false,
      blendOnColors: false,
      useFlutterDefaults: true,
      blendTextTheme: false,
      useTextTheme: false,
      unselectedToggleIsColored: true,
      sliderValueTinted: true,
      inputDecoratorIsFilled: false,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      fabUseShape: true,
      fabAlwaysCircular: true,
      bottomNavigationBarMutedUnselectedLabel: false,
      bottomNavigationBarMutedUnselectedIcon: false,
      bottomNavigationBarShowSelectedLabels: false,
      bottomNavigationBarShowUnselectedLabels: false,
      navigationBarMutedUnselectedLabel: false,
      navigationBarMutedUnselectedIcon: false,
      navigationRailMutedUnselectedLabel: false,
      navigationRailMutedUnselectedIcon: false,
      navigationRailUseIndicator: false,
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
          m3.copyWith(inputDecoratorIsFilled: true),
        ),
      );
    });
    test(
        'FSTC1.03a: GIVEN a FlexSubThemeConfig object EXPECT it to be '
        'equal to an unequal object when made equal with copyWith.', () {
      expect(
        m4.copyWith(
          interactionEffects: true,
          // TODO(rydmike): Add tintedDisabledControls feature in version 7.0?
          // tintedDisabledControls: true,
          blendOnColors: true,
          useFlutterDefaults: false,
          blendTextTheme: true,
          useTextTheme: true,
          unselectedToggleIsColored: false,
          sliderValueTinted: false,
          inputDecoratorIsFilled: true,
          inputDecoratorUnfocusedHasBorder: true,
          inputDecoratorUnfocusedBorderIsColored: true,
          fabUseShape: false,
          fabAlwaysCircular: false,
          bottomNavigationBarMutedUnselectedLabel: true,
          bottomNavigationBarMutedUnselectedIcon: true,
          bottomNavigationBarShowSelectedLabels: true,
          bottomNavigationBarShowUnselectedLabels: true,
          navigationBarMutedUnselectedLabel: true,
          navigationBarMutedUnselectedIcon: true,
          navigationRailMutedUnselectedLabel: true,
          navigationRailMutedUnselectedIcon: true,
          navigationRailUseIndicator: true,
        ),
        equals(m1),
      );
    });
    test(
        'FSTC1.03b: GIVEN a FlexSubThemeConfig object EXPECT it to be '
        'unchanged after and empty copyWith.', () {
      expect(m4.copyWith(), equals(m4));
    });

    // m5, define all values in FlexSubThemesData, except the
    // MaterialStateProperty functions, they always kill equality checks.
    const FlexSubThemesData m5 = FlexSubThemesData(
      interactionEffects: true,
      // TODO(rydmike): Add tintedDisabledControls feature in version 7.0?
      // tintedDisabledControls: true,
      blendOnLevel: 5,
      blendOnColors: true,
      useFlutterDefaults: true,
      //
      blendTextTheme: false,
      useTextTheme: true,
      //
      defaultRadius: 14,
      buttonMinSize: Size(41, 41),
      buttonPadding: EdgeInsets.symmetric(horizontal: 14),
      //
      thickBorderWidth: 3,
      thinBorderWidth: 2,
      // Exclude these, since they kill equality checks, we include them in
      // the toString further below, to check they are there.
      //
      // elevatedButtonTextStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      // outlinedButtonTextStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      // textButtonTextStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      //
      textButtonRadius: 10,
      textButtonSchemeColor: SchemeColor.background,
      //
      filledButtonRadius: 13,
      filledButtonSchemeColor: SchemeColor.secondary,
      //
      // TODO(rydmike): Hold https://github.com/flutter/flutter/issues/115827
      // filledButtonTonalRadius: 14,
      // filledButtonTonalSchemeColor: SchemeColor.primaryContainer,
      //
      elevatedButtonRadius: 12,
      elevatedButtonElevation: 4,
      elevatedButtonSchemeColor: SchemeColor.primary,
      elevatedButtonSecondarySchemeColor: SchemeColor.onPrimary,
      //
      outlinedButtonRadius: 14,
      outlinedButtonSchemeColor: SchemeColor.surface,
      outlinedButtonOutlineSchemeColor: SchemeColor.outline,
      outlinedButtonBorderWidth: 2,
      outlinedButtonPressedBorderWidth: 5,
      //
      toggleButtonsRadius: 10,
      toggleButtonsSchemeColor: SchemeColor.tertiaryContainer,
      toggleButtonsBorderWidth: 3,
      //
      materialButtonSchemeColor: SchemeColor.tertiary,
      //
      switchSchemeColor: SchemeColor.inversePrimary,
      checkboxSchemeColor: SchemeColor.inverseSurface,
      radioSchemeColor: SchemeColor.error,
      unselectedToggleIsColored: true,
      //
      sliderBaseSchemeColor: SchemeColor.outline,
      sliderValueTinted: true,
      sliderTrackHeight: 5,
      //
      inputDecoratorRadius: 8,
      inputDecoratorSchemeColor: SchemeColor.secondary,
      inputDecoratorIsFilled: true,
      inputDecoratorFillColor: Color(0xFF348924),
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorBorderWidth: 2.5,
      inputDecoratorFocusedBorderWidth: 5,
      //
      fabRadius: 12,
      fabUseShape: true,
      fabAlwaysCircular: true,
      fabSchemeColor: SchemeColor.primary,
      //
      chipRadius: 20,
      chipSchemeColor: SchemeColor.secondaryContainer,
      chipSelectedSchemeColor: SchemeColor.onSecondaryContainer,
      chipDeleteIconSchemeColor: SchemeColor.error,
      //
      cardRadius: 20,
      cardElevation: 2,
      //
      popupMenuRadius: 8,
      popupMenuElevation: 10,
      popupMenuSchemeColor: SchemeColor.onErrorContainer,
      popupMenuOpacity: 0.95,
      //
      tooltipRadius: 4,
      tooltipWaitDuration: Duration(milliseconds: 50),
      tooltipShowDuration: Duration(milliseconds: 500),
      tooltipSchemeColor: SchemeColor.inversePrimary,
      tooltipOpacity: 0.67,
      //
      dialogRadius: 24,
      dialogElevation: 16,
      dialogBackgroundSchemeColor: SchemeColor.errorContainer,
      timePickerDialogRadius: 24,
      //
      snackBarElevation: 8,
      snackBarBackgroundSchemeColor: SchemeColor.onPrimary,
      //
      appBarBackgroundSchemeColor: SchemeColor.primary,
      appBarCenterTitle: true,
      //
      tabBarItemSchemeColor: SchemeColor.onSecondary,
      tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
      //
      bottomSheetBackgroundColor: SchemeColor.background,
      bottomSheetModalBackgroundColor: SchemeColor.surfaceVariant,
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
      navigationBarElevation: 7,
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
          // TODO(rydmike): Add tintedDisabledControls feature in version 7.0?
          // tintedDisabledControls: true,
          blendOnLevel: 5,
          blendOnColors: true,
          useFlutterDefaults: true,
          //
          blendTextTheme: false,
          useTextTheme: true,
          //
          defaultRadius: 14,
          buttonMinSize: const Size(41, 41),
          buttonPadding: const EdgeInsets.symmetric(horizontal: 14),
          //
          thickBorderWidth: 3,
          thinBorderWidth: 2,
          // Exclude these, since they kill equality checks, we include them in
          // the toString further below, to check they are there.
          //
          // elevatedButtonTextStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          // outlinedButtonTextStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          // textButtonTextStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          //
          textButtonRadius: 10,
          textButtonSchemeColor: SchemeColor.background,
          //
          filledButtonRadius: 13,
          filledButtonSchemeColor: SchemeColor.secondary,
          //
          // TODO(rydmike): https://github.com/flutter/flutter/issues/115827
          // filledButtonTonalRadius: 14,
          // filledButtonTonalSchemeColor: SchemeColor.primaryContainer,
          //
          elevatedButtonRadius: 12,
          elevatedButtonElevation: 4,
          elevatedButtonSchemeColor: SchemeColor.primary,
          elevatedButtonSecondarySchemeColor: SchemeColor.onPrimary,
          //
          outlinedButtonRadius: 14,
          outlinedButtonSchemeColor: SchemeColor.surface,
          outlinedButtonOutlineSchemeColor: SchemeColor.outline,
          outlinedButtonBorderWidth: 2,
          outlinedButtonPressedBorderWidth: 5,
          //
          toggleButtonsRadius: 10,
          toggleButtonsSchemeColor: SchemeColor.tertiaryContainer,
          toggleButtonsBorderWidth: 3,
          //
          materialButtonSchemeColor: SchemeColor.tertiary,
          //
          switchSchemeColor: SchemeColor.inversePrimary,
          checkboxSchemeColor: SchemeColor.inverseSurface,
          radioSchemeColor: SchemeColor.error,
          unselectedToggleIsColored: true,
          //
          sliderBaseSchemeColor: SchemeColor.outline,
          sliderValueTinted: true,
          sliderTrackHeight: 5,
          //
          inputDecoratorRadius: 8,
          inputDecoratorSchemeColor: SchemeColor.secondary,
          inputDecoratorIsFilled: true,
          inputDecoratorFillColor: const Color(0xFF348924),
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorUnfocusedHasBorder: true,
          inputDecoratorUnfocusedBorderIsColored: false,
          inputDecoratorBorderWidth: 2.5,
          inputDecoratorFocusedBorderWidth: 5,
          //
          fabRadius: 12,
          fabUseShape: true,
          fabAlwaysCircular: true,
          fabSchemeColor: SchemeColor.primary,
          //
          chipRadius: 20,
          chipSchemeColor: SchemeColor.secondaryContainer,
          chipSelectedSchemeColor: SchemeColor.onSecondaryContainer,
          chipDeleteIconSchemeColor: SchemeColor.error,
          //
          cardRadius: 20,
          cardElevation: 2,
          //
          popupMenuRadius: 8,
          popupMenuElevation: 10,
          popupMenuSchemeColor: SchemeColor.onErrorContainer,
          popupMenuOpacity: 0.95,
          //
          tooltipRadius: 4,
          tooltipWaitDuration: const Duration(milliseconds: 50),
          tooltipShowDuration: const Duration(milliseconds: 500),
          tooltipSchemeColor: SchemeColor.inversePrimary,
          tooltipOpacity: 0.67,
          //
          dialogRadius: 24,
          dialogElevation: 16,
          dialogBackgroundSchemeColor: SchemeColor.errorContainer,
          timePickerDialogRadius: 24,
          //
          snackBarElevation: 8,
          snackBarBackgroundSchemeColor: SchemeColor.onPrimary,
          //
          appBarBackgroundSchemeColor: SchemeColor.primary,
          appBarCenterTitle: true,
          //
          tabBarItemSchemeColor: SchemeColor.onSecondary,
          tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
          //
          bottomSheetBackgroundColor: SchemeColor.background,
          bottomSheetModalBackgroundColor: SchemeColor.surfaceVariant,
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
          navigationBarElevation: 7,
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
              'FlexSubThemesData#00000(interactionEffects: true, blendOnLevel : null, blendOnColors: true, useFlutterDefaults: false, blendTextTheme: true, useTextTheme: true, defaultRadius: null, buttonMinSize: null, buttonPadding: null, thickBorderWidth: null, thinBorderWidth: null, textButtonRadius: null, textButtonSchemeColor: null, textButtonTextStyle: null, filledButtonRadius: null, filledButtonSchemeColor: null, filledButtonTextStyle: null, elevatedButtonRadius: null, elevatedButtonElevation: null, elevatedButtonSchemeColor: null, elevatedButtonSecondarySchemeColor: null, elevatedButtonTextStyle: null, outlinedButtonRadius: null, outlinedButtonSchemeColor: null, outlinedButtonOutlineSchemeColor: null, outlinedButtonBorderWidth: null, outlinedButtonPressedBorderWidth: null, outlinedButtonTextStyle: null, toggleButtonsRadius: null, toggleButtonsSchemeColor: null, toggleButtonsBorderWidth: null, materialButtonSchemeColor: null, switchSchemeColor: null, switchThumbSchemeColor: null, checkboxSchemeColor: null, radioSchemeColor: null, unselectedToggleIsColored: false, sliderBaseSchemeColor: null, sliderValueTinted: false, sliderTrackHeight: null, inputDecoratorRadius: null, inputDecoratorSchemeColor: null, inputDecoratorIsFilled: true, inputDecoratorFillColor: null, inputDecoratorBorderType: null, inputDecoratorUnfocusedHasBorder: true, inputDecoratorUnfocusedBorderIsColored: true, inputDecoratorBorderWidth: null, inputDecoratorFocusedBorderWidth: null, fabRadius: null, fabUseShape: false, fabAlwaysCircular: false, fabSchemeColor: null, chipRadius: null, chipSchemeColor: null, chipSelectedSchemeColor: null, chipDeleteIconSchemeColor: null, cardRadius: null, cardElevation: null, popupMenuRadius: null, popupMenuElevation: null, popupMenuSchemeColor: null, popupMenuOpacity: null, tooltipRadius: null, tooltipWaitDuration: null, tooltipShowDuration: null, tooltipSchemeColor: null, tooltipOpacity: null, dialogRadius: null, dialogElevation: null, dialogBackgroundSchemeColor: null, timePickerDialogRadius: null, snackBarElevation: null, snackBarBackgroundSchemeColor: null, appBarBackgroundSchemeColor: null, appBarCenterTitle: null, tabBarItemSchemeColor: null, tabBarIndicatorSchemeColor: null, bottomSheetBackgroundColor: null, bottomSheetModalBackgroundColor: null, bottomSheetRadius: null, bottomSheetElevation: null, bottomSheetModalElevation: null, bottomNavigationBarLabelTextStyle: null, bottomNavigationBarSelectedLabelSize: null, bottomNavigationBarUnselectedLabelSize: null, bottomNavigationBarSelectedLabelSchemeColor: null, bottomNavigationBarUnselectedLabelSchemeColor: null, bottomNavigationBarMutedUnselectedLabel: true, bottomNavigationBarSelectedIconSize: null, bottomNavigationBarUnselectedIconSize: null, bottomNavigationBarSelectedIconSchemeColor: null, bottomNavigationBarUnselectedIconSchemeColor: null, bottomNavigationBarMutedUnselectedIcon: true, bottomNavigationBarBackgroundSchemeColor: null, bottomNavigationBarOpacity: null, bottomNavigationBarElevation: null, bottomNavigationBarShowSelectedLabels: true, bottomNavigationBarShowUnselectedLabels: true, bottomNavigationBarType: null, bottomNavigationBarLandscapeLayout: null, navigationBarLabelTextStyle: null, navigationBarSelectedLabelSize: null, navigationBarUnselectedLabelSize: null, navigationBarSelectedLabelSchemeColor: null, navigationBarUnselectedLabelSchemeColor: null, navigationBarMutedUnselectedLabel: true, navigationBarSelectedIconSize: null, navigationBarUnselectedIconSize: null, navigationBarSelectedIconSchemeColor: null, navigationBarUnselectedIconSchemeColor: null, navigationBarMutedUnselectedIcon: true, navigationBarIndicatorSchemeColor: null, navigationBarHighlightOpacity: null, navigationBarBackgroundSchemeColor: null, navigationBarOpacity: null, navigationBarElevation: null, navigationBarHeight: null, navigationBarLabelBehavior: null, navigationRailLabelTextStyle: null, navigationRailSelectedLabelSize: null, navigationRailUnselectedLabelSize: null, navigationRailSelectedLabelSchemeColor: null, navigationRailUnselectedLabelSchemeColor: null, navigationRailMutedUnselectedLabel: true, navigationRailSelectedIconSize: null, navigationRailUnselectedIconSize: null, navigationRailSelectedIconSchemeColor: null, navigationRailUnselectedIconSchemeColor: null, navigationRailMutedUnselectedIcon: true, navigationRailUseIndicator: true, navigationRailIndicatorSchemeColor: null, navigationRailIndicatorOpacity: null, navigationRailBackgroundSchemeColor: null, navigationRailOpacity: null, navigationRailElevation: null, navigationRailLabelType: null, navigationRailGroupAlignment: null)'));
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
