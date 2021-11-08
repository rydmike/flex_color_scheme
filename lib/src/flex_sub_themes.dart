import 'package:flutter/material.dart';

import 'flex_constants.dart';
import 'flex_extensions.dart';

// ignore_for_file: comment_references

/// Enum used to select the type of border used on by the input decorator in
/// [FlexSubThemes.inputDecorationTheme].
enum FlexInputBorderType {
  /// Used to select [OutlineInputBorder] as input decorator in
  /// [FlexSubThemes.inputDecorationTheme].
  outline,

  /// Used to select [UnderlineInputBorder] as input decorator in
  /// [FlexSubThemes.inputDecorationTheme].
  underline,
}

/// Static helpers for opt-in widget sub theming offered by [FlexColorScheme].
///
/// FlexSubTheme offers opinionated static theme helpers that are opt-in via
/// FlexColorScheme(subThemesOptIn: true). You can also configure the
/// default of the opt-in setup by defining custom configuration values in the
/// [FlexSubThemesData] configuration class, and passing it to the
/// FlexColorScheme(flexThemesData) constructor property.
///
/// The configuration class [FlexSubThemesData] offers simple configuration
/// properties for using these sub-themes in FlexColorScheme. You can also use
/// the static sub-themes without using FlexColorScheme based theming,
/// however the [FlexSubThemesData] has no impact on the static helpers, it
/// is [FlexColorScheme] that uses the [FlexSubThemesData] class to configure
/// the opt in sub-themes. You can of course also do this if you use
/// [FlexSubThemesData] outside of [FlexColorScheme] or in copyWith on each
/// sub-theme with custom [ThemeData].
///
/// Sub themes for the following widgets are provided and used via opt-in
/// flag [useSubThemes] in [FlexColorScheme]:
///
/// * [TextButton]
/// * [ElevatedButton]
/// * [OutlinedButton]
/// * Older buttons using [ButtonThemeData]
/// * [ToggleButtons]
/// * [InputDecoration]
/// * [FloatingActionButton]
/// * [Chip]
/// * [Card]
/// * [PopupMenuButton]
/// * [Dialog]
/// * [TimePickerDialog]
/// * [SnackBar]
/// * [BottomSheet]
/// * [BottomNavigationBar]
///
/// In [ToggleButtons] hover, press, selected and focus states are not
/// an exact match for the main buttons. It does not have as flexible styling
/// as the main buttons. The theme mimics the style of the [OutlinedButton] for
/// not selected buttons and the style of [ElevatedButton] for selected
/// button. It does not support [MaterialStateProperty] and has only
/// one state for different parts of the button, selected and not selected,
/// that would need different property values. It can therefore not fully
/// match the same theme style as the Material states used on two different
/// [ButtonStyleButton] buttons.
///
/// The theme [ButtonThemeData] is also included to provide a very similar
/// theme style on the deprecated legacy buttons `RaisedButton`,
/// `OutlineButton` and `FlatButton` as on the current main buttons. It is not
/// an exact match, since the legacy buttons do not offer as flexible
/// styling as the newer buttons. They do follow and match the styling on
/// [ToggleButtons] when it comes to hover, press, selected and focus.
///
/// The following widgets that have rounded corners are on excluded from
/// sub theming:
/// * [Tooltip], generally so small that larger prominent rounding this
///   opinionated sub-theming is designed for is not a good fit.
///   FlexColorScheme does include out of the box theming options for tooltips,
///   that also adapts to color branding when opting in on sub themes, where
///   it also gets a bit more rounded than when not opting on sub themes.
/// * [Scrollbar], rounding on edges of scrollbars are left to platform default.
/// * [AppBar] and [BottomAppBar] shape properties are left to their defaults.
/// * [SnackBar] the floating snackbar should be sub-themed to also include
///   border radius via default, but the none floating one should remain
///   straight. Unclear if it can be done via SDK's current theming features,
///   will investigate more in future version.
/// * [Drawer] should have 16dp default rounding on shown edges, but in current
///   version of Flutter SDK (2.5.3) it has no theme to enable it. It is coming
///   in later Flutter version, when it does, it will be added.
class FlexSubThemes {
  FlexSubThemes._(); // coverage:ignore-line

