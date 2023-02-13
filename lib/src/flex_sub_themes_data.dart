import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_color_scheme.dart';
import 'flex_constants.dart';
import 'flex_sub_themes.dart';

// ignore_for_file: comment_references

/// Parameters used by [FlexColorScheme] to configure its used [FlexSubThemes].
///
/// To enable the optional component theming feature in FlexColorScheme pass in
/// at least a default [FlexSubThemesData] () to its [subThemesData] property.
/// This gives you the default opinionated component theme setup.
///
/// The list of properties in the flat configuration class has grown very large.
/// While it can be a bit tricky to maintain it, using it is easy and quite
/// a convenient way to adjust commonly used properties on UI component
/// widgets using simple "flat" property values.
///
/// No need for deep [ShapeBorder] definitions for simple border radius change,
/// nor for the complex [MaterialState] properties. Well, not as long
/// as choices and offered flat config options covers what you need.
///
/// A common use case for [FlexSubThemes] and the [FlexSubThemesData] is for
/// easy to use customization of default border radius on all Flutter SDK
/// Widgets and elements that supports border radius, either via [ShapeBorder]
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
/// enum [SchemeColor] selection value.
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
///
/// There are custom and opinionated component themes available in
/// [FlexSubThemes] as static theming helpers:
///
/// * [AppBarTheme] for [AppBar] via [FlexSubThemes.appBarTheme].
/// * [BottomAppBarTheme] for [BottomAppBar] via
///   [FlexSubThemes.bottomAppBarTheme].
/// * [BottomNavigationBarThemeData] for [BottomNavigationBar] via
///   [FlexSubThemes.bottomNavigationBar].
/// * [BottomSheetThemeData] for [BottomSheet] via
///   [FlexSubThemes.bottomSheetTheme].
/// * [ButtonThemeData] for old deprecated buttons, via
///   [FlexSubThemes.buttonTheme].
/// * [CardTheme] for [Card] via [FlexSubThemes.cardTheme].
/// * [CheckboxThemeData] for [Checkbox] via [FlexSubThemes.checkboxTheme].
/// * [ChipThemeData] for [Chip] via [FlexSubThemes.chipTheme].
/// * [DialogTheme] for [Dialog] via [FlexSubThemes.dialogTheme].
/// * [DrawerThemeData] for [Drawer] via [FlexSubThemes.drawerTheme].
/// * [DropdownMenuThemeData] for [DropDownMenu] via
///   [FlexSubThemes.dropdownMenuTheme].
/// * [ElevatedButtonThemeData] for [ElevatedButton] via
///   [FlexSubThemes.elevatedButtonTheme].
/// * [FilledButtonThemeData] for [FilledButton] via
///   [FlexSubThemes.filledButtonTheme].
/// * [FloatingActionButtonThemeData] for [FloatingActionButton] via
///   [FlexSubThemes.floatingActionButtonTheme].
/// * [InputDecorationTheme] for [InputDecoration] via
///   [FlexSubThemes.inputDecorationTheme].
/// * [MenuBarThemeData] for [MenuBar] via [FlexSubThemes.menuBarTheme].
/// * [MenuButtonThemeData] for [MenuButton] via
///   [FlexSubThemes.menuButtonTheme].
/// * [MenuThemeData] for [MenuBar], [MenuAnchor] and [DropDownMenu] via
///   [FlexSubThemes.menuTheme].
/// * [ListTileThemeData] for [ListTile] via
///   [FlexSubThemes.listTileTheme].
/// * [NavigationBarThemeData] for [NavigationBar] via
///   [FlexSubThemes.navigationBarTheme].
/// * [NavigationDrawerThemeData] for [NavigationDrawer] via
///   [FlexSubThemes.navigationDrawerTheme].
/// * [NavigationRailThemeData] for [NavigationRail] via
///   [FlexSubThemes.navigationRailTheme].
/// * [OutlinedButtonThemeData] for [OutlinedButton] via
///   [FlexSubThemes.outlinedButtonTheme].
/// * [PopupMenuThemeData] for [PopupMenuButton] via
///   [FlexSubThemes.popupMenuTheme].
/// * [RadioThemeData] for [Radio] via [FlexSubThemes.radioTheme].
/// * [SliderThemeData] for [Slider] via [FlexSubThemes.sliderTheme].
/// * [SnackBarThemeData] for [SnackBar] via [FlexSubThemes.snackBarTheme].
/// * [SwitchThemeData] for [Switch] via [FlexSubThemes.switchTheme].
/// * [TabBarTheme] for [TabBar] via [FlexSubThemes.tabBarTheme].
/// * [TextButtonThemeData] for [TextButton] via
///   [FlexSubThemes.textButtonTheme].
/// * [TimePickerThemeData] for [TimePickerDialog] via
///   [FlexSubThemes.timePickerTheme].
/// * [ToggleButtonsThemeData] for [ToggleButtons] via
///   [FlexSubThemes.toggleButtonsTheme].
/// * [TooltipThemeData] for [Tooltip] via [FlexSubThemes.tooltipTheme].
///
/// The custom `ButtonThemeData` can still provides matching styling
/// for the deprecated legacy buttons if they are used.
/// Please consider phasing out the legacy buttons, as they are deprecated
/// and will be removed from the Flutter SDK. Their theme `ButtonThemeData`
/// will also soon be deprecated and later removed.
@immutable
class FlexSubThemesData with Diagnosticable {
  /// Default constructor, used to make an immutable FlexSubThemesData object.
  const FlexSubThemesData({
    this.interactionEffects = true,
    this.tintedDisabledControls = true,
    this.blendOnLevel,
    this.blendOnColors = true,
    this.useFlutterDefaults = false,
    //
    this.elevationTint = FlexTint.removeTint,
    this.elevationShadow = FlexShadow.useShadow,
    //
    this.blendTextTheme = true,
    this.useTextTheme = true,
    this.useM2StyleDividerInM3 = false,
    //
    this.defaultRadius,
    this.buttonMinSize,
    this.buttonPadding,
    //
    this.thickBorderWidth,
    this.thinBorderWidth,
    //
    this.textButtonRadius,
    this.textButtonSchemeColor,
    this.textButtonTextStyle,
    //
    this.filledButtonRadius,
    this.filledButtonSchemeColor,
    this.filledButtonTextStyle,
    //
    // TODO(rydmike): Hold for https://github.com/flutter/flutter/issues/115827
    // this.filledButtonTonalRadius,
    // this.filledButtonTonalSchemeColor,
    // this.filledButtonTonalTextStyle,
    //
    this.elevatedButtonRadius,
    this.elevatedButtonElevation,
    this.elevatedButtonSchemeColor,
    this.elevatedButtonSecondarySchemeColor,
    this.elevatedButtonTextStyle,
    //
    this.outlinedButtonRadius,
    this.outlinedButtonSchemeColor,
    this.outlinedButtonOutlineSchemeColor,
    this.outlinedButtonBorderWidth,
    this.outlinedButtonPressedBorderWidth,
    this.outlinedButtonTextStyle,
    //
    this.toggleButtonsRadius,
    this.toggleButtonsSchemeColor,
    this.toggleButtonsUnselectedSchemeColor,
    this.toggleButtonsBorderSchemeColor,
    this.toggleButtonsBorderWidth,
    //
    this.segmentedButtonRadius,
    this.segmentedButtonSchemeColor,
    this.segmentedButtonUnselectedSchemeColor,
    this.segmentedButtonUnselectedForegroundSchemeColor,
    this.segmentedButtonBorderSchemeColor,
    this.segmentedButtonBorderWidth,
    //
    this.materialButtonSchemeColor,
    //
    this.switchSchemeColor,
    this.switchThumbSchemeColor,
    this.checkboxSchemeColor,
    this.radioSchemeColor,
    this.unselectedToggleIsColored = false,
    //
    this.sliderBaseSchemeColor,
    this.sliderIndicatorSchemeColor,
    this.sliderValueTinted = false,
    this.sliderValueIndicatorType,
    this.sliderShowValueIndicator,
    this.sliderTrackHeight,
    //
    this.inputDecoratorRadius,
    this.inputDecoratorSchemeColor,
    this.inputDecoratorIsFilled = true,
    this.inputDecoratorFillColor,
    this.inputDecoratorBackgroundAlpha,
    this.inputDecoratorBorderSchemeColor,
    this.inputDecoratorBorderType,
    this.inputDecoratorFocusedHasBorder = true,
    this.inputDecoratorUnfocusedHasBorder = true,
    this.inputDecoratorUnfocusedBorderIsColored = true,
    this.inputDecoratorBorderWidth,
    this.inputDecoratorFocusedBorderWidth,
    this.inputDecoratorPrefixIconSchemeColor,
    //
    this.fabRadius,
    this.fabUseShape = false,
    this.fabAlwaysCircular = false,
    this.fabSchemeColor,
    //
    this.chipRadius,
    this.chipSchemeColor,
    this.chipSelectedSchemeColor,
    this.chipDeleteIconSchemeColor,
    //
    this.cardRadius,
    this.cardElevation,
    //
    this.popupMenuRadius,
    this.popupMenuElevation,
    this.popupMenuSchemeColor,
    this.popupMenuOpacity,
    //
    this.menuBarRadius,
    this.menuBarElevation,
    this.menuBarShadowColor,
    //
    this.tooltipRadius,
    this.tooltipWaitDuration,
    this.tooltipShowDuration,
    this.tooltipSchemeColor,
    this.tooltipOpacity,
    //
    this.dialogRadius,
    this.dialogElevation,
    this.dialogBackgroundSchemeColor,
    this.timePickerDialogRadius,
    this.timePickerElementRadius,
    //
    this.snackBarElevation,
    this.snackBarBackgroundSchemeColor,
    this.snackBarActionSchemeColor,
    //
    this.appBarBackgroundSchemeColor,
    this.appBarCenterTitle,
    this.appBarScrolledUnderElevation,
    //
    this.bottomAppBarSchemeColor,
    //
    this.tabBarItemSchemeColor,
    this.tabBarIndicatorSchemeColor,
    //
    this.drawerRadius,
    this.drawerElevation,
    this.drawerBackgroundSchemeColor,
    this.drawerWidth,
    this.drawerIndicatorRadius,
    this.drawerIndicatorWidth,
    this.drawerIndicatorSchemeColor,
    this.drawerIndicatorOpacity,
    //
    this.bottomSheetBackgroundColor,
    this.bottomSheetModalBackgroundColor,
    this.bottomSheetRadius,
    this.bottomSheetElevation,
    this.bottomSheetModalElevation,
    //
    this.bottomNavigationBarLabelTextStyle,
    this.bottomNavigationBarSelectedLabelSize,
    this.bottomNavigationBarUnselectedLabelSize,
    this.bottomNavigationBarSelectedLabelSchemeColor,
    this.bottomNavigationBarUnselectedLabelSchemeColor,
    this.bottomNavigationBarMutedUnselectedLabel = true,
    this.bottomNavigationBarSelectedIconSize,
    this.bottomNavigationBarUnselectedIconSize,
    this.bottomNavigationBarSelectedIconSchemeColor,
    this.bottomNavigationBarUnselectedIconSchemeColor,
    this.bottomNavigationBarMutedUnselectedIcon = true,
    this.bottomNavigationBarBackgroundSchemeColor,
    this.bottomNavigationBarOpacity,
    this.bottomNavigationBarElevation,
    this.bottomNavigationBarShowSelectedLabels = true,
    this.bottomNavigationBarShowUnselectedLabels = true,
    this.bottomNavigationBarType,
    this.bottomNavigationBarLandscapeLayout,
    //
    this.navigationBarLabelTextStyle,
    this.navigationBarSelectedLabelSize,
    this.navigationBarUnselectedLabelSize,
    this.navigationBarSelectedLabelSchemeColor,
    this.navigationBarUnselectedLabelSchemeColor,
    this.navigationBarMutedUnselectedLabel = true,
    this.navigationBarSelectedIconSize,
    this.navigationBarUnselectedIconSize,
    this.navigationBarSelectedIconSchemeColor,
    this.navigationBarUnselectedIconSchemeColor,
    this.navigationBarMutedUnselectedIcon = true,
    this.navigationBarIndicatorSchemeColor,
    this.navigationBarIndicatorOpacity,
    this.navigationBarIndicatorRadius,
    this.navigationBarBackgroundSchemeColor,
    this.navigationBarOpacity,
    this.navigationBarElevation,
    this.navigationBarHeight,
    this.navigationBarLabelBehavior,
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
    this.navigationRailIndicatorOpacity,
    this.navigationRailIndicatorRadius,
    this.navigationRailBackgroundSchemeColor,
    this.navigationRailOpacity,
    this.navigationRailElevation,
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

  // TODO(rydmike): Add tintedDisabledControls feature in version 7.0?
  /// Use primary tint on disabled controls.
  ///
  /// Set to true to make disabled controls use a shared slightly
  /// primary color tint on their disabled state.
  ///
  /// Set to false to use default grey only disabled controls.
  ///
  /// Impacts controls:
  /// - To be added...
  ///
  /// Defaults to true.
  final bool tintedDisabledControls;

  /// Sets the blend level strength of container color used on its onColor.
  ///
  /// Use [blendOnLevel] value to in FlexColorScheme themes to also blend in
  /// each corresponding [ColorScheme] color property's color into its onColors.
  ///
  /// If [blendOnColors] is false, the [blendOnLevel] setting only affects
  /// [onSurface], [onBackGround], [onPrimaryContainer], [onSecondaryContainer]
  /// [onTertiaryContainer] and [onErrorContainer].
  ///
  /// If [blendOnColors] is true, it also impacts [onPrimary], [onSecondary]
  /// [onTertiary] and [onError].
  ///
  /// The blend level is the integer decimal value of the alpha value
  /// used in the alpha blend function. It mixes one color with another
  /// by using alpha opacity value in the color of a surface put on top of
  /// another surface with opaque color and returns the result as one opaque
  /// color.
  ///
  /// Blending the on colors results in lower contrast than when not doing so,
  /// but it still works well on lower blend levels. This design is in-line
  /// with the look one gets when using key color seeded based [ColorScheme]s,
  /// but this version is based on alpha blends instead of the Material
  /// Design 3 Tonal Color Palette and its tones.
  ///
  /// Blending the on colors results in lower contrast than when not doing so,
  /// but it works well on lower blend levels. The effect can be adjusted
  /// with [blendOnLevel] and completely turned off by setting [blendOnLevel]
  /// to 0 (zero).
  ///
  /// If undefined, defaults to 0.
  final int? blendOnLevel;

  /// Set to true to enable [blendOnLevel] based onColor blending also on
  /// [onPrimary], [onSecondary] and [onTertiary] colors.
  ///
  /// Use [blendOnLevel] value to in FlexColorScheme themes to also blend in
  /// each corresponding [ColorScheme] color property's color into its onColors.
  ///
  /// If [blendOnColors] is false, the [blendOnLevel] setting only affects
  /// [onSurface], [onBackGround], [onPrimaryContainer], [onSecondaryContainer]
  /// [onTertiaryContainer] and [onErrorContainer].
  ///
  /// If [blendOnColors] is true, it also impacts [onPrimary], [onSecondary],
  /// [onTertiary] and [onError].
  ///
  /// Blending the on colors results in lower contrast than when not doing so,
  /// but it works well on lower blend levels. The effect can be adjusted
  /// with [blendOnLevel] and completely turned off by setting [blendOnLevel]
  /// to 0 (zero).
  ///
  /// Defaults to true. Main colors also get hint of its own color in their
  /// onColor. Consider setting this property true in dark mode, and false in
  /// light theme mode, for a style that matches the Material 3 color design.
  final bool blendOnColors;

  /// Set to true to use Flutter SDK default component theme designs.
  ///
  /// Default to false.
  ///
  /// Prefer false to use FlexColorScheme (FCS) defaults.
  ///
  /// When set to `true`, many color properties that in [FlexSubThemesData] are
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
  /// The individual [FlexSubThemesData] properties and [FlexSubThemes]
  /// document their adherence to this setting, they are also listed here:
  ///
  /// Impact on [BottomNavigationBarThemeData] sub-theming:
  ///
  /// ```
  ///                    FCS defaults   Flutter defaults
  /// useFlutterDefaults false          true
  /// - background       background     background
  /// - selected icon    primary        light: theme primary, dark: secondary
  /// - Selected label   primary        light: theme primary, dark: secondary
  /// - unselected icon  onSurface      light: black54, dark: white70
  /// - unSelected label onSurface      light: black54, dark: white70
  /// ```
  /// FCS further applies both an alpha blend and slight opacity to
  /// unselected icon and unselected label, but only if
  /// [bottomNavigationBarMutedUnselectedIcon] and
  /// [bottomNavigationBarMutedUnselectedLabel] are true respectively,
  /// this also applies to undefined color inputs.
  ///
  /// When muted unselected options are true, the actual difference to Flutter
  /// default for unselected items is subtle, FCS has a bit more contrast.
  ///
  /// Impact on [NavigationBarThemeData] sub-theming:
  ///
  /// ```
  ///                    FCS defaults   M2 defaults       useMaterial3:true
  /// useFlutterDefaults false          true              true
  /// results in:
  ///
  /// - background       surfaceVariant surface with      surface with
  ///                                   onSurface overlay primary overlay
  ///                    elev 0         elev 3            elev 3
  /// - height           80             80                80
  /// - indicator        primary op24%  secondary op24%   secondaryContainer
  /// - selected icon    primary        onSurface         onSecondaryContainer
  /// - unselected icon  onSurface      onSurface         onSurfaceVariant
  /// - Selected label   primary        onSurface         onSurface
  /// - unSelected label onSurface      onSurface         onSurfaceVariant
  /// - TextTheme        labelMedium    overline          labelMedium
  /// ```
  /// FCS further applies both an alpha blend and slight opacity to
  /// unselected icon and unselected label, but only if
  /// [navigationBarMutedUnselectedIcon] and [navigationBarMutedUnselectedLabel]
  /// are true respectively, this also applies to undefined color inputs.
  ///
  /// Impact on [NavigationRailThemeData] sub-theming:
  ///
  /// ```
  ///                    FCS defaults    Flutter defaults
  /// useFlutterDefaults false           true
  /// - background       background      surface
  /// - indicator        primary op24%   secondary op24%
  /// - selected icon    primary         primary
  /// - Selected label   primary         primary
  /// - unselected icon  onSurface       onSurface op64%
  /// - unSelected label onSurface       onSurface op64%
  /// - TextTheme        FCS.labelMedium default.bodyText1
  /// ```
  /// FCS further applies both an alpha blend and slight opacity to
  /// unselected icon and unselected label, but only if
  /// [navigationRailMutedUnselectedIcon] and
  /// are [navigationRailMutedUnselectedLabel] true respectively,
  /// this also applies to undefined color inputs.
  ///
  /// If you want a style that is consistent by default across
  /// [BottomNavigationBar], [NavigationBar] and [NavigationRail],
  /// prefer keeping this setting false.
  ///
  /// If undefined, defaults to false.
  final bool useFlutterDefaults;

  /// Controls elevation tint color usage in Material 3 theming.
  ///
  /// Material 3 introduces elevation tint on elevated surface. With the
  /// [elevationTint] control you can control if it is used.
  ///
  /// - Use value [FlexTint.defaults] for default elevation tints in M3.
  /// - Use value [FlexTint.removeTint] to remove elevation tint in M3.
  /// - Use value [FlexTint.adaptive] to remove elevation tint in M3 on
  ///   iOS and macOS platforms.
  ///
  /// The [elevationTint] feature has no impact in M2 mode. It only impacts
  /// component themes in FCS where Flutter SDK also support elevation
  /// tints in its theme. Currently this applies to:
  ///
  /// - [AppBar]
  /// - [BottomAppBar]
  /// - [BottomSheet]
  /// - [Card]
  /// - [Chip]
  /// - [Dialog]
  /// - [Drawer]
  /// - [DropDownMenu]
  /// - [MenuAnchor]
  /// - [MenuBar]
  /// - [NavigationBar]
  /// - [NavigationDrawer]
  /// - [PopupMenuButton]
  ///
  /// Not supported in Flutter theming on:
  /// - [BottomNavigationBar], does not have tint in M3 in Flutter 3.7.
  /// - [NavigationRail], does not have elevation tint in Flutter 3.7, probably
  ///   should have when elevated. Default M3 design does not elevate it.
  ///
  /// If you want to totally remove elevation tint from all widgets and on all
  /// platforms when using Material 3, you can set
  /// [FlexColorScheme.surfaceTint] color to [Colors.transparent]. This also
  /// works with vanilla [ThemeData.colorScheme] by setting its
  /// [ColorScheme.surfaceTint] to [Colors.transparent].
  ///
  /// If not defined, defaults to [FlexTint.defaults].
  final FlexTint? elevationTint;

  /// Controls shadow usage on elevated surfaces in Material 3 theming.
  ///
  /// Material 3 removes elevation shadows on some elevated surfaces. With this
  /// control you can bring it back.
  ///
  /// - Use value [FlexShadow.defaults] for default elevation shadows in M3.
  /// - Use value [FlexShadow.useShadow] to bring back shadows in M3.
  /// - Use value [FlexShadow.adaptive] to only bring back elevation shadows on
  ///   iOS and macOS platforms.
  ///
  /// The [elevationShadow] feature has no impact in M2 mode. It only impacts
  /// component themes in FCS where Flutter SDK also support adding elevation
  /// shadows back in M3 mode. Currently this applies to:
  ///
  /// - [AppBar]
  /// - [BottomAppBar]
  /// - [Dialog]
  /// - [Drawer]
  /// - [NavigationDrawer]
  /// - [NavigationBar]
  ///
  /// These components already have shadows in M3:
  /// - [BottomNavigationBar], has shadow in M3 and no tint, is M2 Widget.
  /// - [BottomSheet],
  /// - [Card]
  /// - [Chip]
  /// - [DropDownMenu]
  /// - [MenuAnchor]
  /// - [MenuBar], might be a mistake that the bar has shadow in M3 by default.
  ///   The menus from the bar should have shadow and do, but probably not the
  ///   menu bar itself. In design in M3 web guide it is not elevated.
  /// - [NavigationRail], has shadow in M3 if elevated, probably should not.
  ///   Also does not have elevation tint in Flutter 3.7, probably should have
  ///   when elevated. Default M3 design calls for it not being elevated.
  /// - [PopupMenuButton]
  ///
  /// If not defined, defaults to [FlexShadow.defaults].
  final FlexShadow? elevationShadow;

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

  /// Use Material 3 TextTheme and Typography
  ///
  /// When opting in on using the sub-theming, this flag controls if the
  /// TextTheme will use the new Material 3 [Typography.material2021]
  /// as specified in the [Material 3 Design Guide](https://m3.material.io).
  ///
  /// Defaults to true.
  ///
  /// If set to true [Typography.material2021] is used.
  /// Note that [Typography.material2021] will also be used, even if this flag
  /// is false if [ThemeData.useMaterial3] is true, which can also be set via
  /// [FlexColorScheme.useMaterial3].
  ///
  /// When using [FlexColorScheme], and [ThemeData.useMaterial3] is true and
  /// sub themes ar not used, or if used and [useTextTheme] is false, then
  /// default typography is [Typography.material2018]. If [FlexColorScheme] is
  /// not used at all, and your [ThemeData] has [ThemeData.useMaterial3] false,
  /// then Flutter defaults to using very old poor [Typography.material2014].
  /// In such cases consider defining your typography manually to
  /// [Typography.material2018] or why not even [Typography.material2021].
  ///
  /// FlexColorScheme fully supports using any custom TextTheme and fonts, just
  /// like ThemeData. You apply and use them just as you would with ThemeData.
  /// This text theme is just a custom predefined TextTheme.
  ///
  /// If you dynamically change the Theme Typography in application, Flutter
  /// SDK throws an assert error in debug mode, this is a Flutter limitation
  /// and not FlexColorScheme related, for more info see issue:
  /// https://github.com/flutter/flutter/issues/103864.
  final bool useTextTheme;

  /// Determines if M2 style opacity based divider is used in Material 3.
  ///
  /// Material 3 uses [ColorScheme.outlineVariant] in its default
  /// [Divider] style. Set this to false to use Material 2 style [Divider]
  /// in Material 3, that is black with alpha 1F in light theme and white with
  /// alpha 1F in dark theme.
  ///
  /// The primary tinted [ColorScheme.outlineVariant] may not work universally
  /// on all background colors. The white and black variants with some
  /// transparency works well on all background colors.
  ///
  /// Defaults to false.
  final bool useM2StyleDividerInM3;

  /// Border radius used on all widgets when [FlexColorScheme] use its
  /// [FlexSubThemesData] to configure sub-themes with [FlexSubThemes].
  ///
  /// These widgets will get their container shape border radius
  /// from [defaultRadius] if it is defined:
  ///
  /// * [BottomSheet]
  /// * [Card]
  /// * [Chip]
  /// * [Dialog]
  /// * [Drawer]
  /// * [DropdownMenu]
  /// * [ElevatedButton]
  /// * [FloatingActionButton]
  /// * [InputDecoration]
  /// * [MenuAnchor]
  /// * [OutlinedButton]
  /// * [PopupMenuButton]
  /// * [SegmentedButton]
  /// * [TextButton]
  /// * [ToggleButtons]
  /// * [TimePickerDialog]
  /// * Older deprecated buttons using `ButtonThemeData`
  ///
  /// For clarity the following small, or element roundings are not affect
  /// by [defaultRadius] value, but may be set via own themes or properties.
  ///
  /// * Indicator on [NavigationBar], bu can be set via
  ///   [navigationBarIndicatorRadius].
  /// * Indicator on [NavigationDrawer], but can be set via
  ///   [drawerIndicatorRadius].
  /// * Indicator on [NavigationRail], can be set via
  ///   [navigationRailIndicatorRadius].
  /// * Border radius on [MenuBar] container, can be set via
  ///   [menuBarRadius].
  /// * Tooltip container shape.
  /// * Rounding on scrollbar edges.
  ///
  /// Defaults to null.
  ///
  /// When it is null, the sub-themes will use their null default behavior
  /// that follow the Material 3 standard for widgets it includes.
  ///
  /// When you set [defaultRadius] to a value, it will override the defaults
  /// with this global default. You can still set and lock each individual
  /// border radius back for individual widget sub-themes to some specific
  /// value, or set it back to its Material 3 standard.
  ///
  /// Flutter current SDK general border radius is 4, as defined by the
  /// Material 2 design guide. Material 3 uses much higher border radius, and
  /// it varies by UI component type. You can find the
  /// specifications [here](https://m3.material.io).
  final double? defaultRadius;

  /// Minimum button size for all buttons.
  ///
  /// Applies to [TextButton], [ElevatedButton], [OutlinedButton] and
  /// [ToggleButtons], and the legacy deprecated/removed buttons
  /// `RaisedButton`, `OutlineButton` and `FlatButton` and to [MaterialButton].
  ///
  /// If undefined and [ThemeData.useMaterial3] is false,
  /// defaults to [kButtonMinSize] = `Size(40, 40)`.
  /// If undefined and [ThemeData.useMaterial3] is true,
  /// defaults to `Size(64, 40)`.
  final Size? buttonMinSize;

  /// Padding on [TextButton], [ElevatedButton] and [OutlinedButton].
  ///
  /// Rounded buttons may need a bit more horizontal padding to
  /// accommodate for the rounding.
  ///
  /// If undefined then defaults to each buttons un-themed textScale based
  /// padding static function `ButtonStyleButton.scaledPadding` where
  /// Elevated, Filled and Outline button use padding:
  ///   * `textScaleFactor <= 1` - horizontal(16)
  ///   * `1 < textScaleFactor <= 2` - lerp(horizontal(16), horizontal(8))
  ///   * `2 < textScaleFactor <= 3` - lerp(horizontal(8), horizontal(4))
  ///   * `3 < textScaleFactor` - horizontal(4)
  ///
  /// And TextButton uses padding:
  ///   * `textScaleFactor <= 1` - all(8)
  ///   * `1 < textScaleFactor <= 2` - lerp(all(8), horizontal(8))
  ///   * `2 < textScaleFactor <= 3` - lerp(horizontal(8), horizontal(4))
  ///   * `3 < textScaleFactor` - horizontal(4)
  ///
  /// This default is same in both Material 2 and Material 3 theme mode.
  final EdgeInsetsGeometry? buttonPadding;

  /// Default for thicker border width state of Widgets with an outline border.
  ///
  /// Used as default for pressed and error [OutlinedButton] and for
  /// focused [InputDecorator].
  ///
  /// If undefined and [ThemeData.useMaterial3] is false,
  /// defaults to [kThickBorderWidth] = 2.
  /// If undefined and [ThemeData.useMaterial3] is true, defaults to 1.0.
  final double? thickBorderWidth;

  /// Default for normal border width of Widgets with an outline border.
  ///
  /// Used as default by [OutlinedButton], [ToggleButtons] and [InputDecorator].
  ///
  /// If undefined and [ThemeData.useMaterial3] is false,
  /// defaults to [kThinBorderWidth] = 1.
  ///
  /// If undefined and [ThemeData.useMaterial3] is true,
  /// defaults to [kThinBorderWidth] = 1.
  final double? thinBorderWidth;

  /// Border radius override value for [TextButton].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kButtonRadius] 20dp in M2 and StadiumBorder in M3.
  /// https://m3.material.io/components/buttons/specs
  final double? textButtonRadius;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [TextButton] use as its base theme color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? textButtonSchemeColor;

  /// The style for the [TextButton]'s [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundColor] is used instead.
  final MaterialStateProperty<TextStyle?>? textButtonTextStyle;

  /// Border radius override value for [FilledButton].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kButtonRadius] 20dp in M2 and StadiumBorder in M3.
  /// https://m3.material.io/components/buttons/specs
  final double? filledButtonRadius;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [FilledButton] use as its base theme color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? filledButtonSchemeColor;

  /// The style for the [FilledButton]'s [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundColor] is used instead.
  final MaterialStateProperty<TextStyle?>? filledButtonTextStyle;

  // TODO(rydmike): Hold for https://github.com/flutter/flutter/issues/115827
  // /// Border radius override value for [FilledButton.tonal].
  // ///
  // /// If not defined and [defaultRadius] is undefined, defaults to
  // /// [kButtonRadius] 20dp in M2 and StadiumBorder in M3.
  // /// https://m3.material.io/components/buttons/specs
  // final double? filledButtonTonalRadius;
  //
  // /// Defines which [Theme] based [ColorScheme] based color the
  // /// [FilledButton.tonal] use as its base theme color.
  // ///
  // /// If not defined it defaults to theme.colorScheme.primary color via
  // /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  // final SchemeColor? filledButtonTonalSchemeColor;
  //
  // /// The style for the [FilledButton.tonal]'s [Text] widget descendants.
  // ///
  // /// The color of the [textStyle] is typically not used directly, the
  // /// [foregroundColor] is used instead.
  // final MaterialStateProperty<TextStyle?>? filledButtonTonalTextStyle;

  /// Border radius value for [ElevatedButton].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kButtonRadius] 20dp in M2 and StadiumBorder in M3.
  /// https://m3.material.io/components/buttons/specs
  final double? elevatedButtonRadius;

  /// Elevation of [ElevatedButton].
  ///
  /// This design favors a flat design using colors, the elevated button is
  /// primary colored by default, it thus needs no elevation or very little in
  /// FlexColorSchemes custom design.
  ///
  /// If null, defaults to [kElevatedButtonElevation] = 1, when [useMaterial3]
  /// is false. If [useMaterial3] is true, it is kept null and default M3
  /// elevation of [ElevatedButton] is kept.
  final double? elevatedButtonElevation;

  /// Defines which [Theme] based [ColorScheme] based color, that the
  /// [ElevatedButton] used as its main color.
  ///
  /// If [useMaterial3] is false, the [elevatedButtonSchemeColor] is used as
  /// button background color in M2 style. If [useMaterial3] is true, it is
  /// used as the button foreground color for text and icon.
  ///
  /// If not defined, it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on sub themes.
  final SchemeColor? elevatedButtonSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color, that the
  /// [ElevatedButton] uses as its secondary color.
  ///
  /// If [useMaterial3] is false, the [elevatedButtonSecondarySchemeColor] is
  /// used as button foreground color in M2 style. If [useMaterial3] is true,
  /// it is used as the button background color.
  ///
  /// If not defined, the [elevatedButtonSchemeColor]'s on color will be used if
  /// [useMaterial3] is false, and if it is true, then [ColorScheme.surface]
  /// will be used as default.
  final SchemeColor? elevatedButtonSecondarySchemeColor;

  /// The style for the [ElevatedButton]'s [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundColor] is used instead.
  final MaterialStateProperty<TextStyle?>? elevatedButtonTextStyle;

  /// Border radius value for [OutlinedButton].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kButtonRadius] 20dp in M2 and StadiumBorder in M3.
  /// https://m3.material.io/components/buttons/specs
  final double? outlinedButtonRadius;

  /// Defines which [Theme] based [ColorScheme] based color, that the
  /// [OutlinedButton] use as its main theme color.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? outlinedButtonSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color, that the
  /// [OutlinedButton] uses as its outline color.
  ///
  /// If [useMaterial3] is false, and the [outlinedButtonOutlineSchemeColor] is
  /// not defined, the [outlinedButtonSchemeColor] is used as default button
  /// outline color, following M2 style.
  ///
  /// If [useMaterial3] is true, and the [outlinedButtonOutlineSchemeColor] is
  /// not defined, the [ColorScheme.outline] is used as default button
  /// outline color in M3 style.
  final SchemeColor? outlinedButtonOutlineSchemeColor;

  /// The border width of the [OutlineButton].
  ///
  /// If not defined, defaults to [thinBorderWidth];
  final double? outlinedButtonBorderWidth;

  /// The border width of the pressed [OutlineButton].
  ///
  /// If not defined, defaults to [thickBorderWidth];
  final double? outlinedButtonPressedBorderWidth;

  /// The style for the [OutlinedButton]'s [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundColor] is used instead.
  final MaterialStateProperty<TextStyle?>? outlinedButtonTextStyle;

  /// Border radius value for [ToggleButtons].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kButtonRadius] 20dp.
  ///
  /// This is not in M3 specification, but FlexColorScheme component
  /// sub-themes harmonizes [ToggleButtons] size
  /// and border radius with the other Material buttons.
  final double? toggleButtonsRadius;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [ToggleButtons] use as its base theme color.
  ///
  /// Always defines the background color for selected button, and
  /// it's onColor pair defines the foreground for selected button.
  ///
  /// If [unselectedSchemeColor] is not defined, [baseSchemeColor] is also
  /// used as foreground color for unselected buttons.
  ///
  /// If [toggleButtonsBorderSchemeColor] is not defined, then in M2 it is also
  /// used as color base for the border color, in M3 an undefined
  /// [toggleButtonsBorderSchemeColor] results in [ColorScheme.outline] color
  /// being used.
  ///
  /// If not defined it defaults to [SchemeColor.primary].
  final SchemeColor? toggleButtonsSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [ToggleButtons] use as the foreground color for unselected toggle buttons.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, [toggleButtonsSchemeColor] will be used as base.
  final SchemeColor? toggleButtonsUnselectedSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [ToggleButtons] use as its border themed color.
  ///
  /// If not defined it defaults to [toggleButtonsSchemeColor] in M2 mode,
  /// in M3 it will result in [SchemeColor.outline] being used as fallback.
  final SchemeColor? toggleButtonsBorderSchemeColor;

  /// The border width of [ToggleButtons].
  ///
  /// If not defined, defaults to [thinBorderWidth];
  final double? toggleButtonsBorderWidth;

  /// Border radius value for [SegmentedButton].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kButtonRadius] 20dp in M2 and to Stadium border in M3.
  final double? segmentedButtonRadius;

  /// Defines which [Theme] based [ColorScheme] based color a selected
  /// [SegmentedButton] use as its background theme color.
  ///
  /// Defines the background color for selected button, and it's
  /// onColor pair automatically defines the foreground for selected buttons.
  ///
  /// If not defined it defaults to [SchemeColor.secondaryContainer] and
  /// foreground color becomes [SchemeColor.onSecondaryContainer].
  final SchemeColor? segmentedButtonSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [SegmentedButton] use as the background color for unselected buttons.
  ///
  /// If not defined it defaults to [SchemeColor.surface].
  final SchemeColor? segmentedButtonUnselectedSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [SegmentedButton] use as the foreground color for unselected buttons.
  ///
  /// If not defined it defaults to [SchemeColor.onSurface].
  final SchemeColor? segmentedButtonUnselectedForegroundSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [SegmentedButton] use as its border themed color.
  ///
  /// If not defined it defaults to [SchemeColor.outline].
  final SchemeColor? segmentedButtonBorderSchemeColor;

  /// The border width of [SegmentedButton].
  ///
  /// If not defined, defaults to [thinBorderWidth];
  final double? segmentedButtonBorderWidth;

  /// Defines which [Theme] based [ColorScheme] based color, that the old
  /// [MaterialButton] use as its main theme color.
  ///
  /// The [MaterialButton] is the parent class of old deprecated and removed
  /// buttons `RaisedButton`, `OutlineButton` and `FlatButton`. The theme
  /// `ButtonThemeData` it affects, is also used by [ButtonBar] and
  /// [DropdownButton] and it may still be useful to theme to same style
  /// as the theme used by the other buttons.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on its sub themes.
  final SchemeColor? materialButtonSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [Switch] and [SwitchListTile] use as base themed color.
  ///
  /// When not using sub-themes, the color defaults to
  /// ThemeData.colorScheme.secondary color that is used as FlexColorScheme's
  /// default for ThemeData toggleableActiveColor, as long as still needed.
  ///
  /// The ThemeData property toggleableActiveColor is being deprecated
  /// https://github.com/flutter/flutter/pull/95870. A future change for
  /// FlexColorScheme will be to see if it will be possible to continue to
  /// offer ThemeData.colorScheme.secondary as default color when not opting in
  /// on using the component sub-themes. Currently the default is already
  /// [ColorScheme.secondary] when not opting in on using sub-themes, matching
  /// the old Material 2 design standard.
  ///
  /// When you opt-in on using opinionated sub-themes, the default color is
  /// [ColorScheme.primary]. The opinionated themes uses a style that matches
  /// M3 color design based themes, and in it switches and toggles are mostly
  /// primary color based. In M3 color design, the secondary color is a poor
  /// choice for switches and toggles and it is therefore not used as default
  /// color, since it does not look nice with M3 based ColorSchemes, created
  /// eg using M3 color seeding. If you use a custom M3 color design where
  /// secondary color is still prominent, you can of course still use it.
  final SchemeColor? switchSchemeColor;

  // TODO(rydmike): Follow up M3 icon and outline cannot be themed, make issue.
  /// Defines which [Theme] based [ColorScheme] based color the
  /// [Switch] and [SwitchListTile] use as themed thumb color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If not defined, defaults to:
  ///
  /// - If [useMaterial3] is false [switchSchemeColor].
  /// - If [useMaterial3 ]is true [SchemeColor.primaryContainer].
  final SchemeColor? switchThumbSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [Checkbox] and [CheckboxListTile] use as base themed color.
  ///
  /// When not using sub-themes, the color defaults to
  /// ThemeData.colorScheme.secondary color that is used as FlexColorScheme's
  /// default for ThemeData toggleableActiveColor, as long as still needed.
  ///
  /// The ThemeData property toggleableActiveColor is being deprecated
  /// https://github.com/flutter/flutter/pull/95870. A future change for
  /// FlexColorScheme will be to see if it will be possible to continue to
  /// offer ThemeData.colorScheme.secondary as default color when not opting in
  /// on using the component sub-themes. Currently the default is already
  /// [ColorScheme.secondary] when not opting in on using sub-themes, matching
  /// the old Material 2 design standard.
  ///
  /// When you opt-in on using opinionated sub-themes, the default color is
  /// [ColorScheme.primary]. The opinionated themes uses a style that matches
  /// M3 color design based themes, and in it switches and toggles are mostly
  /// primary color based. In M3 color design, the secondary color is a poor
  /// choice for switches and toggles and it is therefore not used as default
  /// color, since it does not look nice with M3 based ColorSchemes, created
  /// eg using M3 color seeding. If you use a custom M3 color design where
  /// secondary color is still prominent, you can of course still use it.
  final SchemeColor? checkboxSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [Radio] and [RadioListTile] use as base themed color.
  ///
  /// When not using sub-themes, the color defaults to
  /// ThemeData.colorScheme.secondary color that is used as FlexColorScheme's
  /// default for ThemeData toggleableActiveColor, as long as still needed.
  ///
  /// The ThemeData property toggleableActiveColor is being deprecated
  /// https://github.com/flutter/flutter/pull/95870. A future change for
  /// FlexColorScheme will be to see if it will be possible to continue to
  /// offer ThemeData.colorScheme.secondary as default color when not opting in
  /// on using the component sub-themes. Currently the default is already
  /// [ColorScheme.secondary] when not opting in on using sub-themes, matching
  /// the old Material 2 design standard.
  ///
  /// When you opt-in on using opinionated sub-themes, the default color is
  /// [ColorScheme.primary]. The opinionated themes uses a style that matches
  /// M3 color design based themes, and in it switches and toggles are mostly
  /// primary color based. In M3 color design, the secondary color is a poor
  /// choice for switches and toggles and it is therefore not used as default
  /// color, since it does not look nice with M3 based ColorSchemes, created
  /// eg using M3 color seeding. If you use a custom M3 color design where
  /// secondary color is still prominent, you can of course still use it.
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

  /// The ColorScheme based color used on the [Slider] as its overall base
  /// color.
  ///
  /// If not defined, the [Slider] theme defaults to using the
  /// ambient theme's primary color.
  final SchemeColor? sliderBaseSchemeColor;

  /// The ColorScheme based color used on the [Slider] indicator color.
  ///
  /// If not defined, the [Slider] theme defaults in M2 mode to a dark grey in
  /// light mode, and a light grey in dark mode. In M3 mode it uses the
  /// [sliderBaseSchemeColor] as its color if not defined, defaulting to
  /// primary color if neither is defined.
  final SchemeColor? sliderIndicatorSchemeColor;

  /// If true, the value indicator becomes a tinted high contrast version of
  /// current [sliderIndicatorSchemeColor], with a bit of opacity.
  ///
  /// Default to false.
  final bool sliderValueTinted;

  // TODO(rydmike): RangeSlider to use real M3 style drop when supported.
  /// Enum used to select the type of built-in value indicator used by
  /// [Slider].
  ///
  /// The current two options included Material 2 default
  /// [RectangularSliderValueIndicatorShape] and Material 3 default
  /// [DropSliderValueIndicatorShape].
  ///
  /// If not defined, the default for the M2/M3 mode is used respectively.
  ///
  /// The effective [RangeSliderValueIndicatorShape] for a [RangeSlider] will
  /// also be the rectangular type, if that is effective value of
  /// [sliderValueIndicatorType]. If it is drop, then the reasonably matching
  /// [PaddleRangeSliderValueIndicatorShape] is used by the [RangeSlider].
  ///
  /// There is no M3 drop style available yet for [RangeSlider], it will be
  /// added to FCS when it is supported in Flutter.
  final FlexSliderIndicatorType? sliderValueIndicatorType;

  /// Whether the value indicator should be shown for different types of
  /// sliders.
  ///
  /// By default, [sliderShowValueIndicator] is set to
  /// [ShowValueIndicator.onlyForDiscrete]. The value indicator is only shown
  /// when the thumb is being touched.
  final ShowValueIndicator? sliderShowValueIndicator;

  /// The height of the [Slider] track.
  ///
  /// If undefined, defaults to 4 dp via Flutter SDK defaults.
  final double? sliderTrackHeight;

  /// Border radius value for [InputDecoration].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kInputDecoratorRadius] 16dpm if [useMaterial3] is false and to
  /// [kInputDecoratorM3Radius] if [useMaterial3] is true.
  final double? inputDecoratorRadius;

  /// Defines which [Theme] based [ColorScheme] based color the input decorator
  /// uses as color for the border and fill color when they are used.
  ///
  /// If not defined it defaults to theme.colorScheme.primary color.
  ///
  /// The border [inputDecoratorBorderSchemeColor] can be used to define the
  /// border color separately, but it defaults to this color if not defined.
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
  /// [inputDecoratorSchemeColor].
  final Color? inputDecoratorFillColor;

  /// Defines the alpha, opacity channel value used as opacity on effective
  /// [InputDecorator] background color.
  ///
  /// If defined, the valid range is 0 to 255 (0x00 to 0xFF), if out of bounds
  /// it is capped at closer value.
  ///
  /// If not defined, in M3 mode it defaults to 0xFF fully opaque. In M2 mode
  /// defaults to [kFillColorAlphaLight] (0x0D = 5% opacity) in light theme and
  /// to [kFillColorAlphaDark] (0x14 = 8% opacity) in dark mode.
  ///
  /// The border [inputDecoratorBorderSchemeColor] can be used to define the
  /// border color separately, but it defaults to this color if not defined.
  final int? inputDecoratorBackgroundAlpha;

  /// Defines which [Theme] based [ColorScheme] based color the input decorator
  /// uses as color for the border color when they are used.
  ///
  /// If not defined it defaults to color given by [inputDecoratorSchemeColor].
  final SchemeColor? inputDecoratorBorderSchemeColor;

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
  ///
  /// If undefined, defaults to [FlexInputBorderType.outline].
  final FlexInputBorderType? inputDecoratorBorderType;

  /// Determines if the [InputDecorator] focused state has a border.
  ///
  /// Defaults to true.
  ///
  /// Applies to both outline and underline mode.
  ///
  /// You can use this in a design where you use a fill color and want focused
  /// input fields to only be highlighted by the fill color and not have any
  /// focused input border style.
  ///
  /// When set to false, there is no border bored on focused states.
  final bool inputDecoratorFocusedHasBorder;

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
  /// disabledBorder. Unless [inputDecoratorFocusedHasBorder] is set to false,
  /// there is a border on focusedBorder, focusedErrorBorder
  /// and errorBorder. Unfocused error state thus has a border also when it is
  /// not focused, even when this is set to false. This is a design choice to
  /// continue to emphasize error state with an error border even when
  /// this property is set to false. If you want all focused states to not have
  /// a border also set [inputDecoratorFocusedHasBorder] to false.
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

  /// The border width of unfocused [InputDecoration] when it has a border.
  ///
  /// If not defined, defaults to [thinBorderWidth];
  final double? inputDecoratorBorderWidth;

  /// The border width of focused [InputDecoration] when it has a border.
  ///
  /// If not defined, defaults to [thickBorderWidth];
  final double? inputDecoratorFocusedBorderWidth;

  /// The icon color of the prefixIcon in a focused [InputDecoration].
  ///
  /// If not defined, defaults to [inputDecoratorSchemeColor] in FCS M2 and to
  /// [SchemeColor.onSurface] in FCS M3.
  final SchemeColor? inputDecoratorPrefixIconSchemeColor;

  /// Border radius value for [FloatingActionButton].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kFabRadius] 16dp, based on M3 Specification for normal sized FAB.
  /// https://m3.material.io/components/floating-action-button/specs
  ///
  /// The border radius is only assigned when [fabUseShape] is true, if
  /// [fabUseShape] is false, the [fabRadius] or [fabAlwaysCircular] has no
  /// effect on FAB shapes.
  ///
  /// If [fabAlwaysCircular] is true and a radius is given by [defaultRadius] or
  /// [fabRadius] the FAB will still be circular, radius settings have no
  /// effect then.
  ///
  /// If [ThemeData.useMaterial3] and [fabUseShape] are true, you cannot define
  /// FAB buttons that get the same rounding style as defined by the M3 spec.
  /// This is because the FAB cannot be themed in same style as its default null
  /// shape behavior. See issue
  /// [#107946](https://github.com/flutter/flutter/issues/107946) for
  /// more information.
  final double? fabRadius;

  /// Use shape theming on Floating Action Button (FAB).
  ///
  /// When [fabUseShape] is false, default since FCS version 5.2.0, no custom
  /// shape theme is used on FABs, it keeps its un-themed defaults. The
  /// [fabRadius] properties has no effect when[ fabUseShape] is false.
  ///
  /// If [ThemeData.useMaterial3] is false the FAB is circular. If it is true,
  /// the FAB uses M3 shapes as defined by
  /// https://m3.material.io/components/floating-action-button/specs
  ///
  /// Defaults to false.
  ///
  /// The default opinionated style was changed from true to false, in
  /// version 5.2.0. This is a style break with previous versions where it was
  /// true. The opinionated style change was done to use a style that by default
  /// matches M3 style, when [ThemeData.useMaterial3] is true.
  ///
  /// To make make circular FAB when [ThemeData.useMaterial3] is true, set
  /// [fabUseShape] to true and [fabRadius] to a high values, like 60.
  final bool fabUseShape;

  /// Always use circular Shape on Floating Actions Button.
  ///
  /// If [fabUseShape] is false the [fabAlwaysCircular] has no effect, FAB will
  /// be circular in in M2 and rounded with different radii depending on FAB
  /// size in M3.
  ///
  /// if [defaultRadius] or [fabRadius] is defined and [fabAlwaysCircular] is
  /// true the FAB will be circular in both M2 and M3.
  ///
  /// Extended FAB will use Stadium border when [fabAlwaysCircular] is true.
  ///
  /// Defaults to false.
  final bool fabAlwaysCircular;

  /// Defines which [Theme] based [ColorScheme] based color the Floating
  /// Action Buttons (FABs) use as their base color.
  ///
  /// If not defined, effective default is [ColorScheme.secondary] color in M2
  /// and [ColorScheme.primaryContainer] in M3 via Flutter theme defaults.
  final SchemeColor? fabSchemeColor;

  /// Border radius value for [Chip] widgets.
  ///
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kChipRadius] 8dp, based on M3 Specification
  /// https://m3.material.io/components/chips/specs
  final double? chipRadius;

  /// Defines which [Theme] based [ColorScheme] based color the Chips
  /// use as their base tint color.
  ///
  /// The selected color is only used as base for the [Chip] colors, it also
  /// uses alpha blend and opacity to create the effective Chip colors using
  /// the selected scheme color as base.
  ///
  /// If not defined it defaults to effective theme based color from using
  /// [SchemeColor.primary], when [useMaterial3] is false.
  ///
  /// If [useMaterial3] is true, using a null [chipSchemeColor] will
  /// result in M3 default Chip coloring being used without opacity and alpha
  /// blends. To get the same coloring for M3 as when [useMaterial3] is false,
  /// pass in [SchemeColor.primary].
  final SchemeColor? chipSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the Chips
  /// use as their selected color.
  ///
  /// The selected color is used together with its pair color, onColor if normal
  /// color was selected, and with normal color if onColor was selected
  /// for contrast text icon color on selected chips.
  ///
  ///
  /// If not defined it defaults to effective theme based color from using
  /// [SchemeColor.primary], when [useMaterial3] is false.
  ///
  /// If [useMaterial3] is true, using a null [chipSchemeColor] will
  /// result in M3 default Chip coloring being used without opacity and alpha
  /// blends. To get the same coloring for M3 as when [useMaterial3] is false,
  /// pass in [SchemeColor.primary].
  final SchemeColor? chipSelectedSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the Chips
  /// use as color of the delete icon.
  ///
  /// The selected color is only used as base for the [Chip] colors, it also
  /// uses alpha blend and opacity to create the effective Chip colors using
  /// the selected scheme color as base.
  ///
  /// If not defined it defaults to effective theme based color from using
  /// [SchemeColor.onSurface].
  final SchemeColor? chipDeleteIconSchemeColor;

  /// Border radius value for [Card].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kCardRadius] 12dp, based on M3 Specification
  /// https://m3.material.io/components/cards/specs
  final double? cardRadius;

  /// Elevation of [Card].
  ///
  /// This design favors a flat design using color branded tint on card
  /// background, and defaults to [kCardElevation] = 0 as default
  /// themed elevation on [Card] widgets.
  ///
  /// If not defined, defaults to [kCardElevation] = 0dp.
  final double? cardElevation;

  /// Border radius override value for the menu on [PopupMenuButton], [MenuBar]
  /// [MenuAnchor] and [DropDownMenu].
  ///
  /// When used by [FlexColorScheme] the border radius of popup menus follows
  /// the [defaultRadius] until and including 10 dp. After which it stays at
  /// 10 dp. If you need a higher border radius on popup menus than 10 dp,
  /// you will have to explicitly override it here. It will not look very
  /// good, the highlight inside the menu will start to overflow the corners and
  /// it is not clipped along the border radius. The underlying Widget is not
  /// designed with this high border rounding in mind, which makes sense since
  /// it does not look good with too much rounding on a typically small
  /// phone popup menu, that the widget was designed for originally.
  ///
  /// It will still look fairly OK with a border radius of max 12, the selected
  /// item highlight corner overflow at top and bottom is barely visible. If
  /// you configure it manually, max 12 might still be considered usable.
  /// To be on the safe side it only follows the [defaultBorder] to max 10.
  ///
  /// The built-in behavior in FlexColorScheme allows it to match at low
  /// inherited default radius values, but to also stay below the usable max
  /// rounding automatically at higher global default border radius values.
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kMenuRadius] 4dp, based on M3 Specification
  /// https://m3.material.io/components/menus/specs
  ///
  /// In versions before v5.0.0-dev.2 it defaulted to 10. The M3 spec for it
  /// was not available when it was chosen originally. It was assumed to have
  /// higher border radius like rest of designs. However, the spec has it
  /// defined [here](https://m3.material.io/components/menus/specs) now, and it
  /// is 4. Since border radius default values are stated in FlexColorScheme
  /// sub-theme design goals to follow the M3 design specs, it was updated to
  /// match the spec. A bit higher rounding, may actually fit better with
  /// the very round M3 design, try 8 or 10.
  final double? popupMenuRadius;

