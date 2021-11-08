import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Widget used to change the used surface mode in example 5.
class SurfaceModeButtons extends StatelessWidget {
  const SurfaceModeButtons({
    Key? key,
    required this.mode,
    required this.onChanged,
    this.showAllModes = true,
  }) : super(key: key);
  final FlexSurfaceMode mode;
  final ValueChanged<FlexSurfaceMode> onChanged;
  final bool showAllModes;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final List<bool> isSelected = <bool>[
      mode == FlexSurfaceMode.flat,
      mode == FlexSurfaceMode.highBackgroundLowScaffold,
      mode == FlexSurfaceMode.highSurfaceLowScaffold,
      mode == FlexSurfaceMode.highScaffoldLowSurface,
      // Only show this exotic blend if flag set.
      if (showAllModes) mode == FlexSurfaceMode.veryHighScaffoldLevelSurface,
      mode == FlexSurfaceMode.lowScaffold,
      mode == FlexSurfaceMode.veryHighScaffold,
      // Only show these exotic blend modes in wider media, there is not
      // enough room for them on phones, and they are not so important.
      if (showAllModes) mode == FlexSurfaceMode.lowScaffoldVariantDialog,
      if (showAllModes) mode == FlexSurfaceMode.veryHighScaffoldVariantDialog,
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
          child: Icon(Icons.layers_outlined),
        ),
        const Tooltip(
          message: 'High surface',
          child: Icon(Icons.layers),
        ),
        Tooltip(
          message: 'Very low surface\nHigh scaffold',
          child: Stack(
            alignment: Alignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(Icons.layers_outlined),
              ),
              Icon(Icons.layers),
            ],
          ),
        ),
        if (showAllModes)
          const Tooltip(
            message: 'Low surface\nVery high scaffold',
            child: Icon(Icons.dynamic_feed_rounded),
          ),
        const Tooltip(
          message: 'Low scaffold',
          child:
              RotatedBox(quarterTurns: 2, child: Icon(Icons.horizontal_split)),
        ),
        const Tooltip(
          message: 'High scaffold',
          child: Icon(Icons.horizontal_split),
        ),
        if (showAllModes)
          Tooltip(
            message: 'Low scaffold\nVariant dialog',
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const RotatedBox(
                    quarterTurns: 2, child: Icon(Icons.horizontal_split)),
                Icon(Icons.stop, color: scheme.secondaryVariant, size: 18),
              ],
            ),
          ),
        if (showAllModes)
          Tooltip(
            message: 'High scaffold\nVariant dialog',
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const Icon(Icons.horizontal_split),
                Icon(Icons.stop, color: scheme.secondaryVariant, size: 18),
              ],
            ),
          ),
      ],
    );
  }
}
