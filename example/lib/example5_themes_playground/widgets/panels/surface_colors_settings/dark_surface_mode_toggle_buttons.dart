import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import 'surface_mode_widgets.dart';

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
