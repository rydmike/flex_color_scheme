import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/nullable_bool_toggle_buttons.dart';

class UseMaterial3TextTheme extends StatelessWidget {
  const UseMaterial3TextTheme({
    required this.controller,
    super.key,
  });
  final ThemeController controller;

  String _explainLabelStyle(final bool? value) {
    switch (value) {
      case true:
        return 'ON: Use M3 typography 2021 and text styles';
      case false:
        return 'OFF: Use M2 typography 2018 and text styles';
      case null:
        return 'DEFAULT: Use typography 2021 in M3 and 2018 in M2';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: controller.useFlexColorScheme && controller.useSubThemes,
      title: const Text('Typography and default TextTheme'),
      subtitle: Text(_explainLabelStyle(controller.useTextTheme)),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 5.0),
        child: NullableBoolToggleButtons(
          value: controller.useFlexColorScheme && controller.useSubThemes
              ? controller.useTextTheme
              : null,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? controller.setUseTextTheme
              : null,
        ),
      ),
      onTap: () {
        if (controller.useTextTheme == false) {
          controller.setUseTextTheme(null);
        } else if (controller.useTextTheme == null) {
          controller.setUseTextTheme(true);
        } else {
          controller.setUseTextTheme(false);
        }
      },
    );
  }
}
