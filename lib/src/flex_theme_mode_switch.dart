import 'package:flutter/material.dart';

import 'flex_color.dart';

// TODO Finalize the API for the ThemeMode switch.
// It was a late decision to also include the theme mode button in the package.
// It is simple 3-way toggle button and the option element can be used
// as stand alone theme color indicator as well

/// A simple 3-way Light, Dark and System theme mode stateless switch widget.
///
/// Pass in current selected [themeMode] value and [onThemeModeChanged]
/// callback will return the selected theme mode.
///
/// It requires the [FlexSchemeData] object in property [flexSchemeData] you
/// should pass it one that has the same value as the one currently used by
/// your `FlexColorScheme` based theme. Doing so, the option toggle buttons
/// will contain the scheme colors for both the light and dark theme
/// included in the option toggle button for each theme mode.
///
/// They will be in the order:
/// | Primary    | Primary variant   |
/// | Secondary  | Secondary variant |
/// in the option button. In the system choice the 2nd column will instead
/// contain the dark mode primary and secondary colors, thus combining both
/// theme mode's color scheme.
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

  /// The current themeMode option button to be marked as selected.
  final ThemeMode themeMode;

  /// The new theme mode that was selected using the 3 option buttons.
  final ValueChanged<ThemeMode> onThemeModeChanged;

  /// The FlexScemeData used to colorize the four colors in each theme mode
  /// option button./
  final FlexSchemeData flexSchemeData;

  /// Defaults to Text('Theme mode') with style subtitle1, if it is null.
  final Widget title;

  /// Defaults to 'LIGHT' can be passed null, to omit the label
  final String labelLight;

  /// Defaults to 'DARK' can be passed null, to omit the label
  final String labelDark;

  /// Defaults to 'SYSTEM' can be passed null, to omit the label
  final String labelSystem;

  // TODO Expose more APIs for the widget
  // - Background colors
  // - Size of the small color elements
  // - Border radius on the small elements
  // - Border radius on option button
  // - Selected indicator color
  // - Unselected indicator color
  // - Selected indicator width
  // - Unselected indicator width

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: title ??
              Text('Theme mode', style: Theme.of(context).textTheme.subtitle1),
        ),
        // Option button for light theme mode.
        ThemeModeOptionButton(
          selected: themeMode == ThemeMode.light,
          onSelect: () {
            onThemeModeChanged(ThemeMode.light);
          },
          backgroundColor: Colors.white,
          label: labelLight,
          flexSchemeColor: flexSchemeData.light,
        ),
        // Option button for dark theme mode.
        ThemeModeOptionButton(
          selected: themeMode == ThemeMode.dark,
          onSelect: () {
            onThemeModeChanged(ThemeMode.dark);
          },
          backgroundColor: Colors.grey[850],
          label: labelDark,
          flexSchemeColor: flexSchemeData.dark,
        ),
        // Option button for system theme mode. For this case we show
        // the primary and variant color of light and dark theme, not all
        // four colors of either mode and we place them on a grey background
        // to indicate that we do not actually know if it will be light or
        // dark, as that is controlled by the host system.
        ThemeModeOptionButton(
          selected: themeMode == ThemeMode.system,
          onSelect: () {
            onThemeModeChanged(ThemeMode.system);
          },
          backgroundColor: Colors.grey[500],
          label: labelSystem,
          flexSchemeColor: FlexSchemeColor(
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

// TODO Expose more APIs for ThemeModeOptionButton

/// Stateless widget that draws a box with the 4 colors primary, primary variant
/// secondary and secondary variant from a [FlexSchemeColor] class.
///
/// The widget has a bool [selected] for selected and not selected status.
/// The selected state has a border with width 3, using theme accentColor
/// and unSelected state using theme dividerColor. A VoidCallback provides
/// onTap select action info.
class ThemeModeOptionButton extends StatelessWidget {
  /// Default constructor.
  const ThemeModeOptionButton({
    Key key,
    @required this.flexSchemeColor,
    @required this.backgroundColor,
    this.label,
    this.labelAbove = true,
    @required this.onSelect,
    @required this.selected,
  })  : assert(flexSchemeColor != null, 'Scheme cannot be null'),
        assert(backgroundColor != null, 'Color cannot be null'),
        assert(labelAbove != null, 'Label above cannot be null'),
        assert(onSelect != null, 'onSelect cannot be null'),
        assert(selected != null, 'Selected cannot be null'),
        super(key: key);

  /// The scheme colors used to colorize the option button's four colors.
  final FlexSchemeColor flexSchemeColor;

  /// The background color of the option button
  final Color backgroundColor;

  /// A text label for the option button, can use null for no label.
  final String label;

  /// The label should be above the option button when given.
  ///
  /// If false the label will be below the option button if a label is given.
  /// Defaults to true.
  final bool labelAbove;

  /// The button was clicked and selected.
  final VoidCallback onSelect;

  /// The button is selected.
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 8),
        Column(
          children: <Widget>[
            if (label != null && labelAbove)
              Text(label, style: Theme.of(context).textTheme.caption),
            Card(
              elevation: 0,
              color: backgroundColor,
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
                          _ColorBox(color: flexSchemeColor.primary),
                          _ColorBox(color: flexSchemeColor.primaryVariant),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          _ColorBox(color: flexSchemeColor.secondary),
                          _ColorBox(color: flexSchemeColor.secondaryVariant),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (label != null && !labelAbove)
              Text(label, style: Theme.of(context).textTheme.caption),
          ],
        ),
      ],
    );
  }
}

/// Draws a small square with rounded corners square with
/// background color [color].
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