  /// Default elevation of [PopupMenuButton], [MenuBar], [MenuAnchor] and
  /// [DropDownMenu].
  ///
  /// If not defined, then if [useMaterial3] is:
  ///
  /// - false : defaults to [kPopupMenuElevationFCS] = 6 dp.
  /// - true  : defaults to [kPopupMenuElevation] = 3 dp.
  final double? popupMenuElevation;

  /// The ColorScheme based color used as background color on [PopupMenuButton],
  /// [MenuBar], [MenuAnchor] and [DropDownMenu].
  ///
  /// If not defined, then if [useMaterial3] is:
  /// - false : defaults to theme.cardColor.
  /// - true  : defaults to theme.colorScheme.surface.
  /// Usually they are the same.
  final SchemeColor? popupMenuSchemeColor;

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
  /// Defaults to undefined (null).
  ///
  /// If undefined, produced result is same as 1, fully opaque.
  final double? popupMenuOpacity;

  /// The border radius of the [MenuBar] container.
  ///
  /// If not defined, defaults to 4 via Flutter SDK default.
  final double? menuBarRadius;

  /// The elevation of the [MenuBar] container.
  ///
  /// If not defined, defaults to 3 via Flutter SDK default.
  ///
  /// Based on designs shown visually in the M3 guide, it should probably
  /// not be elevated by default in M3.
  /// https://m3.material.io/components/menus/guidelines
  final double? menuBarElevation;

