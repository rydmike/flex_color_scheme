/// A library to help you make beautiful color scheme based themes for Flutter.
library flex_color_scheme;

/// Export FlexSeedScheme package API, except Cam16.
///
/// These features and APIs were baked into FlexColorScheme before version
/// 6.0.0, but were moved to their own package starting from version 6.0.0.
export 'package:flex_seed_scheme/flex_seed_scheme.dart' hide Cam16;

/// Configuration class for adaptive theming features.
export 'src/flex_adaptive.dart';

/// Offers built-in reusable color schemes and color values.
///
/// Can also be used to bundle custom color definitions into color schemes that
/// can be used by FlexColorScheme.
export 'src/flex_color.dart';

/// Defines a FlexColorScheme and can convert it to Flutter ThemeData.
///
/// Includes helpers for surface styles and on color calculations.
export 'src/flex_color_scheme.dart';

/// Extensions for `Color` and `String` to assist with color
/// manipulation and information.
///
/// These extensions are used by FlexColorScheme, and may also useful if you
/// are making custom color schemes and surface colors.
/// These extensions can also be used generally.
export 'src/flex_extensions.dart';

/// Immutable configuration class for using seed color generated themes.
///
/// Seed generated color schemes are based on the Material Guide 3 color system.
export 'src/flex_key_color.dart';

/// Enum that can be used to lookup predefined `FlexSchemeData` color scheme
/// definition objects.
export 'src/flex_scheme.dart';

/// Immutable data class used to hold the main colors providing colors to
/// FlexColorScheme.
export 'src/flex_scheme_color.dart';

/// Immutable data class used to hold a light and dark `FlexSchemeColor` set
/// and to give them a name and description.
export 'src/flex_scheme_data.dart';

/// Immutable data class used to create on colors for displaying text
/// and icons on the surface, background, error colors and the primary,
/// secondary and tertiary colors.
export 'src/flex_scheme_on_colors.dart';

/// Immutable data class used to make the six different surface colors in a
/// FlexColorScheme.
export 'src/flex_scheme_surface_colors.dart';

/// Enum used to select ink effect in a FlexSubThemesData configuration.
export 'src/flex_splash_type.dart';

/// Defines opinionated component sub-themes used by FlexColorScheme.
export 'src/flex_sub_themes.dart';

/// Immutable data class used to configure FlexSubThemes used by
/// FlexColorScheme.
export 'src/flex_sub_themes_data.dart';

/// Enum used to describe how alpha blends are applied to surface colors in
/// FlexColorScheme.
export 'src/flex_surface_mode.dart';

/// Extensions on ThemeData used to return a ThemeData object defined
/// by a FlexColorScheme object and its toTheme method.
export 'src/flex_theme_data_extensions.dart';

/// A theme-mode 3-way switch widget that uses `FlexSchemeData` as colors to
/// show scheme colors for light, dark and system mode, on each button.
export 'src/flex_theme_mode_switch.dart';
