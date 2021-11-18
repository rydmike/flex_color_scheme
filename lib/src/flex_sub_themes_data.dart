import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_constants.dart';
import 'flex_sub_themes.dart';

// ignore_for_file: comment_references

/// Parameters used by [FlexColorScheme] to configure [FlexSubThemes] when
/// [FlexColorScheme.useSubThemes] is true.
///
/// The main use case for [FlexSubThemes] and the [FlexSubThemesData] is for
/// easy to use customization of default corner radius on all Flutter SDK
/// Widgets and elements that supports corner radius either via [ShapeBorder]
/// or [BorderRadiusGeometry].
///
/// The predefined default setting is a prominent rounding of 16 dp.
/// It can be easily changed for all classes with a single override value,
/// the corner radius of each included theme can also be individually
/// changed if so desired.
///
/// Additionally the sub-theming offers a consistent button design on all
/// buttons, including [ToggleButtons] that is style to match size of
/// [OutlinedButton]
/// regarding outline and the selected button color to [ElevatedButton]
/// primary color. Hover and Focus colors are also matched. It is also size
/// matched with the other buttons, and includes a theme implementation that
/// makes it implement [VisualDensity] which it does not do out of the box
/// in the SDK.
@immutable
class FlexSubThemesData with Diagnosticable {
  /// Default constructor, used to make an immutable FlexSubThemesData object.
  const FlexSubThemesData({
    this.interactionEffects = true,
    this.blendOnColors = true,
    this.blendTextTheme = true,
    this.useTextTheme = true,
    this.defaultRadius,
    this.buttonMinSize = kButtonMinSize,
    this.buttonPadding = kButtonPadding,
    this.thickBorderWidth = kThickBorderWidth,
    this.thinBorderWidth = kThinBorderWidth,
    this.textButtonRadius,
    this.elevatedButtonRadius,
    this.elevatedButtonElevation = kElevatedButtonElevation,
    this.outlinedButtonRadius,
    this.toggleButtonsRadius,
    this.inputDecorationRadius,
    this.inputDecoratorIsFilled = true,
    this.inputDecoratorFillColor,
    this.inputDecoratorBorderType = FlexInputBorderType.outline,
    this.inputDecoratorUnfocusedHasBorder = true,
    this.chipRadius,
    this.fabRadius,
    this.fabUseShape = true,
    this.cardRadius,
    this.cardElevation = kCardElevation,
    this.popupMenuRadius,
    this.popupMenuElevation = kPopupMenuElevation,
    this.popupMenuOpacity = 1,
    this.dialogRadius,
    this.dialogElevation = kDialogElevation,
    this.timePickerDialogRadius,
    this.snackBarElevation = kSnackBarElevation,
    this.bottomSheetRadius,
    this.bottomSheetElevation = kBottomSheetElevation,
    this.bottomSheetModalElevation = kBottomSheetModalElevation,
    this.bottomNavigationBarElevation = kBottomNavigationBarElevation,
    this.bottomNavigationBarOpacity = 1,
    this.bottomNavigationBarLandscapeLayout,
  });

