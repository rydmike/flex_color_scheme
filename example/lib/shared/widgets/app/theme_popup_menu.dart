import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Widget used to change the used FlexSchemeData index in example 4 & 5.
class ThemePopupMenu extends StatelessWidget {
  const ThemePopupMenu({
    Key? key,
    required this.schemeIndex,
    required this.schemes,
    required this.onChanged,
    this.contentPadding,
  }) : super(key: key);
  final int schemeIndex;
  final List<FlexSchemeData> schemes;
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
        for (int i = 0; i < schemes.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              leading: Icon(Icons.lens,
                  color: isLight
                      ? schemes[i].light.primary
                      : schemes[i].dark.primary,
                  size: 35),
              title: Text(schemes[i].name),
            ),
          )
      ],
      child: ListTile(
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          '${schemes[schemeIndex].name} color scheme',
        ),
        subtitle: Text(schemes[schemeIndex].description),
        trailing: Icon(
          Icons.lens,
          color: colorScheme.primary,
          size: 40,
        ),
      ),
    );
  }
}
