import 'package:flutter/material.dart';

import 'flex_constants.dart';
import 'flex_extensions.dart';

// ignore_for_file: comment_references

/// Static helpers for opt-in sub-theming offered by [FlexColorScheme].
///
/// FlexSubTheme offers opinionated static theme helpers that are opt-in via
/// FlexColorScheme(subThemesOptIn: true). You can also configure the
/// default of the opt in setup by defining custom configuration values in the
/// [FlexSubThemeConfig] configuration class, and passing it to the
/// FlexColorScheme(subThemeConfig) constructor property.
///
/// The configuration class [FlexSubThemeConfig] offers simple configuration
/// properties for using the sub-themes in FlexColorScheme. You can also use
/// the static sub-themes without using FlexColorScheme based theming,
/// however the [FlexSubThemeConfig] has no impact on the static helpers it
/// is [FlexColorScheme] to uses the [FlexSubThemeConfig] class to configure
/// the opt in sub-themes. You can do the too if you  [FlexSubThemeConfig]
/// outside of [FlexColorScheme] or in copyWith on each sub-theme in more
/// custom [ThemeData].
///
/// Sub-themes for the following widgets are provided via an opt-in flag in
/// [FlexColorScheme]:
/// * [BottomSheet]
/// * [BottomNavigationBar]
/// * [SnackBar]
/// * [Card]
/// * [Dialog]
/// * [TimePickerDialog]
/// * [PopupMenuButton]
/// * [InputDecoration]
/// * [ElevatedButton]
/// * [OutlinedButton]
/// * [TextButton]
/// * [ToggleButtons]
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
/// The theme [ButtonTextTheme] is also included to provide a very similar
/// theme style on the deprecated legacy buttons `RaisedButton`,
/// `OutlineButton` and `FlatButton` as on the current main buttons. It is again
/// not an exact match, since the legacy buttons do not offer as flexible
/// styling as the newer buttons. They follow and matches the styling on
/// [ToggleButtons] when it comes to hover, press, selected and focus.
///
/// The follow Widgets that have rounded corners are on purpose excluded from
/// these sub-themes:
/// * [Tooltip], generally so small that larger prominent rounding this
///   opinionated sub-theming is designed for is not a good fit.
///   FlexColorScheme does include out of the box theming options for tooltips,
///   that you can override with [ThemeData.copyWith].
/// * [Chip], the Chips are designed to primarily use [StadiumBorder], which
///   fit as they are, also in themes with more rounded corners.
/// * [Scrollbar], rounding on edges of scrollbars are left to platform default.
/// * [AppBar] and [BottomAppBar] shape properties are left to their defaults.
/// * [FloatingActionButton], is best kept round or stadium shaped, it is
///   left to its defaults.
/// * [SnackBar] the floating snackbar should be sub-themed to include border
///   radius via shared default, but the none floating one should not be.
class FlexSubThemes {
  FlexSubThemes._(); // coverage:ignore-line

