import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_adaptive.dart';
import 'flex_color_scheme.dart';
import 'flex_constants.dart';
import 'flex_splash_type.dart';
import 'flex_sub_themes.dart';

// ignore_for_file: comment_references

/// Parameters used by [FlexColorScheme] to configure its used [FlexSubThemes].
///
/// To enable the optional component theming feature in FlexColorScheme, pass in
/// at least a default [FlexSubThemesData] to its [subThemesData] property.
/// This gives you the default opinionated component theming setup.
///
/// The list of properties in the flat configuration class is very large.
/// While it can be a bit tricky to maintain it, using it is easy and a
/// convenient way to adjust commonly used properties on UI component
/// widgets, by using a simple flat list of property values.
///
/// No need for deep [ShapeBorder] definitions for a simple border radius
/// change, nor for the complex [MaterialState] properties. Well, not as long
/// as the offered config options covers what you need.
///
/// A common use case for [FlexSubThemes] and [FlexSubThemesData] is
/// easy customization of default border radius on all Flutter SDK
/// Widgets and elements that supports border radius, typically via
/// [ShapeBorder] but also some via [BorderRadiusGeometry]. The global border
/// radius used by all widgets can be adjusted by giving [defaultRadius] the
/// desired radius.
///
/// The following widgets have rounded corners, but are excluded from the
/// global border radius impact:
///
/// * [Tooltip], generally so small that larger prominent rounding is
///   not a good fit.
/// * [Scrollbar], rounding on edges of scrollbars are left to platform default.
/// * The [AppBar] and [BottomAppBar] shape properties are left to defaults.
/// * The floating [SnackBar] can be themed to also include border radius, but
///   the none floating one should remain straight. This separation cannot
///   can be done via current flutter theming features. If you use Material 3
///   this may not be problem since an M3 app is not supposed to use the
///   fixed style [SnackBar], so if you only use the floating one, you can
///   modify its border radius. The M3 guide mentions it should never be
///   stadium shaped, so consider keeping the radius modest, e.g. 10 or lower.
/// * [PopupMenuButton], menus in general like [DropdownMenu] and [MenuAnchor],
///   can get a border radius, but not via global default. Values above 10 are
///   not a good idea, but up to 8 still works pretty well.
/// * The selected item indicators on [NavigationBar] and [NavigationRail] are
///   not impacted by global border radius setting, but can be modified via
///   own properties.
/// * The selected item indicator on [NavigationDrawer] is large and is thus
///   included in elements impacted by the global border radius setting.
/// * By default the very distinct [FloatingActionButton] is not impacted by the
///   global border radius, but there is flag that can be set to include it.
///
/// By design the shape border radius rounding on included and
/// supported sub-themes that use shapes, default to the border radius
/// defined by the Material 3 guide per widget,
/// [see Material 3 Design guide](https://m3.material.io). This is done also
/// in Material 2 mode. This can give your Material 2 app a more modern look
/// without using the Material 3 mode in Flutter [ThemeData]. If you
/// want the actual border radius used in Material 2 for a Material 2 using
/// application, set [defaultRadius] to 4 dp.
///
/// Additionally, the sub-theming offers a consistent button design on all
/// buttons, including [ToggleButtons] that is styled to match size of
/// [OutlinedButton] concerning the outline and the selected button color to
/// [ElevatedButton] color. Hover and Focus colors are also matched. It is also
/// size matched with the other buttons, and includes a theme implementation
/// that makes it implement [VisualDensity], which it does not do out of the box
/// in the SDK.
///
/// On most sub-themes the used default colors from the theme's colorScheme for
/// each component's color properties can be changed with an enum based
/// [SchemeColor] selection value.
///
/// If the options included in [FlexColorScheme] are not enough, you can always
/// modify any [FlexColorScheme] produced [ThemeData] object with
/// [ThemeData.copyWith] to add custom component sub-theme designs that
/// [FlexColorScheme] does not include or support directly.
///
/// It is not in-scope to provide every option possible via Flutter SDK
/// component sub-themes to be configurable via [FlexSubThemesData]. Only a
/// sub-set of commonly used properties are available as convenient sub-theme
/// settings via this flat and easy to use configuration class.
///
/// Feel free to suggest additional sub-theming features in the repo
/// https://github.com/rydmike/flex_color_scheme/issues as a new feature
/// proposal.
///
/// These are the current custom and opinionated component themes available in
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
/// * [DatePickerThemeData] for [DatePicker] via [FlexSubThemes.datePickerTheme]
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
/// * [IconButtonThemeData] for [IconButton] via
///   [FlexSubThemes.iconButtonTheme].
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
/// * [TextSelectionThemeData] for [TextField] via
///   [FlexSubThemes.textSelectionTheme].
/// * [TimePickerThemeData] for [TimePickerDialog] via
///   [FlexSubThemes.timePickerTheme].
/// * [ToggleButtonsThemeData] for [ToggleButtons] via
///   [FlexSubThemes.toggleButtonsTheme].
/// * [TooltipThemeData] for [Tooltip] via [FlexSubThemes.tooltipTheme].
///
/// [FlexColorScheme] uses the [FlexSubThemesData] class to configure the
/// opt-in sub-themes, based on the setup information provided via
/// [FlexColorScheme.subThemesData] by passing properties defined in it to
/// the above helpers that are then used to define the component sub-themes for
/// the produced [ThemeData].
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
    this.adaptiveRemoveElevationTint,
    this.adaptiveElevationShadowsBack,
    this.adaptiveAppBarScrollUnderOff,
    this.adaptiveRadius,
    //
    this.adaptiveSplash,
    this.splashType,
    this.splashTypeAdaptive,
    //
    this.blendTextTheme = false,
    this.useTextTheme,
    this.useM2StyleDividerInM3 = false,
    //
    this.defaultRadius,
    this.defaultRadiusAdaptive,
    //
    this.buttonMinSize,
    this.alignedDropdown,
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
    this.switchThumbFixedSize,
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
    this.inputCursorSchemeColor,
    this.inputSelectionSchemeColor,
    this.inputSelectionOpacity,
    this.inputSelectionHandleSchemeColor,
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
    this.dropdownMenuTextStyle,
    //
    this.menuRadius,
    this.menuElevation,
    this.menuSchemeColor,
    this.menuOpacity,
    this.menuPadding,
    //
    this.menuBarBackgroundSchemeColor,
    this.menuBarRadius,
    this.menuBarElevation,
    this.menuBarShadowColor,
    //
    this.menuItemBackgroundSchemeColor,
    this.menuItemForegroundSchemeColor,
    this.menuIndicatorBackgroundSchemeColor,
    this.menuIndicatorForegroundSchemeColor,
    this.menuIndicatorRadius,
    //
    this.tooltipRadius,
    this.tooltipWaitDuration,
    this.tooltipShowDuration,
    this.tooltipSchemeColor,
    this.tooltipOpacity,
    //
    this.adaptiveDialogRadius,
    this.dialogRadius,
    this.dialogRadiusAdaptive,
    this.dialogElevation,
    this.dialogBackgroundSchemeColor,
    this.useInputDecoratorThemeInDialogs,
    //
    this.datePickerHeaderBackgroundSchemeColor,
    this.datePickerDialogRadius,
    this.timePickerDialogRadius,
    this.timePickerElementRadius,
    //
    this.snackBarRadius,
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
    this.tabBarUnselectedItemSchemeColor,
    this.tabBarUnselectedItemOpacity,
    this.tabBarIndicatorSchemeColor,
    this.tabBarIndicatorSize,
    this.tabBarIndicatorWeight,
    this.tabBarIndicatorTopRadius,
    this.tabBarDividerColor,
    //
    this.drawerRadius,
    this.drawerElevation,
    this.drawerBackgroundSchemeColor,
    this.drawerWidth,
    this.drawerIndicatorRadius,
    this.drawerIndicatorWidth,
    this.drawerIndicatorSchemeColor,
    this.drawerIndicatorOpacity,
    this.drawerSelectedItemSchemeColor,
    this.drawerUnselectedItemSchemeColor,
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
    this.adaptiveRemoveNavigationBarTint,
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

  /// Flag used to enable color tinted hover, focus, highlight, selected,
  /// pressed and splash interaction state effects.
  ///
  /// The standard Flutter colors in both M2 and M3 mode for hover, focus,
  /// highlight, selected, pressed and splash state effects often look grey.
  /// They typically use surface or onSurface color with opacity. Often this is
  /// white or black with different opacity levels. This is not very
  /// color expressive and sometimes even look out of character in M3 mode.
  ///
  /// For some widgets and their colors, the default Flutter interaction effects
  /// in M3 mode work pretty well. However, when theming widgets with different
  /// colors than default M3 values, especially if the color is off a different
  /// brightness, the effects often break down and become to grey heavy or
  /// almost invisible.
  ///
  /// To get a color themed effect, set [interactionEffects] to true. The
  /// used tint color depends on the UI control's main themed color, or
  /// element color being used in a widget many colors. Not on surface or
  /// onSurface colors, that to their defence in M3 mode contain a slight tint
  /// of primary color.
  ///
  /// This design makes all the interaction effects work with the UI components
  /// color matching effects, regardless of how it is themed. It delivers more
  /// color expressiveness than Flutter's default M2 and M3 styles.
  ///
  /// This feature is implemented by always in all sub-themes' [MaterialState]
  /// overlay states using the helper functions:
  ///
  /// - [FlexSubThemes.tintedHovered],
  /// - [FlexSubThemes.tintedHighlight]
  /// - [FlexSubThemes.tintedSplash]
  /// - [FlexSubThemes.tintedPressed]
  /// - [FlexSubThemes.tintedFocused]
  //
  /// In combination with internal function [FlexSubThemes._tintAlphaFactor],
  /// to vary the strengths depending on light/dark theme mode and brightness
  /// of color on the tinted widget. The effect is also different for primarily
  /// surface colored widgets.
  ///
  /// This feature also sets [ThemeData.focusColor], [ThemeData.hoverColor],
  /// [ThemeData.highlightColor] and [ThemeData.splashColor] in same styles.
  /// However, these colors are used less and less by widgets, and no full
  /// Material 3 mode supporting widgets use them, starting from Flutter 3.7.
  /// These [ThemeData] colors might eventually be added back to the
  /// deprecation roadmap, see Material
  /// [ThemeData issue](https://github.com/flutter/flutter/issues/91772), but
  /// probably not very soon. Regardless, this feature in FlexColorScheme is
  /// well prepared for any such deprecations.
  ///
  /// Implementing this theming feature manually on all widgets, is very tedious
  /// and requires a large number of theming definitions on every used control.
  /// It is sometimes also quite complex and requires understanding of how
  /// overlay colors work and are used by widgets.
  ///
  /// Some widget's in Flutter still have gaps or bugs in their implementation
  /// of MaterialState and only works partially. Compromises had to be made in
  /// some cases. These cases will be improved when support for them in
  /// Flutter is corrected. The status of these issues and gaps are tracked
  /// in FlexColorScheme docs
  /// [known issues](https://docs.flexcolorscheme.com/known_issues) chapter.
  ///
  /// Set to false to opt-out and use Flutter's default interactions effects.
  //
  /// Defaults to true.
  final bool interactionEffects;

  /// Use color tint on disabled controls.
  ///
  /// Set to true to make disabled controls use a slight color tint of their own
  /// main enabled color on their disabled state. Enabling this feature makes
  /// the theme even more color expressive than Material-3 is by default.
  ///
  /// This setting impacts disabled state of all UI widgets that can be disabled
  /// and can be themed to have a different disable color than the widget
  /// default disabled color. Some widgets even have two different tinted colors
  /// for their disabled state. Starting from FlexColorScheme version 7 a
  /// consistent tinted style is used an all widgets when opting in on this
  /// feature.
  ///
  /// The feature is implemented by always in all sub-themes' [MaterialState]
  /// disabled states using the [FlexSubThemes.tintedDisable] function.
  /// Sometimes with a different alpha value than the default one, to deliver
  /// the two tones of tinted disabled colors.
  ///
  /// This feature also set [ThemeData.disabledColor] in same style, however
  /// this color is used by very few widgets in Material 3 mode starting in
  /// Flutter 3.7. The [ThemeData.disabledColor] might eventually be added
  /// back to the deprecation roadmap, see Material
  /// [ThemeData issue](https://github.com/flutter/flutter/issues/91772), but
  /// probably not very soon. Regardless, this feature in FlexColorScheme is
  /// well prepared for any such deprecation.
  ///
  /// Implementing this theming feature manually on all widgets, is tedious
  /// and requires a large number of theming definitions on every used control.
  ///
  /// Set to false to opt-out and use Flutter's default grey disabled controls.
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
  ///                    elev 3         elev 0            elev 3
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

  /// Controls adaptive elevation tint color usage in Material 3 theming.
  ///
  /// Material 3 introduces elevation tint on elevated surface. With the
  /// [adaptiveRemoveElevationTint] property you can define on which platforms
  /// elevation tint is used when using Material-3.
  ///
  /// See class [FlexAdaptive] on how to configure the platform adaptive
  /// behavior. You may for example like the [FlexAdaptive.iOSAndDesktop]
  /// for a configuration that only keeps elevation tint on Material 3 themes
  /// on Android and Fuchsia platforms, and when the app is run in a web
  /// browser on these platforms.
  ///
  /// The [adaptiveRemoveElevationTint] feature has no impact in M2 mode.
  /// It only impacts component themes in FCS where Flutter SDK also support
  /// elevation tints in its theme. Currently this applies to:
  ///
  /// - [BottomAppBar]
  /// - [BottomSheet]
  /// - [Card]
  /// - [Chip]
  /// - [Dialog]
  /// - [Drawer]
  /// - [DropDownMenu]
  /// - [MenuAnchor]
  /// - [MenuBar]
  /// - [NavigationDrawer]
  /// - [PopupMenuButton]
  ///
  /// Not supported in Flutter theming on:
  /// - [BottomNavigationBar], does not have elevation tint in M3 in
  ///   Flutter 3.7, since it is an M2 component it does not support it.
  /// - [NavigationRail], does not have elevation tint in Flutter 3.7, probably
  ///   should have when elevated. Default M3 design does not elevate it.
  ///
  /// If you want to totally remove elevation tint from all widgets and on all
  /// platforms when using Material 3, you can optionally set
  /// [FlexColorScheme.surfaceTint] color to [Colors.transparent]. This also
  /// works with vanilla [ThemeData.colorScheme] by setting its
  /// [ColorScheme.surfaceTint] to [Colors.transparent].
  ///
  /// If not defined, defaults to [FlexAdaptive.off].
  final FlexAdaptive? adaptiveRemoveElevationTint;

  /// Controls shadow usage on elevated surfaces in Material 3 theming.
  ///
  /// Material 3 removes elevation shadows on some elevated surfaces. With this
  /// property you can bring it back.
  ///
  /// See class [FlexAdaptive] on how to configure the platform adaptive
  /// behavior. You may for example like the [FlexAdaptive.iOSAndDesktop]
  /// for a configuration that only keeps elevation tint on Material 3 themes
  /// on Android and Fuchsia platforms, and when the app is run in a web
  /// browser on these platforms.
  ///
  /// The [adaptiveElevationShadowsBack] property has no impact in M2 mode. It
  /// only impacts component themes in FlexColorScheme where Flutter SDK also
  /// support adding elevation shadows back in M3 mode.
  /// Currently this applies to:
  ///
  /// - [AppBar]
  /// - [BottomAppBar]
  /// - [Dialog]
  /// - [Drawer]
  /// - [NavigationDrawer]
  /// - [NavigationBar]
  ///
  /// These components already have shadows in M3:
  ///
  /// - [BottomNavigationBar], has shadow in M3 and no tint, is an M2 style
  ///   only Widget.
  /// - [BottomSheet],
  /// - [Card]
  /// - [Chip]
  /// - [DropDownMenu]
  /// - [MenuAnchor]
  /// - [MenuBar], might be a mistake that the bar has shadow in M3 by default.
  ///   The menus from the bar should have shadow and do, but probably not the
  ///   menu bar itself. In designs in M3 web guide, the bar is not elevated.
  /// - [NavigationRail], has shadow in M3 if elevated, probably should not,
  ///   since this is a combined M2/M3 widget like most widgets are.
  ///   Also does not have elevation tint in Flutter 3.7, probably should have
  ///   when elevated. Default M3 design calls for it not being elevated, so
  ///   the spec does not offer any final word on it.
  /// - [PopupMenuButton], all menus have shadows in M3 design too.
  ///
  /// If not defined, defaults to [FlexAdaptive.off].
  final FlexAdaptive? adaptiveElevationShadowsBack;

  /// Controls if the [AppBar] scroll under elevation tint feature is used
  /// in Material 3 theming on the [AppBar].
  ///
  /// The [adaptiveRemoveElevationTint] will not remove elevation tint or the
  /// scroll under elevation tint from the [AppBar]. It is done via this
  /// separate property instead. You may want to use the visually quite useful
  /// scroll under elevation tint of the AppBar, having it as a separate
  /// property from the general [adaptiveRemoveElevationTint] allows you to
  /// do so.
  ///
  /// In Material 3, when you scroll content under an [AppBar], it changes color
  /// slightly to make it distinct from the background color it has by default
  /// in M3 design. It equals the background color of the Scaffold by default.
  ///
  /// Having a color equal on the [AppBar] as the background is a design style
  /// used for a long time on iOS. The tint when you scroll under is quite nice,
  /// but not a style commonly used on other platforms. With the
  /// [adaptiveAppBarScrollUnderOff] property you can remove the scroll under
  /// elevation tint effect on selected platforms. Recommend keeping it used
  /// though, it is quite useful and elegant.
  ///
  /// See class [FlexAdaptive] on how to configure the platform adaptive
  /// behavior. You may for example like the [FlexAdaptive.iOSAndDesktop]
  /// for a configuration that only keeps elevation tint on Material 3 themes
  /// on Android and Fuchsia platforms, and when the app is run in a web
  /// browser on these platforms.
  ///
  /// The [AppBar] still changes its elevation to [appBarScrolledUnderElevation]
  /// when you scroll things under it. However, with
  /// [adaptiveAppBarScrollUnderOff] there is no tint change as a result of it.
  ///
  /// If you use [adaptiveElevationShadowsBack] the shadows will change to the
  /// shadow level for used [appBarScrolledUnderElevation]. If you don't want
  /// any visible change in the shadows when you scroll under the [AppBar], you
  /// should set the [appBarScrolledUnderElevation] equal to the used elevation
  /// on the [AppBar], typically set via [FlexColorScheme.appBarElevation].
  ///
  /// If not defined, defaults to [FlexAdaptive.off].
  final FlexAdaptive? adaptiveAppBarScrollUnderOff;

  /// Controls if the [defaultRadiusAdaptive] is used instead of [defaultRadius]
  /// on configured platforms.
  ///
  /// With this feature you can have another configured default border radius on
  /// components with a [ShapeBorder] than what you defined in [defaultRadius]
  /// as default radius.
  ///
  /// If you keep [defaultRadius] undefined and define [defaultRadiusAdaptive],
  /// you can get the M3 by radius that varies by widget on platforms not
  /// included in your [adaptiveRadius] and use shared global
  /// [defaultRadiusAdaptive] on all widgets in the platforms included in the
  /// [adaptiveRadius] configuration.
  ///
  /// With this feature you can let components use their default very round
  /// border radius on Android, but set it e.g. to 10 dp on iOS and macOS, and
  /// why not desktop platforms as well.
  ///
  /// See class [FlexAdaptive] on how to configure the platform adaptive
  /// behavior. You may for example like the [FlexAdaptive.iOSAndDesktop]
  /// for a configuration that only keeps M3 default Material 3 radius
  /// on Android and Fuchsia platforms, and when the app is run in a web
  /// browser on these platforms, but uses the [defaultRadiusAdaptive] value
  /// on other platforms, like iOS, desktop and their web usage.
  ///
  /// If not defined, defaults to [FlexAdaptive.off].
  final FlexAdaptive? adaptiveRadius;

  /// Controls if the [splashTypeAdaptive] is used instead of [splashType]
  /// on configured platforms.
  ///
  /// With this feature you can have another configured ink splash type on
  /// selected adaptive platforms, than the value you defined for [splashType].
  ///
  /// See class [FlexAdaptive] on how to configure the platform adaptive
  /// behavior. You may for example like the [FlexAdaptive.iOSAndDesktop]
  /// for a configuration that only keeps M3 default Material 3 radius
  /// on Android and Fuchsia platforms, and when the app is run in a web
  /// browser on these platforms, but uses the [splashTypeAdaptive] value
  /// on other platforms, like iOS, desktop and their web usage.
  ///
  /// If not defined, defaults to [FlexAdaptive.off].
  final FlexAdaptive? adaptiveSplash;

  /// Controls the type of splash factory [ThemeData.splashFactory] will use.
  ///
  /// If not defined, defaults to the ThemeData factory default, which produces
  /// the same result as when [FlexSplashType.defaultSplash] is defined.
  final FlexSplashType? splashType;

  /// Controls the type splash factory [ThemeData.splashFactory] will
  /// use on platforms defined by [adaptiveSplash].
  ///
  /// If not defined, or the current platform does not match adaptive usage
  /// criteria defined by [adaptiveSplash], the used splash type is
  /// defined by [splashType].
  final FlexSplashType? splashTypeAdaptive;

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
  /// Defaults to false.
  ///
  /// **Style break info**: In FCS before version 7, the default was true, and
  /// blended text themes were used by default. Going forward if you want it,
  /// and also if you had not defined earlier and don't want to break your
  /// apps past style, set [blendTextTheme] to true.
  final bool blendTextTheme;

  /// Determines if Material-3 TextTheme and Typography is used.
  ///
  /// When opting in on using the sub-theming, this flag controls if the
  /// TextTheme will use the new Material-3 [Typography.material2021]
  /// as specified in the [Material-3 Design Guide](https://m3.material.io).
  ///
  /// If not defined, and [ThemeData.useMaterial3] is true, then it defaults
  /// to true. If not defined and [ThemeData.useMaterial3] is false, then it
  /// defaults to false.
  ///
  /// This toggle works as an override toggle for using
  /// [Typography.material2021] in Material-2 mode and for using
  /// [Typography.material2018] in Material-3 mode.
  ///
  /// When using [FlexColorScheme] and [ThemeData.useMaterial3] is false and
  /// sub themes are not used, then default typography is
  /// [Typography.material2018]. Note that if [FlexColorScheme] is
  /// not used at all, and your [ThemeData] has [ThemeData.useMaterial3] false,
  /// then Flutter defaults to using very old poor [Typography.material2014].
  /// In such cases consider defining your typography manually to
  /// [Typography.material2018] or why not even [Typography.material2021].
  ///
  /// FlexColorScheme fully supports using any custom TextTheme and fonts, just
  /// like ThemeData. You apply and use them just as you would with ThemeData.
  /// This text theme is just a custom predefined TextTheme.
  ///
  /// If you specify a custom [typography] to [FlexColorScheme] or
  /// [FlexThemeData], this property has no impact on used typography.
  ///
  /// This property was originally used in [FlexColorScheme] to opt-in on using
  /// a custom text theme defined internally by [FlexColorScheme] to look like
  /// the typography and text theme used in Material-3, before such a text theme
  /// and typography existed in Flutter. When Flutter started providing M3
  /// text theme and typography, this property was converted into toggle to opt
  /// in and out of using the text theme. Typically, you do not want to
  /// opt-out of it, but in M2 mode you may want to opt-in and set it to true.
  final bool? useTextTheme;

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
  /// * Indicator on [NavigationBar], but can be set via
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
  /// Defaults to null, M3 defaults are used per widget.
  ///
  /// When it is null, the sub-themes will use their null default behavior
  /// that follow the Material 3 standard for widgets it includes.
  ///
  /// When you set [defaultRadius] to a value, it will override the defaults
  /// with this global default. You can still set and lock each individual
  /// border radius back for individual widget sub-themes to some specific
  /// value, or set it back to its Material 3 standard.
  ///
  /// Flutter M2 SDK general border radius is 4, as defined by the
  /// Material 2 design guide. Material 3 uses much higher border radius, and
  /// it varies by UI component type. You can find the
  /// specifications [here](https://m3.material.io).
  final double? defaultRadius;

  /// The [defaultRadiusAdaptive] has the same definition and usage
  /// [defaultRadius], but is used as default radius on platforms as configured
  /// by [adaptiveRadius].
  ///
  /// If you keep [defaultRadius] null for M3 default, try setting
  /// [defaultRadiusAdaptive] to 10 dp and [adaptiveRadius] to
  /// [FlexAdaptive.iOSAndDesktop], for a more platform agnostic design on
  /// other platforms and Android and Fuchsia.
  ///
  /// Defaults to null, M3 defaults are used per widget.
  final double? defaultRadiusAdaptive;

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

  /// If true, then a [DropdownButton] and [DropdownButtonFormField] menu's
  /// width will match the button's width.
  ///
  /// If false (the default), then the dropdown's menu will be wider than
  /// its button. In either case the dropdown button will line up the leading
  /// edge of the menu's value with the leading edge of the values
  /// displayed by the menu items.
  ///
  /// This property only affects [DropdownButton] and its menu.
  ///
  /// If not defined default to false.
  final bool? alignedDropdown;

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
  /// This default is the same in both Material 2 and Material 3 theme mode.
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
  /// [kButtonRadius] 40dp in M2 and StadiumBorder in M3.
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
  /// [kButtonRadius] 40dp in M2 and StadiumBorder in M3.
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
  // /// [kButtonRadius] 40dp in M2 and StadiumBorder in M3.
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
  /// [kButtonRadius] 40dp in M2 and StadiumBorder in M3.
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
  /// [kButtonRadius] 40dp in M2 and StadiumBorder in M3.
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
  /// [kButtonRadius] 40dp.
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

  /// Set to true to keep the [Switch] thumb size fixed.
  ///
  /// When true the [Switch] thumb size does not change from small size when
  /// OFF, to a larger size when ON. This makes the Material-3 Switch even more
  /// similar to the iOS style Switch.
  ///
  /// This setting only applies to the Material-3 mode, it has no effect in
  /// Material-2 mode.
  ///
  /// If undefined, defaults to false.
  final bool? switchThumbFixedSize;

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

  /// The [SchemeColor] based color of the cursor in the text field.
  ///
  /// The cursor indicates the current location of text insertion point in
  /// the field.
  ///
  /// If not defined, defaults to [inputDecoratorSchemeColor] and if it is
  /// not defined [colorScheme.primary] is used.
  final SchemeColor? inputCursorSchemeColor;

  /// The [SchemeColor] based background color of selected text.
  ///
  /// If not defined, defaults to [inputDecoratorSchemeColor] and if it is
  /// not defined [colorScheme.primary] is used.
  final SchemeColor? inputSelectionSchemeColor;

  /// The opacity applied to [selectionSchemeColor].
  ///
  /// If not defined, defaults to [kTextSelectionLightOpacity] = 0.3 (30%) in
  /// light mode and to [kTextSelectionDarkOpacity] = 0.5 (50%) in dark mode.
  /// Flutter SDK defaults to 0.4 (40%) in both light and dark mode, so the
  /// FlexColorScheme defaults are slightly opinionated.
  final double? inputSelectionOpacity;

  /// The [SchemeColor] based color of the selection handles on the
  /// text field.
  ///
  /// Selection handles are used to indicate the bounds of the selected text,
  /// or as a handle to drag the cursor to a new location in the text.
  ///
  /// If not defined, defaults to [inputDecoratorSchemeColor] and if it is not
  /// defined or set to [SchemeColor.primary], then FlexColorScheme (FCS)
  /// sub-themes defaults to the opinionated selection of
  /// [ThemeData.primaryColorDark], which in FCS is always a darker tone of
  /// [colorScheme.primary]. Flutter SDK defaults to [colorScheme.primary], to
  /// get the same result, use [SchemeColor.primary].
  final SchemeColor? inputSelectionHandleSchemeColor;

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

  /// Border radius override value for the menu on [PopupMenuButton].
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
  /// If not defined and [defaultRadius] is undefined, defaults to 4dp based on
  /// widget default behavior, that is based on M3 Specification
  /// https://m3.material.io/components/menus/specs.
  final double? popupMenuRadius;

  /// Default elevation of [PopupMenuButton].
  ///
  /// If not defined, then if [useMaterial3] is:
  ///
  /// - false : defaults to [kPopupMenuM2Elevation] = 6 dp.
  /// - true  : defaults to [kPopupMenuM3Elevation] = 3 dp.
  final double? popupMenuElevation;

  /// The ColorScheme based color used as background color on [PopupMenuButton].
  ///
  /// If not defined, then if [useMaterial3] is:
  /// - false : defaults to theme.cardColor.
  /// - true  : defaults to theme.colorScheme.surface.
  /// Usually they are the same.
  final SchemeColor? popupMenuSchemeColor;

  /// Popup menu background opacity.
  ///
  /// Defaults to undefined (null). If undefined, produced result is same as 1,
  /// fully opaque.
  final double? popupMenuOpacity;

  /// The [TextStyle] of the text entry in a [DropDownMenu].
  ///
  /// If not defined, defaults to [TextTheme.bodyLarge] this size matches
  /// the default on the menu entries and in a normal [TextField].
  /// Flutter SDK defaults via widget default to [TextTheme.labelLarge]. This
  /// does not match the default of the entries or the [TextField] and looks
  /// bad. This styling issue is discussed in issue:
  /// https://github.com/flutter/flutter/issues/131350
  final TextStyle? dropdownMenuTextStyle;

  /// The border radius of [Menu] containers.
  ///
  /// When used by [FlexColorScheme] the border radius of menus follows
  /// the [defaultRadius] until and including 10 dp. After which it stays at
  /// 10 dp. If you need a higher border radius on menus than 10 dp,
  /// you will have to explicitly override it here. It will not look very
  /// good, the highlight inside the menu will start to overflow the corners and
  /// it is not clipped along the border radius. The underlying Widget is not
  /// designed with this high border rounding in mind, which makes sense since
  /// it does not look good with too much rounding on a typically small
  /// phone menu, that the widget was designed for originally.
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
  /// If not defined and [defaultRadius] is undefined, defaults to 4dp based on
  /// widget default behavior, that is based on M3 Specification
  /// https://m3.material.io/components/menus/specs.
  final double? menuRadius;

  /// The elevation of [Menu] containers.
  ///
  /// If not defined, defaults to 3 via Flutter SDK default.
  final double? menuElevation;

  /// The ColorScheme based color used as background color on [MenuBar],
  /// [MenuAnchor] and [DropDownMenu].
  ///
  /// If not defined, defaults to theme.colorScheme.surface.
  final SchemeColor? menuSchemeColor;

  /// Menu background opacity.
  ///
  /// Used by FlexColorScheme to modify the opacity the themed [MenuBar],
  /// [MenuAnchor] and [DropDownMenu] background color.
  ///
  /// Defaults to undefined (null).
  /// If undefined, produced result is same as 1, fully opaque.
  final double? menuOpacity;

  /// The padding between the menu's boundary and its child.
  ///
  /// Affect theme for menu container for [MenuAnchor], [MenuBar] menus and
  /// [DropdownMenu].
  ///
  /// If not defined, default to 0, no padding.
  final EdgeInsetsGeometry? menuPadding;

  /// Select which color from active [ColorScheme] to use as background color
  /// for the [MenuBar].
  ///
  /// If not defined, defaults to [menuSchemeColor].
  final SchemeColor? menuBarBackgroundSchemeColor;

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

  /// Select which color from active [ColorScheme] to use as
  /// [SubmenuButton]s and [MenuItemButton]s background color for
  /// unselected, not hovered, menu items.
  ///
  /// If not defined, defaults to [menuSchemeColor].
  final SchemeColor? menuItemBackgroundSchemeColor;

  /// Select which color from active [ColorScheme] to use as [SubmenuButton]s
  /// and [MenuItemButton]s foreground color.
  ///
  /// If not defined, defaults to the contrast pair for [SchemeColor]
  /// [menuItemBackgroundSchemeColor] via [FlexSubThemes.onSchemeColor].
  final SchemeColor? menuItemForegroundSchemeColor;

  /// Select which color from the active [ColorScheme] to use as
  /// the highlighted [SubmenuButton]s and [MenuItemButton]s indicator
  /// background color.
  ///
  /// If not defined, defaults to [backgroundSchemeColor] and the indicator
  /// only get overlay color for hover, focus and press states.
  ///
  /// The overlay style can be tinted using [interactionEffects].
  final SchemeColor? menuIndicatorBackgroundSchemeColor;

  /// Select which color from active [ColorScheme] use as
  /// the highlighted [SubmenuButton]s and [MenuItemButton]s indicator
  /// foreground color.
  ///
  /// If not defined, defaults to the contrast pair for
  /// [menuIndicatorBackgroundSchemeColor], via [FlexSubThemes.onSchemeColor].
  /// If [menuIndicatorBackgroundSchemeColor] is not defined the default result
  /// is same color as [menuItemForegroundSchemeColor].
  final SchemeColor? menuIndicatorForegroundSchemeColor;

  /// The themed corner border radius of [SubmenuButton]s and [MenuItemButton]s.
  ///
  /// If not defined, defaults to 0 via [SubmenuButton]s and [MenuItemButton]s
  /// default behavior.
  final double? menuIndicatorRadius;

  /// Border radius value for [Tooltips].
  ///
  /// If not defined and, defaults to [kTooltipRadius].
  final double? tooltipRadius;

  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// If not defined, defaults to 0ms via Flutter SDK default. Consider
  /// adding some wait time, instant tooltips are not seldom desired.
  final Duration? tooltipWaitDuration;

  /// The length of time that the tooltip will be shown once it has appeared.
  ///
  /// If not defined, defaults to Flutter SDK default 1500ms.
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

  /// Controls if the [dialogRadiusAdaptive] is used instead of [dialogRadius]
  /// on configured platforms.
  ///
  /// With this feature you can have another configured border radius on
  /// all dialogs with based on another [ShapeBorder] than the one you have
  /// defined in [dialogRadius].
  ///
  /// If you keep [dialogRadius] undefined and define [dialogRadiusAdaptive],
  /// you can get the M3 default radius on platforms not included in
  /// your [adaptiveDialogRadius] and use the [dialogRadiusAdaptive] radius on
  /// all dialogs in the platforms included in the [adaptiveDialogRadius]
  /// configuration.
  ///
  /// For example for iOS you may want to try 13dp as border radius on dialogs,
  /// which according to some WEB sources is an approximation used in HIG.
  /// Flutter uses 14dp on its iOS styled [CupertinoAlertDialog], you can try
  /// that as well.
  ///
  /// See class [FlexAdaptive] on how to configure the platform adaptive
  /// behavior. You may for example use the [FlexAdaptive.iOSAndDesktop]
  /// for a configuration that keeps used [dialogRadius] value on Android and
  /// Fuchsia platforms, and also when the app is run in a web browser on these
  /// platforms, but uses the [dialogRadiusAdaptive] value on other platforms,
  /// like iOS, desktop and their web usage.
  ///
  /// If not defined, defaults to [FlexAdaptive.off].
  final FlexAdaptive? adaptiveDialogRadius;

  /// Border radius value for [Dialog].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kDialogRadius] 28dp, based on M3 Specification
  /// https://m3.material.io/components/dialogs/specs
  final double? dialogRadius;

  /// The [defaultRadiusAdaptive] has the same definition and usage
  /// [dialogRadius], but is used as default radius on platforms as configured
  /// by [adaptiveRadius].
  ///
  /// If you keep [defaultRadius] null for M3 default, try setting
  /// [defaultRadiusAdaptive] to 10 dp and [adaptiveRadius] to
  /// [FlexAdaptive.iOSAndDesktop], for a more platform agnostic design on
  /// other platforms and Android and Fuchsia.
  ///
  /// Defaults to null, M3 defaults are used per widget.
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kDialogRadius] 28dp, based on M3 Specification
  /// https://m3.material.io/components/dialogs/specs
  final double? dialogRadiusAdaptive;

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

  /// Set to true to use the app overall app [InputDecoration] theme in
  /// dialogs themes.
  ///
  /// Currently only applies to [TimePickerThemeData], will later also be used
  /// by [DatePickerDialog] theme when it becomes supported.
  ///
  /// If not defined, defaults to false.
  final bool? useInputDecoratorThemeInDialogs;

  /// The background color of the header in a [DatePickerDialog].
  ///
  /// If not defined, default to [ColorScheme.primary] in M2 and to
  /// [ColorScheme.surface] in M3.
  ///
  /// The foreground color automatically defaults to the correct contrast pair
  /// for used [SchemeColor].
  final SchemeColor? datePickerHeaderBackgroundSchemeColor;

  /// Border radius value for [DatePickerDialog].
  ///
  /// Specifying this border radius value for the [DatePickerDialog] overrides
  /// the default shared via general [dialogRadius], and any platform adaptive
  /// border radius [dialogRadiusAdaptive] it might be specified to use.
  /// It also overrides getting impacted by border radius specified by
  /// [defaultRadius] or any adaptive version used via [defaultRadiusAdaptive].
  ///
  /// If not defined, defaults to [dialogRadius] or [dialogRadiusAdaptive]
  /// depending on [adaptiveDialogRadius] setting, if neither of them are
  /// defined, and global [defaultRadius] is undefined, which may also be
  /// platform dependent via [adaptiveRadius] to [defaultRadiusAdaptive], then
  /// the default value is [kDialogRadius] 28dp, based on M3 Specification
  /// https://m3.material.io/components/dialogs/specs
  final double? datePickerDialogRadius;

  /// Border radius value for [TimePickerDialog].
  ///
  /// Specifying this border radius value for the [TimePickerDialog] overrides
  /// the default shared via general [dialogRadius], and any platform adaptive
  /// border radius [dialogRadiusAdaptive] it might be specified to use.
  /// It also overrides getting impacted by border radius specified by
  /// [defaultRadius] or any adaptive version used via [defaultRadiusAdaptive].
  ///
  /// If not defined, defaults to [dialogRadius] or [dialogRadiusAdaptive]
  /// depending on [adaptiveDialogRadius] setting, if neither of them are
  /// defined, and global [defaultRadius] is undefined, which may also be
  /// platform dependent via [adaptiveRadius] to [defaultRadiusAdaptive], then
  /// the default value is [kDialogRadius] 28dp, based on M3 Specification
  /// https://m3.material.io/components/dialogs/specs
  final double? timePickerDialogRadius;

  /// Default border radius on time entry elements in [TimePickerDialog].
  ///
  /// Follows Material M3 guide.
  /// https://m3.material.io/components/time-pickers/specs. and defaults to
  /// [kTimeElementRadius] if not defined.
  final double? timePickerElementRadius;

  /// Corner radius of the [SnackBar].
  ///
  /// If not defined, defaults to 4 dp, but only when
  /// [SnackBar.behavior] style [SnackBarBehavior.floating] is used. This
  /// default is based on SDK widget default behavior and is  based on
  /// M3 Specification https://m3.material.io/components/snackbar/specs.
  ///
  /// NOTE: If this theme property is set both SnackBars with behavior
  /// fixed and floating will get the assigned radius. See issue:
  /// https://github.com/flutter/flutter/issues/108539.
  ///
  /// Due to this issue [snackBarRadius] does currently not follow the
  /// [defaultRadius], additionally [SnackBar] is an element that based
  /// on Material 2 and 3 design guide should avoid very rounded corners, in
  /// particular fully stadium rounded corners. Set rounding with modesty and
  /// be aware that it also affects the fixed style. If you use M3 mode, you
  /// should prefer to use the floating style as depicted in the M3 guide, so
  /// that the fixed style gets rounded is less critical then.
  /// The simplest solution is to just keep [snackBarRadius] at its default and
  /// get default behavior on it.
  final double? snackBarRadius;

  /// Elevation of [SnackBar].
  ///
  /// If undefined, defaults to [kSnackBarElevation] = 4.
  final double? snackBarElevation;

  /// Defines which [Theme] based [ColorScheme] based color the SnackBars
  /// use as their base color. Typically one of inverse brightness compared
  /// to theme's surface color brightness.
  ///
  /// If not defined, defaults to the opinionated color FlexColorScheme (FCS)
  /// choices below.
  ///
  /// * Default in light theme mode:
  ///   * FCS: onSurface with primary blend at 45% opacity, with
  ///     total opacity 95%
  ///   * Flutter SDK M2 uses: colorScheme.onSurface with opacity 80%,
  ///     alpha blended on top of colorScheme.surface.
  ///   * Flutter SDK M3 uses: colorScheme.inverseSurface.
  ///
  /// * In dark theme mode:
  ///   * FCS: onSurface with primary blend at 39% opacity, with total
  ///     opacity 93%
  ///   * Flutter SDK M2 uses: colorScheme.onSurface
  ///   * Flutter SDK M2 uses: colorScheme.inverseSurface
  ///
  /// In M3 design the default is [ColorScheme.inverseSurface],
  /// which you can assign by selecting that as its property here too.
  final SchemeColor? snackBarBackgroundSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the SnackBar actions
  /// use as their color.
  ///
  /// If null, defaults to [ColorScheme.inversePrimary].
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

  /// Defines which [Theme] based [ColorScheme] based color the [BottomAppBar]
  /// uses as background color.
  ///
  /// The [BottomAppBarTheme] has no properties for foreground color. If you use
  /// a background color that requires different contrast color than the
  /// active theme's surface colors, you will need to set their colors on
  /// widget level.
  final SchemeColor? bottomAppBarSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the [TabBar]
  /// items use.
  ///
  /// If not defined, then [TabBar] uses the enum [FlexTabBarStyle] property
  /// [tabBarStyle] in factories [FlexColorScheme.light] or
  /// [FlexColorScheme.dark] to determine the [TabBar] selected and
  /// unselected item color.
  ///
  /// The themed [TabBar] item color is typically defined by
  /// [FlexTabBarStyle] in [FlexColorScheme.light] or [FlexColorScheme.dark].
  ///
  /// This property is an override that offers more config options by
  /// allowing picking any color from the effective [ColorScheme], instead of
  /// just the options in the [FlexColorScheme.light] and [FlexColorScheme.dark]
  /// (tabBarStyle) factory parameter.
  final SchemeColor? tabBarItemSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the [TabBar]
  /// unselected items use.
  ///
  /// If not defined, but [tabBarItemSchemeColor] is defined, then in M2
  /// uses [tabBarItemSchemeColor] with [tabBarUnselectedItemOpacity] applied.
  /// In M3 mode uses [SchemeColor.onSurfaceVariant] with
  /// [tabBarUnselectedItemOpacity] applied.
  ///
  /// if not defined and [tabBarItemSchemeColor] is also not defined,
  /// then [TabBar] uses the enum [FlexTabBarStyle] property
  /// [tabBarStyle] in factories [FlexColorScheme.light] or
  /// [FlexColorScheme.dark] to determine the [TabBar] selected and
  /// unselected item color.
  ///
  /// The themed [TabBar] item color is typically defined by
  /// [FlexTabBarStyle] in [FlexColorScheme.light] or [FlexColorScheme.dark].
  ///
  /// This property is an override that offers more config options by
  /// allowing picking any color from the effective [ColorScheme], instead of
  /// just the options in the [FlexColorScheme.light] and [FlexColorScheme.dark]
  /// (tabBarStyle) factory parameter.
  final SchemeColor? tabBarUnselectedItemSchemeColor;

  /// Defines the opacity used on the [TabBar] unselected items.
  ///
  /// Only has any effect when the [tabBarItemSchemeColor] is defined, if
  /// it is not defined then we are using [FlexTabBarStyle] based styling
  /// set via factories [FlexColorScheme.light] or [FlexColorScheme.dark]
  /// directly and this property cannot impact its settings.
  /// First define a custom [tabBarItemSchemeColor] and optionally also
  /// [tabBarUnselectedItemSchemeColor] to be able to use opacity
  /// on the unselected TabBar item.
  ///
  /// If not defined, and M3 is used, defaults to 1 (100%), fully opaque. If
  /// M2 is used, defaults to 0.7 (70%) opacity.
  final double? tabBarUnselectedItemOpacity;

  /// Defines which [Theme] based [ColorScheme] based color the [TabBar]
  /// indicator uses.
  ///
  /// If not defined, it defaults to the same color as selected tab icon and
  /// text. The themed icon color and label color of tabs are typically defined
  /// by the [FlexColorScheme.tabBarStyle] property. This property is an
  /// override that offers more quick config options by allowing picking
  /// a color from the effective [ColorScheme].
  final SchemeColor? tabBarIndicatorSchemeColor;

  /// Defines how the selected tab indicator's size is computed.
  ///
  /// The size of the selected tab indicator is defined relative to the
  /// tab's overall bounds if [indicatorSize] is [TabBarIndicatorSize.tab]
  /// (the default) or relative to the bounds of the tab's widget if
  /// [indicatorSize] is [TabBarIndicatorSize.label].
  final TabBarIndicatorSize? tabBarIndicatorSize;

  /// The thickness of the underline border indicator on the [TabBar].
  ///
  /// If not defined, defaults to 2 in M2 and to 3 in M3.
  final double? tabBarIndicatorWeight;

  /// The top left and right corner radius of the underline border
  /// indicator on the [TabBar].
  ///
  /// If not defined, defaults to 0 in M2 and to 3 in M3.
  final double? tabBarIndicatorTopRadius;

  /// The color of the divider.
  ///
  /// If null and [ThemeData.useMaterial3] is true, [TabBarTheme.dividerColor]
  /// color is used. If that is null and [ThemeData.useMaterial3] is true,
  /// [ColorScheme.surfaceVariant] will be used, otherwise divider will
  /// not be drawn.
  final Color? tabBarDividerColor;

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

  /// Defines which [Theme] based [ColorScheme] based color [NavigationDrawer]
  /// uses as as its selected item color.
  ///
  /// If undefined, defaults to correct contrast color pair for
  /// [drawerIndicatorSchemeColor].
  final SchemeColor? drawerSelectedItemSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color [NavigationDrawer]
  /// uses as as its unselected item color.
  ///
  /// If undefined, defaults to correct contrast color pair for
  /// [drawerBackgroundSchemeColor].
  final SchemeColor? drawerUnselectedItemSchemeColor;

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
  /// If not defined, defaults to [kBottomNavigationBarElevation] = 3.
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
  /// If undefined, defaults to default Flutter SDK [NavigationBar] elevation
  /// in M3 mode which is 3 dp. In M2 mode it defaults
  /// [kBottomNavigationBarElevation] = 3.
  final double? navigationBarElevation;

  /// Specifies when each [NavigationDestination]'s label should appear.
  ///
  /// If undefined, default to [NavigationDestinationLabelBehavior.alwaysShow].
  final NavigationDestinationLabelBehavior? navigationBarLabelBehavior;

  /// Controls adaptive elevation tint color usage on the [NavigationBar].
  ///
  /// Material-3 introduces elevation tint on elevated surface. With the
  /// [adaptiveRemoveNavigationBarTint] property you can define on which
  /// platforms elevation tint is used on [NavigationBar] when using Material-3.
  ///
  /// See class [FlexAdaptive] on how to configure the platform adaptive
  /// behavior. You may for example like the [FlexAdaptive.iOSAndDesktop]
  /// for a configuration that only keeps elevation tint on Material 3 themes
  /// on Android and Fuchsia platforms, and when the app is run in a web
  /// browser on these platforms.
  ///
  /// The [adaptiveRemoveNavigationBarTint] feature has no impact in M2 mode.
  /// It only impacts component themes in FCS where Flutter SDK also support
  /// elevation tints in its theme. Currently this applies to:
  ///
  /// If you want to totally remove elevation tint from all widgets and on all
  /// platforms when using Material-3, you can optionally set
  /// [FlexColorScheme.surfaceTint] color to [Colors.transparent]. This also
  /// works with vanilla [ThemeData.colorScheme] by setting its
  /// [ColorScheme.surfaceTint] to [Colors.transparent].
  ///
  /// If not defined, defaults to [FlexAdaptive.off].
  final FlexAdaptive? adaptiveRemoveNavigationBarTint;

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
    final FlexAdaptive? adaptiveRemoveElevationTint,
    final FlexAdaptive? adaptiveElevationShadowsBack,
    final FlexAdaptive? adaptiveAppBarScrollUnderOff,
    final FlexAdaptive? adaptiveRadius,
    //
    final FlexAdaptive? adaptiveSplash,
    final FlexSplashType? splashType,
    final FlexSplashType? splashTypeAdaptive,
    //
    final bool? blendTextTheme,
    final bool? useTextTheme,
    final bool? useM2StyleDividerInM3,
    //
    final double? defaultRadius,
    final double? defaultRadiusAdaptive,
    final Size? buttonMinSize,
    final bool? alignedDropdown,
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
    final bool? switchThumbFixedSize,
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
    final SchemeColor? inputCursorSchemeColor,
    final SchemeColor? inputSelectionSchemeColor,
    final double? inputSelectionOpacity,
    final SchemeColor? inputSelectionHandleSchemeColor,
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
    final TextStyle? dropdownMenuTextStyle,
    //
    final double? menuRadius,
    final double? menuElevation,
    final SchemeColor? menuSchemeColor,
    final double? menuOpacity,
    final EdgeInsetsGeometry? menuPadding,
    //
    final SchemeColor? menuBarBackgroundSchemeColor,
    final double? menuBarRadius,
    final double? menuBarElevation,
    final Color? menuBarShadowColor,
    //
    final SchemeColor? menuItemBackgroundSchemeColor,
    final SchemeColor? menuItemForegroundSchemeColor,
    final SchemeColor? menuIndicatorBackgroundSchemeColor,
    final SchemeColor? menuIndicatorForegroundSchemeColor,
    final double? menuIndicatorRadius,
    //
    final double? tooltipRadius,
    final Duration? tooltipWaitDuration,
    final Duration? tooltipShowDuration,
    final SchemeColor? tooltipSchemeColor,
    final double? tooltipOpacity,
    //
    final FlexAdaptive? adaptiveDialogRadius,
    final double? dialogRadius,
    final double? dialogRadiusAdaptive,
    final double? dialogElevation,
    final SchemeColor? dialogBackgroundSchemeColor,
    final bool? useInputDecoratorThemeInDialogs,
    //
    final SchemeColor? datePickerHeaderBackgroundSchemeColor,
    final double? datePickerDialogRadius,
    final double? timePickerDialogRadius,
    final double? timePickerElementRadius,
    //
    final double? snackBarRadius,
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
    final SchemeColor? tabBarUnselectedItemSchemeColor,
    final double? tabBarUnselectedItemOpacity,
    final SchemeColor? tabBarIndicatorSchemeColor,
    final TabBarIndicatorSize? tabBarIndicatorSize,
    final double? tabBarIndicatorWeight,
    final double? tabBarIndicatorTopRadius,
    final Color? tabBarDividerColor,
    //
    final double? drawerRadius,
    final double? drawerElevation,
    final SchemeColor? drawerBackgroundSchemeColor,
    final double? drawerWidth,
    final double? drawerIndicatorWidth,
    final double? drawerIndicatorRadius,
    final SchemeColor? drawerIndicatorSchemeColor,
    final double? drawerIndicatorOpacity,
    final SchemeColor? drawerSelectedItemSchemeColor,
    final SchemeColor? drawerUnselectedItemSchemeColor,
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
    final FlexAdaptive? adaptiveRemoveNavigationBarTint,
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
      adaptiveRemoveElevationTint:
          adaptiveRemoveElevationTint ?? this.adaptiveRemoveElevationTint,
      adaptiveElevationShadowsBack:
          adaptiveElevationShadowsBack ?? this.adaptiveElevationShadowsBack,
      adaptiveAppBarScrollUnderOff:
          adaptiveAppBarScrollUnderOff ?? this.adaptiveAppBarScrollUnderOff,
      adaptiveRadius: adaptiveRadius ?? this.adaptiveRadius,
      //
      adaptiveSplash: adaptiveSplash ?? this.adaptiveSplash,
      splashType: splashType ?? this.splashType,
      splashTypeAdaptive: splashTypeAdaptive ?? this.splashTypeAdaptive,
      //
      blendTextTheme: blendTextTheme ?? this.blendTextTheme,
      useTextTheme: useTextTheme ?? this.useTextTheme,
      useM2StyleDividerInM3:
          useM2StyleDividerInM3 ?? this.useM2StyleDividerInM3,
      //
      defaultRadius: defaultRadius ?? this.defaultRadius,
      defaultRadiusAdaptive:
          defaultRadiusAdaptive ?? this.defaultRadiusAdaptive,
      buttonMinSize: buttonMinSize ?? this.buttonMinSize,
      alignedDropdown: alignedDropdown ?? this.alignedDropdown,
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
      switchThumbFixedSize: switchThumbFixedSize ?? this.switchThumbFixedSize,
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
      inputCursorSchemeColor:
          inputCursorSchemeColor ?? this.inputCursorSchemeColor,
      inputSelectionSchemeColor:
          inputSelectionSchemeColor ?? this.inputSelectionSchemeColor,
      inputSelectionOpacity:
          inputSelectionOpacity ?? this.inputSelectionOpacity,
      inputSelectionHandleSchemeColor: inputSelectionHandleSchemeColor ??
          this.inputSelectionHandleSchemeColor,
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
      adaptiveDialogRadius: adaptiveDialogRadius ?? this.adaptiveDialogRadius,
      dialogRadius: dialogRadius ?? this.dialogRadius,
      dialogRadiusAdaptive: dialogRadiusAdaptive ?? this.dialogRadiusAdaptive,
      dialogElevation: dialogElevation ?? this.dialogElevation,
      dialogBackgroundSchemeColor:
          dialogBackgroundSchemeColor ?? this.dialogBackgroundSchemeColor,
      useInputDecoratorThemeInDialogs: useInputDecoratorThemeInDialogs ??
          this.useInputDecoratorThemeInDialogs,
      datePickerHeaderBackgroundSchemeColor:
          datePickerHeaderBackgroundSchemeColor ??
              this.datePickerHeaderBackgroundSchemeColor,
      datePickerDialogRadius:
          datePickerDialogRadius ?? this.datePickerDialogRadius,
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
      dropdownMenuTextStyle:
          dropdownMenuTextStyle ?? this.dropdownMenuTextStyle,
      //
      menuRadius: menuRadius ?? this.menuRadius,
      menuElevation: menuElevation ?? this.menuElevation,
      menuSchemeColor: menuSchemeColor ?? this.menuSchemeColor,
      menuOpacity: menuOpacity ?? this.menuOpacity,
      menuPadding: menuPadding ?? this.menuPadding,
      //
      menuBarBackgroundSchemeColor:
          menuBarBackgroundSchemeColor ?? this.menuBarBackgroundSchemeColor,
      menuBarRadius: menuBarRadius ?? this.menuBarRadius,
      menuBarElevation: menuBarElevation ?? this.menuBarElevation,
      menuBarShadowColor: menuBarShadowColor ?? this.menuBarShadowColor,
      //
      menuItemBackgroundSchemeColor:
          menuItemBackgroundSchemeColor ?? this.menuItemBackgroundSchemeColor,
      menuItemForegroundSchemeColor:
          menuItemForegroundSchemeColor ?? this.menuItemForegroundSchemeColor,
      menuIndicatorBackgroundSchemeColor: menuIndicatorBackgroundSchemeColor ??
          this.menuIndicatorBackgroundSchemeColor,
      menuIndicatorForegroundSchemeColor: menuIndicatorForegroundSchemeColor ??
          this.menuIndicatorForegroundSchemeColor,
      menuIndicatorRadius: menuIndicatorRadius ?? this.menuIndicatorRadius,
      //
      tooltipRadius: tooltipRadius ?? this.tooltipRadius,
      tooltipWaitDuration: tooltipWaitDuration ?? this.tooltipWaitDuration,
      tooltipShowDuration: tooltipShowDuration ?? this.tooltipShowDuration,
      tooltipSchemeColor: tooltipSchemeColor ?? this.tooltipSchemeColor,
      tooltipOpacity: tooltipOpacity ?? this.tooltipOpacity,
      //
      snackBarRadius: snackBarRadius ?? this.snackBarRadius,
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
      tabBarUnselectedItemSchemeColor: tabBarUnselectedItemSchemeColor ??
          this.tabBarUnselectedItemSchemeColor,
      tabBarUnselectedItemOpacity:
          tabBarUnselectedItemOpacity ?? this.tabBarUnselectedItemOpacity,
      tabBarIndicatorSchemeColor:
          tabBarIndicatorSchemeColor ?? this.tabBarIndicatorSchemeColor,
      tabBarIndicatorSize: tabBarIndicatorSize ?? this.tabBarIndicatorSize,
      tabBarIndicatorWeight:
          tabBarIndicatorWeight ?? this.tabBarIndicatorWeight,
      tabBarIndicatorTopRadius:
          tabBarIndicatorTopRadius ?? this.tabBarIndicatorTopRadius,
      tabBarDividerColor: tabBarDividerColor ?? this.tabBarDividerColor,
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
      drawerSelectedItemSchemeColor:
          drawerSelectedItemSchemeColor ?? this.drawerSelectedItemSchemeColor,
      drawerUnselectedItemSchemeColor: drawerUnselectedItemSchemeColor ??
          this.drawerUnselectedItemSchemeColor,
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
      adaptiveRemoveNavigationBarTint: adaptiveRemoveNavigationBarTint ??
          this.adaptiveRemoveNavigationBarTint,
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
        other.adaptiveRemoveElevationTint == adaptiveRemoveElevationTint &&
        other.adaptiveElevationShadowsBack == adaptiveElevationShadowsBack &&
        other.adaptiveAppBarScrollUnderOff == adaptiveAppBarScrollUnderOff &&
        other.adaptiveRadius == adaptiveRadius &&
        //
        other.adaptiveSplash == adaptiveSplash &&
        other.splashType == splashType &&
        other.splashTypeAdaptive == splashTypeAdaptive &&
        //
        other.blendTextTheme == blendTextTheme &&
        other.useTextTheme == useTextTheme &&
        other.useM2StyleDividerInM3 == useM2StyleDividerInM3 &&
        //
        other.defaultRadius == defaultRadius &&
        other.defaultRadiusAdaptive == defaultRadiusAdaptive &&
        other.buttonMinSize == buttonMinSize &&
        other.alignedDropdown == alignedDropdown &&
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
        other.switchThumbFixedSize == switchThumbFixedSize &&
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
        other.inputCursorSchemeColor == inputCursorSchemeColor &&
        other.inputSelectionSchemeColor == inputSelectionSchemeColor &&
        other.inputSelectionOpacity == inputSelectionOpacity &&
        other.inputSelectionHandleSchemeColor ==
            inputSelectionHandleSchemeColor &&
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
        other.dropdownMenuTextStyle == dropdownMenuTextStyle &&
        //
        other.menuRadius == menuRadius &&
        other.menuElevation == menuElevation &&
        other.menuSchemeColor == menuSchemeColor &&
        other.menuOpacity == menuOpacity &&
        other.menuPadding == menuPadding &&
        //
        other.menuBarBackgroundSchemeColor == menuBarBackgroundSchemeColor &&
        other.menuBarRadius == menuBarRadius &&
        other.menuBarElevation == menuBarElevation &&
        other.menuBarShadowColor == menuBarShadowColor &&
        //
        other.menuItemBackgroundSchemeColor == menuItemBackgroundSchemeColor &&
        other.menuItemForegroundSchemeColor == menuItemForegroundSchemeColor &&
        other.menuIndicatorBackgroundSchemeColor ==
            menuIndicatorBackgroundSchemeColor &&
        other.menuIndicatorForegroundSchemeColor ==
            menuIndicatorForegroundSchemeColor &&
        other.menuIndicatorRadius == menuIndicatorRadius &&
        //
        other.tooltipRadius == tooltipRadius &&
        other.tooltipWaitDuration == tooltipWaitDuration &&
        other.tooltipShowDuration == tooltipShowDuration &&
        other.tooltipSchemeColor == tooltipSchemeColor &&
        other.tooltipOpacity == tooltipOpacity &&
        //
        other.adaptiveDialogRadius == adaptiveDialogRadius &&
        other.dialogRadius == dialogRadius &&
        other.dialogRadiusAdaptive == dialogRadiusAdaptive &&
        other.dialogElevation == dialogElevation &&
        other.dialogBackgroundSchemeColor == dialogBackgroundSchemeColor &&
        other.useInputDecoratorThemeInDialogs ==
            useInputDecoratorThemeInDialogs &&
        other.datePickerHeaderBackgroundSchemeColor ==
            datePickerHeaderBackgroundSchemeColor &&
        other.datePickerDialogRadius == datePickerDialogRadius &&
        other.timePickerDialogRadius == timePickerDialogRadius &&
        other.timePickerElementRadius == timePickerElementRadius &&
        //
        other.snackBarRadius == snackBarRadius &&
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
        other.tabBarUnselectedItemSchemeColor ==
            tabBarUnselectedItemSchemeColor &&
        other.tabBarUnselectedItemOpacity == tabBarUnselectedItemOpacity &&
        other.tabBarIndicatorSchemeColor == tabBarIndicatorSchemeColor &&
        other.tabBarIndicatorSize == tabBarIndicatorSize &&
        other.tabBarIndicatorWeight == tabBarIndicatorWeight &&
        other.tabBarIndicatorTopRadius == tabBarIndicatorTopRadius &&
        other.tabBarDividerColor == tabBarDividerColor &&
        //
        other.drawerRadius == drawerRadius &&
        other.drawerElevation == drawerElevation &&
        other.drawerBackgroundSchemeColor == drawerBackgroundSchemeColor &&
        other.drawerWidth == drawerWidth &&
        other.drawerIndicatorWidth == drawerIndicatorWidth &&
        other.drawerIndicatorRadius == drawerIndicatorRadius &&
        other.drawerIndicatorSchemeColor == drawerIndicatorSchemeColor &&
        other.drawerIndicatorOpacity == drawerIndicatorOpacity &&
        other.drawerSelectedItemSchemeColor == drawerSelectedItemSchemeColor &&
        other.drawerUnselectedItemSchemeColor ==
            drawerUnselectedItemSchemeColor &&
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
        other.adaptiveRemoveNavigationBarTint ==
            adaptiveRemoveNavigationBarTint &&
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
        adaptiveRemoveElevationTint,
        adaptiveElevationShadowsBack,
        adaptiveAppBarScrollUnderOff,
        adaptiveRadius,
        //
        adaptiveSplash,
        splashType,
        splashTypeAdaptive,
        //
        blendTextTheme,
        useTextTheme,
        useM2StyleDividerInM3,
        //
        defaultRadius,
        defaultRadiusAdaptive,
        buttonMinSize,
        alignedDropdown,
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
        switchThumbFixedSize,
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
        inputCursorSchemeColor,
        inputSelectionSchemeColor,
        inputSelectionOpacity,
        inputSelectionHandleSchemeColor,
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
        dropdownMenuTextStyle,
        //
        menuRadius,
        menuElevation,
        menuSchemeColor,
        menuOpacity,
        menuPadding,
        //
        menuBarBackgroundSchemeColor,
        menuBarRadius,
        menuBarElevation,
        menuBarShadowColor,
        //
        menuItemBackgroundSchemeColor,
        menuItemForegroundSchemeColor,
        menuIndicatorBackgroundSchemeColor,
        menuIndicatorForegroundSchemeColor,
        menuIndicatorRadius,
        //
        tooltipRadius,
        tooltipWaitDuration,
        tooltipShowDuration,
        tooltipSchemeColor,
        tooltipOpacity,
        //
        adaptiveDialogRadius,
        dialogRadius,
        dialogRadiusAdaptive,
        dialogElevation,
        dialogBackgroundSchemeColor,
        useInputDecoratorThemeInDialogs,
        datePickerHeaderBackgroundSchemeColor,
        datePickerDialogRadius,
        timePickerDialogRadius,
        timePickerElementRadius,
        //
        snackBarRadius,
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
        tabBarUnselectedItemSchemeColor,
        tabBarUnselectedItemOpacity,
        tabBarIndicatorSchemeColor,
        tabBarIndicatorSize,
        tabBarIndicatorWeight,
        tabBarIndicatorTopRadius,
        tabBarDividerColor,
        //
        drawerRadius,
        drawerElevation,
        drawerBackgroundSchemeColor,
        drawerWidth,
        drawerIndicatorWidth,
        drawerIndicatorRadius,
        drawerIndicatorSchemeColor,
        drawerIndicatorOpacity,
        drawerSelectedItemSchemeColor,
        drawerUnselectedItemSchemeColor,
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
        adaptiveRemoveNavigationBarTint,
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
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveRemoveElevationTint', adaptiveRemoveElevationTint));
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveElevationShadowsBack', adaptiveElevationShadowsBack));
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveAppBarScrollUnderOff', adaptiveAppBarScrollUnderOff));
    properties.add(
        DiagnosticsProperty<FlexAdaptive>('adaptiveRadius', adaptiveRadius));
    properties.add(
        DiagnosticsProperty<FlexAdaptive>('adaptiveSplash', adaptiveSplash));
    //
    properties.add(EnumProperty<FlexSplashType>('splashType', splashType));
    properties.add(
        EnumProperty<FlexSplashType>('splashTypeAdaptive', splashTypeAdaptive));
    //
    properties.add(DiagnosticsProperty<bool>('blendTextTheme', blendTextTheme));
    properties.add(DiagnosticsProperty<bool>('useTextTheme', useTextTheme));
    properties.add(DiagnosticsProperty<bool>(
        'useM2StyleDividerInM3', useM2StyleDividerInM3));
    //
    properties.add(DiagnosticsProperty<double>('defaultRadius', defaultRadius));
    properties.add(DiagnosticsProperty<double>(
        'defaultRadiusAdaptive', defaultRadiusAdaptive));
    properties.add(DiagnosticsProperty<Size>('buttonMinSize', buttonMinSize));
    properties
        .add(DiagnosticsProperty<bool>('alignedDropdown', alignedDropdown));
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
    properties.add(DiagnosticsProperty<bool>(
        'switchThumbFixedSize', switchThumbFixedSize));
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
    properties.add(EnumProperty<SchemeColor>(
        'inputCursorSchemeColor', inputCursorSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'inputSelectionSchemeColor', inputSelectionSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'inputSelectionOpacity', inputSelectionOpacity));
    properties.add(EnumProperty<SchemeColor>(
        'inputSelectionHandleSchemeColor', inputSelectionHandleSchemeColor));
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
    properties.add(DiagnosticsProperty<TextStyle>(
        'dropdownMenuTextStyle', dropdownMenuTextStyle));
    //
    properties.add(DiagnosticsProperty<double>('menuRadius', menuRadius));
    properties.add(DiagnosticsProperty<double>('menuElevation', menuElevation));
    properties
        .add(EnumProperty<SchemeColor>('menuSchemeColor', menuSchemeColor));
    properties.add(DiagnosticsProperty<double>('menuOpacity', menuOpacity));
    properties.add(
        DiagnosticsProperty<EdgeInsetsGeometry>('menuPadding', menuPadding));
    //
    properties.add(EnumProperty<SchemeColor>(
        'menuBarBackgroundSchemeColor', menuBarBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>('menuBarRadius', menuBarRadius));
    properties
        .add(DiagnosticsProperty<double>('menuBarElevation', menuBarElevation));
    properties.add(ColorProperty('menuBarShadowColor', menuBarShadowColor));
    //
    properties.add(EnumProperty<SchemeColor>(
        'menuItemBackgroundSchemeColor', menuItemBackgroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'menuItemForegroundSchemeColor', menuItemForegroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'menuIndicatorBackgroundSchemeColor',
        menuIndicatorBackgroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'menuIndicatorForegroundSchemeColor',
        menuIndicatorForegroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'menuIndicatorRadius', menuIndicatorRadius));
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
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveDialogRadius', adaptiveDialogRadius));
    properties.add(DiagnosticsProperty<double>('dialogRadius', dialogRadius));
    properties.add(DiagnosticsProperty<double>(
        'dialogRadiusAdaptive', dialogRadiusAdaptive));
    properties
        .add(DiagnosticsProperty<double>('dialogElevation', dialogElevation));
    properties.add(EnumProperty<SchemeColor>(
        'dialogBackgroundSchemeColor', dialogBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'useInputDecoratorThemeInDialogs', useInputDecoratorThemeInDialogs));
    //
    properties.add(EnumProperty<SchemeColor>(
        'datePickerHeaderBackgroundSchemeColor',
        datePickerHeaderBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'datePickerDialogRadius', datePickerDialogRadius));
    properties.add(DiagnosticsProperty<double>(
        'timePickerDialogRadius', timePickerDialogRadius));
    properties.add(DiagnosticsProperty<double>(
        'timePickerElementRadius', timePickerElementRadius));
    //
    properties
        .add(DiagnosticsProperty<double>('snackBarRadius', snackBarRadius));
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
        'tabBarUnselectedItemSchemeColor', tabBarUnselectedItemSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'tabBarUnselectedItemOpacity', tabBarUnselectedItemOpacity));
    properties.add(EnumProperty<SchemeColor>(
        'tabBarIndicatorSchemeColor', tabBarIndicatorSchemeColor));
    properties.add(EnumProperty<TabBarIndicatorSize>(
        'tabBarIndicatorSize', tabBarIndicatorSize));
    properties.add(DiagnosticsProperty<double>(
        'tabBarIndicatorWeight', tabBarIndicatorWeight));
    properties.add(DiagnosticsProperty<double>(
        'tabBarIndicatorTopRadius', tabBarIndicatorTopRadius));
    properties.add(ColorProperty('tabBarDividerColor', tabBarDividerColor));
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
    properties.add(EnumProperty<SchemeColor>(
        'drawerSelectedItemSchemeColor', drawerSelectedItemSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'drawerUnselectedItemSchemeColor', drawerUnselectedItemSchemeColor));
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
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarSelectedIconSize',
        bottomNavigationBarSelectedIconSize));
    properties.add(DiagnosticsProperty<double>(
        'bottomNavigationBarUnselectedIconSize',
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
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveRemoveNavigationBarTint', adaptiveRemoveNavigationBarTint));
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
    properties.add(DiagnosticsProperty<double>(
        'navigationRailSelectedIconSize', navigationRailSelectedIconSize));
    properties.add(DiagnosticsProperty<double>(
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
