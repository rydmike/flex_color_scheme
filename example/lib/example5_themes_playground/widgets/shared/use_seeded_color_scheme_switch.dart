import 'package:flex_color_scheme_example/shared/const/app_color.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:flex_color_scheme_example/shared/widgets/examples/use_key_colors_buttons.dart';
import 'package:flex_color_scheme_example/shared/widgets/universal/list_tile_reveal.dart';
import 'package:material_ui/material_ui.dart';

class UseSeededColorSchemeSwitch extends StatelessWidget {
  const UseSeededColorSchemeSwitch({
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final String explainSeed = controller.useKeyColors
        ? 'ColorScheme is generated with'
        : 'Select seed colors';
    return ListTileReveal(
      title: Text(explainSeed),
      subtitleReveal: Text('${AppColor.explainUsedColors(controller)}.\n'),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 2.0),
        child: UseKeyColorsButtons(controller: controller),
      ),
    );
  }
}
