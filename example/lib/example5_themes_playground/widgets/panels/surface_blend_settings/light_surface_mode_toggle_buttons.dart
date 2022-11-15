import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import 'surface_mode_widgets.dart';

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