  /// The shadow color of the [MenuBar] container.
  ///
  /// If not defined, defaults toe [ColorScheme.shadow] via Flutter SDK
  /// defaults and the [MenuBar] gets elevation shadow.
  final Color? menuBarShadowColor;

  // TODO(rydmike): Define all default for tooltips, see old FCS style.
  /// Border radius value for [Tooltips].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kTooltipRadius].
  final double? tooltipRadius;

  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// If not defined, defaults to [kTooltipWaitDuration].
  final Duration? tooltipWaitDuration;

  /// The length of time that the tooltip will be shown once it has appeared.
  ///
  /// If not defined, defaults to [kTooltipShowDuration].
  final Duration? tooltipShowDuration;

  /// The ColorScheme based color used as background color on [Tooltips].
  ///
  /// If defined this overrides the style set via
  /// [FlexColorScheme.tooltipsMatchBackground].
  ///
  /// If not defined, defaults to FCS default styling, see
  /// [FlexColorScheme.tooltipsMatchBackground] for details.
  final SchemeColor? tooltipSchemeColor;

  /// Tooltip background opacity.
  ///
  /// Used by FlexColorScheme to modify the opacity on the effective
  /// colorScheme.surface color used on the themed PopupMenu background color.
  ///
  /// If defined this overrides the opacity included via
  /// [FlexColorScheme.tooltipsMatchBackground].
  ///
  /// If not defined, defaults to FCS default opacity, see
  /// [FlexColorScheme.tooltipsMatchBackground] for details.
  ///
  /// If defined and [tooltipSchemeColor] is undefined (null), the
  /// [tooltipOpacity] has no effect since it cannot act on undefined value.
  final double? tooltipOpacity;

