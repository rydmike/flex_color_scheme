import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import 'surface_mode_widgets.dart';

/// Toggle the surface mode of the application for light theme mode.
@immutable
class LightSurfaceModePopupMenu extends StatelessWidget {
  const LightSurfaceModePopupMenu({required this.controller, super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SurfaceModePopupMenu(
        title: const Text('Surface blend mode'),
        index: controller.surfaceModeLight.index,
        onChanged: (int index) {
          controller.setSurfaceModeLight(FlexSurfaceMode.values[index]);
        });
  }
}
