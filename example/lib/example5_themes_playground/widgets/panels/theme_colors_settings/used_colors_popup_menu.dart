import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/list_tile_reveal.dart';

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
      return 'Only scheme defined primary color used, other colors are '
          'computed by FlexColorScheme. Easy harmonious theme where all '
          'colors are different shades and variants of a single used '
          'primary color.';
    }
    if (colors == 2) {
      return 'Scheme defined primary and secondary colors used, other colors '
          'are computed by FlexColorScheme.';
    }
    if (colors == 3) {
      return 'Scheme defined primary, secondary and primary container colors '
          'used, other colors are computed by FlexColorScheme';
    }
    if (colors == 4) {
      return 'Scheme defined primary, secondary, plus primary and secondary '
          'container colors used, other colors are computed by '
          'FlexColorScheme.';
    }
    if (colors == 5) {
      return 'Scheme defined primary, secondary, tertiary, plus primary and '
          'secondary container colors used, only tertiary container color '
          'computed by FlexColorScheme.';
    }
    if (colors == 7) {
      return 'Scheme defined primary, secondary and tertiary colors are used, '
          'their container colors are computed by FlexColorScheme.';
    }
    return 'All main scheme colors defined in FlexColorScheme are using '
        'their defined values to make the theme.';
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
    if (colors == 7) {
      return 'Primary, secondary and tertiary';
    }
    return 'Primary, secondary, tertiary and containers';
  }

  String _avText(int colors) {
    if (colors == 7) {
      return 'PST';
    }
    return '$colors';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;

    return PopupMenuButton<int>(
      tooltip: '',
      initialValue: index,
      position: PopupMenuPosition.under,
      padding: EdgeInsets.zero,
      onSelected: onChanged,
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 1; i < 7 + 1; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              leading: CircleAvatar(child: Text(_avText(i))),
              title: Text(_selectColors(i), style: txtStyle),
            ),
          )
      ],
      child: ListTileReveal(
        enabled: enabled,
        contentPadding: contentPadding,
        title: title,
        subtitleDense: true,
        subtitle: Text('${_describeUsedColors(index)}\n'),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 10.0),
          child: CircleAvatar(child: Text(_avText(index))),
        ),
      ),
    );
  }
}
