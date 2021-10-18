import 'package:flutter/material.dart';

import 'flex_constants.dart';
import 'flex_extensions.dart';

/// Static helpers for opt-in sub-theming offered by FlexColorScheme.
///
/// FlexSubTheme contains opinionated static theme helpers that are opt-in via
/// FlexColorScheme(subThemesOptIn: true), you can also configure the
/// default of the opt-in setup by defining custom values in a
/// FlexSubThemeConfig parameter class and passing it in to
/// FlexColorScheme(subThemeConfig) constructor parameter.
///
/// simple properties in FlexColorScheme. You can also use them without
/// using FlexColorScheme based themes.
///
/// The following sub-theme are provided via an opt-in flag:
/// * [BottomSheet]
/// * [BottomNavigationBar]
/// * [Card]
/// * [Dialog]
/// * [PopupMenuButton]
/// * [TimePickerDialog]
/// * [InputDecoration]
/// * [ElevatedButton]
/// * [OutlinedButton]
/// * [TextButton]
/// * [ToggleButtons]
/// * The theme [ButtonTextTheme] still provides styling support the deprecated
///   legacy buttons if they are used.
///
///
/// The follow Widgets that have rounded corner are on purpose excluded:
/// * [Tooltip], they are generally so small that the larger prominent
///   rounding this opinionated sub-theming is designed for is not a good fit.
///   FlexColorScheme does include out of the box theming options for tooltips,
///   that you can over ride with [ThemeData.copyWith].
/// * [Chip], the Chips are designed to primarily use [StadiumBorder], which
///   fit as they are, also in themes with more rounded corners.
/// * [Scrollbar], rounding on edges of scrollbars are left to platform default.
/// * [AppBar] and [BottomAppBar] shape properties are left to their defaults.
/// * [FloatingActionButton], is best kept round, left to its defaults.
/// * [SnackBar] the floating snackbar should be sub-themed, but maybe not the
///   the none floating one.
class FlexSubTheme {
  FlexSubTheme._(); // coverage:ignore-line

  // TODO(rydmike): Add SnackBarThemeData? Needs two versions though, how-to?

