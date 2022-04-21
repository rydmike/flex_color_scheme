import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/same_types.dart';
import 'theme_service.dart';
// ignore_for_file: comment_references

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off there too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && true;

/// A [ThemeService] implementation that stores and retrieves theme settings
/// locally using the package Shared Preferences:
/// https://pub.dev/packages/shared_preferences
class ThemeServicePrefs implements ThemeService {
  // Hold an instance to the SharedPreferences store, must be initialized
  // by the init call before accessing the stored data.
  late final SharedPreferences _prefs;

  /// ThemeServicePrefs initialization.
  ///
  /// Must be called before using it.
  ///
  /// Just get the shared preference instance with its static getter.
  /// We keep the handle to it in the instance so we do not need to get it
  /// more than once during the lifetime of this app.
  ///
  /// The application only actually loads settings once when it starts, after
  /// that settings are in kept in memory and saved when changed, but
  /// never read back before app is started again.
  @override
  Future<void> init() async {
    // Get the SharedPreferences instance and assign it to our instance.
    _prefs = await SharedPreferences.getInstance();
  }

  // Loads a setting from the Theme service, using a key to access it from
  // the SharedPreferences storage.
  //
  // SharedPreference does not have type adaptors, but we can handle the
  // different types internally in a a single load wrapper.
  //
  // SharedPreferences cannot handle saving and loading "NULL" values like
  // Hive can. We could use the absence of a value for a key to represent
  // "NULL", but what if we need to have a none null default value when a
  // key does not exist yet? The key should also be able to represent
  // null. You would then have pre-populate the key value store with these
  // default values, in order to not get "null" as its default value.
  //
  // When you reset the key-value store you can go with a choice of removing
  // all keys, and letting the app coded default values come into effect when
  // a key is missing. Or we can go the route used in this app, that it just
  // sets and save from defaults changed key-value pairs to the store,
  // with the value set to the coded default value.
  // In this app we have chosen the latter style, so after a
  // first reset to default, we would with shared prefs and "no key" as null
  // representation get the correct default. However, we want the produced
  // defaults to be the same even if you completely delete the local key-value
  // storage and start the app.
  //
  // Why do we need to store null? Null should not represent anything!
  // Right, but in this app many theme property settings have meaning when they
  // are null, it typically means we want to use Flutter SDK default theme
  // style. We need to be able to persist and represent this setting for such
  // properties as well, but we do not want that choice to be the default
  // choice in this app for some of the properties. We thus need to be able
  // to represent "null" as an active choice to use the SDK default style, and
  // the SDK will need "null" as its input value for those choices as well.
  //
  // To be able to also use SharedPreferences as a persistence service for
  // this app, we use a few simple rules.
  //
  // bool   : Null is not supported, null can be sent to 'save', but is stored
  //          as false and returned as false when loaded.
  // int    : Any loaded negative number is returned as null.
  // double : Any loaded negative number is returned as null.
  // String : String value <NULL> is returned as null.
  // Color  : Any loaded negative number is returned as null, and any loaded
  //          value higher than 0xFFFFFFFF is returned as default value.
  // Enum   : Any loaded negative value is returned as null, and any over bounds
  //          of enum range, for the enum type, is returned as default value.
  //
  // We can do this because this app does not need to persist any negative
  // values, nor any null bool. Sure Flutter SDK has many bool inputs that can
  // be "null", but it defaults to true/false when that is the case. So
  // selecting the value that gives you the default SDK behavior for bool
  // inputs is not a problem, you just have to know what the default fallback
  // is.
  //
  // For now this works OK for the use cases for this application.
  // Generally though, prefer using Hive for key-value pair storage, it handles
  // this better and it is faster. Compared to the Hive implementation this
  // is about 600 LoC and Hive with type adapters is about 300.
  @override
  Future<T> load<T>(String key, T defaultValue) async {
    try {
      if (_debug) {
        debugPrint('SharedPrefs has type .......... : $key '
            'as ${defaultValue.runtimeType}');
      }
      // T is boolean nullable value.
      if (sameTypes<T, bool?>()) {
        final bool? value = _prefs.getBool(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded type bool?   : $key as $value');
        }
        // If value is null, we had no key for it, we should return the
        // default value, that may also be null, but it might not be too,
        // but it will be of nullable bool type.
        if (value == null) return defaultValue;
        // else we return the value.
        return value as T;
        // return Future<T>(() => value as T);
      }
      // T is boolean none nullable value.
      if (sameTypes<T, bool>()) {
        // For a non nullable, we can just use the defaultValue as fallback if
        // a key did not exist.
        final bool value = _prefs.getBool(key) ?? defaultValue as bool;
        if (_debug) {
          debugPrint('SharedPrefs loaded type bool    : $key as $value');
        }
        return value as T;
        // return Future<T>(() => value as T);
      }
      // T is integer nullable value.
      if (sameTypes<T, int?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded type int?    : $key as $value');
        }
        // If value is null, we had no key for it, we should return the
        // default value, that may also be null, but it might not be too,
        // but it will be of nullable int type.
        if (value == null) return defaultValue;
        // If it was not null, but was less than zero, that we use to represent
        // stored null, we will return null of type T.
        if (value < 0) return null as T;
        // else we return the value.
        return value as T;
        // return Future<T>(() => value as T);
      }
      // T is integer none nullable value.
      if (sameTypes<T, int>()) {
        // For a non nullable, we can just use the defaultValue as fallback if
        // a key did not exist.
        final int value = _prefs.getInt(key) ?? defaultValue as int;
        if (_debug) {
          debugPrint('SharedPrefs loaded type int     : $key as $value');
        }
        // else we return the value.
        return value as T;
        // return Future<T>(() => value as T);
      }
      // T is double nullable value.
      if (sameTypes<T, double?>()) {
        final double? value = _prefs.getDouble(key) ?? defaultValue as double?;
        if (_debug) {
          debugPrint('SharedPrefs loaded type double? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0.0) return null as T;
        return value as T;
        // return Future<T>(() => value as T);
      }
      // T is double none nullable value.
      if (sameTypes<T, double>()) {
        final double value = _prefs.getDouble(key) ?? defaultValue as double;
        if (_debug) {
          debugPrint('SharedPrefs loaded type double  : $key as $value');
        }
        return value as T;
        // return Future<T>(() => value as T);
      }
      // T is String nullable value.
      if (sameTypes<T, String?>()) {
        final String? value = _prefs.getString(key) ?? defaultValue as String?;
        if (_debug) {
          debugPrint('SharedPrefs loaded type String? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value == '<NULL>') return null as T;
        return value as T;
        // return Future<T>(() => value as T);
      }
      // T is String none nullable value.
      if (sameTypes<T, String>()) {
        final String value = _prefs.getString(key) ?? defaultValue as String;
        if (_debug) {
          debugPrint('SharedPrefs loaded type String  : $key as $value');
        }
        return value as T;
        // return Future<T>(() => value as T);
      }
      // T is Color nullable value.
      if (sameTypes<T, Color?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded Color?       : $key as $value');
        }
        // If value is null, we had no key for it, we should return the
        // default value, that may also be null, but it might not be too,
        // but it will be of nullable Color type.
        if (value == null) return defaultValue;
        // Return negative out of bounds Color value as null as T;
        if (value < 0x00000000) return null as T;
        // Return positive out of bounds Color value as default value;
        if (value > 0xFFFFFFFF) return defaultValue;
        // else we return the value as a Color of type T.
        return Color(value) as T;
        // return Future<T>(() => Color(value) as T);
      }
      // T is Color none nullable value.
      if (sameTypes<T, Color>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded Color        : $key as $value');
        }
        // If value is null, we had no key for it, we should return the
        // default value, that is a none nullable Color.
        if (value == null) return defaultValue;
        // Return negative out of bounds Color value as null as T;
        if (value < 0x00000000) return null as T;
        // Return positive out of bounds Color value as default value;
        if (value > 0xFFFFFFFF) return defaultValue;
        // else we return the value as a Color of type T.
        return Color(value) as T;
        // return Future<T>(() => Color(value) as T);
      }
      // We have to explicitly handle each Enum type we have stored to be able
      // to convert it back to its type, which we have in its type parameter.
      //
      // T is ThemeMode nullable value.
      if (sameTypes<T, ThemeMode?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded ThemeMode?   : $key as $value');
        }
        // If value is null, we had no key for it, we should return the
        // default value, that may also be null, but it might not be too,
        // but it will be of nullable ThemeMode type.
        if (value == null) return defaultValue;
        // Return negative out of Enum bounds value as null;
        if (value < 0) return null as T;
        // Return positive out of bounds index value as default value;
        if (value >= ThemeMode.values.length) return defaultValue;
        // else we return the value as a ThemeMode of type T.
        return ThemeMode.values[value] as T;
      }
      // T is ThemeMode none nullable value.
      if (sameTypes<T, ThemeMode>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded ThemeMode    : $key as $value');
        }
        // If value is null, we had no key for it, we should return the
        // default value, that may also be null, but it might not be too,
        // but it will be of nullable ThemeMode type.
        if (value == null) return defaultValue;
        // Return negative out of Enum bounds value as default value;
        if (value < 0) return defaultValue;
        // Return positive out of bounds index value as default value;
        if (value >= ThemeMode.values.length) return defaultValue;
        // else we return the value as a ThemeMode of type T.
        return ThemeMode.values[value] as T;
      }
      //
      // The rest of the supported Enum types are a repeat of the above pattern.
      //
      // T is FlexScheme nullable value.
      if (sameTypes<T, FlexScheme?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexScheme?  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexScheme.values.length) return defaultValue;
        return FlexScheme.values[value] as T;
      }
      // T is FlexScheme none nullable value.
      if (sameTypes<T, FlexScheme>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexScheme   : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexScheme.values.length) return defaultValue;
        return FlexScheme.values[value] as T;
      }
      // T is FlexSurfaceMode nullable value.
      if (sameTypes<T, FlexSurfaceMode?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexSurfaceMode? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexSurfaceMode.values.length) return defaultValue;
        return FlexSurfaceMode.values[value] as T;
      }
      // T is FlexSurfaceMode none nullable value.
      if (sameTypes<T, FlexSurfaceMode>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexSurfaceMode  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexSurfaceMode.values.length) return defaultValue;
        return FlexSurfaceMode.values[value] as T;
      }
      // T is FlexInputBorderType nullable value.
      if (sameTypes<T, FlexInputBorderType?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded FlexInputBorderType? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexInputBorderType.values.length) return defaultValue;
        return FlexInputBorderType.values[value] as T;
      }
      // T is FlexInputBorderType none nullable value.
      if (sameTypes<T, FlexInputBorderType>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded FlexInputBorderType  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexInputBorderType.values.length) return defaultValue;
        return FlexInputBorderType.values[value] as T;
      }
      // T is FlexAppBarStyle nullable value.
      if (sameTypes<T, FlexAppBarStyle?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexAppBarStyle? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexAppBarStyle.values.length) return defaultValue;
        return FlexAppBarStyle.values[value] as T;
      }
      // T is FlexAppBarStyle none nullable value.
      if (sameTypes<T, FlexAppBarStyle>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexAppBarStyle  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexAppBarStyle.values.length) return defaultValue;
        return FlexAppBarStyle.values[value] as T;
      }
      // T is FlexTabBarStyle nullable value.
      if (sameTypes<T, FlexTabBarStyle?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexTabBarStyle? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexTabBarStyle.values.length) return defaultValue;
        return FlexTabBarStyle.values[value] as T;
      }
      // T is FlexTabBarStyle none nullable value.
      if (sameTypes<T, FlexTabBarStyle>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded FlexTabBarStyle  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexTabBarStyle.values.length) return defaultValue;
        return FlexTabBarStyle.values[value] as T;
      }
      // T is FlexSystemNavBarStyle nullable value.
      if (sameTypes<T, FlexSystemNavBarStyle?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded FlexSystemNavBarStyle? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= FlexSystemNavBarStyle.values.length) return defaultValue;
        return FlexSystemNavBarStyle.values[value] as T;
      }
      // T is FlexSystemNavBarStyle none nullable value.
      if (sameTypes<T, FlexSystemNavBarStyle>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded FlexSystemNavBarStyle  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= FlexSystemNavBarStyle.values.length) return defaultValue;
        return FlexSystemNavBarStyle.values[value] as T;
      }
      // T is SchemeColor nullable value.
      if (sameTypes<T, SchemeColor?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded SchemeColor? : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= SchemeColor.values.length) return defaultValue;
        return SchemeColor.values[value] as T;
      }
      // T is SchemeColor none nullable value.
      if (sameTypes<T, SchemeColor>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded SchemeColor  : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= SchemeColor.values.length) return defaultValue;
        return SchemeColor.values[value] as T;
      }
      // T is NavigationDestinationLabelBehavior nullable value.
      if (sameTypes<T, NavigationDestinationLabelBehavior?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded NavigationDestinationLabelBehavior? '
              ': $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= NavigationDestinationLabelBehavior.values.length) {
          return defaultValue;
        }
        return NavigationDestinationLabelBehavior.values[value] as T;
      }
      // T is NavigationDestinationLabelBehavior none nullable value.
      if (sameTypes<T, NavigationDestinationLabelBehavior>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint('SharedPrefs loaded NavigationDestinationLabelBehavior '
              ': $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= NavigationDestinationLabelBehavior.values.length) {
          return defaultValue;
        }
        return NavigationDestinationLabelBehavior.values[value] as T;
      }
      // T is NavigationRailLabelType nullable value.
      if (sameTypes<T, NavigationRailLabelType?>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded NavigationRailLabelType?: $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return null as T;
        if (value >= NavigationRailLabelType.values.length) return defaultValue;
        return NavigationRailLabelType.values[value] as T;
      }
      // T is NavigationRailLabelType none nullable value.
      if (sameTypes<T, NavigationRailLabelType>()) {
        final int? value = _prefs.getInt(key);
        if (_debug) {
          debugPrint(
              'SharedPrefs loaded NavigationRailLabelType : $key as $value');
        }
        if (value == null) return defaultValue;
        if (value < 0) return defaultValue;
        if (value >= NavigationRailLabelType.values.length) return defaultValue;
        return NavigationRailLabelType.values[value] as T;
      }
    } catch (e) {
      debugPrint('SharedPrefs load ERROR');
      debugPrint(' Error message ...... : $e');
      debugPrint(' Store key .......... : $key');
      debugPrint(' defaultValue ....... : $defaultValue');
      // If something goes wrong we return the default value.
      return defaultValue;
    }
    // If we did not have a type converter, we return the default value.
    return defaultValue;
  }

  // Save a setting to the Theme service with the SharedPreferences storage
  // using key, as key for the value.
  //
  // SharedPreferences cannot handle saving "NULL" values like Hive can.
  // In this app many theme property settings have meaning when they
  // are null, it typically means we are using Flutter SDK default theme
  // style. We need to be able to persist and represent this setting.
  // To be able to also use SharedPreferences as a persistence service for
  // this app, we use a few simple rules.
  //
  // int    : Null is saved as -1
  // double : Null is saved as -1.0
  // String : Null is saved as string <NULL>
  // Enum   : Null is saved as -1
  // Color  : Null is saved as -1
  // bool   : Null is not supported, but allowed, but saved as false.
  //
  // The app does not need to persist any negative values, nor any null bool,
  // so for now this works OK for the use case in this scenario.
  // Generally though, just use Hive for key-value pair storage, it handles
  // this better and is faster.
  @override
  Future<void> save<T>(String key, T value) async {
    try {
      // Save a nullable bool value.
      if (sameTypes<T, bool?>()) {
        if (value == null) {
          await _prefs.setBool(key, false);
          if (_debug) {
            debugPrint('SharedPrefs saved type bool?    : $key NULL as $value');
          }
          return;
        } else {
          await _prefs.setBool(key, value as bool);
          if (_debug) {
            debugPrint('SharedPrefs saved type bool?    : $key as $value');
          }
          return;
        }
      }
      // Save a none nullable bool value.
      if (sameTypes<T, bool>()) {
        await _prefs.setBool(key, value as bool);
        if (_debug) {
          debugPrint('SharedPrefs saved type bool     : $key as $value');
        }
        return;
      }
      // Save a nullable int value.
      if (sameTypes<T, int?>()) {
        if (value == null) {
          await _prefs.setInt(key, -1);
          if (_debug) {
            debugPrint('SharedPrefs saved type int?     : $key NULL as -1');
          }
          return;
        } else {
          await _prefs.setInt(key, value as int);
          if (_debug) {
            debugPrint('SharedPrefs saved type int?     : $key as $value');
          }
          return;
        }
      }
      // Save a none nullable int value.
      if (sameTypes<T, int>()) {
        await _prefs.setInt(key, value as int);
        if (_debug) {
          debugPrint('SharedPrefs saved type int      : $key as $value');
        }
        return;
      }
      // Save a nullable double value.
      if (sameTypes<T, double?>()) {
        if (value == null) {
          await _prefs.setDouble(key, -1.0);
          if (_debug) {
            debugPrint('SharedPrefs saved type double?  : $key NULL as -1.0');
          }
          return;
        } else {
          await _prefs.setDouble(key, value as double);
          if (_debug) {
            debugPrint('SharedPrefs saved type double?  : $key as $value');
          }
          return;
        }
      }
      // Save a none nullable double value.
      if (sameTypes<T, double>()) {
        await _prefs.setDouble(key, value as double);
        if (_debug) {
          debugPrint('SharedPrefs saved type double   : $key as $value');
        }
        return;
      }
      // Save a nullable String value.
      if (sameTypes<T, String?>()) {
        if (value == null) {
          await _prefs.setString(key, '<NULL>');
          if (_debug) {
            debugPrint('SharedPrefs saved type String?  : $key NULL as <NULL>');
          }
          return;
        } else {
          await _prefs.setString(key, value as String);
          if (_debug) {
            debugPrint('SharedPrefs saved type String?  : $key as $value');
          }
          return;
        }
      }
      // Save a none nullable String value.
      if (sameTypes<T, String>()) {
        await _prefs.setString(key, value as String);
        if (_debug) {
          debugPrint('SharedPrefs saved type String   : $key as $value');
        }
        return;
      }
      // Save a nullable Color value.
      if (sameTypes<T, Color?>()) {
        if (value == null) {
          await _prefs.setInt(key, -1);
          if (_debug) {
            debugPrint('SharedPrefs saved type Color?   : $key NULL as -1');
          }
          return;
        } else {
          await _prefs.setInt(key, (value as Color).value);
          if (_debug) {
            debugPrint(
                'SharedPrefs saved type Color?   : $key as ${value.value}');
          }
          return;
        }
      }
      // Save a none nullable Color value.
      if (sameTypes<T, Color>()) {
        await _prefs.setInt(key, (value as Color).value);
        if (_debug) {
          debugPrint(
              'SharedPrefs saved type Color    : $key as ${value.value}');
        }
        return;
      }
      // Store Enums as their int index value. This may break if enum
      // definitions are changed in any other way than adding more enums to its
      // end. Changing the order of enum value in an enum may break the enum
      // order. The load handles removal of enum value by returning retrieved
      // out of bounds as the provided default enum value.
      //
      // Save a none nullable Enum value.
      if (value is Enum) {
        await _prefs.setInt(key, value.index);
        if (_debug) {
          debugPrint(
              'SharedPrefs saved type Enum     : $key as ${value.index}');
        }
        return;
      }
      // Save a nullable Enum value - note any NULL value of ANY type will
      // match here with this comparison. However, if we are not storing any
      // other types than the above atomic types handled here, then this last
      // case will be a nullable Enum.
      // So this should work so we do not have to check for every specific Enum
      // that we support for loading, that have to have their own actual Enum
      // type based back conversion.
      if (value is Enum?) {
        if (value == null) {
          await _prefs.setInt(key, -1);
          if (_debug) {
            debugPrint('SharedPrefs saved type Enum?    : $key NULL as -1');
          }
          return;
        } else {
          // This type check is not unnecessary, because value is generic
          // ignore: unnecessary_type_check
          if (value is Enum) {
            await _prefs.setInt(key, value.index);
            if (_debug) {
              debugPrint(
                  'SharedPrefs saved type Enum?    : $key as ${value.index}');
            }
            return;
          }
        }
      }
    } catch (e) {
      debugPrint('SharedPrefs save ERROR');
      debugPrint(' Error message ...... : $e');
      debugPrint(' Store key .......... : $key');
      debugPrint(' Save value ......... : $value');
    }
  }
}
