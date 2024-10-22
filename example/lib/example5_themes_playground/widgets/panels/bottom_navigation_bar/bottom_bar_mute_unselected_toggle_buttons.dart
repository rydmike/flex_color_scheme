import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/nullable_bool_toggle_buttons.dart';

class BottomBarMuteUnselectedToggleButtons extends StatelessWidget {
  const BottomBarMuteUnselectedToggleButtons({
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
        return 'Always mute';
      case false:
        return 'Never mute';
      case null:
        return 'Mute M2, not M3';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTileReveal(
      contentPadding: contentPadding,
      enabled: controller.useFlexColorScheme && controller.useSubThemes,
      title: const Text('Muted'),
      subtitle: Text(
          _explainLabelStyle(controller.bottomNavigationBarMuteUnselectedItem)),
      subtitleReveal: const Text('When undefined (null), unselected items are '
          'muted in M2 mode, but not in M3 mode. In M3 mode unselected items '
          'default to onSurfaceVariant, which already is a bit muted as a '
          'part of its color role definition. In M2 mode, onSurface is the '
          'default unselected, and it had another muting mechanism. '
          'We can be use it here too, in a slightly modified subtly '
          'color expressive version.'),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 2.0),
        child: NullableBoolToggleButtons(
          value: controller.useFlexColorScheme && controller.useSubThemes
              ? controller.bottomNavigationBarMuteUnselectedItem
              : null,
          onChanged: controller.useFlexColorScheme && controller.useSubThemes
              ? controller.setBottomNavigationBarMuteUnselectedItem
              : null,
        ),
      ),
      onTap: () {
        if (controller.bottomNavigationBarMuteUnselectedItem == false) {
          controller.setBottomNavigationBarMuteUnselectedItem(null);
        } else if (controller.bottomNavigationBarMuteUnselectedItem == null) {
          controller.setBottomNavigationBarMuteUnselectedItem(true);
        } else {
          controller.setBottomNavigationBarMuteUnselectedItem(false);
        }
      },
    );
  }
}
