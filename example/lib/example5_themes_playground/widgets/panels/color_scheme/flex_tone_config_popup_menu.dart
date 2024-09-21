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
    this.enabled = true,
    required this.index,
    this.onChanged,
    this.title = '',
    this.flexToneName = '',
    this.contentPadding,
  });
  final bool enabled;
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
    final bool disabled = index < 0 ||
        index >= FlexSchemeVariant.values.length ||
        onChanged == null ||
        !enabled;

    return PopupMenuButton<int>(
      popUpAnimationStyle: AnimationStyle.noAnimation,
      position: PopupMenuPosition.under,
      offset: const Offset(0, -4),
      constraints: const BoxConstraints(minWidth: 350, maxWidth: 350),
      initialValue: disabled ? 0 : index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        onChanged?.call(
            index >= FlexSchemeVariant.values.length || index < 0 ? 0 : index);
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
        subtitleReveal: Text(
          '$flexToneName scheme variant. '
          '${FlexSchemeVariant.values[index].description}.\n'
          '\n'
          '${FlexSchemeVariant.values[index].configDetails}.\n'
          '\n'
          'You can choose between the default Material-3 seed generation '
          "Tonal Spot or Flutter/MCU's eight other DynamicSchemeVariants, "
          'plus twelve pre-defined FSS FlexTones seed generation setups.\n'
          '\n'
          'TIP:\n'
          'By using the FlexTones "tones" API, you can make your own '
          'FlexTones definition and configure which tone from '
          'generated palettes each color in the ColorScheme use. You can also '
          'set limits on used chroma values for all six seed colors used as '
          'seed keys for primary, secondary, tertiary, error, neutral and '
          'neutral variant tonal palettes.\n',
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
