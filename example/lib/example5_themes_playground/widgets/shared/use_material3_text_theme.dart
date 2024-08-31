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
        return 'Always use Material-3 typography 2021 and text styles '
            '(useTextTheme: True)';
      case false:
        return 'Always use Material-2 typography 2018 and text styles '
            '(useTextTheme: False)';
      case null:
        return 'Use typography 2021 in Material-3 and 2018 in Material-2 '
            '(useTextTheme: Null) (Default)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: controller.useFlexColorScheme && controller.useSubThemes,
      title: const Text('Typography and default TextTheme'),
      subtitle: Text(_explainLabelStyle(controller.useTextTheme)),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 2.0),
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
