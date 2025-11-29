part of '../flex_sub_themes.dart';

/// A slightly opinionated [DatePickerThemeData] helper for FlexColorScheme.
DatePickerThemeData _datePickerTheme({
  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required final ColorScheme colorScheme,

  /// Dialog background color.
  ///
  /// If null and [backgroundSchemeColor] is also null, then it
  /// gets default via Dialog's default null theme behavior,
  /// which is [surfaceContainerHigh]
  /// in Material-3 mode and in Material-2 mode in light theme
  /// [Colors.white] and in a dark theme [Colors.grey800].
  ///
  /// If [backgroundSchemeColor] is defined, it will override any color
  /// give to [backgroundColor].
  ///
  /// Can be used to make a custom themed dialog with own background color,
  /// even after the [ThemeData.dialogBackgroundColor] property is
  /// is deprecated in Flutter SDK. See
  /// https://github.com/flutter/flutter/issues/91772).
  final Color? backgroundColor,

  /// Selects which color from the passed in colorScheme to use as the dialog
  /// background color.
  ///
  /// If not defined, then the passed in [backgroundColor] will be used,
  /// which may be null too and dialog then falls back to Flutter SDK default
  /// value for DatePickerDialog, which is [surfaceContainerHigh]
  /// in Material-3 mode and in Material-2 mode in light theme
  /// [Colors.white] and in a dark theme [Colors.grey800].
  final SchemeColor? backgroundSchemeColor,

  /// The color of the divider in the [DatePickerDialog].
  ///
  /// If not defined, defaults to [ColorScheme.outlineVariant] in Material-3.
  /// In Material-2 the divider does not exist in the [DatePickerDialog]
  /// build.
  ///
  /// Use [SchemeColor.transparent] to remove the divider in Material-3.
  final SchemeColor? dividerSchemeColor,

  /// Defines the header's default background fill color.
  ///
  /// The dialog's header displays the currently selected date.
  ///
  /// Defaults to [surfaceContainerHigh] in Material-3 and Material-2 mode
  /// to [primary] in light mode and to [surface] in dark mode.
  final SchemeColor? headerBackgroundSchemeColor,

  /// Defines the header's default color used for text labels and icons.
  ///
  /// The dialog's header displays the currently selected date.
  ///
  /// This is used instead of the [TextStyle.color] property of
  /// [headerHeadlineStyle] and [headerHelpStyle].
  ///
  /// If not defined, defaults to correct contrast pair for the used
  /// [headerBackgroundSchemeColor], with a preference to
  /// [SchemeColor.onSurfaceVariant] if any surface color is used as the
  /// background color.
  final SchemeColor? headerForegroundSchemeColor,

  /// Dialog elevation.
  ///
  /// If not defined, defaults to [kDialogElevation] = 6.
  final double? elevation,

  /// Outer corner radius.
  ///
  /// If not defined, defaults to [kDialogRadius] 28dp,
  /// based on M3 Specification
  /// https://m3.material.io/components/dialogs/specs
  final double? radius,

  /// An input decoration theme, for the time picker.
  ///
  /// You would typically pass in one that matches the main used input
  /// decoration theme in order to get same input style with possible
  /// rounding used in the app otherwise on the input fields in the picker.
  ///
  /// It adds the custom overrides to the passed in decorator, that the widget
  /// does internally to the default null InputDecorationThemeData. There is
  /// no need to add those in the passed in InputDecorationThemeData, pass
  /// in your overall used app InputDecorationThemeData.
  final InputDecorationThemeData? inputDecorationTheme,

  /// Set to true to not use the provided [InputDecorationThemeData].
  ///
  /// If this flag is false, the provided [InputDecorationThemeData] is not
  /// used, additionally the theme fix this theme helper does internally is
  /// not applied and pure null value is passed. This enables getting the
  /// default widget behavior input decorator, or opting in on getting the
  /// provided InputDecorationThemeData with the internal style fix for issue
  /// https://github.com/flutter/flutter/issues/54104 applied automatically
  /// to the provided InputDecorationThemeData.
  ///
  /// If not defined, defaults to false.
  final bool? useInputDecoratorTheme,

  /// Overrides the default value of [Dialog.shadowColor].
  final Color? shadowColor,

  /// Overrides the default value of [Dialog.surfaceTintColor].
  final Color? surfaceTintColor,

  /// Overrides the header's default headline text style.
  ///
  /// The dialog's header displays the currently selected date.
  ///
  /// The [TextStyle.color] of the [headerHeadlineStyle] is not used,
  /// [headerForegroundColor] is used instead.
  final TextStyle? headerHeadlineStyle,

  /// Overrides the header's default help text style.
  ///
  /// The help text (also referred to as "supporting text" in the Material
  /// spec) is usually a prompt to the user at the top of the header
  /// (i.e. 'Select date').
  ///
  /// The [TextStyle.color] of the [headerHelpStyle] is not used,
  /// [headerForegroundColor] is used instead.
  ///
  /// See also:
  ///   [DatePickerDialog.helpText], which specifies the help text.
  final TextStyle? headerHelpStyle,

  /// Overrides the default text style used for the row of weekday
  /// labels at the top of the date picker grid.
  final TextStyle? weekdayStyle,

  /// Overrides the default text style used for each individual day
  /// label in the grid of the date picker.
  ///
  /// The [TextStyle.color] of the [dayStyle] is not used,
  /// [dayForegroundColor] is used instead.
  final TextStyle? dayStyle,

  /// Overrides the default color used to paint the day labels in the
  /// grid of the date picker.
  ///
  /// This will be used instead of the color provided in [dayStyle].
  final WidgetStateProperty<Color?>? dayForegroundColor,

  /// Overrides the default color used to paint the background of the
  /// day labels in the grid of the date picker.
  final WidgetStateProperty<Color?>? dayBackgroundColor,

  /// Overrides the default highlight color that's typically used to
  /// indicate that a day in the grid is focused, hovered, or pressed.
  final WidgetStateProperty<Color?>? dayOverlayColor,

  /// Overrides the default shape used to paint the shape decoration of the
  /// day labels in the grid of the date picker.
  ///
  /// If the selected day is the current day, the provided shape with the
  /// value of [todayBackgroundColor] is used to paint the shape decoration of
  /// the day label and the value of [todayBorder] and [todayForegroundColor]
  /// is used to paint the border.
  ///
  /// If the selected day is not the current day, the provided shape with the
  /// value of [dayBackgroundColor] is used to paint the shape decoration of
  /// the day label.
  final WidgetStateProperty<OutlinedBorder?>? dayShape,

  /// Overrides the default color used to paint the
  /// [DatePickerDialog.currentDate] label in the grid of the dialog's
  /// [CalendarDatePicker] and the corresponding year in the dialog's
  /// [YearPicker].
  ///
  /// This will be used instead of the [TextStyle.color] provided in
  /// [dayStyle].
  final WidgetStateProperty<Color?>? todayForegroundColor,

  /// Overrides the default color used to paint the background of the
  /// [DatePickerDialog.currentDate] label in the grid of the date picker.
  final WidgetStateProperty<Color?>? todayBackgroundColor,

  /// Overrides the border used to paint the
  /// [DatePickerDialog.currentDate] label in the grid of the date
  /// picker.
  ///
  /// The border side's [BorderSide.color] is not used,
  /// [todayForegroundColor] is used instead.
  final BorderSide? todayBorder,

  /// Overrides the default text style used to paint each of the year
  /// entries in the year selector of the date picker.
  ///
  /// The [TextStyle.color] of the [yearStyle] is not used,
  /// [yearForegroundColor] is used instead.
  final TextStyle? yearStyle,

  /// Overrides the default color used to paint the year labels in the year
  /// selector of the date picker.
  ///
  /// This will be used instead of the color provided in [yearStyle].
  final WidgetStateProperty<Color?>? yearForegroundColor,

  /// Overrides the default color used to paint the background of the
  /// year labels in the year selector of the of the date picker.
  final WidgetStateProperty<Color?>? yearBackgroundColor,

  /// Overrides the default highlight color that's typically used to
  /// indicate that a year in the year selector is focused, hovered,
  /// or pressed.
  final WidgetStateProperty<Color?>? yearOverlayColor,

  /// Overrides the default [Scaffold.backgroundColor] for
  /// [DateRangePickerDialog].
  final Color? rangePickerBackgroundColor,

  /// Overrides the default elevation of the full screen
  /// [DateRangePickerDialog].
  final double? rangePickerElevation,

  /// Overrides the color of the shadow painted below a full screen
  /// [DateRangePickerDialog].
  final Color? rangePickerShadowColor,

  /// Overrides the default overall shape of a full screen
  /// [DateRangePickerDialog].
  ///
  /// If [elevation] is greater than zero then a shadow is shown and the
  /// shadow's shape mirrors the shape of the dialog.
  final ShapeBorder? rangePickerShape,

  /// Overrides the default background fill color for [DateRangePickerDialog].
  ///
  /// The dialog's header displays the currently selected date range.
  final Color? rangePickerHeaderBackgroundColor,

  /// Overrides the default color used for text labels and icons in
  /// the header of a full screen [DateRangePickerDialog]
  ///
  /// The dialog's header displays the currently selected date range.
  ///
  /// This is used instead of any colors provided by
  /// [rangePickerHeaderHeadlineStyle] or [rangePickerHeaderHelpStyle].
  final Color? rangePickerHeaderForegroundColor,

  /// Overrides the default text style used for the headline text in
  /// the header of a full screen [DateRangePickerDialog].
  ///
  /// The dialog's header displays the currently selected date range.
  ///
  /// The [TextStyle.color] of [rangePickerHeaderHeadlineStyle] is not used,
  /// [rangePickerHeaderForegroundColor] is used instead.
  final TextStyle? rangePickerHeaderHeadlineStyle,

  /// Overrides the default text style used for the help text of the
  /// header of a full screen [DateRangePickerDialog].
  ///
  /// The help text (also referred to as "supporting text" in the Material
  /// spec) is usually a prompt to the user at the top of the header
  /// (i.e. 'Select date').
  ///
  /// The [TextStyle.color] of the [rangePickerHeaderHelpStyle] is not used,
  /// [rangePickerHeaderForegroundColor] is used instead.
  final TextStyle? rangePickerHeaderHelpStyle,

  /// Overrides the default background color used to paint days
  /// selected between the start and end dates in a
  /// [DateRangePickerDialog].
  final Color? rangeSelectionBackgroundColor,

  /// Overrides the default highlight color that's typically used to
  /// indicate that a date in the selected range of a
  /// [DateRangePickerDialog] is focused, hovered, or pressed.
  final WidgetStateProperty<Color?>? rangeSelectionOverlayColor,

  /// Overrides the default style of the cancel button of a
  /// [DatePickerDialog].
  final ButtonStyle? cancelButtonStyle,

  /// Overrides the default style of the confirm (OK) button of a
  /// [DatePickerDialog].
  final ButtonStyle? confirmButtonStyle,

  /// An optional [locale] argument can be used to set the locale for the date
  /// picker. It defaults to the ambient locale provided by [Localizations].
  final Locale? locale,
}) {
// This InputDecorationTheme is here to help work around this issue:
// https://github.com/flutter/flutter/issues/131666
// It is reasonably successful in fixing the issue, but it is not perfect.
  InputDecorationThemeData datePickerDefaultInputDecorationTheme() {
    const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(4.0));
// The input decoration theme is used to style the input fields in the
// date picker dialog. This matches the default input decoration theme
// used by the date picker dialog.
// TODO(rydmike): Check that Flutter's defaults have not changed.
// If it has the changes are probably subtle enough to not matter for now.
    return InputDecorationThemeData(
      filled: false,
      hoverColor: colorScheme.brightness == Brightness.dark
          ? Colors.white.withValues(alpha: 0.04)
          : Colors.black.withValues(alpha: 0.04),
      focusColor: colorScheme.brightness == Brightness.dark
          ? Colors.white.withValues(alpha: 0.12)
          : Colors.black.withValues(alpha: 0.12),
      border: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: colorScheme.primary, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: colorScheme.outline, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: colorScheme.error, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(
          color: colorScheme.onSurface.withValues(alpha: 0.12),
          width: 1,
        ),
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((
        Set<WidgetState> states,
      ) {
        // These styles are copied from M3 default, we are not going to test
        // them again.
        // coverage:ignore-start
        if (states.contains(WidgetState.disabled)) {
          return TextStyle(
            color: colorScheme.onSurface.withValues(alpha: 0.38),
          );
        }
        if (states.contains(WidgetState.error)) {
          if (states.contains(WidgetState.hovered)) {
            return TextStyle(color: colorScheme.onErrorContainer);
          }
          if (states.contains(WidgetState.focused)) {
            return TextStyle(color: colorScheme.error);
          }
          return TextStyle(color: colorScheme.error);
        }
        if (states.contains(WidgetState.hovered)) {
          return TextStyle(color: colorScheme.onSurfaceVariant);
        }
        if (states.contains(WidgetState.focused)) {
          return TextStyle(color: colorScheme.primary);
        }
        return TextStyle(color: colorScheme.onSurfaceVariant);
        // coverage:ignore-end
      }),
    );
  }

  final bool useDecorator = useInputDecoratorTheme ?? false;
  final Color? background = backgroundSchemeColor == null
      ? backgroundColor // might be null, then SDK theme defaults.
      : FlexSubThemes.schemeColor(backgroundSchemeColor, colorScheme);
  final Color? headerBackgroundColor = headerBackgroundSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(headerBackgroundSchemeColor, colorScheme);

  final Color? headerForeground = headerForegroundSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(headerForegroundSchemeColor, colorScheme);
  final Color? headerForegroundColor = headerForeground ??
      (headerBackgroundSchemeColor == null
          ? null
          : FlexSubThemes.schemeColorPair(
              headerBackgroundSchemeColor,
              colorScheme,
              useOnSurfaceVariant: true,
            ));

  final Color? dividerColor = dividerSchemeColor == null
      ? null
      : FlexSubThemes.schemeColor(dividerSchemeColor, colorScheme);

  return DatePickerThemeData(
    backgroundColor: background,
    headerBackgroundColor: headerBackgroundColor,
    headerForegroundColor: headerForegroundColor,
    dividerColor: dividerColor,
    //
    elevation: elevation ?? kDialogElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? kDialogRadius),
      ),
    ),
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    inputDecorationTheme: useDecorator
        ? inputDecorationTheme
        // TODO(rydmike): Raise DatePicker decorator merge issue.
        // Getting back to default style with an elaborate back to default
        // input decorator does not work due to this:
        // https://github.com/flutter/flutter/pull/128950#issuecomment-1657177393
        : datePickerDefaultInputDecorationTheme(),
    //
    headerHeadlineStyle: headerHeadlineStyle,
    headerHelpStyle: headerHelpStyle,
    weekdayStyle: weekdayStyle,
    dayStyle: dayStyle,
    dayForegroundColor: dayForegroundColor,
    dayBackgroundColor: dayBackgroundColor,
    dayOverlayColor: dayOverlayColor,
    dayShape: dayShape,
    todayForegroundColor: todayForegroundColor,
    todayBackgroundColor: todayBackgroundColor,
    todayBorder: todayBorder,
    yearStyle: yearStyle,
    yearForegroundColor: yearForegroundColor,
    yearBackgroundColor: yearBackgroundColor,
    yearOverlayColor: yearOverlayColor,
    //
    rangePickerBackgroundColor: rangePickerBackgroundColor,
    rangePickerElevation: rangePickerElevation,
    rangePickerShadowColor: rangePickerShadowColor,
    rangePickerShape: rangePickerShape,
    rangePickerHeaderBackgroundColor: rangePickerHeaderBackgroundColor,
    rangePickerHeaderForegroundColor: rangePickerHeaderForegroundColor,
    rangePickerHeaderHeadlineStyle: rangePickerHeaderHeadlineStyle,
    rangePickerHeaderHelpStyle: rangePickerHeaderHelpStyle,
    rangeSelectionBackgroundColor: rangeSelectionBackgroundColor,
    rangeSelectionOverlayColor: rangeSelectionOverlayColor,
    //
    cancelButtonStyle: cancelButtonStyle,
    confirmButtonStyle: confirmButtonStyle,
    // This API is supported in Flutter 3.24.0 and later.
    locale: locale,
  );
}
