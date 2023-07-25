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
      tintedDisabledControls: true,
      blendOnColors: true,
      useFlutterDefaults: false,
      blendTextTheme: false,
      useM2StyleDividerInM3: false,
      unselectedToggleIsColored: false,
      sliderValueTinted: false,
      inputDecoratorIsFilled: true,
      inputDecoratorFocusedHasBorder: true,
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
      tintedDisabledControls: true,
      blendOnColors: true,
      useFlutterDefaults: false,
      blendTextTheme: false,
      useM2StyleDividerInM3: false,
      unselectedToggleIsColored: false,
      sliderValueTinted: false,
      inputDecoratorIsFilled: false, //<- Diff
      inputDecoratorFocusedHasBorder: true,
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
      tintedDisabledControls: false,
      blendOnColors: true,
      useFlutterDefaults: true,
      blendTextTheme: false,
      useM2StyleDividerInM3: true,
      unselectedToggleIsColored: true,
      sliderValueTinted: true,
      inputDecoratorIsFilled: false,
      inputDecoratorFocusedHasBorder: false,
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
          tintedDisabledControls: true,
          blendOnColors: true,
          useFlutterDefaults: false,
          blendTextTheme: false,
          useM2StyleDividerInM3: false,
          unselectedToggleIsColored: false,
          sliderValueTinted: false,
          inputDecoratorIsFilled: true,
          inputDecoratorFocusedHasBorder: true,
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
      tintedDisabledControls: true,
      blendOnLevel: 5,
      blendOnColors: true,
      useFlutterDefaults: true,
      //
      adaptiveRemoveElevationTint: FlexAdaptive.iOSAndDesktop(),
      adaptiveElevationShadowsBack: FlexAdaptive.apple(),
      adaptiveAppBarScrollUnderOff: FlexAdaptive.excludeAndroidFuchsia(),
      adaptiveRadius: FlexAdaptive.all(),
      adaptiveSplash: FlexAdaptive.apple(),
      //
      splashType: FlexSplashType.inkRipple,
      splashTypeAdaptive: FlexSplashType.instantSplash,
      //
      blendTextTheme: true,
      useTextTheme: false,
      useM2StyleDividerInM3: true,
      //
      defaultRadius: 14,
      defaultRadiusAdaptive: 10,
      buttonMinSize: Size(41, 41),
      alignedDropdown: true,
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
      toggleButtonsUnselectedSchemeColor: SchemeColor.secondaryContainer,
      toggleButtonsBorderSchemeColor: SchemeColor.outline,
      toggleButtonsBorderWidth: 3,
      //
      segmentedButtonRadius: 11,
      segmentedButtonSchemeColor: SchemeColor.secondary,
      segmentedButtonUnselectedSchemeColor: SchemeColor.tertiaryContainer,
      segmentedButtonUnselectedForegroundSchemeColor: SchemeColor.surface,
      segmentedButtonBorderSchemeColor: SchemeColor.outlineVariant,
      segmentedButtonBorderWidth: 1.5,
      //
      materialButtonSchemeColor: SchemeColor.tertiary,
      //
      switchSchemeColor: SchemeColor.inversePrimary,
      switchThumbSchemeColor: SchemeColor.onTertiary,
      switchThumbFixedSize: true,
      checkboxSchemeColor: SchemeColor.inverseSurface,
      radioSchemeColor: SchemeColor.error,
      unselectedToggleIsColored: true,
      //
      sliderBaseSchemeColor: SchemeColor.outline,
      sliderIndicatorSchemeColor: SchemeColor.tertiary,
      sliderValueTinted: true,
      sliderValueIndicatorType: FlexSliderIndicatorType.drop,
      sliderShowValueIndicator: ShowValueIndicator.always,
      sliderTrackHeight: 5,
      //
      inputDecoratorRadius: 8,
      inputDecoratorSchemeColor: SchemeColor.secondary,
      inputDecoratorIsFilled: true,
      inputDecoratorFillColor: Color(0xFF348924),
      inputDecoratorBackgroundAlpha: 0x15,
      inputDecoratorBorderSchemeColor: SchemeColor.onSurfaceVariant,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorFocusedHasBorder: true,
      inputDecoratorUnfocusedHasBorder: true,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorBorderWidth: 2.5,
      inputDecoratorFocusedBorderWidth: 5,
      inputDecoratorPrefixIconSchemeColor: SchemeColor.primaryContainer,
      //
      inputCursorSchemeColor: SchemeColor.tertiary,
      inputSelectionSchemeColor: SchemeColor.secondary,
      inputSelectionOpacity: 0.3,
      inputSelectionHandleSchemeColor: SchemeColor.onPrimaryContainer,
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
      dropdownMenuTextStyle: TextStyle(color: Colors.blue),
      //
      menuRadius: 7,
      menuElevation: 12,
      menuSchemeColor: SchemeColor.onErrorContainer,
      menuOpacity: 0.85,
      menuPadding: EdgeInsetsDirectional.fromSTEB(4, 5, 6, 7),
      //
      menuItemBackgroundSchemeColor: SchemeColor.surfaceVariant,
      menuBarRadius: 5,
      menuBarElevation: 7,
      menuBarShadowColor: Colors.blueAccent,
      //
      menuBarBackgroundSchemeColor: SchemeColor.background,
      menuItemForegroundSchemeColor: SchemeColor.onBackground,
      menuIndicatorBackgroundSchemeColor: SchemeColor.primaryContainer,
      menuIndicatorForegroundSchemeColor: SchemeColor.onPrimaryContainer,
      menuIndicatorRadius: 6,
      //
      tooltipRadius: 4,
      tooltipWaitDuration: Duration(milliseconds: 50),
      tooltipShowDuration: Duration(milliseconds: 500),
      tooltipSchemeColor: SchemeColor.inversePrimary,
      tooltipOpacity: 0.67,
      //
      adaptiveDialogRadius: FlexAdaptive.appleWeb(),
      dialogRadius: 24,
      dialogRadiusAdaptive: 14,
      dialogElevation: 16,
      dialogBackgroundSchemeColor: SchemeColor.errorContainer,
      useInputDecoratorThemeInDialogs: true,
      //
      datePickerHeaderBackgroundSchemeColor: SchemeColor.surfaceVariant,
      datePickerDialogRadius: 22,
      timePickerDialogRadius: 24,
      //
      snackBarRadius: 6,
      snackBarElevation: 8,
      snackBarBackgroundSchemeColor: SchemeColor.onPrimary,
      snackBarActionSchemeColor: SchemeColor.primary,
      //
      appBarBackgroundSchemeColor: SchemeColor.primary,
      appBarCenterTitle: true,
      appBarScrolledUnderElevation: 4,
      //
      bottomAppBarSchemeColor: SchemeColor.surfaceVariant,
      //
      tabBarItemSchemeColor: SchemeColor.onSecondary,
      tabBarUnselectedItemSchemeColor: SchemeColor.onSurfaceVariant,
      tabBarUnselectedItemOpacity: 0.8,
      tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
      tabBarIndicatorSize: TabBarIndicatorSize.label,
      tabBarIndicatorWeight: 5.0,
      tabBarIndicatorTopRadius: 4.0,
      tabBarDividerColor: Colors.yellow,
      //
      drawerRadius: 10,
      drawerElevation: 14,
      drawerBackgroundSchemeColor: SchemeColor.surfaceVariant,
      drawerWidth: 400,
      drawerIndicatorWidth: 350,
      drawerIndicatorRadius: 12,
      drawerIndicatorSchemeColor: SchemeColor.onErrorContainer,
      drawerIndicatorOpacity: 0.45,
      drawerSelectedItemSchemeColor: SchemeColor.onSecondaryContainer,
      drawerUnselectedItemSchemeColor: SchemeColor.secondaryContainer,
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
      navigationBarIndicatorRadius: 4,
      navigationBarBackgroundSchemeColor: SchemeColor.tertiaryContainer,
      navigationBarOpacity: 0.5,
      navigationBarElevation: 7,
      navigationBarHeight: 58,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      adaptiveRemoveNavigationBarTint: FlexAdaptive.desktop(),
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
      navigationRailIndicatorRadius: 7,
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
          tintedDisabledControls: true,
          blendOnLevel: 5,
          blendOnColors: true,
          useFlutterDefaults: true,
          //
          adaptiveRemoveElevationTint: const FlexAdaptive.iOSAndDesktop(),
          adaptiveElevationShadowsBack: const FlexAdaptive.apple(),
          adaptiveAppBarScrollUnderOff:
              const FlexAdaptive.excludeAndroidFuchsia(),
          adaptiveRadius: const FlexAdaptive.all(),
          adaptiveSplash: const FlexAdaptive.apple(),
          //
          splashType: FlexSplashType.inkRipple,
          splashTypeAdaptive: FlexSplashType.instantSplash,
          //
          blendTextTheme: true,
          useTextTheme: false,
          useM2StyleDividerInM3: true,
          //
          defaultRadius: 14,
          defaultRadiusAdaptive: 10,
          buttonMinSize: const Size(41, 41),
          alignedDropdown: true,
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
          toggleButtonsUnselectedSchemeColor: SchemeColor.secondaryContainer,
          toggleButtonsBorderSchemeColor: SchemeColor.outline,
          toggleButtonsBorderWidth: 3,
          //
          segmentedButtonRadius: 11,
          segmentedButtonSchemeColor: SchemeColor.secondary,
          segmentedButtonUnselectedSchemeColor: SchemeColor.tertiaryContainer,
          segmentedButtonUnselectedForegroundSchemeColor: SchemeColor.surface,
          segmentedButtonBorderSchemeColor: SchemeColor.outlineVariant,
          segmentedButtonBorderWidth: 1.5,
          materialButtonSchemeColor: SchemeColor.tertiary,
          //
          switchSchemeColor: SchemeColor.inversePrimary,
          switchThumbSchemeColor: SchemeColor.onTertiary,
          switchThumbFixedSize: true,
          checkboxSchemeColor: SchemeColor.inverseSurface,
          radioSchemeColor: SchemeColor.error,
          unselectedToggleIsColored: true,
          //
          sliderBaseSchemeColor: SchemeColor.outline,
          sliderIndicatorSchemeColor: SchemeColor.tertiary,
          sliderValueTinted: true,
          sliderValueIndicatorType: FlexSliderIndicatorType.drop,
          sliderShowValueIndicator: ShowValueIndicator.always,
          sliderTrackHeight: 5,
          //
          inputDecoratorRadius: 8,
          inputDecoratorSchemeColor: SchemeColor.secondary,
          inputDecoratorIsFilled: true,
          inputDecoratorFillColor: const Color(0xFF348924),
          inputDecoratorBackgroundAlpha: 0x15,
          inputDecoratorBorderSchemeColor: SchemeColor.onSurfaceVariant,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorFocusedHasBorder: true,
          inputDecoratorUnfocusedHasBorder: true,
          inputDecoratorUnfocusedBorderIsColored: false,
          inputDecoratorBorderWidth: 2.5,
          inputDecoratorFocusedBorderWidth: 5,
          inputDecoratorPrefixIconSchemeColor: SchemeColor.primaryContainer,
          //
          inputCursorSchemeColor: SchemeColor.tertiary,
          inputSelectionSchemeColor: SchemeColor.secondary,
          inputSelectionOpacity: 0.3,
          inputSelectionHandleSchemeColor: SchemeColor.onPrimaryContainer,
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
          dropdownMenuTextStyle: const TextStyle(color: Colors.blue),
          //
          menuRadius: 7,
          menuElevation: 12,
          menuSchemeColor: SchemeColor.onErrorContainer,
          menuOpacity: 0.85,
          menuPadding: const EdgeInsetsDirectional.fromSTEB(4, 5, 6, 7),
          //
          menuBarBackgroundSchemeColor: SchemeColor.background,
          menuBarRadius: 5,
          menuBarElevation: 7,
          menuBarShadowColor: Colors.blueAccent,
          //
          menuItemBackgroundSchemeColor: SchemeColor.surfaceVariant,
          menuItemForegroundSchemeColor: SchemeColor.onBackground,
          menuIndicatorBackgroundSchemeColor: SchemeColor.primaryContainer,
          menuIndicatorForegroundSchemeColor: SchemeColor.onPrimaryContainer,
          menuIndicatorRadius: 6,
          //
          tooltipRadius: 4,
          tooltipWaitDuration: const Duration(milliseconds: 50),
          tooltipShowDuration: const Duration(milliseconds: 500),
          tooltipSchemeColor: SchemeColor.inversePrimary,
          tooltipOpacity: 0.67,
          //
          adaptiveDialogRadius: const FlexAdaptive.appleWeb(),
          dialogRadius: 24,
          dialogRadiusAdaptive: 14,
          dialogElevation: 16,
          dialogBackgroundSchemeColor: SchemeColor.errorContainer,
          useInputDecoratorThemeInDialogs: true,
          datePickerHeaderBackgroundSchemeColor: SchemeColor.surfaceVariant,
          datePickerDialogRadius: 22,
          timePickerDialogRadius: 24,
          //
          snackBarRadius: 6,
          snackBarElevation: 8,
          snackBarBackgroundSchemeColor: SchemeColor.onPrimary,
          snackBarActionSchemeColor: SchemeColor.primary,
          //
          appBarBackgroundSchemeColor: SchemeColor.primary,
          appBarCenterTitle: true,
          appBarScrolledUnderElevation: 4,
          //
          bottomAppBarSchemeColor: SchemeColor.surfaceVariant,
          //
          tabBarItemSchemeColor: SchemeColor.onSecondary,
          tabBarUnselectedItemSchemeColor: SchemeColor.onSurfaceVariant,
          tabBarUnselectedItemOpacity: 0.8,
          tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
          tabBarIndicatorSize: TabBarIndicatorSize.label,
          tabBarIndicatorWeight: 5.0,
          tabBarIndicatorTopRadius: 4.0,
          tabBarDividerColor: Colors.yellow,
          //
          drawerRadius: 10,
          drawerElevation: 14,
          drawerBackgroundSchemeColor: SchemeColor.surfaceVariant,
          drawerWidth: 400,
          drawerIndicatorWidth: 350,
          drawerIndicatorRadius: 12,
          drawerIndicatorSchemeColor: SchemeColor.onErrorContainer,
          drawerIndicatorOpacity: 0.45,
          drawerSelectedItemSchemeColor: SchemeColor.onSecondaryContainer,
          drawerUnselectedItemSchemeColor: SchemeColor.secondaryContainer,
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
          navigationBarIndicatorRadius: 4,
          navigationBarBackgroundSchemeColor: SchemeColor.tertiaryContainer,
          navigationBarOpacity: 0.5,
          navigationBarElevation: 7,
          navigationBarHeight: 58,
          navigationBarLabelBehavior:
              NavigationDestinationLabelBehavior.alwaysShow,
          adaptiveRemoveNavigationBarTint: const FlexAdaptive.desktop(),
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
          navigationRailIndicatorRadius: 7,
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
              'FlexSubThemesData#00000(interactionEffects: true, tintedDisabledControls: true, blendOnLevel : null, blendOnColors: true, useFlutterDefaults: false, adaptiveRemoveElevationTint: null, adaptiveElevationShadowsBack: null, adaptiveAppBarScrollUnderOff: null, adaptiveRadius: null, adaptiveSplash: null, splashType: null, splashTypeAdaptive: null, blendTextTheme: false, useTextTheme: null, useM2StyleDividerInM3: false, defaultRadius: null, defaultRadiusAdaptive: null, buttonMinSize: null, alignedDropdown: null, buttonPadding: null, thickBorderWidth: null, thinBorderWidth: null, textButtonRadius: null, textButtonSchemeColor: null, textButtonTextStyle: null, filledButtonRadius: null, filledButtonSchemeColor: null, filledButtonTextStyle: null, elevatedButtonRadius: null, elevatedButtonElevation: null, elevatedButtonSchemeColor: null, elevatedButtonSecondarySchemeColor: null, elevatedButtonTextStyle: null, outlinedButtonRadius: null, outlinedButtonSchemeColor: null, outlinedButtonOutlineSchemeColor: null, outlinedButtonBorderWidth: null, outlinedButtonPressedBorderWidth: null, outlinedButtonTextStyle: null, toggleButtonsRadius: null, toggleButtonsSchemeColor: null, toggleButtonsUnselectedSchemeColor: null, toggleButtonsBorderSchemeColor: null, toggleButtonsBorderWidth: null, segmentedButtonRadius: null, segmentedButtonSchemeColor: null, segmentedButtonUnselectedSchemeColor: null, segmentedButtonUnselectedForegroundSchemeColor: null, segmentedButtonBorderSchemeColor: null, segmentedButtonBorderWidth: null, materialButtonSchemeColor: null, switchSchemeColor: null, switchThumbSchemeColor: null, switchThumbFixedSize: null, checkboxSchemeColor: null, radioSchemeColor: null, unselectedToggleIsColored: false, sliderBaseSchemeColor: null, sliderIndicatorSchemeColor: null, sliderValueTinted: false, sliderValueIndicatorType: null, sliderShowValueIndicator: null, sliderTrackHeight: null, inputDecoratorRadius: null, inputDecoratorSchemeColor: null, inputDecoratorIsFilled: true, inputDecoratorFillColor: null, inputDecoratorBackgroundAlpha: null, inputDecoratorBorderSchemeColor: null, inputDecoratorBorderType: null, inputDecoratorFocusedHasBorder: true, inputDecoratorUnfocusedHasBorder: true, inputDecoratorUnfocusedBorderIsColored: true, inputDecoratorBorderWidth: null, inputDecoratorFocusedBorderWidth: null, inputDecoratorPrefixIconSchemeColor: null, inputCursorSchemeColor: null, inputSelectionSchemeColor: null, inputSelectionOpacity: null, inputSelectionHandleSchemeColor: null, fabRadius: null, fabUseShape: false, fabAlwaysCircular: false, fabSchemeColor: null, chipRadius: null, chipSchemeColor: null, chipSelectedSchemeColor: null, chipDeleteIconSchemeColor: null, cardRadius: null, cardElevation: null, popupMenuRadius: null, popupMenuElevation: null, popupMenuSchemeColor: null, popupMenuOpacity: null, dropdownMenuTextStyle: null, menuRadius: null, menuElevation: null, menuSchemeColor: null, menuOpacity: null, menuPadding: null, menuBarBackgroundSchemeColor: null, menuBarRadius: null, menuBarElevation: null, menuBarShadowColor: null, menuItemBackgroundSchemeColor: null, menuItemForegroundSchemeColor: null, menuIndicatorBackgroundSchemeColor: null, menuIndicatorForegroundSchemeColor: null, menuIndicatorRadius: null, tooltipRadius: null, tooltipWaitDuration: null, tooltipShowDuration: null, tooltipSchemeColor: null, tooltipOpacity: null, adaptiveDialogRadius: null, dialogRadius: null, dialogRadiusAdaptive: null, dialogElevation: null, dialogBackgroundSchemeColor: null, useInputDecoratorThemeInDialogs: null, datePickerHeaderBackgroundSchemeColor: null, datePickerDialogRadius: null, timePickerDialogRadius: null, timePickerElementRadius: null, snackBarRadius: null, snackBarElevation: null, snackBarBackgroundSchemeColor: null, snackBarActionSchemeColor: null, appBarBackgroundSchemeColor: null, appBarCenterTitle: null, appBarScrolledUnderElevation: null, bottomAppBarSchemeColor: null, tabBarItemSchemeColor: null, tabBarUnselectedItemSchemeColor: null, tabBarUnselectedItemOpacity: null, tabBarIndicatorSchemeColor: null, tabBarIndicatorSize: null, tabBarIndicatorWeight: null, tabBarIndicatorTopRadius: null, tabBarDividerColor: null, drawerRadius: null, drawerElevation: null, drawerBackgroundSchemeColor: null, drawerWidth: null, drawerIndicatorWidth: null, drawerIndicatorRadius: null, drawerIndicatorSchemeColor: null, drawerIndicatorOpacity: null, drawerSelectedItemSchemeColor: null, drawerUnselectedItemSchemeColor: null, bottomSheetBackgroundColor: null, bottomSheetModalBackgroundColor: null, bottomSheetRadius: null, bottomSheetElevation: null, bottomSheetModalElevation: null, bottomNavigationBarLabelTextStyle: null, bottomNavigationBarSelectedLabelSize: null, bottomNavigationBarUnselectedLabelSize: null, bottomNavigationBarSelectedLabelSchemeColor: null, bottomNavigationBarUnselectedLabelSchemeColor: null, bottomNavigationBarMutedUnselectedLabel: true, bottomNavigationBarSelectedIconSize: null, bottomNavigationBarUnselectedIconSize: null, bottomNavigationBarSelectedIconSchemeColor: null, bottomNavigationBarUnselectedIconSchemeColor: null, bottomNavigationBarMutedUnselectedIcon: true, bottomNavigationBarBackgroundSchemeColor: null, bottomNavigationBarOpacity: null, bottomNavigationBarElevation: null, bottomNavigationBarShowSelectedLabels: true, bottomNavigationBarShowUnselectedLabels: true, bottomNavigationBarType: null, bottomNavigationBarLandscapeLayout: null, navigationBarLabelTextStyle: null, navigationBarSelectedLabelSize: null, navigationBarUnselectedLabelSize: null, navigationBarSelectedLabelSchemeColor: null, navigationBarUnselectedLabelSchemeColor: null, navigationBarMutedUnselectedLabel: true, navigationBarSelectedIconSize: null, navigationBarUnselectedIconSize: null, navigationBarSelectedIconSchemeColor: null, navigationBarUnselectedIconSchemeColor: null, navigationBarMutedUnselectedIcon: true, navigationBarIndicatorSchemeColor: null, navigationBarIndicatorOpacity: null, navigationBarIndicatorRadius: null, navigationBarBackgroundSchemeColor: null, navigationBarOpacity: null, navigationBarElevation: null, navigationBarHeight: null, navigationBarLabelBehavior: null, adaptiveRemoveNavigationBarTint: null, navigationRailLabelTextStyle: null, navigationRailSelectedLabelSize: null, navigationRailUnselectedLabelSize: null, navigationRailSelectedLabelSchemeColor: null, navigationRailUnselectedLabelSchemeColor: null, navigationRailMutedUnselectedLabel: true, navigationRailSelectedIconSize: null, navigationRailUnselectedIconSize: null, navigationRailSelectedIconSchemeColor: null, navigationRailUnselectedIconSchemeColor: null, navigationRailMutedUnselectedIcon: true, navigationRailUseIndicator: true, navigationRailIndicatorSchemeColor: null, navigationRailIndicatorOpacity: null, navigationRailIndicatorRadius: null, navigationRailBackgroundSchemeColor: null, navigationRailOpacity: null, navigationRailElevation: null, navigationRailLabelType: null, navigationRailGroupAlignment: null)'));
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
    // This hashcode madness happens here and on few other cases,
    // the code changes from run to run. I have observed this to happen with
    // classes with a lot of properties, with smaller classes it does not happen
    // it remains the same from run to run. But this is one more case where
    // it changes from run to run, so we cannot expect same hashCode as below:
    //
    // test('FSTC1.08b: Test hashCode exact value.', () {
    //   expect(m1.hashCode, equals(350189422));
    // });
    //
    // We can however test this, even with a copyWith with a value that is same
    // as it was, we get a new object with same hashCode, so the variation
    // above is a bit strange, it depends on something that changes the
    // outcome of the hashCode. Some rainy day I would like to understand why.
    test('FSTC1.08c: Test hashCode copyWith has same exact value.', () {
      expect(
          m1.hashCode, equals(m1.copyWith(interactionEffects: true).hashCode));
    });
  });
}
