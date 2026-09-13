import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/color_blends/surface_mode_popup_menu.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:material_ui/material_ui.dart';

/// Toggle the surface mode of the application for light theme mode.
@immutable
class LightSurfaceModePopupMenu extends StatelessWidget {
  const LightSurfaceModePopupMenu({required this.controller, super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SurfaceModePopupMenu(
      title: const Text('Surface colors blend mode'),
      index: controller.surfaceModeLight.index,
      onChanged: (int index) {
        controller.setSurfaceModeLight(FlexSurfaceMode.values[index]);
      },
    );
  }
}
