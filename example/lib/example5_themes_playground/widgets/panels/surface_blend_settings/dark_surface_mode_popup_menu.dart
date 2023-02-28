import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import 'surface_mode_widgets.dart';

/// Toggle the surface mode of the application for Dark theme mode.
@immutable
class DarkSurfaceModePopupMenu extends StatelessWidget {
  const DarkSurfaceModePopupMenu({required this.controller, super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SurfaceModePopupMenu(
        title: const Text('Surface blend mode'),
        index: controller.surfaceModeDark.index,
        onChanged: (int index) {
          controller.setSurfaceModeDark(FlexSurfaceMode.values[index]);
        });
  }
}
