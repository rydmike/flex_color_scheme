part of '../flex_sub_themes.dart';

/// An opinionated [SegmentedButtonThemeData] theme for the [SegmentedButton].
SegmentedButtonThemeData _segmentedButtonTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as background
  /// color for the selected button.
  ///
  /// Defines the background color for selected button, and
  /// it's onColor pair defines the foreground for selected button.
  ///
  /// If not defined, secondaryContainer will be used.
  final SchemeColor? selectedSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the
  /// foreground color for the selected [SegmentedButton].
  ///
  /// If not defined, contrast color pair to [selectedSchemeColor]
  /// will be used.
  final SchemeColor? selectedForegroundSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the
  /// background color for unselected segmented button.
  ///
  /// If not defined, transparent will be used.
  final SchemeColor? unselectedSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the
  /// foreground color for unselected segmented button.
  ///
  /// If not defined, contrast color pair to [unselectedSchemeColor]
  /// will be used, for transparent it is onSurface.
  final SchemeColor? unselectedForegroundSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the border
  /// color for the toggle buttons.
  ///
  /// If not defined, [ColorScheme.outline] will be the effective result.
  final SchemeColor? borderSchemeColor,

  /// The button corner radius.
  ///
  /// If not defined, defaults to defaults to Stadium border.
  final double? radius,

  /// The width of the borders around the segmented button.
  ///
  /// If null, defaults to [kThinBorderWidth] = 1.0.
  final double? borderWidth,

  /// Padding for the individual segment buttons.
  ///
  /// Defaults to null and uses M3's default scaled padding function.
  final EdgeInsetsGeometry? padding,

  /// Minimum button size.
  ///
  /// If null, defaults to [kButtonMinSize] (`const Size(40.0, 40.0)`) when
  /// [useMaterial3] is false and to `const Size(64.0, 40.0)` when
  /// [useMaterial3] is true, via M3 built in defaults.
  final Size? minButtonSize,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedInteraction,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? useTintedDisable,

  /// Creates the [InkWell] splash factory, which defines the appearance of
  /// "ink" splashes that occur in response to taps.
  ///
  /// In M2 mode FlexColorScheme passes in the effective splashFactory
  /// from splashFactory override value or the result from
  /// [FlexSubThemesData] adaptive splash settings. In M3 mode it is kept
  /// null and the default comes via ThemeData.splashFactory, that is has
  /// also defined.
  final InteractiveInkFeatureFactory? splashFactory,

  /// The style for the segmented button's [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [selectedSchemeColor] and [unselectedForegroundSchemeColor] are
  /// used instead.
  final WidgetStateProperty<TextStyle?>? textStyle,

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
  // We are using a light colorScheme.
  final bool isLight = colorScheme.brightness == Brightness.light;

  // Get selected background color, defaults to secondaryContainer.
  final SchemeColor selectedScheme = selectedSchemeColor ??
      (useM3 ? SchemeColor.secondaryContainer : SchemeColor.primary);
  final Color selectedColor =
      FlexSubThemes.schemeColor(selectedScheme, colorScheme);

  final Color onSelectedColor = selectedForegroundSchemeColor != null
      ? FlexSubThemes.schemeColor(selectedForegroundSchemeColor, colorScheme)
      : FlexSubThemes.schemeColorPair(selectedScheme, colorScheme);

  final Color unselectedColor = FlexSubThemes.schemeColor(
    unselectedSchemeColor ?? SchemeColor.surface,
    colorScheme,
  );
  final Color onUnselectedColor = FlexSubThemes.schemeColor(
    unselectedForegroundSchemeColor ??
        FlexSubThemes.onSchemeColor(
            unselectedSchemeColor ?? SchemeColor.surface),
    colorScheme,
  );

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = onSelectedColor;
  final Color tint = selectedColor;
  // Get brightness of selectedColor color.
  final bool selectedBgIsLight =
      ThemeData.estimateBrightnessForColor(selectedColor) == Brightness.light;
  // We use surface mode tint factor, if it is light theme and selectedColor
  // is light OR if it is a dark theme and background is dark.
  final bool selectedSurfaceMode =
      (isLight && selectedBgIsLight) || (!isLight && !selectedBgIsLight);
  final double factor = FlexSubThemes._tintAlphaFactor(
    tint,
    colorScheme.brightness,
    selectedSurfaceMode,
  );

  final Color unOverlay = unselectedColor;
  final Color unTint = unselectedSchemeColor == null ||
          unselectedSchemeColor == SchemeColor.surface
      ? selectedColor
      : onUnselectedColor;
  // Get brightness of unselectedColor color.
  final bool unSelectedBgIsLight =
      ThemeData.estimateBrightnessForColor(unselectedColor) == Brightness.light;
  // We use surface mode tint factor, if it is light theme and unselectedColor
  // is light OR if it is a dark theme and background is dark.
  final bool unSelectedSurfaceMode =
      (isLight && unSelectedBgIsLight) || (!isLight && !unSelectedBgIsLight);
  final double unFactor = FlexSubThemes._tintAlphaFactor(
    unTint,
    colorScheme.brightness,
    unSelectedSurfaceMode,
  );

  final Color disableTint = unselectedSchemeColor == null ||
          unselectedSchemeColor == SchemeColor.surface
      ? selectedColor
      : onUnselectedColor;

  final Color borderColor = FlexSubThemes.schemeColor(
    borderSchemeColor ?? (useM3 ? SchemeColor.outline : SchemeColor.primary),
    colorScheme,
  );
  // Effective border width.
  final double effectiveWidth = borderWidth ?? kThinBorderWidth;

  final Color disableBorderTint = (borderSchemeColor == null && useM3) ||
          unselectedSchemeColor == SchemeColor.outline
      ? selectedColor
      : borderColor;

  final Color disabledForeground =
      unselectedSchemeColor == null ? colorScheme.onSurface : onUnselectedColor;

  final WidgetStateProperty<Color> foregroundColor =
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      if (tintDisable) {
        return FlexSubThemes.tintedDisable(disabledForeground, disableTint);
      }
      return disabledForeground.withAlpha(kAlphaDisabled);
    }
    if (states.contains(WidgetState.selected)) {
      if (states.contains(WidgetState.pressed)) {
        return onSelectedColor;
      }
      if (states.contains(WidgetState.hovered)) {
        return onSelectedColor;
      }
      if (states.contains(WidgetState.focused)) {
        return onSelectedColor;
      }
      return onSelectedColor;
    } else {
      return onUnselectedColor;
    }
  });

  return SegmentedButtonThemeData(
    style: ButtonStyle(
      textStyle: textStyle,
      splashFactory: splashFactory,
      // TODO(rydmike): Issue, minimumSize property does nothing.
      // https://github.com/flutter/flutter/issues/121493
      minimumSize: ButtonStyleButton.allOrNull<Size>(
        minButtonSize ?? (useM3 ? null : kButtonMinSize),
      ),
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      backgroundColor: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return unselectedSchemeColor == null ? null : unselectedColor;
        }
        if (states.contains(WidgetState.selected)) {
          return selectedColor;
        }
        return unselectedSchemeColor == null ? null : unselectedColor;
      }),
      foregroundColor: foregroundColor,
      iconColor: foregroundColor,
      // TODO(Rydmike): Issue: Flutter SDK SegmentedButton overlayColor bug.
      // https://github.com/flutter/flutter/issues/123308
      // SegmentedButton triggers overlay 3 times in Selected mode, 1st
      // time it is selected, next time it is no longer selected,
      // even it if actually is. This results is that we never see the
      // selected overlay state. It is also triggered 3 times when not
      // selected, but there we get the unselected mode all times, so
      // it is not noticed, still one call would be enough.
      overlayColor: WidgetStateProperty.resolveWith((
        Set<WidgetState> states,
      ) {
        // This nicer overlay for selected overlay never gets seen due
        // to above mentioned Flutter SDK bug. But if it is ever fixed it
        // will get used automatically, via code below.
        if (states.contains(WidgetState.selected)) {
          if (states.contains(WidgetState.hovered)) {
            if (tintInteract) {
              return FlexSubThemes.tintedHovered(overlay, tint, factor);
            }
            return unselectedColor.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) {
              return FlexSubThemes.tintedFocused(overlay, tint, factor);
            }
            return unselectedColor.withAlpha(kAlphaFocused);
          }
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) {
              return FlexSubThemes.tintedPressed(overlay, tint, factor);
            }
            return unselectedColor.withAlpha(kAlphaPressed);
          }
        } else {
          if (states.contains(WidgetState.hovered)) {
            if (tintInteract) {
              return FlexSubThemes.tintedHovered(unOverlay, unTint, unFactor);
            }
            return unselectedSchemeColor == null
                ? colorScheme.onSurface.withAlpha(kAlphaHovered)
                : onUnselectedColor.withAlpha(kAlphaHovered);
          }
          if (states.contains(WidgetState.focused)) {
            if (tintInteract) {
              return FlexSubThemes.tintedFocused(unOverlay, unTint, unFactor);
            }
            return unselectedSchemeColor == null
                ? colorScheme.onSurface.withAlpha(kAlphaFocused)
                : onUnselectedColor.withAlpha(kAlphaFocused);
          }
          if (states.contains(WidgetState.pressed)) {
            if (tintInteract) {
              return FlexSubThemes.tintedPressed(unOverlay, unTint, unFactor);
            }
            return unselectedSchemeColor == null
                ? colorScheme.onSurface.withAlpha(kAlphaPressed)
                : onUnselectedColor.withAlpha(kAlphaPressed);
          }
        }
        return null;
      }),
      side: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          if (tintDisable) {
            return BorderSide(
              color: FlexSubThemes.tintedDisable(
                colorScheme.onSurface,
                disableBorderTint,
              ).withAlpha(kAlphaLowDisabled),
              width: effectiveWidth,
            );
          }
          return BorderSide(
            color: colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
            width: effectiveWidth,
          );
        }
        return BorderSide(color: borderColor, width: effectiveWidth);
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
