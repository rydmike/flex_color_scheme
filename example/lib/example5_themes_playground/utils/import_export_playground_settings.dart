import 'dart:convert';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/const/app.dart';
import '../../shared/const/store.dart';
import '../../shared/controllers/theme_controller.dart';
import '../../shared/model/adaptive_response.dart';
import '../../shared/model/splash_type_enum.dart';
import '../../shared/model/visual_density_enum.dart';

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off here too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && true;

/// Common JsonKeys used in serialisation and deserialization.
enum JsonKeys {
  dartType(key: 'dart_type'),
  playgroundData(key: 'playground_data'),
  playgroundVersion(key: 'playground_version'),
  typeColor(key: 'color'),
  typeEnumAdaptiveResponse(key: 'enum_adaptive_response'),
  typeEnumFlexAppBarStyle(key: 'enum_flex_appbar_style'),
  typeEnumFlexFixedColorStyle(key: 'enum_flex_fixed_color_style'),
  typeEnumFlexInputBorderType(key: 'enum_flex_input_border_type'),
  typeEnumFlexPaletteType(key: 'enum_flex_palette_type'),
  typeEnumFlexScaffoldBaseColor(key: 'enum_flex_scaffold_base_color'),
  typeEnumFlexScheme(key: 'enum_flex_scheme'),
  typeEnumFlexSchemeColor(key: 'enum_flex_scheme_color'),
  typeEnumFlexSliderIndicatorType(key: 'enum_flex_slider_indicator_type'),
  typeEnumFlexSurfaceMode(key: 'enum_flex_surface_mode'),
  typeEnumFlexSystemNavBarStyle(key: 'enum_flex_system_navbar_style'),
  typeEnumFlexTabBarStyle(key: 'enum_flex_tabbar_style'),
  typeEnumListTileControlAffinity(key: 'enum_listtile_control_affinity'),
  typeEnumListTileStyle(key: 'enum_listtile_style'),
  typeEnumListTileTitleAlignment(key: 'enum_listtile_title_alignment'),
  typeEnumMaterialTapTargetSize(key: 'enum_material_tap_target_size'),
  typeEnumNavigationDestinationLabelBehavior(
      key: 'enum_navigation_destination_label_behavior'),
  typeEnumNavigationRailLabelType(key: 'enum_navigation_rail_label_type'),
  typeEnumSchemeColor(key: 'enum_scheme_color'),
  typeEnumShowValueIndicator(key: 'enum_show_value_indicator'),
  typeEnumSplashType(key: 'enum_splash_type'),
  typeEnumTabAlignment(key: 'enum_tab_alignment'),
  typeEnumTabBarIndicatorSize(key: 'enum_tabbar_indicator_size'),
  typeEnumThemeModeColor(key: 'enum_theme_mode'),
  typeEnumVisualDensity(key: 'enum_visual_density'),
  value(key: 'value');

  final String key;
  const JsonKeys({required this.key});
}

