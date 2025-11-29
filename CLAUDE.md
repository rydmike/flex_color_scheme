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

# Run a specific test within a file by line number
flutter test test/flex_color_scheme_test.dart --plain-name="test description"
```

### Linting & Analysis
```bash
# Run static analysis
dart analyze

# The project uses RydMike lint rules v2.5.0 with strict settings:
# - Enables ALL lint rules via all_lint_rules.yaml, then selectively disables unwanted ones
# - strict-casts: true
# - strict-inference: true
# - strict-raw-types: true
# - Treats missing_required_param and missing_return as errors
# - See analysis_options.yaml for complete configuration
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
- **Shadcn colors** (`flex_shad_colors/`): Shadcn color scheme definitions and utilities

### Example Applications

The `example/` directory contains:
- `example1_basic_theme_usage/`: Simple integration example
- `example2_custom_theme/`: Custom color scheme usage
- `example3_four_themes/`: Multiple theme variants
- `example4_all_themes/`: Showcase of all built-in schemes
- `example5_themes_playground/`: Full-featured theme configuration app (also deployed as web app)

The Themes Playground is the most comprehensive example, demonstrating all package features and generating FlexColorScheme API code. See "Themes Playground Architecture" section below for detailed information.

## Important Notes for Development

### Lint Rules
This project uses **RydMike lint rules v2.6.0** - an opinionated, comprehensive ruleset that:
- Enables ALL available Dart/Flutter lint rules via `all_lint_rules.yaml`
- Selectively disables rules that conflict or are not desired
- Enforces strict mode: casts, inference, and raw types
- Treats missing parameters/returns as errors (not warnings)

When contributing, ensure your changes pass `dart analyze` without error, warnings and hints.

### Testing Requirements
- Write tests for all new features and bug fixes
- Maintain or improve code coverage (currently monitored via CodeCov)
- Tests are in `test/` directory following the pattern `*_test.dart`
- Widget tests use the suffix `*_widget_test.dart`
- Test files mirror the structure of `lib/src/` (e.g., `flex_color_scheme.dart` → `flex_color_scheme_test.dart`)
- Helper test utilities are named with `test_` prefix (e.g., `test_color_scheme_equality.dart`)

### Contributing Guidelines
- Fork the repository and create feature branches from `master` (e.g., `fix/issue-123`, `feature/new-option`)
- Follow the existing code style and conventions
- Write clear commit messages referencing relevant issues
- Do **not** introduce breaking API changes without prior discussion
- Avoid stylistic-only changes to examples that add little value
- See `CONTRIBUTING.md` for complete guidelines