  /// Border radius value for [Dialog].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kDialogRadius] 28dp, based on M3 Specification
  /// https://m3.material.io/components/dialogs/specs
  final double? dialogRadius;

  // TODO(rydmike): Elevation does not exist in beta 3.7.0-1.4.pre.
  /// Elevation of [Dialog].
  ///
  /// The SDK elevation 24 is quite high, casting deep shadows. We make it less
  /// elevated via opinionated default value [kDialogElevation] of 6.
  ///
  /// One rationale for this change is that when using strong surface color
  /// branding and overlay color elevation in dark mode, the elevated dialog
  /// surface will become too light and contrast poorly with primary color.
  ///
  /// The value 6dp is also Material 3 spec default, we use it for M2 as well
  /// as FCS opinionated default.
  ///
  /// If not defined, defaults to [kDialogElevation] = 6.
  ///
  /// NOTE:
  ///
  /// Dialog elevation does not exist as a theme feature in Flutter
  /// beta 3.7.0-1.4.pre yet. It probably wont land in next stable release after
  /// Flutter stable 3.3 either. This feature has no function until it lands
  /// in stable from from master channel where it exists.
  final double? dialogElevation;

  /// Defines which [Theme] based [ColorScheme] based color dialogs use as
  /// as their background color.
  ///
  /// This will affect both background in [DialogTheme] and
  /// [TimePickerThemeData].
  ///
  /// If undefined, defaults to [SchemeColor.surface].
  ///
  /// If set to null [Dialog] will use its Flutter SDK default, which is
  /// [ThemeData.dialogBackgroundColor] which again is [ColorScheme.background].
  /// [TimePickerDialog] dialogs will use their own Flutter SDK default,
  /// which is [ColorScheme.surface].
  ///
  /// Since FlexColorScheme also sets [ThemeData.dialogBackgroundColor] to
  /// [ColorScheme.surface], there is no difference when using FlexColorscheme
  /// and setting [dialogBackgroundSchemeColor] to null versus keeping it
  /// at its default value [SchemeColor.surface]. This is valid as long as
  /// [ThemeData.dialogBackgroundColor] exists, but it will be in deprecated,
  /// see issue https://github.com/flutter/flutter/issues/91772.
  /// After that there will be a difference.
  ///
  /// Using surface color as default instead of background,
  /// ensures that dark mode dialogs will get elevation overlay in Material 2
  /// color, also when surface and background color are not equal.
  /// See issue: https://github.com/flutter/flutter/issues/90353
  final SchemeColor? dialogBackgroundSchemeColor;

  /// Border radius value for [TimePickerDialog].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kDialogRadius] 28dp, based on M3 Specification
  /// https://m3.material.io/components/dialogs/specs
  final double? timePickerDialogRadius;

  /// Default border radius on time entry elements in [TimePickerDialog].
  ///
  /// Follows Material M3 guide.
  /// https://m3.material.io/components/time-pickers/specs. and defaults to
  /// [kTimeElementRadius] if not defined.
  final double? timePickerElementRadius;

  /// Elevation of [SnackBar].
  ///
  /// If undefined, defaults to [kSnackBarElevation] = 4.
  final double? snackBarElevation;

  // TODO(rydmike): Review the FCS defaults, is doc below still correct?
  /// Defines which [Theme] based [ColorScheme] based color the SnackBars
  /// use as their base color. Typically one of inverse brightness compared
  /// to theme's surface color brightness.
  ///
  /// If not defined, it defaults to the opinionated color FlexColorScheme (FCS)
  /// choices below, when used via [FlexSubThemesData].
  ///
  /// * In light theme mode:
  ///   * FCS: onSurface with primary blend at 45% opacity, with tot opacity 95%
  ///   * Flutter M2 SDK uses: onSurface with surface at opacity 80%, blended
  ///     on top of surface.
  ///
  /// * In dark theme mode:
  ///   * FCS: onSurface with primary blend at 39% opacity, with tot opacity 93%
  ///   * Flutter M2 SDK uses: colorScheme.onSurface
  ///
  /// In M3 design the default is [ColorScheme.inverseSurface],
  /// which you can assign by selecting that as its property here too.
  final SchemeColor? snackBarBackgroundSchemeColor;

// TODO(rydmike): Review SnackBar the defaults.
  /// Defines which [Theme] based [ColorScheme] based color the SnackBar actions
  /// use as their color.
  ///
  /// If not defined default to: TBD.
  final SchemeColor? snackBarActionSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the [AppBar]
  /// background uses.
  ///
  /// If not defined, [AppBar] uses the color defined in
  /// [FlexColorScheme.appBarBackground]. If made with [FlexColorScheme.light]
  /// or [FlexColorScheme.dark], then the enum [FlexAppBarStyle] in property
  /// [appBarStyle], is used to determine the [AppBar] color and background.
  ///
  /// The themed [AppBar] background color is typically determined by defined
  /// [FlexAppBarStyle] in [FlexColorScheme.light] or [FlexColorScheme.dark].
  /// This property is an override that offers more quick config options by
  /// allowing picking a color from the effective [ColorScheme] different from
  /// options offered via [FlexColorScheme.light] and [FlexColorScheme.dark]
  /// ([appBarStyle) factory parameter.
  final SchemeColor? appBarBackgroundSchemeColor;

  /// Whether the AppBar title should be centered.
  ///
  /// Overrides the default value of [AppBar.centerTitle] property in all
  /// descendant [AppBar] widgets. If this property is null, then value
  /// is adapted to the current [TargetPlatform].
  final bool? appBarCenterTitle;

  /// The elevation that will be used if this app bar has something
  /// scrolled underneath it.
  ///
  /// Overrides the default value of [AppBar.scrolledUnderElevation] in all
  /// descendant [AppBar] widgets.
  ///
  /// If not defined, defaults to 3.
  final double? appBarScrolledUnderElevation;

  // TODO(rydmike): Monitor BottomAppBar M3 background issue.
  /// Defines which [Theme] based [ColorScheme] based color the [BottomAppBar]
  /// uses as background color.
  ///
  /// The [BottomAppBarTheme] has no properties for foreground color. If you use
  /// a background color that requires different contrast color than the
  /// active theme's surface colors, you will need to set their colors on
  /// widget level.
  ///
  /// Due to an issue in Flutter 3.7 and 3.7.1, that has been resolved in
  /// master channel, the background color of the [BottomAppBar] cannot
  /// be changed when using M3. See issue:
  /// https://github.com/flutter/flutter/pull/117082 and more explanation here:
  /// https://github.com/rydmike/flex_color_scheme/issues/115.
  final SchemeColor? bottomAppBarSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the [TabBar]
  /// items use.
  ///
  /// If not defined, TabBar items uses the factories
  /// [FlexColorScheme.light] or [FlexColorScheme.dark] with the enum value
  /// [FlexTabBarStyle] with property [tabBarStyle], to determine
  /// the [TabBar] item color.
  ///
  /// The themed [TabBar] background color is typically defined by
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

  /// Border radius value for [Drawer], also used by [NavigationDrawer].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kDrawerRadius] 28dp, based on M3 Specification
  /// https://m3.material.io/components/dialogs/specs
  final double? drawerRadius;

  /// Elevation of [Drawer] and [NavigationDrawer].
  ///
  /// If not defined, defaults to Flutter default, M2 uses 16 and M3 uses 1.
  final double? drawerElevation;

  /// Defines which [Theme] based [ColorScheme] based color [Drawer] uses as
  /// as its background color.
  ///
  /// This will affect both the background in [Drawer] and [NavigationDrawer].
  ///
  /// If undefined, defaults to [SchemeColor.surface] in M3 and to
  /// [SchemeColor.background] in M2.
  final SchemeColor? drawerBackgroundSchemeColor;

  /// Defines the width of [Drawer] and [NavigationDrawer].
  ///
  /// If not defined, defaults to 304dp via Flutter SDK defaults for M2, for
  /// [Drawer] widget. M3 spec has it at 360dp for [NavigationDrawer].
  final double? drawerWidth;

  /// Defines the width of [NavigationDrawer]'s indicator.
  ///
  /// If [drawerWidth] is defined and [drawerIndicatorWidth] is not, then
  /// [drawerIndicatorWidth] will be [drawerWidth] - 2 * 12, where 12dp is the
  /// M3 padding spec around the indicator.
  ///
  /// If not defined, and [drawerWidth] is not defined it defaults to 336dp
  /// via Flutter SDK defaults for M3/M2. The 336dp width values is derived
  /// from the M3 padding spec of 12dp around both sides of the indicator.
  final double? drawerIndicatorWidth;

  /// Border radius of the selection indicator on the [NavigationDrawer].
  ///
  /// If not defined, defaults to [StadiumBorder].
  ///
  /// FCS default, follows the Material M3 guide:
  /// https://m3.material.io/components/navigation-drawer/specs
  final double? drawerIndicatorRadius;

  /// Defines which [Theme] based [ColorScheme] based color [NavigationDrawer]
  /// uses as as its background color on the selection indicator.
  ///
  /// If undefined, defaults to [SchemeColor.secondaryContainer].
  final SchemeColor? drawerIndicatorSchemeColor;

  /// Defines the opacity used on the `NavigationDrawer`'s indicator color.
  ///
  /// If not defined, default to 1, fully opaque.
  final double? drawerIndicatorOpacity;

