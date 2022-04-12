import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../utils/app_data_dir/app_data_dir.dart';
import 'theme_service.dart';
import 'theme_service_hive_adapters.dart';

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off here too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && true;

/// A [ThemeService] implementation that stores and retrieves theme settings
/// locally using the package Hive: https://pub.dev/packages/hive
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
    // choice for this type of feature. I wanted to show how it can be
    // used as well. We always show this path info in none release builds.
    if (!kReleaseMode) {
      debugPrint(
          'Hive using storage path: $appDataDir and file name: $boxName');
    }
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
    Hive.registerAdapter(NavigationDestinationLabelBehaviorAdapter());
    Hive.registerAdapter(NavigationRailLabelTypeAdapter());
  }

  // ----------

  /// Loads a setting from the Theme service, using a key to access it from
  /// the Hive storage box.
  ///
  /// If type <T> is not an atomic Dart type, there must be a
  /// Hive type adapter that converts <T> into one.
  @override
  Future<T> load<T>(String key, T defaultValue) async {
    try {
      final T loaded = _hiveBox.get(key, defaultValue: defaultValue) as T;
      if (_debug) {
        debugPrint('Hive type   : $key as ${defaultValue.runtimeType}');
        debugPrint('Hive loaded : $key as $loaded with ${loaded.runtimeType}');
      }
      return loaded;
    } catch (e) {
      debugPrint('Hive load (get) ERROR');
      debugPrint(' Error message ...... : $e');
      debugPrint(' Store key .......... : $key');
      debugPrint(' defaultValue ....... : $defaultValue');
      // If something goes wrong we return the default value.
      return defaultValue;
    }
  }

  /// Save a setting to the Theme service with the Hive storage box,
  /// using key, as key for the value.
  ///
  /// If type <T> is not an atomic Dart type, there must be a
  /// Hive type adapter that converts <T> into one.
  @override
  Future<void> save<T>(String key, T value) async {
    try {
      await _hiveBox.put(key, value);
      if (_debug) {
        debugPrint('Hive type   : $key as ${value.runtimeType}');
        debugPrint('Hive saved  : $key as $value');
      }
    } catch (e) {
      debugPrint('Hive save (put) ERROR');
      debugPrint(' Error message ...... : $e');
      debugPrint(' Store key .......... : $key');
      debugPrint(' Save value ......... : $value');
    }
  }
}
