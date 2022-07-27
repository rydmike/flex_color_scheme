import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// ToggleButtons used to change the used surface mode when blending in
// primary color into surfaces.
class SurfaceModeButtons extends StatelessWidget {
  const SurfaceModeButtons({
    super.key,
    required this.mode,
    required this.onChanged,
    this.showAllModes = true,
  });
  final FlexSurfaceMode mode;
  final ValueChanged<FlexSurfaceMode> onChanged;
  final bool showAllModes;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final List<bool> isSelected = <bool>[
      mode == FlexSurfaceMode.level,
      mode == FlexSurfaceMode.highBackgroundLowScaffold,
      mode == FlexSurfaceMode.highSurfaceLowScaffold,
      mode == FlexSurfaceMode.highScaffoldLowSurface,
      // Only show this blend option if show all set, not enough room.
      if (showAllModes) mode == FlexSurfaceMode.highScaffoldLevelSurface,
      mode == FlexSurfaceMode.levelSurfacesLowScaffold,
      mode == FlexSurfaceMode.highScaffoldLowSurfaces,
      // Only have these blend options if show all set, not enough room.
      if (showAllModes)
        mode == FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
      if (showAllModes)
        mode == FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    ];
    final List<FlexSurfaceMode> option = <FlexSurfaceMode>[
      FlexSurfaceMode.level,
      FlexSurfaceMode.highBackgroundLowScaffold,
      FlexSurfaceMode.highSurfaceLowScaffold,
      FlexSurfaceMode.highScaffoldLowSurface,
      // Only have this blend option if show all set, not enough room.
      if (showAllModes) FlexSurfaceMode.highScaffoldLevelSurface,
      FlexSurfaceMode.levelSurfacesLowScaffold,
      FlexSurfaceMode.highScaffoldLowSurfaces,
      // Only have these blend options if show all set, not enough room.
      if (showAllModes) FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
      if (showAllModes) FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        onChanged(option[newIndex]);
      },
      children: <Widget>[
        const Tooltip(
          message: 'Flat\nall at same level',
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
            message: 'High scaffold\nlevel surface',
            child: Icon(Icons.dynamic_feed_rounded),
          ),
        const Tooltip(
          message: 'Level surfaces\nlow scaffold',
          child:
              RotatedBox(quarterTurns: 2, child: Icon(Icons.horizontal_split)),
        ),
        const Tooltip(
          message: 'High scaffold\nlow surfaces (default)',
          child: Icon(Icons.horizontal_split),
        ),
        if (showAllModes)
          Tooltip(
            message: 'Tertiary container dialog\nlow scaffold',
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const RotatedBox(
                    quarterTurns: 2, child: Icon(Icons.horizontal_split)),
                Icon(Icons.stop, color: scheme.tertiary, size: 18),
              ],
            ),
          ),
        if (showAllModes)
          Tooltip(
            message: 'High scaffold\ntertiary container dialog',
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const Icon(Icons.horizontal_split),
                Icon(Icons.stop, color: scheme.tertiary, size: 18),
              ],
            ),
          ),
      ],
    );
  }
}