  /// Opt-in on using color branded hover, focus, highlight and splash
  /// interaction state effects.
  ///
  /// The standard colors on hover, focus, highlight and splash effects use
  /// greys, i.e. white or black with different opacity levels.
  ///
  /// To get a color themed effect, set [interactionEffects] to true, and to
  /// false for the Flutter SDK Material 2 default [ThemeData] values.
  ///
  /// These effects apply to all Widgets that get them from [ThemeData].
  ///
  /// The buttons [ElevatedButton], [OutlinedButton] and [TextButton] define
  /// theme styles that by default use their own themed Material state
  /// effects for hover, focus, highlight and splash. These already include
  /// primary color blends and own different opacity values by default.
  /// The defaults on SDK overall [ThemeData] hover, focus, highlight and
  /// splash do not match this newer design, and they look out of place,
  /// especially in an otherwise primary color, alpha blended theme.
  ///
  /// When you opt-in on [interactionEffects] it makes the overall hover, focus,
  /// highlight and splash effects in [ThemeData] visually consistent with the
  /// style the buttons [ElevatedButton], [OutlinedButton] and [TextButton]
  /// with their own state effects use by default. It is not an exact
  /// match with the [ButtonStyleButton] buttons, the common class for the newer
  /// buttons, but very close. Because of for example the white opacity
  /// overlay used on primary colored button [ElevatedButton], it cannot be
  /// matched exactly in all situations. It is still visually very similar on
  /// most widgets, and does not stick out like the grey splashes do otherwise
  /// when using primary color blended themes.
  ///
  /// For [ToggleButtons] and legacy buttons `RaisedButton`, `OutlineButton`
  /// and `FlatButton` to always match the style the new buttons use,
  /// even when [interactionEffects] style is disabled, they also always use the
  /// same effect as [interactionEffects] provides on overall theme, so that
  /// they always match the [ButtonStyleButton] buttons as closely as possible.
  ///
  /// The effects provided by [interactionEffects] are more visible on large
  /// surface ink effects, like e.g. on the ListTile and SwitchListTile taps.
  ///
  /// Defaults to true.
  final bool interactionEffects;

  /// Use selected [surfaceMode] and [blendLevel] in [FlexColorScheme.light]
  /// and [FlexColorScheme.dark] to also blend in each corresponding
  /// [ColorScheme] color property's color into their onColors [onSurface],
  /// [onBackGround], [onError], [onPrimary] and [onSecondary].
  ///
  /// Blending the on colors results in lower contrast than when not doing so,
  /// but it still works well on lower blend levels. The effect is actually
  /// quite subtle and can be turned off by setting [blendOnColors] to false.
  ///
  /// Defaults to true.
  final bool blendOnColors;

  /// Use selection [surfaceMode] and [blendLevel] in [FlexColorScheme.light]
  /// and [FlexColorScheme.dark] to also blend primary color into text themes
  /// for both [ThemeData.textTheme] and [ThemeData.primaryTextTheme].
  ///
  /// This feature is similar to the slightly colored texts seen in Material3
  /// (You). At heavy blend levels it may reduce contrast too much and can
  /// be turned off if so desired. This feature is a bit experimental in nature
  /// and will be improved over time. It will be made to more closely match
  /// the Material 3 implementation, or even use it instead when it becomes
  /// available.
  ///
  /// Expect minor changes to the visual result when using this option in
  /// future versions.
  ///
  /// Defaults to true.
  final bool blendTextTheme;

  /// Use the Material 3 like text theme.
  ///
  /// When opting in on using the sub theming, this flag controls if the
  /// text theme that uses Material 3 like font sizes as specified for phones,
  /// is also used.
  ///
  /// The text theme is defined in [FlexColorScheme.m3TextTheme].
  ///
  /// Defaults to true.
  final bool useTextTheme;

  /// Corner radius used on all widgets when [FlexColorScheme] use its
  /// [FlexSubThemesData] to configure sub themes with [FlexSubThemes].
  ///
  /// These widgets will get their shape corner rounding from [defaultRadius]
  /// when it is defined.
  ///
  /// * [TextButton]
  /// * [ElevatedButton]
  /// * [OutlinedButton]
  /// * Older buttons using [ButtonThemeData]
  /// * [ToggleButtons]
  /// * [InputDecoration]
  /// * [Card]
  /// * [PopupMenuButton]
  /// * [Dialog]
  /// * [TimePickerDialog]
  /// * [BottomSheet]
  /// * [BottomNavigationBar]
  ///
  /// Defaults to null.
  ///
  /// When it is null, the sub themes will use their null default that aims
  /// to follow Material 3 standard for all widgets it includes.
  ///
  /// When you set [defaultRadius] to a value, it will override these defaults
  /// with this global default. You can still set and lock each individual
  /// border radius back for these widget sub themes to some specific value, or
  /// to its Material3 standard, which is mentioned in each theme as the used
  /// default when its value is null.
  ///
  /// Flutter current SDK general corner radius is 4, as defined by the
  /// Material 2 design guide. Material 3 (You) uses much
  /// higher corner radius, but it varies by widget in Flutter.
  final double? defaultRadius;

