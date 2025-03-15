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
        return 'Mock "kIsWeb" set to true and used. '
            'Actual kIsWeb is $kIsWeb';
      case false:
        return 'Mock "kIsWeb" set to false and used. '
            'Actual kIsWeb is $kIsWeb';
      case null:
        return 'Mock "kIsWeb" set to null and '
            'actual kIsWeb is $kIsWeb and used';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTileReveal(
      dense: true,
      title: const Text('Mock web'),
      subtitle: Text(_explainLabelStyle(controller.fakeIsWeb)),
      subtitleReveal: const Text(
          'Use this setting to test what your adaptive theme looks '
          'likes on web and none web platform, by mocking web or device usage '
          'status here in the Playground.\n'),
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
