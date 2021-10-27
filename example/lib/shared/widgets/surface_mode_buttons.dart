import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Widget used to change the used surface mode in example 5.
class SurfaceModeButtons extends StatelessWidget {
  const SurfaceModeButtons({
    Key? key,
    required this.mode,
    required this.onChanged,
  }) : super(key: key);
  final FlexSurfaceMode mode;
  final ValueChanged<FlexSurfaceMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final List<bool> isSelected = <bool>[
      mode == FlexSurfaceMode.flat,
      mode == FlexSurfaceMode.highBackground,
      mode == FlexSurfaceMode.highSurface,
      mode == FlexSurfaceMode.lowSurfaceHighScaffold,
      mode == FlexSurfaceMode.lowScaffold,
      mode == FlexSurfaceMode.highScaffold,
      mode == FlexSurfaceMode.lowScaffoldVariantDialog,
      mode == FlexSurfaceMode.highScaffoldVariantDialog,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        onChanged(FlexSurfaceMode.values[newIndex]);
      },
      children: <Widget>[
        const Tooltip(
          message: 'Flat',
          child: Icon(Icons.check_box_outline_blank),
        ),
        const Tooltip(
          message: 'High background',
          child: Icon(Icons.layers),
        ),
        const Tooltip(
          message: 'High surface',
          child: Icon(Icons.layers_outlined),
        ),
        const Tooltip(
          message: 'Low surface\nHigh scaffold',
          child: Icon(Icons.dynamic_feed_rounded),
        ),
        const Tooltip(
          message: 'Low scaffold',
          child: Icon(Icons.horizontal_split),
        ),
        const Tooltip(
          message: 'High scaffold',
          child:
              RotatedBox(quarterTurns: 2, child: Icon(Icons.horizontal_split)),
        ),
        Tooltip(
          message: 'Low scaffold\nVariant dialog',
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              const Icon(Icons.horizontal_split),
              Icon(Icons.stop, color: scheme.secondaryVariant, size: 18),
            ],
          ),
        ),
        Tooltip(
          message: 'High scaffold\nVariant dialog',
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              const RotatedBox(
                  quarterTurns: 2, child: Icon(Icons.horizontal_split)),
              Icon(Icons.stop, color: scheme.secondaryVariant, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
