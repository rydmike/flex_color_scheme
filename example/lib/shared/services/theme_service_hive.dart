import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../utils/app_data_dir/app_data_dir.dart';
import 'theme_service.dart';
import 'theme_service_hive_adapters.dart';

/// A [ThemeService] implementation that stores and retrieves theme settings
/// locally using the package Hive:
/// https://pub.dev/packages/hive
///
/// This service on purpose demonstrates persisting each theme setting value as
/// its own string key and value pair. With this amount of values,
/// bundling them all up in a data class and persisting them all as one big
/// serialized JSON string, with just one settings key, would be more
/// convenient. On the other hand, this is probably more resource
/// efficient and gives us faster saves of persisted slider values, that can
/// be dragged quickly in the UI. Writing this setup for this many properties is
/// a bit error prone, even if it is simple and very mechanical.
///
/// Normally your would probably not have this many settings properties you
/// want to persist locally (or remotely), in that case this approach is also
/// the simpler and more convenient one. In this particular case though, well
/// maybe not with this amount of props.
class ThemeServiceHive implements ThemeService {
  ThemeServiceHive(this.boxName);

  /// The name of the Hive storage box.
  ///
  /// This is the filename without any extension or path, to use for
  /// the Hive storage box, for example: 'my_app_settings'
  final String boxName;

  // Holds an instance to Hive box, must be initialized
  // by the init call before accessing the storage box.
  late final Box<dynamic> _hiveBox;

  /// ThemeServiceHive's init implementation. Must call be before accessing
  /// the storage box.
  ///
  /// - Registers Hive data type adapters for our enum values
  /// - Gets a usable platform appropriate folder where data can be stored.
  /// - Open the box in the folder with name given via class constructor.
  /// - Assign box to local Hive box instance.
  @override
  Future<void> init() async {
    // First register all Hive data type adapters. Used for our enum values.
    registerHiveAdapters();
    // Get platform compatible storage folder for the Hive box,
    // this setup should work on all Flutter platforms. Hive does not do this
    // right, the folder we got with it did not work on Windows. This
    // implementation works and it uses the same folder that SharedPreferences
    // does.
    final String appDataDir = await getAppDataDir();
    // To make it easier to find the files on your device, this should help.
    // Usually you find the "shared_preferences.json" file in the same folder
    // that the ThemeServicePref creates with SharedPreferences. You cannot
    // set the name on that file so all examples would have shared the same
    // settings on local builds if SharedPreferences would have been used for
    // all examples. Wanted to avoid that, which we can do with Hive. Sure we
    // could have used only Hive too, but SharedPreferences is a very popular
    // and sensible choice for this feature, wanted to show how it can be
    // used as well.
    debugPrint('Hive using storage path: $appDataDir and file name: $boxName');
    // Init the Hive box box giving it the platform usable folder.
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
    Hive.registerAdapter(FlexSchemeColorAdapter());
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
    try {
      return _hiveBox.get(ThemeService.keyInteractionEffects,
          defaultValue: ThemeService.defaultInteractionEffects) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultInteractionEffects;
    }
  }

