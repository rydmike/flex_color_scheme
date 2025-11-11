# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

FlexColorScheme is a Flutter package that provides sophisticated Material Design theming capabilities. It extends Flutter's built-in theming with advanced features like surface blending, Material-3 seed color generation, and comprehensive component theme customization. The package includes 66+ built-in color schemes and a companion web app (Themes Playground) for visual theme configuration.

## Development Commands

### Testing
```bash
# Run all tests with coverage
flutter test --coverage

# Run a specific test file
flutter test test/flex_color_scheme_test.dart

# Run tests matching a name pattern
flutter test --name="pattern"
```

### Linting & Analysis
```bash
# Run static analysis
dart analyze

# The project uses RydMike lint rules v2.5.0 with strict settings:
# - strict-casts: true
# - strict-inference: true
# - strict-raw-types: true
```

### Building Examples
```bash
# The example app contains multiple examples and the Themes Playground
cd example

# Run the Themes Playground (Example 5)
flutter run -d chrome lib/example5_themes_playground/main.dart

# Run other examples
flutter run lib/example1_basic_theme_usage/main.dart
flutter run lib/example2_custom_theme/main.dart
# etc.
```

### Package Management
```bash
# Get dependencies
flutter pub get

# Publish dry-run (maintainer only)
flutter pub publish --dry-run
```

## Architecture Overview

FlexColorScheme follows a layered architecture with a color-to-theme pipeline:

### Core Pipeline: Color Definition → Configuration → ThemeData

**Layer 1: Color Definitions**
- `FlexSchemeColor`: Immutable data class holding primary, secondary, tertiary, error, and surface colors
- `FlexSchemeData`: Bundles light and dark color pairs with metadata
- `FlexScheme`: Enum with 66+ built-in schemes (mandyRed, bahamaBlue, etc.)
- `FlexColor`: Repository class providing access to all predefined schemes

**Layer 2: Color Computation**
- `FlexSchemeOnColors`: Computes contrast colors (for text/icons) based on brightness estimation
- `FlexSchemeSurfaceColors`: Generates surface color variants with optional blending
- `FlexSurfaceMode`: Enum defining how surfaces are tinted (9 modes: level, highBackground, etc.)

**Layer 3: Theme Configuration**
- `FlexColorScheme`: Main configuration class accepting:
  - Individual color properties or complete ColorSchemes
  - Component theming via `FlexSubThemesData`
  - Material 2/3 mode selection
  - Surface blending and seed color generation settings
- Factory constructors: `FlexColorScheme.light()` and `.dark()`

**Layer 4: Component Theming**
- `FlexSubThemesData`: Flat configuration with 380+ properties for component-level styling
  - Global defaults (e.g., `defaultRadius` applies to all widgets)
  - Per-widget overrides (button radius, input border style, etc.)
  - Platform adaptation via `FlexAdaptive`
- `FlexSubThemes`: Static methods implementing actual ThemeData sub-themes

**Layer 5: Conversion**
- `.toTheme()`: Converts FlexColorScheme to Flutter's ThemeData
- `.toScheme()`: Returns effective ColorScheme
- `FlexThemeData` extension: Convenience factories combining creation + conversion

### Key Architectural Patterns

1. **Immutability First**: All data classes use `@immutable` with `copyWith` for modifications
2. **Computed Defaults**: Factory constructors calculate missing values from minimal input
3. **Flat Configuration**: `FlexSubThemesData` avoids nested classes for easier configuration
4. **Material Design Compliance**: Built-in support for both M2 and M3 with proper spec adherence
5. **Platform Adaptation**: Cross-platform theming with platform-specific adjustments

### Source Organization

The main library code is in `lib/src/`:

- **Core theming** (`flex_color_scheme.dart` - 459KB): Main FlexColorScheme class, enums for AppBar/TabBar/NavBar styles
- **Color repository** (`flex_color.dart` - 246KB): All 66+ built-in color scheme definitions
- **Component theming**:
  - `flex_sub_themes_data.dart` (304KB): Configuration data class
  - `flex_sub_themes.dart` (375KB): Implementation of component themes
- **Theme utilities** (`flex_theme_data_extensions.dart` - 151KB): FlexThemeData extension factories
- **Color computation**:
  - `flex_scheme_surface_colors.dart`: Surface color blending
  - `flex_scheme_on_colors.dart`: Contrast color computation
- **Supporting types**: `flex_scheme_color.dart`, `flex_scheme_data.dart`, `flex_key_color.dart`, etc.
- **Extensions** (`flex_extensions.dart`): Color manipulation utilities
- **Additional features**: `flex_adaptive.dart`, `flex_theme_mode_switch.dart`, `flex_instant_splash.dart`

### Example Applications

The `example/` directory contains:
- `example1_basic_theme_usage/`: Simple integration example
- `example2_custom_theme/`: Custom color scheme usage
- `example3_four_themes/`: Multiple theme variants
- `example4_all_themes/`: Showcase of all built-in schemes
- `example5_themes_playground/`: Full-featured theme configuration app (also deployed as web app)

The Themes Playground is the most comprehensive example, demonstrating all package features and generating FlexColorScheme API code.

## Important Notes for Development

### Lint Rules
This project uses **RydMike lint rules v2.5.0** - an opinionated, comprehensive ruleset that:
- Enables ALL available Dart/Flutter lint rules via `all_lint_rules.yaml`
- Selectively disables rules that conflict or are not desired
- Enforces strict mode: casts, inference, and raw types
- Treats missing parameters/returns as errors (not warnings)

When contributing, ensure your changes pass `dart analyze` without warnings.

### Testing Requirements
- Write tests for all new features and bug fixes
- Maintain or improve code coverage (currently monitored via CodeCov)
- Tests are in `test/` directory following the pattern `*_test.dart`
- Widget tests use the suffix `*_widget_test.dart`

### Breaking Changes
Do **not** introduce breaking API changes without prior discussion. This is a published package with a large user base. API changes should be discussed in GitHub issues before implementation.

### Material-3 Considerations
- As of v8.0+, Material-3 is the default mode (matching Flutter 3.7+)
- The package must support both M2 and M3 modes
- Component theme defaults in M3 mode are less opinionated than M2 defaults
- Refer to the [known issues documentation](https://docs.flexcolorscheme.com/known_issues) for Flutter theming edge cases

### Integration with flex_seed_scheme
FlexColorScheme depends on the `flex_seed_scheme` package (also by the same author) for Material-3 seed color generation. This package was extracted from FlexColorScheme v6.0.0 to be usable independently. Changes affecting seed color generation may require coordinated updates.

## Documentation Resources

- **Official docs**: https://docs.flexcolorscheme.com (powered by docs.page)
- **API reference**: https://pub.dev/documentation/flex_color_scheme/latest
- **Themes Playground**: https://rydmike.com/flexcolorscheme/themesplayground-latest
- **Repository**: https://github.com/rydmike/flex_color_scheme
- **Issues**: https://github.com/rydmike/flex_color_scheme/issues