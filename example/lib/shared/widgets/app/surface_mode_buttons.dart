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
      // Only show this blend option if show all set, not enough room.
      if (showAllModes) mode == FlexSurfaceMode.veryHighScaffoldLevelSurface,
      mode == FlexSurfaceMode.lowScaffold,
      mode == FlexSurfaceMode.veryHighScaffold,
      // Only have these blend options if show all set, not enough room.
      if (showAllModes) mode == FlexSurfaceMode.lowScaffoldVariantDialog,
      if (showAllModes) mode == FlexSurfaceMode.veryHighScaffoldVariantDialog,
    ];
    final List<FlexSurfaceMode> option = <FlexSurfaceMode>[
      FlexSurfaceMode.flat,
      FlexSurfaceMode.highBackgroundLowScaffold,
      FlexSurfaceMode.highSurfaceLowScaffold,
      FlexSurfaceMode.highScaffoldLowSurface,
      // Only have this blend option if show all set, not enough room.
      if (showAllModes) FlexSurfaceMode.veryHighScaffoldLevelSurface,
      FlexSurfaceMode.lowScaffold,
      FlexSurfaceMode.veryHighScaffold,
      // Only have these blend options if show all set, not enough room.
      if (showAllModes) FlexSurfaceMode.lowScaffoldVariantDialog,
      if (showAllModes) FlexSurfaceMode.veryHighScaffoldVariantDialog,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        onChanged(option[newIndex]);
      },
      children: <Widget>[
        const Tooltip(
          message: 'Flat',
          child: Icon(Icons.check_box_outline_blank),
        ),
        const Tooltip(
          message: 'High background\nlow scaffold',
          child: Icon(Icons.layers_outlined),
        ),
        const Tooltip(
          message: 'High surface\nlow scaffold',
          child: Icon(Icons.layers),
        ),
        Tooltip(
          message: 'High scaffold\nlow surface',
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
            message: 'Very high scaffold\nlevel surface',
            child: Icon(Icons.dynamic_feed_rounded),
          ),
        const Tooltip(
          message: 'Low scaffold\nsurfaces level',
          child:
              RotatedBox(quarterTurns: 2, child: Icon(Icons.horizontal_split)),
        ),
        const Tooltip(
          message: 'High scaffold\nsurfaces level',
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
            message: 'Very high scaffold\nVariant dialog',
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
