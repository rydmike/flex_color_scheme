import 'package:flutter/material.dart';

import '../../all_shared_imports.dart';

/// Widget used to change the used FlexSchemeData index in example 4 & 5.
class ThemePopupMenu extends StatelessWidget {
  const ThemePopupMenu({
    Key? key,
    required this.schemeIndex,
    required this.onChanged,
    this.contentPadding,
  }) : super(key: key);
  final int schemeIndex;
  final ValueChanged<int> onChanged;
  // Defaults to 16, like ListTile does.
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final ColorScheme colorScheme = theme.colorScheme;

    return PopupMenuButton<int>(
      padding: EdgeInsets.zero,
      onSelected: onChanged,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i < AppColor.schemes.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              leading: Icon(Icons.lens,
                  color: isLight
                      ? AppColor.schemes[i].light.primary
                      : AppColor.schemes[i].dark.primary,
                  size: 35),
              title: Text(AppColor.schemes[i].name),
            ),
          )
      ],
      child: ListTile(
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          '${AppColor.schemes[schemeIndex].name} color scheme',
        ),
        subtitle: Text(AppColor.schemes[schemeIndex].description),
        trailing: Icon(
          Icons.lens,
          color: colorScheme.primary,
          size: 40,
        ),
      ),
    );
  }
}