  /// Minimum button size for all buttons.
  ///
  /// Applies to [TextButton], [ElevatedButton], [OutlinedButton] and
  /// [ToggleButtons] and legacy deprecated buttons.
  ///
  /// Defaults to [kButtonMinSize].
  final Size buttonMinSize;

  /// Rounded buttons need a bit more horizontal padding to
  /// accommodate for the rounding.
  ///
  /// Applies to [TextButton], [ElevatedButton] and [OutlinedButton].
  ///
  /// Defaults to [kButtonPadding].
  final EdgeInsetsGeometry buttonPadding;

  /// Border width of Widgets with an outline border.
  ///
  /// Applies to enabled [OutlinedButton] and always to [ToggleButtons], as well
  /// as to selected state of [InputDecorator].
  ///
  /// Default to [kThickBorderWidth].
  final double thickBorderWidth;

  /// Border thickness on unselected input decorator and disabled buttons.
  ///
  /// Applies to disabled [OutlinedButton] and to un-selected state in
  /// [InputDecorator].
  ///
  /// Default to [kThinBorderWidth].
  final double thinBorderWidth;

  /// Corner radius override value for [TextButton].
  final double? textButtonRadius;

  /// Corner radius override value for [ElevatedButton].
  final double? elevatedButtonRadius;

  /// Default elevation of [ElevatedButton].
  ///
  /// This design favors a flat design using colors, the elevated button is
  /// primary colored by default, it thus needs no elevation in this design
  /// and defaults to [kElevatedButtonElevation] elevation on [ElevatedButton].
  final double elevatedButtonElevation;

  /// Corner radius override value for [OutlinedButton].
  final double? outlinedButtonRadius;

  /// Corner radius override value for [ToggleButtons].
  final double? toggleButtonsRadius;

  /// Corner radius override value for [InputDecoration].
  final double? inputDecorationRadius;

  /// Determines if the [InputDecorator] is filled with a color.
  ///
  /// This property also affects if the fill color is used when not opting in
  /// on sub-themes. Giving an opportunity to make the past always filled input
  /// decorator even less opinionated.
  ///
  /// Defaults to true;
  final bool inputDecoratorIsFilled;

  /// Determines if the color of the filled [InputDecorator].
  ///
  /// Defaults to colorScheme.primary.withOpacity(0.06) if null.
  final Color? inputDecoratorFillColor;

  // TODO(rydmike): Consider ContinuousRectangleBorder and beveled as new types.

  /// Determines the of border [InputDecorator] uses.
  ///
  /// Defaults to [FlexInputBorderType.outline] to prefer the outline style.
  ///
  /// To use the underline style set it to [FlexInputBorderType.underline].
  /// The top border are still rounded according to overall [defaultRadius].
  ///
  /// To change input decorator's corner radius separately define
  /// [inputDecorationRadius] that will then override [defaultRadius].
  final FlexInputBorderType inputDecoratorBorderType;

  /// Determines if the [InputDecorator] unfocused state has a border.
  ///
  /// Defaults to true.
  ///
  /// Applies to both outline and underline mode, so regardless of is
  /// [inputDecoratorBorderType] is true or false.
  ///
  /// You would typically
  /// use this in a design where you use a fill color and want unfocused
  /// input fields to only be highlighted by the fill color and not even
  /// have an unfocused input border style.
  ///
  /// When set to false, there is no border bored on states enabledBorder and
  /// disabledBorder, there is a border on focusedBorder, focusedErrorBorder
  /// and errorBorder, so error thus has a border also when it is not focused.
  final bool inputDecoratorUnfocusedHasBorder;

  /// Corner radius override value for [FloatingActionButton].
  final double? fabRadius;

