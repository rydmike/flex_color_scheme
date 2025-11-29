part of '../flex_sub_themes.dart';

/// An opinionated [MenuButtonThemeData] theme.
///
/// Provides complex styling for themed [SubmenuButton]s and [MenuItemButton]s
/// with [SchemeColor] selections. Border radius on the indicator, highlighted
/// menu item.
///
/// If highlight colors are not defined, the highlighted item uses default
/// [WidgetState] property response os overlay for highlighted item.
/// These states can optionally also use FlexColorScheme tinted style.
/// Disabled items can also to use the optional FCS tinted style.
MenuButtonThemeData _menuButtonTheme({
  // Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Provide info on which color from the passed in [colorScheme] parameter
  /// that is used as background color of menu containers defined by
  /// [FlexSubThemes.menuTheme] and [FlexSubThemes.menuBarTheme]. The menu
  /// container is used by [MenuAnchor], [DropDownMenu] and menus on
  /// [MenuBar].
  ///
  /// If not defined, defaults to [colorScheme.surfaceContainer].
  final SchemeColor? menuBackgroundSchemeColor,

  /// Select which color from the passed in [colorScheme] parameter to use as
  /// the [SubmenuButton]s and [MenuItemButton]s background color for
  /// unselected, i.e. not highlighted via hover, focus or pressed state.
  ///
  /// If not defined, defaults to [menuBackgroundSchemeColor].
  final SchemeColor? backgroundSchemeColor,

  /// Select which color from the passed in [colorScheme] parameter to use as
  /// the [SubmenuButton]s and [MenuItemButton]s foreground color.
  ///
  /// If not defined, defaults to the contrast pair for
  /// [backgroundSchemeColor].
  final SchemeColor? foregroundSchemeColor,

  /// Select which color from the passed in [colorScheme] parameter to use as
  /// the highlighted [SubmenuButton]s and [MenuItemButton]s indicator
  /// background color.
  ///
  /// If not defined, defaults to [backgroundSchemeColor] and the indicator
  /// only get overlay color hover, focus and press states.
  final SchemeColor? indicatorBackgroundSchemeColor,

  /// Select which color from the passed in [colorScheme] parameter to use as
  /// the highlighted [SubmenuButton]s and [MenuItemButton]s indicator
  /// foreground color.
  ///
  /// If not defined, defaults to the contrast pair for
  /// [indicatorBackgroundSchemeColor], without its overlay color.
  /// If [indicatorBackgroundSchemeColor] is not defined the result of
  /// this is same color as [foregroundSchemeColor].
  final SchemeColor? indicatorForegroundSchemeColor,

  /// The MenuButton corner border radius.
  ///
  /// If not defined, defaults to 0 via Widget's default behavior.
  final double? radius,

  /// The style for a menu button's [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundSchemeColor] is used instead.
  final WidgetStateProperty<TextStyle?>? textStyle,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedInteraction,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedDisable,
}) {
  final bool tintInteract = useTintedInteraction ?? false;
  final bool tintDisable = useTintedDisable ?? false;

  // Get foreground color used on not active menu item, by default
  // contrast to menu background color, which defaults to surface.
  // FCS passes in the generally defined menu background, if it has been
  // defined, to ensure buttons are based on their background color.
  // The buttons can have another un-highlighted background color than the
  // menu container, but it is probably not a very useful design.
  final SchemeColor menuBgScheme =
      menuBackgroundSchemeColor ?? SchemeColor.surfaceContainer;
  final SchemeColor bgScheme = backgroundSchemeColor ?? menuBgScheme;
  final Color backgroundColor =
      FlexSubThemes.schemeColor(bgScheme, colorScheme);
  final SchemeColor fgScheme =
      foregroundSchemeColor ?? FlexSubThemes.onSchemeColor(bgScheme);
  final Color foregroundColor =
      FlexSubThemes.schemeColor(fgScheme, colorScheme);

  // Get background color of highlighted menu item.
  final SchemeColor indBgScheme = indicatorBackgroundSchemeColor ?? bgScheme;
  final Color indicatorBgColor =
      FlexSubThemes.schemeColor(indBgScheme, colorScheme);
  final SchemeColor indFgScheme = indicatorForegroundSchemeColor ??
      FlexSubThemes.onSchemeColor(indBgScheme);
  final Color indicatorFgColor =
      FlexSubThemes.schemeColor(indFgScheme, colorScheme);

  final bool transparentBackground =
      backgroundSchemeColor == null || menuBgScheme == bgScheme;

  // If foreground is plain contrast to a standard surface, we cannot use it
  // for tint, in that case we will use primary color for tint.
  final bool fgIsPlain = fgScheme == SchemeColor.onSurface ||
      fgScheme == SchemeColor.onSurfaceVariant;
  final bool indFgIsPlain = indFgScheme == SchemeColor.onSurface ||
      indFgScheme == SchemeColor.onSurfaceVariant;
  // We are using a light colorScheme.
  final bool isLight = colorScheme.brightness == Brightness.light;
  // Get brightness of background color.
  final bool bgIsLight =
      ThemeData.estimateBrightnessForColor(indicatorBgColor) ==
          Brightness.light;
  // We use surface mode tint factor, if it is light theme and background
  // is light OR if it is a dark theme and background is dark.
  final bool surfaceMode = (isLight && bgIsLight) || (!isLight && !bgIsLight);
  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = indicatorBgColor;
  final Color tint = indFgIsPlain ? colorScheme.primary : indicatorFgColor;
  final Color disabledTint = fgIsPlain ? colorScheme.primary : foregroundColor;
  // Custom factor for menu buttons.
  final double factor = surfaceMode ? 1 : 2;

  return MenuButtonThemeData(
    style: ButtonStyle(
      textStyle: textStyle,
      // MenuButtons text and background changes should not animate.
      // If they do we get this issue:
      // https://github.com/flutter/flutter/issues/123615
      // We do not want that. This Duration fixes the issue.
      animationDuration: Duration.zero,
      // Foreground color, use same for icon.
      foregroundColor: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(foregroundColor, disabledTint);
          }
          return foregroundColor.withAlpha(kAlphaDisabled);
        }
        if (states.contains(WidgetState.pressed)) {
          return indicatorFgColor;
        }
        if (states.contains(WidgetState.hovered)) {
          return indicatorFgColor;
        }
        if (states.contains(WidgetState.focused)) {
          return indicatorFgColor;
        }
        return foregroundColor;
      }),
      // icon foreground color.
      iconColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return FlexSubThemes.tintedDisable(foregroundColor, disabledTint);
          }
          return foregroundColor.withAlpha(kAlphaDisabled);
        }
        if (states.contains(WidgetState.pressed)) {
          return indicatorFgColor;
        }
        if (states.contains(WidgetState.hovered)) {
          return indicatorFgColor;
        }
        if (states.contains(WidgetState.focused)) {
          return indicatorFgColor;
        }
        return foregroundColor;
      }),
      backgroundColor: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (indicatorBackgroundSchemeColor != null) {
          if (states.contains(WidgetState.pressed)) {
            return indicatorBgColor;
          }
          if (states.contains(WidgetState.hovered)) {
            return indicatorBgColor;
          }
          if (states.contains(WidgetState.focused)) {
            return indicatorBgColor;
          }
        }
        return transparentBackground ? Colors.transparent : backgroundColor;
      }),
      overlayColor: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.pressed)) {
          if (tintInteract) {
            return FlexSubThemes.tintedPressed(overlay, tint, factor);
          }
          return foregroundColor.withAlpha(kAlphaPressed);
        }
        if (states.contains(WidgetState.selected)) {
          if (tintInteract) {
            return FlexSubThemes.tintedSplash(overlay, tint, factor);
          }
          return foregroundColor.withAlpha(kAlphaSplash);
        }
        if (states.contains(WidgetState.focused)) {
          if (indicatorBackgroundSchemeColor != null) {
            return Colors.transparent;
          }
          if (tintInteract) {
            return FlexSubThemes.tintedFocused(overlay, tint, factor);
          }
          return foregroundColor.withAlpha(kAlphaFocused);
        }
        if (states.contains(WidgetState.hovered)) {
          if (indicatorBackgroundSchemeColor != null) {
            return Colors.transparent;
          }
          if (tintInteract) {
            return FlexSubThemes.tintedHovered(overlay, tint, factor);
          }
          return foregroundColor.withAlpha(kAlphaFocused);
        }
        return Colors.transparent;
      }),
      shape: radius == null
          ? null
          : ButtonStyleButton.allOrNull<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
            ),
    ),
  );
}
