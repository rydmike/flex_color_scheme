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
      interactionEffects: false,
      tintedDisabledControls: false,
      blendOnColors: false,
      //
      useM2StyleDividerInM3: false,
      unselectedToggleIsColored: false,
      sliderValueTinted: false,
      //
      inputDecoratorIsFilled: true,
      inputDecoratorFocusedHasBorder: true,
      inputDecoratorUnfocusedHasBorder: true,
      fabUseShape: false,
      fabAlwaysCircular: false,
      searchUseGlobalShape: false,
      //
      bottomNavigationBarShowSelectedLabels: true,
      bottomNavigationBarShowUnselectedLabels: true,
    );
    // m3, one different values than m1 and m2.
    const FlexSubThemesData m3 = FlexSubThemesData(
      interactionEffects: false,
      tintedDisabledControls: false,
      blendOnColors: false,
      //
      useM2StyleDividerInM3: false,
      unselectedToggleIsColored: false,
      sliderValueTinted: false,
      //
      inputDecoratorIsFilled: false, //<- Diff
      inputDecoratorFocusedHasBorder: true,
      inputDecoratorUnfocusedHasBorder: true,
      fabUseShape: false,
      fabAlwaysCircular: false,
      searchUseGlobalShape: false,
      //
      bottomNavigationBarShowSelectedLabels: true,
      bottomNavigationBarShowUnselectedLabels: true,
    );
    // m4, all values different from m1 and m2.
    const FlexSubThemesData m4 = FlexSubThemesData(
      interactionEffects: false,
      tintedDisabledControls: false,
      blendOnColors: true,
      //
      useM2StyleDividerInM3: true,
      unselectedToggleIsColored: true,
      sliderValueTinted: true,
      //
      inputDecoratorIsFilled: false,
      inputDecoratorFocusedHasBorder: false,
      inputDecoratorUnfocusedHasBorder: false,
      fabUseShape: true,
      searchUseGlobalShape: true,
      fabAlwaysCircular: true,
      //
      bottomNavigationBarShowSelectedLabels: false,
      bottomNavigationBarShowUnselectedLabels: false,
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
          interactionEffects: false,
          tintedDisabledControls: false,
          blendOnColors: false,
          //
          useM2StyleDividerInM3: false,
          unselectedToggleIsColored: false,
          sliderValueTinted: false,
          //
          inputDecoratorIsFilled: true,
          inputDecoratorFocusedHasBorder: true,
          inputDecoratorUnfocusedHasBorder: true,
          fabUseShape: false,
          fabAlwaysCircular: false,
          searchUseGlobalShape: false,
          //
          bottomNavigationBarShowSelectedLabels: true,
          bottomNavigationBarShowUnselectedLabels: true,
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
      //
      adaptiveRemoveElevationTint: FlexAdaptive.iOSAndDesktop(),
      adaptiveElevationShadowsBack: FlexAdaptive.apple(),
      adaptiveAppBarScrollUnderOff: FlexAdaptive.excludeAndroidFuchsia(),
      adaptiveRadius: FlexAdaptive.all(),
      adaptiveDialogRadius: FlexAdaptive.appleWeb(),
      adaptiveInputDecoratorRadius: FlexAdaptive.desktop(),
      //
      adaptiveSplash: FlexAdaptive.apple(),
      splashType: FlexSplashType.inkRipple,
      splashTypeAdaptive: FlexSplashType.instantSplash,
      //
      useMaterial3Typography: false,
      useM2StyleDividerInM3: true,
      //
      defaultRadius: 14,
      defaultRadiusAdaptive: 10,
      //
      buttonMinSize: Size(41, 41),
      alignedDropdown: true,
      buttonPadding: EdgeInsets.symmetric(horizontal: 14),
      //
      thickBorderWidth: 3,
      thinBorderWidth: 2,
      //
      textButtonRadius: 10,
      textButtonSchemeColor: SchemeColor.surface,
      // HOLD Testing this, it kills equality checks.
      // textButtonTextStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      //
      filledButtonRadius: 13,
      filledButtonSchemeColor: SchemeColor.secondary,
      // TODO(rydmike): Hold https://github.com/flutter/flutter/issues/115827
      // filledButtonTonalRadius: 14,
      // filledButtonTonalSchemeColor: SchemeColor.primaryContainer,
      // HOLD Testing this, it kills equality checks.
      // filledButtonTextStyle: HOLD Testing this, it kills equality checks.
      //
      elevatedButtonRadius: 12,
      elevatedButtonElevation: 4,
      elevatedButtonSchemeColor: SchemeColor.primary,
      elevatedButtonSecondarySchemeColor: SchemeColor.onPrimary,
      // HOLD Testing this, it kills equality checks.
      // elevatedButtonTextStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      //
      outlinedButtonRadius: 14,
      outlinedButtonSchemeColor: SchemeColor.surface,
      outlinedButtonOutlineSchemeColor: SchemeColor.outline,
      outlinedButtonBorderWidth: 2,
      outlinedButtonPressedBorderWidth: 5,
      // HOLD Testing this, it kills equality checks.
      // outlinedButtonTextStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      //
      toggleButtonsRadius: 10,
      toggleButtonsSchemeColor: SchemeColor.tertiaryContainer,
      toggleButtonsSelectedForegroundSchemeColor: SchemeColor.primaryContainer,
      toggleButtonsUnselectedSchemeColor: SchemeColor.secondaryContainer,
      toggleButtonsBorderSchemeColor: SchemeColor.outline,
      toggleButtonsBorderWidth: 3,
      toggleButtonsTextStyle: TextStyle(),
      //
      segmentedButtonRadius: 11,
      segmentedButtonSchemeColor: SchemeColor.secondary,
      segmentedButtonSelectedForegroundSchemeColor: SchemeColor.onSurface,
      segmentedButtonUnselectedSchemeColor: SchemeColor.tertiaryContainer,
      segmentedButtonUnselectedForegroundSchemeColor: SchemeColor.surface,
      segmentedButtonBorderSchemeColor: SchemeColor.outlineVariant,
      segmentedButtonBorderWidth: 1.5,
      // HOLD Testing this, it kills equality checks.
      // segmentedButtonTextStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      //
      scaffoldBackgroundBaseColor: FlexScaffoldBaseColor.surfaceContainerLowest,
      scaffoldBackgroundSchemeColor: SchemeColor.surfaceContainerLow,
      //
      materialButtonSchemeColor: SchemeColor.tertiary,
      //
      switchSchemeColor: SchemeColor.inversePrimary,
      switchThumbSchemeColor: SchemeColor.onTertiary,
      switchThumbFixedSize: true,
      switchAdaptiveCupertinoLike: FlexAdaptive.apple(),
      //
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
      inputDecoratorIsDense: true,
      inputDecoratorContentPadding: EdgeInsets.all(8),
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
      inputDecoratorPrefixIconSchemeColor: SchemeColor.secondary,
      inputDecoratorSuffixIconSchemeColor: SchemeColor.primary,
      //
      inputCursorSchemeColor: SchemeColor.tertiary,
      inputSelectionSchemeColor: SchemeColor.secondary,
      inputSelectionOpacity: 0.3,
      inputSelectionHandleSchemeColor: SchemeColor.onPrimaryContainer,
      //
      listTileSelectedSchemeColor: SchemeColor.primary,
      listTileIconSchemeColor: SchemeColor.onSurface,
      listTileTextSchemeColor: SchemeColor.onSurface,
      listTileTitleTextStyle: TextStyle(),
      listTileSubtitleTextStyle: TextStyle(),
      listTileLeadingAndTrailingTextStyle: TextStyle(),
      listTileTileSchemeColor: SchemeColor.transparent,
      listTileSelectedTileSchemeColor: SchemeColor.transparent,
      listTileContentPadding: EdgeInsets.zero,
      listTileHorizontalTitleGap: 4,
      listTileMinVerticalPadding: 4,
      listTileStyle: ListTileStyle.list,
      listTileTitleAlignment: ListTileTitleAlignment.threeLine,
      listTileControlAffinity: ListTileControlAffinity.trailing,
      //
      fabRadius: 12,
      fabUseShape: true,
      fabAlwaysCircular: true,
      fabSchemeColor: SchemeColor.primary,
      fabForegroundSchemeColor: SchemeColor.secondaryContainer,
      fabExtendedTextStyle: TextStyle(),
      //
      chipRadius: 20,
      chipBlendColors: true,
      chipSchemeColor: SchemeColor.secondaryContainer,
      chipSelectedSchemeColor: SchemeColor.onSecondaryContainer,
      chipSecondarySelectedSchemeColor: SchemeColor.onTertiaryContainer,
      chipDeleteIconSchemeColor: SchemeColor.error,
      chipLabelStyle: TextStyle(),
      chipSecondaryLabelStyle: TextStyle(),
      chipFontSize: 14,
      chipSecondaryFontSize: 12,
      chipIconSize: 24,
      chipPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
      // HOLD Testing this, it kills equality checks.
      // menuButtonTextStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      //
      menuBarBackgroundSchemeColor: SchemeColor.surfaceContainer,
      menuBarRadius: 5,
      menuBarElevation: 7,
      menuBarShadowColor: Colors.blueAccent,
      //
      menuItemBackgroundSchemeColor: SchemeColor.surfaceContainerHighest,
      menuItemForegroundSchemeColor: SchemeColor.onSurface,
      menuIndicatorBackgroundSchemeColor: SchemeColor.primaryContainer,
      menuIndicatorForegroundSchemeColor: SchemeColor.onPrimaryContainer,
      menuIndicatorRadius: 6,
      //
      searchBarBackgroundSchemeColor: SchemeColor.surfaceContainer,
      searchViewBackgroundSchemeColor: SchemeColor.surfaceContainer,
      searchBarElevation: 5,
      searchViewElevation: 4,
      searchBarRadius: 10,
      searchViewRadius: 0,
      searchUseGlobalShape: true,
      searchViewHeaderHeight: 60,
      // HOLD Testing this, it kills equality checks.
      // searchBarTextStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      searchViewHeaderTextStyle: TextStyle(),
      // searchBarHintStyle:
      //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
      searchViewHeaderHintStyle: TextStyle(),
      searchViewDividerColor: Colors.red,
      searchBarShadowColor: Colors.purple,
      searchBarTextCapitalization: TextCapitalization.sentences,
      searchBarPadding: EdgeInsets.all(8),
      searchBarConstraints: BoxConstraints(maxHeight: 60),
      searchViewConstraints: BoxConstraints(maxHeight: 60),
      //
      tooltipRadius: 4,
      tooltipWaitDuration: Duration(milliseconds: 50),
      tooltipShowDuration: Duration(milliseconds: 500),
      tooltipSchemeColor: SchemeColor.inversePrimary,
      tooltipOpacity: 0.67,
      //
      useInputDecoratorThemeInDialogs: true,
      //
      dialogRadius: 24,
      dialogRadiusAdaptive: 14,
      dialogElevation: 16,
      dialogBackgroundSchemeColor: SchemeColor.errorContainer,
      dialogTitleTextStyle: TextStyle(),
      dialogContentTextStyle: TextStyle(),
      //
      datePickerHeaderBackgroundSchemeColor: SchemeColor.surfaceContainerHigh,
      datePickerHeaderForegroundSchemeColor: SchemeColor.onSurface,
      datePickerDialogRadius: 22,
      datePickerDividerSchemeColor: SchemeColor.scrim,
      datePickerHeaderHeadlineStyle: TextStyle(),
      datePickerHeaderHelpStyle: TextStyle(),
      datePickerWeekdayStyle: TextStyle(),
      datePickerDayStyle: TextStyle(),
      datePickerYearStyle: TextStyle(),
      datePickerRangePickerHeaderHeadlineStyle: TextStyle(),
      datePickerRangePickerHeaderHelpStyle: TextStyle(),
      //
      timePickerDialogRadius: 24,
      timePickerElementRadius: 12,
      timePickerDayPeriodTextStyle: TextStyle(),
      timePickerDialTextStyle: TextStyle(),
      timePickerHelpTextStyle: TextStyle(),
      timePickerHourMinuteTextStyle: TextStyle(),
      //
      snackBarRadius: 6,
      snackBarElevation: 8,
      snackBarBackgroundSchemeColor: SchemeColor.onPrimary,
      snackBarActionSchemeColor: SchemeColor.primary,
      snackBarContentTextStyle: TextStyle(),
      //
      appBarBackgroundSchemeColor: SchemeColor.primary,
      appBarForegroundSchemeColor: SchemeColor.primaryContainer,
      appBarIconSchemeColor: SchemeColor.onPrimary,
      appBarActionsIconSchemeColor: SchemeColor.onSecondary,
      appBarCenterTitle: true,
      appBarScrolledUnderElevation: 4,
      appBarToolbarTextStyle: TextStyle(),
      appBarTitleTextStyle: TextStyle(),
      //
      bottomAppBarSchemeColor: SchemeColor.surfaceContainer,
      bottomAppBarHeight: 70,
      //
      tabBarItemSchemeColor: SchemeColor.onSecondary,
      tabBarUnselectedItemSchemeColor: SchemeColor.onSurfaceVariant,
      tabBarUnselectedItemOpacity: 0.8,
      tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
      tabBarIndicatorSize: TabBarIndicatorSize.label,
      tabBarIndicatorWeight: 5.0,
      tabBarIndicatorTopRadius: 4.0,
      tabBarDividerColor: Colors.yellow,
      tabBarTabAlignment: TabAlignment.center,
      //
      drawerRadius: 10,
      drawerElevation: 14,
      drawerBackgroundSchemeColor: SchemeColor.surfaceContainerLow,
      drawerWidth: 400,
      drawerIndicatorWidth: 350,
      drawerIndicatorRadius: 12,
      drawerIndicatorSchemeColor: SchemeColor.onErrorContainer,
      drawerIndicatorOpacity: 0.45,
      drawerSelectedItemSchemeColor: SchemeColor.onSecondaryContainer,
      drawerUnselectedItemSchemeColor: SchemeColor.secondaryContainer,
      //
      bottomSheetBackgroundColor: SchemeColor.surfaceContainerLow,
      bottomSheetModalBackgroundColor: SchemeColor.surfaceContainerLow,
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
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surfaceContainer,
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
      navigationRailBackgroundSchemeColor: SchemeColor.surface,
      navigationRailIndicatorOpacity: 0.8,
      navigationRailIndicatorRadius: 7,
      navigationRailOpacity: 1,
      navigationRailElevation: 6,
      navigationRailLabelType: NavigationRailLabelType.all,
      navigationRailGroupAlignment: 1,
      navigationRailMinWidth: 80,
      navigationRailMinExtendedWidth: 200,
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
          //
          adaptiveRemoveElevationTint: const FlexAdaptive.iOSAndDesktop(),
          adaptiveElevationShadowsBack: const FlexAdaptive.apple(),
          adaptiveAppBarScrollUnderOff:
              const FlexAdaptive.excludeAndroidFuchsia(),
          adaptiveRadius: const FlexAdaptive.all(),
          adaptiveDialogRadius: const FlexAdaptive.appleWeb(),
          adaptiveInputDecoratorRadius: const FlexAdaptive.desktop(),
          //
          adaptiveSplash: const FlexAdaptive.apple(),
          splashType: FlexSplashType.inkRipple,
          splashTypeAdaptive: FlexSplashType.instantSplash,
          //
          useMaterial3Typography: false,
          useM2StyleDividerInM3: true,
          //
          defaultRadius: 14,
          defaultRadiusAdaptive: 10,
          //
          buttonMinSize: const Size(41, 41),
          alignedDropdown: true,
          buttonPadding: const EdgeInsets.symmetric(horizontal: 14),
          //
          thickBorderWidth: 3,
          thinBorderWidth: 2,
          //
          textButtonRadius: 10,
          textButtonSchemeColor: SchemeColor.surface,
          // HOLD Testing this, it kills equality checks.
          // textButtonTextStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          //
          filledButtonRadius: 13,
          filledButtonSchemeColor: SchemeColor.secondary,
          // TODO(rydmike): Hold https://github.com/flutter/flutter/issues/115827
          // filledButtonTonalRadius: 14,
          // filledButtonTonalSchemeColor: SchemeColor.primaryContainer,
          // HOLD Testing this, it kills equality checks.
          // filledButtonTextStyle: HOLD Testing this, it kills equality checks.
          //
          elevatedButtonRadius: 12,
          elevatedButtonElevation: 4,
          elevatedButtonSchemeColor: SchemeColor.primary,
          elevatedButtonSecondarySchemeColor: SchemeColor.onPrimary,
          // HOLD Testing this, it kills equality checks.
          // elevatedButtonTextStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          //
          outlinedButtonRadius: 14,
          outlinedButtonSchemeColor: SchemeColor.surface,
          outlinedButtonOutlineSchemeColor: SchemeColor.outline,
          outlinedButtonBorderWidth: 2,
          outlinedButtonPressedBorderWidth: 5,
          // HOLD Testing this, it kills equality checks.
          // outlinedButtonTextStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          //
          toggleButtonsRadius: 10,
          toggleButtonsSchemeColor: SchemeColor.tertiaryContainer,
          toggleButtonsSelectedForegroundSchemeColor:
              SchemeColor.primaryContainer,
          toggleButtonsUnselectedSchemeColor: SchemeColor.secondaryContainer,
          toggleButtonsBorderSchemeColor: SchemeColor.outline,
          toggleButtonsBorderWidth: 3,
          toggleButtonsTextStyle: const TextStyle(),
          //
          segmentedButtonRadius: 11,
          segmentedButtonSchemeColor: SchemeColor.secondary,
          segmentedButtonSelectedForegroundSchemeColor: SchemeColor.onSurface,
          segmentedButtonUnselectedSchemeColor: SchemeColor.tertiaryContainer,
          segmentedButtonUnselectedForegroundSchemeColor: SchemeColor.surface,
          segmentedButtonBorderSchemeColor: SchemeColor.outlineVariant,
          segmentedButtonBorderWidth: 1.5,
          // HOLD Testing this, it kills equality checks.
          // segmentedButtonTextStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          //
          scaffoldBackgroundBaseColor:
              FlexScaffoldBaseColor.surfaceContainerLowest,
          scaffoldBackgroundSchemeColor: SchemeColor.surfaceContainerLow,
          //
          materialButtonSchemeColor: SchemeColor.tertiary,
          //
          switchSchemeColor: SchemeColor.inversePrimary,
          switchThumbSchemeColor: SchemeColor.onTertiary,
          switchThumbFixedSize: true,
          switchAdaptiveCupertinoLike: const FlexAdaptive.apple(),
          //
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
          inputDecoratorIsDense: true,
          inputDecoratorContentPadding: const EdgeInsets.all(8),
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
          inputDecoratorPrefixIconSchemeColor: SchemeColor.secondary,
          inputDecoratorSuffixIconSchemeColor: SchemeColor.primary,
          //
          inputCursorSchemeColor: SchemeColor.tertiary,
          inputSelectionSchemeColor: SchemeColor.secondary,
          inputSelectionOpacity: 0.3,
          inputSelectionHandleSchemeColor: SchemeColor.onPrimaryContainer,
          //
          listTileSelectedSchemeColor: SchemeColor.primary,
          listTileIconSchemeColor: SchemeColor.onSurface,
          listTileTextSchemeColor: SchemeColor.onSurface,
          listTileTitleTextStyle: const TextStyle(),
          listTileSubtitleTextStyle: const TextStyle(),
          listTileLeadingAndTrailingTextStyle: const TextStyle(),
          listTileTileSchemeColor: SchemeColor.transparent,
          listTileSelectedTileSchemeColor: SchemeColor.transparent,
          listTileContentPadding: EdgeInsets.zero,
          listTileHorizontalTitleGap: 4,
          listTileMinVerticalPadding: 4,
          listTileStyle: ListTileStyle.list,
          listTileTitleAlignment: ListTileTitleAlignment.threeLine,
          listTileControlAffinity: ListTileControlAffinity.trailing,
          //
          fabRadius: 12,
          fabUseShape: true,
          fabAlwaysCircular: true,
          fabSchemeColor: SchemeColor.primary,
          fabForegroundSchemeColor: SchemeColor.secondaryContainer,
          fabExtendedTextStyle: const TextStyle(),
          //
          chipRadius: 20,
          chipBlendColors: true,
          chipSchemeColor: SchemeColor.secondaryContainer,
          chipSelectedSchemeColor: SchemeColor.onSecondaryContainer,
          chipSecondarySelectedSchemeColor: SchemeColor.onTertiaryContainer,
          chipDeleteIconSchemeColor: SchemeColor.error,
          chipLabelStyle: const TextStyle(),
          chipSecondaryLabelStyle: const TextStyle(),
          chipFontSize: 14,
          chipSecondaryFontSize: 12,
          chipIconSize: 24,
          chipPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          // HOLD Testing this, it kills equality checks.
          // menuButtonTextStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          //
          menuBarBackgroundSchemeColor: SchemeColor.surfaceContainer,
          menuBarRadius: 5,
          menuBarElevation: 7,
          menuBarShadowColor: Colors.blueAccent,
          //
          menuItemBackgroundSchemeColor: SchemeColor.surfaceContainerHighest,
          menuItemForegroundSchemeColor: SchemeColor.onSurface,
          menuIndicatorBackgroundSchemeColor: SchemeColor.primaryContainer,
          menuIndicatorForegroundSchemeColor: SchemeColor.onPrimaryContainer,
          menuIndicatorRadius: 6,
          //
          searchBarBackgroundSchemeColor: SchemeColor.surfaceContainer,
          searchViewBackgroundSchemeColor: SchemeColor.surfaceContainer,
          searchBarElevation: 5,
          searchViewElevation: 4,
          searchBarRadius: 10,
          searchViewRadius: 0,
          searchUseGlobalShape: true,
          searchViewHeaderHeight: 60,
          // HOLD Testing this, it kills equality checks.
          // searchBarTextStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          searchViewHeaderTextStyle: const TextStyle(),
          // searchBarHintStyle:
          //     MaterialStateProperty.all<TextStyle?>(const TextStyle()),
          searchViewHeaderHintStyle: const TextStyle(),
          searchViewDividerColor: Colors.red,
          searchBarShadowColor: Colors.purple,
          searchBarTextCapitalization: TextCapitalization.sentences,
          searchBarPadding: const EdgeInsets.all(8),
          searchBarConstraints: const BoxConstraints(maxHeight: 60),
          searchViewConstraints: const BoxConstraints(maxHeight: 60),
          //
          tooltipRadius: 4,
          tooltipWaitDuration: const Duration(milliseconds: 50),
          tooltipShowDuration: const Duration(milliseconds: 500),
          tooltipSchemeColor: SchemeColor.inversePrimary,
          tooltipOpacity: 0.67,
          //
          useInputDecoratorThemeInDialogs: true,
          //
          dialogRadius: 24,
          dialogRadiusAdaptive: 14,
          dialogElevation: 16,
          dialogBackgroundSchemeColor: SchemeColor.errorContainer,
          dialogTitleTextStyle: const TextStyle(),
          dialogContentTextStyle: const TextStyle(),
          //
          datePickerHeaderBackgroundSchemeColor:
              SchemeColor.surfaceContainerHigh,
          datePickerHeaderForegroundSchemeColor: SchemeColor.onSurface,
          datePickerDialogRadius: 22,
          datePickerDividerSchemeColor: SchemeColor.scrim,
          datePickerHeaderHeadlineStyle: const TextStyle(),
          datePickerHeaderHelpStyle: const TextStyle(),
          datePickerWeekdayStyle: const TextStyle(),
          datePickerDayStyle: const TextStyle(),
          datePickerYearStyle: const TextStyle(),
          datePickerRangePickerHeaderHeadlineStyle: const TextStyle(),
          datePickerRangePickerHeaderHelpStyle: const TextStyle(),
          //
          timePickerDialogRadius: 24,
          timePickerElementRadius: 12,
          timePickerDayPeriodTextStyle: const TextStyle(),
          timePickerDialTextStyle: const TextStyle(),
          timePickerHelpTextStyle: const TextStyle(),
          timePickerHourMinuteTextStyle: const TextStyle(),
          //
          snackBarRadius: 6,
          snackBarElevation: 8,
          snackBarBackgroundSchemeColor: SchemeColor.onPrimary,
          snackBarActionSchemeColor: SchemeColor.primary,
          snackBarContentTextStyle: const TextStyle(),
          //
          appBarBackgroundSchemeColor: SchemeColor.primary,
          appBarForegroundSchemeColor: SchemeColor.primaryContainer,
          appBarIconSchemeColor: SchemeColor.onPrimary,
          appBarActionsIconSchemeColor: SchemeColor.onSecondary,
          appBarCenterTitle: true,
          appBarScrolledUnderElevation: 4,
          appBarToolbarTextStyle: const TextStyle(),
          appBarTitleTextStyle: const TextStyle(),
          //
          bottomAppBarSchemeColor: SchemeColor.surfaceContainer,
          bottomAppBarHeight: 70,
          //
          tabBarItemSchemeColor: SchemeColor.onSecondary,
          tabBarUnselectedItemSchemeColor: SchemeColor.onSurfaceVariant,
          tabBarUnselectedItemOpacity: 0.8,
          tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
          tabBarIndicatorSize: TabBarIndicatorSize.label,
          tabBarIndicatorWeight: 5.0,
          tabBarIndicatorTopRadius: 4.0,
          tabBarDividerColor: Colors.yellow,
          tabBarTabAlignment: TabAlignment.center,
          //
          drawerRadius: 10,
          drawerElevation: 14,
          drawerBackgroundSchemeColor: SchemeColor.surfaceContainerLow,
          drawerWidth: 400,
          drawerIndicatorWidth: 350,
          drawerIndicatorRadius: 12,
          drawerIndicatorSchemeColor: SchemeColor.onErrorContainer,
          drawerIndicatorOpacity: 0.45,
          drawerSelectedItemSchemeColor: SchemeColor.onSecondaryContainer,
          drawerUnselectedItemSchemeColor: SchemeColor.secondaryContainer,
          //
          bottomSheetBackgroundColor: SchemeColor.surfaceContainerLow,
          bottomSheetModalBackgroundColor: SchemeColor.surfaceContainerLow,
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
          bottomNavigationBarBackgroundSchemeColor:
              SchemeColor.surfaceContainer,
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
          navigationRailBackgroundSchemeColor: SchemeColor.surface,
          navigationRailIndicatorOpacity: 0.8,
          navigationRailIndicatorRadius: 7,
          navigationRailOpacity: 1,
          navigationRailElevation: 6,
          navigationRailLabelType: NavigationRailLabelType.all,
          navigationRailGroupAlignment: 1,
          navigationRailMinWidth: 80,
          navigationRailMinExtendedWidth: 200,
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
              'FlexSubThemesData#00000(interactionEffects: false, tintedDisabledControls: false, blendOnLevel : null, blendOnColors: false, adaptiveRemoveElevationTint: null, adaptiveElevationShadowsBack: null, adaptiveAppBarScrollUnderOff: null, adaptiveRadius: null, adaptiveDialogRadius: null, adaptiveInputDecoratorRadius: null, adaptiveSplash: null, splashType: null, splashTypeAdaptive: null, useMaterial3Typography: null, useM2StyleDividerInM3: false, defaultRadius: null, defaultRadiusAdaptive: null, buttonMinSize: null, alignedDropdown: null, buttonPadding: null, thickBorderWidth: null, thinBorderWidth: null, textButtonRadius: null, textButtonSchemeColor: null, textButtonTextStyle: null, filledButtonRadius: null, filledButtonSchemeColor: null, filledButtonTextStyle: null, elevatedButtonRadius: null, elevatedButtonElevation: null, elevatedButtonSchemeColor: null, elevatedButtonSecondarySchemeColor: null, elevatedButtonTextStyle: null, outlinedButtonRadius: null, outlinedButtonSchemeColor: null, outlinedButtonOutlineSchemeColor: null, outlinedButtonBorderWidth: null, outlinedButtonPressedBorderWidth: null, outlinedButtonTextStyle: null, toggleButtonsRadius: null, toggleButtonsSchemeColor: null, toggleButtonsSelectedForegroundSchemeColor: null, toggleButtonsUnselectedSchemeColor: null, toggleButtonsBorderSchemeColor: null, toggleButtonsBorderWidth: null, toggleButtonsTextStyle: null, segmentedButtonRadius: null, segmentedButtonSchemeColor: null, segmentedButtonSelectedForegroundSchemeColor: null, segmentedButtonUnselectedSchemeColor: null, segmentedButtonUnselectedForegroundSchemeColor: null, segmentedButtonBorderSchemeColor: null, segmentedButtonBorderWidth: null, segmentedButtonTextStyle: null, scaffoldBackgroundBaseColor: null, scaffoldBackgroundSchemeColor: null, materialButtonSchemeColor: null, switchSchemeColor: null, switchThumbSchemeColor: null, switchThumbFixedSize: null, switchAdaptiveCupertinoLike: null, checkboxSchemeColor: null, radioSchemeColor: null, unselectedToggleIsColored: false, sliderBaseSchemeColor: null, sliderIndicatorSchemeColor: null, sliderValueTinted: false, sliderValueIndicatorType: null, sliderShowValueIndicator: null, sliderTrackHeight: null, inputDecoratorRadius: null, inputDecoratorRadiusAdaptive: null, inputDecoratorSchemeColor: null, inputDecoratorContentPadding: null, inputDecoratorIsDense: null, inputDecoratorIsFilled: true, inputDecoratorFillColor: null, inputDecoratorBackgroundAlpha: null, inputDecoratorBorderSchemeColor: null, inputDecoratorBorderType: null, inputDecoratorFocusedHasBorder: true, inputDecoratorUnfocusedHasBorder: true, inputDecoratorUnfocusedBorderIsColored: null, inputDecoratorBorderWidth: null, inputDecoratorFocusedBorderWidth: null, inputDecoratorPrefixIconSchemeColor: null, inputDecoratorSuffixIconSchemeColor: null, inputCursorSchemeColor: null, inputSelectionSchemeColor: null, inputSelectionOpacity: null, inputSelectionHandleSchemeColor: null, listTileSelectedSchemeColor: null, listTileIconSchemeColor: null, listTileTextSchemeColor: null, listTileTitleTextStyle: null, listTileSubtitleTextStyle: null, listTileLeadingAndTrailingTextStyle: null, listTileTileSchemeColor: null, listTileSelectedTileSchemeColor: null, listTileContentPadding: null, listTileHorizontalTitleGap: null, listTileMinVerticalPadding: null, listTileStyle: null, listTileTitleAlignment: null, listTileControlAffinity: null, fabRadius: null, fabUseShape: false, fabAlwaysCircular: false, fabSchemeColor: null, fabForegroundSchemeColor: null, fabExtendedTextStyle: null, chipRadius: null, chipBlendColors: null, chipSchemeColor: null, chipSelectedSchemeColor: null, chipSecondarySelectedSchemeColor: null, chipDeleteIconSchemeColor: null, chipLabelStyle: null, chipSecondaryLabelStyle: null, chipFontSize: null, chipSecondaryFontSize: null, chipIconSize: null, chipPadding: null, cardRadius: null, cardElevation: null, popupMenuRadius: null, popupMenuElevation: null, popupMenuSchemeColor: null, popupMenuOpacity: null, dropdownMenuTextStyle: null, menuRadius: null, menuElevation: null, menuSchemeColor: null, menuOpacity: null, menuPadding: null, menuButtonTextStyle: null, menuBarBackgroundSchemeColor: null, menuBarRadius: null, menuBarElevation: null, menuBarShadowColor: null, menuItemBackgroundSchemeColor: null, menuItemForegroundSchemeColor: null, menuIndicatorBackgroundSchemeColor: null, menuIndicatorForegroundSchemeColor: null, menuIndicatorRadius: null, tooltipRadius: null, tooltipWaitDuration: null, tooltipShowDuration: null, tooltipSchemeColor: null, tooltipOpacity: null, searchBarBackgroundSchemeColor: null, searchViewBackgroundSchemeColor: null, searchBarElevation: null, searchViewElevation: null, searchBarRadius: null, searchViewRadius: null, searchUseShape: false, searchViewHeaderHeight: null, searchBarTextStyle: null, searchViewHeaderTextStyle: null, searchBarHintStyle: null, searchViewHeaderHintStyle: null, searchViewDividerColor: null, searchBarShadowColor: null, searchBarTextCapitalization: null, searchBarPadding: null, searchBarConstraints: null, searchViewConstraints: null, useInputDecoratorThemeInDialogs: null, dialogRadius: null, dialogRadiusAdaptive: null, dialogElevation: null, dialogBackgroundSchemeColor: null, dialogTitleTextStyle: null, dialogContentTextStyle: null, datePickerHeaderBackgroundSchemeColor: null, datePickerHeaderForegroundSchemeColor: null, datePickerDialogRadius: null, datePickerDividerSchemeColor: null, datePickerHeaderHeadlineStyle: null, datePickerHeaderHelpStyle: null, datePickerWeekdayStyle: null, datePickerDayStyle: null, datePickerYearStyle: null, datePickerRangePickerHeaderHeadlineStyle: null, datePickerRangePickerHeaderHelpStyle: null, timePickerDialogRadius: null, timePickerElementRadius: null, timePickerDayPeriodTextStyle: null, timePickerDialTextStyle: null, timePickerHelpTextStyle: null, timePickerHourMinuteTextStyle: null, snackBarRadius: null, snackBarElevation: null, snackBarBackgroundSchemeColor: null, snackBarActionSchemeColor: null, snackBarContentTextStyle: null, appBarBackgroundSchemeColor: null, appBarForegroundSchemeColor: null, appBarIconSchemeColor: null, appBarActionsIconSchemeColor: null, appBarCenterTitle: null, appBarScrolledUnderElevation: null, appBarToolbarTextStyle: null, appBarTitleTextStyle: null, bottomAppBarSchemeColor: null, bottomAppBarHeight: null, tabBarItemSchemeColor: null, tabBarUnselectedItemSchemeColor: null, tabBarUnselectedItemOpacity: null, tabBarIndicatorSchemeColor: null, tabBarIndicatorSize: null, tabBarIndicatorWeight: null, tabBarIndicatorTopRadius: null, tabBarDividerColor: null, tabBarTabAlignment: null, drawerRadius: null, drawerElevation: null, drawerBackgroundSchemeColor: null, drawerWidth: null, drawerIndicatorWidth: null, drawerIndicatorRadius: null, drawerIndicatorSchemeColor: null, drawerIndicatorOpacity: null, drawerSelectedItemSchemeColor: null, drawerUnselectedItemSchemeColor: null, bottomSheetBackgroundColor: null, bottomSheetModalBackgroundColor: null, bottomSheetRadius: null, bottomSheetElevation: null, bottomSheetModalElevation: null, bottomNavigationBarLabelTextStyle: null, bottomNavigationBarSelectedLabelSize: null, bottomNavigationBarUnselectedLabelSize: null, bottomNavigationBarSelectedLabelSchemeColor: null, bottomNavigationBarUnselectedLabelSchemeColor: null, bottomNavigationBarMutedUnselectedLabel: null, bottomNavigationBarSelectedIconSize: null, bottomNavigationBarUnselectedIconSize: null, bottomNavigationBarSelectedIconSchemeColor: null, bottomNavigationBarUnselectedIconSchemeColor: null, bottomNavigationBarMutedUnselectedIcon: null, bottomNavigationBarBackgroundSchemeColor: null, bottomNavigationBarOpacity: null, bottomNavigationBarElevation: null, bottomNavigationBarShowSelectedLabels: true, bottomNavigationBarShowUnselectedLabels: true, bottomNavigationBarType: null, bottomNavigationBarLandscapeLayout: null, navigationBarLabelTextStyle: null, navigationBarSelectedLabelSize: null, navigationBarUnselectedLabelSize: null, navigationBarSelectedLabelSchemeColor: null, navigationBarUnselectedLabelSchemeColor: null, navigationBarMutedUnselectedLabel: null, navigationBarSelectedIconSize: null, navigationBarUnselectedIconSize: null, navigationBarSelectedIconSchemeColor: null, navigationBarUnselectedIconSchemeColor: null, navigationBarMutedUnselectedIcon: null, navigationBarIndicatorSchemeColor: null, navigationBarIndicatorOpacity: null, navigationBarIndicatorRadius: null, navigationBarBackgroundSchemeColor: null, navigationBarOpacity: null, navigationBarElevation: null, navigationBarHeight: null, navigationBarLabelBehavior: null, adaptiveRemoveNavigationBarTint: null, navigationRailLabelTextStyle: null, navigationRailSelectedLabelSize: null, navigationRailUnselectedLabelSize: null, navigationRailSelectedLabelSchemeColor: null, navigationRailUnselectedLabelSchemeColor: null, navigationRailMutedUnselectedLabel: null, navigationRailSelectedIconSize: null, navigationRailUnselectedIconSize: null, navigationRailSelectedIconSchemeColor: null, navigationRailUnselectedIconSchemeColor: null, navigationRailMutedUnselectedIcon: null, navigationRailUseIndicator: null, navigationRailIndicatorSchemeColor: null, navigationRailIndicatorOpacity: null, navigationRailIndicatorRadius: null, navigationRailBackgroundSchemeColor: null, navigationRailOpacity: null, navigationRailElevation: null, navigationRailLabelType: null, navigationRailGroupAlignment: null, navigationRailMinWidth: null, navigationRailMinExtendedWidth: null)'));
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
          m1.hashCode, equals(m1.copyWith(interactionEffects: false).hashCode));
    });
  });
}
