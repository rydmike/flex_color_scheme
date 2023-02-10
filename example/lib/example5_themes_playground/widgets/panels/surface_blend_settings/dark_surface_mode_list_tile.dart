import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import 'dark_surface_mode_toggle_buttons.dart';

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