### Material-3 Considerations
- As of v8.0+, Material-3 is the default mode (matching Flutter 3.7+)
- The package must support both M2 and M3 modes
- Component theme defaults in M3 mode are less opinionated than M2 defaults
- Refer to the [known issues documentation](https://docs.flexcolorscheme.com/known_issues) for Flutter theming edge cases

### Integration with flex_seed_scheme
FlexColorScheme depends on the `flex_seed_scheme` package (also by the same author) for Material-3 seed color generation. This package was extracted from FlexColorScheme v6.0.0 to be usable independently. Changes affecting seed color generation may require coordinated updates.

## Themes Playground Architecture

The **Themes Playground** (`example5_themes_playground/`) is a sophisticated configuration app that demonstrates all FlexColorScheme features and generates API setup code. It's both a learning tool and a production theme design application.

### Core Architecture

**State Management Pattern**
- Uses `ThemeController` (ChangeNotifier) to manage 383+ theme settings properties
- Abstract `ThemeService` interface with three implementations:
  - `ThemeServiceMem`: In-memory only (no persistence)
  - `ThemeServicePrefs`: Uses SharedPreferences
  - `ThemeServiceHive`: Uses Hive (default for Playground - `flex_color_scheme_v8` box)
- Each setting persisted individually as key-value pairs for efficient slider updates
- Follows Flutter skeleton template architecture pattern

**Shared Code Architecture** (`example/lib/shared/`)
- **Controllers**: `ThemeController` - main state manager coordinating all theme settings
- **Services**: `ThemeService` interface and implementations for persistence
- **Models**: Data models for settings (adaptive responses, enums, etc.)
- **Constants**: `Store` (persistence keys), `App` (app config), `AppColor` (color schemes)
- **Widgets**: Reusable UI components shared across examples

### Directory Structure

```
example5_themes_playground/
├── main.dart                    # App entry point, ThemeController setup
├── theme/                       # Theme definitions for the Playground app itself
│   ├── flex_theme_light.dart    # Light theme using FlexColorScheme
│   ├── flex_theme_dark.dart     # Dark theme using FlexColorScheme
│   ├── theme_data_light.dart    # Alternative ThemeData light theme
│   ├── theme_data_dark.dart     # Alternative ThemeData dark theme
│   ├── topic_theme.dart         # Theme extension for topic group colors
│   └── code_theme.dart          # Syntax highlighting theme for code view
├── utils/                       # Code generation and settings utilities (~3461 lines)
│   ├── generate_theme_dart_code.dart       # Generates FlexColorScheme API code
│   ├── generate_colorscheme_dart_code.dart # Generates ColorScheme code
│   ├── import_export_playground_settings.dart # Settings persistence/sharing
│   ├── share_settings.dart                 # Share config via URL/file
│   ├── effective_flex_tones.dart           # Tone calculations
│   └── query_params/                       # URL query parameter handling
│       ├── query_params_handler.dart       # Platform-agnostic interface
│       ├── query_params_handler_web.dart   # Web implementation
│       ├── query_params_handler_vm.dart    # VM (mobile/desktop) implementation
│       └── query_params_settings.dart      # Query param serialization
└── widgets/
    ├── dialogs/                 # Modal dialogs (code view, reset, etc.)
    ├── pages/                   # Main page layouts
    │   ├── home_page.dart       # Main responsive scaffold
    │   ├── two_topics_page.dart # Two-panel layout
    │   ├── model/
    │   │   └── theme_topic.dart # Topic/TopicGroup definitions
    │   └── widgets/             # Page-specific widgets
    ├── panels/                  # 40+ configuration panels organized by TopicGroup
    │   ├── introduction/
    │   ├── premade_designs/
    │   ├── theme_simulator/     # Live theme preview with demo apps
    │   ├── color_scheme/        # ColorScheme configuration
    │   ├── color_blends/        # Surface blend settings
    │   ├── shape_radius/        # Global radius settings
    │   ├── buttons/             # Button theme panels
    │   ├── text_field/          # Input decoration panels
    │   ├── app_bar/             # AppBar theme panels
    │   ├── tab_bar/             # TabBar theme panels
    │   ├── navigation_bar/      # NavigationBar panels
    │   ├── navigation_rail/     # NavigationRail panels
    │   ├── navigation_drawer/   # NavigationDrawer panels
    │   └── [30+ more component panels...]
    └── shared/                  # Reusable panel widgets
```

### Key Features

**1. Real-Time Configuration**
- 40+ themed panels grouped into 9 TopicGroups (general, colors, components, controls, inputs, bars, navigation, surfaces, texts)
- Live preview updates as settings change
- Two-panel view: configuration on one side, simulator on the other
- Responsive design with breakpoints: phone (< 600), desktop (≥ 900), big desktop (> 1700)

**2. Code Generation**
- Generates complete FlexColorScheme API setup code
- Generates standalone ColorScheme code
- Supports both Material-2 and Material-3 modes
- Option to generate code for separate file vs inline
- Includes all configured properties with proper formatting

**3. Settings Persistence & Sharing**
- Export/import settings as compressed JSON files
- Share configurations via URL query parameters (web)
- Reset to defaults (premade designs available)
- Hive-based local storage with ~383 persisted properties

**4. Theme Simulator**
- Multiple demo apps: Material-3 reference app, custom examples
- Multiple device form factors: Phone, iPad, Desktop
- Zoom controls for detailed inspection
- Real-time updates matching configuration panel changes

### Working with Themes Playground

**Running the Playground**
```bash
cd example
flutter run -d chrome lib/example5_themes_playground/main.dart
```

**Key Files to Understand**
- `ThemeController` (`shared/controllers/theme_controller.dart`): Central state manager with 383+ properties
- `theme_topic.dart`: Defines the 40+ topics/panels and their organization
- `generate_theme_dart_code.dart`: Code generation logic - study this to understand API usage patterns
- `home_page.dart`: Main UI structure and responsive behavior

**Common Development Tasks**
- **Adding a new theme property**:
  1. Add to `ThemeController` (property, getter, setter, persistence in `loadAll()`)
  2. Add to `Store` (constant keys and defaults)
  3. Add to code generator if it should appear in generated code
  4. Create or update panel widget in `widgets/panels/`

- **Adding a new panel**:
  1. Create panel widget in appropriate `widgets/panels/` subdirectory
  2. Add Topic entry to `themeTopics` list in `theme_topic.dart`
  3. Wire up in `home_page.dart` if needed

- **Testing generated code**:
  Use the "Copy Theme Code" feature to generate and test the API code in a separate Flutter app

### Architecture Benefits

1. **Separation of Concerns**: UI, state, persistence, and code generation are cleanly separated
2. **Reusability**: Shared code used across all 5 examples demonstrates real-world package integration
3. **Testability**: Abstract interfaces enable testing with mock services
4. **Flexibility**: Easy to swap persistence mechanisms or add new configuration options
5. **Learning Tool**: Well-commented code serves as comprehensive API documentation

## Documentation Resources

- **Official docs**: https://docs.flexcolorscheme.com (powered by docs.page)
- **API reference**: https://pub.dev/documentation/flex_color_scheme/latest
- **Themes Playground**: https://rydmike.com/flexcolorscheme/themesplayground-latest
- **Repository**: https://github.com/rydmike/flex_color_scheme
- **Issues**: https://github.com/rydmike/flex_color_scheme/issues