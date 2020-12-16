import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the examples.

// I considered making the FlexThemeModeSwitch below a part of the
// FlexColorScheme, but ultimately I think it easier to just provide as a
// part of te example applications and you can copy, modify and re-use it
// as needed.

/// A simple 3-way Light, Dark and System theme mode switch.
///
/// Pass in current selected theme mode value and onThemeModeChanged callback
/// will return the selected theme mode.
/// It also requires the FlexSchemeData object used by FlexColorScheme, you
/// should pass in a FlexSchemeData object with same values as your current
/// FlexColorScheme uses so that the displayed colors of the selector matches
/// your current theme.
class FlexThemeModeSwitch extends StatelessWidget {
  /// Default constructor
  const FlexThemeModeSwitch({
    Key key,
    @required this.themeMode,
    @required this.onThemeModeChanged,
    @required this.flexSchemeData,
    this.title,
    this.labelLight = 'LIGHT',
    this.labelDark = 'DARK',
    this.labelSystem = 'SYSTEM',
  }) : super(key: key);
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final FlexSchemeData flexSchemeData;

  /// Defaults to Text('Theme mode') with style subtitle1, if it is null.
  final Widget title;

  /// Defaults to 'LIGHT' can be passed null, to omit the label
  final String labelLight;

  /// Defaults to 'DARK' can be passed null, to omit the label
  final String labelDark;

  /// Defaults to 'SYSTEM' can be passed null, to omit the label
  final String labelSystem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: title ??
              Text('Theme mode', style: Theme.of(context).textTheme.subtitle1),
        ),
        // Selectable thumbnail for light theme mode.
        _ThemeOption(
          selected: themeMode == ThemeMode.light,
          onSelect: () {
            onThemeModeChanged(ThemeMode.light);
          },
          color: Colors.white,
          label: labelLight,
          scheme: flexSchemeData.light,
        ),
        // Selectable thumbnail for dark theme mode.
        _ThemeOption(
          selected: themeMode == ThemeMode.dark,
          onSelect: () {
            onThemeModeChanged(ThemeMode.dark);
          },
          color: Colors.grey[850],
          label: labelDark,
          scheme: flexSchemeData.dark,
        ),
        // Selectable thumbnail for system theme mode. For this case we show
        // the primary and variant color of light and dark theme, not all
        // four colors of either mode and we place them on a grey background
        // to indicate that we do not actually know if it will be light or
        // dark, as that is controlled by the host system.
        _ThemeOption(
          selected: themeMode == ThemeMode.system,
          onSelect: () {
            onThemeModeChanged(ThemeMode.system);
          },
          color: Colors.grey[500],
          label: labelSystem,
          scheme: FlexSchemeColor(
            primary: flexSchemeData.light.primary,
            primaryVariant: flexSchemeData.dark.primary,
            secondary: flexSchemeData.light.secondary,
            secondaryVariant: flexSchemeData.dark.secondary,
          ),
        ),
      ],
    );
  }
}

// Stateless widget that draw a box with the 4 colors primary, primary variant
// secondary and secondary variant from a [FlexSchemeColor] class.
//
// The widget has a bool [selected] for selected and not selected status.
// The selected state has a border with width 3, using theme accentColor
// and unSelected state using theme dividerColor. A VoidCallback provides
// onTap select action info.
class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    Key key,
    @required this.scheme,
    @required this.color,
    this.label,
    @required this.onSelect,
    @required this.selected,
  })  : assert(scheme != null, 'Scheme cannot be null'),
        assert(color != null, 'Color cannot be null'),
        assert(onSelect != null, 'onSelect cannot be null'),
        assert(selected != null, 'Selected cannot be null'),
        super(key: key);

  final FlexSchemeColor scheme;
  final Color color;
  final String label;
  final VoidCallback onSelect;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 8),
        Column(
          children: <Widget>[
            if (label != null)
              Text(label, style: Theme.of(context).textTheme.caption),
            Card(
              elevation: 0,
              color: color,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsetsDirectional.only(top: 2),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                side: selected
                    ? BorderSide(
                        color: Theme.of(context).colorScheme.primary, width: 4)
                    : BorderSide(color: Theme.of(context).dividerColor),
              ),
              child: InkWell(
                onTap: onSelect,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _ColorBox(color: scheme.primary),
                          _ColorBox(color: scheme.primaryVariant),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          _ColorBox(color: scheme.secondary),
                          _ColorBox(color: scheme.secondaryVariant),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Draws a small single rounded corner square with background color [color].
class _ColorBox extends StatelessWidget {
  const _ColorBox({
    Key key,
    @required this.color,
  })  : assert(color != null, 'Color cannot be null'),
        super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
}
