import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../utils/app_data_dir/app_data_dir.dart';
import 'theme_service.dart';
import 'theme_service_hive_adapters.dart';

// TODO(rydmike): Implement HIVE based persistence - WIP.
/// A themes service that stores and retrieves theme settings locally using
/// package Hive.
class ThemeServiceHive implements ThemeService {
  ThemeServiceHive(this.boxName);

  /// The name of the have storage box.
  ///
  /// This is the filename without any extension or path, that you want to
  /// use for your Hive storage box. Fore example: 'my_app_settings'
  final String boxName;

  /// Hold an instance to Hive box, must be initialized
  // by the init call before accessing the stored data.

  late final Box<dynamic> _hiveBox;

  /// ThemeServiceMem implementations needs no init, it is just a no op.
  @override
  Future<void> init() async {
    // First register all Hive data type adapters. Used for our enum values.
    registerHiveAdapters();
    // Get platform compatible storage folder for the Hive box,
    // this setup should work on all Flutter platforms, Hive does not do this
    // right, the folder we got with it did not work on Windows, this
    // implementation work and it uses the same folder that SharedPreferences
    // does, well at least on Windows.
    final String appDataDir = await getAppDataDir();
    // To make it easier to find the files on your device, this should help.
    // Usually you find the "shared_preferences.json" file in the same folder
    // that the ThemeServicePref creates with SharedPreferences. You cannot
    // set the name on that file so all examples would have shared the same
    // settings on local builds SharedPreferences would have been used for all
    // examples. Wanted to avoid that, which we can do with Hive. Sure we
    // could have used only Hive too, but SharedPreferences is a very popular
    // and sensible choice for this feature, so we wanted to show how it may
    // be used as well.
    debugPrint('Hive using storage path: $appDataDir and file name: $boxName');
    // Init the Hive box box giving it its platform usable folder.
    Hive.init(appDataDir);
    // Open the Hive box with passed in name, we just keep it open all the
    // time in this demo app.
    await Hive.openBox<dynamic>(boxName);
    // Assign the box to our instance.
    _hiveBox = Hive.box<dynamic>(boxName);
  }

  // Register all custom Hive data adapters.
  void registerHiveAdapters() {
    Hive.registerAdapter(ThemeModeAdapter());
    Hive.registerAdapter(ColorAdapter());
    Hive.registerAdapter(FlexSchemeAdapter());
    Hive.registerAdapter(FlexSurfaceModeAdapter());
    Hive.registerAdapter(FlexInputBorderTypeAdapter());
    Hive.registerAdapter(FlexTabBarStyleAdapter());
    Hive.registerAdapter(FlexAppBarStyleAdapter());
    Hive.registerAdapter(FlexSystemNavBarStyleAdapter());
  }

  /// Loads the ThemeMode from the Hive Storage box.
  @override
  Future<ThemeMode> themeMode() async {
    try {
      return _hiveBox.get(ThemeService.keyThemeMode,
          defaultValue: ThemeService.defaultThemeMode) as ThemeMode;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultThemeMode;
    }
  }

