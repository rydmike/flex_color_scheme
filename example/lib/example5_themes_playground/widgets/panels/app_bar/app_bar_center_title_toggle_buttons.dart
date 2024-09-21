import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/nullable_bool_toggle_buttons.dart';

class AppBarCenterTitleToggleButtons extends StatelessWidget {
  const AppBarCenterTitleToggleButtons({
    super.key,
    required this.controller,
    this.contentPadding,
  });
  final ThemeController controller;

  /// The [ListTile]'s internal padding.
  ///
  /// Insets a [ListTile]'s contents.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used in M2
  /// and `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` in M3.
  final EdgeInsetsGeometry? contentPadding;

  String _explainLabelStyle(final bool? value) {
    switch (value) {
      case true:
        return 'Always center title (true)';
      case false:
        return 'Never center title (false)';
      case null:
        return 'Adaptive (null)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTileReveal(
      contentPadding: contentPadding,
      enabled: controller.useFlexColorScheme && controller.useSubThemes,
      title: const Text('Center title'),
      subtitle: Text(_explainLabelStyle(controller.appBarCenterTitle)),
      subtitleReveal: const Text('When default undefined "null" value is used, '
          'Flutter has built-in platform adaptive logic to center the title '
          'when running on iOs or macOS and to start align on other platforms. '
          'If two or more action icons are present, the title will be start '
          'aligned on all platforms when the value is null.'),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 2.0),
        child: NullableBoolToggleButtons(
          value: controller.useFlexColorScheme && controller.useSubThemes
              ? controller.appBarCenterTitle
              : null,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? controller.setAppBarCenterTitle
              : null,
        ),
      ),
      onTap: () {
        if (controller.appBarCenterTitle == false) {
          controller.setAppBarCenterTitle(null);
        } else if (controller.appBarCenterTitle == null) {
          controller.setAppBarCenterTitle(true);
        } else {
          controller.setAppBarCenterTitle(false);
        }
      },
    );
  }
}
