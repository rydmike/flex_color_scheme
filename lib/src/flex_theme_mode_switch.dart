import 'package:flutter/material.dart';

import 'flex_color.dart';

/// A 3-way Light, Dark and System theme-mode switch widget.
///
/// Pass in current selected [themeMode] value and the [onThemeModeChanged]
/// callback will return the selected theme-mode.
///
/// Requires a [FlexSchemeData] object via [flexSchemeData]. You
/// should pass it one that has the same value as the one currently used by
/// your `FlexColorScheme` based theme. Doing so, the option toggle buttons
/// will contain the scheme colors for both the light and dark theme
/// included in the option toggle button for each theme mode.
///
/// They scheme colors for each button will be in the order:
/// ```
/// | Primary    | Primary variant   |
/// | Secondary  | Secondary variant |
/// ```
/// In the option button. In the system choice the 2nd column will instead
/// contain the dark mode primary and secondary colors, thus combining both
/// theme mode's color scheme.
///
/// All other properties are optional, but it has extensive customization
/// options in order create a theme mode switch widget with a customized look,
/// see API reference for more info.
class FlexThemeModeSwitch extends StatelessWidget {
  /// Default constructor.
  const FlexThemeModeSwitch({
    Key key,
    @required this.themeMode,
    @required this.onThemeModeChanged,
    @required this.flexSchemeData,
    this.title,
    this.labelLight = 'LIGHT',
    this.labelDark = 'DARK',
    this.labelSystem = 'SYSTEM',
    this.showSystemMode = true,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.labelAbove = true,
    this.backgroundLight,
    this.backgroundDark,
    this.backgroundSystem,
    this.selectedBorder,
    this.unselectedBorder,
    this.selectedElevation = 0,
    this.unselectedElevation = 0,
    this.optionButtonPadding,
    this.optionButtonMargin,
    this.optionButtonBorderRadius = 5,
    this.height = 24,
    this.width = 24,
    this.borderRadius = 4,
    this.padding,
    this.hoverColor,
  })  : assert(themeMode != null, 'Theme mode cannot be null'),
        assert(
            onThemeModeChanged != null, 'On theme mode changed cannot be null'),
        assert(flexSchemeData != null, 'Flex scheme data cannot be null'),
        assert(showSystemMode != null, 'Show system mode cannot be null'),
        assert(labelAbove != null, 'Label above cannot be null'),
        assert(selectedElevation != null && selectedElevation >= 0.0,
            'Selected elevation cannot be null and must be >= 0.0'),
        assert(unselectedElevation != null && unselectedElevation >= 0.0,
            'Unselected elevation cannot be null and must be >= 0.0'),
        assert(optionButtonBorderRadius != null,
            'optionButtonBorderRadius cannot be null'),
        assert(height != null, 'Height cannot be null'),
        assert(width != null, 'Width cannot be null'),
        assert(borderRadius != null, 'Border radius cannot be null'),
        super(key: key);

  /// The current themeMode option button to be marked as selected.
  final ThemeMode themeMode;

  /// The new theme mode that was selected using the 3 option buttons.
  final ValueChanged<ThemeMode> onThemeModeChanged;

  /// The FlexSchemeData used to colorize the four colors in each theme mode
  /// option button.
  final FlexSchemeData flexSchemeData;

  /// A leading title widget for the theme mode switch.
  /// Defaults to `Text('Theme mode')` with style subtitle1, if it is null.
  final Widget title;

  /// Option label for theme mode light.
  /// Defaults to 'LIGHT', assign null to omit the label.
  final String labelLight;

  /// Option label for theme mode dark.
  /// Defaults to 'DARK', assign null to omit the label.
  final String labelDark;

  /// Option label for theme mode system.
  /// Defaults to 'SYSTEM', assign null to omit the label.
  final String labelSystem;

  /// Include a theme option button for selecting system theme mode.
  ///
  /// Defaults to true.
  /// If set to false, only a light and dark-mode options are available.
  final bool showSystemMode;

  /// Optional text style for the theme mode selected label.
  /// If null, default to Theme.of(context).textTheme.caption).
  final TextStyle selectedLabelStyle;

  /// Optional text style for the theme mode unselected label.
  /// If null, default to Theme.of(context).textTheme.caption).
  final TextStyle unselectedLabelStyle;

  /// If true, the label will be above the option button, if false the
  /// label will be below the option button. Defaults to true.
  final bool labelAbove;

