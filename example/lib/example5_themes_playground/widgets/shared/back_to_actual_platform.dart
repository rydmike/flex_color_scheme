import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';

// TODO(rydmike): Set to also reset mock web setting when we have that.
class BackToActualPlatform extends StatelessWidget {
  const BackToActualPlatform({
    super.key,
    required this.controller,
  });
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Set back to actual platform'),
      trailing: FilledButton(
        onPressed: () {
          controller.setPlatform(defaultTargetPlatform);
        },
        child: const Text('Actual'),
      ),
      onTap: () {
        controller.setPlatform(defaultTargetPlatform);
      },
    );
  }
}
