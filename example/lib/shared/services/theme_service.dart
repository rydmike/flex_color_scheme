/// Abstract interface for the ThemeService used to read and save theme
/// properties.
abstract class ThemeService {
  /// ThemeService implementations may override this method to perform needed
  /// initialization and setup work.
  Future<void> init();

  /// Loads a setting from the Theme service, stored with `key` string.
  Future<T> load<T>(String key, T defaultValue);

  /// Save a setting to the Theme service, using `key` as its storage key.
  Future<void> save<T>(String key, T value);
}