  /// Defines which [Theme] based [ColorScheme] based color that the
  /// [BottomSheet] uses as background color when presented as a none modal
  /// bottom sheet.
  ///
  /// If not defined, defaults to Material 3 default ColorScheme.surface.
  /// None FlexColorScheme using defaults to default color of [Material] which
  /// is theme.canvasColor which typically is assigned the same value as
  /// theme.colorScheme.background.
  final SchemeColor? bottomSheetBackgroundColor;

  /// Defines which [Theme] based [ColorScheme] based color that the
  /// [BottomSheet] uses as background color when presented as a modal
  /// bottom sheet.
  ///
  /// If not defined, defaults to Material 3 default ColorScheme.surface.
  /// None FlexColorScheme using defaults to default color of [Material] which
  /// is theme.canvasColor which typically is assigned the same value as
  /// theme.colorScheme.background.
  final SchemeColor? bottomSheetModalBackgroundColor;

  /// Border radius value for [BottomSheet].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kBottomSheetBorderRadius] 28.
  ///
  /// FCS default, follows the Material M3 guide:
  /// https://m3.material.io/components/text-fields/specs
  final double? bottomSheetRadius;

  /// Elevation of none modal [BottomSheet].
  ///
  /// If null, defaults to [kBottomSheetElevation] = 1, if [useMaterial3]
  /// is true, and to [kBottomSheetElevationM2] = 4, if false.
  final double? bottomSheetElevation;

  /// Elevation of modal [BottomSheet].
  ///
  /// If null, defaults to [kBottomSheetModalElevation] = 2, if [useMaterial3]
  /// is true, and to [kBottomSheetModalElevationM2] = 8 if false.
  final double? bottomSheetModalElevation;

  // ---------------------------------------------------------------------------
  //
  // BottomNavigationBar Properties
  //
  // ---------------------------------------------------------------------------

  /// Optional text style for the [BottomNavigationBar] labels.
  ///
  /// If [useFlutterDefaults] is false, the text style
  /// [FlexColorScheme.m3TextTheme.bodyMedium]
  /// will be used as base style for the text style.
  ///
  /// If [useFlutterDefaults] is true, null will be passed to
  /// [FlexSubThemes.bottomNavigationBar] and along to theme creation, if all
  /// labeling modifying properties (size and scheme color) are also null, it
  /// will then be passed along as null, allowing it to remain undefined
  /// and widget default behavior sets the default. If label size or scheme
  /// is defined, a default TextStyle() will be created, if
  /// [bottomNavigationBarLabelTextStyle] is undefined, that gets th size and
  /// color applied.
  ///
  /// The size and colors defined in any of the text size and color properties
  /// are applied as overrides on the text style.
  final TextStyle? bottomNavigationBarLabelTextStyle;

  /// The size of the text label on selected [BottomNavigationBar] item.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item, 14 is used as fallback if needed.
  final double? bottomNavigationBarSelectedLabelSize;

  /// The size of the text label on unselected [BottomNavigationBar] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on unselected items. Defaults to [selectedLabelSize] - 2, but min 8.
  /// Smaller than 8dp is not legible on most screens.
  ///
  /// [BottomNavigationBar] uses this -2dp smaller font on the unselected
  /// label as default, since it is so based on Material 2 spec. By assigning
  /// same value as to selectedLabelSize, you can make them the same size.
  final double? bottomNavigationBarUnselectedLabelSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [BottomNavigationBar]'s selected label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// label modifying properties are undefined, including the text style,
  /// the effective color will be [ColorScheme.primary] in light theme and
  /// [ColorScheme.dark] in dark theme mode.
  final SchemeColor? bottomNavigationBarSelectedLabelSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [BottomNavigationBar]'s unselected label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
  /// blend and opacity, if [bottomNavigationBarMutedUnselectedLabel] is true.
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// label modifying properties are undefined, including the text style,
  /// the effective color will be [ThemeData.unselectedWidgetColor]
  /// which is [Colors.black54] in light mode and [Colors.white70] in dark.
  final SchemeColor? bottomNavigationBarUnselectedLabelSchemeColor;

  /// If true, the unselected label in the [BottomNavigationBar] use a more
  /// muted color version of the color defined by
  /// [bottomNavigationBarUnselectedLabelSchemeColor].
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to true.
  final bool? bottomNavigationBarMutedUnselectedLabel;

  /// The size of the icon on selected [BottomNavigationBar] item.
  ///
  /// If undefined, defaults to 24.
  final double? bottomNavigationBarSelectedIconSize;

  /// The size of the icon on unselected [BottomNavigationBar] items.
  ///
  /// If undefined, defaults to [bottomNavigationBarSelectedIconSize].
  final double? bottomNavigationBarUnselectedIconSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [BottomNavigationBar]'s selected item icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// icon modifying properties are undefined, the effective color will be
  /// [ColorScheme.primary] in light and [ColorScheme.dark] in dark theme mode.
  final SchemeColor? bottomNavigationBarSelectedIconSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the [BottomNavigationBar]'s unselected items icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
  /// blend and opacity,if [bottomNavigationBarMutedUnselectedLabel] is true.
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// icon modifying properties are undefined,
  /// the effective color will be [ThemeData.unselectedWidgetColor]
  /// which is [Colors.black54] in light mode and [Colors.white70] in dark.
  final SchemeColor? bottomNavigationBarUnselectedIconSchemeColor;

