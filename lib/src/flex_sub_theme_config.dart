import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_constants.dart';

/// Configuration parameters for FlexSubTheme used to customize the look of
/// your `FlexColorScheme` when its `subThemesOptIn` property is set to true.
///
/// The main use case for FlexSubTheme is for easy to use customization
/// of default corner radius on all Flutter SDK Widgets and elements that
/// supports corner radius either via [ShapeBorder] or [BorderRadiusGeometry].
///
/// The predefined default setting is a prominent rounding of 16 dp.
/// It can be easily changed for all classes with a single override value,
/// the corner rounding of each included theme can also be individually
/// changed if so desired.
///
/// Additional sub-theming offers a consistent button design on all buttons,
/// including [ToggleButtons] that is style to match size of [OutlinedButton]
/// regarding outline and the selected button color to [ElevatedButton]
/// primary color. Hover and Focus colors are also matched. It is also size
/// matched with the other buttons, and includes a theme implementation that
/// makes it implement [VisualDensity] which it does not do out of the box
/// in the SDK.
@immutable
class FlexSubThemeConfig with Diagnosticable {
  /// Default constructor, used to make an immutable FlexSubThemeConfig object.
  const FlexSubThemeConfig({
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
    this.bottomSheetElevation = kBottomSheetElevation,
    this.bottomSheetModalElevation = kBottomSheetModalElevation,
    this.bottomNavigationBarElevation = kBottomNavigationBarElevation,
    this.minButtonSize = kMinButtonSize,
    this.buttonPadding = kButtonPadding,
    this.thickOutlineWidth = kThickOutlineWidth,
    this.thinOutlineWidth = kThinOutlineWidth,
    this.inputDecoratorIsFilled = true,
    this.inputDecoratorFillColor,
    this.inputDecoratorIsOutlinedBorder = true,
  });

  /// Corner radius of all widgets covered by `FlexSubTheme` sub-theme.
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
  /// The SDK elevation 8 is too high, we make it more subtle via
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
  /// as to selected state of [InputDecorator] when using [OutlineInputBorder].
  ///
  /// Default to [kThickOutlineWidth].
  final double thickOutlineWidth;

  /// Border thickness on unselected input decorator and disabled buttons.
  ///
  /// Applies to disabled [OutlinedButton] and to un-selected state in
  /// [InputDecorator] when using [OutlineInputBorder].
  ///
  /// Default to [kThinOutlineWidth].
  final double thinOutlineWidth;

  /// Determines if the [InputDecorator] is filled with a color.
  ///
  /// Defaults to true;
  final bool inputDecoratorIsFilled;

  /// Determines if the color of the filled [InputDecorator].
  ///
  /// Defaults to colorScheme.primary.withOpacity(0.075) if null.
  final Color? inputDecoratorFillColor;

  /// Determines if the [InputDecorator] uses [OutlineInputBorder] or
  /// [UnderlineInputBorder].
  ///
  /// Defaults to true to prefer the [OutlineInputBorder].
  /// To use the underline style set to off. The top border are still rounded
  /// according to overall [cornerRadius].
  ///
  /// To change input decorator's corner radius separately define
  /// [cornerRadiusInputDecoration] that will then override [cornerRadius].
  final bool inputDecoratorIsOutlinedBorder;

  /// Copy the object with one or more provided properties changed.
  FlexSubThemeConfig copyWith({
    final String? name,
    final String? description,
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
    final double? bottomSheetElevation,
    final double? bottomSheetModalElevation,
    final double? bottomNavigationBarElevation,
    final Size? minButtonSize,
    final EdgeInsetsGeometry? buttonPadding,
    final double? thickOutlineWidth,
    final double? thinOutlineWidth,
    final bool? inputDecoratorIsFilled,
    final Color? inputDecoratorFillColor,
    final bool? inputDecoratorIsOutlinedBorder,
  }) {
    return FlexSubThemeConfig(
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
      bottomSheetElevation: bottomSheetElevation ?? this.bottomSheetElevation,
      bottomSheetModalElevation:
          bottomSheetModalElevation ?? this.bottomSheetModalElevation,
      bottomNavigationBarElevation:
          bottomNavigationBarElevation ?? this.bottomNavigationBarElevation,
      minButtonSize: minButtonSize ?? this.minButtonSize,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      thickOutlineWidth: thickOutlineWidth ?? this.thickOutlineWidth,
      thinOutlineWidth: thinOutlineWidth ?? this.thinOutlineWidth,
      inputDecoratorIsFilled:
          inputDecoratorIsFilled ?? this.inputDecoratorIsFilled,
      inputDecoratorFillColor:
          inputDecoratorFillColor ?? this.inputDecoratorFillColor,
      inputDecoratorIsOutlinedBorder:
          inputDecoratorIsOutlinedBorder ?? this.inputDecoratorIsOutlinedBorder,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSubThemeConfig &&
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
        other.bottomSheetElevation == bottomSheetElevation &&
        other.bottomSheetModalElevation == bottomSheetModalElevation &&
        other.bottomNavigationBarElevation == bottomNavigationBarElevation &&
        other.minButtonSize == minButtonSize &&
        other.buttonPadding == buttonPadding &&
        other.thickOutlineWidth == thickOutlineWidth &&
        other.thinOutlineWidth == thinOutlineWidth &&
        other.inputDecoratorIsFilled == inputDecoratorIsFilled &&
        other.inputDecoratorFillColor == inputDecoratorFillColor &&
        other.inputDecoratorIsOutlinedBorder == inputDecoratorIsOutlinedBorder;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
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
      bottomSheetElevation,
      bottomSheetModalElevation,
      bottomNavigationBarElevation,
      minButtonSize,
      buttonPadding,
      thickOutlineWidth,
      thinOutlineWidth,
      inputDecoratorIsFilled,
      inputDecoratorFillColor,
      inputDecoratorIsOutlinedBorder,
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
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
    properties.add(DiagnosticsProperty<double>(
        'bottomSheetElevation', bottomSheetElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomSheetModalElevation', bottomSheetModalElevation));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarElevation', bottomNavigationBarElevation));
    properties.add(DiagnosticsProperty<Size>('minButtonSize', minButtonSize));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'buttonPadding', buttonPadding));
    properties.add(
        DiagnosticsProperty<double>('thickOutlineWidth', thickOutlineWidth));
    properties
        .add(DiagnosticsProperty<double>('thinOutlineWidth', thinOutlineWidth));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorIsOutlinedBorder', inputDecoratorIsOutlinedBorder));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorIsFilled', inputDecoratorIsFilled));
    properties
        .add(ColorProperty('inputDecoratorFillColor', inputDecoratorFillColor));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorIsOutlinedBorder', inputDecoratorIsOutlinedBorder));
  }
}
