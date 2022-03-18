import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';

/// Popup used to change the used FlexSchemeData index in the theme controller
/// and via that the selected active theme.
class ThemePopupMenu extends StatelessWidget {
  const ThemePopupMenu({
    Key? key,
    required this.controller,
    this.contentPadding,
  }) : super(key: key);
  final ThemeController controller;
  // Defaults to 16, like ListTile does.
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final ColorScheme colorScheme = theme.colorScheme;

    return PopupMenuButton<int>(
      padding: EdgeInsets.zero,
      onSelected: controller.setSchemeIndex,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i < AppColor.schemes.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              leading: Icon(Icons.lens,
                  color: isLight
                      ? AppColor.schemeAtIndex(i, controller).light.primary
                      : AppColor.schemeAtIndex(i, controller).dark.primary,
                  size: 35),
              title: Text(AppColor.schemes[i].name),
            ),
          )
      ],
      child: ListTile(
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          '${AppColor.schemes[controller.schemeIndex].name} color scheme',
        ),
        subtitle: Text(AppColor.schemes[controller.schemeIndex].description),
        trailing: Icon(
          Icons.lens,
          color: colorScheme.primary,
          size: 40,
        ),
      ),
    );
  }
}
