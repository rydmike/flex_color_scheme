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
/// By default the shape corner border radius rounding on included and
/// supported sub-themes that use shapes, defaults to the corner radius
/// defined by the Material 3 guide per widget, see https://m3.material.io/
///
/// Additionally the sub-theming offers a consistent button design on all
/// buttons, including [ToggleButtons] that is style to match size of
/// [OutlinedButton]
/// regarding outline and the selected button color to [ElevatedButton]
/// primary color. Hover and Focus colors are also matched. It is also size
/// matched with the other buttons, and includes a theme implementation that
/// makes it implement [VisualDensity] which it does not do out of the box
/// in the SDK.
///
/// On select sub-themes the used default color from the theme's colorScheme
/// can be changed with an enum colorscheme selection value. This is currently
/// supported by sub-themes:
///
/// - [TextField] in [FlexSubThemes.inputDecorationTheme].
/// - The [TabBar]'s indicator color.
/// - [BottomNavigationBar] in [FlexSubThemes.bottomNavigationBar].
/// - [NavigationBar] in [FlexSubThemes.navigationBarTheme].
/// - [ChipThemeData] from [FlexSubThemes.chipTheme].
///
/// Future versions may extend these quick color selection options to other
/// sub-themes where there is a high demand to change the used base color
/// from their default ColorScheme based color to another ColorScheme based
/// color. As before you can also modify FlexColorScheme produced ThemeData
/// objects with copyWith just as you can with normal ThemeData to make
/// and custom sub-themes designs that FlexColorScheme does not include.
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
    this.inputDecoratorSchemeColor,
    this.inputDecoratorIsFilled = true,
    this.inputDecoratorFillColor,
    this.inputDecoratorBorderType = FlexInputBorderType.outline,
    this.inputDecoratorUnfocusedHasBorder = true,
    this.chipRadius,
    this.chipSchemeColor,
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
    this.tabBarIndicatorSchemeColor,
    this.bottomSheetRadius,
    this.bottomSheetElevation = kBottomSheetElevation,
    this.bottomSheetModalElevation = kBottomSheetModalElevation,
    this.bottomNavigationBarElevation = kBottomNavigationBarElevation,
    this.bottomNavigationBarOpacity = 1,
    this.bottomNavigationBarSchemeColor,
    this.bottomNavigationBarBackgroundSchemeColor,
    this.bottomNavigationBarLandscapeLayout,
    this.navigationBarHeight = kNavigationBarHeight,
    this.navigationBarOpacity = 1,
    this.navigationBarIconSchemeColor,
    this.navigationBarTextSchemeColor,
    this.navigationBarHighlightSchemeColor,
    this.navigationBarBackgroundSchemeColor = SchemeColor.background,
    this.navigationBarMutedUnselectedIcon = true,
    this.navigationBarMutedUnselectedText = true,
    this.navigationBarLabelBehavior,
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
  /// surface ink effects, like e.g. on the ListTile and SwitchListTile taps,
  /// focus and hover.
  ///
  /// Defaults to true.
  final bool interactionEffects;

  /// Use selected [surfaceMode] and [blendLevel] in [FlexColorScheme.light]
  /// and [FlexColorScheme.dark] to also blend in each corresponding
  /// [ColorScheme] color property's color into their onColors [onSurface],
  /// [onBackGround], [onError], [onPrimary] and [onSecondary].
  ///
  /// Blending the on colors results in lower contrast than when not doing so,
  /// but it still works well on lower blend levels. The effect is
  /// subtle and can be turned off by setting [blendOnColors] to false.
  ///
  /// Defaults to true.
  final bool blendOnColors;

  /// Use selection [surfaceMode] and [blendLevel] in [FlexColorScheme.light]
  /// and [FlexColorScheme.dark] to also blend primary color into text themes
  /// for both [ThemeData.textTheme] and [ThemeData.primaryTextTheme].
  ///
  /// This feature is similar to the slightly colored texts seen in Material 3
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

  /// Use a Material 3 like text theme.
  ///
  /// When opting in on using the sub theming, this flag controls if the
  /// text theme that uses Material 3 like font sizes as specified for phones,
  /// is also used.
  ///
  /// The text theme is defined in [FlexColorScheme.m3TextTheme]. When the
  /// actual M3 based text themes are defined in Flutter SDK stable release
  /// they will be used instead.
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
  /// When it is null, the sub themes will use their null defaults that aim
  /// to follow Material 3 standard for all widgets it includes.
  ///
  /// When you set [defaultRadius] to a value, it will override these defaults
  /// with this global default. You can still set and lock each individual
  /// border radius back for these widget sub themes to some specific value, or
  /// to its Material 3 standard, which is mentioned in each theme as the used
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

  /// Defines which [Theme] based [ColorScheme] based color the input decorator
  /// uses as color for the border and fill color when they are used.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color.
  final SchemeColor? inputDecoratorSchemeColor;

  /// Determines if the [InputDecorator] is filled with a color.
  ///
  /// This property also affects if the fill color is used when not opting in
  /// on sub-themes. Giving an opportunity to make the past always filled input
  /// decorator even less opinionated.
  ///
  /// Defaults to true;
  final bool inputDecoratorIsFilled;

  /// Determines the color of the filled [InputDecorator].
  ///
  /// This can be used to completely customize the fill-color of the input
  /// decorator to a color that is not included in the theme color scheme.
  ///
  /// If null, defaults to theme.colorScheme color selected by
  /// [inputDecoratorSchemeColor].withAlpha(0x0F).
  final Color? inputDecoratorFillColor;

  // TODO(rydmike): Consider ContinuousRectangleBorder and beveled as new types.

  /// Determines the type of border [InputDecorator] uses.
  ///
  /// Defaults to [FlexInputBorderType.outline] to prefer the outline style.
  ///
  /// To use the underline style set it to [FlexInputBorderType.underline].  ///
  /// The top of the decorator is still rounded according to overall
  /// [defaultRadius] also with underline borer type.
  ///
  /// To change input decorator's corner radius separately define
  /// [inputDecorationRadius] that will then override [defaultRadius].
  final FlexInputBorderType inputDecoratorBorderType;

  /// Determines if the [InputDecorator] unfocused state has a border.
  ///
  /// Defaults to true.
  ///
  /// Applies to both outline and underline mode.
  ///
  /// You would typically
  /// use this in a design where you use a fill color and want unfocused
  /// input fields to only be highlighted by the fill color and not have any
  /// unfocused input border style.
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

  /// Corner radius override value for [Chip] widgets.
  final double? chipRadius;

  /// Defines which [Theme] based [ColorScheme] based color the Chip's
  /// use as their base color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color.
  final SchemeColor? chipSchemeColor;

  /// Corner radius override value for [Card].
  final double? cardRadius;

  /// Elevation of [Card].
  ///
  /// This design favors a flat design using color branded tint on card
  /// background, and defaults to [kCardElevation] = 0 as default
  /// themed elevation on [Card] widgets.
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
  /// The SDK elevation 8 is too high, we make it more subtle via
  /// opinionated default value [kPopupMenuElevation] of 3.
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
  /// defaults to use [ThemeData.colorscheme] and in it [ColorScheme.surface].
  ///
  /// If null, defaults to 1, fully opaque.
  final double? popupMenuOpacity;

  /// Corner radius override value for [Dialog].
  final double? dialogRadius;

  /// Elevation of [Dialog].
  ///
  /// The SDK elevation 24 is quite high, casting deep shadows. We make it less
  /// elevated via opinionated default value [kDialogElevation] of 10.
  ///
  /// One rationale for this change is that when using strong surface color
  /// branding and overlay color
  /// elevation in dark mode, the elevated dialog surface will become too
  /// light and contrast poorly with primary color.
  final double dialogElevation;

  /// Corner radius override value for [TimePickerDialog].
  final double? timePickerDialogRadius;

  /// Elevation of [SnackBar].
  ///
  /// Defaults to [kSnackBarElevation].
  final double snackBarElevation;

  /// Defines which [Theme] based [ColorScheme] based color the [TabBar]
  /// indicator uses.
  ///
  /// If not defined it defaults to same color as selected tab icon and text.
  /// The themed icon color and label color of tabs are defined by the
  /// [FlexColorScheme.tabBarStyle] property.
  final SchemeColor? tabBarIndicatorSchemeColor;

  /// Corner radius override value for [BottomSheet].
  final double? bottomSheetRadius;

  /// Elevation of none modal [BottomSheet].
  ///
  /// Defaults to [kBottomSheetElevation] = 4.
  final double bottomSheetElevation;

  /// Elevation of modal [BottomSheet].
  ///
  /// Defaults to [kBottomSheetModalElevation] = 8.
  final double bottomSheetModalElevation;

  /// Elevation of [BottomNavigationBar].
  ///
  /// Defaults to [kBottomNavigationBarElevation] = 0.
  final double bottomNavigationBarElevation;

  /// BottomNavigationBar opacity.
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

  /// Defines which [Theme] based [ColorScheme] based color the bottom
  /// navigation bar selected icon and text uses.
  ///
  /// If not defined it defaults to primary color. This differs from the
  /// [BottomNavigationBar]'s default theme that uses secondary color.
  /// If you use [SchemeColor.secondary] you get the default design back.
  final SchemeColor? bottomNavigationBarSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as background
  /// color for the bottom navigation bar.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined it defaults to theme.colorScheme.background color, same as
  /// Flutter default theme.
  final SchemeColor? bottomNavigationBarBackgroundSchemeColor;

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
  /// Defaults to null, if this property is null, then the value of the
  /// enclosing [BottomNavigationBarThemeData.landscapeLayout is used. If that
  /// property is also null, then
  /// [BottomNavigationBarLandscapeLayout.spread] is used.
  final BottomNavigationBarLandscapeLayout? bottomNavigationBarLandscapeLayout;

  /// Height of the container for Material 3 type [NavigationBar].
  ///
  /// Defaults to [kNavigationBarHeight] = 62dp.
  ///
  /// The Material 3 default design is 80dp, this is an opinionated reduced
  /// container height default.
  final double navigationBarHeight;

  /// NavigationBar background opacity.
  ///
  /// Defaults to 1, fully opaque.
  final double navigationBarOpacity;

  /// Select which color from the theme [ColorScheme] to use as base for
  /// the navigation bar's icon and text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined it defaults to using primary color. This differs from the
  /// NavigationBar's default theme that uses onSurface color with
  /// overlay color.
  /// If you use value [SchemeColor.onSurface] you get the default theme design.
  final SchemeColor? navigationBarIconSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the navigation bar's text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined it defaults to using primary color. This differs
  /// from the NavigationBar's default theme that uses onSurface color.
  /// If you use value [SchemeColor.onSurface] you get the default design.
  final SchemeColor? navigationBarTextSchemeColor;

  /// Select which color from the theme [ColorScheme] to use as base for
  /// the selected navigation bar's highlighted item.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined it defaults to using primary color. This differs from the
  /// NavigationBar's default theme that uses secondary color.
  /// If you use value [SchemeColor.secondary] you get the default design.
  final SchemeColor? navigationBarHighlightSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as background
  /// color for the navigation bar.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.background] selection.
  /// This differs from the Flutter default theme that uses
  /// [colorScheme.surface] and hard coded elevation overlay color in both
  /// light and dark theme mode. The different choice of default makes the
  /// background of the [NavigationBar] match the themed and default
  /// background of the [BottomNavigationBar]. This default works well with
  /// color branded surfaces and with other color scheme container colors
  /// selections that will be available in M3 based ColorScheme when it
  /// reaches stable  channel.
  ///
  /// To get Flutter SDK default background back, you can pass in null
  /// to [backgroundColor], it will then use widget default behavior
  /// background style.
  final SchemeColor? navigationBarBackgroundSchemeColor;

  /// If true, the unselected icons in the [NavigationBar] use a more muted
  /// color version of the color defined by [navigationBarIconSchemeColor].
  ///
  /// Defaults to true.
  final bool navigationBarMutedUnselectedIcon;

  /// If true, the unselected text labels in the [NavigationBar] use a more
  /// muted color version of the color defined by
  /// [navigationBarTextSchemeColor].
  ///
  /// Defaults to true.
  final bool navigationBarMutedUnselectedText;

  /// Specifies when each [NavigationDestination]'s label should appear.
  ///
  /// This is used to determine the behavior of NavigationBar's destinations.
  final NavigationDestinationLabelBehavior? navigationBarLabelBehavior;

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
    final SchemeColor? inputDecoratorSchemeColor,
    final bool? inputDecoratorIsFilled,
    final Color? inputDecoratorFillColor,
    final FlexInputBorderType? inputDecoratorBorderType,
    final bool? inputDecoratorUnfocusedHasBorder,
    final double? fabRadius,
    final bool? fabUseShape,
    final double? chipRadius,
    final SchemeColor? chipSchemeColor,
    final double? cardRadius,
    final double? cardElevation,
    final double? popupMenuRadius,
    final double? popupMenuElevation,
    final double? popupMenuOpacity,
    final double? dialogElevation,
    final double? dialogRadius,
    final double? timePickerDialogRadius,
    final double? snackBarElevation,
    final SchemeColor? tabBarIndicatorSchemeColor,
    final double? bottomSheetRadius,
    final double? bottomSheetElevation,
    final double? bottomSheetModalElevation,
    final double? bottomNavigationBarElevation,
    final double? bottomNavigationBarOpacity,
    final SchemeColor? bottomNavigationBarSchemeColor,
    final SchemeColor? bottomNavigationBarBackgroundSchemeColor,
    final BottomNavigationBarLandscapeLayout?
        bottomNavigationBarLandscapeLayout,
    final double? navigationBarHeight,
    final double? navigationBarOpacity,
    final SchemeColor? navigationBarIconSchemeColor,
    final SchemeColor? navigationBarTextSchemeColor,
    final SchemeColor? navigationBarHighlightSchemeColor,
    final SchemeColor? navigationBarBackgroundSchemeColor,
    final bool? navigationBarMutedUnselectedIcon,
    final bool? navigationBarMutedUnselectedText,
    final NavigationDestinationLabelBehavior? navigationBarLabelBehavior,
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
      inputDecoratorSchemeColor:
          inputDecoratorSchemeColor ?? this.inputDecoratorSchemeColor,
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
      chipSchemeColor: chipSchemeColor ?? this.chipSchemeColor,
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
      tabBarIndicatorSchemeColor:
          tabBarIndicatorSchemeColor ?? this.tabBarIndicatorSchemeColor,
      bottomSheetRadius: bottomSheetRadius ?? this.bottomSheetRadius,
      bottomSheetElevation: bottomSheetElevation ?? this.bottomSheetElevation,
      bottomSheetModalElevation:
          bottomSheetModalElevation ?? this.bottomSheetModalElevation,
      bottomNavigationBarElevation:
          bottomNavigationBarElevation ?? this.bottomNavigationBarElevation,
      bottomNavigationBarOpacity:
          bottomNavigationBarOpacity ?? this.bottomNavigationBarOpacity,
      bottomNavigationBarSchemeColor:
          bottomNavigationBarSchemeColor ?? this.bottomNavigationBarSchemeColor,
      bottomNavigationBarBackgroundSchemeColor:
          bottomNavigationBarBackgroundSchemeColor ??
              this.bottomNavigationBarBackgroundSchemeColor,
      bottomNavigationBarLandscapeLayout: bottomNavigationBarLandscapeLayout ??
          this.bottomNavigationBarLandscapeLayout,
      navigationBarHeight: navigationBarHeight ?? this.navigationBarHeight,
      navigationBarOpacity: navigationBarOpacity ?? this.navigationBarOpacity,
      navigationBarIconSchemeColor:
          navigationBarIconSchemeColor ?? this.navigationBarIconSchemeColor,
      navigationBarTextSchemeColor:
          navigationBarTextSchemeColor ?? this.navigationBarTextSchemeColor,
      navigationBarHighlightSchemeColor: navigationBarHighlightSchemeColor ??
          this.navigationBarHighlightSchemeColor,
      navigationBarBackgroundSchemeColor: navigationBarBackgroundSchemeColor ??
          this.navigationBarBackgroundSchemeColor,
      navigationBarMutedUnselectedIcon: navigationBarMutedUnselectedIcon ??
          this.navigationBarMutedUnselectedIcon,
      navigationBarMutedUnselectedText: navigationBarMutedUnselectedText ??
          this.navigationBarMutedUnselectedText,
      navigationBarLabelBehavior:
          navigationBarLabelBehavior ?? this.navigationBarLabelBehavior,
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
        other.inputDecoratorSchemeColor == inputDecoratorSchemeColor &&
        other.inputDecoratorIsFilled == inputDecoratorIsFilled &&
        other.inputDecoratorFillColor == inputDecoratorFillColor &&
        other.inputDecoratorBorderType == inputDecoratorBorderType &&
        other.inputDecoratorUnfocusedHasBorder ==
            inputDecoratorUnfocusedHasBorder &&
        other.fabRadius == fabRadius &&
        other.fabUseShape == fabUseShape &&
        other.chipRadius == chipRadius &&
        other.chipSchemeColor == chipSchemeColor &&
        other.cardRadius == cardRadius &&
        other.cardElevation == cardElevation &&
        other.popupMenuRadius == popupMenuRadius &&
        other.popupMenuElevation == popupMenuElevation &&
        other.popupMenuOpacity == popupMenuOpacity &&
        other.dialogRadius == dialogRadius &&
        other.dialogElevation == dialogElevation &&
        other.timePickerDialogRadius == timePickerDialogRadius &&
        other.snackBarElevation == snackBarElevation &&
        other.tabBarIndicatorSchemeColor == tabBarIndicatorSchemeColor &&
        other.bottomSheetRadius == bottomSheetRadius &&
        other.bottomSheetElevation == bottomSheetElevation &&
        other.bottomSheetModalElevation == bottomSheetModalElevation &&
        other.bottomNavigationBarElevation == bottomNavigationBarElevation &&
        other.bottomNavigationBarOpacity == bottomNavigationBarOpacity &&
        other.bottomNavigationBarSchemeColor ==
            bottomNavigationBarSchemeColor &&
        other.bottomNavigationBarBackgroundSchemeColor ==
            bottomNavigationBarBackgroundSchemeColor &&
        other.bottomNavigationBarLandscapeLayout ==
            bottomNavigationBarLandscapeLayout &&
        other.navigationBarHeight == navigationBarHeight &&
        other.navigationBarOpacity == navigationBarOpacity &&
        other.navigationBarIconSchemeColor == navigationBarIconSchemeColor &&
        other.navigationBarTextSchemeColor == navigationBarTextSchemeColor &&
        other.navigationBarHighlightSchemeColor ==
            navigationBarHighlightSchemeColor &&
        other.navigationBarBackgroundSchemeColor ==
            navigationBarBackgroundSchemeColor &&
        other.navigationBarMutedUnselectedIcon ==
            navigationBarMutedUnselectedIcon &&
        other.navigationBarMutedUnselectedText ==
            navigationBarMutedUnselectedText &&
        other.navigationBarLabelBehavior == navigationBarLabelBehavior;
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
      inputDecoratorSchemeColor,
      inputDecoratorIsFilled,
      inputDecoratorFillColor,
      inputDecoratorBorderType,
      inputDecoratorUnfocusedHasBorder,
      fabRadius,
      fabUseShape,
      chipRadius,
      chipSchemeColor,
      cardRadius,
      cardElevation,
      popupMenuRadius,
      popupMenuElevation,
      popupMenuOpacity,
      dialogRadius,
      dialogElevation,
      timePickerDialogRadius,
      snackBarElevation,
      tabBarIndicatorSchemeColor,
      bottomSheetRadius,
      bottomSheetElevation,
      bottomSheetModalElevation,
      bottomNavigationBarElevation,
      bottomNavigationBarOpacity,
      bottomNavigationBarSchemeColor,
      bottomNavigationBarBackgroundSchemeColor,
      bottomNavigationBarLandscapeLayout,
      navigationBarHeight,
      navigationBarOpacity,
      navigationBarIconSchemeColor,
      navigationBarTextSchemeColor,
      navigationBarHighlightSchemeColor,
      navigationBarBackgroundSchemeColor,
      navigationBarMutedUnselectedIcon,
      navigationBarMutedUnselectedText,
      navigationBarLabelBehavior,
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
    properties.add(EnumProperty<SchemeColor>(
        'inputDecoratorSchemeColor', inputDecoratorSchemeColor));
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
    properties
        .add(EnumProperty<SchemeColor>('chipSchemeColor', chipSchemeColor));
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
    properties.add(EnumProperty<SchemeColor>(
        'tabBarIndicatorSchemeColor', tabBarIndicatorSchemeColor));
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
    properties.add(EnumProperty<SchemeColor>(
        'bottomNavigationBarSchemeColor', bottomNavigationBarSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'bottomNavigationBarBackgroundSchemeColor',
        bottomNavigationBarBackgroundSchemeColor));
    properties.add(EnumProperty<BottomNavigationBarLandscapeLayout>(
        'bottomNavigationBarLandscapeLayout',
        bottomNavigationBarLandscapeLayout));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarHeight', navigationBarHeight));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarOpacity', navigationBarOpacity));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarIconSchemeColor', navigationBarIconSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarIconSchemeColor', navigationBarIconSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarHighlightSchemeColor',
        navigationBarHighlightSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarBackgroundSchemeColor',
        navigationBarBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'navigationBarMutedUnselectedIcon', navigationBarMutedUnselectedIcon));
    properties.add(DiagnosticsProperty<bool>(
        'navigationBarMutedUnselectedText', navigationBarMutedUnselectedText));
    properties.add(EnumProperty<NavigationDestinationLabelBehavior>(
        'navigationBarLabelBehavior', navigationBarLabelBehavior));
  }
}
