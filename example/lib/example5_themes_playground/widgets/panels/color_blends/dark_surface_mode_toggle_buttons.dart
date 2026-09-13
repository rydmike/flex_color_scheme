import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/color_blends/surface_mode_toggle_buttons.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:material_ui/material_ui.dart';

class DarkSurfaceModeToggleButtons extends StatelessWidget {
  const DarkSurfaceModeToggleButtons({required this.controller, super.key});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SurfaceModeToggleButtons(
      mode: controller.surfaceModeDark,
      onChanged: controller.setSurfaceModeDark,
    );
  }
}
