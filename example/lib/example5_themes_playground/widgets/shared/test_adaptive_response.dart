import 'package:flex_color_scheme_example/example5_themes_playground/widgets/shared/back_to_actual_platform.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/shared/is_web_list_tile.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/shared/platform_popup_menu.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:flex_color_scheme_example/shared/widgets/universal/list_tile_expand.dart';
import 'package:material_ui/material_ui.dart';

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