  /// An opinionated [TextButtonThemeData] theme.
  ///
  /// Requires a `ColorScheme`. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The adjustable button corner [radius] defaults to 20 this is new
  /// default in M3, Flutter SDK M2 defaults to 4.
  static TextButtonThemeData textButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The button corner radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// Padding for the button theme.
    ///
    /// Defaults to null and uses `styleFrom` default padding.
    ///
    /// M3 has more horizontal padding 24, but this tighter default padding
    /// in M2 with 16dp looks fine as well using stadium borders as in M3.
    /// Making the custom scalable padding and separate one for with icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: minButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kButtonRadius),
            ),
          ), // buttonShape,
          padding: padding,
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledForegroundAlpha);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withAlpha(kHoverBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withAlpha(kFocusBackgroundAlpha);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withAlpha(kPressedBackgroundAlpha);
              }
              return Colors.transparent;
            },
          ),
        ),
      );

  /// An opinionated [ElevatedButtonThemeData] theme.
  ///
  /// Requires a [ColorScheme] in [colorscheme]. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The button [elevation] defaults to 1 [kElevatedButtonElevation], making
  /// the elevated button a bit more flat. Flutter SDK ElevatedButton
  /// defaults to elevation 2.
  ///
  /// The adjustable button corner [radius] defaults to 20 this is new
  /// default in M3, Flutter SDK M2 defaults to 4.
  static ElevatedButtonThemeData elevatedButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The button corner radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// The button elevation
    ///
    /// Defaults to [kElevatedButtonElevation] 1, making it a bit more flat in
    /// its elevation state than Flutter SDK, that defaults to 2.
    /// An opinionated choice.
    final double elevation = kElevatedButtonElevation,

    /// Padding for the button theme.
    ///
    /// Defaults to null and uses `styleFrom` default padding.
    ///
    /// M3 has more horizontal padding 24, but this tighter default padding
    /// in M2 with 16dp looks fine as well using stadium borders as in M3.
    /// Making the custom scalable padding and separate one for with icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: minButtonSize,
          padding: padding,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kButtonRadius),
            ),
          ), //buttonShape,
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledForegroundAlpha);
              }
              return colorScheme.onPrimary;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.onPrimary.withAlpha(kHoverBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.onPrimary.withAlpha(kFocusBackgroundAlpha);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.onPrimary.withAlpha(kPressedBackgroundAlpha);
              }
              return Colors.transparent;
            },
          ),
        ),
      );

  /// An opinionated [OutlinedButtonThemeData] theme.
  ///
  /// Requires a [ColorScheme]. The color scheme would typically be equal the
  /// color scheme also used to define the color scheme for your app theme.
  ///
  /// The adjustable button corner [radius] defaults to 20 this is new
  /// default in M3, Flutter SDK M2 defaults to 4.
  static OutlinedButtonThemeData outlinedButtonTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// The button corner border radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// The outline thickness when the button is pressed.
    ///
    /// Defaults to 2.0.
    final double pressedOutlineWidth = kThickBorderWidth,

    /// The outline thickness when the button is not selected.
    ///
    /// Defaults to 1.5.
    final double outlineWidth = kThinBorderWidth,

    /// Padding for the button theme.
    ///
    /// Defaults to null and uses `styleFrom` default padding.
    ///
    /// M3 has more horizontal padding 24, but this tighter default padding
    /// in M2 with 16dp looks fine as well using stadium borders as in M3.
    /// Making the custom scalable padding and separate one for with icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,

    /// Minimum button size.
    ///
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: minButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? kButtonRadius),
            ),
          ), //buttonShape,
          padding: padding,
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledForegroundAlpha);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withAlpha(kHoverBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withAlpha(kFocusBackgroundAlpha);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withAlpha(kPressedBackgroundAlpha);
              }
              return Colors.transparent;
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide?>(
            (final Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                  width: outlineWidth,
                );
              }
              if (states.contains(MaterialState.error)) {
                return BorderSide(
                  color: colorScheme.error,
                  width: pressedOutlineWidth,
                );
              }
              if (states.contains(MaterialState.pressed)) {
                return BorderSide(
                  color: colorScheme.primary,
                  width: pressedOutlineWidth,
                );
              }
              return BorderSide(
                color: colorScheme.primary.withAlpha(kEnabledBorderAlpha),
                width: outlineWidth,
              );
            },
          ),
        ),
      );

  /// An opinionated [ButtonThemeData] theme.
  ///
  /// This theme is used to provide the same opinionated theme and style on
  /// the deprecated buttons `RaisedButton`, `OutlineButtons` and `FlatButton`.
  /// Toggle buttons have more limited theming capability and cannot match
  /// the Material style buttons fully, this is an approximation.
  ///
  /// The adjustable button corner [radius] defaults to 20 this is new
  /// default in M3, Flutter SDK M2 defaults to 4.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is used to make the buttons match the padding on the newer buttons.
  static ButtonThemeData buttonTheme({
    /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required final ColorScheme colorScheme,

    /// The button corner radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// Padding for legacy button.
    ///
    /// Defaults to EdgeInsets.symmetric(horizontal: 16).
    /// This makes the legacy buttons same size as default margin on new ones.
    final EdgeInsetsGeometry padding = kButtonPadding,

    /// Minimum button size.
    ///
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,
  }) =>
      ButtonThemeData(
        colorScheme: colorScheme,
        minWidth: minButtonSize.width,
        height: minButtonSize.height,
        padding: padding,
        layoutBehavior: ButtonBarLayoutBehavior.constrained,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        hoverColor: colorScheme.primary
            .blendAlpha(Colors.white, kHoverAlphaBlend)
            .withAlpha(kHoverAlpha),
        focusColor: colorScheme.primary
            .blendAlpha(Colors.white, kFocusAlphaBlend)
            .withAlpha(kFocusAlpha),
        highlightColor: colorScheme.primary
            .blendAlpha(Colors.white, kHighlightAlphaBlend)
            .withAlpha(kHighlightAlpha),
        splashColor: colorScheme.primary
            .blendAlpha(Colors.white, kSplashAlphaBlend)
            .withAlpha(kSplashAlpha),
        disabledColor: colorScheme.primary
            .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
            .withAlpha(kDisabledBackgroundAlpha),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kButtonRadius),
          ),
        ),
        textTheme: ButtonTextTheme.primary,
      );

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
  static ToggleButtonsThemeData toggleButtonsTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// The button corner radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// The width of the borders around the toggle buttons.
    ///
    /// In this design it uses the same default as outline thickness for
    /// selected outline button and input decorator.
    ///
    /// Defaults to 1.5.
    final double borderWidth = kThinBorderWidth,

    /// Minimum button size.
    ///
    /// Defaults to Size(40, 40).
    final Size minButtonSize = kButtonMinSize,

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
  }) {
    final VisualDensity _visualDensity =
        visualDensity ?? VisualDensity.adaptivePlatformDensity;
    return ToggleButtonsThemeData(
      borderWidth: borderWidth,
      selectedColor: colorScheme.onPrimary.withAlpha(kSelectedAlpha),
      color: colorScheme.primary,
      fillColor:
          colorScheme.primary.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
      borderColor: colorScheme.primary.withAlpha(kEnabledBorderAlpha),
      selectedBorderColor:
          colorScheme.primary.blendAlpha(Colors.white, kAltPrimaryAlphaBlend),
      hoverColor: colorScheme.primary
          .blendAlpha(Colors.white, kHoverAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kHoverAlpha),
      focusColor: colorScheme.primary
          .blendAlpha(Colors.white, kFocusAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kFocusAlpha),
      highlightColor: colorScheme.primary
          .blendAlpha(
              Colors.white, kHighlightAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kHighlightAlpha),
      splashColor: colorScheme.primary
          .blendAlpha(Colors.white, kSplashAlphaBlend + kAltPrimaryAlphaBlend)
          .withAlpha(kSplashAlpha),
      disabledColor: colorScheme.primary
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledForegroundAlpha),
      disabledBorderColor: colorScheme.primary
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledBackgroundAlpha),
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
        // uses, defaults to same value that ThemeData default.
        minWidth: minButtonSize.width -
            borderWidth * 2 +
            _visualDensity.baseSizeAdjustment.dx,
        minHeight: minButtonSize.height -
            borderWidth * 2 +
            _visualDensity.baseSizeAdjustment.dy,
      ),
    );
  }

  /// An opinionated [OutlineInputBorder] or [UnderlineInputBorder] using
  /// [InputDecorationTheme], with optional fill color and adjustable
  /// corner radius.
  ///
  /// Requires the [fillColor] and a [ColorScheme] in [colorScheme]. The color
  /// scheme would typically be equal the color scheme also used to define the
  /// color scheme for your app theme.
  ///
  /// Its corner [radius] can be adjusted, it defaults to [kButtonRadius] (20).
  static InputDecorationTheme inputDecorationTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// The button corner radius.
    ///
    /// Defaults to 20 [kButtonRadius].
    final double? radius,

    /// Selects input border type.
    ///
    /// Defaults to [FlexInputBorderType.outline].
    final FlexInputBorderType borderType = FlexInputBorderType.outline,

    /// If true the decoration's container is filled with [fillColor].
    ///
    /// Typically this field set to true if [border] is an
    /// [UnderlineInputBorder].
    ///
    /// The decoration's container is the area, defined by the border's
    /// [InputBorder.getOuterPath], which is filled if [filled] is
    /// true and bordered per the [border].
    ///
    /// Defaults to true.
    final bool filled = true,

    /// Fill color used to fill the `InputDecorator` background with, when
    /// `filled` is true.
    ///
    /// Defaults to `colorScheme.primary.withAlpha(0x0F)` if null.
    final Color? fillColor,

    /// The border width when the input is selected.
    ///
    /// Defaults to 2.0.
    final double focusedBorderWidth = kThickBorderWidth,

    /// The border width when the input is unselected or disabled.
    ///
    /// Defaults to 1.5.
    final double unfocusedBorderWidth = kThinBorderWidth,

    /// Horizontal padding on either side of the border's
    /// [InputDecoration.labelText] width gap.
    ///
    /// Defaults to 4, also default in SDK, no major reason to change it.
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
  }) {
    final Color _fillColor =
        fillColor ?? colorScheme.primary.withAlpha(kFillColorAlphaDefault);

    switch (borderType) {
      case FlexInputBorderType.outline:
        return InputDecorationTheme(
          filled: filled,
          fillColor: _fillColor,
          hoverColor: colorScheme.primary.withAlpha(kHoverBackgroundAlpha),
          focusColor: colorScheme.primary.withAlpha(kFocusBackgroundAlpha),
          focusedBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: colorScheme.primary,
              width: focusedBorderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: colorScheme.primary.withAlpha(kEnabledBorderAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: focusedBorderWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius:
                BorderRadius.all(Radius.circular(radius ?? kButtonRadius)),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              width: unfocusedBorderWidth,
            ),
          ),
        );
      case FlexInputBorderType.underline:
        return InputDecorationTheme(
          filled: filled,
          fillColor: _fillColor,
          hoverColor: colorScheme.primary.withAlpha(kHoverBackgroundAlpha),
          focusColor: colorScheme.primary.withAlpha(kFocusBackgroundAlpha),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: colorScheme.primary,
              width: focusedBorderWidth,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: colorScheme.primary.withAlpha(kEnabledBorderAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: unfocusedHasBorder
                ? BorderSide(
                    color: colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha),
                    width: unfocusedBorderWidth,
                  )
                : BorderSide.none,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: focusedBorderWidth,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? kButtonRadius),
              topRight: Radius.circular(radius ?? kButtonRadius),
            ),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
              width: unfocusedBorderWidth,
            ),
          ),
        );
    }
  }

  /// An opinionated [FloatingActionButtonThemeData] with custom border radius.
  ///
  /// The border radius default to 16 [kDefaultRadius], new M3 default.
  /// https://m3.material.io/components/floating-action-button/specs
  ///
  /// By setting [useShape] to false it is possible to opt out of all
  /// shape theming on FABs and keep their M2 defaults, while still eg.
  /// keeping M3 defaults on other widgets or changing their border radius
  /// with the shared global value.
  ///
  /// You may want to continue to keep the FAB round and extended FAB stadium
  /// shaped as before, despite otherwise using a rounder or M3 design.
  /// The circular M2 FAB goes well with those designs too.
  static FloatingActionButtonThemeData floatingActionButtonTheme({
    /// Corner radius of FAB.
    ///
    /// Defaults to [kDefaultRadius] 16.
    final double? radius,

    /// Set to false, to not apply Shape theming to the FAB. It will then keep
    /// using its M2 default round shape and stadium shape for extended FAB.
    final bool useShape = true,
  }) =>
      FloatingActionButtonThemeData(
        shape: useShape
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? kDefaultRadius),
                ),
              )
            : null,
      );

  /// An opinionated [ChipThemeData] with custom border radius and rather
  /// involved theme.
  ///
  /// The border radius default to 16 [kDefaultRadius], new M3 default.
  /// https://m3.material.io/components/floating-action-button/specs
  ///
  /// This is inspired by M3 Chip design and applies it to the limited theming
  /// features for old M2 chips, to some extent. Tricky to get this one
  /// to play nicely, but this setup is pretty ok and fits well with the
  /// color blended themes.
  static ChipThemeData chipTheme({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// The style to be applied to the chip's label.
    ///
    /// This only has an effect on label widgets that respect the
    /// [DefaultTextStyle], such as [Text].
    required TextStyle labelStyle,

    /// Corner radius of the Chip.
    ///
    /// Defaults to [kChipRadius] 8.
    final double? radius,
  }) {
    // For all Chips  except disabled Chip.
    final Color foreground = colorScheme.primary
        .blendAlpha(colorScheme.onSurface, kChipForegroundAlphaBlend);
    // For selected InputChip & ChoiceChip.
    final Color selectedBackgroundColor = colorScheme.primary
        .blendAlpha(colorScheme.surface, kChipSelectedBackgroundAlphaBlend);
    // Text color, uses the foreground color for all chip style.
    final TextStyle effectiveLabelStyle =
        labelStyle.copyWith(color: foreground);

    return ChipThemeData(
      brightness: ThemeData.estimateBrightnessForColor(colorScheme.primary),
      padding: const EdgeInsets.all(4),
      // For all Chip types, except disabled, InputChip & ChoiceChip.
      backgroundColor: colorScheme.primary
          .blendAlpha(colorScheme.surface, kChipBackgroundAlphaBlend),
      selectedColor: selectedBackgroundColor, // Selected InputChip
      secondarySelectedColor: selectedBackgroundColor, // Selected ChoiceChip
      checkmarkColor: foreground,
      deleteIconColor: colorScheme.primary,
      // Same formula as on Elevated button and ToggleButtons. The Chip has
      // a built in scrim for disabled state, making it look a bit different
      // but it is pretty close.
      disabledColor: colorScheme.primary
          .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
          .withAlpha(kDisabledBackgroundAlpha),
      // Same label style on selected and not selected chips, their different
      // background style make the stand out enough.
      labelStyle: effectiveLabelStyle,
      secondaryLabelStyle: effectiveLabelStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? kChipRadius),
        ),
      ),
    );
  }

  /// An opinionated [CardTheme] with custom corner radius and elevation.
  ///
  /// Corner [radius] defaults to [kCardRadius] (12) and [elevation]
  /// defaults to [kCardElevation] (0).
  ///
  /// The corner radius 12 is the new default on Cards in M3:
  /// https://m3.material.io/components/cards/specs
  static CardTheme cardTheme({
    /// Corner radius
    ///
    /// Defaults to [kCardRadius] 12.
    final double? radius,

    /// Card elevation defaults to 0.
    final double elevation = kCardElevation,

    /// The clipBehaviour of the card theme, defaults to
    /// [Clip.antiAlias] for smooth clipping with rounded corners.
    ///
    /// There is no config property in [FlexSubThemesData] for [clipBehavior].
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      CardTheme(
        clipBehavior: clipBehavior,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kCardRadius),
          ),
        ),
      );

  /// An opinionated [PopupMenuThemeData] with custom corner radius.
  ///
  /// Corner [radius] defaults to [kPopupRadius] (10) and [elevation] to
  /// [kPopupMenuElevation] (2), Flutter SDK default is (8).
  ///
  /// When used by [FlexColorScheme] the corner radius of popup menus follows
  /// the global [FlexSubThemeData.defaultRadius] if defined, until and
  /// including 10 dp. After which it stays at 10 dp. If you need a higher
  /// corner radius on popup menus than 10 dp, with [FlexColorScheme]
  /// you will have to explicitly override
  /// [FlexSubThemeData.popupMenuRadius].
  ///
  /// It will not look very good when it is
  /// over 10dp. The highlight inside the menu will start to overflow the
  /// corners and is not clipped along the border radius. The underlying Widget
  /// is not designed with this high border rounding in mind. This makes sense
  /// since it does not look good with too much rounding on a small menu.
  ///
  /// The built-in behavior in FlexColorScheme allows it to match at low
  /// inherited radius values from [FlexSubThemeData.defaultRadius] but to
  /// also stay below the usable max rounding automatically at higher global
  /// border radius values.
  ///
  /// The default corner radius in M3 is not yet known, it might be 12  like
  /// on Card, but with current behaviour on popup menu Overlay in Flutter
  /// using 12 was not on option, 10 was the highest value that still worked
  /// OK visually with regards to highlighted item not be clipped on top and
  /// bottom choice.
  static PopupMenuThemeData popupMenuTheme({
    /// Popup menu corner radius.
    ///
    /// Defaults to [kPopupRadius] 10.
    final double? radius,

    /// Popup menu elevation defaults to 3, making it more subtle.
    final double elevation = kPopupMenuElevation,

    /// The background color of the popup menu.
    final Color? color,
  }) =>
      PopupMenuThemeData(
        elevation: elevation,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kPopupRadius),
          ),
        ),
      );

  // TODO(rydmike): DropdownButton, does it need something?

  // TODO(rydmike): M3 dialog content padding? Apply when SDK supports it.

  /// An opinionated [DialogTheme] with custom corner radius and elevation.
  ///
  /// Corner [radius] defaults to [kDialogRadius] (28) and [elevation] to
  /// [kDialogElevation] (10).
  ///
  /// The default radius follows Material M3 guide:
  /// https://m3.material.io/components/dialogs/specs
  static DialogTheme dialogTheme({
    /// Corner radius.
    ///
    /// Defaults to [kDialogRadius] 28.
    final double? radius,

    /// Dialog elevation defaults to 10.
    final double? elevation = kDialogElevation,

    /// Dialog background color.
    ///
    /// Defaults to null and gets default via Dialog's default null theme
    /// behavior.
    ///
    /// This property is here so we can provide a custom themed dialog
    /// background color when the ThemeData property dialogBackgroundColor
    /// is deprecated in Flutter SDK.
    final Color? backgroundColor,
  }) =>
      DialogTheme(
        elevation: elevation,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kDialogRadius),
          ),
        ),
      );

  /// An opinionated [TimePickerThemeData] with custom corner radius.
  ///
  /// Corner [radius] defaults to [kDialogRadius]. The internal shapes
  /// in the picker also have rounding, their corner radii are defined by
  /// [elementRadius] that defaults to [kCardRadius] 12.
  ///
  /// In the InputDecorator, if you pass it an input decoration style
  /// that matches the main input decoration style and corner rounding it
  /// will be used on the data entry elements in the picker.
  static TimePickerThemeData timePickerTheme({
    /// Pass the value the `theme.dialogColor` that is set to your `ThemeData`
    /// and used by other dialogs.
    ///
    /// If null, this dialog defaults to using to surface color and it may
    /// not match dialogColor used by other dialogs.
    ///
    /// FlexColorScheme sub-theming uses this property to match the background
    /// color to other dialogs.
    final Color? backgroundColor,

    /// Outer corner radius.
    ///
    /// Defaults to [kDialogRadius] 28.
    final double? radius,

    /// Elements corner radius.
    ///
    /// Defaults to [kCardRadius] 12.
    final double? elementRadius,

    /// An input decoration theme, for the time picker.
    ///
    /// You would typically pass in one that matches the main used input
    /// decoration theme in order to get same input style with possible
    /// rounding used in the app otherwise too on input fields.
    ///
    /// It adds the custom overrides to the passed in decorator that widget
    /// does internally to the default null InputDecorationTheme, so there is
    /// no need to add those in the passed in InputDecorationTheme. Just pass
    /// in your overall used app InputDecorationTheme.
    final InputDecorationTheme? inputDecorationTheme,
  }) =>
      TimePickerThemeData(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? kDialogRadius),
          ),
        ),
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(elementRadius ?? kCardRadius),
          ),
        ),
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(elementRadius ?? kCardRadius),
          ),
        ),
        // Custom additions the Widget does internally, but for some reason
        // only does to null default theme. If you use a custom decorator
        // you are supposed to know that you have to add these shenanigans
        // for it to work and look right.
        inputDecorationTheme: inputDecorationTheme?.copyWith(
              contentPadding: EdgeInsets.zero,
              // Prevent the error text from appearing.
              // See https://github.com/flutter/flutter/issues/54104
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ) ??
            const InputDecorationTheme().copyWith(
              contentPadding: EdgeInsets.zero,
              // Prevent the error text from appearing.
              // See https://github.com/flutter/flutter/issues/54104
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
      );

  // TODO(rydmike): SnackBar needs two corner radius versions, but how?
  // The pinned one should not have a shape, but the floating one should.
  // Doable via themes? Might not be, if it can be then the floating one.
  // should follow the globally themed corner radius setting and pinned one
  // remain straight.
  // Maybe open an issue about the limitation that corner radius on none
  // pinned one cannot be changed via theme while keeping straight one
  // straight.

  // TODO(rydmike): Check snackbar background color, can I add a demo of it?

  /// An opinionated [SnackBarThemeData] with custom elevation.
  ///
  /// Its [elevation] defaults to [kSnackBarElevation] (4).
  static SnackBarThemeData snackBarTheme({
    /// SnackBar elevation defaults to [kSnackBarElevation] 4.
    final double? elevation = kSnackBarElevation,
  }) =>
      SnackBarThemeData(
        elevation: elevation,
      );

  /// An opinionated [BottomSheetThemeData] with custom top corner
  /// radius.
  ///
  /// Corner `radius` defaults to [kDefaultRadius] (16), `elevation` to
  /// [kBottomSheetElevation] (4) and `modalElevation` to
  /// [kBottomSheetModalElevation] (12).
  static BottomSheetThemeData bottomSheetTheme({
    /// The corner radius defaults to 16 for the top corners.
    final double? radius,

    /// The bottom sheet elevation defaults to 4.
    final double elevation = kBottomSheetElevation,

    /// The bottom sheet elevation defaults to 8.
    final double modalElevation = kBottomSheetModalElevation,

    /// The clipBehaviour of the bottom sheet theme, defaults to
    /// [Clip.antiAlias] for smooth clipping with rounded corners.
    ///
    /// This property is no available in [FlexSubThemeData] but you can use
    /// it if you otherwise use this as theme helper.
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      BottomSheetThemeData(
        clipBehavior: clipBehavior,
        elevation: elevation,
        modalElevation: modalElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius ?? kDefaultRadius),
            topRight: Radius.circular(radius ?? kDefaultRadius),
          ),
        ),
      );

  /// An opinionated [BottomNavigationBarThemeData] with custom elevation.
  ///
  /// Its `elevation` defaults to [kBottomNavigationBarElevation] (0).
  ///
  /// The bottom navigation bar uses opinionated colors choices for the passed
  /// in [ColorScheme] in [colorScheme], to style the bottom navigation bar.
  ///
  /// Background [opacity] can be set. Unselected items' color, that is
  /// background based can receive a variable blend of primary color using
  /// the [unselectedAlphaBlend] property.
  static BottomNavigationBarThemeData bottomNavigationBar({
    /// Typically the same [ColorScheme] that is also use for your [ThemeData].
    required final ColorScheme colorScheme,

    /// BottomNavigationBar elevation
    ///
    /// Defaults to [kBottomNavigationBarElevation] = 0.
    final double elevation = kBottomNavigationBarElevation,

    /// BottomNavigationBar background opacity.
    ///
    /// Default to 1, fully opaque.
    final double opacity = 1,

    /// The onBackground primary alpha blend value for unselected item.
    ///
    /// Defaults to 0x00, no blend of primary, use onBackground color as is.
    /// FlexColorScheme uses value [kUnselectedBackgroundPrimaryAlphaBlend] when
    /// it uses this sub theme.
    final int unselectedAlphaBlend = 0x00,

    /// The alpha value for unselected item.
    ///
    /// Defaults to 0xFF, fully opaque.
    /// FlexColorScheme uses value [kUnselectedBackgroundPrimaryAlphaBlend] when
    /// it uses this sub theme.
    final int unselectedAlpha = 0xFF,

    /// The arrangement of the bar's [items] when the enclosing
    /// [MediaQueryData.orientation] is [Orientation.landscape].
    ///
    /// The following alternatives are supported:
    ///
    /// * [BottomNavigationBarLandscapeLayout.spread] - the items are
    ///   evenly spaced and spread out across the available width. Each
    ///   item's label and icon are arranged in a column.
    /// * [BottomNavigationBarLandscapeLayout.centered] - the items are
    ///   evenly spaced in a row but only consume as much width as they
    ///   would in portrait orientation. The row of items is centered within
    ///   the available width. Each item's label and icon are arranged
    ///   in a column.
    /// * [BottomNavigationBarLandscapeLayout.linear] - the items are
    ///   evenly spaced and each item's icon and label are lined up in a
    ///   row instead of a column.
    ///
    /// Defaults to [BottomNavigationBarLandscapeLayout.spread].
    final BottomNavigationBarLandscapeLayout landscapeLayout =
        BottomNavigationBarLandscapeLayout.spread,
  }) =>
      BottomNavigationBarThemeData(
        elevation: elevation,
        backgroundColor: colorScheme.background.withOpacity(opacity),
        landscapeLayout: landscapeLayout,
        selectedItemColor: colorScheme.primary,
        selectedIconTheme: IconThemeData(
          color: colorScheme.primary,
        ),
        unselectedItemColor: colorScheme.onBackground
            .blendAlpha(colorScheme.primary, unselectedAlphaBlend)
            .withAlpha(unselectedAlpha),
        unselectedIconTheme: IconThemeData(
          color: colorScheme.onBackground
              .blendAlpha(colorScheme.primary, unselectedAlphaBlend)
              .withAlpha(unselectedAlpha),
        ),
      );
}
