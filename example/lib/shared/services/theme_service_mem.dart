import 'theme_service.dart';
// ignore_for_file: comment_references

/// A service that stores and retrieves theme settings from memory only.
///
/// This class does not persist user settings, it only returns start default
/// values. The runtime in memory storage is actually handled by the theme
/// controller.
///
/// To actually persist the settings locally, use the [ThemeServicePrefs]
/// implementation that uses the shared_preferences package to persists the
/// values, or the [ThemeServiceHive] that uses the hive package to accomplish
/// the same thing. You could also make an implementation that stores settings
/// on a web server, e.g. with the http package.
///
/// The ThemeController that this is service is used with, keeps all latest
/// setting values in memory itself, so this memory implementation
/// does not really do anything when calling save for each property,
/// they are all just no-op.
///
/// Loading values from it just returns the default value for each settings
/// property.
class ThemeServiceMem implements ThemeService {
  /// ThemeServiceMem implementations needs no init, it is just a no op.
  @override
  Future<void> init() async {}

  /// Loads a setting from the Theme service, using a key to access it.
  /// Just returning default value for the in memory service that does not
  /// persist values.
  @override
  Future<T> load<T>(String key, T defaultValue) async => defaultValue;

  /// Save a setting to the Theme service, using key, as key for the value.
  /// The in memory version does nothing  just a no op.
  @override
  Future<void> save<T>(String key, T value) async {}
}
