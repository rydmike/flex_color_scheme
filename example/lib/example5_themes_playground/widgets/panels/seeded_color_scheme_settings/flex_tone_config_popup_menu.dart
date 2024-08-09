import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../shared/color_scheme_box.dart';

/// Widget used to select used [FlexTones] with a popup menu.
///
/// Uses enhanced enum [FlexSchemeVariant] to get data for the UI.
class FlexToneConfigPopupMenu extends StatelessWidget {
  const FlexToneConfigPopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title = '',
    this.flexToneName = '',
    this.contentPadding,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final String title;
  final String flexToneName;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    // Value less than 0, or index over range disables the control.
    final bool disabled = index < 0 || index >= FlexSchemeVariant.values.length;

    return PopupMenuButton<int>(
      initialValue: disabled ? 0 : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        onChanged?.call(
            index >= FlexSchemeVariant.values.length || index < 1 ? 0 : index);
      },
      enabled: !disabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i < FlexSchemeVariant.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              leading: Badge(
                label: FlexSchemeVariant.values[i].isFlutterScheme
                    ? const Text('MCU', style: TextStyle(fontSize: 8))
                    : const Text('FSS', style: TextStyle(fontSize: 8)),
                child: ColorSchemeBox(
                  optionIcon: FlexSchemeVariant.values[i].icon,
                  backgroundColor: FlexSchemeVariant.values[i].shade < 0
                      ? colorScheme.primary
                          .lighten(FlexSchemeVariant.values[i].shade * -1)
                      : colorScheme.primary
                          .darken(FlexSchemeVariant.values[i].shade),
                  borderColor: Colors.transparent,
                ),
              ),
              title: Text(FlexSchemeVariant.values[i].variantName,
                  style: txtStyle),
            ),
          )
      ],
      child: ListTileReveal(
        enabled: !disabled,
        contentPadding: contentPadding,
        title: Text('$title ${FlexSchemeVariant.values[index].variantName}'),
        subtitle: Text(
          '$flexToneName setup:\n\n'
          '${FlexSchemeVariant.values[index].configDetails}.\n'
          '\n'
          'With FSS based FlexTones, you can configure which tone from '
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
          child: Badge(
            label: FlexSchemeVariant.values[index].isFlutterScheme
                ? const Text('MCU', style: TextStyle(fontSize: 8))
                : const Text('FSS', style: TextStyle(fontSize: 8)),
            child: ColorSchemeBox(
              backgroundColor: disabled
                  ? colorScheme.surfaceContainerHighest
                  : colorScheme.primary,
              foregroundColor: disabled ? theme.dividerColor : null,
              borderColor: disabled ? theme.dividerColor : Colors.transparent,
              defaultOption: disabled,
              optionIcon: FlexSchemeVariant.values[index].icon,
            ),
          ),
        ),
      ),
    );
  }
}
