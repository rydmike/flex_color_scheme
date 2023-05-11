import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/is_web_toggle_buttons.dart';
import '../../../shared/widgets/universal/list_tile_reveal.dart';

class IsWebListTile extends StatelessWidget {
  const IsWebListTile({
    required this.controller,
    super.key,
  });
  final ThemeController controller;

  String _explainLabelStyle(final bool? isWeb) {
    switch (isWeb) {
      case true:
        return 'Mock web platform info (kIsWeb=true) is used';
      case false:
        return 'Mock web platform info (kIsWeb=false) is used';
      case null:
        return 'Actual web platform info (kIsWeb=$kIsWeb) is used';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTileReveal(
      title: const Text('Mock web'),
      subtitleDense: true,
      subtitle: Text('Use mock web setting for adaptive theming testing.\n'
          '${_explainLabelStyle(controller.fakeIsWeb)}.\n'),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 5.0),
        child: IsWebToggleButtons(
          isWeb: controller.fakeIsWeb,
          onChanged: controller.setFakeIsWeb,
        ),
      ),
      onTap: () {
        if (controller.fakeIsWeb ?? false) {
          controller.setFakeIsWeb(null);
        } else if (controller.fakeIsWeb == null) {
          controller.setFakeIsWeb(false);
        } else {
          controller.setFakeIsWeb(true);
        }
      },
    );
  }
}