  /// A slightly opinionated [BottomSheetThemeData] with custom top corner
  /// radius.
  ///
  /// Its top corner `radius` defaults to [kCornerRadius].
  static BottomSheetThemeData bottomSheetTheme({
    /// The corner radius defaults to 16 for the top corners.
    final double radius = kCornerRadius,

    /// The bottom sheet elevation defaults to 4.
    final double elevation = kBottomSheetElevation,

    /// The bottom sheet elevation defaults to 12.
    final double modalElevation = kBottomSheetModalElevation,

    /// The clipBehaviour of the bottom sheet theme, defaults to
    /// Clip.antiAlias for a nice clip when using rounded corners.
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      BottomSheetThemeData(
        clipBehavior: clipBehavior,
        elevation: elevation,
        modalElevation: modalElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
        ),
      );

  /// A slightly opinionated [BottomNavigationBarThemeData] with custom
  /// elevation.
  ///
  /// Its `elevation` defaults to [kBottomNavigationBarElevation].
  static BottomNavigationBarThemeData bottomNavigationBar({
    /// BottomNavigationBar elevation defaults to 0.
    final double? elevation = kBottomNavigationBarElevation,
  }) =>
      BottomNavigationBarThemeData(
        elevation: elevation,
      );

  /// A slightly opinionated [CardTheme] with custom corner radius and
  /// elevation.
  ///
  /// Its `elevation` defaults to [kCardElevation] and
  /// corner `radius` to [kCornerRadius].
  static CardTheme cardTheme({
    /// The corner radius defaults to 16.
    final double radius = kCornerRadius,

    /// The card elevation defaults to 0.
    final double elevation = kCardElevation,

    /// The clipBehaviour of the card theme, defaults to Clip.antiAlias
    /// for nice clip on rounded corners.
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      CardTheme(
        // TODO(rydmike): Not available in FlexSubThemeConfig, add later?
        clipBehavior: clipBehavior,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      );

  /// A slightly opinionated [DialogTheme] with custom corner radius and
  /// elevation.
  ///
  /// Its corner `radius` defaults to [kCornerRadius] and `elevation` to
  /// [kDialogElevation].
  static DialogTheme dialogTheme({
    /// The corner radius defaults to 16.
    final double radius = kCornerRadius,

    /// Dialog elevation defaults to 12.
    final double? elevation = kDialogElevation,
  }) =>
      DialogTheme(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      );

  /// A slightly opinionated [PopupMenuThemeData] with custom corner radius.
  ///
  /// Its corner `radius` defaults to [kCornerRadius] and `elevation` to
  /// [kPopupMenuElevation].
  static PopupMenuThemeData popupMenuTheme({
    /// The popup menu corner radius defaults to 16.
    final double radius = kCornerRadius,

    /// The elevation defaults to 2, making it much less pronounced.
    final double elevation = kPopupMenuElevation,
  }) =>
      PopupMenuThemeData(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      );

  /// A slightly opinionated [TimePickerThemeData] with custom corner radius.
  ///
  /// All its corner `radius` defaults to [kCornerRadius].
  ///
  /// Typically you would also pass it an input decoration style that matches
  /// the main input decoration style and corner rounding.
  static TimePickerThemeData timePickerTheme({
    /// The time picker corner radius defaults to 16 on all its elements.
    final double radius = kCornerRadius,

    /// An input decoration theme, for the time picker.
    ///
    /// It typically matches the main used input decoration theme in order to
    /// get same input style with possible rounding used in the app otherwise
    /// too.
    ///
    /// It includes the customization override the Widget does internally to
    /// the default InputDecorationTheme, so there is no need to add those
    /// via custom InputDecorationTheme, just pass in your overall used app
    /// InputDecorationTheme.
    final InputDecorationTheme? inputDecorationTheme,
  }) =>
      TimePickerThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
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

  /// A slightly opinionated [OutlineInputBorder] using [InputDecorationTheme],
  /// with fill color and adjustable corner radius.
  ///
  /// Requires the `fillColor` and a `ColorScheme`. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// Its corner `radius` can be adjusted, it defaults to 16.
  static InputDecorationTheme inputDecorationTheme({
    /// Typically the same `ColorScheme` that is also use for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The corner radius defaults to 16.
    final double radius = kCornerRadius,

    /// Use outlined input border, instead of underline input border.
    ///
    /// Defaults to true.
    final bool useOutlinedBorder = true,

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

    /// Fill color use to fill `InputDecorator` with, when `filled` is true.
    ///
    /// Defaults to `colorScheme.primary.withOpacity(0.075)` if null.
    final Color? fillColor,

    /// The outline border when the input is selected.
    ///
    /// Defaults to 1.5.
    final double focusedBorderWidth = kThickOutlineWidth,

    /// The outline border when the input is unselected or disabled.
    ///
    /// Defaults to 1.0.
    final double unfocusedBorderWidth = kThinOutlineWidth,
  }) {
    final Color _fillColor =
        fillColor ?? colorScheme.primary.withOpacity(0.075);
    return useOutlinedBorder
        ? InputDecorationTheme(
            filled: filled,
            fillColor: _fillColor,
            hoverColor: colorScheme.primary.withOpacity(0.1),
            focusColor: colorScheme.primary.withOpacity(0.15),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: focusedBorderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                color: colorScheme.primary.withOpacity(0.65),
                width: unfocusedBorderWidth,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                color: colorScheme.onSurface.withOpacity(0.12),
                width: unfocusedBorderWidth,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: focusedBorderWidth,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: unfocusedBorderWidth,
              ),
            ),
          )
        : InputDecorationTheme(
            filled: filled,
            fillColor: _fillColor,
            hoverColor: colorScheme.primary.withOpacity(0.1),
            focusColor: colorScheme.primary.withOpacity(0.15),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: focusedBorderWidth,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
              borderSide: BorderSide(
                color: colorScheme.primary.withOpacity(0.65),
                width: unfocusedBorderWidth,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
              borderSide: BorderSide(
                color: colorScheme.onSurface.withOpacity(0.12),
                width: unfocusedBorderWidth,
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: focusedBorderWidth,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: unfocusedBorderWidth,
              ),
            ),
          );
  }

  /// A slightly opinionated [ElevatedButtonThemeData] theme.
  ///
  /// The adjustable `elevation` defaults to 0, making the default elevated
  /// button style flat, having only ink effects.
  ///
  /// The adjustable button corner `radius` default to 16.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is intended to make the buttons more prominent and buttons with
  /// rounded corners need a bit more padding to look nice.
  static ElevatedButtonThemeData elevatedButtonTheme({
    // /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    // required final ColorScheme colorScheme,

    /// The button corner radius, defaults to 16.
    final double radius = kCornerRadius,

    /// The button elevation defaults to 0, making it flat with primary color.
    final double elevation = kElevatedButtonElevation,

    /// Padding defaults to EdgeInsets.symmetric(horizontal: 16).
    final EdgeInsetsGeometry padding = kButtonPadding,

    /// Minimum button size.
    ///
    /// Defaults to Size(48, 48).
    final Size minButtonSize = kMinButtonSize,
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: minButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ), //buttonShape,
          padding: padding,
          elevation: elevation,
        ),
      );