  /// Background color for the light theme option button.
  /// If null, defaults to `Colors.white`.
  final Color backgroundLight;

  /// Background color for the dark theme option button.
  /// If null, defaults to `Colors.grey[850]`.
  final Color backgroundDark;

  /// Background color for the system theme option button.
  /// If null, defaults to `Colors.grey[500]`.
  final Color backgroundSystem;

  /// Border side for the selected option state.
  /// If null, defaults to
  /// `BorderSide(color: Theme.of(context).colorScheme.primary, width: 4)`.
  final BorderSide selectedBorder;

  /// Border side for the unselected option state.
  /// If null, defaults to `BorderSide(color: Theme.of(context).dividerColor)`.
  final BorderSide unselectedBorder;

  /// The elevation of the option button when selected.
  /// Defaults to 0 dp.
  final double selectedElevation;

  /// The elevation of the option button when unselected.
  /// Defaults to 0 dp.
  final double unselectedElevation;

  /// Padding around the option button.
  /// If null, defaults to `const EdgeInsetsDirectional.only(start: 6)`.
  final EdgeInsets optionButtonPadding;

  /// The margin inside the option button before the scheme color boxes.
  /// If null, defaults to `const EdgeInsets.all(4)`.
  final EdgeInsets optionButtonMargin;

  /// The circular borderRadius of the option button
  /// Defaults to 5 dp.
  final double optionButtonBorderRadius;

  /// The height of an individual scheme color box. Defaults to 24 dp.
  final double height;

  /// The width of an individual scheme color box. Defaults to 24 dp.
  final double width;

  /// The circular borderRadius of an individual scheme color box.
  /// Defaults to 3 dp.
  final double borderRadius;

  /// Padding around an individual scheme color box.
  /// If null, default to `const EdgeInsets.all(3)`
  final EdgeInsets padding;

  /// The InkWell hover color for the option buttons.
  ///
  /// If null, defaults to `Color(0x50BCBCBC)` in light mode and to
  /// `Color(0x99555555)` dark mode.
  final Color hoverColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: title ??
              Text('Theme mode', style: Theme.of(context).textTheme.subtitle1),
        ),
        // Option button for light theme mode.
        FlexThemeModeOptionButton(
          flexSchemeColor: flexSchemeData.light,
          backgroundColor: backgroundLight ?? Colors.white,
          label: labelLight,
          labelStyle: themeMode == ThemeMode.light
              ? selectedLabelStyle
              : unselectedLabelStyle,
          labelAbove: labelAbove,
          selected: themeMode == ThemeMode.light,
          onSelect: () {
            onThemeModeChanged(ThemeMode.light);
          },
          selectedBorder: selectedBorder,
          unselectedBorder: unselectedBorder,
          elevation: themeMode == ThemeMode.light
              ? selectedElevation
              : unselectedElevation,
          optionButtonPadding: optionButtonPadding,
          optionButtonMargin: optionButtonMargin,
          optionButtonBorderRadius: optionButtonBorderRadius,
          height: height,
          width: width,
          borderRadius: borderRadius,
          padding: padding,
          hoverColor: hoverColor,
        ),
        // Option button for dark theme mode.
        FlexThemeModeOptionButton(
          flexSchemeColor: flexSchemeData.dark,
          backgroundColor: backgroundDark ?? Colors.grey[850],
          label: labelDark,
          labelStyle: themeMode == ThemeMode.dark
              ? selectedLabelStyle
              : unselectedLabelStyle,
          labelAbove: labelAbove,
          selected: themeMode == ThemeMode.dark,
          onSelect: () {
            onThemeModeChanged(ThemeMode.dark);
          },
          selectedBorder: selectedBorder,
          unselectedBorder: unselectedBorder,
          elevation: themeMode == ThemeMode.dark
              ? selectedElevation
              : unselectedElevation,
          optionButtonPadding: optionButtonPadding,
          optionButtonMargin: optionButtonMargin,
          optionButtonBorderRadius: optionButtonBorderRadius,
          height: height,
          width: width,
          borderRadius: borderRadius,
          padding: padding,
          hoverColor: hoverColor,
        ),
        // Option button for system theme mode. For this case we show
        // the primary and variant color of light and dark theme, ie not all
        // four colors of either mode and we place them on a different
        // background to indicate that we do not actually know if it will
        // be light or dark, as that is controlled by the host system.
        if (showSystemMode)
          FlexThemeModeOptionButton(
            flexSchemeColor: FlexSchemeColor(
              primary: flexSchemeData.light.primary,
              primaryVariant: flexSchemeData.dark.primary,
              secondary: flexSchemeData.light.secondary,
              secondaryVariant: flexSchemeData.dark.secondary,
            ),
            backgroundColor: backgroundSystem ?? Colors.grey[500],
            label: labelSystem,
            labelStyle: themeMode == ThemeMode.system
                ? selectedLabelStyle
                : unselectedLabelStyle,
            labelAbove: labelAbove,
            selected: themeMode == ThemeMode.system,
            onSelect: () {
              onThemeModeChanged(ThemeMode.system);
            },
            selectedBorder: selectedBorder,
            unselectedBorder: unselectedBorder,
            elevation: themeMode == ThemeMode.system
                ? selectedElevation
                : unselectedElevation,
            optionButtonPadding: optionButtonPadding,
            optionButtonMargin: optionButtonMargin,
            optionButtonBorderRadius: optionButtonBorderRadius,
            height: height,
            width: width,
            borderRadius: borderRadius,
            padding: padding,
            hoverColor: hoverColor,
          ),
      ],
    );
  }
}