  /// An opinionated [BottomSheetThemeData] with custom top corner
  /// radius.
  ///
  /// Corner `radius` defaults to [kCornerRadius] (16), `elevation` to
  /// [kBottomSheetElevation] (4) and `modalElevation` to
  /// [kBottomSheetModalElevation] (12).
  static BottomSheetThemeData bottomSheetTheme({
    /// The corner radius defaults to 16 for the top corners.
    final double radius = kCornerRadius,

    /// The bottom sheet elevation defaults to 4.
    final double elevation = kBottomSheetElevation,

    /// The bottom sheet elevation defaults to 12.
    final double modalElevation = kBottomSheetModalElevation,

    /// The clipBehaviour of the bottom sheet theme, defaults to
    /// [Clip.antiAlias] for smooth clipping with rounded corners.
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      BottomSheetThemeData(
        // TODO(rydmike): Not available in FlexSubThemeConfig, maybe add later.
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

  /// An opinionated [BottomNavigationBarThemeData] with custom elevation.
  ///
  /// Its `elevation` defaults to [kBottomNavigationBarElevation] (0).
  static BottomNavigationBarThemeData bottomNavigationBar({
    /// BottomNavigationBar elevation defaults to 0.
    final double? elevation = kBottomNavigationBarElevation,

    /// BottomNavigationBar background color.
    final Color? backgroundColor,

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
    /// If this property is null, then the value of the enclosing
    /// [BottomNavigationBarThemeData.landscapeLayout is used. If that
    /// property is also null, then
    /// [BottomNavigationBarLandscapeLayout.spread] is used.
    ///
    /// This property is null by default.
    final BottomNavigationBarLandscapeLayout? landscapeLayout,
  }) =>
      BottomNavigationBarThemeData(
        elevation: elevation,
        backgroundColor: backgroundColor,
        landscapeLayout: landscapeLayout,
      );

  // TODO(rydmike): SnackBar needs two corner radius versions, how-to?
  // The pinned should not have a shape, but the floating one should.
  // Doable via themes? Might not be, if it can be then the floating one.
  // should follow the globally themed corner radius setting.

  /// An opinionated [SnackBarThemeData] with custom elevation.
  ///
  /// Its `elevation` defaults to [kSnackBarElevation] (4).
  static SnackBarThemeData snackBarTheme({
    /// BottomNavigationBar elevation defaults to 4.
    final double? elevation = kSnackBarElevation,
  }) =>
      SnackBarThemeData(
        elevation: elevation,
      );

  /// An opinionated [CardTheme] with custom corner radius and elevation.
  ///
  /// Corner `radius` to [kCornerRadius] (16) and `elevation` defaults to
  /// [kCardElevation] (0).
  static CardTheme cardTheme({
    /// Corner radius defaults to 16.
    final double radius = kCornerRadius,

    /// Card elevation defaults to 0.
    final double elevation = kCardElevation,

    /// The clipBehaviour of the card theme, defaults to
    /// [Clip.antiAlias] for smooth clipping with rounded corners.
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      CardTheme(
        // TODO(rydmike): Not available in FlexSubThemeConfig, maybe add later.
        clipBehavior: clipBehavior,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      );

  /// An opinionated [DialogTheme] with custom corner radius and elevation.
  ///
  /// Corner `radius` defaults to [kCornerRadius] (16) and `elevation` to
  /// [kDialogElevation] (12).
  static DialogTheme dialogTheme({
    /// Corner radius defaults to 16.
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

  /// An opinionated [PopupMenuThemeData] with custom corner radius.
  ///
  /// Corner `radius` defaults to [kCornerRadius] (16) and `elevation` to
  /// [kPopupMenuElevation] (2), Flutter SDK default is (8).
  ///
  /// When used by [FlexColorScheme] the corner radius of popup menus follows
  /// the global [FlexSubThemeData.cornerRadius] until and including 10 dp.
  /// After which it stays at 10 dp. If you need a higher corner radius on
  /// popup menus than 10 dp, when this function is used by [FlexColorScheme]
  /// you will have to explicitly override
  /// [FlexSubThemeData.cornerRadiusPopupMenuButton]. It will not look very
  /// good, the highlight inside the menu will start to overflow the corners and
  /// it is not clipped along the border radius. The underlying Widget is not
  /// designed with this high border rounding in mind, which makes sense since
  /// it does not look good with too much rounding on a small menu.
  ///
  /// The built-in behavior in FlexColorScheme allows it to match at low
  /// inherited radius values but to also stay below the usable max rounding
  /// automatically at higher global border radius values.
  static PopupMenuThemeData popupMenuTheme({
    /// Popup menu corner radius defaults to 16.
    final double radius = kCornerRadius,

    /// Popup menu elevation defaults to 2, making it more subtle.
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

  /// An opinionated [TimePickerThemeData] with custom corner radius.
  ///
  /// Corner `radius` defaults to [kCornerRadius], also on internal elements,
  /// in on InputDecorator if you also pass it an input decoration style
  /// that matches the main input decoration style and corner rounding.
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

    /// The time picker corner radius defaults to 16 on all its elements.
    final double radius = kCornerRadius,

    /// An input decoration theme, for the time picker.
    ///
    /// You would typically pass in one that matches the main used input
    /// decoration theme in order to get same input style with possible
    /// rounding used in the app otherwise too on input fields.
    ///
    /// It adds the custom overrides the passed in decorator that Widget
    /// does internally to the default InputDecorationTheme, so there is no
    /// need to add those in the passed in InputDecorationTheme. Just pass
    /// in your overall used app InputDecorationTheme.
    final InputDecorationTheme? inputDecorationTheme,
  }) =>
      TimePickerThemeData(
        backgroundColor: backgroundColor,
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

  /// An opinionated [OutlineInputBorder] or [UnderlineInputBorder] using
  /// [InputDecorationTheme], with optional fill color and adjustable
  /// corner radius.
  ///
  /// Requires the `fillColor` and a `ColorScheme`. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// Its corner `radius` can be adjusted, it defaults to [kCornerRadius] (16).
  static InputDecorationTheme inputDecorationTheme({
    /// Typically the same `ColorScheme` that is also use for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// Corner radius defaults to 16.
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

    /// Fill color used to fill the `InputDecorator` background with, when
    /// `filled` is true.
    ///
    /// Defaults to `colorScheme.primary.withOpacity(0.08)` if null.
    final Color? fillColor,

    /// The border width when the input is selected.
    ///
    /// Defaults to 2.0.
    final double focusedBorderWidth = kThickBorderWidth,

    /// The border width when the input is unselected or disabled.
    ///
    /// Defaults to 1.5.
    final double unfocusedBorderWidth = kThinBorderWidth,

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
        fillColor ?? colorScheme.primary.withOpacity(kHoverBackgroundOpacity);
    return useOutlinedBorder
        ? InputDecorationTheme(
            filled: filled,
            fillColor: _fillColor,
            hoverColor:
                colorScheme.primary.withOpacity(kHoverBackgroundOpacity),
            focusColor:
                colorScheme.primary.withOpacity(kFocusBackgroundOpacity),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: focusedBorderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: unfocusedHasBorder
                  ? BorderSide(
                      color: colorScheme.primary
                          .withOpacity(kEnabledBorderOpacity),
                      width: unfocusedBorderWidth,
                    )
                  : BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: unfocusedHasBorder
                  ? BorderSide(
                      color: colorScheme.onSurface
                          .withOpacity(kDisabledBackgroundOpacity),
                      width: unfocusedBorderWidth,
                    )
                  : BorderSide.none,
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
            hoverColor:
                colorScheme.primary.withOpacity(kHoverBackgroundOpacity),
            focusColor:
                colorScheme.primary.withOpacity(kFocusBackgroundOpacity),
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
              borderSide: unfocusedHasBorder
                  ? BorderSide(
                      color: colorScheme.primary
                          .withOpacity(kEnabledBorderOpacity),
                      width: unfocusedBorderWidth,
                    )
                  : BorderSide.none,
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
              borderSide: unfocusedHasBorder
                  ? BorderSide(
                      color: colorScheme.onSurface
                          .withOpacity(kDisabledBackgroundOpacity),
                      width: unfocusedBorderWidth,
                    )
                  : BorderSide.none,
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

  /// An opinionated [ElevatedButtonThemeData] theme.
  ///
  /// Requires a `ColorScheme`. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The button `elevation` defaults to 0, making the elevated button flat,
  /// with only elevation on hover and press. Flutter SDK ElevatedButton
  /// defaults to elevation 2.
  ///
  /// The button corner `radius` defaults to 16, Flutter SDK to 4.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is used to make the buttons more prominent and buttons with
  /// rounded corners need a bit more padding to look nice.
  ///
  /// Buttons also have a default minimum size equal to Size(48, 48) which is
  /// the recommended minimum Material tap size.
  static ElevatedButtonThemeData elevatedButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The button corner radius, defaults to 16.
    final double radius = kCornerRadius,

    /// The button elevation defaults to 0, making it flat with primary color.
    /// (Flutter SDK ElevatedButton default to 2).
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
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.onSurface
                    .withOpacity(kDisabledForegroundOpacity);
              }
              return colorScheme.onPrimary;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.onSurface
                    .withOpacity(kDisabledBackgroundOpacity);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.onPrimary
                    .withOpacity(kHoverBackgroundOpacity);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.onPrimary
                    .withOpacity(kFocusBackgroundOpacity);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.onPrimary
                    .withOpacity(kPressedBackgroundOpacity);
              }
              return Colors.transparent;
            },
          ),
        ),
      );

  /// A slightly opinionated [OutlinedButtonThemeData] theme.
  ///
  /// Requires a `ColorScheme`. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The button corner `radius` defaults to 16, Flutter SDK to 4.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is used to make the buttons more prominent and buttons with
  /// rounded corners need a bit more padding to look nice.
  ///
  /// Buttons also have a default minimum size equal to Size(48, 48) which is
  /// the recommended minimum Material tap size.
  static OutlinedButtonThemeData outlinedButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,

    /// The button corner radius, defaults to 16.
    final double radius = kCornerRadius,

    /// The outline thickness when the button is pressed.
    ///
    /// Defaults to 2.0.
    final double pressedOutlineWidth = kThickBorderWidth,

    /// The outline thickness when the button is not selected.
    ///
    /// Defaults to 1.5.
    final double outlineWidth = kThinBorderWidth,

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
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.onSurface
                    .withOpacity(kDisabledForegroundOpacity);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withOpacity(kHoverBackgroundOpacity);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withOpacity(kFocusBackgroundOpacity);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary
                    .withOpacity(kPressedBackgroundOpacity);
              }
              return Colors.transparent;
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide?>(
            (final Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: colorScheme.onSurface
                      .withOpacity(kDisabledBackgroundOpacity),
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
                color: colorScheme.primary.withOpacity(kEnabledBorderOpacity),
                width: outlineWidth,
              );
            },
          ),
        ),
      );

  /// A slightly opinionated [TextButtonThemeData] theme.
  ///
  /// Requires a `ColorScheme`. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The button corner `radius` defaults to 16, Flutter SDK to 4.
  ///
  /// The button `padding` defaults to: EdgeInsets.symmetric(horizontal: 16).
  /// It is used to make the buttons more prominent and buttons with
  /// rounded corners need a bit more padding to look nice.
  ///
  /// Buttons also have a default minimum size equal to Size(48, 48) which is
  /// the recommended minimum Material tap size.
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
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withOpacity(kHoverBackgroundOpacity);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withOpacity(kFocusBackgroundOpacity);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary
                    .withOpacity(kPressedBackgroundOpacity);
              }
              return Colors.transparent;
            },
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
        hoverColor: colorScheme.primary
            .blend(Colors.white, kHoverAlphaBlend)
            .withOpacity(kHoverOpacity),
        focusColor: colorScheme.primary
            .blend(Colors.white, kFocusAlphaBlend)
            .withOpacity(kFocusOpacity),
        highlightColor: colorScheme.primary
            .blend(Colors.white, kHighlightAlphaBlend)
            .withOpacity(kHighlightOpacity),
        splashColor: colorScheme.primary
            .blend(Colors.white, kSplashAlphaBlend)
            .withOpacity(kSplashOpacity),
        disabledColor:
            colorScheme.onSurface.withOpacity(kDisabledBackgroundOpacity),
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
    final double borderWidth = kThinBorderWidth,

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
      selectedColor: colorScheme.onPrimary,
      color: colorScheme.primary,
      fillColor: colorScheme.primary,
      borderColor: colorScheme.primary.withOpacity(kEnabledBorderOpacity),
      selectedBorderColor: colorScheme.primary,
      hoverColor: colorScheme.primary
          .blend(Colors.white, kHoverAlphaBlend)
          .withOpacity(kHoverOpacity),
      focusColor: colorScheme.primary
          .blend(Colors.white, kFocusAlphaBlend)
          .withOpacity(kFocusOpacity),
      highlightColor: colorScheme.primary
          .blend(Colors.white, kHighlightAlphaBlend)
          .withOpacity(kHighlightOpacity),
      splashColor: colorScheme.primary
          .blend(Colors.white, kSplashAlphaBlend)
          .withOpacity(kSplashOpacity),
      disabledColor:
          colorScheme.onSurface.withOpacity(kDisabledForegroundOpacity),
      disabledBorderColor:
          colorScheme.onSurface.withOpacity(kDisabledBackgroundOpacity),
      borderRadius: BorderRadius.circular(radius),
      constraints: BoxConstraints(
        // ToggleButtons draws its border outside its constraints, the
        // ShapeBorder on ElevatedButton, OutlinedButton and TextButton keep
        // their border inside its size constraints, to make ToggleButtons
        // same sized, we must adjust the min size shared constraint with
        // the border width for every side as well as make the VisualDensity
        // adjustment that the other buttons do via Theme automatically
        // based on theme setting, to do so this theme can accept a
        // VisualDensity property. Give the the same value that your theme
        // uses, defaults to ThemeData default.
        minWidth: minButtonSize.width -
            borderWidth * 2 +
            _visualDensity.baseSizeAdjustment.dx,
        minHeight: minButtonSize.height -
            borderWidth * 2 +
            _visualDensity.baseSizeAdjustment.dy,
      ),
    );
  }
}
