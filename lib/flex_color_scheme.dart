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

/// An intermediate concept between the key color for a UI theme, and a full
/// color scheme. Totally 5 tonal palettes are generated, plus a fixed error
/// palette.
export 'src/flex_core_palette.dart';

/// Extensions for `Color` and `String` to assist with color
/// manipulation and information.
///
/// The extensions are used by FlexColorScheme, and are also useful if you are
/// making custom color schemes and surface colors.
/// The extensions can also be used generally.
export 'src/flex_extensions.dart';

/// Configuration class for using seed color generated themes.
///
/// Seed generated color schemes are based on the Material Guide 3 color system.
export 'src/flex_key_color.dart';

/// Enum that can be used to lookup predefined `FlexSchemeData` color scheme
/// definition objects.
export 'src/flex_scheme.dart';

/// Data class used to hold the main colors used to provide colors to
/// FlexColorScheme.
///
/// Used as container to hold the color value calue combinations for
/// built in color schemes.
export 'src/flex_scheme_color.dart';

/// Data class used to hold a light and dark `FlexSchemeColor` set and to give
/// them a name and description.
export 'src/flex_scheme_data.dart';

/// Immutable data class used to create on colors for displaying text
/// and icons on the surface, background, error colors and the primary,
/// secondary and tertiary colors.
export 'src/flex_scheme_on_colors.dart';

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

/// Extensions on ThemeData to return a ThemeData object defined
/// by a FlexColorScheme and its toTheme method.
export 'src/flex_tones.dart';