/// Stateless widget that draws a box with the 4 colors, primary,
/// primary variant secondary and secondary variant in the properties of
/// passed in [flexSchemeColor].
///
/// The widget has a required [selected] bool property for selected and
/// not selected status. A VoidCallback provides [onSelect] provides
/// select action callback info.
///
/// The [FlexThemeModeOptionButton] offers a large number of customization
/// options, see API reference for more info. This widget is typically used
/// via the [FlexThemeModeSwitch] widget.
class FlexThemeModeOptionButton extends StatelessWidget {
  /// Default constructor.
  const FlexThemeModeOptionButton({
    Key key,
    @required this.flexSchemeColor,
    @required this.backgroundColor,
    this.label,
    this.labelStyle,
    this.labelAbove = true,
    @required this.selected,
    @required this.onSelect,
    this.selectedBorder,
    this.unselectedBorder,
    this.elevation = 0,
    this.optionButtonPadding,
    this.optionButtonMargin,
    this.optionButtonBorderRadius = 5,
    this.height = 24,
    this.width = 24,
    this.borderRadius = 4,
    this.padding,
    this.hoverColor,
  })  : assert(flexSchemeColor != null, 'Scheme cannot be null'),
        assert(backgroundColor != null, 'Color cannot be null'),
        assert(labelAbove != null, 'Label above cannot be null'),
        assert(selected != null, 'Selected cannot be null'),
        assert(onSelect != null, 'onSelect cannot be null'),
        assert(elevation != null && elevation >= 0.0,
            'Elevation cannot be null and must be >= 0.0'),
        assert(optionButtonBorderRadius != null,
            'optionButtonBorderRadius cannot be null'),
        assert(height != null, 'Height cannot be null'),
        assert(width != null, 'Width cannot be null'),
        assert(borderRadius != null, 'Border radius cannot be null'),
        super(key: key);

  /// The scheme colors used to colorize the option button's four colors.
  final FlexSchemeColor flexSchemeColor;

  /// The background color of the option button
  final Color backgroundColor;

  /// Optional text label for the button, if null, the label is omitted.
  final String label;

  /// Optional text style for the [label].
  /// If null, default to Theme.of(context).textTheme.caption).
  final TextStyle labelStyle;

  /// If true, the label will be above the option button, if false the
  /// label will be below the option button. Defaults to true.
  final bool labelAbove;

  /// The button is selected.
  final bool selected;

  /// The button was clicked and selected.
  final VoidCallback onSelect;

  /// Border side for the selected option state.
  /// If null, defaults to
  /// `BorderSide(color: Theme.of(context).colorScheme.primary, width: 4)`.
  final BorderSide selectedBorder;

  /// Border side for the unselected option state.
  /// If null, defaults to `BorderSide(color: Theme.of(context).dividerColor)`.
  final BorderSide unselectedBorder;

  /// The elevation of the option button.
  /// Defaults to 0 dp.
  final double elevation;

  /// Padding around the option button.
  /// If null, defaults to `const EdgeInsetsDirectional.only(start: 6)`.
  final EdgeInsets optionButtonPadding;

