import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/list_tile_expand.dart';
import 'back_to_actual_platform.dart';
import 'is_web_list_tile.dart';
import 'platform_popup_menu.dart';

class TestAdaptiveResponse extends StatelessWidget {
  const TestAdaptiveResponse(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return ListTileExpand(
      title: const Text('Test the adaptive response'),
      child: Column(
        children: <Widget>[
          PlatformPopupMenu(
            platform: controller.platform,
            onChanged: controller.setPlatform,
          ),
          IsWebListTile(controller: controller),
          BackToActualPlatform(controller: controller),
        ],
      ),
    );
  }
}
