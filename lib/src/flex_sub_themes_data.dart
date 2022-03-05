import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_constants.dart';
import 'flex_sub_themes.dart';

// ignore_for_file: comment_references

/// Parameters used by [FlexColorScheme] to configure [FlexSubThemes] when
/// [FlexColorScheme.useSubThemes] is true.
///
/// The main use case for [FlexSubThemes] and the [FlexSubThemesData] is for
/// easy to use customization of default border radius on all Flutter SDK
/// Widgets and elements that supports border radius either via [ShapeBorder]
/// or [BorderRadiusGeometry].
///
/// By design the shape border radius rounding on included and
/// supported sub-themes that use shapes, default to the border radius
/// defined by the Material 3 guide per widget,
/// [see Material 3 Design guide](https://m3.material.io).
///
/// Additionally the sub-theming offers a consistent button design on all
/// buttons, including [ToggleButtons] that is styled to match size of
/// [OutlinedButton] concerning the outline and the selected button color to
/// [ElevatedButton] color. Hover and Focus colors are also matched. It is also
/// size matched with the other buttons, and includes a theme implementation
/// that makes it implement [VisualDensity], which it does not do out of the box
/// in the SDK.
///
/// On many sub-themes the used default colors from the theme's colorScheme for
/// one or more of each component's color properties can be changed with an
/// enum [SchemeColor] selection value. This is supported by these sub-themes
/// for:
///
/// - [TextField] by [InputDecoration] via [FlexSubThemes.inputDecorationTheme].
/// - [TextButton] via [FlexSubThemes.textButtonTheme].
/// - [ElevatedButton] via [FlexSubThemes.elevatedButtonTheme].
/// - [OutlinedButton] via [FlexSubThemes.outlinedButtonTheme].
/// - [MaterialButton] and [ButtonBar] via [FlexSubThemes.buttonTheme].
/// - [ToggleButtons] via [FlexSubThemes.toggleButtonsTheme].
/// - [Switch] via [FlexSubThemes.switchTheme].
/// - [Checkbox] via [FlexSubThemes.checkboxTheme].
/// - [Radio] via [FlexSubThemes.radioTheme].
/// - [FloatingActionButton] via [FlexSubThemes.floatingActionButtonTheme].
/// - [BottomNavigationBar] via [FlexSubThemes.bottomNavigationBar].
/// - [NavigationBar] via [FlexSubThemes.navigationBarTheme].
/// - Dialog background color via [FlexSubThemes.dialogTheme] and
///   [FlexSubThemes.timePickerTheme].
/// - [Chips] via [FlexSubThemes.chipTheme].
/// - [AppBar] background color. The AppBar sub-theme definition is built into
///   the [FlexColorScheme.toTheme method (legacy).
///   May migrate its implementation to own [FlexSubThemes] sub-theme later.
/// - [TabBar] for indicator and item color. The TabBar sub-theme definition
///   is currently built into the [FlexColorScheme.toTheme] method (legacy).
///   May migrate its implementation to own [FlexSubThemes] sub-theme later.
///
/// You can also modify any [FlexColorScheme] produced [ThemeData]
/// object with [ThemeData.copyWith], just as you can with normal ThemeData,
/// to add custom component sub-themes designs that FlexColorScheme does
/// not include or support directly.
///
/// It is not in-scope to provide every option possible via Flutter SDK
/// component sub-themes to be configurable via [FlexSubThemesData]. Only a
/// small sub-set of commonly used properties are available as convenient
/// quick sub-theme settings via this flat and easy to use configuration class.
@immutable
class FlexSubThemesData with Diagnosticable {
  /// Default constructor, used to make an immutable FlexSubThemesData object.
  const FlexSubThemesData({
    this.interactionEffects = true,
    this.blendOnLevel = 0,
    this.blendOnColors = true,
    //
    this.blendTextTheme = true,
    this.useTextTheme = true,
    //
    this.defaultRadius,
    //
    this.buttonMinSize = kButtonMinSize,
    this.buttonPadding = kButtonPadding,
    this.thickBorderWidth = kThickBorderWidth,
    this.thinBorderWidth = kThinBorderWidth,
    //
    this.textButtonRadius,
    this.elevatedButtonRadius,
    this.elevatedButtonElevation = kElevatedButtonElevation,
    this.outlinedButtonRadius,
    this.toggleButtonsRadius,
    //
    this.textButtonSchemeColor,
    this.elevatedButtonSchemeColor,
    this.outlinedButtonSchemeColor,
    //
    this.materialButtonSchemeColor,
    this.toggleButtonsSchemeColor,
    //
    this.switchSchemeColor,
    this.checkboxSchemeColor,
    this.radioSchemeColor,
    this.unselectedToggleIsColored = false,
    //
    this.inputDecorationRadius,
    this.inputDecoratorSchemeColor,
    this.inputDecoratorIsFilled = true,
    this.inputDecoratorFillColor,
    this.inputDecoratorBorderType = FlexInputBorderType.outline,
    this.inputDecoratorUnfocusedHasBorder = true,
    //
    this.fabRadius,
    this.fabUseShape = true,
    this.fabSchemeColor,
    this.chipRadius,
    this.chipSchemeColor,
    //
    this.cardRadius,
    this.cardElevation = kCardElevation,
    //
    this.popupMenuRadius,
    this.popupMenuElevation = kPopupMenuElevation,
    this.popupMenuOpacity = 1,
    this.dialogRadius,
    this.dialogElevation = kDialogElevation,
    this.dialogBackgroundSchemeColor,
    this.timePickerDialogRadius,
    this.snackBarElevation = kSnackBarElevation,
    //
    this.appBarBackgroundSchemeColor,
    this.tabBarItemSchemeColor,
    this.tabBarIndicatorSchemeColor,
    //
    this.bottomSheetRadius,
    this.bottomSheetElevation = kBottomSheetElevation,
    this.bottomSheetModalElevation = kBottomSheetModalElevation,
    //
    this.bottomNavigationBarElevation = kBottomNavigationBarElevation,
    this.bottomNavigationBarOpacity = 1,
    this.bottomNavigationBarSchemeColor,
    this.bottomNavigationBarBackgroundSchemeColor,
    this.bottomNavigationBarLandscapeLayout,
    //
    this.navigationBarIsStyled = true,
    this.navigationBarHeight,
    this.navigationBarOpacity = 1,
    this.navigationBarIconSchemeColor,
    this.navigationBarTextSchemeColor,
    this.navigationBarHighlightSchemeColor,
    this.navigationBarBackgroundSchemeColor,
    this.navigationBarMutedUnselectedIcon,
    this.navigationBarMutedUnselectedText,
    this.navigationBarSelectedLabelSize,
    this.navigationBarUnselectedLabelSize,
    this.navigationBarSelectedIconSize,
    this.navigationBarUnselectedIconSize,
    this.navigationBarLabelBehavior,
    //
    this.navigationRailBackgroundSchemeColor,
    this.navigationRailOpacity = 1,
    this.navigationRailElevation = kNavigationRailElevation,
    this.navigationRailIconSchemeColor,
    this.navigationRailUseIndicator,
    this.navigationRailIndicatorSchemeColor,
    this.navigationRailTextSchemeColor,
    this.navigationRailMutedUnselectedIcon,
    this.navigationRailMutedUnselectedText,
    this.navigationRailSelectedLabelSize,
    this.navigationRailUnselectedLabelSize,
    this.navigationRailSelectedIconSize,
    this.navigationRailUnselectedIconSize,
    this.navigationRailLabelType,
    this.navigationRailGroupAlignment,
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

  /// Sets the blend level strength used of the onColor's color pair's color,
  /// into the onColor color, for none surface onColors.
  ///
  /// Use selected [surfaceMode] and [blendOnLevel] in [FlexColorScheme.light]
  /// and [FlexColorScheme.dark] to also blend in each corresponding
  /// [ColorScheme] color property's color into onColors, also for
  /// [onPrimary], [onSecondary] and [onTertiary] if [blendOnColors] is true.
  ///
  /// If [blendOnColors] is false, the [blendOnLevel] setting only affects
  /// [onSurface], [onBackGround], [onPrimaryContainer], [onSecondaryContainer]
  /// [onTertiaryContainer] and [onErrorContainer].
  ///
  /// The blend level is the integer decimal value of the alpha value
  /// used in the alpha blend function. It mixes one color with another
  /// by using alpha opacity value in the color of a surface put on top of
  /// another surface with opaque color and returns the result as one opaque
  /// color.
  ///
  /// Blending the on colors results in lower contrast than when not doing so,
  /// but it still works well on lower blend levels. This design is in line
  /// with the look one gets when use key color seeded based [ColorScheme]s,
  /// but this version is based on alpha blends instead of the Material
  /// Design 3 Tonal Color Palette and its tones. This version can also use
  /// blends on main colors, not only the onContainer colors.
  ///
  /// The effect can be adjusted and can be turned completely off off by
  /// setting [blendOnLevel] to 0 (zero).
  ///
  /// Defaults to 0.
  final int blendOnLevel;

  /// Enable [blendOnLevel] onColor blending on more colors.
  ///
  /// Use selected [surfaceMode] and [blendOnLevel] in [FlexColorScheme.light]
  /// and [FlexColorScheme.dark] to also blend in each corresponding
  /// [ColorScheme] color property's color into onColors, also for
  /// [onPrimary], [onSecondary] and [onTertiary] if [blendOnColors] is true.
  ///
  /// If [blendOnColors] is false, the [blendOnLevel] setting only affects
  /// [onSurface], [onBackGround], [onPrimaryContainer], [onSecondaryContainer]
  /// [onTertiaryContainer] and [onErrorContainer].
  ///
  /// Blending the on colors results in lower contrast than when not doing so,
  /// but it still works well on lower blend levels. The effect can be adjusted
  /// with [blendOnLevel] and completely turned off by setting [blendOnColors]
  /// to 0 (zero).
  ///
  /// Defaults to true.
  final bool blendOnColors;

  /// Use selection [surfaceMode] and [blendLevel] in [FlexColorScheme.light]
  /// and [FlexColorScheme.dark] to also blend primary color into text themes
  /// for both [ThemeData.textTheme] and [ThemeData.primaryTextTheme].
  ///
  /// This feature is similar to the slightly colored texts seen in Material 3
  /// when using "onColor" colored texts.
  ///
  /// This feature does not work so well if you need to put text on
  /// a completely different colored container than the background color.
  /// Which is why this feature can be opted out of.
  ///
  /// M3 has separate on colors for all colorscheme colors that can also
  /// be used for color matched text on each color. However, this slightly
  /// primary colored default text works very well for the slight primary
  /// colored M3 "neutral" surface colors with a primary hint too.
  ///
  /// At heavy blend levels it may reduce contrast too much and can
  /// be turned off if so desired. This feature is a bit experimental in nature
  /// and will be improved over time. Expect minor changes to the visual result
  /// when using this option in future versions when actual Material 3 text
  /// theme Typography becomes available.
  ///
  /// Defaults to true.
  final bool blendTextTheme;

  /// Use a Material 3 like and inspired text theme.
  ///
  /// When opting in on using the sub-theming, this flag controls if the
  /// text theme that uses Material 3 like font sizes and letter spacing,
  /// (typography) as specified for phones in the
  /// [Material 3 Design Guide](https://m3.material.io),
  /// is also used.
  ///
  /// The text theme is defined in [FlexColorScheme.m3TextTheme]. When the
  /// actual M3 based text themes are defined in Flutter SDK stable release
  /// they will be used instead. When that happens this style may be deprecated
  /// and removed. It will likely happen in next stable release. The one
  /// after Flutter 2.10.x.
  ///
  /// If you need to use none EnglishLike typography for your locale, then
  /// using this text theme might not be ideal. It only provides
  /// the EnglishLike geometry, not the dense and tall ones that some locales
  /// prefer or need. This limitation will be removed when the M3 Typography is
  /// supported in Flutter SDK. If this text theme causes issues with your
  /// locale or it otherwise does not suite your design, then set this
  /// [useTextTheme] to false.
  ///
  /// After the new M3 Typography becomes available, this toggle we be used to
  /// opt-in on using it, without need to also set `FlexColorScheme` and via it
  /// `ThemeData` property `useMaterial3` to true to get the typography.
  /// Optionally you will then also just be able to configure the Typography
  /// to the 2021 variant without using Material3 flag too.
  ///
  /// FlexColorScheme fully supports using any custom TextTheme and fonts, just
  /// like ThemeData. You apply and use them just as you would with ThemeData.
  /// This text theme is just a custom predefined TextTheme.
  ///
  /// Defaults to true.
  final bool useTextTheme;

  /// Border radius used on all widgets when [FlexColorScheme] use its
  /// [FlexSubThemesData] to configure sub-themes with [FlexSubThemes].
  ///
  /// These widgets will get their shape border radius from [defaultRadius]
  /// if it is defined:
  ///
  /// * [TextButton]
  /// * [ElevatedButton]
  /// * [OutlinedButton]
  /// * Older deprecated buttons using [ButtonThemeData]
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
  /// When it is null, the sub-themes will use their null default behavior
  /// that aim to follow Material 3 standard for all widgets it includes.
  ///
  /// When you set [defaultRadius] to a value, it will override the defaults
  /// with this global default. You can still set and lock each individual
  /// border radius back for individual widget sub-themes to some specific
  /// value, or set it back to its Material 3 standard, which is mentioned
  /// in each theme as the used default when its value is null.
  ///
  /// Flutter current SDK general border radius is 4, as defined by the
  /// Material 2 design guide. Material 3 (You) uses much
  /// higher border radius, but it varies by UI widget type. You can find the
  /// specifications [here](https://m3.material.io).
  final double? defaultRadius;

  /// Minimum button size for all buttons.
  ///
  /// Applies to [TextButton], [ElevatedButton], [OutlinedButton] and
  /// [ToggleButtons], and the legacy deprecated/removed buttons
  /// `RaisedButton`, `OutlineButton` and `FlatButton` and to [MaterialButton].
  ///
  /// Defaults to [kButtonMinSize].
  final Size buttonMinSize;

  /// Padding on [TextButton], [ElevatedButton] and [OutlinedButton].
  ///
  /// Rounded buttons may need a bit more horizontal padding to
  /// accommodate for the rounding.
  ///
  /// Defaults to [kButtonPadding].
  final EdgeInsetsGeometry buttonPadding;

  /// Border width of Widgets with an outline border.
  ///
  /// Applies to enabled [OutlinedButton] and always to [ToggleButtons], as well
  /// as to selected state of [InputDecorator].
  ///
  /// Defaults to [kThickBorderWidth].
  final double thickBorderWidth;

  /// Border thickness on unselected input decorator and disabled buttons.
  ///
  /// Applies to disabled [OutlinedButton] and to un-selected state in
  /// [InputDecorator].
  ///
  /// Defaults to [kThinBorderWidth].
  final double thinBorderWidth;

  /// Border radius override value for [TextButton].
  final double? textButtonRadius;

  /// Border radius override value for [ElevatedButton].
  final double? elevatedButtonRadius;

  /// Elevation of [ElevatedButton].
  ///
  /// This design favors a flat design using colors, the elevated button is
  /// primary colored by default, it thus needs no elevation or ery little in
  /// this design.
  ///
  /// Defaults to [kElevatedButtonElevation] = 1.
  final double elevatedButtonElevation;

  /// Border radius override value for [OutlinedButton].
  final double? outlinedButtonRadius;

  /// Border radius override value for [ToggleButtons].
  final double? toggleButtonsRadius;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [TextButton] use as its base theme color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? textButtonSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [ElevatedButton] use as its base theme color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? elevatedButtonSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [OutlinedButton] use as its base theme color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? outlinedButtonSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the old
  /// [MaterialButton] use as its base theme color.
  ///
  /// The [MaterialButton] is the parent class of old deprecated and removed
  /// buttons `RaisedButton`, `OutlineButton` and `FlatButton`. The theme
  /// [ButtonThemeData] it affects, is also used by [ButtonBar] and
  /// [DropdownButton] and it may still be useful to theme to same style
  /// as the theme used by the other buttons.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? materialButtonSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [ToggleButtons] use as its base theme color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? toggleButtonsSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [Switch] and [SwitchListTile] use as base themed color.
  ///
  /// If not defined, it defaults to ThemeData.colorScheme.secondary color via
  /// FlexColorScheme's default for [ThemeData.toggleableActiveColor].
  ///
  /// The ThemeData property toggleableActiveColor is being deprecated
  /// https://github.com/flutter/flutter/pull/95870. A future change for
  /// FlexColorScheme will be to see if it will be possible to continue to
  /// offer ThemeData.colorScheme.secondary as default color without opting in
  /// on using the component sub-themes. Currently the default is
  /// [ColorScheme.secondary] even without opting in on on sub-themes. It is
  /// also the default when when opting on its sub themes, but can be modified
  /// with this property.
  final SchemeColor? switchSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [Checkbox] and [CheckboxListTile] use as base themed color.
  ///
  /// If not defined, it defaults to ThemeData.colorScheme.secondary color via
  /// FlexColorScheme's default for [ThemeData.toggleableActiveColor].
  ///
  /// The ThemeData property toggleableActiveColor is being deprecated
  /// https://github.com/flutter/flutter/pull/95870. A future change for
  /// FlexColorScheme will be to see if it will be possible to continue to
  /// offer ThemeData.colorScheme.secondary as default color without opting in
  /// on using the component sub-themes. Currently the default is
  /// [ColorScheme.secondary] even without opting in on on sub-themes. It is
  /// also the default when when opting on its sub themes, but can be modified
  /// with this property.
  final SchemeColor? checkboxSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [Radio] and [RadioListTile] use as base themed color.
  ///
  /// If not defined, it defaults to ThemeData.colorScheme.secondary color via
  /// FlexColorScheme's default for [ThemeData.toggleableActiveColor].
  ///
  /// The ThemeData property toggleableActiveColor is being deprecated
  /// https://github.com/flutter/flutter/pull/95870. A future change for
  /// FlexColorScheme will be to see if it will be possible to continue to
  /// offer ThemeData.colorScheme.secondary as default color without opting in
  /// on using the component sub-themes. Currently the default is
  /// [ColorScheme.secondary] even without opting in on on sub-themes. It is
  /// also the default when when opting on its sub themes, but can be modified
  /// with this property.
  final SchemeColor? radioSchemeColor;

  /// Defines is unselected [Switch], [Checkbox] and [Radio] also use their
  /// themed color.
  ///
  /// Flutter SDK use neutral grey for switches, checkboxes and radio buttons
  /// when they are not selected. To some this may even look like it is
  /// disabled. By setting [unselectedSwitchesIsColored] to true, they
  /// use their themed color also in the unselected state. The [Checkbox] and
  /// [Radio] use their theme color in the outline. The [Switch] has just a hint
  /// of its themed color in it inactive track.
  ///
  /// Defaults to false, set it to for slighlty different style.
  final bool unselectedToggleIsColored;

  /// Border radius override value for [InputDecoration].
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
  /// Defaults to true.
  final bool inputDecoratorIsFilled;

  /// Determines the color of the filled [InputDecorator].
  ///
  /// This can be used to completely customize the fill-color of the input
  /// decorator to a color that is not included in the theme color scheme.
  ///
  /// If null, defaults to theme.colorScheme color selected by
  /// [inputDecoratorSchemeColor].withAlpha(0x0F).
  final Color? inputDecoratorFillColor;

  /// Determines the type of border [InputDecorator] uses.
  ///
  /// Defaults to [FlexInputBorderType.outline] to prefer the outline style.
  ///
  /// To use the underline style set it to [FlexInputBorderType.underline].
  /// The top of the decorator is still rounded according to overall
  /// [defaultRadius] also with underline borer type.
  ///
  /// To change input decorator's border radius separately define
  /// [inputDecorationRadius] that will then override [defaultRadius].
  final FlexInputBorderType inputDecoratorBorderType;

  /// Determines if the [InputDecorator] unfocused state has a border.
  ///
  /// Defaults to true.
  ///
  /// Applies to both outline and underline mode.
  ///
  /// You can use this in a design where you use a fill color and want unfocused
  /// input fields to only be highlighted by the fill color and not have any
  /// unfocused input border style.
  ///
  /// When set to false, there is no border bored on states enabledBorder and
  /// disabledBorder. There is a border on focusedBorder, focusedErrorBorder
  /// and errorBorder. Error state thus has a border also when it is not
  /// focused, even when this is set to false. This is a design choice to
  /// continue to emphasize error state with an error border even when
  /// this property is set to false.
  final bool inputDecoratorUnfocusedHasBorder;

  /// Border radius override value for [FloatingActionButton].
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
  /// Defaults to true.
  final bool fabUseShape;

  /// Defines which [Theme] based [ColorScheme] based color the Floating
  /// Action Buttons (FABs) use as their base color.
  ///
  /// If not defined it defaults to theme.colorScheme.secondary color via
  /// Flutter theme defaults.
  final SchemeColor? fabSchemeColor;

  /// Border radius override value for [Chip] widgets.
  final double? chipRadius;

  /// Defines which [Theme] based [ColorScheme] based color the Chip's
  /// use as their base color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color.
  final SchemeColor? chipSchemeColor;

  /// Border radius override value for [Card].
  final double? cardRadius;

  /// Elevation of [Card].
  ///
  /// This design favors a flat design using color branded tint on card
  /// background, and defaults to [kCardElevation] = 0 as default
  /// themed elevation on [Card] widgets.
  final double cardElevation;

  /// Border radius override value for the menu on [PopupMenuButton].
  ///
  /// When used by [FlexColorScheme] the border radius of popup menus follows
  /// the [defaultRadius] until and including 10 dp. After which it stays at
  /// 10 dp. If you need a higher border radius on popup menus than 10 dp,
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

  /// Border radius override value for [Dialog].
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

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [ToggleButtons] use as its base theme color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? dialogBackgroundSchemeColor;

  /// Border radius override value for [TimePickerDialog].
  final double? timePickerDialogRadius;

  /// Elevation of [SnackBar].
  ///
  /// Defaults to [kSnackBarElevation] = 4.
  final double snackBarElevation;

  /// Defines which [Theme] based [ColorScheme] based color the [AppBar]
  /// background uses.
  ///
  /// If not defined, [AppBar] uses the color defined in
  /// [FlexColorScheme.appBarBackground], or made with [FlexColorScheme.light]
  /// or [FlexColorScheme.dark], and the enum [FlexAppBarStyle] in property
  /// [appBarStyle] to determine thh [AppBar] color and background
  ///
  /// The themed [AppBar] background color is typically determined by defined
  /// [FlexAppBarStyle] in [FlexColorScheme.light] or [FlexColorScheme.dark].
  /// This property is an override that offers more quick config options by
  /// allowing picking a color from the effective [ColorScheme] different from
  /// options offered via [FlexColorScheme.light] and [FlexColorScheme.dark]
  /// ([appBarStyle) factory parameter.
  final SchemeColor? appBarBackgroundSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the [TabBar]
  /// items use.
  ///
  /// If not defined, TabBar items use the factories
  /// [FlexColorScheme.light] or [FlexColorScheme.dark] with the enum value
  /// [FlexTabBarStyle] with property [tabBarStyle], to determine
  /// the [TabBar] item colors.
  ///
  /// The themed [TabBar] background color is typically determined by defining
  /// [FlexTabBarStyle] in [FlexColorScheme.light] or [FlexColorScheme.dark].
  /// This property is an override that offers more quick config options by
  /// allowing picking any color from the effective [ColorScheme], instead of
  /// just the options in the [FlexColorScheme.light] and [FlexColorScheme.dark]
  /// (tabBarStyle) factory parameter.
  final SchemeColor? tabBarItemSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the [TabBar]
  /// indicator uses.
  ///
  /// If not defined, it defaults to the same color as selected tab icon and
  /// text. The themed icon color and label color of tabs are typically defined
  /// by the [FlexColorScheme.tabBarStyle] property. This property is an
  /// override that offers more quick config options by allowing picking
  /// a color from the effective [ColorScheme].
  final SchemeColor? tabBarIndicatorSchemeColor;

  /// Border radius override value for [BottomSheet].
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
  /// If not defined it defaults to `theme.colorScheme.background` color,
  /// same as Flutter SDK default un-themed [BottomNavigationBar] widget
  /// behavior.
  final SchemeColor? bottomNavigationBarBackgroundSchemeColor;

  /// The arrangement of the bottom navigation bar's [items] when the enclosing
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
  /// enclosing [BottomNavigationBarThemeData.landscapeLayout] is used. If that
  /// property is also null, then
  /// [BottomNavigationBarLandscapeLayout.spread] is used.
  final BottomNavigationBarLandscapeLayout? bottomNavigationBarLandscapeLayout;

  /// When true, the [NavigationBarThemeData] theme for the M3 [NavigationBar]
  /// created will be opinionated and styled to match the rest of the
  /// FlexColorScheme opinionated sub-themes.
  ///
  /// Defaults to true.
  ///
  /// Regardless of if this property is true or false, setting the other
  /// navigationBar properties in [FlexSubThemesData] overrides the defaults.
  /// The difference is the starting point. If true the starting point is the
  /// styled version, if false, the starting point are the defaults of the
  /// un-themed default Widget behavior of the M3 based [NavigationBar].
  /// Depending on the end result you want to achieve, starting with
  /// [navigationBarIsStyled] as true or false may give you a starting point
  /// that is closer to your target style, requiring you to define fever of
  /// the other properties offered here.
  ///
  /// The [NavigationBar] sub-theme styling offered here is too extensive. Other
  /// sub-themes configurations and options are not and will not be this
  /// extensive. This is added as a trial to see how it is received. It was
  /// also added because styling the [NavigationBar] with its raw sub-theme
  /// class [NavigationBarThemeData] can be a bit tricky as it uses
  /// [MaterialStateProperty] for its icon and text
  /// theme styling. Here we provide a more "flat" API for modifying it further,
  /// and a default that matches the rest of defaults for FlexColorScheme
  /// styles.
  ///
  /// You can also use the [FlexSubThemes.navigationBarTheme] as
  /// helper for making your custom [NavigationBarThemeData]. It exposes a few
  /// more properties and options than available here, all in a more convenient
  /// API format than the [NavigationBarThemeData] class.
  final bool navigationBarIsStyled;

  /// Height of the container for the Material 3 [NavigationBar].
  ///
  /// If [navigationBarIsStyled] is true it defaults to [kNavigationBarHeight]
  /// = 62 dp, otherwise it is 80 dp. This is the same as the the Material 3
  /// default design and specification for its height.
  final double? navigationBarHeight;

  /// NavigationBar background opacity.
  ///
  /// Defaults to 1, fully opaque.
  final double navigationBarOpacity;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the navigation bar's icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If null, the default value depends on the [navigationBarIsStyled] value.
  /// If it is true, resulting color is primary, if false, onSurface
  /// via [NavigationBar] widget default behavior.
  /// If the property is defined, the resulting ColorScheme color is always
  /// the color selected by this property.
  final SchemeColor? navigationBarIconSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the navigation bar's text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If null, the default value depends on the [navigationBarIsStyled] value.
  /// If it is true, resulting color is primary, if false, onSurface
  /// via [NavigationBar] widget's default behavior.
  /// If the property is defined, the resulting ColorScheme color is always
  /// the color selected by this property.
  final SchemeColor? navigationBarTextSchemeColor;

  /// Select which color from the theme [ColorScheme] to use as base for
  /// the selected navigation bar's highlighted item.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If null, the default value depends on the [navigationBarIsStyled] value.
  /// If it is true, resulting color is primary, if false, secondary
  /// via [NavigationBar] widget's default behavior.
  /// If the property is defined, the resulting ColorScheme color is always
  /// the color selected by this property.
  final SchemeColor? navigationBarHighlightSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as background
  /// color for the navigation bar.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If null, the default value depends on the [navigationBarIsStyled] value.
  /// If it is true, resulting color is background, if false, then
  /// surface color with a hard coded elevation overlay color of elevation 3,
  /// used in both light and dark theme mode, this via [NavigationBar]
  /// widget's default behavior.
  final SchemeColor? navigationBarBackgroundSchemeColor;

  /// If true, the unselected icons in the [NavigationBar] use a more muted
  /// color version of the color defined by [navigationBarIconSchemeColor].
  ///
  /// If null, the default value depends on the [navigationBarIsStyled] value.
  /// If it is true, this property defaults to true, otherwise to false.
  /// If the property is defined, the defined value is used.
  ///
  /// A muted unselected icon can only be applied when a defined icon color
  /// has been selected. When [navigationBarIsStyled] this is always the case,
  /// but if it is false, you also have to assign a value to
  /// [navigationBarIconSchemeColor] or [navigationBarSelectedIconSize] or
  /// [navigationBarUnselectedIconSize], so a none standard [IconTheme]
  /// must be created that can be muted. If none of those properties are defined
  /// the widget default behavior for icon style is used, and the unselected
  /// icon will not be muted since all properties are null.
  final bool? navigationBarMutedUnselectedIcon;

  /// If true, the unselected text labels in the [NavigationBar] use a more
  /// muted color version of the color defined by
  /// [navigationBarTextSchemeColor].
  ///
  /// If null, the default value depends on the [navigationBarIsStyled] value.
  /// If it is true, this property defaults to true, otherwise to false.
  /// If the property is defined, the defined value is used.
  ///
  /// A muted unselected text color can only be applied when a defined text
  /// color has been selected. When [navigationBarIsStyled] this is always the
  /// case, but if it is false, you also have to assign a value to
  /// [navigationBarTextSchemeColor] or [navigationBarSelectedLabelSize] or
  /// [navigationBarUnselectedLabelSize] so a none standard [TextStyle]
  /// must be created that can be muted. If none of those properties are defined
  /// the widget default behavior for label text style is used, and unselected
  /// text will not be muted since all properties are null.
  final bool? navigationBarMutedUnselectedText;

  /// The size of the text label on selected item.
  ///
  /// If null, the default value depends on the [navigationBarIsStyled] value.
  /// If it is true, resulting size is 11 dp, coming from the custom
  /// [TextStyle] in TextTheme [FlexColorScheme.m3TextTheme] and its [overline]
  /// text style, which defines the size to 11 dp in accordance to M3 text
  /// styles.
  ///
  /// If [navigationBarIsStyled] is false and all other text theming options
  /// are also null, the default size will depend on ambient text size of
  /// [TextTheme.overline], as will it other style options. What size this is
  /// will depend on used [Typography] which may be impacted by locale and
  /// Flutter version, typically it will be 10dp with a very wide letter
  /// spacing.
  ///
  /// If size is defined, it overrides the font size on effective label
  /// TextStyle on the selected item. A fallback value of 11 dp is also applied
  /// should the geometry in passed in used TextStyle be missing.
  final double? navigationBarSelectedLabelSize;

  /// The size of the text label on unselected items.
  ///
  /// If null, the default value depends on the [navigationBarIsStyled] value.
  /// If it is true, resulting size is 11 dp, coming from the custom
  /// [TextStyle] in TextTheme [FlexColorScheme.m3TextTheme] and its [overline]
  /// text style, which defines the size to 11 dp in accordance to M3 text
  /// styles.
  ///
  /// If [navigationBarIsStyled] is false and all other text theming options
  /// are also null, the default size will depend on ambient text size of
  /// [TextTheme.overline] as will it other style options. What size this is
  /// will depend on used [Typography] which may be impacted by locale and
  /// Flutter version, typically it will be 10dp with a very wide letter
  /// spacing.
  ///
  /// If size is defined, it overrides the font size on effective label
  /// TextStyle on selected item. A fallback value of 11 dp is also applied
  /// should the geometry in passed in used TextStyle be missing.
  final double? navigationBarUnselectedLabelSize;

  /// The size of the icon on selected item.
  ///
  /// If null, it defaults to 24.
  final double? navigationBarSelectedIconSize;

  /// The size of the icon on unselected items.
  ///
  /// If null, it defaults to 24.
  final double? navigationBarUnselectedIconSize;

  /// Specifies when each [NavigationDestination]'s label should appear.
  ///
  /// This is used to determine the behavior of NavigationBar's destinations.
  final NavigationDestinationLabelBehavior? navigationBarLabelBehavior;

  /// Select which color from the passed in [ColorScheme] to use as background
  /// color for the NavigationRail.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If null, defaults to [define_me] his via [NavigationRail] widget's default
  /// behavior.
  ///
  /// The SDK default widget behavior is Theme's on [ColorScheme.surface], but
  /// FlexColorscheme default to [ColorScheme.background], same as it uses as
  /// default on [BottomNavigationBar] and [NavigationBar].
  final SchemeColor? navigationRailBackgroundSchemeColor;

  /// NavigationRail background opacity.
  ///
  /// Defaults to 1, fully opaque.
  final double navigationRailOpacity;

  /// The z-coordinate to be used for the [NavigationRail]'s elevation.
  ///
  /// Default is [kNavigationRailElevation] = 0.
  final double navigationRailElevation;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the NavigationRail's icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If null, the default is via [NavigationRail] widget default behavior.
  final SchemeColor? navigationRailIconSchemeColor;

  /// If `true`, adds a rounded [NavigationIndicator] behind the selected
  /// destination's icon.
  ///
  /// The indicator's shape will be circular if [labelType] is
  /// [NavigationRailLabelType.none], or a [StadiumBorder] if [labelType] is
  /// [NavigationRailLabelType.all] or [NavigationRailLabelType.selected].
  ///
  /// If `null`, defaults to [NavigationRailThemeData.useIndicator]. If that is
  /// `null`, defaults to [ThemeData.useMaterial3].
  ///
  /// Defaults to true in FlexColorScheme. Can be set to null and then uses
  /// above default widget behavior.
  final bool? navigationRailUseIndicator;

  /// Select which color from the theme [ColorScheme] to use as base for
  /// the selected NavigationRail's highlighted item's pill shaped indicator
  /// color.
  ///
  ///  Has no default color in Flutter SDK. However when...
  ///  Default to Theme's [ColorScheme.primary] here if not defined.
  final SchemeColor? navigationRailIndicatorSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the NavigationRail's text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If null, the default is via [NavigationRail] widget default behavior.
  final SchemeColor? navigationRailTextSchemeColor;

  /// If true, the unselected icons in the [NavigationRail] use a more muted
  /// color version of the color defined by [navigationRailIconSchemeColor].
  ///
  /// A muted unselected icon can only be applied when a defined icon color
  /// has been selected. A
  /// [navigationRailIconSchemeColor] or [navigationRailSelectedIconSize] or
  /// [navigationRailUnselectedIconSize] must be defined so a none standard
  /// none null [IconTheme] must be created that can be muted.
  ///
  /// If none of those properties are defined
  /// the widget default behavior for icon style is used, and the unselected
  /// icon cannot be muted since all properties are null.
  final bool? navigationRailMutedUnselectedIcon;

  /// If true, the unselected text labels in the [NavigationRail] use a more
  /// muted color version of the color defined by
  /// [navigationRailTextSchemeColor].
  ///
  /// If null, defaults to [define_me] via [NavigationRail] widget's default
  /// behavior.
  ///
  /// A muted unselected text color can only be applied when a defined text
  /// color has been selected. You also have to assign a value to
  /// [navigationRailTextSchemeColor] or [navigationRailSelectedLabelSize] or
  /// [navigationRailUnselectedLabelSize] so a none standard [TextStyle]
  /// must be created that can be muted.
  ///
  /// If none of those properties are defined the widget default behavior for
  /// label text style is used, and unselected text cannot be muted since
  /// all properties are null.
  final bool? navigationRailMutedUnselectedText;

  /// The size of the text label on selected item.
  ///
  /// If it is true, resulting size is 11 dp, coming from the custom
  /// [TextStyle] in TextTheme [FlexColorScheme.m3TextTheme] and its [overline]
  /// text style, which defines the size to 11 dp in accordance to M3 text
  /// styles.
  ///
  /// If [navigationRailIsStyled] is false and all other text theming options
  /// are also null, the default size will depend on ambient text size of
  /// [TextTheme.overline], as will it other style options. What size this is
  /// will depend on used [Typography] which may be impacted by locale and
  /// Flutter version, typically it will be 10dp with a very wide letter
  /// spacing.
  ///
  /// If size is defined, it overrides the font size on effective label
  /// TextStyle on the selected item. A fallback value of 11 dp is also applied
  /// should the geometry in passed in used TextStyle be missing.
  final double? navigationRailSelectedLabelSize;

  /// The size of the text label on unselected items.
  ///
  /// If null, the default value depends on the [navigationRailIsStyled] value.
  /// If it is true, resulting size is 11 dp, coming from the custom
  /// [TextStyle] in TextTheme [FlexColorScheme.m3TextTheme] and its [overline]
  /// text style, which defines the size to 11 dp in accordance to M3 text
  /// styles.
  ///
  /// If [navigationRailIsStyled] is false and all other text theming options
  /// are also null, the default size will depend on ambient text size of
  /// [TextTheme.overline] as will it other style options. What size this is
  /// will depend on used [Typography] which may be impacted by locale and
  /// Flutter version, typically it will be 10dp with a very wide letter
  /// spacing.
  ///
  /// If size is defined, it overrides the font size on effective label
  /// TextStyle on selected item. A fallback value of 11 dp is also applied
  /// should the geometry in passed in used TextStyle be missing.
  final double? navigationRailUnselectedLabelSize;

  /// The size of the icon on selected item.
  ///
  /// If null, it defaults to 24.
  final double? navigationRailSelectedIconSize;

  /// The size of the icon on unselected items.
  ///
  /// If null, it defaults to 24.
  final double? navigationRailUnselectedIconSize;

  /// Specifies when each [NavigationRailDestination]'s label should appear.
  ///
  /// This is used to determine the behavior of NavigationBar's destinations.
  ///
  /// If null, theme behavior defaults to
  /// `NavigationDestinationLabelBehavior.alwaysShow`
  final NavigationRailLabelType? navigationRailLabelType;

  /// The vertical alignment for the group of [destinations] within a
  /// NavigationRail.
  ///
  /// The [NavigationRailDestination]s are grouped together with the
  /// [trailing] widget, between the [leading] widget and the bottom
  /// of the rail.
  ///
  /// The value must be between -1.0 and 1.0.
  ///
  /// If [groupAlignment] is -1.0, then the items are aligned to the top. If
  /// [groupAlignment] is 0.0, then the items are aligned to the center. If
  /// [groupAlignment] is 1.0, then the items are aligned to the bottom.
  ///
  /// The default is -1.0.
  ///
  final double? navigationRailGroupAlignment;

  /// Copy the object with one or more provided properties changed.
  FlexSubThemesData copyWith({
    final bool? interactionEffects,
    final int? blendOnLevel,
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
    final SchemeColor? textButtonSchemeColor,
    final SchemeColor? elevatedButtonSchemeColor,
    final SchemeColor? outlinedButtonSchemeColor,
    final SchemeColor? materialButtonSchemeColor,
    final SchemeColor? toggleButtonsSchemeColor,
    final SchemeColor? switchSchemeColor,
    final SchemeColor? checkboxSchemeColor,
    final SchemeColor? radioSchemeColor,
    final bool? unselectedToggleIsColored,
    final double? inputDecorationRadius,
    final SchemeColor? inputDecoratorSchemeColor,
    final bool? inputDecoratorIsFilled,
    final Color? inputDecoratorFillColor,
    final FlexInputBorderType? inputDecoratorBorderType,
    final bool? inputDecoratorUnfocusedHasBorder,
    final double? fabRadius,
    final bool? fabUseShape,
    final SchemeColor? fabSchemeColor,
    final double? chipRadius,
    final SchemeColor? chipSchemeColor,
    final double? cardRadius,
    final double? cardElevation,
    final double? popupMenuRadius,
    final double? popupMenuElevation,
    final double? popupMenuOpacity,
    final SchemeColor? dialogBackgroundSchemeColor,
    final double? dialogElevation,
    final double? dialogRadius,
    final double? timePickerDialogRadius,
    final double? snackBarElevation,
    final SchemeColor? appBarBackgroundSchemeColor,
    final SchemeColor? tabBarItemSchemeColor,
    final SchemeColor? tabBarIndicatorSchemeColor,
    //
    final double? bottomSheetRadius,
    final double? bottomSheetElevation,
    final double? bottomSheetModalElevation,
    final double? bottomNavigationBarElevation,
    final double? bottomNavigationBarOpacity,
    final SchemeColor? bottomNavigationBarSchemeColor,
    final SchemeColor? bottomNavigationBarBackgroundSchemeColor,
    final BottomNavigationBarLandscapeLayout?
        bottomNavigationBarLandscapeLayout,
    //
    final bool? navigationBarIsStyled,
    final double? navigationBarHeight,
    final double? navigationBarOpacity,
    final SchemeColor? navigationBarIconSchemeColor,
    final SchemeColor? navigationBarTextSchemeColor,
    final SchemeColor? navigationBarHighlightSchemeColor,
    final SchemeColor? navigationBarBackgroundSchemeColor,
    final bool? navigationBarMutedUnselectedIcon,
    final bool? navigationBarMutedUnselectedText,
    final double? navigationBarSelectedLabelSize,
    final double? navigationBarUnselectedLabelSize,
    final double? navigationBarSelectedIconSize,
    final double? navigationBarUnselectedIconSize,
    final NavigationDestinationLabelBehavior? navigationBarLabelBehavior,
    //
    final SchemeColor? navigationRailBackgroundSchemeColor,
    final double? navigationRailOpacity,
    final double? navigationRailElevation,
    final SchemeColor? navigationRailIconSchemeColor,
    final bool? navigationRailUseIndicator,
    final SchemeColor? navigationRailIndicatorSchemeColor,
    final SchemeColor? navigationRailTextSchemeColor,
    final bool? navigationRailMutedUnselectedIcon,
    final bool? navigationRailMutedUnselectedText,
    final double? navigationRailSelectedLabelSize,
    final double? navigationRailUnselectedLabelSize,
    final double? navigationRailSelectedIconSize,
    final double? navigationRailUnselectedIconSize,
    final NavigationRailLabelType? navigationRailLabelType,
    final double? navigationRailGroupAlignment,
  }) {
    return FlexSubThemesData(
      interactionEffects: interactionEffects ?? this.interactionEffects,
      blendOnLevel: blendOnLevel ?? this.blendOnLevel,
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
      textButtonSchemeColor:
          textButtonSchemeColor ?? this.textButtonSchemeColor,
      elevatedButtonSchemeColor:
          elevatedButtonSchemeColor ?? this.elevatedButtonSchemeColor,
      outlinedButtonSchemeColor:
          outlinedButtonSchemeColor ?? this.outlinedButtonSchemeColor,
      materialButtonSchemeColor:
          materialButtonSchemeColor ?? this.materialButtonSchemeColor,
      toggleButtonsSchemeColor:
          toggleButtonsSchemeColor ?? this.toggleButtonsSchemeColor,
      switchSchemeColor: switchSchemeColor ?? this.switchSchemeColor,
      checkboxSchemeColor: checkboxSchemeColor ?? this.checkboxSchemeColor,
      radioSchemeColor: radioSchemeColor ?? this.radioSchemeColor,
      unselectedToggleIsColored:
          unselectedToggleIsColored ?? this.unselectedToggleIsColored,
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
      fabSchemeColor: fabSchemeColor ?? this.fabSchemeColor,
      chipRadius: chipRadius ?? this.chipRadius,
      chipSchemeColor: chipSchemeColor ?? this.chipSchemeColor,
      cardRadius: cardRadius ?? this.cardRadius,
      cardElevation: cardElevation ?? this.cardElevation,
      dialogRadius: dialogRadius ?? this.dialogRadius,
      dialogElevation: dialogElevation ?? this.dialogElevation,
      dialogBackgroundSchemeColor:
          dialogBackgroundSchemeColor ?? this.dialogBackgroundSchemeColor,
      popupMenuRadius: popupMenuRadius ?? this.popupMenuRadius,
      popupMenuElevation: popupMenuElevation ?? this.popupMenuElevation,
      popupMenuOpacity: popupMenuOpacity ?? this.popupMenuOpacity,
      timePickerDialogRadius:
          timePickerDialogRadius ?? this.timePickerDialogRadius,
      snackBarElevation: snackBarElevation ?? this.snackBarElevation,
      appBarBackgroundSchemeColor:
          appBarBackgroundSchemeColor ?? this.appBarBackgroundSchemeColor,
      tabBarItemSchemeColor:
          tabBarItemSchemeColor ?? this.tabBarItemSchemeColor,
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
      //
      navigationBarIsStyled:
          navigationBarIsStyled ?? this.navigationBarIsStyled,
      navigationBarHeight: navigationBarHeight ?? this.navigationBarHeight,
      navigationBarOpacity: navigationBarOpacity ?? this.navigationBarOpacity,
      navigationBarIconSchemeColor:
          navigationBarIconSchemeColor ?? this.navigationBarIconSchemeColor,
      //
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
      navigationBarSelectedLabelSize:
          navigationBarSelectedLabelSize ?? this.navigationBarSelectedLabelSize,
      navigationBarUnselectedLabelSize: navigationBarUnselectedLabelSize ??
          this.navigationBarUnselectedLabelSize,
      navigationBarSelectedIconSize:
          navigationBarSelectedIconSize ?? this.navigationBarSelectedIconSize,
      navigationBarUnselectedIconSize: navigationBarUnselectedIconSize ??
          this.navigationBarUnselectedIconSize,
      navigationBarLabelBehavior:
          navigationBarLabelBehavior ?? this.navigationBarLabelBehavior,
      //
      navigationRailBackgroundSchemeColor:
          navigationRailBackgroundSchemeColor ??
              this.navigationRailBackgroundSchemeColor,
      navigationRailOpacity:
          navigationRailOpacity ?? this.navigationRailOpacity,
      navigationRailElevation:
          navigationRailElevation ?? this.navigationRailElevation,
      navigationRailIconSchemeColor:
          navigationRailIconSchemeColor ?? this.navigationRailIconSchemeColor,
      navigationRailUseIndicator:
          navigationRailUseIndicator ?? this.navigationRailUseIndicator,
      navigationRailIndicatorSchemeColor: navigationRailIndicatorSchemeColor ??
          this.navigationRailIndicatorSchemeColor,
      navigationRailTextSchemeColor:
          navigationRailTextSchemeColor ?? this.navigationRailTextSchemeColor,
      navigationRailMutedUnselectedIcon: navigationRailMutedUnselectedIcon ??
          this.navigationRailMutedUnselectedIcon,
      navigationRailMutedUnselectedText: navigationRailMutedUnselectedText ??
          this.navigationRailMutedUnselectedText,
      navigationRailSelectedLabelSize: navigationRailSelectedLabelSize ??
          this.navigationRailSelectedLabelSize,
      navigationRailUnselectedLabelSize: navigationRailUnselectedLabelSize ??
          this.navigationRailUnselectedLabelSize,
      navigationRailSelectedIconSize:
          navigationRailSelectedIconSize ?? this.navigationRailSelectedIconSize,
      navigationRailUnselectedIconSize: navigationRailUnselectedIconSize ??
          this.navigationRailUnselectedIconSize,
      navigationRailLabelType:
          navigationRailLabelType ?? this.navigationRailLabelType,
      navigationRailGroupAlignment:
          navigationRailGroupAlignment ?? this.navigationRailGroupAlignment,
    );
  }

  /// Override for equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSubThemesData &&
        other.interactionEffects == interactionEffects &&
        other.blendOnLevel == blendOnLevel &&
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
        other.textButtonSchemeColor == textButtonSchemeColor &&
        other.elevatedButtonSchemeColor == elevatedButtonSchemeColor &&
        other.outlinedButtonSchemeColor == outlinedButtonSchemeColor &&
        other.materialButtonSchemeColor == materialButtonSchemeColor &&
        other.toggleButtonsSchemeColor == toggleButtonsSchemeColor &&
        other.switchSchemeColor == switchSchemeColor &&
        other.checkboxSchemeColor == checkboxSchemeColor &&
        other.radioSchemeColor == radioSchemeColor &&
        other.unselectedToggleIsColored == unselectedToggleIsColored &&
        other.inputDecorationRadius == inputDecorationRadius &&
        other.inputDecoratorSchemeColor == inputDecoratorSchemeColor &&
        other.inputDecoratorIsFilled == inputDecoratorIsFilled &&
        other.inputDecoratorFillColor == inputDecoratorFillColor &&
        other.inputDecoratorBorderType == inputDecoratorBorderType &&
        other.inputDecoratorUnfocusedHasBorder ==
            inputDecoratorUnfocusedHasBorder &&
        other.fabRadius == fabRadius &&
        other.fabUseShape == fabUseShape &&
        other.fabSchemeColor == fabSchemeColor &&
        other.chipRadius == chipRadius &&
        other.chipSchemeColor == chipSchemeColor &&
        other.cardRadius == cardRadius &&
        other.cardElevation == cardElevation &&
        other.popupMenuRadius == popupMenuRadius &&
        other.popupMenuElevation == popupMenuElevation &&
        other.popupMenuOpacity == popupMenuOpacity &&
        other.dialogRadius == dialogRadius &&
        other.dialogElevation == dialogElevation &&
        other.dialogElevation == dialogElevation &&
        other.timePickerDialogRadius == timePickerDialogRadius &&
        other.snackBarElevation == snackBarElevation &&
        other.appBarBackgroundSchemeColor == appBarBackgroundSchemeColor &&
        other.tabBarItemSchemeColor == tabBarItemSchemeColor &&
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
        other.navigationBarIsStyled == navigationBarIsStyled &&
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
        other.navigationBarSelectedLabelSize ==
            navigationBarSelectedLabelSize &&
        other.navigationBarUnselectedLabelSize ==
            navigationBarUnselectedLabelSize &&
        other.navigationBarSelectedIconSize == navigationBarSelectedIconSize &&
        other.navigationBarUnselectedIconSize ==
            navigationBarUnselectedIconSize &&
        other.navigationBarLabelBehavior == navigationBarLabelBehavior &&
        other.navigationRailBackgroundSchemeColor ==
            navigationRailBackgroundSchemeColor &&
        other.navigationRailOpacity == navigationRailOpacity &&
        other.navigationRailElevation == navigationRailElevation &&
        other.navigationRailIconSchemeColor == navigationRailIconSchemeColor &&
        other.navigationRailUseIndicator == navigationRailUseIndicator &&
        other.navigationRailIndicatorSchemeColor ==
            navigationRailIndicatorSchemeColor &&
        other.navigationRailTextSchemeColor == navigationRailTextSchemeColor &&
        other.navigationRailMutedUnselectedIcon ==
            navigationRailMutedUnselectedIcon &&
        other.navigationRailMutedUnselectedText ==
            navigationRailMutedUnselectedText &&
        other.navigationRailSelectedLabelSize ==
            navigationRailSelectedLabelSize &&
        other.navigationRailUnselectedLabelSize ==
            navigationRailUnselectedLabelSize &&
        other.navigationRailSelectedIconSize ==
            navigationRailSelectedIconSize &&
        other.navigationRailUnselectedIconSize ==
            navigationRailUnselectedIconSize &&
        other.navigationRailLabelType == navigationRailLabelType &&
        other.navigationRailGroupAlignment == navigationRailGroupAlignment;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode {
    return hashList(<Object?>[
      interactionEffects,
      blendOnLevel,
      blendOnColors,
      //
      blendTextTheme,
      useTextTheme,
      //
      defaultRadius,
      buttonMinSize,
      buttonPadding,
      //
      thickBorderWidth,
      thinBorderWidth,
      textButtonRadius,
      elevatedButtonRadius,
      elevatedButtonElevation,
      outlinedButtonRadius,
      toggleButtonsRadius,
      //
      textButtonSchemeColor,
      elevatedButtonSchemeColor,
      outlinedButtonSchemeColor,
      materialButtonSchemeColor,
      toggleButtonsSchemeColor,
      //
      switchSchemeColor,
      checkboxSchemeColor,
      radioSchemeColor,
      unselectedToggleIsColored,
      //
      inputDecorationRadius,
      inputDecoratorSchemeColor,
      inputDecoratorIsFilled,
      inputDecoratorFillColor,
      inputDecoratorBorderType,
      inputDecoratorUnfocusedHasBorder,
      //
      fabRadius,
      fabUseShape,
      fabSchemeColor,
      //
      chipRadius,
      chipSchemeColor,
      //
      cardRadius,
      cardElevation,
      //
      popupMenuRadius,
      popupMenuElevation,
      popupMenuOpacity,
      //
      dialogRadius,
      dialogElevation,
      dialogBackgroundSchemeColor,
      timePickerDialogRadius,
      //
      snackBarElevation,
      appBarBackgroundSchemeColor,
      tabBarItemSchemeColor,
      tabBarIndicatorSchemeColor,
      //
      bottomSheetRadius,
      bottomSheetElevation,
      bottomSheetModalElevation,
      //
      bottomNavigationBarElevation,
      bottomNavigationBarOpacity,
      bottomNavigationBarSchemeColor,
      bottomNavigationBarBackgroundSchemeColor,
      bottomNavigationBarLandscapeLayout,
      //
      navigationBarIsStyled,
      navigationBarHeight,
      navigationBarOpacity,
      navigationBarIconSchemeColor,
      navigationBarTextSchemeColor,
      navigationBarHighlightSchemeColor,
      navigationBarBackgroundSchemeColor,
      navigationBarMutedUnselectedIcon,
      navigationBarMutedUnselectedText,
      navigationBarSelectedLabelSize,
      navigationBarUnselectedLabelSize,
      navigationBarSelectedIconSize,
      navigationBarUnselectedIconSize,
      navigationBarLabelBehavior,
      navigationRailBackgroundSchemeColor,
      //
      navigationRailOpacity,
      navigationRailElevation,
      navigationRailIconSchemeColor,
      navigationRailUseIndicator,
      navigationRailIndicatorSchemeColor,
      navigationRailTextSchemeColor,
      navigationRailMutedUnselectedIcon,
      navigationRailMutedUnselectedText,
      navigationRailSelectedLabelSize,
      navigationRailUnselectedLabelSize,
      navigationRailSelectedIconSize,
      navigationRailUnselectedIconSize,
      navigationRailLabelType,
      navigationRailGroupAlignment,
    ]);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<bool>('interactionEffects', interactionEffects));
    properties.add(DiagnosticsProperty<int>('blendOnLevel ', blendOnLevel));
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
    properties.add(EnumProperty<SchemeColor>(
        'textButtonSchemeColor', textButtonSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'elevatedButtonSchemeColor', elevatedButtonSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'outlinedButtonSchemeColor', outlinedButtonSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'materialButtonSchemeColor', materialButtonSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'toggleButtonsSchemeColor', toggleButtonsSchemeColor));
    properties
        .add(EnumProperty<SchemeColor>('switchSchemeColor', switchSchemeColor));
    properties.add(
        EnumProperty<SchemeColor>('checkboxSchemeColor', checkboxSchemeColor));
    properties
        .add(EnumProperty<SchemeColor>('radioSchemeColor', radioSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'unselectedToggleIsColored', unselectedToggleIsColored));
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
    properties.add(EnumProperty<SchemeColor>('fabSchemeColor', fabSchemeColor));
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
    properties.add(EnumProperty<SchemeColor>(
        'dialogBackgroundSchemeColor', dialogBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'timePickerDialogRadius', timePickerDialogRadius));
    properties.add(
        DiagnosticsProperty<double>('snackBarElevation', snackBarElevation));
    properties.add(EnumProperty<SchemeColor>(
        'appBarBackgroundSchemeColor', appBarBackgroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'tabBarItemSchemeColor', tabBarItemSchemeColor));
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
    properties.add(DiagnosticsProperty<bool>(
        'navigationBarIsStyled', navigationBarIsStyled));
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
    properties.add(DiagnosticsProperty<double>(
        'navigationBarSelectedLabelSize', navigationBarSelectedLabelSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarUnselectedLabelSize', navigationBarUnselectedLabelSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarSelectedIconSize', navigationBarSelectedIconSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarUnselectedIconSize', navigationBarUnselectedIconSize));
    properties.add(EnumProperty<NavigationDestinationLabelBehavior>(
        'navigationBarLabelBehavior', navigationBarLabelBehavior));
    //
    properties.add(DiagnosticsProperty<SchemeColor>(
        'navigationRailBackgroundSchemeColor',
        navigationRailBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailOpacity', navigationRailOpacity));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailElevation', navigationRailElevation));
    //
    properties.add(EnumProperty<SchemeColor>(
        'navigationRailIconSchemeColor', navigationRailIconSchemeColor));
    //
    properties.add(DiagnosticsProperty<bool>(
        'navigationRailUseIndicator', navigationRailUseIndicator));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'navigationRailIndicatorSchemeColor',
        navigationRailIndicatorSchemeColor));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'navigationRailTextSchemeColor', navigationRailTextSchemeColor));
    //
    properties.add(DiagnosticsProperty<bool>(
        'navigationRailMutedUnselectedIcon',
        navigationRailMutedUnselectedIcon));
    properties.add(DiagnosticsProperty<bool>(
        'navigationRailMutedUnselectedText',
        navigationRailMutedUnselectedText));
    //
    properties.add(DiagnosticsProperty<double>(
        'navigationRailSelectedLabelSize', navigationRailSelectedLabelSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailUnselectedLabelSize',
        navigationRailUnselectedLabelSize));
    //
    properties.add(EnumProperty<double>(
        'navigationRailSelectedIconSize', navigationRailSelectedIconSize));
    properties.add(EnumProperty<double>(
        'navigationRailUnselectedIconSize', navigationRailUnselectedIconSize));
    //
    properties.add(EnumProperty<NavigationRailLabelType>(
        'navigationRailGroupAlignment', navigationRailLabelType));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailGroupAlignment', navigationRailGroupAlignment));
  }
}
