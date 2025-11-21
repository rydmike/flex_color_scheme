part of '../flex_sub_themes.dart';

/// An opinionated [ChipThemeData] theme.
ChipThemeData _chipTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Defines if the [baseSchemeColor] and [selectedSchemeColor] are
  /// alpha blended with the surface color.
  ///
  /// If not defined, defaults to false in Material-3 mode and to true
  /// in Material-2 mode.
  ///
  /// When true, the [baseSchemeColor] is alpha blended with the surface
  /// color using [kChipBackgroundAlphaBlend] alpha blend value.
  /// The [selectedSchemeColor] is alpha blended with the surface color
  /// using [kChipSelectedBackgroundAlphaBlend] alpha blend value.
  final bool? blendColors,

  /// Defines which [Theme] based [ColorScheme] based color the Chips
  /// use as their background base color.
  ///
  /// If not defined and [useMaterial3] is true, it defaults
  /// [SchemeColor.surface].
  ///
  /// If not defined and [useMaterial3] is false, it defaults
  /// [SchemeColor.primary] with a surface alpha blend of
  /// [kChipBackgroundAlphaBlend] applied, if [blendColors] is true,
  /// which it defaults to in Material-2 mode.
  final SchemeColor? baseSchemeColor,

  /// Defines which [Theme] based [ColorScheme] based color the selected Chips
  /// use as their selected state color.
  ///
  /// The color scheme contrast pair color is used for text and icons, on the
  /// [selectedSchemeColor].
  ///
  /// If not defined and [useMaterial3] is true, defaults to
  /// [SchemeColor.secondaryContainer].
  ///
  /// If not defined and [useMaterial3] is false, defaults to
  /// [SchemeColor.secondaryContainer] if [blendColors] is false.
  /// If [blendColors] is true, defaults to [SchemeColor.primary] with
  /// a surface alpha blend of [kChipSelectedBackgroundAlphaBlend] applied.
  final SchemeColor? selectedSchemeColor,

  /// Defines which [Theme] based [ColorScheme] based color the selected
  /// ChoiceChips use as their selected state color.
  ///
  /// The color scheme contrast pair color is used for text and icons, on the
  /// [secondarySelectedSchemeColor]
  ///
  /// If not defined and [useMaterial3] is true, defaults to
  /// [selectedSchemeColor].
  final SchemeColor? secondarySelectedSchemeColor,

  /// Defines which [Theme] based [ColorScheme] based color the Chips
  /// use as color of the delete icon.
  ///
  /// The selected color is only used as base for the [Chip] colors, it also
  /// uses alpha blend and opacity to create the effective Chip colors using
  /// the selected scheme color as base.
  ///
  /// If not defined it defaults to effective theme based color from using
  /// [SchemeColor.onSurfaceVariant] same as Material-3 default.
  final SchemeColor? deleteIconSchemeColor,

  /// Overrides the default for [ChipAttributes.labelStyle],
  /// the style of the [DefaultTextStyle] that contains the
  /// chip's label.
  ///
  /// This only has an effect on label widgets that respect the
  /// [DefaultTextStyle], such as [Text].
  ///
  /// This property applies to [ActionChip], [Chip],
  /// [FilterChip], [InputChip], [RawChip].
  ///
  /// If not defined, the font size in the style defaults to 14.
  final TextStyle? labelStyle,

  /// Overrides the default for [ChoiceChip.labelStyle],
  /// the style of the [DefaultTextStyle] that contains the
  /// chip's label.
  ///
  /// This only has an effect on label widgets that respect the
  /// [DefaultTextStyle], such as [Text].
  ///
  /// If not defined, the font size in the style defaults to 14.
  final TextStyle? secondaryLabelStyle,

  /// Font size of the [labelStyle].
  ///
  /// If defined, overrides the default font size used by either the
  /// default font of the default [labelStyle] or the font size of the
  /// passed in [labelStyle].
  ///
  /// If not defined the default text style font sizes are used, but if they
  /// did not have size defined, defaults 14.
  final double? fontSize,

  /// Font size of the [secondaryLabelStyle].
  ///
  /// If defined, overrides the default font size used by either the
  /// default font of the default [secondaryLabelStyle] or the font size of
  /// the passed in [secondaryLabelStyle].
  ///
  /// If not defined, defaults to [fontSize].
  final double? secondaryFontSize,

  /// Icon size used by the [IconTheme] used by [Chip]s.
  ///
  /// If not defined defaults to 18.
  final double? iconSize,

  /// Overrides the default for [ChipAttributes.padding],
  /// the padding between the contents of the chip and the outside [shape].
  ///
  /// This property applies to [ActionChip], [Chip], [ChoiceChip],
  /// [FilterChip], [InputChip], [RawChip].
  ///
  /// If not defined, defaults to EdgeInsets.symmetric(horizontal: 8) in
  /// Material mode and to EdgeInsets.symmetric(horizontal: 4) in
  /// Material2 mode.
  final EdgeInsetsGeometry? padding,

  /// Corner radius of the Chip.
  ///
  /// If not defined, defaults to [kChipRadius] 8dp,
  /// based on M3 Specification
  /// https://m3.material.io/components/chips/specs
  final double? radius,

  /// Overrides the default for [ChipAttributes.surfaceTintColor], the
  /// Color of the chip's surface tint overlay when its elevation is
  /// greater than 0.
  ///
  /// This property applies to [ActionChip], [Chip], [ChoiceChip],
  /// [FilterChip], [InputChip], [RawChip].
  final Color? surfaceTintColor,

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
  // Used to toggle between different defaults from M2 and M3.
  final bool useM3 = useMaterial3 ?? true;
  final bool tintDisable = useTintedDisable ?? false;
  final bool blend = blendColors ?? !useM3;

  // Function used to make a contrast color for blended background, we cannot
  // be sure the blended colors contrast is OK, with its source onPair,
  // so we need to compute one.
  Color blendedContrast(Color color) {
    if (ThemeData.estimateBrightnessForColor(color) == Brightness.light) {
      return Colors.black87;
    } else {
      return Colors.white70;
    }
  }

  // TODO(rydmike): Monitor Chip issue #115364
  // https://github.com/flutter/flutter/issues/115364

  // Get fallback color, defaults to surface for M3 and to primary for M2.
  final SchemeColor fallbackSchemeColor = baseSchemeColor == null && blend
      ? SchemeColor.primary
      : useM3
          ? SchemeColor.surface
          : SchemeColor.primaryContainer;
  Color backgroundColor = FlexSubThemes.schemeColor(
    baseSchemeColor ?? fallbackSchemeColor,
    colorScheme,
  );
  // Selected color
  final SchemeColor fallbackSelected = useM3
      ? SchemeColor.secondaryContainer
      : blend
          ? SchemeColor.primary
          : SchemeColor.secondaryContainer;
  Color selectedColor = FlexSubThemes.schemeColor(
    selectedSchemeColor ?? fallbackSelected,
    colorScheme,
  );

  // Secondary selected color
  final SchemeColor fallbackSecondarySelected =
      selectedSchemeColor ?? fallbackSelected;
  Color secondarySelectedColor = FlexSubThemes.schemeColor(
    secondarySelectedSchemeColor ?? fallbackSecondarySelected,
    colorScheme,
  );

  // Do all the blending of colors if blend is true.
  if (blend) {
    if (selectedSchemeColor == null) {
      selectedColor = backgroundColor.blendAlpha(
        colorScheme.surface,
        kChipSelectedBackgroundAlphaBlend,
      );
    } else {
      selectedColor = selectedColor.blendAlpha(
        colorScheme.surface,
        kChipSelectedBackgroundAlphaBlend,
      );
    }
    if (secondarySelectedSchemeColor == null) {
      secondarySelectedColor = backgroundColor.blendAlpha(
        colorScheme.surface,
        kChipSelectedBackgroundAlphaBlend,
      );
    } else {
      secondarySelectedColor = secondarySelectedColor.blendAlpha(
        colorScheme.surface,
        kChipSelectedBackgroundAlphaBlend,
      );
    }
    backgroundColor = backgroundColor.blendAlpha(
      colorScheme.surface,
      kChipBackgroundAlphaBlend,
    );
  }

  // Set the onColors
  Color onBackgroundColor = FlexSubThemes.schemeColorPair(
    baseSchemeColor ?? fallbackSchemeColor,
    colorScheme,
    useOnSurfaceVariant: true,
  );
  Color onSelectedColor = FlexSubThemes.schemeColorPair(
    selectedSchemeColor ?? fallbackSelected,
    colorScheme,
    useOnSurfaceVariant: true,
  );
  Color onSecondarySelectedColor = FlexSubThemes.schemeColorPair(
    secondarySelectedSchemeColor ?? fallbackSecondarySelected,
    colorScheme,
  );
  if (blend) {
    onBackgroundColor = blendedContrast(backgroundColor);
    onSelectedColor = blendedContrast(selectedColor);
    onSecondarySelectedColor = blendedContrast(secondarySelectedColor);
  }

  // The deleted icon color
  final Color deleteIconColor = FlexSubThemes.schemeColor(
    deleteIconSchemeColor ?? SchemeColor.onSurfaceVariant,
    colorScheme,
  );

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color tint = selectedColor;

  // Icon color.
  Color iconColor = onBackgroundColor;
  if (iconColor != colorScheme.onSurfaceVariant) {
    iconColor = blendedContrast(backgroundColor);
  }
  //
  // Text color, uses the onBackground.
  final TextStyle baseLabelStyle = (labelStyle ?? const TextStyle()).copyWith(
    color: onBackgroundColor,
    fontSize: fontSize ?? labelStyle?.fontSize ?? 14,
    // These two needed to match size of default M3.
    letterSpacing: labelStyle?.letterSpacing ?? 0.1,
    height: labelStyle?.height ?? 1.43,
  );

  // TODO(rydmike): We need widget state to use this! Not supported. Issue?
  // Text color, uses the selected foreground color for selected chip styles.
  // final TextStyle effectiveSelectedLabelStyle =
  //     baseLabelStyle.copyWith(color: onSelectedColor);

  // Text color, uses the foreground color for all chip styles.
  final TextStyle effectiveSecondarySelectedLabelStyle =
      (secondaryLabelStyle ?? labelStyle ?? const TextStyle()).copyWith(
    color: onSecondarySelectedColor,
    fontSize: secondaryFontSize ??
        fontSize ??
        secondaryLabelStyle?.fontSize ??
        labelStyle?.fontSize ??
        14,
    // These two needed to match size of default M3.
    letterSpacing:
        secondaryLabelStyle?.letterSpacing ?? labelStyle?.letterSpacing ?? 0.1,
    height: secondaryLabelStyle?.height ?? labelStyle?.height ?? 1.43,
  );

  // TODO(rydmike): M3 is 34dp high, should only be 32dp. Report issue?

  return ChipThemeData(
    // TODO(rydmike): This works, but it overrides secondarySelectedColor.
    //  Raise issue! We cannot use due to that, but it would be nice
    //  if we could for creating a better disabled color.
    //
    // color: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
    //   if (states.contains(WidgetState.selected) &&
    //       states.contains(WidgetState.disabled)) {
    //     return !tintDisable && useM3
    //         ? null
    //         : tintDisable
    //             ? FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
    //                 .withAlpha(kAlphaVeryLowDisabled)
    //             : colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
    //   }
    //   if (states.contains(WidgetState.disabled)) {
    //     return !tintDisable && useM3
    //         ? null
    //         : tintDisable
    //             ? FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
    //                 .withAlpha(kAlphaVeryLowDisabled)
    //             : colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled);
    //   }
    //   if (states.contains(WidgetState.selected)) {
    //     return selectedSchemeColor == null && !blend
    //         ? useM3
    //             ? null
    //             : selectedColor
    //         : selectedColor;
    //   }
    //   return backgroundColor;
    // }),

    // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
    // [InputChip], [RawChip], but NOT to ANY selected or disabled Chip.
    backgroundColor: backgroundColor,

    // Applies to [Chip], [InputChip], [RawChip].
    deleteIconColor: deleteIconSchemeColor == null ? null : deleteIconColor,
    // Applies to [ChoiceChip], [FilterChip], [InputChip], [RawChip].
    // Same formula as on FCS Elevated button and ToggleButtons.
    disabledColor: !tintDisable &&
            useM3 &&
            onBackgroundColor == colorScheme.onSurfaceVariant
        ? null
        : onBackgroundColor == colorScheme.onSurfaceVariant
            ? tintDisable
                ? FlexSubThemes.tintedDisable(
                    colorScheme.onSurface,
                    tint,
                  ).withValues(alpha: kAlphaLowDisabledFloat)
                : colorScheme.onSurface.withValues(
                    alpha: kAlphaLowDisabledFloat,
                  )
            : tintDisable
                ? FlexSubThemes.tintedDisable(
                    backgroundColor,
                    tint,
                  ).withValues(alpha: kAlphaLowDisabledFloat)
                : backgroundColor.withValues(alpha: kAlphaLowDisabledFloat),
    // Applies to [ChoiceChip], [FilterChip], [InputChip], [RawChip].
    selectedColor: selectedSchemeColor == null && !blend
        ? useM3
            ? null
            : selectedColor
        : selectedColor,

    // Applies to [ChoiceChip.selectedColor], if set it overrides the
    // [selectedColor], for ChoiceChips.
    secondarySelectedColor: secondarySelectedSchemeColor == null && !blend
        ? null
        : secondarySelectedColor,
    // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
    // [InputChip] and [RawChip].
    surfaceTintColor: surfaceTintColor,
    // Applies to [FilterChip], [InputChip], [RawChip].
    checkmarkColor: onSelectedColor,
    // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
    // [InputChip] and [RawChip].
    padding: useM3 ? padding : padding ?? const EdgeInsets.all(4),
    // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
    // [InputChip] and [RawChip].
    shape: useM3 && radius == null
        ? null
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kChipRadius),
            ),
          ),

    // Applies to [ActionChip], [Chip], [FilterChip], [InputChip], [RawChip].
    // If it needs different color fr selected and unselected state it cannot
    // be themed correctly.
    labelStyle: baseLabelStyle,

    // TODO(rydmike): We need widget state to use this! Not supported. Issue?
    // To always get correct color for selected state text, we would need to
    // use WidgetStateTextStyle, but it is not supported. Docs says it should
    // be, but it does not work. Issue?
    //
    //labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    //   if (states.contains(WidgetState.disabled)) {
    //     return baseLabelStyle.copyWith(
    //         color: colorScheme.onSurface.withValues(alpha: 0.38));
    //   }
    //   if (states.contains(WidgetState.selected)) {
    //     return baseLabelStyle.copyWith(color: onSelectedColor);
    //   }
    //   return baseLabelStyle;
    // }),

    // Applies to [ChoiceChip.labelStyle],
    secondaryLabelStyle: effectiveSecondarySelectedLabelStyle,

    // Applies to [ActionChip], [Chip], [ChoiceChip], [FilterChip],
    // [InputChip] and [RawChip].
    iconTheme: IconThemeData(size: iconSize ?? 18, color: iconColor),
  );
}
