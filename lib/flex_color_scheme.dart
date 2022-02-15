/// A library to help you make beautiful color scheme based themes for Flutter.
library flex_color_scheme;

/// Offers built-in reusable color schemes and color values. Can also be used
/// to bundle custom color definitions into color schemes that can be used
/// by FlexColorScheme.
export 'src/flex_color.dart';

/// Defines a FlexColorScheme and can convert it to Flutter ThemeData.
///
/// Includes helpers for surface styles and on color calculations.
export 'src/flex_color_scheme.dart';

/// Extensions for `Color` and `String` to assist with color
/// manipulation and information.
///
/// The extensions are used by FlexColorScheme, and are also useful if you are
/// making custom color schemes and surface colors.
/// The extensions can also be generally reused.
export 'src/flex_extensions.dart';

/// Configuration class for using seed color generated themes.
export 'src/flex_key_color.dart';

/// Enum that can be used to lookup predefined `FlexSchemeData` color scheme
/// definition objects.
export 'src/flex_scheme.dart';

/// Defines opinionated FlexSubThemes used by FlexColorScheme.
export 'src/flex_sub_themes.dart';

/// Defines a FlexSubThemeData object used to configure FlexSubThemes used by
/// FlexColorScheme.
export 'src/flex_sub_themes_data.dart';

/// Extensions on ThemeData to return a ThemeData object defined
/// by a FlexColorScheme and its toTheme method.
export 'src/flex_theme_data_extensions.dart';

/// A theme-mode 3-way switch widget that uses `FlexSchemeData` as colors to
/// show scheme colors for light, dark and system mode, on each switch button.
export 'src/flex_theme_mode_switch.dart';
