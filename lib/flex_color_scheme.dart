/// A library to help you make beautiful color scheme based themes for Flutter.
library flex_color_scheme;

/// Offers built-in reusable color schemes and color values. Can be used
/// to hold custom color scheme definitions.
export 'src/flex_color.dart';

/// Defines a FlexColorScheme and can convert it to Flutter `ThemeData` or
/// optionally a standard `ColorScheme`.
///
/// Includes helpers for surface styles and "on color" calculations.
export 'src/flex_color_scheme.dart';

/// Extensions for `Color` and `String` to assist with color
/// manipulation and information.
///
/// The extensions are used by FlexColorScheme, and are also useful if you are
/// making custom color schemes and surface colors.
/// The extensions can also be generally reused.
export 'src/flex_extensions.dart';

/// Enum that can be used to lookup predefined `FlexSchemeData` color scheme
/// definition objects.
export 'src/flex_scheme.dart';

/// Extensions on ThemeData to return a ThemeData object defined
/// by a FlexColorScheme and its toTheme method.
export 'src/flex_theme_data_extensions.dart';

/// A theme-mode 3-way switch widget that uses `FlexSchemeData` as colors to
/// show scheme colors for light, dark and system mode, on each switch button.
export 'src/flex_theme_mode_switch.dart';
