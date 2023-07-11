import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/model/flex_tones_enum.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../shared/color_scheme_box.dart';

/// Widget used to select used [FlexTones] with a popup menu.
///
/// Uses enhanced enum [FlexTonesEnum] to get data for the UI.
class FlexToneConfigPopupMenu extends StatelessWidget {
  const FlexToneConfigPopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title = '',
    this.flexToneName = '',
    this.flexToneSetup = '',
    this.contentPadding,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final String title;
  final String flexToneName;
  final String flexToneSetup;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    // Value less than 1, or index over range disables the control.
    final bool disabled = index < 1 || index >= FlexTonesEnum.values.length;

    return PopupMenuButton<int>(
      initialValue: disabled ? 1 : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        onChanged?.call(
            index >= FlexTonesEnum.values.length || index < 1 ? 0 : index);
      },
      enabled: !disabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        // The '0' index is excluded, it describes the disabled state.
        for (int i = 1; i < FlexTonesEnum.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              leading: ColorSchemeBox(
                optionIcon: FlexTonesEnum.values[i].icon,
                backgroundColor: FlexTonesEnum.values[i].shade < 0
                    ? colorScheme.primary
                        .lighten(FlexTonesEnum.values[i].shade * -1)
                    : colorScheme.primary.darken(FlexTonesEnum.values[i].shade),
                borderColor: Colors.transparent,
              ),
              title: Text(FlexTonesEnum.values[i].toneLabel, style: txtStyle),
            ),
          )
      ],
      child: ListTileReveal(
        enabled: !disabled,
        contentPadding: contentPadding,
        title: Text('$title ${FlexTonesEnum.values[index].toneLabel}'),
        subtitle: Text(
          '${FlexTonesEnum.values[index].describe}.\n'
          '$flexToneName FlexTones setup has CAM16 chroma:\n'
          '\n'
          '$flexToneSetup\n'
          '\n'
          'With FlexTones, you can configure which tone from '
          'generated palettes each color in the ColorScheme use. '
          'Set limits on used CAM16 chroma values '
          'for the three colors used as keys for primary, '
          'secondary and tertiary TonalPalettes. '
          'Here you can choose between the default Material-3 tone '
          'mapping, plus ten other pre-defined custom FlexTones setups. With '
          'the API you can make your own FlexTones configurations.\n',
        ),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: ColorSchemeBox(
            backgroundColor:
                disabled ? colorScheme.surfaceVariant : colorScheme.primary,
            foregroundColor: disabled ? theme.dividerColor : null,
            borderColor: disabled ? theme.dividerColor : Colors.transparent,
            defaultOption: disabled,
            optionIcon: FlexTonesEnum.values[index].icon,
          ),
        ),
      ),
    );
  }
}
