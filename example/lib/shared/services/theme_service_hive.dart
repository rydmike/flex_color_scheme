import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';

import '../const/app.dart';
import '../utils/app_data_dir/app_data_dir.dart';
import 'theme_service.dart';
import 'theme_service_hive_adapters.dart';

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off here too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode || true;

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
    if (_debug) {
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
    Hive.registerAdapter(FlexSliderIndicatorTypeAdapter());
    Hive.registerAdapter(ShowValueIndicatorAdapter());
    Hive.registerAdapter(TabBarIndicatorSizeAdapter());
    Hive.registerAdapter(AdaptiveThemeAdapter());
    Hive.registerAdapter(FlexPaletteTypeAdapter());
    Hive.registerAdapter(VisualDensityEnumAdapter());
    Hive.registerAdapter(SplashTypeEnumAdapter());
    Hive.registerAdapter(TabAlignmentAdapter());
    Hive.registerAdapter(FlexFixedColorStyleAdapter());
    Hive.registerAdapter(ListTileStyleAdapter());
    Hive.registerAdapter(ListTileTitleAlignmentAdapter());
    Hive.registerAdapter(ListTileControlAffinityAdapter());
    Hive.registerAdapter(MaterialTapTargetSizeAdapter());
    Hive.registerAdapter(FlexScaffoldBaseColorAdapter());
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
      final dynamic gotValue = _hiveBox.get(key, defaultValue: defaultValue);
      if (_debug) {
        debugPrint('Hive LOAD _______________');
        debugPrint(' Type expected: $key as ${defaultValue.runtimeType}');
        debugPrint(' Type loaded  : $key as ${gotValue.runtimeType}');
        debugPrint(' Value loaded : $gotValue');
      }
      // Add workaround for hive WASM returning double instead of int, when
      // values saved were int.
      // See issue: https://github.com/IO-Design-Team/hive_ce/issues/46
      if (App.isRunningWithWasm &&
          gotValue != null &&
          (gotValue is double) &&
          (defaultValue is int || defaultValue is int?)) {
        final T loaded = gotValue.round() as T;
        if (_debug) {
          debugPrint('   WASM Error : Expected int got double, '
              'returning as int: $loaded');
        }
        return loaded;
      } else {
        final T loaded = gotValue as T;
        return loaded;
      }
    } catch (e) {
      debugPrint('Hive load (get) ERROR');
      debugPrint(' Error message ...... : $e');
      debugPrint(' Store key .......... : $key');
      debugPrint(' defaultValue ....... : $defaultValue');
      if (e is HiveError && e.message.contains('missing type adapter')) {
        // Skip the offending key
        debugPrint(' Missing type adapter : SKIP and return default');
      }
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
        debugPrint('Hive SAVE _______________');
        debugPrint(' Type  : $key as ${value.runtimeType}');
        debugPrint(' Value : $key as $value');
      }
    } catch (e) {
      debugPrint('Hive save (put) ERROR');
      debugPrint(' Error message ...... : $e');
      debugPrint(' Store key .......... : $key');
      debugPrint(' Save value ......... : $value');
    }
  }

  /// Get all stored key-value paris from the SharedPreferences storage.
  @override
  Map<String, dynamic> getAll() {
    // Filter out entries where the value is null.
    final Map<String, dynamic> result = <String, dynamic>{};
    for (final MapEntry<dynamic, dynamic> entry in _hiveBox.toMap().entries) {
      if (entry.value != null) {
        result[entry.key.toString()] = entry.value;
      }
    }
    return result;
  }

  /// Put all key-value pairs into the Hive storage.
  @override
  Future<void> putAll(
    Map<String, dynamic> values, {
    bool clearExisting = true,
  }) async {
    if (clearExisting) {
      await _hiveBox.clear();
    }

    return _hiveBox.putAll(values);
  }

  /// This implementation supports export and import of stored values.
  @override
  bool get supportsExportImport => true;

  /// Clear all stored values.
  @override
  Future<void> clearAll() async {
    await _hiveBox.clear();
  }
}
