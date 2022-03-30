import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_constants.dart';
import 'flex_sub_themes.dart';

// ignore_for_file: comment_references

/// Parameters used by [FlexColorScheme] to configure [FlexSubThemes] when
/// [FlexColorScheme.useSubThemes] is true.
///
/// The list of properties in the flat configuration class has grown to insane
/// size, while it can be a bit tricky to maintain, using it is easy and quite
/// a convenient way to adjust commonly used properties on UI component
/// widgets' sub-themes.
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
    this.useFlutterDefaults = false,
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
    this.materialButtonSchemeColor,
    this.toggleButtonsSchemeColor,
    //
    this.switchSchemeColor,
    this.checkboxSchemeColor,
    this.radioSchemeColor,
    this.unselectedToggleIsColored = false,
    //
    @Deprecated('This property has been replaced after 4.2.0. To harmonize '
        'input decorator property names it has been renamed to '
        'inputDecoratorRadius, please use it instead.')
        this.inputDecorationRadius,
    this.inputDecoratorRadius,
    this.inputDecoratorSchemeColor,
    this.inputDecoratorIsFilled = true,
    this.inputDecoratorFillColor,
    this.inputDecoratorBorderType = FlexInputBorderType.outline,
    this.inputDecoratorUnfocusedHasBorder = true,
    this.inputDecoratorUnfocusedBorderIsColored = true,
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
    this.snackBarBackgroundSchemeColor,
    //
    this.appBarBackgroundSchemeColor,
    this.tabBarItemSchemeColor,
    this.tabBarIndicatorSchemeColor,
    //
    this.bottomSheetRadius,
    this.bottomSheetElevation = kBottomSheetElevation,
    this.bottomSheetModalElevation = kBottomSheetModalElevation,
    //
    this.bottomNavigationBarLabelTextStyle,
    this.bottomNavigationBarSelectedLabelSize,
    this.bottomNavigationBarUnselectedLabelSize,
    this.bottomNavigationBarSelectedLabelSchemeColor,
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'bottomNavigationBarSelectedLabelSchemeColor.')
        this.bottomNavigationBarSchemeColor,
    this.bottomNavigationBarUnselectedLabelSchemeColor,
    this.bottomNavigationBarMutedUnselectedLabel = true,
    this.bottomNavigationBarSelectedIconSize,
    this.bottomNavigationBarUnselectedIconSize,
    this.bottomNavigationBarSelectedIconSchemeColor,
    this.bottomNavigationBarUnselectedIconSchemeColor,
    this.bottomNavigationBarMutedUnselectedIcon = true,
    this.bottomNavigationBarBackgroundSchemeColor,
    this.bottomNavigationBarOpacity = 1,
    this.bottomNavigationBarElevation = kBottomNavigationBarElevation,
    this.bottomNavigationBarShowSelectedLabels = true,
    this.bottomNavigationBarShowUnselectedLabels = true,
    this.bottomNavigationBarType = BottomNavigationBarType.fixed,
    this.bottomNavigationBarLandscapeLayout,
    //
    @Deprecated('This property has no function after 4.2.0. It has been '
        'replaced by FlexSubThemesData.useFlutterDefaults, please see it '
        'for more details.')
        this.navigationBarIsStyled = true,
    this.navigationBarLabelTextStyle,
    this.navigationBarSelectedLabelSize,
    this.navigationBarUnselectedLabelSize,
    this.navigationBarSelectedLabelSchemeColor,
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'navigationBarSelectedLabelSchemeColor.')
        this.navigationBarTextSchemeColor,
    this.navigationBarUnselectedLabelSchemeColor,
    this.navigationBarMutedUnselectedLabel = true,
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'navigationBarMutedUnselectedLabel.')
        this.navigationBarMutedUnselectedText,
    this.navigationBarSelectedIconSize,
    this.navigationBarUnselectedIconSize,
    this.navigationBarSelectedIconSchemeColor,
    @Deprecated('This property has no function after 4.2.0. To harmonize '
        'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
        'version 5 and later this property has been replaced by: '
        'navigationBarSelectedIconSchemeColor.')
        this.navigationBarIconSchemeColor,
    this.navigationBarUnselectedIconSchemeColor,
    this.navigationBarMutedUnselectedIcon = true,
    this.navigationBarHighlightSchemeColor,
    this.navigationBarBackgroundSchemeColor,
    this.navigationBarOpacity = 1,
    this.navigationBarHeight = kNavigationBarHeight,
    this.navigationBarLabelBehavior =
        NavigationDestinationLabelBehavior.alwaysShow,
    //
    this.navigationRailLabelTextStyle,
    this.navigationRailSelectedLabelSize,
    this.navigationRailUnselectedLabelSize,
    this.navigationRailSelectedLabelSchemeColor,
    this.navigationRailUnselectedLabelSchemeColor,
    this.navigationRailMutedUnselectedLabel = true,
    this.navigationRailSelectedIconSize,
    this.navigationRailUnselectedIconSize,
    this.navigationRailSelectedIconSchemeColor,
    this.navigationRailUnselectedIconSchemeColor,
    this.navigationRailMutedUnselectedIcon = true,
    this.navigationRailUseIndicator = true,
    this.navigationRailIndicatorSchemeColor,
    this.navigationRailBackgroundSchemeColor,
    this.navigationRailOpacity = 1,
    this.navigationRailElevation = kNavigationRailElevation,
    this.navigationRailLabelType = NavigationRailLabelType.all,
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

  /// Set to true to use Flutter SDK default component theme designs.
  ///
  /// When set to `true`, many properties that in [FlexSubThemesData] are
  /// nullable and default to 'null, but that as undefined default to using
  /// theming choices that differ from Flutter SDK default component theme
  /// designs, will when this property is set to true default to
  /// using Flutter SDK defaults, instead of its own opinionated defaults.
  ///
  /// When you use this flag you loose many of the harmonizing defaults
  /// [FlexColorScheme.subThemesData] bring, but it may serve as an optional
  /// starting point for your own custom component themes with fewer `copyWith`
  /// overrides needed for its opinionated choices.
  ///
  /// The individual [FlexSubThemesData] properties document their adherence
  /// to this setting, they are also listed here:
  ///
  /// - [navigationBarBackgroundSchemeColor]
  ///   * false: [ColorScheme.background]
  ///   * true: [ColorScheme.surface] with onSurface overlay elevation 3.
  /// - NN2
  ///   * false: FlexColorScheme
  ///   * true: Flutter
  /// - NN3
  ///   * false: FlexColorScheme
  ///   * true: Flutter
  ///
  ///
  /// Defaults to false.
  final bool useFlutterDefaults;

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
  /// * [FloatingActionButton]
  /// * [InputDecoration]
  /// * [Card]
  /// * [Chip]
  /// * [PopupMenuButton]
  /// * [Dialog]
  /// * [TimePickerDialog]
  /// * [BottomSheet]
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
  /// Defaults to false, set it to for slightly different style.
  final bool unselectedToggleIsColored;

  /// Deprecated border radius override value for [InputDecoration],
  /// this property has been replaced by [inputDecoratorRadius].
  @Deprecated('This property has been replaced after 4.2.0. To harmonize '
      'input decorator property names it has been renamed to '
      'inputDecoratorRadius, please use it instead.')
  final double? inputDecorationRadius;

  /// Border radius override value for [InputDecoration].
  final double? inputDecoratorRadius;

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
  /// [inputDecoratorRadius] that will then override [defaultRadius].
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

  /// Determines if the [InputDecorator] unfocused state has a colored border.
  ///
  /// Defaults to true.
  ///
  /// Applies to both outline and underline mode. Does not have any effect
  /// if [inputDecoratorUnfocusedHasBorder] is false.
  ///
  /// The default design in FlexColorScheme when this is true, creates
  /// unfocused border that use [inputDecoratorSchemeColor] as it s color with
  /// alpha set to [kEnabledBorderAlpha] (90%) using the [thinBorderWidth] as
  /// its width.
  ///
  /// When false the border/underline will revert back to using Flutter M2
  /// defaults when unselected, which is [ColorScheme.onSurface] with 38%
  /// opacity.
  ///
  /// The unfocused border color selection also applies to it hovered state.
  final bool inputDecoratorUnfocusedBorderIsColored;

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

  /// Defines which [Theme] based [ColorScheme] based color the Chips
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

  /// Defines which [Theme] based [ColorScheme] based color the dialogs use as
  /// as their background color.
  ///
  /// This will affect both background in [DialogTheme] and
  /// [TimePickerThemeData].
  ///
  /// Defaults to [SchemeColor.surface].
  ///
  /// If set to null [Dialog] will use its Flutter SDK default, which is
  /// [ThemeData.dialogBackgroundColor] which again is [ColorScheme.background].
  /// [TimePickerDialog] dialogs will use their own Flutter SDK default,
  /// which is [ColorScheme.surface].
  ///
  /// Since FlexColorScheme also sets [ThemeData.dialogBackgroundColor] to
  /// [ColorScheme.surface], there is no difference when using FlexColorscheme
  /// and setting [dialogBackgroundSchemeColor] to null versus keeping it
  /// at its default value SchemeColor.surface]. This is valid as long as
  /// [ThemeData.dialogBackgroundColor] exists, but it will be in deprecated,
  /// see issue https://github.com/flutter/flutter/issues/91772.
  /// After that there will be a difference.
  ///
  /// Using surface color as default instead of background,
  /// ensures that dark mode dialogs will get elevation overlay
  /// color, also when surface and background color are not equal.
  /// See issue: https://github.com/flutter/flutter/issues/90353
  final SchemeColor? dialogBackgroundSchemeColor;

  /// Border radius override value for [TimePickerDialog].
  final double? timePickerDialogRadius;

  /// Elevation of [SnackBar].
  ///
  /// Defaults to [kSnackBarElevation] = 4.
  final double snackBarElevation;

  /// Defines which [Theme] based [ColorScheme] based color the SnackBars
  /// use as their base color. Typically one of inverse brightness compared
  /// to theme's surface color brightness.
  ///
  /// If not defined it defaults to the opinionated color FlexColorScheme (FCS)
  /// choice below when used via [FlexSubThemesData].
  ///
  /// * In light theme mode:
  ///   * FCS: onSurface with primary blend at 45% opacity, with tot opacity 95%
  ///   * Flutter SDK uses: onSurface with surface at opacity 80%, blended on
  ///     top of surface.
  ///
  /// * In dark theme mode:
  ///   * FCS: onSurface with primary blend at 39% opacity, with tot opacity 93%
  ///   * Flutter SDK uses: colorScheme.onSurface
  ///
  /// In M3 design the default will likely be [ColorScheme.inversePrimary],
  /// which you can assign by selecting that as its property here too.
  final SchemeColor? snackBarBackgroundSchemeColor;

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

  // ---------------------------------------------------------------------------
  //
  // BottomNavigationBar Properties
  //
  // ---------------------------------------------------------------------------

  /// Optional text style for the [BottomNavigationBar] labels.
  ///
  /// If null, it is kept as null if all text styling properties are
  /// also null, resulting in default SDK text style being used by the
  /// [BottomNavigationBar] widget.
  ///
  /// If null, but if any of the text styling properties for size and colors
  /// are defined, the text style [FlexColorScheme.m3TextTheme.bodyMedium]
  /// will be used as base style for the text style.
  ///
  /// Flutter SDK defaults to using the theme's [TextTheme.bodyText1] which
  /// is size 16dp, the FlexColorScheme bodyMedium size is 14dp, which is
  /// a more appropriate size for the rail's text.
  ///
  /// The size and colors defined in any of the text size and color properties
  /// are applied as overrides on the effective text style.
  final TextStyle? bottomNavigationBarLabelTextStyle;

  /// The size of the text label on selected [BottomNavigationBar] item.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item, 14 is used as fallback if needed.
  final double? bottomNavigationBarSelectedLabelSize;

  /// The size of the text label on unselected [BottomNavigationBar] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on unselected items, 14 is used as fallback if needed.
  final double? bottomNavigationBarUnselectedLabelSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [BottomNavigationBar]'s selected label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.primary]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the
  /// [BottomNavigationBar], which is [Theme]'s [ColorScheme.primary].
  final SchemeColor? bottomNavigationBarSelectedLabelSchemeColor;

  /// Deprecated and replaced by [bottomNavigationBarSelectedLabelSchemeColor].
  @Deprecated('This property has no function after 4.2.0. To harmonize '
      'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
      'version 5 and later this property has been replaced by: '
      'bottomNavigationBarSelectedLabelSchemeColor.')
  final SchemeColor? bottomNavigationBarSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [BottomNavigationBar]'s unselected items text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.onSurface]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the
  /// [BottomNavigationBar], which is [Theme]'s [ColorScheme.onSurface].
  final SchemeColor? bottomNavigationBarUnselectedLabelSchemeColor;

  /// If true, the unselected labels in the [BottomNavigationBar] use a more
  /// muted color version of the color defined by
  /// [bottomNavigationBarUnselectedLabelSchemeColor].
  ///
  /// If null, defaults to false.
  final bool? bottomNavigationBarMutedUnselectedLabel;

  /// The size of the icon on selected [BottomNavigationBar] item.
  ///
  /// If null, it defaults to 24.
  final double? bottomNavigationBarSelectedIconSize;

  /// The size of the icon on unselected [BottomNavigationBar] items.
  ///
  /// If null, defaults to [bottomNavigationBarSelectedIconSize].
  final double? bottomNavigationBarUnselectedIconSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [BottomNavigationBar]'s selected item icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.primary]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the
  /// [BottomNavigationBar], which is [Theme]'s [ColorScheme.primary].
  final SchemeColor? bottomNavigationBarSelectedIconSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the [BottomNavigationBar]'s unselected items icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.onSurface]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the
  /// [BottomNavigationBar], which is [Theme]'s [ColorScheme.onSurface].
  final SchemeColor? bottomNavigationBarUnselectedIconSchemeColor;

  /// If true, the unselected icon in the [BottomNavigationBar] use a more muted
  /// color version of the color defined by
  /// [bottomNavigationBarUnselectedIconSchemeColor].
  ///
  /// The [BottomNavigationBar] also defaults via Flutter SDK default to a more
  /// muted unselected color when it uses its defaults, which will happen here
  /// too when all item colors and sizes are set to their null default,
  /// even if [bottomNavigationBarMutedUnselectedIcon] is set to false.
  ///
  /// If null, defaults to false.
  final bool? bottomNavigationBarMutedUnselectedIcon;

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [BottomNavigationBar].
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.background]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the
  /// [BottomNavigationBar], which is [Theme]'s [ColorScheme.surface].
  ///
  /// NOTE:
  /// FlexColorScheme sets background defaults of [BottomNavigationBar],
  /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
  /// when it is using component sub-themes.
  /// Flutter SDK uses different colors on all three widgets. Our opinion is
  /// that they should all default to using the same [ColorScheme] based
  /// color. FlexColorScheme uses the background color as that default.
  final SchemeColor? bottomNavigationBarBackgroundSchemeColor;

  /// BottomNavigationBar background opacity.
  ///
  /// Defaults to 1, fully opaque.
  final double bottomNavigationBarOpacity;

  /// Elevation of [BottomNavigationBar].
  ///
  /// Defaults to [kBottomNavigationBarElevation] = 0.
  final double bottomNavigationBarElevation;

  /// Whether the labels are shown for the selected
  /// [BottomNavigationBarItem].
  final bool bottomNavigationBarShowSelectedLabels;

  /// Whether the labels are shown for the unselected
  /// [BottomNavigationBarItem]s.
  final bool bottomNavigationBarShowUnselectedLabels;

  /// Defines the layout and behavior of a [BottomNavigationBar].
  ///
  /// The enum [BottomNavigationBarType] can be
  /// * [BottomNavigationBarType.fixed], where items have fixed width.
  /// * [BottomNavigationBarType.shifting], where location and size of the
  ///   items animate and labels fade in when they are tapped.
  final BottomNavigationBarType? bottomNavigationBarType;

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

  // ---------------------------------------------------------------------------
  //
  // NavigationBar Properties
  //
  // ---------------------------------------------------------------------------

  /// Deprecated and removed styling property that caused the NavigationBar
  /// to default to its Flutter SDK default theme when sub-theme properties
  /// were null.
  ///
  /// This property has no function after 4.2.0. It has been replaced by
  /// [FlexSubThemesData.useFlutterDefaults], please see it for more details.
  @Deprecated('This property has no function after 4.2.0. It has been '
      'replaced by FlexSubThemesData.useFlutterDefaults, please see it '
      'for more details.')
  final bool? navigationBarIsStyled;

  /// Optional text style for the [NavigationBar] labels.
  ///
  /// If null, it is kept as null if all text styling properties are
  /// also null, resulting in default SDK text style being used by the
  /// [NavigationBar] widget.
  ///
  /// If null, but if any of the text styling properties for size and colors
  /// are defined, the text style [FlexColorScheme.m3TextTheme.labelSmall]
  /// will be used as base style for the text style.
  ///
  /// Flutter SDK defaults to using the theme's [TextTheme.bodyText1] which
  /// is size 16dp, the FlexColorScheme bodyMedium size is 14dp, which is
  /// a more appropriate size for the rail's text.
  ///
  /// The size and colors defined in any of the text size and color properties
  /// are applied as overrides on the effective text style.
  final TextStyle? navigationBarLabelTextStyle;

  /// The size of the text label on selected [NavigationBar] item.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item, 11 is used as fallback if needed.
  final double? navigationBarSelectedLabelSize;

  /// The size of the text label on unselected [NavigationBar] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on unselected items, 11 is used as fallback if needed.
  final double? navigationBarUnselectedLabelSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationBar]'s selected label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.primary]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationBar],
  /// which is [Theme]'s [ColorScheme.onSurface].
  final SchemeColor? navigationBarSelectedLabelSchemeColor;

  /// Deprecated and replaced by [navigationBarSelectedLabelSchemeColor].
  @Deprecated('This property has no function after 4.2.0. To harmonize '
      'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
      'version 5 and later this property has been replaced by: '
      'navigationBarSelectedLabelSchemeColor.')
  final SchemeColor? navigationBarTextSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationBar]'s unselected label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.onSurface]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationBar],
  /// which is [Theme]'s [ColorScheme.onSurface].
  final SchemeColor? navigationBarUnselectedLabelSchemeColor;

  /// If true, the unselected labels in the [NavigationBar] use a more muted
  /// color version of the color defined by [unselectedLabelSchemeColor].
  ///
  /// If null, defaults to false.
  final bool? navigationBarMutedUnselectedLabel;

  /// Deprecated and replaced by [navigationBarMutedUnselectedLabel].
  @Deprecated('This property has no function after 4.2.0. To harmonize '
      'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
      'version 5 and later this property has been replaced by: '
      'navigationBarMutedUnselectedLabel.')
  final bool? navigationBarMutedUnselectedText;

  /// The size of the icon on selected [NavigationBar] item.
  ///
  /// If null, it defaults to 24.
  final double? navigationBarSelectedIconSize;

  /// The size of the icon on unselected [NavigationBar] items.
  ///
  /// If null, defaults to [navigationBarSelectedIconSize].
  final double? navigationBarUnselectedIconSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationBar]'s selected item icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.primary]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationBar],
  /// which is [Theme]'s [ColorScheme.onSurface].
  final SchemeColor? navigationBarSelectedIconSchemeColor;

  /// Deprecated and replaced by [navigationBarSelectedIconSchemeColor].
  @Deprecated('This property has no function after 4.2.0. To harmonize '
      'NavigationBar, BottomNavigationBar and NavigationRail sub-themes in '
      'version 5 and later this property has been replaced by: '
      'navigationBarSelectedIconSchemeColor.')
  final SchemeColor? navigationBarIconSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationBar]'s unselected item icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.onSurface]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationBar],
  /// which is [Theme]'s [ColorScheme.onSurface].
  final SchemeColor? navigationBarUnselectedIconSchemeColor;

  /// If true, the unselected icon in the [NavigationBar] use a more muted
  /// color version of the color defined by
  /// [navigationBarUnselectedIconSchemeColor].
  ///
  /// If null, defaults to false.
  final bool? navigationBarMutedUnselectedIcon;

  /// Select which color from the theme [ColorScheme] to use as base for
  /// the selected [NavigationBar]'s highlighted item.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.primary]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationBar],
  /// which is [Theme]'s [ColorScheme.secondary].
  ///
  /// NOTE:
  /// The "Highlight" Color is same concept as "Indicator" color on the
  /// [NavigationRail], but for some ood reason it is called "Highlight" on the
  /// [NavigationBar] in the SDK, so the name was used here too. Had
  /// navigation bar followed prior art, then this should be called indicator
  /// color too.
  final SchemeColor? navigationBarHighlightSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [NavigationBar].
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.background]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationRail],
  /// which is [Theme]'s [ColorScheme.surface], with an [ColorScheme.onSurface]
  /// used as overlay color with hard coded overlay elevation 3. The actual
  /// elevation is hard coded to 0.
  ///
  /// NOTE:
  /// FlexColorScheme sets background defaults of [NavigationRail],
  /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
  /// when it is using component sub-themes.
  /// Flutter SDK uses different colors on all three widgets. Our opinion is
  /// that they should all default to using the same [ColorScheme] based
  /// color. FlexColorScheme uses the background color as that default.
  final SchemeColor? navigationBarBackgroundSchemeColor;

  /// Height of the container for the Material 3 [NavigationBar].
  ///
  /// Defaults to [kNavigationBarHeight] which is 62 dp
  ///
  /// If set to null, it will default to the widgets un-themed default height
  /// which is 80 dp.
  final double? navigationBarHeight;

  /// NavigationBar background opacity.
  ///
  /// Defaults to 1, fully opaque.
  final double navigationBarOpacity;

  /// Specifies when each [NavigationDestination]'s label should appear.
  ///
  /// Default to [NavigationDestinationLabelBehavior.alwaysShow].
  /// If set to null, it will also default to
  /// [NavigationDestinationLabelBehavior.alwaysShow] as that is the Flutter
  /// SDK default behavior for it.
  final NavigationDestinationLabelBehavior? navigationBarLabelBehavior;

  // ---------------------------------------------------------------------------
  //
  // Navigation Rail Properties
  //
  // ---------------------------------------------------------------------------

  /// Optional text style for the [NavigationRail] labels.
  ///
  /// If null, it is kept as null if all text styling properties are
  /// also null, resulting in default SDK text style being used by the
  /// [NavigationRail] widget.
  ///
  /// If null, but if any of the text styling properties for size and colors
  /// are defined, the text style [FlexColorScheme.m3TextTheme.bodyMedium]
  /// will be used as base style for the text style.
  ///
  /// Flutter SDK defaults to using the theme's [TextTheme.bodyText1] which
  /// is size 16dp, the FlexColorScheme bodyMedium size is 14dp, which is
  /// a more appropriate size for the rail's text.
  ///
  /// The size and colors defined in any of the text size and color properties
  /// are applied as overrides on the effective text style.
  final TextStyle? navigationRailLabelTextStyle;

  /// The size of the text label on selected [NavigationRail] item.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item, 14 is used as fallback if needed.
  final double? navigationRailSelectedLabelSize;

  /// The size of the text label on unselected [NavigationRail] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on unselected items, 14 is used as fallback if needed.
  final double? navigationRailUnselectedLabelSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationRail]'s selected label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.primary]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationRail],
  /// which is [Theme]'s [ColorScheme.primary].
  final SchemeColor? navigationRailSelectedLabelSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationRail]'s unselected items text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.onSurface]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationRail],
  /// which is [Theme]'s [ColorScheme.onSurface].
  final SchemeColor? navigationRailUnselectedLabelSchemeColor;

  /// If true, the unselected labels in the [NavigationRail] use a more muted
  /// color version of the color defined by
  /// [navigationRailUnselectedLabelSchemeColor].
  ///
  /// If null, defaults to false.
  final bool? navigationRailMutedUnselectedLabel;

  /// The size of the icon on selected [NavigationRail] item.
  ///
  /// If null, it defaults to 24.
  final double? navigationRailSelectedIconSize;

  /// The size of the icon on unselected [NavigationRail] items.
  ///
  /// If null, defaults to [navigationRailSelectedIconSize].
  final double? navigationRailUnselectedIconSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationRail]'s selected item icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.primary]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationRail],
  /// which is [Theme]'s [ColorScheme.primary].
  final SchemeColor? navigationRailSelectedIconSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the [NavigationRail]'s unselected items icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.onSurface]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationRail],
  /// which is [Theme]'s [ColorScheme.onSurface].
  final SchemeColor? navigationRailUnselectedIconSchemeColor;

  /// If true, the unselected icon in the [NavigationRail] use a more muted
  /// color version of the color defined by
  /// [navigationRailUnselectedIconSchemeColor].
  ///
  /// The [NavigationRail] also defaults via Flutter SDK default to a more
  /// muted unselected color when it uses its defaults, which will happen here
  /// too when all item colors and sizes are set to their null default,
  /// even if [navigationRailMutedUnselectedIcon] is set to false.
  ///
  /// If null, defaults to false.
  final bool? navigationRailMutedUnselectedIcon;

  /// Whether or not the selected [NavigationRail] item should include a
  /// [NavigationIndicator].
  ///
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
  /// Defaults to true. Can be set to null and then uses above default
  /// widget behavior.
  final bool? navigationRailUseIndicator;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the selected [NavigationRail]'s selected item's pill shaped highlight
  /// indicator color.
  ///
  /// Defaults to [SchemeColor.primary]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationRail],
  /// which is [Theme]'s [ColorScheme.secondary].
  ///
  /// NOTE:
  /// The "Indicator" color is same concept as "Highlight" color on the
  /// [NavigationBar], but for some ood reason it is called "Indicator" on the
  /// [NavigationRail] in the SDK, so the name was used here too. Navigation
  /// rail existed before navigation bar, so it is the navigation bar that
  /// for some reason deviates from established name for no reason
  /// in Flutter API.
  final SchemeColor? navigationRailIndicatorSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [NavigationRail].
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// Defaults to [SchemeColor.background]. If set to null, the effective value
  /// depends on Flutter's default un-themed behaviour for the [NavigationRail],
  /// which is [Theme]'s [ColorScheme.surface].
  ///
  /// NOTE:
  /// FlexColorScheme sets background defaults of [NavigationRail],
  /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
  /// when it is using component sub-themes.
  /// Flutter SDK uses different colors on all three widgets. Our opinion is
  /// that they should all default to using the same [ColorScheme] based
  /// color. FlexColorScheme uses the background color as that default.
  final SchemeColor? navigationRailBackgroundSchemeColor;

  /// NavigationRail background opacity.
  ///
  /// Defaults to 1, fully opaque.
  final double navigationRailOpacity;

  /// The z-coordinate to be used for the [NavigationRail]'s elevation.
  ///
  /// Default is [kNavigationRailElevation] = 0.
  final double navigationRailElevation;

  /// Defines the layout and behavior of the labels for the un-extended
  /// [NavigationRail].
  ///
  /// The type are:
  ///
  /// * [NavigationRailLabelType.none] labels on rail items are never shown.
  /// * [NavigationRailLabelType.selected] label is only shown on selected
  ///   rail item.
  /// * [NavigationRailLabelType.all] label is shown on all rail items.
  ///
  /// When a navigation rail is [extended], the labels are always shown.
  ///
  /// Default to [NavigationRailLabelType.all]. FlexColorScheme uses all so that
  /// it by default will match the behavior on [NavigationBar].
  ///
  /// If set to null it will default Flutter SDK default
  /// behavior [NavigationRailLabelType.none].
  final NavigationRailLabelType? navigationRailLabelType;

  /// The vertical alignment for the group of [destinations] within a
  /// [NavigationRail].
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
  final double? navigationRailGroupAlignment;

  /// Copy the object with one or more provided properties changed.
  FlexSubThemesData copyWith({
    final bool? interactionEffects,
    final int? blendOnLevel,
    final bool? blendOnColors,
    final bool? useFlutterDefaults,
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
    //
    final bool? unselectedToggleIsColored,
    final double? inputDecoratorRadius,
    final SchemeColor? inputDecoratorSchemeColor,
    final bool? inputDecoratorIsFilled,
    final Color? inputDecoratorFillColor,
    final FlexInputBorderType? inputDecoratorBorderType,
    final bool? inputDecoratorUnfocusedHasBorder,
    final bool? inputDecoratorUnfocusedBorderIsColored,
    //
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
    final SchemeColor? snackBarBackgroundSchemeColor,
    final SchemeColor? appBarBackgroundSchemeColor,
    final SchemeColor? tabBarItemSchemeColor,
    final SchemeColor? tabBarIndicatorSchemeColor,
    //
    final double? bottomSheetRadius,
    final double? bottomSheetElevation,
    final double? bottomSheetModalElevation,
    //
    final TextStyle? bottomNavigationBarLabelTextStyle,
    final double? bottomNavigationBarSelectedLabelSize,
    final double? bottomNavigationBarUnselectedLabelSize,
    final SchemeColor? bottomNavigationBarSelectedLabelSchemeColor,
    final SchemeColor? bottomNavigationBarUnselectedLabelSchemeColor,
    final bool? bottomNavigationBarMutedUnselectedLabel,
    final double? bottomNavigationBarSelectedIconSize,
    final double? bottomNavigationBarUnselectedIconSize,
    final SchemeColor? bottomNavigationBarSelectedIconSchemeColor,
    final SchemeColor? bottomNavigationBarUnselectedIconSchemeColor,
    final bool? bottomNavigationBarMutedUnselectedIcon,
    final SchemeColor? bottomNavigationBarBackgroundSchemeColor,
    final double? bottomNavigationBarOpacity,
    final double? bottomNavigationBarElevation,
    final bool? bottomNavigationBarShowSelectedLabels,
    final bool? bottomNavigationBarShowUnselectedLabels,
    final BottomNavigationBarType? bottomNavigationBarType,
    final BottomNavigationBarLandscapeLayout?
        bottomNavigationBarLandscapeLayout,
    //
    final TextStyle? navigationBarLabelTextStyle,
    final double? navigationBarSelectedLabelSize,
    final double? navigationBarUnselectedLabelSize,
    final SchemeColor? navigationBarSelectedLabelSchemeColor,
    final SchemeColor? navigationBarUnselectedLabelSchemeColor,
    final bool? navigationBarMutedUnselectedLabel,
    final double? navigationBarSelectedIconSize,
    final double? navigationBarUnselectedIconSize,
    final SchemeColor? navigationBarSelectedIconSchemeColor,
    final SchemeColor? navigationBarUnselectedIconSchemeColor,
    final bool? navigationBarMutedUnselectedIcon,
    final SchemeColor? navigationBarHighlightSchemeColor,
    final SchemeColor? navigationBarBackgroundSchemeColor,
    final double? navigationBarOpacity,
    final double? navigationBarHeight,
    final NavigationDestinationLabelBehavior? navigationBarLabelBehavior,
    //
    final TextStyle? navigationRailLabelTextStyle,
    final double? navigationRailSelectedLabelSize,
    final double? navigationRailUnselectedLabelSize,
    final SchemeColor? navigationRailSelectedLabelSchemeColor,
    final SchemeColor? navigationRailUnselectedLabelSchemeColor,
    final bool? navigationRailMutedUnselectedLabel,
    final double? navigationRailSelectedIconSize,
    final double? navigationRailUnselectedIconSize,
    final SchemeColor? navigationRailSelectedIconSchemeColor,
    final SchemeColor? navigationRailUnselectedIconSchemeColor,
    final bool? navigationRailMutedUnselectedIcon,
    final bool? navigationRailUseIndicator,
    final SchemeColor? navigationRailIndicatorSchemeColor,
    final SchemeColor? navigationRailBackgroundSchemeColor,
    final double? navigationRailOpacity,
    final double? navigationRailElevation,
    final NavigationRailLabelType? navigationRailLabelType,
    final double? navigationRailGroupAlignment,
  }) {
    return FlexSubThemesData(
      interactionEffects: interactionEffects ?? this.interactionEffects,
      blendOnLevel: blendOnLevel ?? this.blendOnLevel,
      blendOnColors: blendOnColors ?? this.blendOnColors,
      useFlutterDefaults: useFlutterDefaults ?? this.useFlutterDefaults,
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
      inputDecoratorRadius: inputDecoratorRadius ?? this.inputDecoratorRadius,
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
      inputDecoratorUnfocusedBorderIsColored:
          inputDecoratorUnfocusedBorderIsColored ??
              this.inputDecoratorUnfocusedBorderIsColored,
      //
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
      snackBarBackgroundSchemeColor:
          snackBarBackgroundSchemeColor ?? this.snackBarBackgroundSchemeColor,
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
      //
      bottomNavigationBarLabelTextStyle: bottomNavigationBarLabelTextStyle ??
          this.bottomNavigationBarLabelTextStyle,
      bottomNavigationBarSelectedLabelSize:
          bottomNavigationBarSelectedLabelSize ??
              this.bottomNavigationBarSelectedLabelSize,
      bottomNavigationBarUnselectedLabelSize:
          bottomNavigationBarUnselectedLabelSize ??
              this.bottomNavigationBarUnselectedLabelSize,
      bottomNavigationBarSelectedLabelSchemeColor:
          bottomNavigationBarSelectedLabelSchemeColor ??
              this.bottomNavigationBarSelectedLabelSchemeColor,
      bottomNavigationBarUnselectedLabelSchemeColor:
          bottomNavigationBarUnselectedLabelSchemeColor ??
              this.bottomNavigationBarUnselectedLabelSchemeColor,
      bottomNavigationBarMutedUnselectedLabel:
          bottomNavigationBarMutedUnselectedLabel ??
              this.bottomNavigationBarMutedUnselectedLabel,
      bottomNavigationBarSelectedIconSize:
          bottomNavigationBarSelectedIconSize ??
              this.bottomNavigationBarSelectedIconSize,
      bottomNavigationBarUnselectedIconSize:
          bottomNavigationBarUnselectedIconSize ??
              this.bottomNavigationBarUnselectedIconSize,
      bottomNavigationBarSelectedIconSchemeColor:
          bottomNavigationBarSelectedIconSchemeColor ??
              this.bottomNavigationBarSelectedIconSchemeColor,
      bottomNavigationBarUnselectedIconSchemeColor:
          bottomNavigationBarUnselectedIconSchemeColor ??
              this.bottomNavigationBarUnselectedIconSchemeColor,
      bottomNavigationBarMutedUnselectedIcon:
          bottomNavigationBarMutedUnselectedIcon ??
              this.bottomNavigationBarMutedUnselectedIcon,
      bottomNavigationBarBackgroundSchemeColor:
          bottomNavigationBarBackgroundSchemeColor ??
              this.bottomNavigationBarBackgroundSchemeColor,
      bottomNavigationBarOpacity:
          bottomNavigationBarOpacity ?? this.bottomNavigationBarOpacity,
      bottomNavigationBarElevation:
          bottomNavigationBarElevation ?? this.bottomNavigationBarElevation,
      bottomNavigationBarShowSelectedLabels:
          bottomNavigationBarShowSelectedLabels ??
              this.bottomNavigationBarShowSelectedLabels,
      bottomNavigationBarShowUnselectedLabels:
          bottomNavigationBarShowUnselectedLabels ??
              this.bottomNavigationBarShowUnselectedLabels,
      bottomNavigationBarType:
          bottomNavigationBarType ?? this.bottomNavigationBarType,
      bottomNavigationBarLandscapeLayout: bottomNavigationBarLandscapeLayout ??
          this.bottomNavigationBarLandscapeLayout,
      //
      navigationBarLabelTextStyle:
          navigationBarLabelTextStyle ?? this.navigationBarLabelTextStyle,
      navigationBarSelectedLabelSize:
          navigationBarSelectedLabelSize ?? this.navigationBarSelectedLabelSize,
      navigationBarUnselectedLabelSize: navigationBarUnselectedLabelSize ??
          this.navigationBarUnselectedLabelSize,
      navigationBarSelectedLabelSchemeColor:
          navigationBarSelectedLabelSchemeColor ??
              this.navigationBarSelectedLabelSchemeColor,
      navigationBarUnselectedLabelSchemeColor:
          navigationBarUnselectedLabelSchemeColor ??
              this.navigationBarUnselectedLabelSchemeColor,
      navigationBarMutedUnselectedLabel: navigationBarMutedUnselectedLabel ??
          this.navigationBarMutedUnselectedLabel,
      navigationBarSelectedIconSize:
          navigationBarSelectedIconSize ?? this.navigationBarSelectedIconSize,
      navigationBarUnselectedIconSize: navigationBarUnselectedIconSize ??
          this.navigationBarUnselectedIconSize,
      navigationBarSelectedIconSchemeColor:
          navigationBarSelectedIconSchemeColor ??
              this.navigationBarSelectedIconSchemeColor,
      navigationBarUnselectedIconSchemeColor:
          navigationBarUnselectedIconSchemeColor ??
              this.navigationBarUnselectedIconSchemeColor,
      navigationBarMutedUnselectedIcon: navigationBarMutedUnselectedIcon ??
          this.navigationBarMutedUnselectedIcon,
      navigationBarHighlightSchemeColor: navigationBarHighlightSchemeColor ??
          this.navigationBarHighlightSchemeColor,
      navigationBarBackgroundSchemeColor: navigationBarBackgroundSchemeColor ??
          this.navigationBarBackgroundSchemeColor,
      navigationBarOpacity: navigationBarOpacity ?? this.navigationBarOpacity,
      navigationBarHeight: navigationBarHeight ?? this.navigationBarHeight,
      navigationBarLabelBehavior:
          navigationBarLabelBehavior ?? this.navigationBarLabelBehavior,
      //
      navigationRailLabelTextStyle:
          navigationRailLabelTextStyle ?? this.navigationRailLabelTextStyle,
      navigationRailSelectedLabelSize: navigationRailSelectedLabelSize ??
          this.navigationRailSelectedLabelSize,
      navigationRailUnselectedLabelSize: navigationRailUnselectedLabelSize ??
          this.navigationRailUnselectedLabelSize,
      navigationRailSelectedLabelSchemeColor:
          navigationRailSelectedLabelSchemeColor ??
              this.navigationRailSelectedLabelSchemeColor,
      navigationRailUnselectedLabelSchemeColor:
          navigationRailUnselectedLabelSchemeColor ??
              this.navigationRailUnselectedLabelSchemeColor,
      navigationRailMutedUnselectedLabel: navigationRailMutedUnselectedLabel ??
          this.navigationRailMutedUnselectedLabel,
      navigationRailSelectedIconSize:
          navigationRailSelectedIconSize ?? this.navigationRailSelectedIconSize,
      navigationRailUnselectedIconSize: navigationRailUnselectedIconSize ??
          this.navigationRailUnselectedIconSize,
      navigationRailSelectedIconSchemeColor:
          navigationRailSelectedIconSchemeColor ??
              this.navigationRailSelectedIconSchemeColor,
      navigationRailUnselectedIconSchemeColor:
          navigationRailUnselectedIconSchemeColor ??
              this.navigationRailUnselectedIconSchemeColor,
      navigationRailMutedUnselectedIcon: navigationRailMutedUnselectedIcon ??
          this.navigationRailMutedUnselectedIcon,
      navigationRailUseIndicator:
          navigationRailUseIndicator ?? this.navigationRailUseIndicator,
      navigationRailIndicatorSchemeColor: navigationRailIndicatorSchemeColor ??
          this.navigationRailIndicatorSchemeColor,
      navigationRailBackgroundSchemeColor:
          navigationRailBackgroundSchemeColor ??
              this.navigationRailBackgroundSchemeColor,
      navigationRailOpacity:
          navigationRailOpacity ?? this.navigationRailOpacity,
      navigationRailElevation:
          navigationRailElevation ?? this.navigationRailElevation,
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
        other.useFlutterDefaults == useFlutterDefaults &&
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
        other.inputDecoratorRadius == inputDecoratorRadius &&
        other.inputDecoratorSchemeColor == inputDecoratorSchemeColor &&
        other.inputDecoratorIsFilled == inputDecoratorIsFilled &&
        other.inputDecoratorFillColor == inputDecoratorFillColor &&
        other.inputDecoratorBorderType == inputDecoratorBorderType &&
        other.inputDecoratorUnfocusedHasBorder ==
            inputDecoratorUnfocusedHasBorder &&
        other.inputDecoratorUnfocusedBorderIsColored ==
            inputDecoratorUnfocusedBorderIsColored &&
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
        other.snackBarBackgroundSchemeColor == snackBarBackgroundSchemeColor &&
        other.appBarBackgroundSchemeColor == appBarBackgroundSchemeColor &&
        other.tabBarItemSchemeColor == tabBarItemSchemeColor &&
        other.tabBarIndicatorSchemeColor == tabBarIndicatorSchemeColor &&
        other.bottomSheetRadius == bottomSheetRadius &&
        other.bottomSheetElevation == bottomSheetElevation &&
        other.bottomSheetModalElevation == bottomSheetModalElevation &&
        //
        other.bottomNavigationBarLabelTextStyle ==
            bottomNavigationBarLabelTextStyle &&
        other.bottomNavigationBarSelectedLabelSize ==
            bottomNavigationBarSelectedLabelSize &&
        other.bottomNavigationBarUnselectedLabelSize ==
            bottomNavigationBarUnselectedLabelSize &&
        other.bottomNavigationBarSelectedLabelSchemeColor ==
            bottomNavigationBarSelectedLabelSchemeColor &&
        other.bottomNavigationBarUnselectedLabelSchemeColor ==
            bottomNavigationBarUnselectedLabelSchemeColor &&
        other.bottomNavigationBarMutedUnselectedLabel ==
            bottomNavigationBarMutedUnselectedLabel &&
        other.bottomNavigationBarSelectedIconSize ==
            bottomNavigationBarSelectedIconSize &&
        other.bottomNavigationBarUnselectedIconSize ==
            bottomNavigationBarUnselectedIconSize &&
        other.bottomNavigationBarSelectedIconSchemeColor ==
            bottomNavigationBarSelectedIconSchemeColor &&
        other.bottomNavigationBarUnselectedIconSchemeColor ==
            bottomNavigationBarUnselectedIconSchemeColor &&
        other.bottomNavigationBarMutedUnselectedIcon ==
            bottomNavigationBarMutedUnselectedIcon &&
        other.bottomNavigationBarBackgroundSchemeColor ==
            bottomNavigationBarBackgroundSchemeColor &&
        other.bottomNavigationBarOpacity == bottomNavigationBarOpacity &&
        other.bottomNavigationBarElevation == bottomNavigationBarElevation &&
        other.bottomNavigationBarShowSelectedLabels ==
            bottomNavigationBarShowSelectedLabels &&
        other.bottomNavigationBarShowUnselectedLabels ==
            bottomNavigationBarShowUnselectedLabels &&
        other.bottomNavigationBarType == bottomNavigationBarType &&
        other.bottomNavigationBarLandscapeLayout ==
            bottomNavigationBarLandscapeLayout &&
        //
        other.navigationBarLabelTextStyle == navigationBarLabelTextStyle &&
        other.navigationBarSelectedLabelSize ==
            navigationBarSelectedLabelSize &&
        other.navigationBarUnselectedLabelSize ==
            navigationBarUnselectedLabelSize &&
        other.navigationBarSelectedLabelSchemeColor ==
            navigationBarSelectedLabelSchemeColor &&
        other.navigationBarUnselectedLabelSchemeColor ==
            navigationBarUnselectedLabelSchemeColor &&
        other.navigationBarMutedUnselectedLabel ==
            navigationBarMutedUnselectedLabel &&
        other.navigationBarSelectedIconSize == navigationBarSelectedIconSize &&
        other.navigationBarUnselectedIconSize ==
            navigationBarUnselectedIconSize &&
        other.navigationBarSelectedIconSchemeColor ==
            navigationBarSelectedIconSchemeColor &&
        other.navigationBarUnselectedIconSchemeColor ==
            navigationBarUnselectedIconSchemeColor &&
        other.navigationBarMutedUnselectedIcon ==
            navigationBarMutedUnselectedIcon &&
        other.navigationBarHighlightSchemeColor ==
            navigationBarHighlightSchemeColor &&
        other.navigationBarBackgroundSchemeColor ==
            navigationBarBackgroundSchemeColor &&
        other.navigationBarOpacity == navigationBarOpacity &&
        other.navigationBarHeight == navigationBarHeight &&
        other.navigationBarLabelBehavior == navigationBarLabelBehavior &&
        //
        other.navigationRailLabelTextStyle == navigationRailLabelTextStyle &&
        other.navigationRailSelectedLabelSize ==
            navigationRailSelectedLabelSize &&
        other.navigationRailUnselectedLabelSize ==
            navigationRailUnselectedLabelSize &&
        other.navigationRailSelectedLabelSchemeColor ==
            navigationRailSelectedLabelSchemeColor &&
        other.navigationRailUnselectedLabelSchemeColor ==
            navigationRailUnselectedLabelSchemeColor &&
        other.navigationRailMutedUnselectedLabel ==
            navigationRailMutedUnselectedLabel &&
        other.navigationRailSelectedIconSize ==
            navigationRailSelectedIconSize &&
        other.navigationRailUnselectedIconSize ==
            navigationRailUnselectedIconSize &&
        other.navigationRailSelectedIconSchemeColor ==
            navigationRailSelectedIconSchemeColor &&
        other.navigationRailUnselectedIconSchemeColor ==
            navigationRailUnselectedIconSchemeColor &&
        other.navigationRailMutedUnselectedIcon ==
            navigationRailMutedUnselectedIcon &&
        other.navigationRailUseIndicator == navigationRailUseIndicator &&
        other.navigationRailIndicatorSchemeColor ==
            navigationRailIndicatorSchemeColor &&
        other.navigationRailBackgroundSchemeColor ==
            navigationRailBackgroundSchemeColor &&
        other.navigationRailOpacity == navigationRailOpacity &&
        other.navigationRailElevation == navigationRailElevation &&
        other.navigationRailLabelType == navigationRailLabelType &&
        other.navigationRailGroupAlignment == navigationRailGroupAlignment;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => hashList(<Object?>[
        interactionEffects,
        blendOnLevel,
        blendOnColors,
        useFlutterDefaults,
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
        inputDecoratorRadius,
        inputDecoratorSchemeColor,
        inputDecoratorIsFilled,
        inputDecoratorFillColor,
        inputDecoratorBorderType,
        inputDecoratorUnfocusedHasBorder,
        inputDecoratorUnfocusedBorderIsColored,
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
        snackBarBackgroundSchemeColor,
        appBarBackgroundSchemeColor,
        tabBarItemSchemeColor,
        tabBarIndicatorSchemeColor,
        //
        bottomSheetRadius,
        bottomSheetElevation,
        bottomSheetModalElevation,
        //
        bottomNavigationBarLabelTextStyle,
        bottomNavigationBarSelectedLabelSize,
        bottomNavigationBarUnselectedLabelSize,
        bottomNavigationBarSelectedLabelSchemeColor,
        bottomNavigationBarUnselectedLabelSchemeColor,
        bottomNavigationBarMutedUnselectedLabel,
        bottomNavigationBarSelectedIconSize,
        bottomNavigationBarUnselectedIconSize,
        bottomNavigationBarSelectedIconSchemeColor,
        bottomNavigationBarUnselectedIconSchemeColor,
        bottomNavigationBarMutedUnselectedIcon,
        bottomNavigationBarBackgroundSchemeColor,
        bottomNavigationBarOpacity,
        bottomNavigationBarElevation,
        bottomNavigationBarShowSelectedLabels,
        bottomNavigationBarShowUnselectedLabels,
        bottomNavigationBarType,
        bottomNavigationBarLandscapeLayout,
        //
        navigationBarLabelTextStyle,
        navigationBarSelectedLabelSize,
        navigationBarUnselectedLabelSize,
        navigationBarSelectedLabelSchemeColor,
        navigationBarUnselectedLabelSchemeColor,
        navigationBarMutedUnselectedLabel,
        navigationBarSelectedIconSize,
        navigationBarUnselectedIconSize,
        navigationBarSelectedIconSchemeColor,
        navigationBarUnselectedIconSchemeColor,
        navigationBarMutedUnselectedIcon,
        navigationBarHighlightSchemeColor,
        navigationBarBackgroundSchemeColor,
        navigationBarOpacity,
        navigationBarHeight,
        navigationBarLabelBehavior,
        //
        navigationRailLabelTextStyle,
        navigationRailSelectedLabelSize,
        navigationRailUnselectedLabelSize,
        navigationRailSelectedLabelSchemeColor,
        navigationRailUnselectedLabelSchemeColor,
        navigationRailMutedUnselectedLabel,
        navigationRailSelectedIconSize,
        navigationRailUnselectedIconSize,
        navigationRailSelectedIconSchemeColor,
        navigationRailUnselectedIconSchemeColor,
        navigationRailMutedUnselectedIcon,
        navigationRailUseIndicator,
        navigationRailIndicatorSchemeColor,
        navigationRailBackgroundSchemeColor,
        navigationRailOpacity,
        navigationRailElevation,
        navigationRailLabelType,
        navigationRailGroupAlignment,
      ]);

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<bool>('interactionEffects', interactionEffects));
    properties.add(DiagnosticsProperty<int>('blendOnLevel ', blendOnLevel));
    properties.add(DiagnosticsProperty<bool>('blendOnColors', blendOnColors));
    properties.add(
        DiagnosticsProperty<bool>('useFlutterDefaults', useFlutterDefaults));
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
        'inputDecoratorRadius', inputDecoratorRadius));
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
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorUnfocusedBorderIsColored',
        inputDecoratorUnfocusedBorderIsColored));
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
        'snackBarBackgroundSchemeColor', snackBarBackgroundSchemeColor));
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
    //
    properties.add(DiagnosticsProperty<TextStyle>(
        'bottomNavigationBarLabelTextStyle',
        bottomNavigationBarLabelTextStyle));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarSelectedLabelSize',
        bottomNavigationBarSelectedLabelSize));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarUnselectedLabelSize',
        bottomNavigationBarUnselectedLabelSize));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'bottomNavigationBarSelectedLabelSchemeColor',
        bottomNavigationBarSelectedLabelSchemeColor));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'bottomNavigationBarUnselectedLabelSchemeColor',
        bottomNavigationBarUnselectedLabelSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'bottomNavigationBarMutedUnselectedLabel',
        bottomNavigationBarMutedUnselectedLabel));
    properties.add(EnumProperty<double>('bottomNavigationBarSelectedIconSize',
        bottomNavigationBarSelectedIconSize));
    properties.add(EnumProperty<double>('bottomNavigationBarUnselectedIconSize',
        bottomNavigationBarUnselectedIconSize));
    properties.add(EnumProperty<SchemeColor>(
        'bottomNavigationBarSelectedIconSchemeColor',
        bottomNavigationBarSelectedIconSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'bottomNavigationBarUnselectedIconSchemeColor',
        bottomNavigationBarUnselectedIconSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'bottomNavigationBarMutedUnselectedIcon',
        bottomNavigationBarMutedUnselectedIcon));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'bottomNavigationBarBackgroundSchemeColor',
        bottomNavigationBarBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarOpacity', bottomNavigationBarOpacity));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarElevation', bottomNavigationBarElevation));
    properties.add(DiagnosticsProperty<bool>(
        'bottomNavigationBarShowSelectedLabels',
        bottomNavigationBarShowSelectedLabels));
    properties.add(DiagnosticsProperty<bool>(
        'bottomNavigationBarShowUnselectedLabels',
        bottomNavigationBarShowUnselectedLabels));
    properties.add(EnumProperty<BottomNavigationBarType>(
        'bottomNavigationBarType', bottomNavigationBarType));
    properties.add(EnumProperty<BottomNavigationBarLandscapeLayout>(
        'bottomNavigationBarLandscapeLayout',
        bottomNavigationBarLandscapeLayout));
    //
    properties.add(DiagnosticsProperty<TextStyle>(
        'navigationBarLabelTextStyle', navigationBarLabelTextStyle));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarSelectedLabelSize', navigationBarSelectedLabelSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarUnselectedLabelSize', navigationBarUnselectedLabelSize));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'navigationBarSelectedLabelSchemeColor',
        navigationBarSelectedLabelSchemeColor));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'navigationBarUnselectedLabelSchemeColor',
        navigationBarUnselectedLabelSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'navigationBarMutedUnselectedLabel',
        navigationBarMutedUnselectedLabel));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarSelectedIconSize', navigationBarSelectedIconSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarUnselectedIconSize', navigationBarUnselectedIconSize));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarSelectedIconSchemeColor',
        navigationBarSelectedIconSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarUnselectedIconSchemeColor',
        navigationBarUnselectedIconSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'navigationBarMutedUnselectedIcon', navigationBarMutedUnselectedIcon));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarHighlightSchemeColor',
        navigationBarHighlightSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarBackgroundSchemeColor',
        navigationBarBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarOpacity', navigationBarOpacity));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarHeight', navigationBarHeight));
    properties.add(EnumProperty<NavigationDestinationLabelBehavior>(
        'navigationBarLabelBehavior', navigationBarLabelBehavior));
    //
    properties.add(DiagnosticsProperty<TextStyle>(
        'navigationRailLabelTextStyle', navigationRailLabelTextStyle));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailSelectedLabelSize', navigationRailSelectedLabelSize));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailUnselectedLabelSize',
        navigationRailUnselectedLabelSize));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'navigationRailSelectedLabelSchemeColor',
        navigationRailSelectedLabelSchemeColor));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'navigationRailUnselectedLabelSchemeColor',
        navigationRailUnselectedLabelSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'navigationRailMutedUnselectedLabel',
        navigationRailMutedUnselectedLabel));
    properties.add(EnumProperty<double>(
        'navigationRailSelectedIconSize', navigationRailSelectedIconSize));
    properties.add(EnumProperty<double>(
        'navigationRailUnselectedIconSize', navigationRailUnselectedIconSize));
    properties.add(EnumProperty<SchemeColor>(
        'navigationRailSelectedIconSchemeColor',
        navigationRailSelectedIconSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'navigationRailUnselectedIconSchemeColor',
        navigationRailUnselectedIconSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'navigationRailMutedUnselectedIcon',
        navigationRailMutedUnselectedIcon));
    properties.add(DiagnosticsProperty<bool>(
        'navigationRailUseIndicator', navigationRailUseIndicator));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'navigationRailIndicatorSchemeColor',
        navigationRailIndicatorSchemeColor));
    properties.add(DiagnosticsProperty<SchemeColor>(
        'navigationRailBackgroundSchemeColor',
        navigationRailBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailOpacity', navigationRailOpacity));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailElevation', navigationRailElevation));
    properties.add(EnumProperty<NavigationRailLabelType>(
        'navigationRailLabelType', navigationRailLabelType));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailGroupAlignment', navigationRailGroupAlignment));
  }
}
