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
        return 'Mock web platform set to true and used. '
            'Actual web platform is $kIsWeb';
      case false:
        return 'Mock web platform set to false. '
            'Actual web platform is $kIsWeb';
      case null:
        return 'Actual web platform is $kIsWeb and it is used';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTileReveal(
      title: const Text('Mock web'),
      subtitleDense: true,
      subtitle: Text('Use this setting to test what your adaptive theme looks '
          'likes on web and none web platform, by mocking web or device usage '
          'status here in the Playground.\n\n'
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
