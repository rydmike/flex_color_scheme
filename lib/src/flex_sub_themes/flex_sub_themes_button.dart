part of '../flex_sub_themes.dart';

/// An opinionated [ButtonThemeData] theme.
///
/// The `ButtonThemeData` is marked as **obsolete** in Flutter SDK
/// documentation, but not yet deprecated in Flutter stable SDK 3.24.x.
///
/// This sub-theme will be removed in FCS when Flutter SDK deprecates
/// [ButtonThemeData].
///
/// This theme is used to provide the same opinionated theme and style on
/// the deprecated buttons `RaisedButton`, `OutlineButtons` and `FlatButton`.
/// Button theme has more limited theming capability and cannot match
/// the Material style buttons fully, this is an approximation.
///
/// The adjustable button corner [radius] defaults to 20. This was an early
/// default in M3 for buttons, it was later changed to stadium border.
/// Flutter SDK M2 defaults to 4.
///
/// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
/// It is used to make the buttons match the padding on the newer buttons.
///
/// The above legacy buttons this sub theme is for, will be completely
/// removed in Flutter stable version. The `ButtonThemeData` this helper uses
/// will however remain available after that, because widgets
/// [DropdownButton], plus [MaterialButton] (marked as
/// obsolete in SDK docs though) still use this theme. It is thus kept around
/// in FlexColorScheme package as long as it might have some use and exists
/// in Flutter stable SDK.
ButtonThemeData _buttonTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Selects which color from the passed in colorScheme to use as the main
  /// color for the button.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, [colorScheme.primary] will be used.
  final SchemeColor? baseSchemeColor,

  /// The button corner radius.
  ///
  /// If not defined, defaults to [kButtonRadius] 40dp,
  /// based on earlier M3 specification, that was later changed to stadium.
  /// https://m3.material.io/components/buttons/specs
  final double? radius,

  /// Padding for legacy button.
  ///
  /// If not defined,
  /// defaults to [kButtonPadding] = `EdgeInsets.symmetric(horizontal: 16)`.
  /// This makes the legacy buttons same size as default margin on new ones.
  final EdgeInsetsGeometry? padding,

  /// Minimum button size.
  ///
  /// If undefined, defaults to [kButtonMinSize] = Size(40, 40).
  final Size? minButtonSize,

  /// If true, then a [DropdownButton] menu's width will match the button's
  /// width.
  ///
  /// If false (the default), then the dropdown's menu will be wider than
  /// its button. In either case the dropdown button will line up the leading
  /// edge of the menu's value with the leading edge of the values
  /// displayed by the menu items.
  ///
  /// This property only affects [DropdownButton] and its menu.
  ///
  /// If not defined default to false.
  final bool? alignedDropdown,

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
  // Get selected color, defaults to primary.
  final Color baseColor = FlexSubThemes.schemeColor(
    baseSchemeColor ?? SchemeColor.primary,
    colorScheme,
  );

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = colorScheme.surface;
  final Color tint = baseColor;
  final double factor =
      FlexSubThemes._tintAlphaFactor(tint, colorScheme.brightness);

  // Effective minimum button size.
  final Size effectiveMinButtonSize = minButtonSize ?? kButtonMinSize;

  return ButtonThemeData(
    colorScheme: colorScheme,
    alignedDropdown: alignedDropdown ?? false,
    minWidth: effectiveMinButtonSize.width,
    height: effectiveMinButtonSize.height,
    padding: padding ?? kButtonPadding,
    layoutBehavior: ButtonBarLayoutBehavior.constrained,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    hoverColor: tintInteract
        ? FlexSubThemes.tintedHovered(overlay, tint, factor)
        : baseColor.withAlpha(kAlphaHovered),
    focusColor: tintInteract
        ? FlexSubThemes.tintedFocused(overlay, tint, factor)
        : baseColor.withAlpha(kAlphaFocused),
    highlightColor: tintInteract
        ? FlexSubThemes.tintedHighlight(overlay, tint, factor)
        : baseColor.withAlpha(kAlphaHighlight),
    splashColor: tintInteract
        ? FlexSubThemes.tintedSplash(overlay, tint, factor)
        : baseColor.withAlpha(kAlphaSplash),
    disabledColor: tintDisable
        ? FlexSubThemes.tintedDisable(
            colorScheme.onSurface,
            tint,
          ).withAlpha(kAlphaLowDisabled)
        : colorScheme.onSurface.withAlpha(kAlphaLowDisabled),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? kButtonRadius),
      ),
    ),
    textTheme: ButtonTextTheme.primary,
  );
}
