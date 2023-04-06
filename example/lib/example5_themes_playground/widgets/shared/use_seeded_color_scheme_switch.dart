import 'package:flutter/material.dart';

import '../../../shared/const/app_color.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/app/use_key_colors_buttons.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';

class UseSeededColorSchemeSwitch extends StatelessWidget {
  const UseSeededColorSchemeSwitch({
    super.key,
    required this.controller,
    this.explainMore = true,
  });

  final ThemeController controller;
  final bool explainMore;

  @override
  Widget build(BuildContext context) {
    final String explainSeed =
        controller.useKeyColors ? 'Seeded scheme' : 'Defined scheme';
    final String explainMoreString = explainMore && controller.useKeyColors
        ? 'You can adjust the seed generated colors further with the Seeded '
            'ColorScheme feature.'
        : '';
    return ListTileReveal(
      title: Text(explainSeed),
      subtitleDense: true,
      subtitle: Text('${AppColor.explainUsedColors(controller)}. '
          '$explainMoreString\n'),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 5.0),
        child: UseKeyColorsButtons(controller: controller),
      ),
    );
  }
}