  /// A slightly opinionated [OutlinedButtonThemeData] theme.
  ///
  /// Requires a `ColorScheme`. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The adjustable button corner `radius` default to 16.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is intended to make the buttons more prominent and buttons with
  /// rounded corners need a bit more padding to look nice.
  static OutlinedButtonThemeData outlinedButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The button corner radius, defaults to 16.
    final double radius = kCornerRadius,

    /// The outline thickness when the button is selected.
    ///
    /// Defaults to 1.5.
    final double selectedOutlineThickness = kThickOutlineWidth,

    /// The outline thickness when the button is not selected.
    ///
    /// Defaults to 1.0.
    final double unselectedOutlineThickness = kThinOutlineWidth,

    /// Padding defaults to EdgeInsets.symmetric(horizontal: 16).
    final EdgeInsetsGeometry padding = kButtonPadding,

    /// Minimum button size.
    ///
    /// Defaults to Size(48, 48).
    final Size minButtonSize = kMinButtonSize,
  }) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: minButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ), //buttonShape,
          padding: padding,
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              // coverage:ignore-start
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withOpacity(0.08);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withOpacity(0.1);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withOpacity(0.2);
              }
              // coverage:ignore-end
              return Colors.transparent;
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide?>(
            // coverage:ignore-start
            (final Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: colorScheme.onSurface.withOpacity(0.12),
                  width: unselectedOutlineThickness,
                );
              }
              if (states.contains(MaterialState.error)) {
                return BorderSide(
                  color: colorScheme.error,
                  width: selectedOutlineThickness,
                );
              }

              return BorderSide(
                color: colorScheme.primary,
                width: selectedOutlineThickness,
              );
            },
            // coverage:ignore-end
          ),
        ),
      );

  /// A slightly opinionated [TextButtonThemeData] theme.
  ///
  /// The adjustable button corner `radius` default to 16.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is intended to make the buttons more prominent and buttons with
  /// rounded corners need a bit more padding to look nice.
  static TextButtonThemeData textButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The button corner radius, defaults to 16.
    final double radius = kCornerRadius,

    /// Padding defaults to EdgeInsets.symmetric(horizontal: 16).
    final EdgeInsetsGeometry padding = kButtonPadding,

    /// Minimum button size.
    ///
    /// Defaults to Size(48, 48).
    final Size minButtonSize = kMinButtonSize,
  }) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: minButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ), // buttonShape,
          padding: padding,
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            // coverage:ignore-start
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withOpacity(0.08);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withOpacity(0.1);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withOpacity(0.2);
              }
              return Colors.transparent;
            },
            // coverage:ignore-end
          ),
        ),
      );

  /// A slightly opinionated [ButtonThemeData] theme.
  ///
  /// This theme is used to provide the same opinionated theme and style on
  /// the deprecated buttons `RaisedButton`, `OutlineButtons` and `FlatButton`.
  ///
  /// The adjustable button corner `radius` defaults to 16.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is intended to make the buttons more prominent and buttons with
  /// rounded corners need a bit more padding to look nice.
  static ButtonThemeData buttonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The button corner radius, defaults to 16.
    final double radius = kCornerRadius,

    /// Padding defaults to EdgeInsets.symmetric(horizontal: 16).
    final EdgeInsetsGeometry padding = kButtonPadding,

    /// Minimum button size.
    ///
    /// Defaults to Size(48, 48).
    final Size minButtonSize = kMinButtonSize,
  }) =>
      ButtonThemeData(
        colorScheme: colorScheme,
        minWidth: minButtonSize.width,
        height: minButtonSize.height,
        // Focus, hover, splash, and highlight follow same principle as
        // OutlinedButton, but it is not exactly the same since it also needs
        // to work on primary colored button, but we can only use one color
        // set across all button types. With some alpha blend tricks we can
        // make something that looks fairly similar on all buttons with just one
        // style that the new buttons uses 3 separate style for to make them
        // look even nicer.
        hoverColor:
            colorScheme.primary.blend(Colors.white, 30).withOpacity(0.2),
        focusColor:
            colorScheme.primary.blend(Colors.white, 20).withOpacity(0.25),
        splashColor:
            colorScheme.primary.blend(Colors.white, 30).withOpacity(0.35),
        highlightColor:
            colorScheme.primary.blend(Colors.white, 10).withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        textTheme: ButtonTextTheme.primary,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        padding: padding,
      );

  /// A slightly opinionated [ToggleButtonsThemeData] theme.
  ///
  /// The adjustable button corner `radius` default to 16.
  /// Its buttons border width can be adjusted and defaults to same width
  /// as outline thickness on selected outline button and input decorator.
  ///
  /// Unfortunately [ToggleButtons] cannot be themed to have different border
  /// width in disabled mode than enabled mode, like [OutlinedButton] can.
  /// If it is important that the themed border appears similar to the disabled
  /// border width, then keep the thin and thick outlined borders same or
  /// reasonably close to each other.
  static ToggleButtonsThemeData toggleButtonsTheme({
    /// Typically the same `ColorScheme` that is also use for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The toggle buttons corner radius, defaults to 16.
    final double radius = kCornerRadius,

    /// The width of the borders around the toggle buttons.
    ///
    /// In this design it uses the same default as outline thickness for
    /// selected outline button and input decorator.
    ///
    /// Defaults to 1.5.
    final double borderWidth = kThickOutlineWidth,

    /// Minimum button size.
    ///
    /// Defaults to Size(48, 48).
    final Size minButtonSize = kMinButtonSize,

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
      selectedColor: colorScheme.background,
      color: colorScheme.primary,
      fillColor: colorScheme.primary,
      borderColor: colorScheme.primary,
      selectedBorderColor: colorScheme.primary,
      // Focus, hover, splash, and highlight follow same principle as
      // OutlinedButton, but it is not exactly the same since it also needs
      // to work on primary colored button, but we can only use one color
      // set across all button types. With some alpha blend tricks we can
      // make something that looks fairly similar on all buttons with just one
      // style that the new buttons uses 3 separate style for to make them
      // look even nicer.
      hoverColor: colorScheme.primary.blend(Colors.white, 30).withOpacity(0.2),
      focusColor: colorScheme.primary.blend(Colors.white, 20).withOpacity(0.25),
      splashColor:
          colorScheme.primary.blend(Colors.white, 30).withOpacity(0.35),
      highlightColor:
          colorScheme.primary.blend(Colors.white, 10).withOpacity(0.2),
      // DisabledColor and disabledBorderColor, same color as OutlinedButton.
      disabledColor: colorScheme.onSurface.withOpacity(0.3),
      disabledBorderColor: colorScheme.onSurface.withOpacity(0.12),
      borderRadius: BorderRadius.circular(radius),
      constraints: BoxConstraints.tight(
        // ToggleButtons draws its border outside its constraints, the
        // ShapeBorder on ElevatedButton, OutlinedButton and TextButton keep
        // their border inside its size constraints, to make ToggleButtons
        // same sized, we must adjust the min size shared constraint with
        // the border width for every side as well as make the VisualDensity
        // adjustment that the other buttons do via Theme automatically
        // based on theme setting, to do so this theme can accept a
        // VisualDensity property. Give the the same value that your theme
        // uses, defaults to ThemeData default.
        Size(
          minButtonSize.width -
              borderWidth * 2 +
              _visualDensity.baseSizeAdjustment.dx,
          minButtonSize.height -
              borderWidth * 2 +
              _visualDensity.baseSizeAdjustment.dy,
        ),
      ),
    );
  }
}
