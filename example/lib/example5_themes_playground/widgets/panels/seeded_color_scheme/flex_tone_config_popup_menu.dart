import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/flex_tone.dart';
import '../../shared/color_scheme_box.dart';

/// Widget used to select used [FlexTones] with a popup menu.
///
/// Uses enhanced enum [FlexTone] to get data for the UI.
class FlexToneConfigPopupMenu extends StatelessWidget {
  const FlexToneConfigPopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title = '',
    this.contentPadding,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final String title;
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    // Value less than 1, or index over range disables the control.
    final bool disabled = index < 1 || index >= FlexTone.values.length;

    return PopupMenuButton<int>(
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        onChanged
            ?.call(index >= FlexTone.values.length || index < 1 ? 0 : index);
      },
      enabled: !disabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        // The '0' index is excluded, it describes the disabled state.
        for (int i = 1; i < FlexTone.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              leading: ColorSchemeBox(
                optionIcon: FlexTone.values[i].icon,
                color: FlexTone.values[i].shade < 0
                    ? colorScheme.primary.lighten(FlexTone.values[i].shade * -1)
                    : colorScheme.primary.darken(FlexTone.values[i].shade),
              ),
              title: Text(FlexTone.values[i].tone, style: txtStyle),
            ),
          )
      ],
      child: ListTile(
        enabled: !disabled,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        title: Text('$title ${FlexTone.values[index].tone}'),
        subtitle: Text(FlexTone.values[index].describe),
        trailing: ColorSchemeBox(
          color: !disabled ? colorScheme.primary : colorScheme.primaryContainer,
          defaultOption: disabled,
          optionIcon: FlexTone.values[index].icon,
        ),
      ),
    );
  }
}
