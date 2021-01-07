import 'flex_color_scheme_region_widget_test.dart'
    as flex_color_scheme_region_widget_test;
import 'flex_color_scheme_test.dart' as flex_color_scheme;
import 'flex_color_scheme_to_theme_test.dart' as flex_color_scheme_to_theme;
import 'flex_color_test.dart' as flex_color;
import 'flex_extensions_test.dart' as flex_extensions;
import 'flex_scheme_color_test.dart' as flex_scheme_color;
import 'flex_scheme_data_test.dart' as flex_scheme_data;
import 'flex_scheme_on_colors_test.dart' as flex_scheme_on_colors;
import 'flex_scheme_surface_colors_test.dart' as flex_scheme_surface_colors;
import 'flex_to_theme_and_mode_switch_widget_test.dart'
    as flex_to_theme_and_mode_switch_widget_test;

/// Run all tests for package FlexColorScheme
void main() {
  // Unit tests
  flex_extensions.main();
  flex_color.main();
  flex_scheme_color.main();
  flex_scheme_data.main();
  flex_scheme_on_colors.main();
  flex_scheme_surface_colors.main();
  flex_color_scheme.main();
  flex_color_scheme_to_theme.main();
  // Widget tests
  flex_color_scheme_region_widget_test.main();
  flex_to_theme_and_mode_switch_widget_test.main();
}
