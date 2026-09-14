import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/panels/color_blends/dark_surface_mode_toggle_buttons.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:material_ui/material_ui.dart';

class DarkSurfaceModeListTile extends StatelessWidget {
  const DarkSurfaceModeListTile({
    this.title,
    this.subtitle,
    required this.controller,
    super.key,
  });

  final Widget? title;
  final Widget? subtitle;
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final FlexSurfaceMode mode = controller.surfaceModeDark;
    return ListTile(
      title: title,
      subtitle: subtitle,
      onTap: () {
        // We skip the last custom item and go to start again before it.
        if (mode.index + 1 >= FlexSurfaceMode.values.length - 1) {
          controller.setSurfaceModeDark(FlexSurfaceMode.values[0]);
        } else {
          controller.setSurfaceModeDark(FlexSurfaceMode.values[mode.index + 1]);
        }
      },
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 10.0),
        child: DarkSurfaceModeToggleButtons(controller: controller),
      ),
    );
  }
}
