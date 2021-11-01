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
    this.themedEffects = true,
    this.cornerRadius = kCornerRadius,
    this.cornerRadiusBottomSheet,
    this.cornerRadiusCard,
    this.cornerRadiusDialog,
    this.cornerRadiusPopupMenuButton,
    this.cornerRadiusTimePickerDialog,
    this.cornerRadiusInputDecoration,
    this.cornerRadiusTextButton,
    this.cornerRadiusElevatedButton,
    this.cornerRadiusOutlinedButton,
    this.cornerRadiusToggleButtons,
    this.cardElevation = kCardElevation,
    this.elevatedButtonElevation = kElevatedButtonElevation,
    this.popupMenuElevation = kPopupMenuElevation,
    this.dialogElevation = kDialogElevation,
    this.snackBarElevation = kSnackBarElevation,
    this.bottomSheetElevation = kBottomSheetElevation,
    this.bottomSheetModalElevation = kBottomSheetModalElevation,
    this.bottomNavigationBarElevation = kBottomNavigationBarElevation,
    this.bottomNavigationBarOpacity,
    this.bottomNavigationBarLandscapeLayout,
    this.minButtonSize = kMinButtonSize,
    this.buttonPadding = kButtonPadding,
    this.thickBorderWidth = kThickBorderWidth,
    this.thinBorderWidth = kThinBorderWidth,
    this.inputDecoratorIsFilled = true,
    this.inputDecoratorFillColor,
    this.inputDecoratorBorderType = FlexInputBorderType.outline,
    this.inputDecoratorUnfocusedHasBorder = true,
    this.blendOnColors = true,
    this.blendTextTheme = true,
  });

  /// Opt in on using color branded hover, focus, highlight and splash effects.
  ///
  /// The standard colors on hover, focus, highlight and splash effects use
  /// greys, i.e. white or black with different opacity levels.
  ///
  /// To get a color themed effect, set [themedEffects] to true, and to false
  /// for the SDK default values.
  ///
  /// These effects apply to all Widgets that get theme from [ThemeData].
  ///
  /// The buttons [ElevatedButton], [OutlinedButton] and [TextButton] define
  /// theme styles that by default use their own themed Material state
  /// effects for hover, focus, highlight and splash. These already include
  /// primary color blends and own different opacity values by default.
  /// The defaults on SDK overall [ThemeData] hover, focus, highlight and
  /// splash do not match this newer design, and they look out of place,
  /// especially in an otherwise primary color, alpha blended surface theme.
  ///
  /// When you opt in on [themedEffects] it makes the overall hover, focus,
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
  /// So that [ToggleButtons] and legacy buttons `RaisedButton`, `OutlineButton`
  /// and `FlatButton` always match the style the new buttons use,
  /// even when [themedEffects] style is disabled, they also always use the same
  /// effect as [themedEffects] provides on overall theme, so that they always
  /// match the [ButtonStyleButton] buttons.
  ///
  /// The effects provided by [themedEffects] are most clearly visible on large
  /// surface ink effects, like e.g. on ListTile and SwitchListTile.
  ///
  /// Defaults to true.
  final bool themedEffects;

  // TODO(rydmike): Maybe also consider ContinuousRectangleBorder (future?).

  /// Corner radius of all widgets covered by `FlexSubThemes` sub-theme.
  ///
  /// These widgets will get their shape corner rounding from [cornerRadius]:
  /// * [BottomSheet]
  /// * [Card]
  /// * [Dialog]
  /// * [PopupMenuButton]
  /// * [TimePickerDialog]
  /// * [InputDecoration]
  /// * [TextButton]
  /// * [ElevatedButton]
  /// * [OutlinedButton]
  /// * [ToggleButtons]
  ///
  /// Defaults to [kCornerRadius]. Flutter SDK general corner radius is 4
  /// as defined by the Material Design guide. Material 3 (You) uses much
  /// higher corner radius.
  final double cornerRadius;

  /// Corner radius override value for [BottomSheet].
  final double? cornerRadiusBottomSheet;

  /// Corner radius override value for [Card].
  final double? cornerRadiusCard;

  /// Corner radius override value for [Dialog].
  final double? cornerRadiusDialog;

  /// Corner radius override value for [PopupMenuButton].
  ///
  /// When used by [FlexColorScheme] the corner radius of popup menus follows
  /// the [cornerRadius] until and including 10 dp. After which it stays at
  /// 10 dp. If you need a higher corner radius on popup menus than 10 dp,
  /// you will have to explicitly override it here. It will not look very
  /// good, the highlight inside the menu will start to overflow the corners and
  /// it is not clipped along the border radius. The underlying Widget is not
  /// designed with this high border rounding in mind, which makes sense since
  /// it does not look good with too much rounding on a small menu.
  ///
  /// The built-in behavior in FlexColorScheme allows it to match at low
  /// inherited radius values but to also stay below the usable max rounding
  /// automatically at higher global border radius values.
  final double? cornerRadiusPopupMenuButton;

  /// Corner radius override value for [TimePickerDialog].
  final double? cornerRadiusTimePickerDialog;

  /// Corner radius override value for [InputDecoration].
  final double? cornerRadiusInputDecoration;

  /// Corner radius override value for [TextButton].
  final double? cornerRadiusTextButton;

  /// Corner radius override value for [ElevatedButton].
  final double? cornerRadiusElevatedButton;

  /// Corner radius override value for [OutlinedButton].
  final double? cornerRadiusOutlinedButton;

  /// Corner radius override value for [ToggleButtons].
  final double? cornerRadiusToggleButtons;

  /// Elevation of [Card].
  ///
  /// This design favors a flat design using color branded tint on card
  /// background, and defaults to [kCardElevation] elevation on [Card].
  final double cardElevation;

  /// Default elevation of [ElevatedButton].
  ///
  /// This design favors a flat design using colors, the elevated button is
  /// primary colored by default, it thus needs no elevation in this design
  /// and defaults to [kElevatedButtonElevation] elevation on [ElevatedButton].
  final double elevatedButtonElevation;

  /// Default elevation of [PopupMenuButton].
  ///
  /// The SDK elevation 8 is too high, we make it much more subtle via
  /// opinionated default value [kPopupMenuElevation].
  final double popupMenuElevation;

  /// Elevation of [Dialog].
  ///
  /// The SDK elevation 24 is quite high, casting deep shadows. We make it less
  /// elevated via opinionated default value [kDialogElevation]. One rationale
  /// for it is that when using strong surface color branding and overlay color
  /// elevation in dark mode, the elevated dialog surface will become too
  /// light and contrast poorly with primary color.
  final double dialogElevation;

  /// Elevation of [SnackBar].
  ///
  /// Defaults to [kSnackBarElevation].
  final double snackBarElevation;

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
  /// If null, defaults to 1, fully opaque.
  ///
  /// Used by FlexColorScheme to modify the opacity on the effective
  /// colorScheme.background color on the themed BottomNavigationBar color.
  ///
  /// For opacity to be applied to the background a defined color also have
  /// be passed. If opacity is not null, FlexColorScheme will apply it to
  /// colorScheme.background and pass it to
  /// [FlexSubThemes.bottomNavigationBar]'s backgroundColor. If it is null,
  /// FlexColorScheme will not pass any color the sub-theme background color.
  ///
  /// Typically you would apply some opacity in the range 0.85 to 0.98 if
  /// to show content scrolling behind it when using the Scaffold property
  /// extendBody is used.
  final double? bottomNavigationBarOpacity;

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

  /// Minimum button size for all buttons.
  ///
  /// Applies to [TextButton], [ElevatedButton], [OutlinedButton] and
  /// [ToggleButtons] and legacy deprecated buttons.
  ///
  /// Defaults to [kMinButtonSize].
  final Size minButtonSize;

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

  /// Determines the of border [InputDecorator] uses.
  ///
  /// Defaults to [FlexInputBorderType.outline] to prefer the outline style.
  ///
  /// To use the underline style set it to [FlexInputBorderType.underline].
  /// The top border are still rounded according to overall [cornerRadius].
  ///
  /// To change input decorator's corner radius separately define
  /// [cornerRadiusInputDecoration] that will then override [cornerRadius].
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

  /// Use [FlexSurfaceMode] selection [surfaceMode] and [blendLevel] in
  /// [FlexColorScheme.light] and [FlexColorScheme.dark] to also blend primary
  /// color into onColors.
  ///
  /// Blending the on colors results in lower contrast than when not doing,
  /// but it often works well on lower blend levels.
  ///
  /// Defaults to false.
  final bool blendOnColors;

  /// Use [FlexSurfaceMode] selection [surfaceMode] and [blendLevel] in
  /// [FlexColorScheme.light] and [FlexColorScheme.dark] to also blend primary
  /// color into text themes.
  ///
  /// Defaults to true.
  final bool blendTextTheme;

  /// Copy the object with one or more provided properties changed.
  FlexSubThemesData copyWith({
    final bool? themedEffects,
    final double? cornerRadius,
    final double? cornerRadiusBottomSheet,
    final double? cornerRadiusCard,
    final double? cornerRadiusDialog,
    final double? cornerRadiusPopupMenuButton,
    final double? cornerRadiusTimePickerDialog,
    final double? cornerRadiusInputDecoration,
    final double? cornerRadiusTextButton,
    final double? cornerRadiusElevatedButton,
    final double? cornerRadiusOutlinedButton,
    final double? cornerRadiusToggleButtons,
    final double? cardElevation,
    final double? elevatedButtonElevation,
    final double? popupMenuElevation,
    final double? dialogElevation,
    final double? snackBarElevation,
    final double? bottomSheetElevation,
    final double? bottomSheetModalElevation,
    final double? bottomNavigationBarElevation,
    final double? bottomNavigationBarOpacity,
    final BottomNavigationBarLandscapeLayout?
        bottomNavigationBarLandscapeLayout,
    final Size? minButtonSize,
    final EdgeInsetsGeometry? buttonPadding,
    final double? thickBorderWidth,
    final double? thinBorderWidth,
    final bool? inputDecoratorIsFilled,
    final Color? inputDecoratorFillColor,
    final FlexInputBorderType? inputDecoratorBorderType,
    final bool? inputDecoratorUnfocusedHasBorder,
    final bool? blendOnColors,
    final bool? blendTextTheme,
  }) {
    return FlexSubThemesData(
      themedEffects: themedEffects ?? this.themedEffects,
      cornerRadius: cornerRadius ?? this.cornerRadius,
      cornerRadiusBottomSheet:
          cornerRadiusBottomSheet ?? this.cornerRadiusBottomSheet,
      cornerRadiusCard: cornerRadiusCard ?? this.cornerRadiusCard,
      cornerRadiusDialog: cornerRadiusDialog ?? this.cornerRadiusDialog,
      cornerRadiusPopupMenuButton:
          cornerRadiusPopupMenuButton ?? this.cornerRadiusPopupMenuButton,
      cornerRadiusTimePickerDialog:
          cornerRadiusTimePickerDialog ?? this.cornerRadiusTimePickerDialog,
      cornerRadiusInputDecoration:
          cornerRadiusInputDecoration ?? this.cornerRadiusInputDecoration,
      cornerRadiusTextButton:
          cornerRadiusTextButton ?? this.cornerRadiusTextButton,
      cornerRadiusElevatedButton:
          cornerRadiusElevatedButton ?? this.cornerRadiusElevatedButton,
      cornerRadiusOutlinedButton:
          cornerRadiusOutlinedButton ?? this.cornerRadiusOutlinedButton,
      cornerRadiusToggleButtons:
          cornerRadiusToggleButtons ?? this.cornerRadiusToggleButtons,
      cardElevation: cardElevation ?? this.cardElevation,
      elevatedButtonElevation:
          elevatedButtonElevation ?? this.elevatedButtonElevation,
      popupMenuElevation: popupMenuElevation ?? this.popupMenuElevation,
      dialogElevation: dialogElevation ?? this.dialogElevation,
      snackBarElevation: snackBarElevation ?? this.snackBarElevation,
      bottomSheetElevation: bottomSheetElevation ?? this.bottomSheetElevation,
      bottomSheetModalElevation:
          bottomSheetModalElevation ?? this.bottomSheetModalElevation,
      bottomNavigationBarElevation:
          bottomNavigationBarElevation ?? this.bottomNavigationBarElevation,
      bottomNavigationBarOpacity:
          bottomNavigationBarOpacity ?? this.bottomNavigationBarOpacity,
      bottomNavigationBarLandscapeLayout: bottomNavigationBarLandscapeLayout ??
          this.bottomNavigationBarLandscapeLayout,
      minButtonSize: minButtonSize ?? this.minButtonSize,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      thickBorderWidth: thickBorderWidth ?? this.thickBorderWidth,
      thinBorderWidth: thinBorderWidth ?? this.thinBorderWidth,
      inputDecoratorIsFilled:
          inputDecoratorIsFilled ?? this.inputDecoratorIsFilled,
      inputDecoratorFillColor:
          inputDecoratorFillColor ?? this.inputDecoratorFillColor,
      inputDecoratorBorderType:
          inputDecoratorBorderType ?? this.inputDecoratorBorderType,
      inputDecoratorUnfocusedHasBorder: inputDecoratorUnfocusedHasBorder ??
          this.inputDecoratorUnfocusedHasBorder,
      blendOnColors: blendOnColors ?? this.blendOnColors,
      blendTextTheme: blendTextTheme ?? this.blendTextTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSubThemesData &&
        other.themedEffects == themedEffects &&
        other.cornerRadius == cornerRadius &&
        other.cornerRadiusBottomSheet == cornerRadiusBottomSheet &&
        other.cornerRadiusCard == cornerRadiusCard &&
        other.cornerRadiusDialog == cornerRadiusDialog &&
        other.cornerRadiusPopupMenuButton == cornerRadiusPopupMenuButton &&
        other.cornerRadiusTimePickerDialog == cornerRadiusTimePickerDialog &&
        other.cornerRadiusInputDecoration == cornerRadiusInputDecoration &&
        other.cornerRadiusTextButton == cornerRadiusTextButton &&
        other.cornerRadiusElevatedButton == cornerRadiusElevatedButton &&
        other.cornerRadiusOutlinedButton == cornerRadiusOutlinedButton &&
        other.cornerRadiusToggleButtons == cornerRadiusToggleButtons &&
        other.cardElevation == cardElevation &&
        other.elevatedButtonElevation == elevatedButtonElevation &&
        other.popupMenuElevation == popupMenuElevation &&
        other.dialogElevation == dialogElevation &&
        other.snackBarElevation == snackBarElevation &&
        other.bottomSheetElevation == bottomSheetElevation &&
        other.bottomSheetModalElevation == bottomSheetModalElevation &&
        other.bottomNavigationBarElevation == bottomNavigationBarElevation &&
        other.bottomNavigationBarOpacity == bottomNavigationBarOpacity &&
        other.bottomNavigationBarLandscapeLayout ==
            bottomNavigationBarLandscapeLayout &&
        other.minButtonSize == minButtonSize &&
        other.buttonPadding == buttonPadding &&
        other.thickBorderWidth == thickBorderWidth &&
        other.thinBorderWidth == thinBorderWidth &&
        other.inputDecoratorIsFilled == inputDecoratorIsFilled &&
        other.inputDecoratorFillColor == inputDecoratorFillColor &&
        other.inputDecoratorBorderType == inputDecoratorBorderType &&
        other.inputDecoratorUnfocusedHasBorder ==
            inputDecoratorUnfocusedHasBorder &&
        other.blendOnColors == blendOnColors &&
        other.blendTextTheme == blendTextTheme;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      themedEffects,
      cornerRadius,
      cornerRadiusBottomSheet,
      cornerRadiusCard,
      cornerRadiusDialog,
      cornerRadiusPopupMenuButton,
      cornerRadiusTimePickerDialog,
      cornerRadiusInputDecoration,
      cornerRadiusTextButton,
      cornerRadiusElevatedButton,
      cornerRadiusOutlinedButton,
      cornerRadiusToggleButtons,
      cardElevation,
      elevatedButtonElevation,
      popupMenuElevation,
      dialogElevation,
      snackBarElevation,
      bottomSheetElevation,
      bottomSheetModalElevation,
      bottomNavigationBarElevation,
      bottomNavigationBarOpacity,
      bottomNavigationBarLandscapeLayout,
      minButtonSize,
      buttonPadding,
      thickBorderWidth,
      thinBorderWidth,
      inputDecoratorIsFilled,
      inputDecoratorFillColor,
      inputDecoratorBorderType,
      inputDecoratorUnfocusedHasBorder,
      blendOnColors,
      blendTextTheme,
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('themedEffects', themedEffects));
    properties.add(DiagnosticsProperty<double>('cornerRadius', cornerRadius));
    properties.add(DiagnosticsProperty<double>(
        'cornerRadiusBottomSheet', cornerRadiusBottomSheet));
    properties
        .add(DiagnosticsProperty<double>('cornerRadiusCard', cornerRadiusCard));
    properties.add(
        DiagnosticsProperty<double>('cornerRadiusDialog', cornerRadiusDialog));
    properties.add(DiagnosticsProperty<double>(
        'cornerRadiusPopupMenuButton', cornerRadiusPopupMenuButton));
    properties.add(DiagnosticsProperty<double>(
        'cornerRadiusTimePickerDialog', cornerRadiusTimePickerDialog));
    properties.add(DiagnosticsProperty<double>(
        'cornerRadiusInputDecoration', cornerRadiusInputDecoration));
    properties.add(DiagnosticsProperty<double>(
        'cornerRadiusTextButton', cornerRadiusTextButton));
    properties.add(DiagnosticsProperty<double>(
        'cornerRadiusElevatedButton', cornerRadiusElevatedButton));
    properties.add(DiagnosticsProperty<double>(
        'cornerRadiusOutlinedButton', cornerRadiusOutlinedButton));
    properties.add(DiagnosticsProperty<double>(
        'cornerRadiusToggleButtons', cornerRadiusToggleButtons));
    properties.add(DiagnosticsProperty<double>('cardElevation', cardElevation));
    properties.add(DiagnosticsProperty<double>(
        'elevatedButtonElevation', elevatedButtonElevation));
    properties.add(
        DiagnosticsProperty<double>('popupMenuElevation', popupMenuElevation));
    properties
        .add(DiagnosticsProperty<double>('dialogElevation', dialogElevation));
    properties.add(
        DiagnosticsProperty<double>('snackBarElevation', snackBarElevation));
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
    properties.add(DiagnosticsProperty<Size>('minButtonSize', minButtonSize));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'buttonPadding', buttonPadding));
    properties
        .add(DiagnosticsProperty<double>('thickBorderWidth', thickBorderWidth));
    properties
        .add(DiagnosticsProperty<double>('thinBorderWidth', thinBorderWidth));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorIsFilled', inputDecoratorIsFilled));
    properties
        .add(ColorProperty('inputDecoratorFillColor', inputDecoratorFillColor));
    properties.add(EnumProperty<FlexInputBorderType>(
        'inputDecoratorBorderType', inputDecoratorBorderType));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorUnfocusedHasBorder', inputDecoratorUnfocusedHasBorder));
    properties
        .add(DiagnosticsProperty<bool>('blendLightOnColors', blendOnColors));
    properties
        .add(DiagnosticsProperty<bool>('blendLightModeText', blendTextTheme));
  }
}