  /// Use shape theming on Floating Action Button (FAB).
  ///
  /// By setting [fabUseShape] to false it is possible to opt out of all
  /// shape theming on FABs and keep their M2 defaults, while still eg.
  /// keeping M3 defaults on other widgets or changing their border radius
  /// with the shared global value.
  ///
  /// You may want to continue to keep the FAB round and extended FAB stadium
  /// shaped as before, despite otherwise using a rounder or M3 design.
  /// The circular M2 FAB goes well with those designs too.
  ///
  /// Default to true.
  final bool fabUseShape;

  /// Corner radius override value for [Chip].
  final double? chipRadius;

  /// Corner radius override value for [Card].
  final double? cardRadius;

  /// Elevation of [Card].
  ///
  /// This design favors a flat design using color branded tint on card
  /// background, and defaults to [kCardElevation] elevation on [Card].
  final double cardElevation;

  /// Corner radius override value for the menu on [PopupMenuButton].
  ///
  /// When used by [FlexColorScheme] the corner radius of popup menus follows
  /// the [defaultRadius] until and including 10 dp. After which it stays at
  /// 10 dp. If you need a higher corner radius on popup menus than 10 dp,
  /// you will have to explicitly override it here. It will not look very
  /// good, the highlight inside the menu will start to overflow the corners and
  /// it is not clipped along the border radius. The underlying Widget is not
  /// designed with this high border rounding in mind, which makes sense since
  /// it does not look good with too much rounding on a small menu.
  ///
  /// The built-in behavior in FlexColorScheme allows it to match at low
  /// inherited default radius values, but to also stay below the usable max
  /// rounding automatically at higher global default border radius values.
  final double? popupMenuRadius;

  /// Default elevation of [PopupMenuButton].
  ///
  /// The SDK elevation 8 is too high, we make it much more subtle via
  /// opinionated default value [kPopupMenuElevation].
  final double popupMenuElevation;

  /// Popup menu background opacity.
  ///
  /// Used by FlexColorScheme to modify the opacity on the effective
  /// colorScheme.surface color used on the themed PopupMenu background color.
  ///
  /// For opacity to be applied to the background a defined color also have
  /// be passed. If opacity is not null, FlexColorScheme will apply it to its
  /// [colorScheme.surface] and pass it to
  /// [FlexSubThemes.popupMenuTheme]'s backgroundColor [color]. If it is null,
  /// FlexColorScheme will not pass any color the sub-theme background color,
  /// and widget then uses its default behavior background color, which also
  /// happens to be to use [ThemeData.colorscheme] and in it
  /// [ColorScheme.surface].
  ///
  /// If null, defaults to 1, fully opaque.
  final double? popupMenuOpacity;

  /// Corner radius override value for [Dialog].
  final double? dialogRadius;

  /// Elevation of [Dialog].
  ///
  /// The SDK elevation 24 is quite high, casting deep shadows. We make it less
  /// elevated via opinionated default value [kDialogElevation]. One rationale
  /// for it is that when using strong surface color branding and overlay color
  /// elevation in dark mode, the elevated dialog surface will become too
  /// light and contrast poorly with primary color.
  final double dialogElevation;

  /// Corner radius override value for [TimePickerDialog].
  final double? timePickerDialogRadius;

  /// Elevation of [SnackBar].
  ///
  /// Defaults to [kSnackBarElevation].
  final double snackBarElevation;

  /// Corner radius override value for [BottomSheet].
  final double? bottomSheetRadius;

  /// Elevation of none modal [BottomSheet].
  ///
  /// Defaults to [kBottomSheetElevation].
  final double bottomSheetElevation;

  /// Elevation of modal [BottomSheet].
  ///
  /// Defaults to [kBottomSheetModalElevation].
  final double bottomSheetModalElevation;

  /// Elevation of [BottomNavigationBar].
  ///
  /// Defaults to [kBottomNavigationBarElevation].
  final double bottomNavigationBarElevation;