/// A function that exports the theme playground settings to JSON.
Future<String> exportPlaygroundSettings(ThemeController controller) async {
  final Map<String, dynamic> themeData = <String, dynamic>{};

  // Date time now formatted as string dd.MM.yyyy HH:mm:ss
  final String exportDate =
      DateFormat('dd.MM.yyyy HH:mm:ss').format(DateTime.now());
  // Add info about JSON file and export date time.
  themeData[JsonKeys.playgroundData.key] = App.exportInfo + exportDate;
  // This may be useful in the future, e.g., to handle migrations when
  // importing an older version
  themeData[JsonKeys.playgroundVersion.key] = App.version;

  // Add all persisted settings in the ThemeData controller.
  themeData.addAll(controller.exportSavedThemeData());

  final String data = JsonEncoder.withIndent(
    '    ',
    (dynamic object) {
      /// Custom converter for types that can't be serialised
      if (object is Color) {
        return <String, String>{
          JsonKeys.dartType.key: JsonKeys.typeColor.key,
          JsonKeys.value.key: object.hexCode,
        };
      } else if (object is Enum) {
        String? dartType;
        if (object is AdaptiveResponse) {
          dartType = JsonKeys.typeEnumAdaptiveResponse.key;
        } else if (object is FlexAppBarStyle) {
          dartType = JsonKeys.typeEnumFlexAppBarStyle.key;
        } else if (object is FlexFixedColorStyle) {
          dartType = JsonKeys.typeEnumFlexFixedColorStyle.key;
        } else if (object is FlexInputBorderType) {
          dartType = JsonKeys.typeEnumFlexInputBorderType.key;
        } else if (object is FlexPaletteType) {
          dartType = JsonKeys.typeEnumFlexPaletteType.key;
        } else if (object is FlexScaffoldBaseColor) {
          dartType = JsonKeys.typeEnumFlexScaffoldBaseColor.key;
        } else if (object is FlexScheme) {
          dartType = JsonKeys.typeEnumFlexScheme.key;
        } else if (object is FlexSchemeColor) {
          dartType = JsonKeys.typeEnumFlexSchemeColor.key;
        } else if (object is FlexSliderIndicatorType) {
          dartType = JsonKeys.typeEnumFlexSliderIndicatorType.key;
        } else if (object is FlexSurfaceMode) {
          dartType = JsonKeys.typeEnumFlexSurfaceMode.key;
        } else if (object is FlexSystemNavBarStyle) {
          dartType = JsonKeys.typeEnumFlexSystemNavBarStyle.key;
        } else if (object is FlexTabBarStyle) {
          dartType = JsonKeys.typeEnumFlexTabBarStyle.key;
        } else if (object is ListTileControlAffinity) {
          dartType = JsonKeys.typeEnumListTileControlAffinity.key;
        } else if (object is ListTileStyle) {
          dartType = JsonKeys.typeEnumListTileStyle.key;
        } else if (object is ListTileTitleAlignment) {
          dartType = JsonKeys.typeEnumListTileTitleAlignment.key;
        } else if (object is MaterialTapTargetSize) {
          dartType = JsonKeys.typeEnumMaterialTapTargetSize.key;
        } else if (object is NavigationDestinationLabelBehavior) {
          dartType = JsonKeys.typeEnumNavigationDestinationLabelBehavior.key;
        } else if (object is NavigationRailLabelType) {
          dartType = JsonKeys.typeEnumNavigationRailLabelType.key;
        } else if (object is SchemeColor) {
          dartType = JsonKeys.typeEnumSchemeColor.key;
        } else if (object is ShowValueIndicator) {
          dartType = JsonKeys.typeEnumShowValueIndicator.key;
        } else if (object is SplashTypeEnum) {
          dartType = JsonKeys.typeEnumSplashType.key;
        } else if (object is TabAlignment) {
          dartType = JsonKeys.typeEnumTabAlignment.key;
        } else if (object is TabBarIndicatorSize) {
          dartType = JsonKeys.typeEnumTabBarIndicatorSize.key;
        } else if (object is ThemeMode) {
          dartType = JsonKeys.typeEnumThemeModeColor.key;
        } else if (object is VisualDensityEnum) {
          dartType = JsonKeys.typeEnumVisualDensity.key;
        } else {
          if (_debug) {
            debugPrint("Unhandled enum type '${object.runtimeType}' "
                "with value '${object.name}'");
          }
        }
        if (dartType != null) {
          return <String, String>{
            JsonKeys.dartType.key: dartType,
            JsonKeys.value.key: object.name,
          };
        }
      }

      return object;
    },
  ).convert(themeData);
  return data;
}