  /// Persists used themed effects setting in example 5.
  @override
  Future<void> saveInteractionEffects(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyInteractionEffects, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used useDefaultRadius setting in example 5.
  @override
  Future<bool> useDefaultRadius() async {
    try {
      return _hiveBox.get(ThemeService.keyUseDefaultRadius,
          defaultValue: ThemeService.defaultUseDefaultRadius) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultUseDefaultRadius;
    }
  }

  /// Persists the useDefaultRadius setting in example 5.
  @override
  Future<void> saveUseDefaultRadius(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyUseDefaultRadius, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used corner radius setting in example 5.
  @override
  Future<double> cornerRadius() async {
    try {
      return _hiveBox.get(ThemeService.keyCornerRadius,
          defaultValue: ThemeService.defaultCornerRadius) as double;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultCornerRadius;
    }
  }

  /// Persists the used corner radius setting in example 5.
  @override
  Future<void> saveCornerRadius(double value) async {
    try {
      await _hiveBox.put(ThemeService.keyCornerRadius, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used inputDecoratorIsFilled setting in example 5.
  @override
  Future<bool> inputDecoratorIsFilled() async {
    try {
      return _hiveBox.get(ThemeService.keyInputDecoratorIsFilled,
          defaultValue: ThemeService.defaultInputDecoratorIsFilled) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultInputDecoratorIsFilled;
    }
  }

  /// Persists used inputDecoratorIsFilled setting in example 5.
  @override
  Future<void> saveInputDecoratorIsFilled(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyInputDecoratorIsFilled, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used inputDecoratorBorderType setting in example 5.
  @override
  Future<FlexInputBorderType> inputDecoratorBorderType() async {
    try {
      return _hiveBox.get(ThemeService.keyInputDecoratorBorderType,
              defaultValue: ThemeService.defaultInputDecoratorBorderType)
          as FlexInputBorderType;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultInputDecoratorBorderType;
    }
  }

  /// Persists used inputDecoratorBorderType setting in example 5.
  @override
  Future<void> saveInputDecoratorBorderType(FlexInputBorderType value) async {
    try {
      await _hiveBox.put(ThemeService.keyInputDecoratorBorderType, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<bool> inputDecoratorUnfocusedHasBorder() async {
    try {
      return _hiveBox.get(ThemeService.keyInputDecoratorUnfocusedHasBorder,
          defaultValue:
              ThemeService.defaultInputDecoratorUnfocusedHasBorder) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultInputDecoratorUnfocusedHasBorder;
    }
  }

  /// Persists used inputDecoratorUnfocusedHasBorder setting in example 5.
  @override
  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value) async {
    try {
      await _hiveBox.put(
          ThemeService.keyInputDecoratorUnfocusedHasBorder, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used inputDecoratorSchemeColor setting in example 5.
  @override
  Future<SchemeColor?> inputDecoratorSchemeColor() async {
    try {
      final dynamic input = _hiveBox.get(
          ThemeService.keyInputDecoratorSchemeColor,
          defaultValue: ThemeService.defaultInputDecoratorSchemeColor);
      // If Hive type adapter converted stored int to null, we don't try to
      // typecast it, we return null instead.
      if (input == null) {
        return null;
      } else {
        return _hiveBox.get(ThemeService.keyInputDecoratorSchemeColor,
                defaultValue: ThemeService.defaultInputDecoratorSchemeColor)
            as SchemeColor;
      }
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultInputDecoratorSchemeColor;
    }
  }

  /// Persists used inputDecoratorSchemeColor setting in example 5.
  @override
  Future<void> saveInputDecoratorSchemeColor(SchemeColor? value) async {
    try {
      await _hiveBox.put(ThemeService.keyInputDecoratorSchemeColor, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used chipSchemeColor setting in example 5.
  @override
  Future<SchemeColor?> chipSchemeColor() async {
    try {
      final dynamic input = _hiveBox.get(ThemeService.keyChipSchemeColor,
          defaultValue: ThemeService.defaultChipSchemeColor);
      // If Hive type adapter converted stored int to null, we don't try to
      // typecast it, we return null instead.
      if (input == null) {
        return null;
      } else {
        return _hiveBox.get(ThemeService.keyChipSchemeColor,
            defaultValue: ThemeService.defaultChipSchemeColor) as SchemeColor;
      }
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultChipSchemeColor;
    }
  }

  /// Persists used chipSchemeColor setting in example 5.
  @override
  Future<void> saveChipSchemeColor(SchemeColor? value) async {
    try {
      await _hiveBox.put(ThemeService.keyNavBarHighlight, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used surface mode setting in example 5.
  @override
  Future<FlexSurfaceMode> surfaceMode() async {
    try {
      return _hiveBox.get(ThemeService.keySurfaceMode,
          defaultValue: ThemeService.defaultSurfaceMode) as FlexSurfaceMode;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultSurfaceMode;
    }
  }

  /// Persists the used surface mode setting in example 5.
  @override
  Future<void> saveSurfaceMode(FlexSurfaceMode value) async {
    try {
      await _hiveBox.put(ThemeService.keySurfaceMode, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used surface blend level setting in example 5.
  @override
  Future<int> blendLevel() async {
    try {
      return _hiveBox.get(ThemeService.keyBlendLevel,
          defaultValue: ThemeService.defaultBlendLevel) as int;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultBlendLevel;
    }
  }

  /// Persists the used surface blend level setting in example 5.
  @override
  Future<void> saveBlendLevel(int value) async {
    try {
      await _hiveBox.put(ThemeService.keyBlendLevel, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used app bar style for light theme setting in example 5.
  @override
  Future<FlexAppBarStyle> lightAppBarStyle() async {
    try {
      return _hiveBox.get(ThemeService.keyLightAppBarStyle,
              defaultValue: ThemeService.defaultLightAppBarStyle)
          as FlexAppBarStyle;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultLightAppBarStyle;
    }
  }

  /// Persists the used app bar style for light theme setting in example 5.
  @override
  Future<void> saveLightAppBarStyle(FlexAppBarStyle value) async {
    try {
      await _hiveBox.put(ThemeService.keyLightAppBarStyle, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used app bar style for dark theme setting in example 5.
  @override
  Future<FlexAppBarStyle> darkAppBarStyle() async {
    try {
      return _hiveBox.get(ThemeService.keyDarkAppBarStyle,
          defaultValue: ThemeService.defaultDarkAppBarStyle) as FlexAppBarStyle;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultDarkAppBarStyle;
    }
  }

  /// Persists the used app bar style for dark theme setting in example 5.
  @override
  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value) async {
    try {
      await _hiveBox.put(ThemeService.keyDarkAppBarStyle, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used app bar opacity setting in example 5.
  @override
  Future<double> appBarOpacity() async {
    try {
      return _hiveBox.get(ThemeService.keyAppBarOpacity,
          defaultValue: ThemeService.defaultAppBarOpacity) as double;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultAppBarOpacity;
    }
  }

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveAppBarOpacity(double value) async {
    try {
      await _hiveBox.put(ThemeService.keyAppBarOpacity, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used app bar elevation setting in example 5.
  @override
  Future<double> appBarElevation() async {
    try {
      return _hiveBox.get(ThemeService.keyAppBarElevation,
          defaultValue: ThemeService.defaultAppBarElevation) as double;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultAppBarElevation;
    }
  }

  /// Persists the used app bar elevation setting in example 5.
  @override
  Future<void> saveAppBarElevation(double value) async {
    try {
      await _hiveBox.put(ThemeService.keyAppBarElevation, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used status bar transparency setting in example 5.
  @override
  Future<bool> transparentStatusBar() async {
    try {
      return _hiveBox.get(ThemeService.keyTransparentStatusBar,
          defaultValue: ThemeService.defaultTransparentStatusBar) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultTransparentStatusBar;
    }
  }

  /// Persists used status bar transparency setting in example 5.
  @override
  Future<void> saveTransparentStatusBar(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyTransparentStatusBar, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used tab bar style setting in example 5.
  @override
  Future<FlexTabBarStyle> tabBarStyle() async {
    try {
      return _hiveBox.get(ThemeService.keyTabBarStyle,
          defaultValue: ThemeService.defaultTabBarStyle) as FlexTabBarStyle;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultTabBarStyle;
    }
  }

  /// Persists used tab bar style setting in example 5.
  @override
  Future<void> saveTabBarStyle(FlexTabBarStyle value) async {
    try {
      await _hiveBox.put(ThemeService.keyTabBarStyle, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used tabBarIndicator setting in example 5.
  @override
  Future<SchemeColor?> tabBarIndicator() async {
    try {
      final dynamic input = _hiveBox.get(ThemeService.keyTabBarIndicator,
          defaultValue: ThemeService.defaultTabBarIndicator);
      // If Hive type adapter converted stored int to null, we don't try to
      // typecast it, we return null instead.
      if (input == null) {
        return null;
      } else {
        return _hiveBox.get(ThemeService.keyTabBarIndicator,
            defaultValue: ThemeService.defaultTabBarIndicator) as SchemeColor;
      }
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultTabBarIndicator;
    }
  }

  /// Persists used tabBarIndicator setting in example 5.
  @override
  Future<void> saveTabBarIndicator(SchemeColor? value) async {
    try {
      await _hiveBox.put(ThemeService.keyTabBarIndicator, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used bottom navigation bar opacity setting in example 5.
  @override
  Future<double> bottomNavigationBarOpacity() async {
    try {
      return _hiveBox.get(ThemeService.keyBottomNavigationBarOpacity,
              defaultValue: ThemeService.defaultBottomNavigationBarOpacity)
          as double;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultBottomNavigationBarOpacity;
    }
  }

  /// Persists the used app bar opacity setting in example 5.
  @override
  Future<void> saveBottomNavigationBarOpacity(double value) async {
    try {
      await _hiveBox.put(ThemeService.keyBottomNavigationBarOpacity, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used bottom navigation bar elevation setting in example 5.
  @override
  Future<double> bottomNavigationBarElevation() async {
    try {
      return _hiveBox.get(ThemeService.keyBottomNavigationBarElevation,
              defaultValue: ThemeService.defaultBottomNavigationBarElevation)
          as double;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultBottomNavigationBarElevation;
    }
  }

  /// Persists the used app bar elevation setting in example 5.
  @override
  Future<void> saveBottomNavigationBarElevation(double value) async {
    try {
      await _hiveBox.put(ThemeService.keyBottomNavigationBarElevation, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used navBarStyle setting in example 5.
  @override
  Future<FlexSystemNavBarStyle> navBarStyle() async {
    try {
      return _hiveBox.get(ThemeService.keyNavBarStyle,
              defaultValue: ThemeService.defaultNavBarStyle)
          as FlexSystemNavBarStyle;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultNavBarStyle;
    }
  }

  /// Persists used navBarStyle setting in example 5.
  @override
  Future<void> saveNavBarStyle(FlexSystemNavBarStyle value) async {
    try {
      await _hiveBox.put(ThemeService.keyNavBarStyle, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used navBarScheme setting in example 5.
  @override
  Future<SchemeColor?> navBarScheme() async {
    try {
      final dynamic input = _hiveBox.get(ThemeService.keyNavBarScheme,
          defaultValue: ThemeService.defaultNavBarScheme);
      // If Hive type adapter converted stored int to null, we don't try to
      // typecast it, we return null instead.
      if (input == null) {
        return null;
      } else {
        return _hiveBox.get(ThemeService.keyNavBarScheme,
            defaultValue: ThemeService.defaultNavBarScheme) as SchemeColor;
      }
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultNavBarScheme;
    }
  }

  /// Persists used navBarScheme setting in example 5.
  @override
  Future<void> saveNavBarScheme(SchemeColor? value) async {
    try {
      await _hiveBox.put(ThemeService.keyNavBarScheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used navBarHighlight setting in example 5.
  @override
  Future<SchemeColor?> navBarHighlight() async {
    try {
      final dynamic input = _hiveBox.get(ThemeService.keyNavBarHighlight,
          defaultValue: ThemeService.defaultNavBarHighlight);
      // If Hive type adapter converted stored int to null, we don't try to
      // typecast it, we return null instead.
      if (input == null) {
        return null;
      } else {
        return _hiveBox.get(ThemeService.keyNavBarHighlight,
            defaultValue: ThemeService.defaultNavBarHighlight) as SchemeColor;
      }
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultNavBarHighlight;
    }
  }

  /// Persists used navBarHighlight setting in example 5.
  @override
  Future<void> saveNavBarHighlight(SchemeColor? value) async {
    try {
      await _hiveBox.put(ThemeService.keyNavBarHighlight, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used navBarMuteUnselected setting in example 5.
  @override
  Future<bool> navBarMuteUnselected() async {
    try {
      return _hiveBox.get(ThemeService.keyNavBarMuteUnselected,
          defaultValue: ThemeService.defaultNavBarMuteUnselected) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultNavBarMuteUnselected;
    }
  }

  /// Persists navBarMuteUnselected setting in example 5.
  @override
  Future<void> saveNavBarMuteUnselected(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyNavBarMuteUnselected, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used useNavDivider setting in example 5.
  @override
  Future<bool> useNavDivider() async {
    try {
      return _hiveBox.get(ThemeService.keyUseNavDivider,
          defaultValue: ThemeService.defaultUseNavDivider) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultUseNavDivider;
    }
  }

  /// Persists useNavDivider setting in example 5.
  @override
  Future<void> saveUseNavDivider(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyUseNavDivider, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads used tooltip style setting in example 5.
  @override
  Future<bool> tooltipsMatchBackground() async {
    try {
      return _hiveBox.get(ThemeService.keyTooltipsMatchBackground,
          defaultValue: ThemeService.defaultTooltipsMatchBackground) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultTooltipsMatchBackground;
    }
  }

  /// Persists used tooltip style setting in example 5.
  @override
  Future<void> saveTooltipsMatchBackground(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyTooltipsMatchBackground, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads swap primary/secondary colors in light mode, in example 5.
  @override
  Future<bool> swapLightColors() async {
    try {
      return _hiveBox.get(ThemeService.keySwapLightColors,
          defaultValue: ThemeService.defaultSwapLightColors) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultSwapLightColors;
    }
  }

  /// Persists swap primary/secondary colors in light mode, in example 5.
  @override
  Future<void> saveSwapLightColors(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keySwapLightColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<bool> swapDarkColors() async {
    try {
      return _hiveBox.get(ThemeService.keySwapDarkColors,
          defaultValue: ThemeService.defaultSwapDarkColors) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultSwapDarkColors;
    }
  }

  /// Persists swap primary/secondary colors in dark mode, in example 5.
  @override
  Future<void> saveSwapDarkColors(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keySwapDarkColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads lightIsWhite setting, in example 5.
  @override
  Future<bool> lightIsWhite() async {
    try {
      return _hiveBox.get(ThemeService.keyLightIsWhite,
          defaultValue: ThemeService.defaultLightIsWhite) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultLightIsWhite;
    }
  }

  /// Persists lightIsWhite setting, in example 5.
  @override
  Future<void> saveLightIsWhite(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyLightIsWhite, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads dark uses true black setting in dark mode, in example 5.
  @override
  Future<bool> darkIsTrueBlack() async {
    try {
      return _hiveBox.get(ThemeService.keyDarkIsTrueBlack,
          defaultValue: ThemeService.defaultDarkIsTrueBlack) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultDarkIsTrueBlack;
    }
  }

  /// Persists dark uses true black setting in dark mode, in example 5.
  @override
  Future<void> saveDarkIsTrueBlack(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyDarkIsTrueBlack, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads use computed dark mode setting, in example 5.
  @override
  Future<bool> useToDarkMethod() async {
    try {
      return _hiveBox.get(ThemeService.keyUseToDarkMethod,
          defaultValue: ThemeService.defaultUseToDarkMethod) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultUseToDarkMethod;
    }
  }

  /// Persists use computed dark mode setting, in example 5.
  @override
  Future<void> saveUseToDarkMethod(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyUseToDarkMethod, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads use computed dark mode level setting, in example 5.
  @override
  Future<int> darkMethodLevel() async {
    try {
      return _hiveBox.get(ThemeService.keyDarkMethodLevel,
          defaultValue: ThemeService.defaultDarkMethodLevel) as int;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultDarkMethodLevel;
    }
  }

  /// Persists use computed dark mode level setting, in example 5.
  @override
  Future<void> saveDarkMethodLevel(int value) async {
    try {
      await _hiveBox.put(ThemeService.keyDarkMethodLevel, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<bool> useFlexColorScheme() async {
    try {
      return _hiveBox.get(ThemeService.keyUseFlexColorScheme,
          defaultValue: ThemeService.defaultUseFlexColorScheme) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultUseFlexColorScheme;
    }
  }

  /// Persists setting that turns ON/OFF FlexColorScheme theme, in example 5.
  @override
  Future<void> saveUseFlexColorScheme(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyUseFlexColorScheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that blends light colors, in example 5.
  @override
  Future<bool> blendLightOnColors() async {
    try {
      return _hiveBox.get(ThemeService.keyBlendLightOnColors,
          defaultValue: ThemeService.defaultBlendLightOnColors) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultBlendLightOnColors;
    }
  }

  /// Persists setting that blends light colors, in example 5.
  @override
  Future<void> saveBlendLightOnColors(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyBlendLightOnColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that blends dark colors, in example 5.
  @override
  Future<bool> blendDarkOnColors() async {
    try {
      return _hiveBox.get(ThemeService.keyBlendDarkOnColors,
          defaultValue: ThemeService.defaultBlendDarkOnColors) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultBlendDarkOnColors;
    }
  }

  /// Persists setting that blends dark colors, in example 5.
  @override
  Future<void> saveBlendDarkOnColors(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyBlendDarkOnColors, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that blends light text theme, in example 5.
  @override
  Future<bool> blendLightTextTheme() async {
    try {
      return _hiveBox.get(ThemeService.keyBlendLightTextTheme,
          defaultValue: ThemeService.defaultBlendLightTextTheme) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultBlendLightTextTheme;
    }
  }

  /// Persists setting that blends light text theme, in example 5.
  @override
  Future<void> saveBlendLightTextTheme(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyBlendLightTextTheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting that blends dark text theme, in example 5.
  @override
  Future<bool> blendDarkTextTheme() async {
    try {
      return _hiveBox.get(ThemeService.keyBlendDarkTextTheme,
          defaultValue: ThemeService.defaultBlendDarkTextTheme) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultBlendDarkTextTheme;
    }
  }

  /// Persists setting that blends dark text theme, in example 5.
  @override
  Future<void> saveBlendDarkTextTheme(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyBlendDarkTextTheme, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for fabUseShape, in example 5.
  @override
  Future<bool> fabUseShape() async {
    try {
      return _hiveBox.get(ThemeService.keyFabUseShape,
          defaultValue: ThemeService.defaultFabUseShape) as bool;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultFabUseShape;
    }
  }

  /// Persists setting for fabUseShape, in example 5.
  @override
  Future<void> saveFabUseShape(bool value) async {
    try {
      await _hiveBox.put(ThemeService.keyFabUseShape, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for primaryLight color, in example 5.
  @override
  Future<Color> primaryLight() async {
    try {
      return _hiveBox.get(ThemeService.keyPrimaryLight,
          defaultValue: ThemeService.defaultPrimaryLight) as Color;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultPrimaryLight;
    }
  }

  /// Persists setting for primaryLight color, in example 5.
  @override
  Future<void> savePrimaryLight(Color value) async {
    try {
      await _hiveBox.put(ThemeService.keyPrimaryLight, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for primaryVariantLight color, in example 5.
  @override
  Future<Color> primaryVariantLight() async {
    try {
      return _hiveBox.get(ThemeService.keyPrimaryVariantLight,
          defaultValue: ThemeService.defaultPrimaryVariantLight) as Color;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultPrimaryVariantLight;
    }
  }

  /// Persists setting for primaryVariantLight color, in example 5.
  @override
  Future<void> savePrimaryVariantLight(Color value) async {
    try {
      await _hiveBox.put(ThemeService.keyPrimaryVariantLight, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for secondaryLight color, in example 5.
  @override
  Future<Color> secondaryLight() async {
    try {
      return _hiveBox.get(ThemeService.keySecondaryLight,
          defaultValue: ThemeService.defaultSecondaryLight) as Color;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultSecondaryLight;
    }
  }

  /// Persists setting for secondaryLight color, in example 5.
  @override
  Future<void> saveSecondaryLight(Color value) async {
    try {
      await _hiveBox.put(ThemeService.keySecondaryLight, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for secondaryVariantLight color, in example 5.
  @override
  Future<Color> secondaryVariantLight() async {
    try {
      return _hiveBox.get(ThemeService.keySecondaryVariantLight,
          defaultValue: ThemeService.defaultSecondaryVariantLight) as Color;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultSecondaryVariantLight;
    }
  }

  /// Persists setting for secondaryVariantLight color, in example 5.
  @override
  Future<void> saveSecondaryVariantLight(Color value) async {
    try {
      await _hiveBox.put(ThemeService.keySecondaryVariantLight, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for primaryDark color, in example 5.
  @override
  Future<Color> primaryDark() async {
    try {
      return _hiveBox.get(ThemeService.keyPrimaryDark,
          defaultValue: ThemeService.defaultPrimaryDark) as Color;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultPrimaryDark;
    }
  }

  /// Persists setting for primaryDark color, in example 5.
  @override
  Future<void> savePrimaryDark(Color value) async {
    try {
      await _hiveBox.put(ThemeService.keyPrimaryDark, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for primaryVariantDark color, in example 5.
  @override
  Future<Color> primaryVariantDark() async {
    try {
      return _hiveBox.get(ThemeService.keyPrimaryVariantDark,
          defaultValue: ThemeService.defaultPrimaryVariantDark) as Color;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultPrimaryVariantDark;
    }
  }

  /// Persists setting for primaryVariantDark color, in example 5.
  @override
  Future<void> savePrimaryVariantDark(Color value) async {
    try {
      await _hiveBox.put(ThemeService.keyPrimaryVariantDark, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for secondaryDark color, in example 5.
  @override
  Future<Color> secondaryDark() async {
    try {
      return _hiveBox.get(ThemeService.keySecondaryDark,
          defaultValue: ThemeService.defaultSecondaryDark) as Color;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultSecondaryDark;
    }
  }

  /// Persists setting for secondaryDark color, in example 5.
  @override
  Future<void> saveSecondaryDark(Color value) async {
    try {
      await _hiveBox.put(ThemeService.keySecondaryDark, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Loads setting for secondaryVariantDark color, in example 5.
  @override
  Future<Color> secondaryVariantDark() async {
    try {
      return _hiveBox.get(ThemeService.keySecondaryVariantDark,
          defaultValue: ThemeService.defaultSecondaryVariantDark) as Color;
    } catch (e) {
      debugPrint(e.toString());
      // If something goes wrong we return the default value.
      return ThemeService.defaultSecondaryVariantDark;
    }
  }

  /// Persists setting for secondaryVariantDark color, in example 5.
  @override
  Future<void> saveSecondaryVariantDark(Color value) async {
    try {
      await _hiveBox.put(ThemeService.keySecondaryVariantDark, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
