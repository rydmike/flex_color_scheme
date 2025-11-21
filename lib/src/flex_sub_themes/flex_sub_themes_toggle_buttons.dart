part of '../flex_sub_themes.dart';

/// An opinionated [ToggleButtonsThemeData] theme.
///
/// The adjustable button corner [radius] defaults to 20 this is new
/// default in M3, Flutter SDK M2 defaults to 4.
///
/// Button border width can be adjusted and defaults to same width
/// as outline thickness on selected outline button and input decorator.
///
/// Unfortunately [ToggleButtons] cannot be themed to have different border
/// width in disabled mode than enabled mode, like [OutlinedButton] can.
/// If it is important that the themed border appears similar to the disabled
/// border width, then keep the thin and thick outlined borders same or
/// reasonably close to each other.
ToggleButtonsThemeData _toggleButtonsTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the main
  /// base color for the [ToggleButtons].
  ///
  /// Always defines the background color for selected button, and
  /// it's onColor pair defines the foreground for selected button.
  ///
  /// If [unselectedSchemeColor] is not defined, [baseSchemeColor] is also
  /// used as foreground color for unselected buttons.
  ///
  /// If [borderSchemeColor] is not defined, then in M2 it is also used as
  /// color base for the border color, in M3 and undefined borderSchemeColor
  /// results in [ColorScheme.outline] color being used.
  ///
  /// If not defined, primary will be used.
  final SchemeColor? baseSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the
  /// foreground color for the selected [ToggleButtons].
  ///
  /// If not defined, contrast color pair to [baseSchemeColor] will be used,
  /// which for its default value is onPrimary.
  final SchemeColor? selectedForegroundSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the
  /// foreground color for unselected [ToggleButtons].
  ///
  /// If not defined, [baseSchemeColor] will be used as base.
  final SchemeColor? unselectedSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the border
  /// color for the toggle buttons.
  ///
  /// If not defined, [baseSchemeColor] will be used as base in M2, in M3
  /// [ColorScheme.outline] will be the effective result.
  final SchemeColor? borderSchemeColor,

  /// The button corner radius.
  ///
  /// If not defined, defaults to [kButtonRadius] 40dp.
  ///
  /// This is not in M3 specification, but FlexColorScheme component
  /// sub-themes harmonizes [ToggleButtons] size
  /// and border radius with the other Material buttons.
  final double? radius,

  /// The width of the borders around the toggle buttons.
  ///
  /// In this design it uses the same default as outline thickness for
  /// selected outline button and input decorator.
  ///
  /// If null, defaults to [kThinBorderWidth] = 1.0, when
  /// [useMaterial3] is false, and to 1 when [useMaterial3] is true.
  final double? borderWidth,

  /// Minimum button size.
  ///
  /// If undefined, defaults to [kButtonMinSize] = Size(40, 40).
  final Size? minButtonSize,

  /// The default text style for [ToggleButtons.children].
  ///
  /// [TextStyle.color] will be ignored and substituted by [color],
  /// [selectedColor] or [disabledColor] depending on whether the buttons
  /// are active, selected, or disabled.
  final TextStyle? textStyle,

  /// VisualDensity for ToggleButtons.
  ///
  /// The ToggleButtons do not implement VisualDensity from theme, but we can
  /// pass in what we use in ThemeData and adjust its size accordingly.
  ///
  /// You should pass in the same visual density that you set on your
  /// Theme to the ToggleButtons to make them keep the same size as the
  /// main buttons.
  ///
  /// Defaults to null, that results in VisualDensity.adaptivePlatformDensity
  /// being used, which is same as null default in ThemeData.
  final VisualDensity? visualDensity,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedInteraction,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedDisable,

  /// A temporary flag used to disable Material-3 design and use legacy
  /// Material-2 design instead. Material-3 design is the default.
  /// Material-2 will be deprecated in Flutter.
  ///
  /// If set to true, the theme will use Material3 default styles when
  /// properties are undefined, if false defaults will use FlexColorScheme's
  /// own opinionated default values.
  ///
  /// The M2/M3 defaults will only be used for properties that are not
  /// defined, if defined they keep their defined values.
  ///
  /// If undefined, defaults to true.
  final bool? useMaterial3,
}) {
  final bool useM3 = useMaterial3 ?? true;
  final bool tintInteract = useTintedInteraction ?? false;
  final bool tintDisable = useTintedDisable ?? false;
  // Get selected color, defaults to primary.
  final SchemeColor selectedBackgroundSchemeColor =
      baseSchemeColor ?? SchemeColor.primary;
  final Color selectedBackground = FlexSubThemes.schemeColor(
    selectedBackgroundSchemeColor,
    colorScheme,
  );
  final Color unselectedForeground = FlexSubThemes.schemeColor(
    unselectedSchemeColor ?? selectedBackgroundSchemeColor,
    colorScheme,
  );
  final Color selectedForeground = selectedForegroundSchemeColor != null
      ? FlexSubThemes.schemeColor(selectedForegroundSchemeColor, colorScheme)
      : FlexSubThemes.schemeColorPair(
          selectedBackgroundSchemeColor, colorScheme);
  final SchemeColor borderDefault =
      useM3 ? SchemeColor.outline : selectedBackgroundSchemeColor;
  final Color borderColor = FlexSubThemes.schemeColor(
    borderSchemeColor ?? borderDefault,
    colorScheme,
  );

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = colorScheme.surface;
  final Color tint = selectedBackground;
  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness);

  // Effective minimum button size.
  final Size effectiveMinButtonSize = minButtonSize ?? kButtonMinSize;
  // Effective border width.
  final double effectiveWidth = borderWidth ?? kThinBorderWidth;
  // Effective visual density.
  final VisualDensity usedVisualDensity =
      visualDensity ?? VisualDensity.adaptivePlatformDensity;
  return ToggleButtonsThemeData(
    textStyle: textStyle,
    borderWidth: effectiveWidth,
    color: unselectedForeground,
    selectedColor: selectedForeground,
    fillColor: selectedBackground,
    borderColor: borderColor,
    selectedBorderColor: borderColor,
    hoverColor: tintInteract
        ? FlexSubThemes.tintedHovered(overlay, tint, factor)
        : selectedBackground.withAlpha(kAlphaHovered),
    focusColor: tintInteract
        ? FlexSubThemes.tintedFocused(overlay, tint, factor)
        : selectedBackground.withAlpha(kAlphaFocused),
    highlightColor: tintInteract
        ? FlexSubThemes.tintedHighlight(overlay, tint, factor)
        : selectedBackground.withAlpha(kAlphaHighlight),
    splashColor: tintInteract
        ? FlexSubThemes.tintedSplash(overlay, tint, factor)
        : selectedBackground.withAlpha(kAlphaSplash),
    disabledColor: tintDisable
        ? FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            tint,
          ).withAlpha(kAlphaLowDisabled)
        : colorScheme.onSurface.withAlpha(kAlphaDisabled),
    disabledBorderColor: tintDisable
        ? FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            borderColor,
          ).withAlpha(kAlphaLowDisabled)
        : colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
    borderRadius: BorderRadius.circular(radius ?? kButtonRadius),
    constraints: BoxConstraints(
      // ToggleButtons draws its border outside its constraints, the
      // ShapeBorder on ElevatedButton, OutlinedButton and TextButton keep
      // their border inside its size constraints, to make ToggleButtons
      // same sized, we must adjust the min size shared constraint with
      // the border width for every side as well as make the VisualDensity
      // adjustment that the other buttons do via Theme automatically
      // based on theme setting, to do so this theme can accept a
      // VisualDensity property. Give it the same value that your theme
      // uses. This defaults to same value that ThemeData uses by default.
      minWidth: effectiveMinButtonSize.width -
          effectiveWidth * 2 +
          usedVisualDensity.baseSizeAdjustment.dx,
      minHeight: effectiveMinButtonSize.height -
          effectiveWidth * 2 +
          usedVisualDensity.baseSizeAdjustment.dy,
    ),
  );
}