/// A function that imports the saved theme playground settings from JSON.
Future<String> importPlaygroundSettings(
  ThemeController controller, {
  required String settings,
}) async {
  String resultLog = '';

  if (_debug) debugPrint('EXEC importPlaygroundSettings with:\n$settings');

  // If the settings import is longer than 20000 characters, it is too long,
  // we do not have that long settings in valid exports, log the error and
  // return.
  // Note: No idea how long it can become, this number is just based on trial
  // and error, last limited tested with valid one that failed was 10000.
  // So doubled it to be on the safe side.
  if (settings.length > 20000) {
    resultLog += 'The settings JSON is too long, probably invalid. No import!';
    if (_debug) debugPrint('Settings JSON too long => INVALID, no import!');
    controller.setImportErrorLog(resultLog);
    return resultLog;
  }
  Map<String, dynamic> json = <String, dynamic>{};

  try {
    json = jsonDecode(settings) as Map<String, dynamic>;
  } catch (e) {
    final String importDate =
        DateFormat('dd.MM.yyyy HH:mm:ss').format(DateTime.now());
    resultLog += 'Settings JSON decode $importDate error: $e ';
    if (_debug) debugPrint('Settings JSON decode $importDate error: $e');
    controller.setImportErrorLog(resultLog, false);
    return resultLog;
  }

  final Map<String, dynamic> data = <String, dynamic>{};
  for (final MapEntry<String, dynamic> item in json.entries) {
    if (_equalsIgnoreCase(item.key, JsonKeys.playgroundData.key)) {
      continue;
    }
    if (_equalsIgnoreCase(item.key, JsonKeys.playgroundVersion.key)) {
      continue;
    }
    // If the item.key is not in Store.storageKeys, it is not a valid key
    // log the error and skip the key.
    if (!Store.storageKeys.contains(item.key)) {
      resultLog += "Key '${item.key}' is not a valid key, skipped.\n";
      if (_debug) debugPrint("Key '${item.key}' is not a valid key, skipped.");
      continue;
    }
    // If item.value is longer than 100 characters, it is too long, we do not
    // have that long strings in valid values, log the error and skip the key.
    if (item.value.toString().length > 100) {
      resultLog += "Value for key '${item.key}' was too long, skipped.\n";
      if (_debug) debugPrint("Value for key '${item.key}' too long, skipped.");
      continue;
    }

    dynamic mapped;
    if (item.value is Map) {
      final String dartType =
          (item.value as Map<String, dynamic>)[JsonKeys.dartType.key] as String;
      final dynamic value =
          (item.value as Map<String, dynamic>)[JsonKeys.value.key];
      if (_equalsIgnoreCase(dartType, JsonKeys.typeColor.key)) {
        mapped = Color(int.parse("0x${(value as String).replaceAll("#", "")}"));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumAdaptiveResponse.key)) {
        mapped = AdaptiveResponse.values.firstWhere(
            (AdaptiveResponse element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexAppBarStyle.key)) {
        mapped = FlexAppBarStyle.values.firstWhere((FlexAppBarStyle element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexFixedColorStyle.key)) {
        mapped = FlexFixedColorStyle.values.firstWhere(
            (FlexFixedColorStyle element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexInputBorderType.key)) {
        mapped = FlexInputBorderType.values.firstWhere(
            (FlexInputBorderType element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexPaletteType.key)) {
        mapped = FlexPaletteType.values.firstWhere((FlexPaletteType element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexScaffoldBaseColor.key)) {
        mapped = FlexScaffoldBaseColor.values.firstWhere(
            (FlexScaffoldBaseColor element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(dartType, JsonKeys.typeEnumFlexScheme.key)) {
        mapped = FlexScheme.values.firstWhere((FlexScheme element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexSliderIndicatorType.key)) {
        mapped = FlexSliderIndicatorType.values.firstWhere(
            (FlexSliderIndicatorType element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexSurfaceMode.key)) {
        mapped = FlexSurfaceMode.values.firstWhere((FlexSurfaceMode element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexSystemNavBarStyle.key)) {
        mapped = FlexSystemNavBarStyle.values.firstWhere(
            (FlexSystemNavBarStyle element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexTabBarStyle.key)) {
        mapped = FlexTabBarStyle.values.firstWhere((FlexTabBarStyle element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumFlexSchemeColor.key)) {
        mapped = SchemeColor.values.firstWhere((SchemeColor element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumListTileControlAffinity.key)) {
        mapped = ListTileControlAffinity.values.firstWhere(
            (ListTileControlAffinity element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumListTileStyle.key)) {
        mapped = ListTileStyle.values.firstWhere((ListTileStyle element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumListTileTitleAlignment.key)) {
        mapped = ListTileTitleAlignment.values.firstWhere(
            (ListTileTitleAlignment element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumMaterialTapTargetSize.key)) {
        mapped = MaterialTapTargetSize.values.firstWhere(
            (MaterialTapTargetSize element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumNavigationDestinationLabelBehavior.key)) {
        mapped = NavigationDestinationLabelBehavior.values.firstWhere(
            (NavigationDestinationLabelBehavior element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumNavigationRailLabelType.key)) {
        mapped = NavigationRailLabelType.values.firstWhere(
            (NavigationRailLabelType element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumSchemeColor.key)) {
        mapped = SchemeColor.values.firstWhere((SchemeColor element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumShowValueIndicator.key)) {
        mapped = ShowValueIndicator.values.firstWhere(
            (ShowValueIndicator element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(dartType, JsonKeys.typeEnumSplashType.key)) {
        mapped = SplashTypeEnum.values.firstWhere((SplashTypeEnum element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumTabAlignment.key)) {
        mapped = TabAlignment.values.firstWhere((TabAlignment element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumTabBarIndicatorSize.key)) {
        mapped = TabBarIndicatorSize.values.firstWhere(
            (TabBarIndicatorSize element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumThemeModeColor.key)) {
        mapped = ThemeMode.values.firstWhere((ThemeMode element) =>
            _equalsIgnoreCase(element.name, value as String));
      } else if (_equalsIgnoreCase(
          dartType, JsonKeys.typeEnumVisualDensity.key)) {
        mapped = VisualDensityEnum.values.firstWhere(
            (VisualDensityEnum element) =>
                _equalsIgnoreCase(element.name, value as String));
      } else {
        resultLog += "Unhandled type '$dartType' with value "
            "'$value' for key '${item.key}'\n";
        if (_debug) {
          debugPrint("Unhandled type '$dartType' with value "
              "'$value' for key '${item.key}'");
        }
      }
    } else {
      mapped = item.value;
    }
    if (mapped == null) {
      resultLog += "The 'mapped' value was null, skipped.\n";
      if (_debug) debugPrint("The 'mapped' value was null, skipped.");
    } else {
      data[item.key] = mapped;
    }
  }
  // Date time now formatted as string dd.MM.yyyy HH:mm:ss
  final String importDate =
      DateFormat('dd.MM.yyyy HH:mm:ss').format(DateTime.now());
  if (resultLog.isNotEmpty) {
    resultLog = 'Imported with issues $importDate\n$resultLog';
  } else {
    resultLog = 'Imported successfully $importDate';
  }
  controller.setImportErrorLog(resultLog, false);
  await controller.importSavedThemeData(data);
  await controller.loadAll();
  return resultLog;
}

bool _equalsIgnoreCase(String? string1, String? string2) {
  return string1?.toLowerCase() == string2?.toLowerCase();
}