  /// Persists the ThemeMode to Hive Storage box for examples 2, 3, 4 and 5.
  @override
  Future<void> saveThemeMode(ThemeMode value) async {
    try {
      await _hiveBox.put(ThemeService.keyThemeMode, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads the useSubThemes from Hive box for examples 2, 3, 4 and 5.
  @override
  Future<bool> useSubThemes() async {
    try {
      return _hiveBox.get(ThemeService.keyUseSubThemes,
          defaultValue: ThemeService.defaultUseSubThemes) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultUseSubThemes;
    }
  }

  /// Persists the useSubThemes from Hive box for examples 2, 3, 4 and 5.
  @override
  Future<void> saveUseSubThemes(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyUseSubThemes, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads the useTextTheme setting for example 5.
  @override
  Future<bool> useTextTheme() async {
    try {
      return _hiveBox.get(ThemeService.keyUseTextTheme,
          defaultValue: ThemeService.defaultUseTextTheme) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultUseTextTheme;
    }
  }

  /// Persists the useTextTheme setting for example 5.
  @override
  Future<void> saveUseTextTheme(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyUseTextTheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads the used scheme setting for example 3.
  @override
  Future<FlexScheme> usedScheme() async {
    try {
      return _hiveBox.get(ThemeService.keyUsedScheme,
          defaultValue: ThemeService.defaultUsedScheme) as FlexScheme;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultUsedScheme;
    }
  }

  /// Persists the used scheme setting for example 3.
  @override
  Future<void> saveUsedScheme(FlexScheme value) async {
    try {
      await _hiveBox.put(ThemeService.keyUsedScheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used scheme index setting for examples 4 and 5.
  @override
  Future<int> schemeIndex() async {
    try {
      return _hiveBox.get(ThemeService.keySchemeIndex,
          defaultValue: ThemeService.defaultSchemeIndex) as int;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultSchemeIndex;
    }
  }

  /// Persists the used scheme setting for examples 4 and 5.
  @override
  Future<void> saveSchemeIndex(int value) async {
    try {
      await _hiveBox.put(ThemeService.keySchemeIndex, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used themed effects setting in example 5.
  @override
  Future<bool> interactionEffects() async {
    return ThemeService.defaultInteractionEffects;
  }

  /// Persists used themed effects setting in example 5.
  @override
  Future<void> saveInteractionEffects(bool value) async {}

  /// Loads used useDefaultRadius setting in example 5.
  @override
  Future<bool> useDefaultRadius() async => ThemeService.defaultUseDefaultRadius;

  /// Persists the useDefaultRadius setting in example 5.
  @override
  Future<void> saveUseDefaultRadius(bool value) async {}

  /// Loads used corner radius setting in example 5.
  @override
  Future<double> cornerRadius() async => ThemeService.defaultCornerRadius;

  /// Persists the used corner radius setting in example 5.
  @override
  Future<void> saveCornerRadius(double value) async {}

  /// Loads used inputDecoratorIsFilled setting in example 5.
  @override
  Future<bool> inputDecoratorIsFilled() async =>
      ThemeService.defaultInputDecoratorIsFilled;

  /// Persists used inputDecoratorIsFilled setting in example 5.
  @override
  Future<void> saveInputDecoratorIsFilled(bool value) async {}

  /// Loads used inputDecoratorBorderType setting in example 5.
  @override
  Future<FlexInputBorderType> inputDecoratorBorderType() async =>
      ThemeService.defaultInputDecoratorBorderType;

  /// Persists used inputDecoratorBorderType setting in example 5.
  @override
  Future<void> saveInputDecoratorBorderType(FlexInputBorderType value) async {}

  /// Loads used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<bool> inputDecoratorUnfocusedHasBorder() async =>
      ThemeService.defaultInputDecoratorUnfocusedHasBorder;

  /// Persists used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value) async {}

  /// Loads used surface mode setting in example 5.
  @override
  Future<FlexSurfaceMode> surfaceMode() async =>
      ThemeService.defaultSurfaceMode;

  /// Persists the used surface mode setting in example 5.
  @override
  Future<void> saveSurfaceMode(FlexSurfaceMode value) async {}

  /// Loads used surface blend level setting in example 5.

  @override
  Future<int> blendLevel() async => ThemeService.defaultBlendLevel;

  /// Persists the used surface blend level setting in example 5.
  @override
  Future<void> saveBlendLevel(int value) async {}

  /// Loads used app bar style for light theme setting in example 5.
  @override
  Future<FlexAppBarStyle> lightAppBarStyle() async =>
      ThemeService.defaultLightAppBarStyle;

  /// Persists the used app bar style for light theme setting in example 5.
  @override
  Future<void> saveLightAppBarStyle(FlexAppBarStyle value) async {}

  /// Loads used app bar style for dark theme setting in example 5.
  @override
  Future<FlexAppBarStyle> darkAppBarStyle() async =>
      ThemeService.defaultDarkAppBarStyle;

  /// Persists the used app bar style for dark theme setting in example 5.
  @override
  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value) async {}

  /// Loads used app bar opacity setting in example 5.
  @override
  Future<double> appBarOpacity() async => ThemeService.defaultAppBarOpacity;

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveAppBarOpacity(double value) async {}

  /// Loads used app bar elevation setting in example 5.
  @override
  Future<double> appBarElevation() async => ThemeService.defaultAppBarElevation;

  /// Persists the used app bar elevation setting in example 5.
  @override
  Future<void> saveAppBarElevation(double value) async {}

  /// Loads used status bar transparency setting in example 5.
  @override
  Future<bool> transparentStatusBar() async =>
      ThemeService.defaultTransparentStatusBar;

  /// Persists used status bar transparency setting in example 5.
  @override
  Future<void> saveTransparentStatusBar(bool value) async {}

  /// Loads used tab bar style setting in example 5.
  @override
  Future<FlexTabBarStyle> tabBarStyle() async =>
      ThemeService.defaultTabBarStyle;

  /// Persists used tab bar style setting in example 5.
  @override
  Future<void> saveTabBarStyle(FlexTabBarStyle value) async {}

  /// Loads used bottom navigation bar opacity setting in example 5.
  @override
  Future<double> bottomNavigationBarOpacity() async =>
      ThemeService.defaultBottomNavigationBarOpacity;

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveBottomNavigationBarOpacity(double value) async {}

  /// Loads used bottom navigation bar elevation setting in example 5.
  @override
  Future<double> bottomNavigationBarElevation() async =>
      ThemeService.defaultBottomNavigationBarElevation;

  /// Persists the used app bar elevation setting in example 5.
  @override
  Future<void> saveBottomNavigationBarElevation(double value) async {}

  /// Loads used navBarStyle setting in example 5.
  @override
  Future<FlexSystemNavBarStyle> navBarStyle() async =>
      ThemeService.defaultNavBarStyle;

  /// Persists used navBarStyle setting in example 5.
  @override
  Future<void> saveNavBarStyle(FlexSystemNavBarStyle value) async {}

  /// Loads used useNavDivider setting in example 5.
  @override
  Future<bool> useNavDivider() async => ThemeService.defaultUseNavDivider;

  /// Persists useNavDivider setting in example 5.
  @override
  Future<void> saveUseNavDivider(bool value) async {}

  /// Loads used tooltip style setting in example 5.
  @override
  Future<bool> tooltipsMatchBackground() async =>
      ThemeService.defaultTooltipsMatchBackground;

  /// Persists used tooltip style setting in example 5.
  @override
  Future<void> saveTooltipsMatchBackground(bool value) async {}

  /// Loads swap primary/secondary colors in light mode, in example 5.
  @override
  Future<bool> swapLightColors() async => ThemeService.defaultSwapLightColors;

  /// Persists swap primary/secondary colors in light mode, in example 5.
  @override
  Future<void> saveSwapLightColors(bool value) async {}

  /// Loads swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<bool> swapDarkColors() async => ThemeService.defaultSwapDarkColors;

  /// Persists swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<void> saveSwapDarkColors(bool value) async {}

  /// Loads lightIsWhite setting, in example 5.
  @override
  Future<bool> lightIsWhite() async => ThemeService.defaultLightIsWhite;

  /// Persists lightIsWhite setting, in example 5.
  @override
  Future<void> saveLightIsWhite(bool value) async {}

  /// Loads dark uses true black setting in dark mode, in example 5.
  @override
  Future<bool> darkIsTrueBlack() async => ThemeService.defaultDarkIsTrueBlack;

  /// Persists dark uses true black setting in dark mode, in example 5.
  @override
  Future<void> saveDarkIsTrueBlack(bool value) async {}

  /// Loads use computed dark mode setting, in example 5.
  @override
  Future<bool> useToDarkMethod() async => ThemeService.defaultUseToDarkMethod;

  /// Persists use computed dark mode setting, in example 5.
  @override
  Future<void> saveUseToDarkMethod(bool value) async {}

  /// Loads use computed dark mode level setting, in example 5.
  @override
  Future<int> darkMethodLevel() async => ThemeService.defaultDarkMethodLevel;

  /// Persists use computed dark mode level setting, in example 5.
  @override
  Future<void> saveDarkMethodLevel(int value) async {}

  /// Loads setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<bool> useFlexColorScheme() async =>
      ThemeService.defaultUseFlexColorScheme;

  /// Persists setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<void> saveUseFlexColorScheme(bool value) async {}

  /// Loads setting that blends light colors, in example 5.
  @override
  Future<bool> blendLightOnColors() async =>
      ThemeService.defaultBlendLightOnColors;

  /// Persists setting that blends light colors, in example 5.
  @override
  Future<void> saveBlendLightOnColors(bool value) async {}

  /// Loads setting that blends dark colors, in example 5.
  @override
  Future<bool> blendDarkOnColors() async =>
      ThemeService.defaultBlendDarkOnColors;

  /// Persists setting that blends dark colors, in example 5.
  @override
  Future<void> saveBlendDarkOnColors(bool value) async {}

  /// Loads setting that blends light text theme, in example 5.
  @override
  Future<bool> blendLightTextTheme() async =>
      ThemeService.defaultBlendLightTextTheme;

  /// Persists setting that blends light text theme, in example 5.
  @override
  Future<void> saveBlendLightTextTheme(bool value) async {}

  /// Loads setting that blends dark text theme, in example 5.
  @override
  Future<bool> blendDarkTextTheme() async =>
      ThemeService.defaultBlendDarkTextTheme;

  /// Persists setting that blends dark text theme, in example 5.
  @override
  Future<void> saveBlendDarkTextTheme(bool value) async {}

  /// Loads setting for fabUseShape, in example 5.
  @override
  Future<bool> fabUseShape() async => ThemeService.defaultFabUseShape;

  /// Persists setting for fabUseShape, in example 5.
  @override
  Future<void> saveFabUseShape(bool value) async {}
}