  /// The margin inside the option button before the scheme color boxes.
  /// If null, defaults to `EdgeInsets.all(4)`.
  final EdgeInsets optionButtonMargin;

  /// The circular borderRadius of the option button
  /// Defaults to 5 dp.
  final double optionButtonBorderRadius;

  /// The height of an individual scheme color box. Defaults to 24 dp.
  final double height;

  /// The width of an individual scheme color box. Defaults to 24 dp.
  final double width;

  /// The circular borderRadius of an individual scheme color box.
  /// Defaults to 4 dp.
  final double borderRadius;

  /// Padding around an individual scheme color box.
  /// If null, default to `const EdgeInsets.all(3)`
  final EdgeInsets padding;

  /// The InkWell hover color for the option button.
  ///
  /// If null, defaults to `Color(0x50BCBCBC)` in light mode and to
  /// `Color(0x99555555)` in dark-mode.
  final Color hoverColor;

  @override
  Widget build(BuildContext context) {
    final Color effectiveHoverColor = hoverColor ??
        (Theme.of(context).brightness == Brightness.light
            ? const Color(0x50BCBCBC)
            : const Color(0x99555555));
    return Padding(
      padding:
          optionButtonPadding ?? const EdgeInsetsDirectional.only(start: 6),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              if (label != null && labelAbove)
                Text(
                  label,
                  style: labelStyle ?? Theme.of(context).textTheme.caption,
                  semanticsLabel: '', // Is set on button instead
                ),
              Material(
                elevation: elevation,
                color: backgroundColor,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(optionButtonBorderRadius),
                  ),
                  side: selected
                      ? selectedBorder ??
                          BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 4,
                          )
                      : unselectedBorder ??
                          BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                ),
                child: Semantics(
                  label: label ?? 'Theme',
                  selected: selected,
                  button: true,
                  enabled: true,
                  child: InkWell(
                    hoverColor: effectiveHoverColor,
                    onTap: onSelect,
                    child: Padding(
                      padding: optionButtonMargin ?? const EdgeInsets.all(4),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              _SchemeColorBox(
                                color: flexSchemeColor?.primary ??
                                    FlexColor.materialLightPrimary,
                                height: height ?? 24,
                                width: width ?? 24,
                                borderRadius: borderRadius ?? 4,
                                padding: padding,
                              ),
                              _SchemeColorBox(
                                color: flexSchemeColor?.primaryVariant ??
                                    FlexColor.materialLightPrimaryVariant,
                                height: height ?? 24,
                                width: width ?? 24,
                                borderRadius: borderRadius ?? 4,
                                padding: padding,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              _SchemeColorBox(
                                color: flexSchemeColor?.secondary ??
                                    FlexColor.materialLightSecondary,
                                height: height ?? 24,
                                width: width ?? 24,
                                borderRadius: borderRadius ?? 4,
                                padding: padding,
                              ),
                              _SchemeColorBox(
                                color: flexSchemeColor?.secondaryVariant ??
                                    FlexColor.materialLightSecondaryVariant,
                                height: height ?? 24,
                                width: width ?? 24,
                                borderRadius: borderRadius ?? 4,
                                padding: padding,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (label != null && !labelAbove)
                Text(
                  label,
                  style: labelStyle ?? Theme.of(context).textTheme.caption,
                  semanticsLabel: '', // Is set on button instead
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Draws a box with rounded corners with given background [color].
///
/// Have defaults for standard use case, but may be modified via parent.
class _SchemeColorBox extends StatelessWidget {
  /// Default constructor.
  const _SchemeColorBox({
    Key key,
    @required this.color,
    this.height = 24,
    this.width = 24,
    this.borderRadius = 4,
    this.padding,
  }) : super(key: key);

  /// The background color used to draw an individual scheme color box.
  /// Required, cannot be null.
  final Color color;

  /// The height of an individual scheme color box. Defaults to 24 dp.
  final double height;

  /// The width of an individual scheme color box. Defaults to 24 dp.
  final double width;

  /// The circular borderRadius of an individual scheme color box.
  /// Defaults to 4 dp.
  final double borderRadius;

  /// Padding around an individual scheme color box.
  /// If null, default to `const EdgeInsets.all(3)`
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(3),
      child: Container(
        height: height ?? 24,
        width: width ?? 24,
        decoration: BoxDecoration(
          color: color ?? FlexColor.materialLightPrimary,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 4)),
        ),
      ),
    );
  }
}
