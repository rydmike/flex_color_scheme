import 'package:flutter/material.dart';

/// Popup used to select the number of input colors to use when making
/// the FlexColorScheme.
///
/// This is just a popup with current selected value given in index
/// and onChanged  callback with index of selected item in the popup.
class UsedColorsPopupMenu extends StatelessWidget {
  const UsedColorsPopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title,
    this.contentPadding,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? title;

  /// Defaults to 16.
  final EdgeInsetsGeometry? contentPadding;

  String _describeUsedColors(int colors) {
    if (colors == 1) {
      return 'Only input primary color used, other colors are computed by '
          'FlexColorScheme';
    }
    if (colors == 2) {
      return 'Input primary and secondary colors used, other colors are '
          'computed by FlexColorScheme';
    }
    if (colors == 3) {
      return 'Input primary, secondary and primary container colors used, '
          'other colors are computed by FlexColorScheme';
    }
    if (colors == 4) {
      return 'Input primary, secondary, plus primary and secondary container '
          'colors used, other colors are computed by FlexColorScheme';
    }
    if (colors == 5) {
      return 'Input primary, secondary, tertiary, plus primary and secondary '
          'container colors used, only tertiary container color '
          'computed by FlexColorScheme';
    }
    return 'All input colors defined in FlexColorScheme are using their '
        'defined values';
  }

  String _selectColors(int colors) {
    if (colors == 1) {
      return 'Only primary';
    }
    if (colors == 2) {
      return 'Primary and Secondary';
    }
    if (colors == 3) {
      return 'Primary, secondary and primary container';
    }
    if (colors == 4) {
      return 'Primary, secondary and containers';
    }
    if (colors == 5) {
      return 'Primary, secondary and containers plus tertiary';
    }
    return 'Primary, secondary, tertiary and containers';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;

    return PopupMenuButton<int>(
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: onChanged,
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 1; i < 6 + 1; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              leading: CircleAvatar(child: Text('$i')),
              title: Text(_selectColors(i), style: txtStyle),
            ),
          )
      ],
      child: ListTile(
        enabled: enabled,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        title: title,
        subtitle: Text(_describeUsedColors(index)),
        trailing: CircleAvatar(child: Text('$index')),
      ),
    );
  }
}