  /// BottomNavigationBar opacity
  ///
  /// Used by FlexColorScheme to modify the opacity on the effective
  /// colorScheme.background color on the themed BottomNavigationBar color.
  ///
  /// Typically you would apply some opacity in the range 0.85 to 0.98 if
  /// to show content scrolling behind it when using the Scaffold property
  /// extendBody is used.
  ///
  /// Defaults to 1, fully opaque.
  final double bottomNavigationBarOpacity;

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
  final BottomNavigationBarLandscapeLayout? bottomNavigationBarLandscapeLayout;

  /// Copy the object with one or more provided properties changed.
  FlexSubThemesData copyWith({
    final bool? interactionEffects,
    final bool? blendOnColors,
    final bool? blendTextTheme,
    final bool? useTextTheme,
    final double? defaultRadius,
    final Size? buttonMinSize,
    final EdgeInsetsGeometry? buttonPadding,
    final double? thickBorderWidth,
    final double? thinBorderWidth,
    final double? textButtonRadius,
    final double? elevatedButtonRadius,
    final double? elevatedButtonElevation,
    final double? outlinedButtonRadius,
    final double? toggleButtonsRadius,
    final double? inputDecorationRadius,
    final bool? inputDecoratorIsFilled,
    final Color? inputDecoratorFillColor,
    final FlexInputBorderType? inputDecoratorBorderType,
    final bool? inputDecoratorUnfocusedHasBorder,
    final double? fabRadius,
    final bool? fabUseShape,
    final double? chipRadius,
    final double? cardRadius,
    final double? cardElevation,
    final double? popupMenuRadius,
    final double? popupMenuElevation,
    final double? popupMenuOpacity,
    final double? dialogElevation,
    final double? dialogRadius,
    final double? timePickerDialogRadius,
    final double? snackBarElevation,
    final double? bottomSheetRadius,
    final double? bottomSheetElevation,
    final double? bottomSheetModalElevation,
    final double? bottomNavigationBarElevation,
    final double? bottomNavigationBarOpacity,
    final BottomNavigationBarLandscapeLayout?
        bottomNavigationBarLandscapeLayout,
  }) {
    return FlexSubThemesData(
      interactionEffects: interactionEffects ?? this.interactionEffects,
      blendOnColors: blendOnColors ?? this.blendOnColors,
      blendTextTheme: blendTextTheme ?? this.blendTextTheme,
      useTextTheme: useTextTheme ?? this.useTextTheme,
      defaultRadius: defaultRadius ?? this.defaultRadius,
      buttonMinSize: buttonMinSize ?? this.buttonMinSize,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      thickBorderWidth: thickBorderWidth ?? this.thickBorderWidth,
      thinBorderWidth: thinBorderWidth ?? this.thinBorderWidth,
      textButtonRadius: textButtonRadius ?? this.textButtonRadius,
      elevatedButtonRadius: elevatedButtonRadius ?? this.elevatedButtonRadius,
      elevatedButtonElevation:
          elevatedButtonElevation ?? this.elevatedButtonElevation,
      outlinedButtonRadius: outlinedButtonRadius ?? this.outlinedButtonRadius,
      toggleButtonsRadius: toggleButtonsRadius ?? this.toggleButtonsRadius,
      inputDecorationRadius:
          inputDecorationRadius ?? this.inputDecorationRadius,
      inputDecoratorIsFilled:
          inputDecoratorIsFilled ?? this.inputDecoratorIsFilled,
      inputDecoratorFillColor:
          inputDecoratorFillColor ?? this.inputDecoratorFillColor,
      inputDecoratorBorderType:
          inputDecoratorBorderType ?? this.inputDecoratorBorderType,
      inputDecoratorUnfocusedHasBorder: inputDecoratorUnfocusedHasBorder ??
          this.inputDecoratorUnfocusedHasBorder,
      fabRadius: fabRadius ?? this.fabRadius,
      fabUseShape: fabUseShape ?? this.fabUseShape,
      chipRadius: chipRadius ?? this.chipRadius,
      cardRadius: cardRadius ?? this.cardRadius,
      cardElevation: cardElevation ?? this.cardElevation,
      dialogRadius: dialogRadius ?? this.dialogRadius,
      dialogElevation: dialogElevation ?? this.dialogElevation,
      popupMenuRadius: popupMenuRadius ?? this.popupMenuRadius,
      popupMenuElevation: popupMenuElevation ?? this.popupMenuElevation,
      popupMenuOpacity: popupMenuOpacity ?? this.popupMenuOpacity,
      timePickerDialogRadius:
          timePickerDialogRadius ?? this.timePickerDialogRadius,
      snackBarElevation: snackBarElevation ?? this.snackBarElevation,
      bottomSheetRadius: bottomSheetRadius ?? this.bottomSheetRadius,
      bottomSheetElevation: bottomSheetElevation ?? this.bottomSheetElevation,
      bottomSheetModalElevation:
          bottomSheetModalElevation ?? this.bottomSheetModalElevation,
      bottomNavigationBarElevation:
          bottomNavigationBarElevation ?? this.bottomNavigationBarElevation,
      bottomNavigationBarOpacity:
          bottomNavigationBarOpacity ?? this.bottomNavigationBarOpacity,
      bottomNavigationBarLandscapeLayout: bottomNavigationBarLandscapeLayout ??
          this.bottomNavigationBarLandscapeLayout,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSubThemesData &&
        other.interactionEffects == interactionEffects &&
        other.blendOnColors == blendOnColors &&
        other.blendTextTheme == blendTextTheme &&
        other.useTextTheme == useTextTheme &&
        other.defaultRadius == defaultRadius &&
        other.buttonMinSize == buttonMinSize &&
        other.buttonPadding == buttonPadding &&
        other.thickBorderWidth == thickBorderWidth &&
        other.thinBorderWidth == thinBorderWidth &&
        other.textButtonRadius == textButtonRadius &&
        other.elevatedButtonRadius == elevatedButtonRadius &&
        other.elevatedButtonElevation == elevatedButtonElevation &&
        other.outlinedButtonRadius == outlinedButtonRadius &&
        other.toggleButtonsRadius == toggleButtonsRadius &&
        other.inputDecorationRadius == inputDecorationRadius &&
        other.inputDecoratorIsFilled == inputDecoratorIsFilled &&
        other.inputDecoratorFillColor == inputDecoratorFillColor &&
        other.inputDecoratorBorderType == inputDecoratorBorderType &&
        other.inputDecoratorUnfocusedHasBorder ==
            inputDecoratorUnfocusedHasBorder &&
        other.fabRadius == fabRadius &&
        other.fabUseShape == fabUseShape &&
        other.chipRadius == chipRadius &&
        other.cardRadius == cardRadius &&
        other.cardElevation == cardElevation &&
        other.popupMenuRadius == popupMenuRadius &&
        other.popupMenuElevation == popupMenuElevation &&
        other.popupMenuOpacity == popupMenuOpacity &&
        other.dialogRadius == dialogRadius &&
        other.dialogElevation == dialogElevation &&
        other.timePickerDialogRadius == timePickerDialogRadius &&
        other.snackBarElevation == snackBarElevation &&
        other.bottomSheetRadius == bottomSheetRadius &&
        other.bottomSheetElevation == bottomSheetElevation &&
        other.bottomSheetModalElevation == bottomSheetModalElevation &&
        other.bottomNavigationBarElevation == bottomNavigationBarElevation &&
        other.bottomNavigationBarOpacity == bottomNavigationBarOpacity &&
        other.bottomNavigationBarLandscapeLayout ==
            bottomNavigationBarLandscapeLayout;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      interactionEffects,
      blendOnColors,
      blendTextTheme,
      useTextTheme,
      defaultRadius,
      buttonMinSize,
      buttonPadding,
      thickBorderWidth,
      thinBorderWidth,
      textButtonRadius,
      elevatedButtonRadius,
      elevatedButtonElevation,
      outlinedButtonRadius,
      toggleButtonsRadius,
      inputDecorationRadius,
      inputDecoratorIsFilled,
      inputDecoratorFillColor,
      inputDecoratorBorderType,
      inputDecoratorUnfocusedHasBorder,
      fabRadius,
      fabUseShape,
      chipRadius,
      cardRadius,
      cardElevation,
      popupMenuRadius,
      popupMenuElevation,
      popupMenuOpacity,
      dialogRadius,
      dialogElevation,
      timePickerDialogRadius,
      snackBarElevation,
      bottomSheetRadius,
      bottomSheetElevation,
      bottomSheetModalElevation,
      bottomNavigationBarElevation,
      bottomNavigationBarOpacity,
      bottomNavigationBarLandscapeLayout,
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<bool>('interactionEffects', interactionEffects));
    properties.add(DiagnosticsProperty<bool>('blendOnColors', blendOnColors));
    properties.add(DiagnosticsProperty<bool>('blendTextTheme', blendTextTheme));
    properties.add(DiagnosticsProperty<bool>('useTextTheme', useTextTheme));
    properties.add(DiagnosticsProperty<double>('defaultRadius', defaultRadius));
    properties.add(DiagnosticsProperty<Size>('buttonMinSize', buttonMinSize));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'buttonPadding', buttonPadding));
    properties
        .add(DiagnosticsProperty<double>('thickBorderWidth', thickBorderWidth));
    properties
        .add(DiagnosticsProperty<double>('thinBorderWidth', thinBorderWidth));
    properties
        .add(DiagnosticsProperty<double>('textButtonRadius', textButtonRadius));
    properties.add(DiagnosticsProperty<double>(
        'elevatedButtonRadius', elevatedButtonRadius));
    properties.add(DiagnosticsProperty<double>(
        'elevatedButtonElevation', elevatedButtonElevation));
    properties.add(DiagnosticsProperty<double>(
        'outlinedButtonRadius', outlinedButtonRadius));
    properties.add(DiagnosticsProperty<double>(
        'toggleButtonsRadius', toggleButtonsRadius));
    properties.add(DiagnosticsProperty<double>(
        'inputDecorationRadius', inputDecorationRadius));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorIsFilled', inputDecoratorIsFilled));
    properties
        .add(ColorProperty('inputDecoratorFillColor', inputDecoratorFillColor));
    properties.add(EnumProperty<FlexInputBorderType>(
        'inputDecoratorBorderType', inputDecoratorBorderType));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorUnfocusedHasBorder', inputDecoratorUnfocusedHasBorder));
    properties.add(DiagnosticsProperty<double>('fabRadius', fabRadius));
    properties.add(DiagnosticsProperty<bool>('fabUseShape', fabUseShape));
    properties.add(DiagnosticsProperty<double>('chipRadius', chipRadius));
    properties.add(DiagnosticsProperty<double>('cardRadius', cardRadius));
    properties.add(DiagnosticsProperty<double>('cardElevation', cardElevation));
    properties
        .add(DiagnosticsProperty<double>('popupMenuRadius', popupMenuRadius));
    properties.add(
        DiagnosticsProperty<double>('popupMenuElevation', popupMenuElevation));
    properties
        .add(DiagnosticsProperty<double>('popupMenuOpacity', popupMenuOpacity));
    properties.add(DiagnosticsProperty<double>('dialogRadius', dialogRadius));
    properties
        .add(DiagnosticsProperty<double>('dialogElevation', dialogElevation));
    properties.add(DiagnosticsProperty<double>(
        'timePickerDialogRadius', timePickerDialogRadius));
    properties.add(
        DiagnosticsProperty<double>('snackBarElevation', snackBarElevation));
    properties.add(
        DiagnosticsProperty<double>('bottomSheetRadius', bottomSheetRadius));
    properties.add(DiagnosticsProperty<double>(
        'bottomSheetElevation', bottomSheetElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomSheetModalElevation', bottomSheetModalElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarElevation', bottomNavigationBarElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarOpacity', bottomNavigationBarOpacity));
    properties.add(EnumProperty<BottomNavigationBarLandscapeLayout>(
        'bottomNavigationBarLandscapeLayout',
        bottomNavigationBarLandscapeLayout));
  }
}
