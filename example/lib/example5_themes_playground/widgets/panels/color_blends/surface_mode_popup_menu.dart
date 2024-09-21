import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/color_scheme_box.dart';

// ignore_for_file: comment_references

/// Widget used to select used [FlexSurfaceMode] using a popup menu.
///
/// This is a stateless widget version of surface mode Popupmenu selection using
/// call back. It was designed this way to be state management agnostic.
/// Widget using this widget can use state management to get and set values
/// for this widget. In this app see e.g. widgets
/// [LightSurfacePopupMenu] and [DarkSurfacePopupMenu].
class SurfaceModePopupMenu extends StatelessWidget {
  const SurfaceModePopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.labelForDefault = 'default (null)',
    this.popupLabelDefault,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final EdgeInsetsGeometry? contentPadding;
  final String labelForDefault;
  final String? popupLabelDefault;

  // A function that returns a List of widgets with the content that we
  // need in both the popup menu and toggle buttons implementation.
  // It needs the theme ColorScheme so it can't be a const list or final, and
  // we need to control when we only included a sub set in toggle buttons case.
  static List<Widget> getModeWidget(ColorScheme scheme,
          [bool allModes = true]) =>
      <Widget>[
        const Tooltip(
          message: 'Level blend\nAll at same level\n'
              '(level)',
          child: Icon(Icons.check_box_outline_blank),
        ),
        const Tooltip(
          message: 'Very high surfaces\nLow scaffold\n'
              '(highBackgroundLowScaffold)',
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(Icons.layers_outlined),
              ),
              Icon(Icons.layers),
            ],
          ),
        ),
        const Tooltip(
          message: 'High surfaces\nLow scaffold\n'
              '(highSurfaceLowScaffold)',
          child: Icon(Icons.layers),
        ),
        const Tooltip(
          message: 'Low surfaces\nHigh scaffold\n'
              '(highScaffoldLowSurface)',
          child: Icon(Icons.layers_outlined),
        ),
        if (allModes)
          const Tooltip(
            message: 'Level surfaces\nHigh scaffold\n'
                '(highScaffoldLevelSurface)',
            child: Icon(Icons.dynamic_feed_rounded),
          ),
        const Tooltip(
          message: 'Level surfaces\nLow scaffold\n'
              '(levelSurfacesLowScaffold)',
          child:
              RotatedBox(quarterTurns: 2, child: Icon(Icons.horizontal_split)),
        ),
        const Tooltip(
          message: 'Low surfaces\nHigh scaffold\n'
              '(highScaffoldLowSurfaces)',
          child: Icon(Icons.horizontal_split),
        ),
        if (allModes)
          Tooltip(
            message: 'Level surfaces, low scaffold\n'
                'Level tertiaryContainer dialog\n'
                '(levelSurfacesLowScaffoldVariantDialog)',
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const RotatedBox(
                    quarterTurns: 2, child: Icon(Icons.horizontal_split)),
                Icon(Icons.stop, color: scheme.tertiary, size: 18),
              ],
            ),
          ),
        if (allModes)
          Tooltip(
            message: 'Low surfaces, very high scaffold\n'
                'Low tertiaryContainer dialog\n'
                '(highScaffoldLowSurfacesVariantDialog)',
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const Icon(Icons.horizontal_split),
                Icon(Icons.stop, color: scheme.tertiary, size: 18),
              ],
            ),
          ),
      ];

  // Short explanation of the used surface mode.
  static String modeShort(final FlexSurfaceMode mode) {
    switch (mode) {
      case FlexSurfaceMode.level:
        return 'Level blend\nAll at same level';
      case FlexSurfaceMode.highBackgroundLowScaffold:
        return 'Very high surfaces\nLow scaffold';
      case FlexSurfaceMode.highSurfaceLowScaffold:
        return 'High surfaces\nLow scaffold';
      case FlexSurfaceMode.highScaffoldLowSurface:
        return 'Low surfaces\nHigh scaffold';
      case FlexSurfaceMode.highScaffoldLevelSurface:
        return 'Level surfaces\nHigh scaffold';
      case FlexSurfaceMode.levelSurfacesLowScaffold:
        return 'Level surfaces\nLow scaffold';
      case FlexSurfaceMode.highScaffoldLowSurfaces:
        return 'Low surfaces\nHigh scaffold';
      case FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog:
        return 'Level surfaces, low scaffold\n'
            'Level tertContainer dialog';
      case FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog:
        return 'Low surfaces, very hi scaffold\n'
            'Low tertContainer dialog';
      case FlexSurfaceMode.custom:
        return '';
    }
  }

  // Explain the used surface mode. This is for dev mode to have an explanation
  // of what the used surface mode. All of these are not used by out control,
  // but if we add them this will cover all of them.
  String explainMode(final FlexSurfaceMode mode) {
    switch (mode) {
      case FlexSurfaceMode.level:
        return 'Level blends\n'
            'Surfaces 1x  Scaffold 1x\n';
      case FlexSurfaceMode.highBackgroundLowScaffold:
        return 'Very high surfaces, low scaffold\n'
            'Surfaces 2x  Scaffold 1/2x\n';
      case FlexSurfaceMode.highSurfaceLowScaffold:
        return 'High surfaces, low scaffold\n'
            'Surface 3/2x  Scaffold 1/2x\n';
      case FlexSurfaceMode.highScaffoldLowSurface:
        return 'Low surfaces, high scaffold\n'
            'Surfaces 1/2x  Scaffold 3x\n';
      case FlexSurfaceMode.highScaffoldLevelSurface:
        return 'Level surfaces, high scaffold\n'
            'Surfaces 1x  Scaffold 3x\n';
      case FlexSurfaceMode.levelSurfacesLowScaffold:
        return 'Level surfaces, low scaffold\n'
            'Surfaces 1x  Scaffold 1/2x\n';
      case FlexSurfaceMode.highScaffoldLowSurfaces:
        return 'Low surfaces, high scaffold\n'
            'Surfaces 1/2x  Scaffold 3x\n';
      case FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog:
        return 'Level surfaces, low scaffold, level tertiary container dialog\n'
            'Surfaces 1x  Scaffold 1/2x\n'
            'Dialog 1x blend of tertiary container color';
      case FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog:
        return 'Low surfaces, high scaffold, '
            'low tertiary container dialog\n'
            'Surfaces 1/2x  Scaffold 3x\n'
            'Dialog 1/2x blend of tertiary container color';
      case FlexSurfaceMode.custom:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelMedium!;
    final bool enabled = onChanged != null;
    final String styleName = explainMode(FlexSurfaceMode.values[index]);
    final List<Widget> modeWidgets = getModeWidget(scheme);

    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.primary);

    return PopupMenuButton<int>(
      popUpAnimationStyle: AnimationStyle.noAnimation,
      position: PopupMenuPosition.under,
      offset: const Offset(0, -4),
      constraints: const BoxConstraints(maxHeight: 560),
      initialValue: index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached max length or any negative
        // value will cause controller for a FlexAppBarStyle to be set to
        // "null", we need to be able to do that to input "null" property
        // value to FlexAppBarStyle configs.
        onChanged?.call(index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<int>>[
          for (int i = 0; i < FlexSurfaceMode.values.length - 1; i++)
            PopupMenuItem<int>(
              value: i,
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: index == i
                    ? IconTheme(
                        data: selectedIconTheme,
                        child: ColorSchemeBox(
                          backgroundColor: scheme.primary,
                          borderColor: scheme.primary,
                          child: modeWidgets[i],
                        ),
                      )
                    : IconTheme(
                        data: unSelectedIconTheme,
                        child: ColorSchemeBox(
                          backgroundColor: Colors.transparent,
                          borderColor: scheme.primary,
                          child: modeWidgets[i],
                        ),
                      ),
                title: Text(
                  modeShort(FlexSurfaceMode.values[i]),
                  style: txtStyle,
                ),
                subtitle: Text(
                  '(${FlexSurfaceMode.values[i].name})',
                  style: txtStyle.copyWith(fontSize: 9.0),
                ),
              ),
            )
        ];
      },
      child: ListTile(
        enabled: enabled,
        contentPadding: contentPadding,
        title: title,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (subtitle != null) subtitle!,
            Text(styleName),
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: IconTheme(
            data: selectedIconTheme,
            child: ColorSchemeBox(
              backgroundColor: scheme.primary,
              borderColor: scheme.primary,
              child: modeWidgets[index],
            ),
          ),
        ),
      ),
    );
  }
}
