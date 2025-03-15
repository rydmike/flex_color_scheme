import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'surface_mode_popup_menu.dart';

// ignore_for_file: comment_references

/// Widget used to select used [FlexSurfaceMode] using [ToggleButtons].
///
/// This is a stateless widget version of surface mode Popupmenu selection using
/// call back. It was designed this way to be state management agnostic.
/// Widget using this widget can use state management to get and set values
/// for this widget. In this app see e.g. widgets
@immutable
class SurfaceModeToggleButtons extends StatelessWidget {
  const SurfaceModeToggleButtons({
    super.key,
    required this.mode,
    this.onChanged,
  });

  final FlexSurfaceMode mode;
  final ValueChanged<FlexSurfaceMode>? onChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final bool showAllModes = constraints.maxWidth > 380;
      // debugPrint('Max size is: ${constraints.maxWidth}');
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

      // On small media we exclude more exotic options, that will not fit
      // in a toggle buttons presentation.
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
          onChanged?.call(option[newIndex]);
        },
        children: SurfaceModePopupMenu.getModeWidget(scheme, showAllModes),
      );
    });
  }
}
