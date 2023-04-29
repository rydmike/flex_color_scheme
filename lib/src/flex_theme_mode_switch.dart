import 'package:flutter/material.dart';

import 'flex_scheme_color.dart';
import 'flex_scheme_data.dart';

/// Enum used to define the order, from left to right, of the theme mode
/// selection buttons on the [FlexThemeModeSwitch].
enum FlexThemeModeButtonOrder {
  /// The theme mode buttons are in order: Light, Dark, System.
  lightDarkSystem,

  /// The theme mode buttons are in order: Light, System, Dark.
  lightSystemDark,

  /// The theme mode buttons are in order: Dark, System, Light.
  darkSystemLight,

  /// The theme mode buttons are in order: Dark, Light, System.
  darkLightSystem,
}

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
/// | Primary           | Secondary       |
/// | Primary container | Tertiary        |
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
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.flexSchemeData,
    this.title,
    this.hasTitle = true,
    this.labelLight = 'LIGHT',
    this.labelDark = 'DARK',
    this.labelSystem = 'SYSTEM',
    this.showSystemMode = true,
    this.buttonOrder = FlexThemeModeButtonOrder.lightDarkSystem,
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
    this.focusColor,
  })  : assert(selectedElevation >= 0.0, 'Selected elevation must be >= 0.0'),
        assert(
            unselectedElevation >= 0.0, 'Unselected elevation must be >= 0.0');

  /// The current themeMode option button to be marked as selected.
  final ThemeMode themeMode;

  /// The new theme mode that was selected using the 3 option buttons.
  final ValueChanged<ThemeMode> onThemeModeChanged;

  /// The FlexSchemeData used to colorize the four colors in each theme mode
  /// option button.
  final FlexSchemeData flexSchemeData;

  /// A leading title widget for the theme mode switch.
  /// Defaults to `Text('Theme mode')` with style subtitle1, if it is null.
  final Widget? title;

  /// To use the widget without any leading title set to false;
  ///
  /// Defaults to true.
  final bool hasTitle;

  /// Option label for theme mode light.
  ///
  /// Defaults to 'LIGHT', assign null to omit the label.
  final String labelLight;

  /// Option label for theme mode dark.
  ///
  /// Defaults to 'DARK', assign null to omit the label.
  final String labelDark;

  /// Option label for theme mode system.
  ///
  /// Defaults to 'SYSTEM', assign null to omit the label.
  final String labelSystem;

  /// Include a theme option button for selecting system theme mode.
  ///
  /// Defaults to true.
  ///
  /// If set to false, only a light and dark-mode options are available.
  final bool showSystemMode;

  /// Set the order of the system mode selection buttons.
  ///
  /// Order follows the enum label from left to right. If [showSystemMode] is
  /// false, the system button is left out in the resulting order.
  ///
  /// Defaults to [FlexThemeModeButtonOrder.lightDarkSystem].
  final FlexThemeModeButtonOrder buttonOrder;

  /// Optional text style for the theme mode selected label.
  ///
  /// If null, default to Theme.of(context).textTheme.caption).
  final TextStyle? selectedLabelStyle;

  /// Optional text style for the theme mode unselected label.
  ///
  /// If null, default to Theme.of(context).textTheme.caption).
  final TextStyle? unselectedLabelStyle;

  /// Label is positioned above the option button.
  ///
  /// If true, the label will be above the option button, if false the
  /// label will be below the option button. Defaults to true.
  final bool labelAbove;

  /// Background color for the light theme option button.
  ///
  /// If null, defaults to `Colors.white`.
  final Color? backgroundLight;

  /// Background color for the dark theme option button.
  ///
  /// If null, defaults to `Colors.grey[850]`.
  final Color? backgroundDark;

  /// Background color for the system theme option button.
  ///
  /// If null, defaults to `Colors.grey[500]`.
  final Color? backgroundSystem;

  /// Border side for the selected option state.
  ///
  /// If null, defaults to
  /// `BorderSide(color: Theme.of(context).colorScheme.primary, width: 4)`.
  final BorderSide? selectedBorder;

  /// Border side for the unselected option state.
  ///
  /// If null, defaults to `BorderSide(color: Theme.of(context).dividerColor)`.
  final BorderSide? unselectedBorder;

  /// The elevation of the option button when selected.
  ///
  /// Defaults to 0 dp.
  final double selectedElevation;

  /// The elevation of the option button when unselected.
  ///
  /// Defaults to 0 dp.
  final double unselectedElevation;

  /// Padding around the option button.
  ///
  /// If null, defaults to `const EdgeInsetsDirectional.only(start: 6)`.
  final EdgeInsetsGeometry? optionButtonPadding;

  /// The margin inside the option button, before the scheme color boxes.
  ///
  /// If null, defaults to `const EdgeInsets.all(4)`.
  final EdgeInsetsGeometry? optionButtonMargin;

  /// The circular borderRadius of the option button.
  ///
  /// Defaults to 5 dp.
  final double optionButtonBorderRadius;

  /// The height of an individual scheme color box.
  ///
  /// Defaults to 24 dp.
  final double height;

  /// The width of an individual scheme color box.
  ///
  /// Defaults to 24 dp.
  final double width;

  /// The circular borderRadius of an individual scheme color box.
  ///
  /// Defaults to 3 dp.
  final double borderRadius;

  /// Padding around an individual scheme color box.
  ///
  /// If null, default to `const EdgeInsets.all(3)`
  final EdgeInsetsGeometry? padding;

  /// The InkWell hover color for the option buttons.
  ///
  /// If null, defaults to `Color(0x50BCBCBC)` in light mode and to
  /// `Color(0x99555555)` dark mode.
  final Color? hoverColor;

  /// The InkWell focus color for the option button.
  ///
  /// If not defined, defaults to Theme.of(context).focusColor, via InkWell
  /// default behavior.
  final Color? focusColor;

  @override
  Widget build(BuildContext context) {
    final FlexThemeModeOptionButton lightButton = FlexThemeModeOptionButton(
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
      focusColor: focusColor,
    );

    final FlexThemeModeOptionButton darkButton = FlexThemeModeOptionButton(
      flexSchemeColor: flexSchemeData.dark,
      backgroundColor: backgroundDark ?? Colors.grey[850]!,
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
      elevation:
          themeMode == ThemeMode.dark ? selectedElevation : unselectedElevation,
      optionButtonPadding: optionButtonPadding,
      optionButtonMargin: optionButtonMargin,
      optionButtonBorderRadius: optionButtonBorderRadius,
      height: height,
      width: width,
      borderRadius: borderRadius,
      padding: padding,
      hoverColor: hoverColor,
      focusColor: focusColor,
    );

    // Option button for system theme mode. For this case we show
    // the primary and variant color of light and dark theme, ie not all
    // four colors of either mode and we place them on a different
    // background to indicate that we do not actually know if it will
    // be light or dark, as that is controlled by the host system.
    final FlexThemeModeOptionButton systemButton = FlexThemeModeOptionButton(
      flexSchemeColor: FlexSchemeColor(
        primary: flexSchemeData.light.primary,
        primaryContainer: flexSchemeData.dark.primary,
        secondary: flexSchemeData.light.secondary,
        secondaryContainer: flexSchemeData.dark.secondary,
      ),
      backgroundColor: backgroundSystem ?? Colors.grey[500]!,
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
      focusColor: focusColor,
    );

    return Row(
      children: <Widget>[
        if (hasTitle)
          Expanded(
            child: title ??
                Text(
                  'Theme mode',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
          ),
        if (buttonOrder ==
            FlexThemeModeButtonOrder.lightDarkSystem) ...<Widget>[
          lightButton,
          darkButton,
          if (showSystemMode) systemButton,
        ],
        if (buttonOrder ==
            FlexThemeModeButtonOrder.darkLightSystem) ...<Widget>[
          darkButton,
          lightButton,
          if (showSystemMode) systemButton,
        ],
        if (buttonOrder ==
            FlexThemeModeButtonOrder.lightSystemDark) ...<Widget>[
          lightButton,
          if (showSystemMode) systemButton,
          darkButton,
        ],
        if (buttonOrder ==
            FlexThemeModeButtonOrder.darkSystemLight) ...<Widget>[
          darkButton,
          if (showSystemMode) systemButton,
          lightButton,
        ],
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
class FlexThemeModeOptionButton extends StatefulWidget {
  /// Default constructor.
  const FlexThemeModeOptionButton({
    super.key,
    required this.flexSchemeColor,
    this.backgroundColor,
    this.label,
    this.semanticLabel,
    this.labelStyle,
    this.labelAbove = true,
    required this.selected,
    this.onSelect,
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
    this.focusColor,
    this.setFocusOnTap,
  }) : assert(elevation >= 0.0, 'Elevation must be >= 0.0');

  /// The scheme colors used to colorize the option button's four colors.
  final FlexSchemeColor flexSchemeColor;

  /// The background color of the option button.
  ///
  /// Defaults to Material default background color if null.
  final Color? backgroundColor;

  /// Optional text label for the button.
  ///
  /// If not defined, the label is omitted.
  final String? label;

  /// Optional semantic label for the button.
  ///
  /// If null, then defaults to [label], if it is also null, it defaults
  /// to "Theme mode option button".
  final String? semanticLabel;

  /// Optional text style for the [label].
  ///
  /// If null, default to Theme.of(context).textTheme.caption).
  final TextStyle? labelStyle;

  /// Label is positioned above the option button.
  ///
  /// If true, the label will be above the option button, if false the
  /// label will be below the option button. Defaults to true.
  final bool labelAbove;

  /// The button is selected.
  final bool selected;

  /// The button was clicked and selected.
  ///
  /// The optional callback allows for the button to be used eg as a trailing
  /// widget in a ListTile. Keep it null to not have any callback and use the
  /// click event in the parent instead.
  final VoidCallback? onSelect;

  /// Border side for the selected option state.
  ///
  /// If null, defaults to
  /// `BorderSide(color: Theme.of(context).colorScheme.primary, width: 4)`.
  final BorderSide? selectedBorder;

  /// Border side for the unselected option state.
  ///
  /// If null, defaults to `BorderSide(color: Theme.of(context).dividerColor)`.
  final BorderSide? unselectedBorder;

  /// The elevation of the option button.
  ///
  /// Defaults to 0 dp.
  final double elevation;

  /// Padding around the option button.
  ///
  /// If null, defaults to `const EdgeInsetsDirectional.only(start: 6)`.
  final EdgeInsetsGeometry? optionButtonPadding;

  /// The margin inside the option button, before the scheme color boxes.
  ///
  /// If null, defaults to `const EdgeInsets.all(2)`.
  final EdgeInsetsGeometry? optionButtonMargin;

  /// The circular borderRadius of the option button,
  ///
  /// Defaults to 5 dp.
  final double optionButtonBorderRadius;

  /// The height of an individual scheme color box.
  ///
  /// Defaults to 24 dp.
  final double height;

  /// The width of an individual scheme color box.
  ///
  /// Defaults to 24 dp.
  final double width;

  /// The circular borderRadius of an individual scheme color box.
  ///
  /// Defaults to 4 dp.
  final double borderRadius;

  /// Padding around an individual scheme color box.
  ///
  /// If null, default to `const EdgeInsets.all(3)`
  final EdgeInsetsGeometry? padding;

  /// The InkWell hover color for the option button.
  ///
  /// If null, defaults to `Color(0x50BCBCBC)` in light mode and to
  /// `Color(0x99555555)` in dark-mode.
  ///
  /// If using custom theming that should be used, pass in
  /// Theme.of(context).hoverColor.
  final Color? hoverColor;

  /// The InkWell focus color for the option button.
  ///
  /// If not defined, defaults to Theme.of(context).focusColor, via InkWell
  /// default behavior.
  final Color? focusColor;

  /// If true, sets focus to the button when it is tapped.
  ///
  /// If not defined, default to false.
  final bool? setFocusOnTap;

  @override
  State<FlexThemeModeOptionButton> createState() =>
      _FlexThemeModeOptionButtonState();
}

class _FlexThemeModeOptionButtonState extends State<FlexThemeModeOptionButton> {
  late final FocusNode _focusNode;
  // Paddings needed for the size of the buttons so we can make a SizedBox
  // with the Ink in a Sized transparent Material on top of the buttons.
  double padX = 0;
  double padY = 0;
  // Default padding around an individual scheme color box.
  static const EdgeInsets _padding = EdgeInsets.all(3);
  // The default margin inside the option button, before the scheme color boxes.
  static const EdgeInsets _optionButtonMargin = EdgeInsets.all(4);

  void updatePaddings() {
    final EdgeInsetsGeometry padding = widget.padding ?? _padding;
    if (padding is EdgeInsets) {
      padX = (padding.left + padding.right) * 2;
      padY = (padding.top + padding.bottom) * 2;
    } else if (padding is EdgeInsetsDirectional) {
      padX = (padding.start + padding.end) * 2;
      padY = (padding.top + padding.bottom) * 2;
    }
    final EdgeInsetsGeometry optionButtonMargin =
        widget.optionButtonMargin ?? _optionButtonMargin;
    if (optionButtonMargin is EdgeInsets) {
      padX += optionButtonMargin.left + optionButtonMargin.right;
      padY += optionButtonMargin.top + optionButtonMargin.bottom;
    } else if (optionButtonMargin is EdgeInsetsDirectional) {
      padX += optionButtonMargin.start + optionButtonMargin.end;
      padY += optionButtonMargin.top + optionButtonMargin.bottom;
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    updatePaddings();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FlexThemeModeOptionButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.padding != oldWidget.padding ||
        widget.optionButtonMargin != oldWidget.optionButtonMargin) {
      updatePaddings();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color effectiveHoverColor = widget.hoverColor ??
        (theme.brightness == Brightness.light
            ? const Color(0x50BCBCBC)
            : const Color(0x99555555));

    return Semantics(
      label: widget.semanticLabel ?? widget.label ?? 'Theme mode option button',
      selected: widget.selected,
      button: true,
      enabled: true,
      child: Padding(
        padding: widget.optionButtonPadding ??
            const EdgeInsetsDirectional.only(start: 6),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                if (widget.label != null && widget.labelAbove)
                  Text(
                    widget.label!,
                    style: widget.labelStyle ?? theme.textTheme.bodySmall,
                    semanticsLabel: '', // Is set on button instead
                  ),
                Material(
                  elevation: widget.elevation,
                  color: widget.backgroundColor,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.optionButtonBorderRadius),
                    ),
                    side: widget.selected
                        ? widget.selectedBorder ??
                            BorderSide(
                              color: theme.colorScheme.primary,
                              width: 4,
                            )
                        : widget.unselectedBorder ??
                            BorderSide(
                              color: theme.dividerColor,
                            ),
                  ),
                  child: Stack(
                    // alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Padding(
                        padding:
                            widget.optionButtonMargin ?? _optionButtonMargin,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                _SchemeColorBox(
                                  color: widget.flexSchemeColor.primary,
                                  height: widget.height,
                                  width: widget.width,
                                  borderRadius: widget.borderRadius,
                                  padding: widget.padding ?? _padding,
                                ),
                                _SchemeColorBox(
                                  color: widget.flexSchemeColor.secondary,
                                  height: widget.height,
                                  width: widget.width,
                                  borderRadius: widget.borderRadius,
                                  padding: widget.padding ?? _padding,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                _SchemeColorBox(
                                  color:
                                      widget.flexSchemeColor.primaryContainer,
                                  height: widget.height,
                                  width: widget.width,
                                  borderRadius: widget.borderRadius,
                                  padding: widget.padding ?? _padding,
                                ),
                                _SchemeColorBox(
                                  color: widget.flexSchemeColor.tertiary,
                                  height: widget.height,
                                  width: widget.width,
                                  borderRadius: widget.borderRadius,
                                  padding: widget.padding ?? _padding,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          focusNode: _focusNode,
                          hoverColor: effectiveHoverColor,
                          focusColor: widget.focusColor,
                          onTap: () {
                            if (widget.setFocusOnTap ?? false) {
                              _focusNode.requestFocus();
                            }
                            widget.onSelect?.call();
                          },
                          child: SizedBox(
                            width: widget.width * 2 + padX,
                            height: widget.height * 2 + padY,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // ),
                if (widget.label != null && !widget.labelAbove)
                  Text(
                    widget.label!,
                    style: widget.labelStyle ?? theme.textTheme.bodySmall,
                    semanticsLabel: '', // Is set on button instead
                  ),
              ],
            ),
          ],
        ),
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
    required this.color,
    this.height = 24,
    this.width = 24,
    this.borderRadius = 4,
    this.padding = const EdgeInsets.all(3),
  });

  /// The background color used to draw an individual scheme color box.
  ///
  /// Required, cannot be null.
  final Color color;

  /// The height of an individual scheme color box.
  ///
  /// Defaults to 24 dp.
  final double height;

  /// The width of an individual scheme color box.
  ///
  /// Defaults to 24 dp.
  final double width;

  /// The circular borderRadius of an individual scheme color box.
  ///
  /// Defaults to 4 dp.
  final double borderRadius;

  /// Padding around an individual scheme color box.
  ///
  /// Defaults to `const EdgeInsets.all(3)`.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
