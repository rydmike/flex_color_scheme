import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import 'light_surface_mode_toggle_buttons.dart';

class LightSurfaceModeListTile extends StatelessWidget {
  const LightSurfaceModeListTile({
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
    final FlexSurfaceMode mode = controller.surfaceModeLight;
    return ListTile(
      title: title,
      subtitle: subtitle,
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 5.0),
        child: LightSurfaceModeToggleButtons(controller: controller),
      ),
      onTap: () {
        // We skip the last custom item and go to start again before it.
        if (mode.index + 1 >= FlexSurfaceMode.values.length - 1) {
          controller.setSurfaceModeLight(FlexSurfaceMode.values[0]);
        } else {
          controller
              .setSurfaceModeLight(FlexSurfaceMode.values[mode.index + 1]);
        }
      },
    );
  }
}
