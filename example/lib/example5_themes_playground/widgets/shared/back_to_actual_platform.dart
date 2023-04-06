import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';

class BackToActualPlatform extends StatelessWidget {
  const BackToActualPlatform({
    super.key,
    required this.controller,
  });
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Set to actual platform'),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 5.0),
        child: FilledButton(
          onPressed: controller.resetFakePlatform,
          child: const Text('Actual'),
        ),
      ),
      onTap: controller.resetFakePlatform,
    );
  }
}