  /// If true, the unselected icon in the [BottomNavigationBar] use a more muted
  /// color version of the color defined by
  /// [bottomNavigationBarUnselectedIconSchemeColor].
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to true.
  final bool? bottomNavigationBarMutedUnselectedIcon;

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [BottomNavigationBar].
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.background].
  ///
  /// If [useFlutterDefaults] true, and this property is undefined,
  /// the effective background color will also be [ColorScheme.background].
  ///
  /// FlexColorScheme sets background defaults of [BottomNavigationBar],
  /// [NavigationBar] and [BottomNavigationBar] to [SchemeColor.background]
  /// when it is using component sub-themes.
  /// Flutter SDK uses different colors on all three widgets. Our opinion is
  /// that they should all default to using the same [ColorScheme] based
  /// color. FlexColorScheme uses the background color as this default.
  final SchemeColor? bottomNavigationBarBackgroundSchemeColor;

  /// BottomNavigationBar background opacity.
  ///
  /// If undefined, default to 1, fully opaque.
  final double? bottomNavigationBarOpacity;

  /// Elevation of [BottomNavigationBar].
  ///
  /// If not defined, defaults to [kBottomNavigationBarElevation] = 0.
  final double? bottomNavigationBarElevation;

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
  ///
  /// If undefined, defaults to Flutter SDK default. Where
  /// If type is provided, it is returned. Next, if the bottom navigation bar
  /// theme provides a type, it is used. Finally, the default behavior will be
  /// [BottomNavigationBarType.fixed] for 3 or fewer items, and
  /// [BottomNavigationBarType.shifting] is used for 4+ items.
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

  /// Optional text style for the [NavigationBar] labels.
  ///
  /// If [useFlutterDefaults] is false, the text style
  /// [ThemeData.textTheme.labelMedium]  will be used as base style for the
  /// text style.
  ///
  /// If [useFlutterDefaults] is true, null will be passed to
  /// [FlexSubThemes.navigationBarTheme] and along to theme creation, if all
  /// labeling modifying properties (size and scheme color) are also null, it
  /// will then be passed along as null, allowing it to remain undefined
  /// and widget default behavior sets the default. If label size or scheme
  /// is defined, a default TextStyle() will be created, if
  /// [navigationBarLabelTextStyle] is undefined, that gets the requested size
  /// and color applied.
  ///
  /// The size and colors defined in any of the text size and color properties
  /// are applied as overrides on the text style.
  final TextStyle? navigationBarLabelTextStyle;

  /// The size of the text label on selected [NavigationBar] item.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item, 12 is used as fallback if needed.
  final double? navigationBarSelectedLabelSize;

  /// The size of the text label on unselected [NavigationBar] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on unselected items, 12 is used as fallback if needed.
  final double? navigationBarUnselectedLabelSize;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the [NavigationBar]'s label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// label modifying properties are undefined, including the text style,
  /// the effective color will be [ColorScheme.onSurface] in M2 and M3.
  final SchemeColor? navigationBarSelectedLabelSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationBar]'s unselected label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
  /// blend and opacity, if [bottomNavigationBarMutedUnselectedLabel] is true.
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// label modifying properties are undefined, including the text style,
  /// the effective color will be [ColorScheme.onSurface] in M2 and
  /// [ColorScheme.onSurfaceVariant] in M3.
  final SchemeColor? navigationBarUnselectedLabelSchemeColor;

  /// If true, the unselected label in the [NavigationBar] use a more
  /// muted color version of the color defined by
  /// [navigationBarUnselectedLabelSchemeColor].
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to true.
  final bool? navigationBarMutedUnselectedLabel;

  /// The size of the icon on selected [NavigationBar] item.
  ///
  /// If undefined, defaults to 24.
  final double? navigationBarSelectedIconSize;

  /// The size of the icon on unselected [NavigationBar] items.
  ///
  /// If undefined, defaults to [navigationBarSelectedIconSize].
  final double? navigationBarUnselectedIconSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationBar]'s selected item icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// icon modifying properties are undefined, the effective color will be
  /// [ColorScheme.onSurface] in M2 and [ColorScheme.onSecondaryContainer]
  /// in M3.
  final SchemeColor? navigationBarSelectedIconSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationBar]'s unselected item icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
  /// blend and opacity, if [navigationBarMutedUnselectedIcon] is true.
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// icon modifying properties are undefined,
  /// the effective color will be [ColorScheme.onSurface] in M2 and
  /// [ColorScheme.onSurfaceVariant] in M3.
  final SchemeColor? navigationBarUnselectedIconSchemeColor;

  /// If true, the unselected icon in the [NavigationBar] use a more muted
  /// color version of the color defined by
  /// [navigationBarUnselectedIconSchemeColor].
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to false.
  final bool? navigationBarMutedUnselectedIcon;

  /// Select which color from the theme [ColorScheme] to use as base for
  /// the [NavigationBar]'s selected item indicator.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.primary], additionally
  /// a default [navigationBarIndicatorOpacity] is applied.
  ///
  /// If [useFlutterDefaults] true, and this property is undefined,
  /// the effective indicator color will be [ColorScheme.secondary]
  /// with opacity 24% in M2 and [ColorScheme.secondaryContainer] in M3.
  final SchemeColor? navigationBarIndicatorSchemeColor;

  /// Opacity used on the [NavigationBar] indicator.
  ///
  /// If undefined and [ThemeData.useMaterial3] is false then it defaults to
  /// 24%.
  ///
  /// The default opacity is computed from [kNavigationBarIndicatorAlpha] 0x3D,
  /// which is 61 giving 24% opacity.
  /// This value is the same as Flutter SDK uses in Material 2. Material 3 may
  /// often use no alpha and just different solid color hue instead.
  /// The default value of this property may be adjusted later as Flutter
  /// moves towards M3 designs. It might become 1.0.
  final double? navigationBarIndicatorOpacity;

  /// Border radius of the selection indicator on the [NavigationBar].
  ///
  /// If not defined, defaults to [StadiumBorder].
  ///
  /// FCS default, follows the Material M3 guide:
  /// https://m3.material.io/components/navigation-bar/specs.
  final double? navigationBarIndicatorRadius;

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [NavigationBar].
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.background] in M2 and in M3 to
  /// [ColorScheme.surface], with an [ColorScheme.primary] used as overlay
  /// color with hard coded overlay elevation 3.
  ///
  /// If [useFlutterDefaults] true, and this property is undefined,
  /// the effective M2 background color will be [ColorScheme.surface],
  /// with an [ColorScheme.onSurface] used as overlay color with hard
  /// coded overlay elevation 3. The actual Flutter SDK elevation is also
  /// hard coded to 0.
  ///
  /// FlexColorScheme sets background defaults of [NavigationRail],
  /// [NavigationBar] and [BottomNavigationBar] to [ColorScheme.background]
  /// when it using opinionated component sub-themes.
  /// Flutter SDK uses different colors on all three widgets. Our opinion is
  /// that they should all default to using the same [ColorScheme] based
  /// color. FlexColorScheme uses and recommends background color as this
  /// default. The [ColorScheme.background] was chosen as it is the same that
  /// the Drawer uses as well, so when using tinted backgrounds where surface
  /// and background are different, they will still match.
  final SchemeColor? navigationBarBackgroundSchemeColor;

  /// Height of the container for the Material 3 [NavigationBar].
  ///
  /// In undefined, defaults to [kNavigationBarHeight] which is 62 dp.
  ///
  /// If [useFlutterDefaults] true, and this property is undefined, it defaults
  /// to 80.
  final double? navigationBarHeight;

  /// NavigationBar background opacity.
  ///
  /// If undefined, defaults to 1, fully opaque.
  final double? navigationBarOpacity;

  /// The z-coordinate to be used for the [NavigationBar]'s elevation.
  ///
  /// If undefined, defaults to default Flutter SDK [NavigationBar] elevation,
  /// which if:
  ///  - If [useMaterial] if true, is 3 dp.
  ///  - If [useMaterial] if false, is 0 dp.
  final double? navigationBarElevation;

  /// Specifies when each [NavigationDestination]'s label should appear.
  ///
  /// If undefined, default to [NavigationDestinationLabelBehavior.alwaysShow].
  final NavigationDestinationLabelBehavior? navigationBarLabelBehavior;

  // ---------------------------------------------------------------------------
  //
  // Navigation Rail Properties
  //
  // ---------------------------------------------------------------------------

  /// Optional text style for the [NavigationRail] labels.
  ///
  /// If [useFlutterDefaults] is false, the text style
  /// [ThemeData.textTheme.labelMedium] will be used as base style for
  /// the text style.
  ///
  /// If [useFlutterDefaults] is true, null will be passed to
  /// [FlexSubThemes.navigationRailTheme] and along to theme creation, if all
  /// labeling modifying properties (size and scheme color) are also null, it
  /// will then be passed along as null, allowing it to remain undefined
  /// and widget default behavior sets the default. If label size or scheme
  /// is defined, a default TextStyle() will be created, if
  /// [navigationRailLabelTextStyle] is undefined, that gets the requested
  /// size and color applied.
  ///
  /// The size and colors defined in any of the text size and color properties
  /// are applied as overrides on the text style.
  final TextStyle? navigationRailLabelTextStyle;

  /// The size of the text label on selected [NavigationRail] item.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on selected item, 11 is used as fallback if needed.
  final double? navigationRailSelectedLabelSize;

  /// The size of the text label on unselected [NavigationRail] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on unselected items, 11 is used as fallback if needed.
  final double? navigationRailUnselectedLabelSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationRail]'s selected label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// label modifying properties are undefined, including the text style,
  /// the effective color will be [ColorScheme.primary] in M2 and
  /// [ColorScheme.onSurface] in M3.
  final SchemeColor? navigationRailSelectedLabelSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationRails]'s unselected label text color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
  /// blend and opacity, if [mutedUnselectedLabel] is true.
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// label modifying properties are undefined, including the text style,
  /// the effective color will be [ColorScheme.onSurface] with opacity 64% in
  /// M2 and [ColorScheme.onSurface] in M3.
  final SchemeColor? navigationRailUnselectedLabelSchemeColor;

  /// If true, the unselected label in the [NavigationRail] use a more
  /// muted color version of the color defined by
  /// [navigationRailUnselectedLabelSchemeColor].
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to true.
  final bool? navigationRailMutedUnselectedLabel;

  /// The size of the icon on selected [NavigationRail] item.
  ///
  /// If undefined, it defaults to 24.
  final double? navigationRailSelectedIconSize;

  /// The size of the icon on unselected [NavigationRail] items.
  ///
  /// If undefined, defaults to [navigationRailSelectedIconSize].
  final double? navigationRailUnselectedIconSize;

  /// Select which color from the theme's [ColorScheme] to use as base for
  /// the [NavigationRail]'s selected item icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// icon modifying properties are undefined, the effective color will
  /// also be [ColorScheme.primary] in M2 and
  /// [ColorScheme.onSecondaryContainer] in M3.
  final SchemeColor? navigationRailSelectedIconSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use as base for
  /// the [NavigationRail]'s unselected items icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.onSurface], and adds an alpha
  /// blend and opacity,if [navigationRailMutedUnselectedLabel] is true.
  ///
  /// If [useFlutterDefaults] is true, and this property and all other
  /// icon modifying properties are undefined,
  /// the effective color will be [ColorScheme.onSurface] with 64% opacity
  /// in M2 and [ColorScheme.onSurfaceVariant] in M3.
  final SchemeColor? navigationRailUnselectedIconSchemeColor;

  /// If true, the unselected icon in the [NavigationRail] use a more muted
  /// color version of the color defined by
  /// [navigationBarUnselectedIconSchemeColor].
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to true.
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
  /// If `undefined`, defaults to [NavigationRailThemeData.useIndicator].
  /// If that is also undefined, then it defaults to [ThemeData.useMaterial3].
  ///
  /// Defaults to true. Can be set to null and then uses above default
  /// widget behavior.
  final bool? navigationRailUseIndicator;

  /// Select which color from the theme [ColorScheme] to use as base for
  /// the selected [NavigationRails]'s highlighted item.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.primary], additionally
  /// a default [navigationRailIndicatorOpacity] is applied.
  ///
  /// If [useFlutterDefaults] true, and this property is undefined,
  /// the effective background color will also be [ColorScheme.secondary]
  /// with opacity 24% in M2 and [ColorScheme.secondaryContainer] in M3.
  final SchemeColor? navigationRailIndicatorSchemeColor;

  /// Opacity used on the [NavigationBar] indicator.
  ///
  /// If undefined defaults to 24%.
  ///
  /// The default opacity is computed from [kNavigationBarIndicatorAlpha] 0x3D,
  /// which is 61 giving 24% opacity.
  /// This value is the same as Flutter SDK uses in Material 2. Material 3 may
  /// often use no alpha and just different solid color hue instead.
  /// The default value of this property may be adjusted later as Flutter
  /// moves towards M3 designs. It might become 1.0.
  final double? navigationRailIndicatorOpacity;

  /// Border radius of the selection indicator on the [NavigationRail].
  ///
  /// If not defined, defaults to [StadiumBorder].
  ///
  /// FCS default, follows the Material M3 guide:
  /// https://m3.material.io/components/navigation-rail/specs.
  final double? navigationRailIndicatorRadius;

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [NavigationRail].
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.background].
  ///
  /// If [useFlutterDefaults] true, and this property is undefined,
  /// the effective background color will be [ColorScheme.surface].
  ///
  /// FlexColorScheme sets background defaults of [NavigationRail],
  /// [NavigationBar] and [BottomNavigationBar] to [ColorScheme.background]
  /// when it using opinionated component sub-themes.
  /// Flutter SDK uses different colors on all three widgets. Our opinion is
  /// that they should all default to using the same [ColorScheme] based
  /// color. FlexColorScheme uses and recommends background color as this
  /// default. The [ColorScheme.background] was chosen as it is the same that
  /// the Drawer uses as well, so when using tinted backgrounds where surface
  /// and background are different, they will still match.
  final SchemeColor? navigationRailBackgroundSchemeColor;

  /// NavigationRail background opacity.
  ///
  /// If undefined, defaults to 1, fully opaque.
  final double? navigationRailOpacity;

  /// The z-coordinate to be used for the [NavigationRail]'s elevation.
  ///
  /// If undefined, defaults to [kNavigationRailElevation] = 0.
  final double? navigationRailElevation;

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
    final bool? tintedDisabledControls,
    final int? blendOnLevel,
    final bool? blendOnColors,
    final bool? useFlutterDefaults,
    //
    final FlexTint? elevationTint,
    final FlexShadow? elevationShadow,
    //
    final bool? blendTextTheme,
    final bool? useTextTheme,
    final bool? useM2StyleDividerInM3,
    //
    final double? defaultRadius,
    final Size? buttonMinSize,
    final EdgeInsetsGeometry? buttonPadding,
    //
    final double? thickBorderWidth,
    final double? thinBorderWidth,
    //
    final double? textButtonRadius,
    final SchemeColor? textButtonSchemeColor,
    final MaterialStateProperty<TextStyle?>? textButtonTextStyle,
    //
    final double? filledButtonRadius,
    final SchemeColor? filledButtonSchemeColor,
    final MaterialStateProperty<TextStyle?>? filledButtonTextStyle,
    //
    // TODO(rydmike): Hold for https://github.com/flutter/flutter/issues/115827
    // final double? filledButtonTonalRadius,
    // final SchemeColor? filledButtonTonalSchemeColor,
    // final MaterialStateProperty<TextStyle?>? filledButtonTonalTextStyle,
    //
    final double? elevatedButtonRadius,
    final double? elevatedButtonElevation,
    final SchemeColor? elevatedButtonSchemeColor,
    final SchemeColor? elevatedButtonSecondarySchemeColor,
    final MaterialStateProperty<TextStyle?>? elevatedButtonTextStyle,
    //
    final double? outlinedButtonRadius,
    final SchemeColor? outlinedButtonSchemeColor,
    final SchemeColor? outlinedButtonOutlineSchemeColor,
    final MaterialStateProperty<TextStyle?>? outlinedButtonTextStyle,
    final double? outlinedButtonBorderWidth,
    final double? outlinedButtonPressedBorderWidth,
    //
    final double? toggleButtonsRadius,
    final SchemeColor? toggleButtonsSchemeColor,
    final SchemeColor? toggleButtonsUnselectedSchemeColor,
    final SchemeColor? toggleButtonsBorderSchemeColor,
    final double? toggleButtonsBorderWidth,
    //
    final double? segmentedButtonRadius,
    final SchemeColor? segmentedButtonSchemeColor,
    final SchemeColor? segmentedButtonUnselectedSchemeColor,
    final SchemeColor? segmentedButtonUnselectedForegroundSchemeColor,
    final SchemeColor? segmentedButtonBorderSchemeColor,
    final double? segmentedButtonBorderWidth,
    //
    final SchemeColor? materialButtonSchemeColor,
    //
    final SchemeColor? switchSchemeColor,
    final SchemeColor? switchThumbSchemeColor,
    final SchemeColor? checkboxSchemeColor,
    final SchemeColor? radioSchemeColor,
    final bool? unselectedToggleIsColored,
    //
    final SchemeColor? sliderBaseSchemeColor,
    final SchemeColor? sliderIndicatorSchemeColor,
    final bool? sliderValueTinted,
    final FlexSliderIndicatorType? sliderValueIndicatorType,
    final ShowValueIndicator? sliderShowValueIndicator,
    final double? sliderTrackHeight,
    //
    final double? inputDecoratorRadius,
    final SchemeColor? inputDecoratorSchemeColor,
    final bool? inputDecoratorIsFilled,
    final Color? inputDecoratorFillColor,
    final int? inputDecoratorBackgroundAlpha,
    final SchemeColor? inputDecoratorBorderSchemeColor,
    final FlexInputBorderType? inputDecoratorBorderType,
    final bool? inputDecoratorFocusedHasBorder,
    final bool? inputDecoratorUnfocusedHasBorder,
    final bool? inputDecoratorUnfocusedBorderIsColored,
    final double? inputDecoratorBorderWidth,
    final double? inputDecoratorFocusedBorderWidth,
    final SchemeColor? inputDecoratorPrefixIconSchemeColor,
    //
    final double? fabRadius,
    final bool? fabUseShape,
    final bool? fabAlwaysCircular,
    final SchemeColor? fabSchemeColor,
    //
    final double? chipRadius,
    final SchemeColor? chipSchemeColor,
    final SchemeColor? chipSelectedSchemeColor,
    final SchemeColor? chipDeleteIconSchemeColor,
    //
    final double? cardRadius,
    final double? cardElevation,
    //
    final double? popupMenuRadius,
    final double? popupMenuElevation,
    final SchemeColor? popupMenuSchemeColor,
    final double? popupMenuOpacity,
    //
    final double? menuBarRadius,
    final double? menuBarElevation,
    final Color? menuBarShadowColor,
    //
    final double? tooltipRadius,
    final Duration? tooltipWaitDuration,
    final Duration? tooltipShowDuration,
    final SchemeColor? tooltipSchemeColor,
    final double? tooltipOpacity,
    //
    final double? dialogElevation,
    final double? dialogRadius,
    final SchemeColor? dialogBackgroundSchemeColor,
    final double? timePickerDialogRadius,
    final double? timePickerElementRadius,
    //
    final double? snackBarElevation,
    final SchemeColor? snackBarBackgroundSchemeColor,
    final SchemeColor? snackBarActionSchemeColor,
    //
    final SchemeColor? appBarBackgroundSchemeColor,
    final bool? appBarCenterTitle,
    final double? appBarScrolledUnderElevation,
    final SchemeColor? bottomAppBarSchemeColor,
    //
    final SchemeColor? tabBarItemSchemeColor,
    final SchemeColor? tabBarIndicatorSchemeColor,
    //
    final double? drawerRadius,
    final double? drawerElevation,
    final SchemeColor? drawerBackgroundSchemeColor,
    final double? drawerWidth,
    final double? drawerIndicatorWidth,
    final double? drawerIndicatorRadius,
    final SchemeColor? drawerIndicatorSchemeColor,
    final double? drawerIndicatorOpacity,
    //
    final SchemeColor? bottomSheetBackgroundColor,
    final SchemeColor? bottomSheetModalBackgroundColor,
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
    final SchemeColor? navigationBarIndicatorSchemeColor,
    final double? navigationBarIndicatorOpacity,
    final double? navigationBarIndicatorRadius,
    final SchemeColor? navigationBarBackgroundSchemeColor,
    final double? navigationBarOpacity,
    final double? navigationBarElevation,
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
    final double? navigationRailIndicatorOpacity,
    final double? navigationRailIndicatorRadius,
    final SchemeColor? navigationRailBackgroundSchemeColor,
    final double? navigationRailOpacity,
    final double? navigationRailElevation,
    final NavigationRailLabelType? navigationRailLabelType,
    final double? navigationRailGroupAlignment,
  }) {
    return FlexSubThemesData(
      interactionEffects: interactionEffects ?? this.interactionEffects,
      tintedDisabledControls:
          tintedDisabledControls ?? this.tintedDisabledControls,
      blendOnLevel: blendOnLevel ?? this.blendOnLevel,
      blendOnColors: blendOnColors ?? this.blendOnColors,
      useFlutterDefaults: useFlutterDefaults ?? this.useFlutterDefaults,
      //
      elevationTint: elevationTint ?? this.elevationTint,
      elevationShadow: elevationShadow ?? this.elevationShadow,
      //
      blendTextTheme: blendTextTheme ?? this.blendTextTheme,
      useTextTheme: useTextTheme ?? this.useTextTheme,
      useM2StyleDividerInM3:
          useM2StyleDividerInM3 ?? this.useM2StyleDividerInM3,
      //
      defaultRadius: defaultRadius ?? this.defaultRadius,
      buttonMinSize: buttonMinSize ?? this.buttonMinSize,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      //
      thickBorderWidth: thickBorderWidth ?? this.thickBorderWidth,
      thinBorderWidth: thinBorderWidth ?? this.thinBorderWidth,
      //
      textButtonRadius: textButtonRadius ?? this.textButtonRadius,
      textButtonSchemeColor:
          textButtonSchemeColor ?? this.textButtonSchemeColor,
      textButtonTextStyle: textButtonTextStyle ?? this.textButtonTextStyle,
      //
      filledButtonRadius: filledButtonRadius ?? this.filledButtonRadius,
      filledButtonSchemeColor:
          filledButtonSchemeColor ?? this.filledButtonSchemeColor,
      filledButtonTextStyle:
          filledButtonTextStyle ?? this.filledButtonTextStyle,
      //
      // TODO(rydmike): Hold https://github.com/flutter/flutter/issues/115827
      // filledButtonTonalRadius:
      //     filledButtonTonalRadius ?? this.filledButtonTonalRadius,
      // filledButtonTonalSchemeColor:
      //     filledButtonTonalSchemeColor ?? this.filledButtonTonalSchemeColor,
      // filledButtonTonalTextStyle:
      //     filledButtonTonalTextStyle ?? this.filledButtonTonalTextStyle,
      //
      elevatedButtonRadius: elevatedButtonRadius ?? this.elevatedButtonRadius,
      elevatedButtonElevation:
          elevatedButtonElevation ?? this.elevatedButtonElevation,
      elevatedButtonSchemeColor:
          elevatedButtonSchemeColor ?? this.elevatedButtonSchemeColor,
      elevatedButtonSecondarySchemeColor: elevatedButtonSecondarySchemeColor ??
          this.elevatedButtonSecondarySchemeColor,
      elevatedButtonTextStyle:
          elevatedButtonTextStyle ?? this.elevatedButtonTextStyle,
      //
      outlinedButtonRadius: outlinedButtonRadius ?? this.outlinedButtonRadius,
      outlinedButtonSchemeColor:
          outlinedButtonSchemeColor ?? this.outlinedButtonSchemeColor,
      outlinedButtonOutlineSchemeColor: outlinedButtonOutlineSchemeColor ??
          this.outlinedButtonOutlineSchemeColor,
      outlinedButtonBorderWidth:
          outlinedButtonBorderWidth ?? this.outlinedButtonBorderWidth,
      outlinedButtonPressedBorderWidth: outlinedButtonPressedBorderWidth ??
          this.outlinedButtonPressedBorderWidth,
      outlinedButtonTextStyle:
          outlinedButtonTextStyle ?? this.outlinedButtonTextStyle,
      //
      toggleButtonsRadius: toggleButtonsRadius ?? this.toggleButtonsRadius,
      toggleButtonsSchemeColor:
          toggleButtonsSchemeColor ?? this.toggleButtonsSchemeColor,
      toggleButtonsUnselectedSchemeColor: toggleButtonsUnselectedSchemeColor ??
          this.toggleButtonsUnselectedSchemeColor,
      toggleButtonsBorderSchemeColor:
          toggleButtonsBorderSchemeColor ?? this.toggleButtonsBorderSchemeColor,
      toggleButtonsBorderWidth:
          toggleButtonsBorderWidth ?? this.toggleButtonsBorderWidth,
      //
      segmentedButtonRadius:
          segmentedButtonRadius ?? this.segmentedButtonRadius,
      segmentedButtonSchemeColor:
          segmentedButtonSchemeColor ?? this.segmentedButtonSchemeColor,
      segmentedButtonUnselectedSchemeColor:
          segmentedButtonUnselectedSchemeColor ??
              this.segmentedButtonUnselectedSchemeColor,
      segmentedButtonUnselectedForegroundSchemeColor:
          segmentedButtonUnselectedForegroundSchemeColor ??
              this.segmentedButtonUnselectedForegroundSchemeColor,
      segmentedButtonBorderSchemeColor: segmentedButtonBorderSchemeColor ??
          this.segmentedButtonBorderSchemeColor,
      segmentedButtonBorderWidth:
          segmentedButtonBorderWidth ?? this.segmentedButtonBorderWidth,
      //
      materialButtonSchemeColor:
          materialButtonSchemeColor ?? this.materialButtonSchemeColor,
      //
      switchSchemeColor: switchSchemeColor ?? this.switchSchemeColor,
      switchThumbSchemeColor:
          switchThumbSchemeColor ?? this.switchThumbSchemeColor,
      checkboxSchemeColor: checkboxSchemeColor ?? this.checkboxSchemeColor,
      radioSchemeColor: radioSchemeColor ?? this.radioSchemeColor,
      unselectedToggleIsColored:
          unselectedToggleIsColored ?? this.unselectedToggleIsColored,
      //
      sliderBaseSchemeColor:
          sliderBaseSchemeColor ?? this.sliderBaseSchemeColor,
      sliderIndicatorSchemeColor:
          sliderIndicatorSchemeColor ?? this.sliderIndicatorSchemeColor,
      sliderValueTinted: sliderValueTinted ?? this.sliderValueTinted,
      sliderValueIndicatorType:
          sliderValueIndicatorType ?? this.sliderValueIndicatorType,
      sliderShowValueIndicator:
          sliderShowValueIndicator ?? this.sliderShowValueIndicator,
      sliderTrackHeight: sliderTrackHeight ?? this.sliderTrackHeight,
      //
      inputDecoratorRadius: inputDecoratorRadius ?? this.inputDecoratorRadius,
      inputDecoratorSchemeColor:
          inputDecoratorSchemeColor ?? this.inputDecoratorSchemeColor,
      inputDecoratorIsFilled:
          inputDecoratorIsFilled ?? this.inputDecoratorIsFilled,
      inputDecoratorFillColor:
          inputDecoratorFillColor ?? this.inputDecoratorFillColor,
      inputDecoratorBackgroundAlpha:
          inputDecoratorBackgroundAlpha ?? this.inputDecoratorBackgroundAlpha,
      inputDecoratorBorderSchemeColor: inputDecoratorBorderSchemeColor ??
          this.inputDecoratorBorderSchemeColor,
      inputDecoratorBorderType:
          inputDecoratorBorderType ?? this.inputDecoratorBorderType,
      inputDecoratorFocusedHasBorder:
          inputDecoratorFocusedHasBorder ?? this.inputDecoratorFocusedHasBorder,
      inputDecoratorUnfocusedHasBorder: inputDecoratorUnfocusedHasBorder ??
          this.inputDecoratorUnfocusedHasBorder,
      inputDecoratorUnfocusedBorderIsColored:
          inputDecoratorUnfocusedBorderIsColored ??
              this.inputDecoratorUnfocusedBorderIsColored,
      inputDecoratorBorderWidth:
          inputDecoratorBorderWidth ?? this.inputDecoratorBorderWidth,
      inputDecoratorFocusedBorderWidth: inputDecoratorFocusedBorderWidth ??
          this.inputDecoratorFocusedBorderWidth,
      inputDecoratorPrefixIconSchemeColor:
          inputDecoratorPrefixIconSchemeColor ??
              this.inputDecoratorPrefixIconSchemeColor,
      //
      fabRadius: fabRadius ?? this.fabRadius,
      fabUseShape: fabUseShape ?? this.fabUseShape,
      fabAlwaysCircular: fabAlwaysCircular ?? this.fabAlwaysCircular,
      fabSchemeColor: fabSchemeColor ?? this.fabSchemeColor,
      //
      chipRadius: chipRadius ?? this.chipRadius,
      chipSchemeColor: chipSchemeColor ?? this.chipSchemeColor,
      chipSelectedSchemeColor:
          chipSelectedSchemeColor ?? this.chipSelectedSchemeColor,
      chipDeleteIconSchemeColor:
          chipDeleteIconSchemeColor ?? this.chipDeleteIconSchemeColor,
      //
      cardRadius: cardRadius ?? this.cardRadius,
      cardElevation: cardElevation ?? this.cardElevation,
      //
      dialogRadius: dialogRadius ?? this.dialogRadius,
      dialogElevation: dialogElevation ?? this.dialogElevation,
      dialogBackgroundSchemeColor:
          dialogBackgroundSchemeColor ?? this.dialogBackgroundSchemeColor,
      timePickerDialogRadius:
          timePickerDialogRadius ?? this.timePickerDialogRadius,
      timePickerElementRadius:
          timePickerElementRadius ?? this.timePickerElementRadius,
      //
      popupMenuRadius: popupMenuRadius ?? this.popupMenuRadius,
      popupMenuElevation: popupMenuElevation ?? this.popupMenuElevation,
      popupMenuSchemeColor: popupMenuSchemeColor ?? this.popupMenuSchemeColor,
      popupMenuOpacity: popupMenuOpacity ?? this.popupMenuOpacity,
      //
      menuBarRadius: menuBarRadius ?? this.menuBarRadius,
      menuBarElevation: menuBarElevation ?? this.menuBarElevation,
      menuBarShadowColor: menuBarShadowColor ?? this.menuBarShadowColor,
      //
      tooltipRadius: tooltipRadius ?? this.tooltipRadius,
      tooltipWaitDuration: tooltipWaitDuration ?? this.tooltipWaitDuration,
      tooltipShowDuration: tooltipShowDuration ?? this.tooltipShowDuration,
      tooltipSchemeColor: tooltipSchemeColor ?? this.tooltipSchemeColor,
      tooltipOpacity: tooltipOpacity ?? this.tooltipOpacity,
      //
      snackBarElevation: snackBarElevation ?? this.snackBarElevation,
      snackBarBackgroundSchemeColor:
          snackBarBackgroundSchemeColor ?? this.snackBarBackgroundSchemeColor,
      snackBarActionSchemeColor:
          snackBarActionSchemeColor ?? this.snackBarActionSchemeColor,
      //
      appBarBackgroundSchemeColor:
          appBarBackgroundSchemeColor ?? this.appBarBackgroundSchemeColor,
      appBarCenterTitle: appBarCenterTitle ?? this.appBarCenterTitle,
      appBarScrolledUnderElevation:
          appBarScrolledUnderElevation ?? this.appBarScrolledUnderElevation,
      //
      bottomAppBarSchemeColor:
          bottomAppBarSchemeColor ?? this.bottomAppBarSchemeColor,
      //
      tabBarItemSchemeColor:
          tabBarItemSchemeColor ?? this.tabBarItemSchemeColor,
      tabBarIndicatorSchemeColor:
          tabBarIndicatorSchemeColor ?? this.tabBarIndicatorSchemeColor,
      //
      drawerRadius: drawerRadius ?? this.drawerRadius,
      drawerElevation: drawerElevation ?? this.drawerElevation,
      drawerBackgroundSchemeColor:
          drawerBackgroundSchemeColor ?? this.drawerBackgroundSchemeColor,
      drawerWidth: drawerWidth ?? this.drawerWidth,
      drawerIndicatorWidth: drawerIndicatorWidth ?? this.drawerIndicatorWidth,
      drawerIndicatorRadius:
          drawerIndicatorRadius ?? this.drawerIndicatorRadius,
      drawerIndicatorSchemeColor:
          drawerIndicatorSchemeColor ?? this.drawerIndicatorSchemeColor,
      drawerIndicatorOpacity:
          drawerIndicatorOpacity ?? this.drawerIndicatorOpacity,
      //
      bottomSheetBackgroundColor:
          bottomSheetBackgroundColor ?? this.bottomSheetBackgroundColor,
      bottomSheetModalBackgroundColor: bottomSheetModalBackgroundColor ??
          this.bottomSheetModalBackgroundColor,
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
      navigationBarIndicatorSchemeColor: navigationBarIndicatorSchemeColor ??
          this.navigationBarIndicatorSchemeColor,
      navigationBarIndicatorOpacity:
          navigationBarIndicatorOpacity ?? this.navigationBarIndicatorOpacity,
      navigationBarIndicatorRadius:
          navigationBarIndicatorRadius ?? this.navigationBarIndicatorRadius,
      navigationBarBackgroundSchemeColor: navigationBarBackgroundSchemeColor ??
          this.navigationBarBackgroundSchemeColor,
      navigationBarOpacity: navigationBarOpacity ?? this.navigationBarOpacity,
      navigationBarElevation:
          navigationBarElevation ?? this.navigationBarElevation,
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
      navigationRailIndicatorOpacity:
          navigationRailIndicatorOpacity ?? this.navigationRailIndicatorOpacity,
      navigationRailIndicatorRadius:
          navigationRailIndicatorRadius ?? this.navigationRailIndicatorRadius,
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
        other.tintedDisabledControls == tintedDisabledControls &&
        other.blendOnLevel == blendOnLevel &&
        other.blendOnColors == blendOnColors &&
        other.useFlutterDefaults == useFlutterDefaults &&
        //
        other.blendTextTheme == blendTextTheme &&
        other.elevationTint == elevationTint &&
        other.elevationShadow == elevationShadow &&
        //
        other.useTextTheme == useTextTheme &&
        other.useM2StyleDividerInM3 == useM2StyleDividerInM3 &&
        //
        other.defaultRadius == defaultRadius &&
        other.buttonMinSize == buttonMinSize &&
        other.buttonPadding == buttonPadding &&
        //
        other.thickBorderWidth == thickBorderWidth &&
        other.thinBorderWidth == thinBorderWidth &&
        //
        other.textButtonRadius == textButtonRadius &&
        other.textButtonSchemeColor == textButtonSchemeColor &&
        other.textButtonTextStyle == textButtonTextStyle &&
        //
        other.filledButtonRadius == filledButtonRadius &&
        other.filledButtonSchemeColor == filledButtonSchemeColor &&
        other.filledButtonTextStyle == filledButtonTextStyle &&
        //
        // TODO(rydmike): Hold https://github.com/flutter/flutter/issues/115827
        // other.filledButtonTonalRadius == filledButtonTonalRadius &&
        // other.filledButtonTonalSchemeColor == filledButtonTonalSchemeColor &&
        // other.filledButtonTonalTextStyle == filledButtonTonalTextStyle &&
        //
        other.elevatedButtonRadius == elevatedButtonRadius &&
        other.elevatedButtonElevation == elevatedButtonElevation &&
        other.elevatedButtonSchemeColor == elevatedButtonSchemeColor &&
        other.elevatedButtonSecondarySchemeColor ==
            elevatedButtonSecondarySchemeColor &&
        other.elevatedButtonTextStyle == elevatedButtonTextStyle &&
        //
        other.outlinedButtonRadius == outlinedButtonRadius &&
        other.outlinedButtonSchemeColor == outlinedButtonSchemeColor &&
        other.outlinedButtonOutlineSchemeColor ==
            outlinedButtonOutlineSchemeColor &&
        other.outlinedButtonBorderWidth == outlinedButtonBorderWidth &&
        other.outlinedButtonPressedBorderWidth ==
            outlinedButtonPressedBorderWidth &&
        other.outlinedButtonTextStyle == outlinedButtonTextStyle &&
        //
        other.toggleButtonsRadius == toggleButtonsRadius &&
        other.toggleButtonsSchemeColor == toggleButtonsSchemeColor &&
        other.toggleButtonsUnselectedSchemeColor ==
            toggleButtonsUnselectedSchemeColor &&
        other.toggleButtonsBorderSchemeColor ==
            toggleButtonsBorderSchemeColor &&
        other.toggleButtonsBorderWidth == toggleButtonsBorderWidth &&
        //
        other.segmentedButtonRadius == segmentedButtonRadius &&
        other.segmentedButtonSchemeColor == segmentedButtonSchemeColor &&
        other.segmentedButtonUnselectedSchemeColor ==
            segmentedButtonUnselectedSchemeColor &&
        other.segmentedButtonUnselectedForegroundSchemeColor ==
            segmentedButtonUnselectedForegroundSchemeColor &&
        other.segmentedButtonBorderSchemeColor ==
            segmentedButtonBorderSchemeColor &&
        other.segmentedButtonBorderWidth == segmentedButtonBorderWidth &&
        //
        other.materialButtonSchemeColor == materialButtonSchemeColor &&
        //
        other.switchSchemeColor == switchSchemeColor &&
        other.switchThumbSchemeColor == switchThumbSchemeColor &&
        other.checkboxSchemeColor == checkboxSchemeColor &&
        other.radioSchemeColor == radioSchemeColor &&
        other.unselectedToggleIsColored == unselectedToggleIsColored &&
        //
        other.sliderBaseSchemeColor == sliderBaseSchemeColor &&
        other.sliderIndicatorSchemeColor == sliderIndicatorSchemeColor &&
        other.sliderValueTinted == sliderValueTinted &&
        other.sliderValueIndicatorType == sliderValueIndicatorType &&
        other.sliderShowValueIndicator == sliderShowValueIndicator &&
        other.sliderTrackHeight == sliderTrackHeight &&
        //
        other.inputDecoratorRadius == inputDecoratorRadius &&
        other.inputDecoratorSchemeColor == inputDecoratorSchemeColor &&
        other.inputDecoratorIsFilled == inputDecoratorIsFilled &&
        other.inputDecoratorFillColor == inputDecoratorFillColor &&
        other.inputDecoratorBackgroundAlpha == inputDecoratorBackgroundAlpha &&
        other.inputDecoratorBorderSchemeColor ==
            inputDecoratorBorderSchemeColor &&
        other.inputDecoratorBorderType == inputDecoratorBorderType &&
        other.inputDecoratorFocusedHasBorder ==
            inputDecoratorFocusedHasBorder &&
        other.inputDecoratorUnfocusedHasBorder ==
            inputDecoratorUnfocusedHasBorder &&
        other.inputDecoratorUnfocusedBorderIsColored ==
            inputDecoratorUnfocusedBorderIsColored &&
        other.inputDecoratorBorderWidth == inputDecoratorBorderWidth &&
        other.inputDecoratorFocusedBorderWidth ==
            inputDecoratorFocusedBorderWidth &&
        other.inputDecoratorPrefixIconSchemeColor ==
            inputDecoratorPrefixIconSchemeColor &&
        //
        other.fabRadius == fabRadius &&
        other.fabUseShape == fabUseShape &&
        other.fabAlwaysCircular == fabAlwaysCircular &&
        other.fabSchemeColor == fabSchemeColor &&
        //
        other.chipRadius == chipRadius &&
        other.chipSchemeColor == chipSchemeColor &&
        other.chipSelectedSchemeColor == chipSelectedSchemeColor &&
        other.chipDeleteIconSchemeColor == chipDeleteIconSchemeColor &&
        //
        other.cardRadius == cardRadius &&
        other.cardElevation == cardElevation &&
        //
        other.popupMenuRadius == popupMenuRadius &&
        other.popupMenuElevation == popupMenuElevation &&
        other.popupMenuSchemeColor == popupMenuSchemeColor &&
        other.popupMenuOpacity == popupMenuOpacity &&
        //
        other.menuBarRadius == menuBarRadius &&
        other.menuBarElevation == menuBarElevation &&
        other.menuBarShadowColor == menuBarShadowColor &&
        //
        other.tooltipRadius == tooltipRadius &&
        other.tooltipWaitDuration == tooltipWaitDuration &&
        other.tooltipShowDuration == tooltipShowDuration &&
        other.tooltipSchemeColor == tooltipSchemeColor &&
        other.tooltipOpacity == tooltipOpacity &&
        //
        other.dialogRadius == dialogRadius &&
        other.dialogElevation == dialogElevation &&
        other.dialogBackgroundSchemeColor == dialogBackgroundSchemeColor &&
        other.timePickerDialogRadius == timePickerDialogRadius &&
        other.timePickerElementRadius == timePickerElementRadius &&
        //
        other.snackBarElevation == snackBarElevation &&
        other.snackBarBackgroundSchemeColor == snackBarBackgroundSchemeColor &&
        other.snackBarActionSchemeColor == snackBarActionSchemeColor &&
        //
        other.appBarBackgroundSchemeColor == appBarBackgroundSchemeColor &&
        other.appBarCenterTitle == appBarCenterTitle &&
        other.appBarScrolledUnderElevation == appBarScrolledUnderElevation &&
        //
        other.bottomAppBarSchemeColor == bottomAppBarSchemeColor &&
        //
        other.tabBarItemSchemeColor == tabBarItemSchemeColor &&
        other.tabBarIndicatorSchemeColor == tabBarIndicatorSchemeColor &&
        //
        other.drawerRadius == drawerRadius &&
        other.drawerElevation == drawerElevation &&
        other.drawerBackgroundSchemeColor == drawerBackgroundSchemeColor &&
        other.drawerWidth == drawerWidth &&
        other.drawerIndicatorWidth == drawerIndicatorWidth &&
        other.drawerIndicatorRadius == drawerIndicatorRadius &&
        other.drawerIndicatorSchemeColor == drawerIndicatorSchemeColor &&
        other.drawerIndicatorOpacity == drawerIndicatorOpacity &&
        //
        other.bottomSheetBackgroundColor == bottomSheetBackgroundColor &&
        other.bottomSheetModalBackgroundColor ==
            bottomSheetModalBackgroundColor &&
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
        other.navigationBarIndicatorSchemeColor ==
            navigationBarIndicatorSchemeColor &&
        other.navigationBarIndicatorOpacity == navigationBarIndicatorOpacity &&
        other.navigationBarIndicatorRadius == navigationBarIndicatorRadius &&
        other.navigationBarBackgroundSchemeColor ==
            navigationBarBackgroundSchemeColor &&
        other.navigationBarOpacity == navigationBarOpacity &&
        other.navigationBarElevation == navigationBarElevation &&
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
        other.navigationRailIndicatorOpacity ==
            navigationRailIndicatorOpacity &&
        other.navigationRailIndicatorRadius == navigationRailIndicatorRadius &&
        other.navigationRailBackgroundSchemeColor ==
            navigationRailBackgroundSchemeColor &&
        other.navigationRailOpacity == navigationRailOpacity &&
        other.navigationRailElevation == navigationRailElevation &&
        other.navigationRailLabelType == navigationRailLabelType &&
        other.navigationRailGroupAlignment == navigationRailGroupAlignment;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hashAll(<Object?>[
        interactionEffects,
        tintedDisabledControls,
        blendOnLevel,
        blendOnColors,
        useFlutterDefaults,
        //
        elevationTint,
        elevationShadow,
        //
        blendTextTheme,
        useTextTheme,
        useM2StyleDividerInM3,
        //
        defaultRadius,
        buttonMinSize,
        buttonPadding,
        //
        thickBorderWidth,
        thinBorderWidth,
        //
        textButtonRadius,
        textButtonSchemeColor,
        textButtonTextStyle,
        //
        filledButtonRadius,
        filledButtonSchemeColor,
        filledButtonTextStyle,
        //
        // TODO(rydmike): Hold https://github.com/flutter/flutter/issues/115827
        // filledButtonTonalRadius,
        // filledButtonTonalSchemeColor,
        // filledButtonTonalTextStyle,
        //
        elevatedButtonRadius,
        elevatedButtonElevation,
        elevatedButtonSchemeColor,
        elevatedButtonSecondarySchemeColor,
        elevatedButtonTextStyle,
        //
        outlinedButtonRadius,
        outlinedButtonSchemeColor,
        outlinedButtonOutlineSchemeColor,
        outlinedButtonBorderWidth,
        outlinedButtonPressedBorderWidth,
        outlinedButtonTextStyle,
        //
        toggleButtonsRadius,
        toggleButtonsSchemeColor,
        toggleButtonsUnselectedSchemeColor,
        toggleButtonsBorderSchemeColor,
        toggleButtonsBorderWidth,
        //
        segmentedButtonRadius,
        segmentedButtonSchemeColor,
        segmentedButtonUnselectedSchemeColor,
        segmentedButtonUnselectedForegroundSchemeColor,
        segmentedButtonBorderSchemeColor,
        segmentedButtonBorderWidth,
        //
        materialButtonSchemeColor,
        //
        switchSchemeColor,
        switchThumbSchemeColor,
        checkboxSchemeColor,
        radioSchemeColor,
        unselectedToggleIsColored,
        //
        sliderBaseSchemeColor,
        sliderIndicatorSchemeColor,
        sliderValueTinted,
        sliderValueIndicatorType,
        sliderShowValueIndicator,
        sliderTrackHeight,
        //
        inputDecoratorRadius,
        inputDecoratorSchemeColor,
        inputDecoratorIsFilled,
        inputDecoratorFillColor,
        inputDecoratorBackgroundAlpha,
        inputDecoratorBorderSchemeColor,
        inputDecoratorBorderType,
        inputDecoratorFocusedHasBorder,
        inputDecoratorUnfocusedHasBorder,
        inputDecoratorUnfocusedBorderIsColored,
        inputDecoratorBorderWidth,
        inputDecoratorFocusedBorderWidth,
        inputDecoratorPrefixIconSchemeColor,
        //
        fabRadius,
        fabUseShape,
        fabAlwaysCircular,
        fabSchemeColor,
        //
        chipRadius,
        chipSchemeColor,
        chipSelectedSchemeColor,
        chipDeleteIconSchemeColor,
        //
        cardRadius,
        cardElevation,
        //
        popupMenuRadius,
        popupMenuElevation,
        popupMenuSchemeColor,
        popupMenuOpacity,
        //
        menuBarRadius,
        menuBarElevation,
        menuBarShadowColor,
        //
        tooltipRadius,
        tooltipWaitDuration,
        tooltipShowDuration,
        tooltipSchemeColor,
        tooltipOpacity,
        //
        dialogRadius,
        dialogElevation,
        dialogBackgroundSchemeColor,
        timePickerDialogRadius,
        timePickerElementRadius,
        //
        snackBarElevation,
        snackBarBackgroundSchemeColor,
        snackBarActionSchemeColor,
        //
        appBarBackgroundSchemeColor,
        appBarCenterTitle,
        appBarScrolledUnderElevation,
        //
        bottomAppBarSchemeColor,
        //
        tabBarItemSchemeColor,
        tabBarIndicatorSchemeColor,
        //
        drawerRadius,
        drawerElevation,
        drawerBackgroundSchemeColor,
        drawerWidth,
        drawerIndicatorWidth,
        drawerIndicatorRadius,
        drawerIndicatorSchemeColor,
        drawerIndicatorOpacity,
        //
        bottomSheetBackgroundColor,
        bottomSheetModalBackgroundColor,
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
        navigationBarIndicatorSchemeColor,
        navigationBarIndicatorOpacity,
        navigationBarIndicatorRadius,
        navigationBarBackgroundSchemeColor,
        navigationBarOpacity,
        navigationBarElevation,
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
        navigationRailIndicatorOpacity,
        navigationRailIndicatorRadius,
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
    properties.add(DiagnosticsProperty<bool>(
        'tintedDisabledControls', tintedDisabledControls));
    properties.add(DiagnosticsProperty<int>('blendOnLevel ', blendOnLevel));
    properties.add(DiagnosticsProperty<bool>('blendOnColors', blendOnColors));
    properties.add(
        DiagnosticsProperty<bool>('useFlutterDefaults', useFlutterDefaults));
    //
    properties.add(EnumProperty<FlexTint>('useElevationTint', elevationTint));
    properties
        .add(EnumProperty<FlexShadow>('useElevationShadow', elevationShadow));
    //
    properties.add(DiagnosticsProperty<bool>('blendTextTheme', blendTextTheme));
    properties.add(DiagnosticsProperty<bool>('useTextTheme', useTextTheme));
    properties.add(DiagnosticsProperty<bool>(
        'useM2StyleDividerInM3', useM2StyleDividerInM3));
    //
    properties.add(DiagnosticsProperty<double>('defaultRadius', defaultRadius));
    properties.add(DiagnosticsProperty<Size>('buttonMinSize', buttonMinSize));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'buttonPadding', buttonPadding));
    properties
        .add(DiagnosticsProperty<double>('thickBorderWidth', thickBorderWidth));
    properties
        .add(DiagnosticsProperty<double>('thinBorderWidth', thinBorderWidth));
    //
    properties
        .add(DiagnosticsProperty<double>('textButtonRadius', textButtonRadius));
    properties.add(EnumProperty<SchemeColor>(
        'textButtonSchemeColor', textButtonSchemeColor));
    properties.add(DiagnosticsProperty<MaterialStateProperty<TextStyle?>>(
        'textButtonTextStyle', textButtonTextStyle));
    //
    properties.add(
        DiagnosticsProperty<double>('filledButtonRadius', filledButtonRadius));
    properties.add(EnumProperty<SchemeColor>(
        'filledButtonSchemeColor', filledButtonSchemeColor));
    properties.add(DiagnosticsProperty<MaterialStateProperty<TextStyle?>>(
        'filledButtonTextStyle', filledButtonTextStyle));
    //
    // TODO(rydmike): Hold for https://github.com/flutter/flutter/issues/115827
    // properties.add(DiagnosticsProperty<double>(
    //     'filledButtonTonalRadius', filledButtonTonalRadius));
    // properties.add(EnumProperty<SchemeColor>(
    //     'filledButtonTonalSchemeColor', filledButtonTonalSchemeColor));
    // properties.add(DiagnosticsProperty<MaterialStateProperty<TextStyle?>>(
    //     'filledButtonTonalTextStyle', filledButtonTonalTextStyle));
    //
    properties.add(DiagnosticsProperty<double>(
        'elevatedButtonRadius', elevatedButtonRadius));
    properties.add(DiagnosticsProperty<double>(
        'elevatedButtonElevation', elevatedButtonElevation));
    properties.add(EnumProperty<SchemeColor>(
        'elevatedButtonSchemeColor', elevatedButtonSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'elevatedButtonSecondarySchemeColor',
        elevatedButtonSecondarySchemeColor));
    properties.add(DiagnosticsProperty<MaterialStateProperty<TextStyle?>>(
        'elevatedButtonTextStyle', elevatedButtonTextStyle));
    //
    properties.add(DiagnosticsProperty<double>(
        'outlinedButtonRadius', outlinedButtonRadius));
    properties.add(EnumProperty<SchemeColor>(
        'outlinedButtonSchemeColor', outlinedButtonSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'outlinedButtonOutlineSchemeColor', outlinedButtonOutlineSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'outlinedButtonBorderWidth', outlinedButtonBorderWidth));
    properties.add(DiagnosticsProperty<double>(
        'outlinedButtonPressedBorderWidth', outlinedButtonPressedBorderWidth));
    properties.add(DiagnosticsProperty<MaterialStateProperty<TextStyle?>>(
        'outlinedButtonTextStyle', outlinedButtonTextStyle));
    //
    properties.add(DiagnosticsProperty<double>(
        'toggleButtonsRadius', toggleButtonsRadius));
    properties.add(EnumProperty<SchemeColor>(
        'toggleButtonsSchemeColor', toggleButtonsSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'toggleButtonsUnselectedSchemeColor',
        toggleButtonsUnselectedSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'toggleButtonsBorderSchemeColor', toggleButtonsBorderSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'toggleButtonsBorderWidth', toggleButtonsBorderWidth));
    //
    properties.add(DiagnosticsProperty<double>(
        'segmentedButtonRadius', segmentedButtonRadius));
    properties.add(EnumProperty<SchemeColor>(
        'segmentedButtonSchemeColor', segmentedButtonSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'segmentedButtonUnselectedSchemeColor',
        segmentedButtonUnselectedSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'segmentedButtonUnselectedForegroundSchemeColor',
        segmentedButtonUnselectedForegroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'segmentedButtonBorderSchemeColor', segmentedButtonBorderSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'segmentedButtonBorderWidth', segmentedButtonBorderWidth));
    //
    properties.add(EnumProperty<SchemeColor>(
        'materialButtonSchemeColor', materialButtonSchemeColor));
    //
    properties
        .add(EnumProperty<SchemeColor>('switchSchemeColor', switchSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'switchThumbSchemeColor', switchThumbSchemeColor));
    properties.add(
        EnumProperty<SchemeColor>('checkboxSchemeColor', checkboxSchemeColor));
    properties
        .add(EnumProperty<SchemeColor>('radioSchemeColor', radioSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'unselectedToggleIsColored', unselectedToggleIsColored));
    //
    properties.add(EnumProperty<SchemeColor>(
        'sliderBaseSchemeColor', sliderBaseSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'sliderIndicatorSchemeColor', sliderIndicatorSchemeColor));
    properties
        .add(DiagnosticsProperty<bool>('sliderValueTinted', sliderValueTinted));
    properties.add(EnumProperty<FlexSliderIndicatorType>(
        'sliderValueIndicatorType', sliderValueIndicatorType));
    properties.add(EnumProperty<ShowValueIndicator>(
        'sliderShowValueIndicator', sliderShowValueIndicator));
    properties.add(
        DiagnosticsProperty<double>('sliderTrackHeight', sliderTrackHeight));
    //
    properties.add(DiagnosticsProperty<double>(
        'inputDecoratorRadius', inputDecoratorRadius));
    properties.add(EnumProperty<SchemeColor>(
        'inputDecoratorSchemeColor', inputDecoratorSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorIsFilled', inputDecoratorIsFilled));
    properties
        .add(ColorProperty('inputDecoratorFillColor', inputDecoratorFillColor));
    properties.add(DiagnosticsProperty<int>(
        'inputDecoratorBackgroundAlpha', inputDecoratorBackgroundAlpha));
    properties.add(EnumProperty<SchemeColor>(
        'inputDecoratorBorderSchemeColor', inputDecoratorBorderSchemeColor));
    properties.add(EnumProperty<FlexInputBorderType>(
        'inputDecoratorBorderType', inputDecoratorBorderType));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorFocusedHasBorder', inputDecoratorFocusedHasBorder));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorUnfocusedHasBorder', inputDecoratorUnfocusedHasBorder));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorUnfocusedBorderIsColored',
        inputDecoratorUnfocusedBorderIsColored));
    properties.add(DiagnosticsProperty<double>(
        'inputDecoratorBorderWidth', inputDecoratorBorderWidth));
    properties.add(DiagnosticsProperty<double>(
        'inputDecoratorFocusedBorderWidth', inputDecoratorFocusedBorderWidth));
    properties.add(EnumProperty<SchemeColor>(
        'inputDecoratorPrefixIconSchemeColor',
        inputDecoratorPrefixIconSchemeColor));
    //
    properties.add(DiagnosticsProperty<double>('fabRadius', fabRadius));
    properties.add(DiagnosticsProperty<bool>('fabUseShape', fabUseShape));
    properties
        .add(DiagnosticsProperty<bool>('fabAlwaysCircular', fabAlwaysCircular));
    properties.add(EnumProperty<SchemeColor>('fabSchemeColor', fabSchemeColor));
    //
    properties.add(DiagnosticsProperty<double>('chipRadius', chipRadius));
    properties
        .add(EnumProperty<SchemeColor>('chipSchemeColor', chipSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'chipSelectedSchemeColor', chipSelectedSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'chipDeleteIconSchemeColor', chipDeleteIconSchemeColor));
    //
    properties.add(DiagnosticsProperty<double>('cardRadius', cardRadius));
    properties.add(DiagnosticsProperty<double>('cardElevation', cardElevation));
    //
    properties
        .add(DiagnosticsProperty<double>('popupMenuRadius', popupMenuRadius));
    properties.add(
        DiagnosticsProperty<double>('popupMenuElevation', popupMenuElevation));
    properties.add(EnumProperty<SchemeColor>(
        'popupMenuSchemeColor', popupMenuSchemeColor));
    properties
        .add(DiagnosticsProperty<double>('popupMenuOpacity', popupMenuOpacity));
    //
    properties.add(DiagnosticsProperty<double>('menuBarRadius', menuBarRadius));
    properties
        .add(DiagnosticsProperty<double>('menuBarElevation', menuBarElevation));
    properties.add(ColorProperty('menuBarShadowColor', menuBarShadowColor));
    //
    properties.add(DiagnosticsProperty<double>('tooltipRadius', tooltipRadius));
    properties.add(DiagnosticsProperty<Duration>(
        'tooltipWaitDuration', tooltipWaitDuration));
    properties.add(DiagnosticsProperty<Duration>(
        'tooltipShowDuration', tooltipShowDuration));
    properties.add(
        EnumProperty<SchemeColor>('tooltipSchemeColor', tooltipSchemeColor));
    properties
        .add(DiagnosticsProperty<double>('tooltipOpacity', tooltipOpacity));
    //
    properties.add(DiagnosticsProperty<double>('dialogRadius', dialogRadius));
    properties
        .add(DiagnosticsProperty<double>('dialogElevation', dialogElevation));
    properties.add(EnumProperty<SchemeColor>(
        'dialogBackgroundSchemeColor', dialogBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'timePickerDialogRadius', timePickerDialogRadius));
    properties.add(DiagnosticsProperty<double>(
        'timePickerElementRadius', timePickerElementRadius));
    //
    properties.add(
        DiagnosticsProperty<double>('snackBarElevation', snackBarElevation));
    properties.add(EnumProperty<SchemeColor>(
        'snackBarBackgroundSchemeColor', snackBarBackgroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'snackBarActionSchemeColor', snackBarActionSchemeColor));
    //
    properties.add(EnumProperty<SchemeColor>(
        'appBarBackgroundSchemeColor', appBarBackgroundSchemeColor));
    properties
        .add(DiagnosticsProperty<bool>('appBarCenterTitle', appBarCenterTitle));
    properties.add(DiagnosticsProperty<double>(
        'appBarScrolledUnderElevation', appBarScrolledUnderElevation));
    //
    properties.add(EnumProperty<SchemeColor>(
        'bottomAppBarSchemeColor', bottomAppBarSchemeColor));
    //
    properties.add(EnumProperty<SchemeColor>(
        'tabBarItemSchemeColor', tabBarItemSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'tabBarIndicatorSchemeColor', tabBarIndicatorSchemeColor));
    //
    properties.add(DiagnosticsProperty<double>('drawerRadius', drawerRadius));
    properties
        .add(DiagnosticsProperty<double>('drawerElevation', drawerElevation));
    properties.add(EnumProperty<SchemeColor>(
        'drawerBackgroundSchemeColor', drawerBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>('drawerWidth', drawerWidth));
    properties.add(DiagnosticsProperty<double>(
        'drawerIndicatorWidth', drawerIndicatorWidth));
    properties.add(DiagnosticsProperty<double>(
        'drawerIndicatorRadius', drawerIndicatorRadius));
    properties.add(EnumProperty<SchemeColor>(
        'drawerIndicatorSchemeColor', drawerIndicatorSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'drawerIndicatorOpacity', drawerIndicatorOpacity));
    //
    properties.add(EnumProperty<SchemeColor>(
        'bottomSheetBackgroundColor', bottomSheetBackgroundColor));
    properties.add(EnumProperty<SchemeColor>(
        'bottomSheetModalBackgroundColor', bottomSheetModalBackgroundColor));
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
        'navigationBarIndicatorSchemeColor',
        navigationBarIndicatorSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarIndicatorOpacity', navigationBarIndicatorOpacity));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarIndicatorRadius', navigationBarIndicatorRadius));
    properties.add(EnumProperty<SchemeColor>(
        'navigationBarBackgroundSchemeColor',
        navigationBarBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarOpacity', navigationBarOpacity));
    properties.add(DiagnosticsProperty<double>(
        'navigationBarElevation', navigationBarElevation));
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
    properties.add(DiagnosticsProperty<double>(
        'navigationRailIndicatorOpacity', navigationRailIndicatorOpacity));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailIndicatorRadius', navigationRailIndicatorRadius));
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
