part of '../flex_sub_themes.dart';

/// An opinionated [InputDecorationThemeData], with optional fill color and
/// adjustable corner radius.
///
/// Requires a [ColorScheme] in [colorScheme]. The color
/// scheme would typically be equal the color scheme also used to define the
/// color scheme for your app theme.
///
/// Comes with many parameters to adjust the style of the input decorator.
/// For example the the corner [radius] can be adjusted. In Material 2 mode
/// it defaults to [kInputDecoratorRadius] which is 16, in Material 3 mode it
/// defaults to [kInputDecoratorM3Radius] which is 4, following the Material
/// 3 design specification.
InputDecorationThemeData _inputDecorationTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Optional provided effective TextTheme to use as base for the
  /// input decorations.
  ///
  /// A default one is used if not provided.
  final TextTheme? textTheme,

  /// Selects which color from the passed in colorScheme to use for the border
  /// and fill color of the input decorator.
  ///
  /// If not defined, in M3 mode border color defaults to primary and fill
  /// color to surfaceContainerHighest. In M2 mode border and fill color both
  /// default to primary.
  ///
  /// The border [borderSchemeColor] can be used to define the
  /// border color separately. It defaults to this color, if
  /// [borderSchemeColor] is not defined, and this color is.
  final SchemeColor? baseSchemeColor,

  /// The decorated input fields corner border radius.
  ///
  /// If not defined, in Material-2 mode defaults to [kInputDecoratorRadius]
  /// which is 16, in Material-3 mode it defaults to
  /// [kInputDecoratorM3Radius] which is 4, following the Material
  /// 3 design specification.
  final double? radius,

  /// Selects input border type.
  ///
  /// If undefined, defaults to [FlexInputBorderType.underline].
  ///
  /// THe underline style is default in Flutter too.
  final FlexInputBorderType? borderType,

  /// The padding for the input decoration's container.
  ///
  /// The decoration's container is the area which is filled if
  /// [InputDecoration.filled] is true and bordered per the [border].
  /// It's the area adjacent to [InputDecoration.icon] and above the
  /// [InputDecoration.icon] and above the widgets that contain
  /// [InputDecoration.helperText], [InputDecoration.errorText], and
  /// [InputDecoration.counterText].
  ///
  /// By default the [contentPadding] reflects [isDense] and the type of the
  /// [border]. If [isCollapsed] is true then [contentPadding] is
  /// [EdgeInsets.zero].
  ///
  /// When [isDense] is true, the content padding can be made smaller and
  /// tighter than when it is false.
  ///
  /// If no [contentPadding] is given, Flutter SDK uses default padding values
  /// that depends on if [isDense] is true or false and if we use outline or
  /// underline border.
  final EdgeInsetsGeometry? contentPadding,

  /// Whether the input decorator's child is part of a dense form (i.e., uses
  /// less vertical space).
  ///
  /// Defaults to false.
  final bool? isDense,

  /// If true the decoration's container is filled with [fillColor].
  ///
  /// Typically this field set to true if [border] is an
  /// [UnderlineInputBorder].
  ///
  /// The decoration's container is the area, defined by the border's
  /// [InputBorder.getOuterPath], which is filled if [filled] is
  /// true and bordered per the [border].
  ///
  /// Defaults to false, like Flutter SDK does. Filled is nicer, try it.
  final bool? filled,

  /// An optional totally custom fill color used to fill the
  /// `InputDecorator` background with, when `filled` is true.
  ///
  /// If null, defaults to color scheme color defined by `baseColor`
  /// withAlpha(0x0D) (5%) if color scheme is light and withAlpha(0x14) (8%)
  /// if color scheme is dark.
  final Color? fillColor,

  // TODO(rydmike): Migrate backgroundAlpha to backgroundOpacity.
  /// Defines the alpha, opacity channel value used as opacity on effective
  /// [InputDecorator] background color.
  ///
  /// If defined, the valid range is 0 to 255 (0x00 to 0xFF), if out of bounds
  /// it is capped to closest valid value.
  ///
  /// If not defined, in M3 mode it defaults to 0xFF fully opaque. In M2 mode
  /// defaults to [kFillColorLightOpacity] (0x0D = 5% opacity) in light theme
  /// and to [kFillColorDarkOpacity] (0x14 = 8% opacity) in dark mode.
  ///
  /// NOTE: This will be migrated to use o 0.0 to 1.0 opacity values in
  /// version 9.0. A parallel API wil be introduced in v8.0 to allow for
  /// a smooth migration path.
  final int? backgroundAlpha,

  /// The icon color of the prefixIcon in a focused [InputDecoration].
  ///
  /// If not defined defaults to [baseSchemeColor] in FCS M2 and to
  /// [SchemeColor.onSurface] in FCS M3.
  final SchemeColor? prefixIconSchemeColor,

  /// The icon color of the suffixIcon in a focused [InputDecoration].
  ///
  /// If not defined, defaults to [prefixIconSchemeColor] in FCS M2 and to
  /// [SchemeColor.onSurface] in FCS M3.
  final SchemeColor? suffixIconSchemeColor,

  /// Selects which color from the passed in colorScheme to use as the border
  /// color of the input decorator.
  ///
  /// The color is used by the focused border, but also as slight opacity
  /// based color on unfocused border, when [unfocusedHasBorder] and
  /// [unfocusedBorderIsColored] are true.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined and [baseSchemeColor] is also not defined, then
  /// in M3 and M2 mode, the border color defaults to primary.
  ///
  /// If not defined and [baseSchemeColor] is defined, it defaults
  /// to the color given by [baseSchemeColor].
  final SchemeColor? borderSchemeColor,

  /// The border width when the input is selected.
  ///
  /// If null, defaults to [kThickBorderWidth] = 2.
  final double? focusedBorderWidth,

  /// The border width when the input is unselected or disabled.
  ///
  /// If null, defaults to [kThinBorderWidth] = 1.
  final double? unfocusedBorderWidth,

  /// Horizontal padding on either side of the border's
  /// [InputDecoration.labelText] width gap.
  ///
  /// Defaults to 4, which is also the default in SDK default input decorator.
  final double gapPadding = 4,

  /// Unfocused input decoration has a border.
  ///
  /// Defaults to true.
  ///
  /// Applies to both outline and underline mode. You would typically
  /// use this in a design where you use a fill color and want unfocused
  /// input fields to only be highlighted by the fill color and not even
  /// have an unfocused input border style.
  ///
  /// When set to false, there is no border bored on states enabledBorder and
  /// disabledBorder, there is a border on focusedBorder, focusedErrorBorder
  /// and errorBorder, so error thus has a border also when it is not focused.
  final bool unfocusedHasBorder = true,

  /// Focused input decoration has a border.
  ///
  /// Defaults to true.
  ///
  /// Applies to both outline and underline mode. You would typically
  /// use this in a design where you use a fill color and want focused
  /// input fields to only be highlighted by the fill color and not even
  /// have an unfocused input border style.
  ///
  /// When set to false, there is no border bored on states enabledBorder and
  /// disabledBorder, there is a border on focusedBorder, focusedErrorBorder
  /// and errorBorder, so error thus has a border also when it is not focused.
  final bool focusedHasBorder = true,

  /// Unfocused input decoration border uses the color baseScheme color.
  ///
  /// Applies to both outline and underline mode.
  ///
  /// When set to true, the unfocused borders also uses the [baseSchemeColor]
  /// as its border color, but with alpha [kEnabledBorderAlpha] (90%).
  ///
  /// If set to false, the color uses the SDK default unselected border color,
  /// which is [ColorScheme.onSurface] with 38% opacity.
  ///
  /// The unfocused border color selection also applies to it hovered state.
  ///
  /// If undefined, defaults to false.
  final bool? unfocusedBorderIsColored,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  final bool? tintedInteractions,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  final bool? tintedDisabled,

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
  final bool tintInteract = tintedInteractions ?? false;
  final bool tintDisable = tintedDisabled ?? false;
  final bool isFilled = filled ?? false;

  // Used color scheme is for dark mode.
  final bool isDark = colorScheme.brightness == Brightness.dark;

  // Get selected color, defaults to primary.
  final Color baseColor = FlexSubThemes.schemeColor(
    baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Used border color, for focus and unfocused when that option is used.
  final Color borderColor = FlexSubThemes.schemeColor(
    borderSchemeColor ?? baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Tinted disabled colors
  final Color tintDisabledColor = FlexSubThemes.tintedDisable(
    colorScheme.onSurface,
    fillColor ?? baseColor,
  );
  final Color tintDisabledUltraLowColor = FlexSubThemes.tintedDisable(
    colorScheme.onSurface,
    fillColor ?? baseColor,
  ).withValues(alpha: kAlphaUltraLowDisabledFloat);

  // Get effective alpha value for background fill color.
  final double effectiveOpacity = backgroundAlpha == null
      ? useM3
          ? 1.0
          : isDark
              ? kFillColorDarkOpacity
              : kFillColorLightOpacity
      : backgroundAlpha.clamp(0, 255) / 255;

  // Effective used fill color, can also be a totally custom color value.
  // These alpha blends remove the actual opacity and create a none opaque
  // color of the result of as if InputDecorator was used on surface color.
  // Usually this is close enough. This operations makes it possible to
  // use a simple lighter and dark color color of this net effect for
  // the hover effect, which is also actually not transparent.
  final Color usedFillColor = fillColor != null
      ? Color.alphaBlend(
          fillColor.withValues(alpha: effectiveOpacity),
          colorScheme.surface,
        )
      : WidgetStateColor.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return tintDisable
                ? tintDisabledUltraLowColor
                : colorScheme.onSurface.withValues(
                    alpha: kAlphaUltraLowDisabledFloat,
                  ); // M3 spec, 4%, 0x0A
          }
          return baseSchemeColor == null && useM3
              ? Color.alphaBlend(
                  colorScheme.surfaceContainerHighest.withValues(
                    alpha: effectiveOpacity,
                  ),
                  colorScheme.surface,
                )
              : Color.alphaBlend(
                  baseColor.withValues(alpha: effectiveOpacity),
                  colorScheme.surface,
                );
        });

  // A custom lighter and darker version of the effective background
  // color on the input decorator as hover color. This is a different formula
  // than otherwise used for the overall based hover colors by FCS. It was the
  // only way it was possible to make a nice tinted version that worked well
  // with any config that it is possible to create for the background on
  // the InputDecorator.
  final Color tintedHover =
      ThemeData.estimateBrightnessForColor(usedFillColor) == Brightness.light
          ? usedFillColor.darken(kInputDecoratorLightBgDarken)
          : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

  // Focused prefix iconColor defaults
  final SchemeColor focusedIconDefault = useM3
      ? SchemeColor.onSurfaceVariant
      : baseSchemeColor ?? SchemeColor.primary;
  // Effective focused prefix icon color.
  final Color focusedPrefixIconColor = FlexSubThemes.schemeColor(
    prefixIconSchemeColor ?? focusedIconDefault,
    colorScheme,
  );
  // Effective focused suffix icon color.
  final Color focusedSuffixIconColor = FlexSubThemes.schemeColor(
    suffixIconSchemeColor ?? focusedIconDefault,
    colorScheme,
  );

  // Flutter SDK "magic" theme colors from ThemeData, with old M1/M2 roots.
  final Color hintColorM2 = isDark
      ? Colors.white60
      : Colors.black.withValues(alpha: kTintHoverFloat); // 60%
  final Color unfocusedIconDefaultM2 = isDark ? Colors.white70 : Colors.black45;
  final Color disabledDefaultM2 = isDark ? Colors.white38 : Colors.black38;
  final Color disabledDefaultM3 = colorScheme.onSurface.withValues(
    alpha: kAlphaDisabledFloat,
  );
  final Color disabledDefault = useM3 ? disabledDefaultM3 : disabledDefaultM2;

  // Enabled border color.
  final Color enabledBorderColor = unfocusedBorderIsColored ?? false
      ? borderColor.withValues(alpha: kEnabledBorderOpacity)
      : useM3
          ? isFilled
              ? colorScheme.onSurfaceVariant
              : colorScheme.outline
          : colorScheme.onSurface.withValues(alpha: kAlphaDisabledFloat);
  // TODO(rydmike): Review M3 border hover, defaults are not very distinct.
  // Enabled hovered border color.
  final Color enabledHoveredBorderColor = unfocusedBorderIsColored ?? false
      ? borderColor //.withAlpha(kEnabledBorderAlpha)
      : isFilled
          ? colorScheme.onSurface
          : colorScheme.onSurfaceVariant; // .withAlpha(kAlphaDisabled);

  // Default border radius.
  final double effectiveRadius =
      radius ?? (useM3 ? kInputDecoratorM3Radius : kInputDecoratorRadius);

  // Default outline widths.
  final double unfocusedWidth = unfocusedBorderWidth ?? kThinBorderWidth;
  final double focusedWidth = focusedBorderWidth ?? kThickBorderWidth;

  final BorderRadius effectiveUnderlineBorder = BorderRadius.only(
    topLeft: Radius.circular(effectiveRadius),
    topRight: Radius.circular(effectiveRadius),
  );
  final BorderRadius effectiveOutlineBorder = BorderRadius.circular(
    effectiveRadius,
  );

  return InputDecorationThemeData(
    labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return tintDisable
            ? TextStyle(color: tintDisabledColor)
            : TextStyle(
                color: colorScheme.onSurface.withValues(
                  alpha: kAlphaDisabledFloat,
                ),
              );
      }
      if (states.contains(WidgetState.error)) {
        if (states.contains(WidgetState.focused)) {
          return TextStyle(color: colorScheme.error);
        }
        if (states.contains(WidgetState.hovered)) {
          // TODO(rydmike): Info: M3 default uses onErrorContainer.
          // Excluding it, prefer suffix icon uses error color, opinionated.
          // Maybe add option to choose between error and onErrorContainer?
          return TextStyle(color: colorScheme.error);
        }
        return TextStyle(color: colorScheme.error);
      }
      if (states.contains(WidgetState.focused)) {
        return TextStyle(color: baseColor);
      }
      if (states.contains(WidgetState.hovered)) {
        return TextStyle(color: colorScheme.onSurfaceVariant);
      }

      return TextStyle(
        color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2,
      );
    }),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.error)) {
        if (states.contains(WidgetState.focused)) {
          return TextStyle(color: colorScheme.error);
        }

        if (states.contains(WidgetState.hovered)) {
          // TODO(rydmike): Info: M3 uses onErrorContainer.
          // Excluding it, prefer error as float label color, FCS opinionated.
          // Maybe include with option to choose style?
          return TextStyle(color: colorScheme.error);
        }
        return TextStyle(
          // TODO(rydmike): Info: M3 error, with this we get a hover diff.
          // Prefer this as a diff to the hover state.
          color: colorScheme.error.withValues(
            alpha: kEnabledBorderOpacity,
          ),
        );
      }
      if (states.contains(WidgetState.focused)) {
        return TextStyle(color: borderColor);
      }
      if (states.contains(WidgetState.hovered)) {
        return TextStyle(color: colorScheme.onSurfaceVariant);
      }
      if (states.contains(WidgetState.disabled)) {
        return tintDisable
            ? TextStyle(color: tintDisabledColor)
            : TextStyle(color: disabledDefault);
      }
      return TextStyle(
        color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2,
      );
    }),
    helperStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return tintDisable
            ? TextStyle(color: tintDisabledColor)
            : TextStyle(
                color: useM3
                    ? colorScheme.onSurface.withValues(
                        alpha: kAlphaDisabledFloat,
                      )
                    : Colors.transparent,
              );
      }
      return TextStyle(
        color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2,
      );
    }),
    hintStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return TextStyle(
          color: tintDisable ? tintDisabledColor : disabledDefault,
        );
      }
      return TextStyle(
        color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2,
      );
    }),
    iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return tintDisable ? tintDisabledColor : disabledDefault;
      }
      if (states.contains(WidgetState.focused)) {
        return useM3 ? colorScheme.onSurfaceVariant : baseColor;
      }
      return useM3 ? colorScheme.onSurfaceVariant : unfocusedIconDefaultM2;
    }),
    prefixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return tintDisable ? tintDisabledColor : disabledDefault;
      }
      if (states.contains(WidgetState.focused)) {
        return focusedPrefixIconColor;
      }
      return useM3 ? colorScheme.onSurfaceVariant : unfocusedIconDefaultM2;
    }),
    suffixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.error)) {
        if (states.contains(WidgetState.focused)) {
          return colorScheme.error;
        }
        if (states.contains(WidgetState.hovered)) {
          // TODO(rydmike): Info: M3 default uses onErrorContainer.
          // Excluding it, prefer suffix icon uses error color, opinionated.
          // Maybe add option to choose between error and onErrorContainer?
          return colorScheme.error;
        }
        return colorScheme.error;
      }
      if (states.contains(WidgetState.disabled)) {
        return tintDisable ? tintDisabledColor : disabledDefault;
      }
      if (states.contains(WidgetState.focused)) {
        return focusedSuffixIconColor;
      }
      return useM3 ? colorScheme.onSurfaceVariant : unfocusedIconDefaultM2;
    }),
    contentPadding: contentPadding,
    isDense: isDense ?? false,
    filled: isFilled,
    fillColor: usedFillColor,
    hoverColor: tintInteract ? tintedHover : null,
    //
    // Complex custom BORDER theming, now with hover effects.
    //
    border: (borderType ?? FlexInputBorderType.underline) ==
            FlexInputBorderType.underline
        ? WidgetStateInputBorder.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return UnderlineInputBorder(
                borderRadius: effectiveUnderlineBorder,
                borderSide: unfocusedHasBorder
                    ? BorderSide(
                        color: tintDisable
                            ? tintDisabledColor.withValues(
                                alpha: kAlphaLowDisabledFloat,
                              )
                            : colorScheme.onSurface.withValues(
                                alpha: kAlphaVeryLowDisabledFloat,
                              ),
                        width: unfocusedWidth,
                      )
                    : BorderSide.none,
              );
            }
            if (states.contains(WidgetState.error)) {
              if (states.contains(WidgetState.focused)) {
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: focusedHasBorder
                      ? BorderSide(
                          color: colorScheme.error,
                          width: focusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              if (states.contains(WidgetState.hovered)) {
                return UnderlineInputBorder(
                  borderRadius: effectiveUnderlineBorder,
                  borderSide: unfocusedHasBorder
                      ? BorderSide(
                          // TODO(rydmike): Info: M3 uses onErrorContainer
                          color: colorScheme.error,
                          width: unfocusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              return UnderlineInputBorder(
                borderRadius: effectiveUnderlineBorder,
                borderSide: unfocusedHasBorder
                    ? BorderSide(
                        // TODO(rydmike): Info: M3 uses error
                        color: colorScheme.error.withValues(
                          alpha: kEnabledBorderOpacity,
                        ),
                        width: unfocusedWidth,
                      )
                    : BorderSide.none,
              );
            }
            if (states.contains(WidgetState.focused)) {
              return UnderlineInputBorder(
                borderRadius: effectiveUnderlineBorder,
                borderSide: focusedHasBorder
                    ? BorderSide(
                        color: borderColor,
                        width: focusedWidth,
                      )
                    : BorderSide.none,
              );
            }
            if (states.contains(WidgetState.hovered)) {
              return UnderlineInputBorder(
                borderRadius: effectiveUnderlineBorder,
                borderSide: unfocusedHasBorder
                    ? BorderSide(
                        color: enabledHoveredBorderColor,
                        width: unfocusedWidth,
                      )
                    : BorderSide.none,
              );
            }
            return UnderlineInputBorder(
              borderRadius: effectiveUnderlineBorder,
              borderSide: unfocusedHasBorder
                  ? BorderSide(
                      color: enabledBorderColor,
                      width: unfocusedWidth,
                    )
                  : BorderSide.none,
            );
          })
        //
        // The outline version
        : WidgetStateInputBorder.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return OutlineInputBorder(
                borderRadius: effectiveOutlineBorder,
                borderSide: unfocusedHasBorder
                    ? BorderSide(
                        color: tintDisable
                            ? tintDisabledColor.withValues(
                                alpha: kAlphaLowDisabledFloat,
                              )
                            : colorScheme.onSurface.withValues(
                                alpha: kAlphaVeryLowDisabledFloat,
                              ),
                        width: unfocusedWidth,
                      )
                    : BorderSide.none,
              );
            }
            if (states.contains(WidgetState.error)) {
              if (states.contains(WidgetState.focused)) {
                return OutlineInputBorder(
                  borderRadius: effectiveOutlineBorder,
                  borderSide: focusedHasBorder
                      ? BorderSide(
                          color: colorScheme.error,
                          width: focusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              if (states.contains(WidgetState.hovered)) {
                return OutlineInputBorder(
                  borderRadius: effectiveOutlineBorder,
                  borderSide: unfocusedHasBorder
                      ? BorderSide(
                          // TODO(rydmike): Info: M3 uses onErrorContainer
                          color: colorScheme.error,
                          width: unfocusedWidth,
                        )
                      : BorderSide.none,
                );
              }
              return OutlineInputBorder(
                borderRadius: effectiveOutlineBorder,
                borderSide: unfocusedHasBorder
                    ? BorderSide(
                        // TODO(rydmike): Info: M3 uses error
                        color: colorScheme.error.withValues(
                          alpha: kEnabledBorderOpacity,
                        ),
                        width: unfocusedWidth,
                      )
                    : BorderSide.none,
              );
            }
            if (states.contains(WidgetState.focused)) {
              return OutlineInputBorder(
                borderRadius: effectiveOutlineBorder,
                borderSide: focusedHasBorder
                    ? BorderSide(
                        color: borderColor,
                        width: focusedWidth,
                      )
                    : BorderSide.none,
              );
            }
            if (states.contains(WidgetState.hovered)) {
              return OutlineInputBorder(
                borderRadius: effectiveOutlineBorder,
                borderSide: unfocusedHasBorder
                    ? BorderSide(
                        color: enabledHoveredBorderColor,
                        width: unfocusedWidth,
                      )
                    : BorderSide.none,
              );
            }
            return OutlineInputBorder(
              borderRadius: effectiveOutlineBorder,
              borderSide: unfocusedHasBorder
                  ? BorderSide(
                      color: enabledBorderColor,
                      width: unfocusedWidth,
                    )
                  : BorderSide.none,
            );
          }),
  );
}
