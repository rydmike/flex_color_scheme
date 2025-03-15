import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/nullable_bool_toggle_buttons.dart';

class UseMaterial3Typography extends StatelessWidget {
  const UseMaterial3Typography({
    required this.controller,
    super.key,
  });
  final ThemeController controller;

  String _explainLabelStyle(final bool? value) {
    switch (value) {
      case true:
        return 'Use Material-3 Typography 2021 and text styles';
      case false:
        return 'Use Material-2 Typography 2018 and text styles';
      case null:
        return 'Use Typography 2021 in Material-3 and 2018 in Material-2 '
            '(Default)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: controller.useFlexColorScheme && controller.useSubThemes,
      title: const Text('Typography'),
      subtitle: Text(_explainLabelStyle(controller.useMaterial3Typography)),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 2.0),
        child: NullableBoolToggleButtons(
          value: controller.useFlexColorScheme && controller.useSubThemes
              ? controller.useMaterial3Typography
              : null,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? controller.setUseMaterial3Typography
              : null,
        ),
      ),
      onTap: () {
        if (controller.useMaterial3Typography == false) {
          controller.setUseMaterial3Typography(null);
        } else if (controller.useMaterial3Typography == null) {
          controller.setUseMaterial3Typography(true);
        } else {
          controller.setUseMaterial3Typography(false);
        }
      },
    );
  }
}
