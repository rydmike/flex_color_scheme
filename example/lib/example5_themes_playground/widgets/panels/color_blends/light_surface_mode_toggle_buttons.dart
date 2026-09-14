import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/color_blends/surface_mode_toggle_buttons.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:material_ui/material_ui.dart';

@immutable
class LightSurfaceModeToggleButtons extends StatelessWidget {
  const LightSurfaceModeToggleButtons({required this.controller, super.key});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SurfaceModeToggleButtons(
      mode: controller.surfaceModeLight,
      onChanged: controller.setSurfaceModeLight,
    );
  }
}
