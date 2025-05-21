// Cupertino only for comment refs.
import 'package:flutter/cupertino.dart'
    show CupertinoAlertDialog, CupertinoSwitch;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_adaptive.dart';
import 'flex_color.dart' show FlexColor; // For comment refs.
import 'flex_color_scheme.dart';
import 'flex_constants.dart';
import 'flex_splash_type.dart';
import 'flex_sub_themes.dart';
import 'flex_theme_data_extensions.dart'; // For comment refs.

/// Parameters used by [FlexColorScheme] to configure its used [FlexSubThemes].
///
/// To enable the optional component theming feature in FlexColorScheme, pass in
/// at least a default [FlexSubThemesData] to the
/// [FlexColorScheme.subThemesData] property.
/// This gives you the default opinionated component theming setup.
///
/// The list of properties in the flat configuration class is very large.
/// While it can be a bit tricky to maintain it, using it is easy and a
/// convenient way to adjust commonly used properties on UI component
/// widgets, by using a simple flat list of property values.
///
/// No need for deep [ShapeBorder] definitions for a simple border radius
/// change, nor for the complex [WidgetState] properties. Well, not as long
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
///   [FlexSubThemes.bottomNavigationBarTheme].
/// * [BottomSheetThemeData] for [BottomSheet] via
///   [FlexSubThemes.bottomSheetTheme].
/// * [ButtonThemeData] for old deprecated buttons, via
///   [FlexSubThemes.buttonTheme].
/// * [CardThemeData] for [Card] via [FlexSubThemes.cardTheme].
/// * [CheckboxThemeData] for [Checkbox] via [FlexSubThemes.checkboxTheme].
/// * [ChipThemeData] for [Chip] via [FlexSubThemes.chipTheme].
/// * [DatePickerThemeData] for [DatePickerDialog] via
///   [FlexSubThemes.datePickerTheme]
/// * [DialogThemeData] for [Dialog] via [FlexSubThemes.dialogTheme].
/// * [DrawerThemeData] for [Drawer] via [FlexSubThemes.drawerTheme].
/// * [DropdownMenuThemeData] for [DropdownMenu] via
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
/// * [MenuButtonThemeData] for [MenuItemButton] and [SubmenuButton] via
///   [FlexSubThemes.menuButtonTheme].
/// * [MenuThemeData] for [MenuBar], [MenuAnchor] and [DropdownMenu] via
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
/// * [TabBarThemeData] for [TabBar] via [FlexSubThemes.tabBarTheme].
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
    this.interactionEffects = false,
    this.tintedDisabledControls = false,
    this.blendOnLevel,
    this.blendOnColors = false,
    //
    this.adaptiveRemoveElevationTint,
    this.adaptiveElevationShadowsBack,
    this.adaptiveAppBarScrollUnderOff,
    this.adaptiveRadius,
    this.adaptiveDialogRadius,
    this.adaptiveInputDecoratorRadius,
    //
    this.adaptiveSplash,
    this.splashType,
    this.splashTypeAdaptive,
    //
    this.useMaterial3Typography,
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
    this.elevatedButtonTextStyle, // Not in Playground
    //
    this.outlinedButtonRadius,
    this.outlinedButtonSchemeColor,
    this.outlinedButtonOutlineSchemeColor,
    this.outlinedButtonBorderWidth,
    this.outlinedButtonPressedBorderWidth,
    this.outlinedButtonTextStyle, // Not in Playground
    //
    this.toggleButtonsRadius,
    this.toggleButtonsSchemeColor,
    this.toggleButtonsSelectedForegroundSchemeColor,
    this.toggleButtonsUnselectedSchemeColor,
    this.toggleButtonsBorderSchemeColor,
    this.toggleButtonsBorderWidth,
    this.toggleButtonsTextStyle, // Not in Playground
    //
    this.segmentedButtonRadius,
    this.segmentedButtonSchemeColor,
    this.segmentedButtonSelectedForegroundSchemeColor,
    this.segmentedButtonUnselectedSchemeColor,
    this.segmentedButtonUnselectedForegroundSchemeColor,
    this.segmentedButtonBorderSchemeColor,
    this.segmentedButtonBorderWidth,
    this.segmentedButtonTextStyle, // Not in Playground
    //
    this.scaffoldBackgroundBaseColor,
    this.scaffoldBackgroundSchemeColor,
    //
    this.materialButtonSchemeColor,
    //
    this.switchSchemeColor,
    this.switchThumbSchemeColor,
    this.switchThumbFixedSize,
    this.switchAdaptiveCupertinoLike,
    //
    this.checkboxSchemeColor,
    this.radioSchemeColor,
    this.unselectedToggleIsColored = false,
    //
    this.sliderBaseSchemeColor,
    this.sliderThumbSchemeColor,
    this.sliderIndicatorSchemeColor,
    this.sliderValueTinted = false,
    this.sliderValueIndicatorType,
    this.sliderShowValueIndicator,
    this.sliderTrackHeight,
    //
    this.inputDecoratorRadius,
    this.inputDecoratorRadiusAdaptive,
    this.inputDecoratorSchemeColor,
    this.inputDecoratorContentPadding,
    this.inputDecoratorIsDense,
    this.inputDecoratorIsFilled,
    this.inputDecoratorFillColor,
    this.inputDecoratorBackgroundAlpha,
    this.inputDecoratorBorderSchemeColor,
    this.inputDecoratorBorderType,
    this.inputDecoratorFocusedHasBorder = true,
    this.inputDecoratorUnfocusedHasBorder = true,
    this.inputDecoratorUnfocusedBorderIsColored,
    this.inputDecoratorBorderWidth,
    this.inputDecoratorFocusedBorderWidth,
    this.inputDecoratorPrefixIconSchemeColor,
    this.inputDecoratorSuffixIconSchemeColor,
    //
    this.inputCursorSchemeColor,
    this.inputSelectionSchemeColor,
    this.inputSelectionOpacity,
    this.inputSelectionHandleSchemeColor,
    //
    this.listTileSelectedSchemeColor,
    this.listTileIconSchemeColor,
    this.listTileTextSchemeColor,
    this.listTileTitleTextStyle, // Not in Playground
    this.listTileSubtitleTextStyle, // Not in Playground
    this.listTileLeadingAndTrailingTextStyle, // Not in Playground
    this.listTileTileSchemeColor,
    this.listTileSelectedTileSchemeColor,
    this.listTileContentPadding,
    this.listTileHorizontalTitleGap,
    this.listTileMinVerticalPadding,
    this.listTileStyle,
    this.listTileTitleAlignment,
    this.listTileControlAffinity, // Not in Playground, not in Flutter stable.
    //
    this.fabRadius,
    this.fabUseShape = false,
    this.fabAlwaysCircular = false,
    this.fabSchemeColor,
    this.fabForegroundSchemeColor,
    this.fabExtendedTextStyle, // Not in Playground
    //
    this.chipRadius,
    this.chipBlendColors,
    this.chipSchemeColor,
    this.chipSelectedSchemeColor,
    this.chipSecondarySelectedSchemeColor,
    this.chipDeleteIconSchemeColor,
    this.chipLabelStyle, // Not in Playground
    this.chipSecondaryLabelStyle, // Not in Playground
    this.chipFontSize,
    this.chipSecondaryFontSize,
    this.chipIconSize,
    this.chipPadding,
    //
    this.cardRadius,
    this.cardElevation,
    //
    this.popupMenuRadius,
    this.popupMenuElevation,
    this.popupMenuSchemeColor,
    this.popupMenuOpacity,
    //
    this.dropdownMenuTextStyle, // Not in Playground
    //
    this.menuRadius,
    this.menuElevation,
    this.menuSchemeColor,
    this.menuOpacity,
    this.menuPadding,
    this.menuButtonTextStyle, // Not in Playground
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
    this.searchBarBackgroundSchemeColor,
    this.searchViewBackgroundSchemeColor,
    this.searchBarElevation,
    this.searchViewElevation,
    this.searchBarRadius,
    this.searchViewRadius,
    this.searchUseGlobalShape = false,
    this.searchViewHeaderHeight,
    this.searchBarTextStyle, // Not in Playground
    this.searchViewHeaderTextStyle, // Not in Playground
    this.searchBarHintStyle, // Not in Playground
    this.searchViewHeaderHintStyle, // Not in Playground
    this.searchViewDividerColor,
    this.searchBarShadowColor, // Not in Playground
    this.searchBarTextCapitalization, // Not in Playground
    this.searchBarPadding, // Not in Playground
    this.searchBarConstraints, // Not in Playground
    this.searchViewConstraints, // Not in Playground
    //
    this.tooltipRadius,
    this.tooltipWaitDuration,
    this.tooltipShowDuration,
    this.tooltipSchemeColor,
    this.tooltipOpacity,
    //
    this.useInputDecoratorThemeInDialogs,
    //
    this.dialogRadius,
    this.dialogRadiusAdaptive,
    this.dialogElevation,
    this.dialogBackgroundSchemeColor,
    this.dialogTitleTextStyle, // Not in Playground
    this.dialogContentTextStyle, // Not in Playground
    //
    this.datePickerHeaderBackgroundSchemeColor,
    this.datePickerHeaderForegroundSchemeColor,
    this.datePickerDialogRadius,
    this.datePickerDividerSchemeColor,
    this.datePickerHeaderHeadlineStyle, // Not in Playground
    this.datePickerHeaderHelpStyle, // Not in Playground
    this.datePickerWeekdayStyle, // Not in Playground
    this.datePickerDayStyle, // Not in Playground
    this.datePickerYearStyle, // Not in Playground
    this.datePickerRangePickerHeaderHeadlineStyle, // Not in Playground
    this.datePickerRangePickerHeaderHelpStyle, // Not in Playground
    //
    this.timePickerDialogRadius,
    this.timePickerElementRadius,
    this.timePickerDayPeriodTextStyle, // Not in Playground
    this.timePickerDialTextStyle, // Not in Playground
    this.timePickerHelpTextStyle, // Not in Playground
    this.timePickerHourMinuteTextStyle, // Not in Playground
    //
    this.snackBarRadius,
    this.snackBarElevation,
    this.snackBarBackgroundSchemeColor,
    this.snackBarActionSchemeColor,
    this.snackBarContentTextStyle, // Not in Playground
    //
    this.appBarBackgroundSchemeColor,
    this.appBarForegroundSchemeColor,
    this.appBarIconSchemeColor,
    this.appBarActionsIconSchemeColor,
    this.appBarCenterTitle,
    this.appBarScrolledUnderElevation,
    this.appBarToolbarTextStyle, // Not in Playground
    this.appBarTitleTextStyle, // Not in Playground
    //
    this.bottomAppBarSchemeColor,
    this.bottomAppBarHeight,
    //
    this.tabBarItemSchemeColor,
    this.tabBarUnselectedItemSchemeColor,
    this.tabBarUnselectedItemOpacity,
    this.tabBarIndicatorSchemeColor,
    this.tabBarIndicatorSize,
    this.tabBarIndicatorWeight,
    this.tabBarIndicatorTopRadius,
    this.tabBarDividerColor,
    this.tabBarTabAlignment,
    this.tabBarIndicatorAnimation,
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
    this.bottomSheetClipBehavior,
    //
    this.bottomNavigationBarLabelTextStyle,
    this.bottomNavigationBarSelectedLabelSize,
    this.bottomNavigationBarUnselectedLabelSize,
    this.bottomNavigationBarSelectedLabelSchemeColor,
    this.bottomNavigationBarUnselectedLabelSchemeColor,
    this.bottomNavigationBarMutedUnselectedLabel,
    this.bottomNavigationBarSelectedIconSize,
    this.bottomNavigationBarUnselectedIconSize,
    this.bottomNavigationBarSelectedIconSchemeColor,
    this.bottomNavigationBarUnselectedIconSchemeColor,
    this.bottomNavigationBarMutedUnselectedIcon,
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
    this.navigationBarMutedUnselectedLabel,
    this.navigationBarSelectedIconSize,
    this.navigationBarUnselectedIconSize,
    this.navigationBarSelectedIconSchemeColor,
    this.navigationBarUnselectedIconSchemeColor,
    this.navigationBarMutedUnselectedIcon,
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
    this.navigationRailMutedUnselectedLabel,
    this.navigationRailSelectedIconSize,
    this.navigationRailUnselectedIconSize,
    this.navigationRailSelectedIconSchemeColor,
    this.navigationRailUnselectedIconSchemeColor,
    this.navigationRailMutedUnselectedIcon,
    this.navigationRailUseIndicator,
    this.navigationRailIndicatorSchemeColor,
    this.navigationRailIndicatorOpacity,
    this.navigationRailIndicatorRadius,
    this.navigationRailBackgroundSchemeColor,
    this.navigationRailOpacity,
    this.navigationRailElevation,
    this.navigationRailLabelType,
    this.navigationRailGroupAlignment,
    this.navigationRailMinWidth,
    this.navigationRailMinExtendedWidth,
    //
    @Deprecated('This property has been replaced by the more aptly named '
        'useMaterial3Typography property and no longer has any function '
        'in V8 and will be removed in v9.0.0.')
    this.useTextTheme,
    @Deprecated('The `useFlutterDefaults` is deprecated, it no longer has any '
        'function and will be removed in v9. FlexColorScheme in M3 mode '
        'defaults to using mostly Flutter defaults styles. '
        'For other configurations modify the theme as desired. '
        'In M2 mode FCS will continue to use its own opinionated defaults for '
        'as long as M2 exists.')
    this.useFlutterDefaults,
    @Deprecated(
      'The `blendTextTheme` is deprecated, it no longer has any '
      'function and will be removed in v9. More info below.\n'
      '\n'
      'The `blendTextTheme` feature was originally '
      "made before Material-3's TextTheme was available, before it was fully "
      'known how it was going to be implemented. It was an approximation of '
      'the TextStyles that could be seen in early versions of Material-3 '
      'images. Since the actual Material-3 TextTheme is available, the tinted '
      'TextTheme feature is no longer needed. While the FCS tinted TextTheme '
      'did provide an alternative version of the actual tint used in '
      'Material-3, but the differences were quite subtle. Additionally, '
      'recent changes in Flutter make using it very verbose and complicated. '
      'Why it does so, is explained below.\n'
      '\n'
      'In Material-3 Typography 2021, the TextTheme and all styles in it are '
      'fully opaque and use onSurface as color on all TextStyles. '
      'In a seed generated ColorScheme, the text becomes primary tinted, '
      'because the onSurface color by default has subtle primary tint. '
      'With FCS you can modify the onSurface to black or white to avoid this, '
      'if so preferred.\n'
      '\n'
      'In Material-2 Typography 2018 and 2014, some TextStyles '
      'in their TextThemes use partially transparent white or '
      'black colors, making them appear tinted '
      'when placed on lightly colored backgrounds. Such TextStyles also '
      'have lower contrast. If the Material-3 default text theme is '
      'used on background colors that are tinted with a color that '
      'deviates a lot in hue from the hue used as tint color by the TextTheme, '
      'it may not fit it so well. The Material-2 opacity-based text styles '
      'do not have this limitation. It is unknown why Material-3 switched to '
      'a fixed tint color instead of using the opacity-based approach '
      'used in Material-2, that is more universally '
      'usable on backgrounds with different tint colors.\n'
      '\n'
      'In Material-3, some component themes override the default color the of '
      'the default TextTheme TextStyles they use with onSurfaceVariant. '
      'This color has slightly more tint and lower contrast than onSurface. '
      'This is used for elements that should have less emphasis. Many default '
      'Material-3 components also override the color in default TextTheme '
      'TextStyles '
      'they use with onSurface color, that it actually already has in a '
      'default TextTheme. These two overrides causes whatever '
      'color the default TextTheme TextStyles have, to be overridden by '
      'these ColorScheme colors. Resulting in that any custom colored '
      'TextTheme is not getting used by such Material-3 components and that '
      'the custom colors from the meticulously colored custom TextTheme, '
      'are rarely visible anywhere in a Material-3 application. Material-2 '
      'component themes do not do this, nor did older Flutter versions of '
      'Material-3 component themes do this.\n'
      '\n'
      'An issue has been raised explaining the challenges this newer approach '
      'in Flutter causes when using custom colored text themes. If this '
      'issue is addressed, the tinted TextTheme feature in FCS may '
      'be brought back, if it is a requested feature.\n'
      '\n'
      'In current Flutter versions, using a custom tinted TextTheme is '
      'rather pointless. You can do it, but is not enough to just define the '
      'TextTheme. You also have to pass each tinted TextStyle it has to the '
      'appropriate TextStyles in ALL component themes that override its '
      'colors, for it to have any effect. It is typically not '
      'worth the effort.\n',
    )
    this.blendTextTheme = false,
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
  /// onSurface colors, that to their defense in M3 mode contain a slight tint
  /// of primary color.
  ///
  /// This design makes all the interaction effects work with the UI components
  /// color matching effects, regardless of how it is themed. It delivers more
  /// color expressiveness than Flutter's default M2 and M3 styles.
  ///
  /// This feature is implemented by always in all sub-themes' [WidgetState]
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
  /// of [WidgetState] and only works partially. Compromises had to be made in
  /// some cases. These cases will be improved when support for them in
  /// Flutter is corrected. The status of these issues and gaps are tracked
  /// in FlexColorScheme docs
  /// [known issues](https://docs.flexcolorscheme.com/known_issues) chapter.
  ///
  /// Keep it false to use Flutter's default interactions effects.
  //
  /// Defaults to false.
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
  /// The feature is implemented by always in all sub-themes' [WidgetState]
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
  /// Keep it false to use Flutter's default its grey disabled controls.
  ///
  /// Defaults to false.
  final bool tintedDisabledControls;

  /// Sets the blend level strength of container color used on its onColor.
  ///
  /// Use [blendOnLevel] value to in FlexColorScheme themes to also blend in
  /// each corresponding [ColorScheme] color property's color into its onColors.
  ///
  /// If [blendOnColors] is false, the [blendOnLevel] setting only affects
  /// produced [ColorScheme.onSurface], [ColorScheme.onPrimaryContainer],
  /// [ColorScheme.onSecondaryContainer], [ColorScheme.onTertiaryContainer] and
  /// [ColorScheme.onErrorContainer].
  ///
  /// If [blendOnColors] is true, it also impacts [ColorScheme.onPrimary],
  /// [ColorScheme.onSecondary], [ColorScheme.onTertiary] and
  /// [ColorScheme.onError].
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
  /// resulting [ColorScheme.onPrimary], [ColorScheme.onSecondary] and
  /// [ColorScheme.onTertiary] colors.
  ///
  /// Use [blendOnLevel] value to in FlexColorScheme themes to also blend in
  /// each corresponding [ColorScheme] color property's color into its onColors.
  ///
  /// If [blendOnColors] is false, the [blendOnLevel] setting only affects
  /// [ColorScheme.onSurface], [ColorScheme.onPrimaryContainer],
  /// [ColorScheme.onSecondaryContainer], [ColorScheme.onTertiaryContainer]
  /// and [ColorScheme.onErrorContainer].
  ///
  /// If [blendOnColors] is true, it also impacts [ColorScheme.onPrimary],
  /// [ColorScheme.onSecondary], [ColorScheme.onTertiary] and
  /// [ColorScheme.onError].
  ///
  /// Blending the on colors results in lower contrast than when not doing so,
  /// but it works well on lower blend levels. The effect can be adjusted
  /// with [blendOnLevel] and completely turned off by setting [blendOnLevel]
  /// to 0 (zero).
  ///
  /// Defaults to false.
  ///
  /// Consider setting this property true in dark mode, and false in
  /// light theme mode, for a style that matches the Material-3 color design
  /// when not using seed generated [ColorScheme].
  final bool blendOnColors;

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
  /// - [DropdownMenu]
  /// - [MenuAnchor]
  /// - [MenuBar]
  /// - [NavigationDrawer]
  /// - [PopupMenuButton]
  ///
  /// Not supported in Flutter theming on:
  /// - [BottomNavigationBar], does not have elevation tint in M3 in
  ///   Flutter 3.7, since it is an M2 component it does not support it.
  /// - [NavigationRail], does not have elevation tint in Flutter 3.7.
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
  /// - [DropdownMenu]
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

  /// Controls if the [dialogRadiusAdaptive] is used instead of [dialogRadius]
  /// on configured platforms.
  ///
  /// With this feature you can have another configured border radius on
  /// all dialogs, based on another [ShapeBorder], than the one you have
  /// defined in [dialogRadius].
  ///
  /// If you keep [dialogRadius] undefined and define [dialogRadiusAdaptive],
  /// you can get the Material-3 default radius on platforms not included in
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

  /// Controls if the [inputDecoratorRadiusAdaptive] is used instead of
  /// [inputDecoratorRadius] on configured platforms.
  ///
  /// With this feature you can have another configured border radius on
  /// all text fields, based on another [ShapeBorder] ,than the one you have
  /// defined in [inputDecoratorRadius].
  ///
  /// If you keep [inputDecoratorRadius] undefined and define
  /// [inputDecoratorRadiusAdaptive], you can get the Material-3 default radius
  /// on platforms not included in your [adaptiveInputDecoratorRadius] and use
  /// the [inputDecoratorRadiusAdaptive] radius on all dialogs in the platforms
  /// included in the [adaptiveDialogRadius] configuration.
  ///
  /// For example for iOS you may want to try 6 dp as border radius on text
  /// fields, for a more platform agnostic look.
  ///
  /// See class [FlexAdaptive] on how to configure the platform adaptive
  /// behavior. You may for example use the [FlexAdaptive.iOSAndDesktop]
  /// for a configuration that keeps used [inputDecoratorRadius] value on
  /// Android and Fuchsia platforms, and also when the app is run in a web
  /// browser on these platforms, but uses the [inputDecoratorRadiusAdaptive]
  /// value on other platforms, like iOS, desktop and their web usage.
  ///
  /// If not defined, defaults to [FlexAdaptive.off].
  final FlexAdaptive? adaptiveInputDecoratorRadius;

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

  /// Use selection `surfaceMode` and `blendLevel` in [FlexColorScheme.light]
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
  @Deprecated(
    'The `blendTextTheme` is deprecated, it no longer has any '
    'function and will be removed in v9. More info below.\n'
    '\n'
    'The `blendTextTheme` feature was originally '
    "made before Material-3's TextTheme was available, before it was fully "
    'known how it was going to be implemented. It was an approximation of '
    'the TextStyles that could be seen in early versions of Material-3 '
    'images. Since the actual Material-3 TextTheme is available, the tinted '
    'TextTheme feature is no longer needed. While the FCS tinted TextTheme '
    'did provide an alternative version of the actual tint used in '
    'Material-3, but the differences were quite subtle. Additionally, '
    'recent changes in Flutter make using it very verbose and complicated. '
    'Why it does so, is explained below.\n'
    '\n'
    'In Material-3 Typography 2021, the TextTheme and all styles in it are '
    'fully opaque and use onSurface as color on all TextStyles. '
    'In a seed generated ColorScheme, the text becomes primary tinted, '
    'because the onSurface color by default has subtle primary tint. '
    'With FCS you can modify the onSurface to black or white to avoid this, '
    'if so preferred.\n'
    '\n'
    'In Material-2 Typography 2018 and 2014, some TextStyles '
    'in their TextThemes use partially transparent white or '
    'black colors, making them appear tinted '
    'when placed on lightly colored backgrounds. Such TextStyles also '
    'have lower contrast. If the Material-3 default text theme is '
    'used on background colors that are tinted with a color that '
    'deviates a lot in hue from the hue used as tint color by the TextTheme, '
    'it may not fit it so well. The Material-2 opacity-based text styles '
    'do not have this limitation. It is unknown why Material-3 switched to '
    'a fixed tint color instead of using the opacity-based approach '
    'used in Material-2, that is more universally '
    'usable on backgrounds with different tint colors.\n'
    '\n'
    'In Material-3, some component themes override the default color the of '
    'the default TextTheme TextStyles they use with onSurfaceVariant. '
    'This color has slightly more tint and lower contrast than onSurface. '
    'This is used for elements that should have less emphasis. Many default '
    'Material-3 components also override the color in default TextTheme '
    'TextStyles '
    'they use with onSurface color, that it actually already has in a '
    'default TextTheme. These two overrides causes whatever '
    'color the default TextTheme TextStyles have, to be overridden by '
    'these ColorScheme colors. Resulting in that any custom colored '
    'TextTheme is not getting used by such Material-3 components and that '
    'the custom colors from the meticulously colored custom TextTheme, '
    'are rarely visible anywhere in a Material-3 application. Material-2 '
    'component themes do not do this, nor did older Flutter versions of '
    'Material-3 component themes do this.\n'
    '\n'
    'An issue has been raised explaining the challenges this newer approach '
    'in Flutter causes when using custom colored text themes. If this '
    'issue is addressed, the tinted TextTheme feature in FCS may '
    'be brought back, if it is a requested feature.\n'
    '\n'
    'In current Flutter versions, using a custom tinted TextTheme is '
    'rather pointless. You can do it, but is not enough to just define the '
    'TextTheme. You also have to pass each tinted TextStyle it has to the '
    'appropriate TextStyles in ALL component themes that override its '
    'colors, for it to have any effect. It is typically not '
    'worth the effort.\n',
  )
  final bool blendTextTheme;

  /// Determines if Material-3 TextTheme and Typography is used.
  ///
  /// When opting in on using component themes, this flag controls if the
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
  /// component themes are not used, then default typography is
  /// [Typography.material2018]. Note that if [FlexColorScheme] is
  /// not used at all, and your [ThemeData] has [ThemeData.useMaterial3] false,
  /// then Flutter defaults to using very old poor [Typography.material2014].
  /// In such cases consider defining your typography manually to
  /// [Typography.material2018] or why not even [Typography.material2021].
  ///
  /// FlexColorScheme fully supports using any custom TextTheme and fonts, just
  /// like ThemeData. You apply and use them just as you would with ThemeData.
  /// This text theme is just a convenience Typography toggle.
  ///
  /// If you specify a custom typography in [FlexColorScheme.typography],
  /// this property has no impact on used typography.
  final bool? useMaterial3Typography;

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
  /// * [FloatingActionButton] (if opted in with `fabUseShape: true`)
  /// * [InputDecoration]
  /// * [MenuAnchor]
  /// * [OutlinedButton]
  /// * [SegmentedButton]
  /// * [TextButton]
  /// * [ToggleButtons]
  /// * [TimePickerDialog]
  /// * Older deprecated buttons using `ButtonThemeData`
  ///
  /// For clarity the following small, or element borders are not affect
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
  /// If undefined defaults to [kThinBorderWidth] = 1.
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
  /// The color of the [textButtonTextStyle] is typically not used directly, the
  /// [textButtonSchemeColor] is used instead.
  final WidgetStateProperty<TextStyle?>? textButtonTextStyle;

  /// Border radius override value for [FilledButton].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kButtonRadius] 40dp in Material-2 and StadiumBorder in Material-3.
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
  /// The color of the [filledButtonTextStyle] is typically not used directly,
  /// the [filledButtonSchemeColor] complement is used instead.
  final WidgetStateProperty<TextStyle?>? filledButtonTextStyle;

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
  // final WidgetStateProperty<TextStyle?>? filledButtonTonalTextStyle;

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
  /// If null, defaults to [kElevatedButtonElevation] = 1, when
  /// [FlexColorScheme.useMaterial3] is false.
  /// If [FlexColorScheme.useMaterial3] is true, it is kept null and default
  /// Material-3 elevation of [ElevatedButton] is kept.
  final double? elevatedButtonElevation;

  /// Defines which [Theme] based [ColorScheme] based color, that the
  /// [ElevatedButton] used as its main color.
  ///
  /// If [FlexColorScheme.useMaterial3] is false, the
  /// [elevatedButtonSchemeColor] is used as button background color in
  /// Material-2 style. If [FlexColorScheme.useMaterial3] is true, it is
  /// used as the button foreground color for text and icon.
  ///
  /// If not defined, it defaults to theme.colorScheme.primary color via
  /// FlexColorScheme sub-theme defaults when opting on sub themes.
  final SchemeColor? elevatedButtonSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color, that the
  /// [ElevatedButton] uses as its secondary color.
  ///
  /// If [FlexColorScheme.useMaterial3] is false, the
  /// [elevatedButtonSecondarySchemeColor] is used as button foreground color
  /// in Material-2 style. If [FlexColorScheme.useMaterial3] is true,
  /// it is used as the button background color.
  ///
  /// If not defined, the [elevatedButtonSchemeColor]'s on color will be used if
  /// [FlexColorScheme.useMaterial3] is false, and if it is true, then
  /// [ColorScheme.surface] will be used as default.
  final SchemeColor? elevatedButtonSecondarySchemeColor;

  /// The style for the [ElevatedButton]'s [Text] widget descendants.
  ///
  /// The color of the [elevatedButtonTextStyle] is typically not used directly,
  /// the [elevatedButtonSchemeColor] is used instead.
  final WidgetStateProperty<TextStyle?>? elevatedButtonTextStyle;

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
  /// If [FlexColorScheme.useMaterial3] is false, and the
  /// [outlinedButtonOutlineSchemeColor] is
  /// not defined, the [outlinedButtonSchemeColor] is used as default button
  /// outline color, following Material-2 style.
  ///
  /// If [FlexColorScheme.useMaterial3] is true, and the
  /// [outlinedButtonOutlineSchemeColor] is
  /// not defined, the [ColorScheme.outline] is used as default button
  /// outline color in Material-3 style.
  final SchemeColor? outlinedButtonOutlineSchemeColor;

  /// The border width of the [OutlinedButton].
  ///
  /// If not defined, defaults to [thinBorderWidth];
  final double? outlinedButtonBorderWidth;

  /// The border width of the pressed [OutlinedButton].
  ///
  /// If not defined, defaults to [thickBorderWidth];
  final double? outlinedButtonPressedBorderWidth;

  /// The style for the [OutlinedButton]'s [Text] widget descendants.
  ///
  /// The color of the [outlinedButtonTextStyle] is typically not used directly,
  /// the [outlinedButtonSchemeColor] complement is used instead.
  final WidgetStateProperty<TextStyle?>? outlinedButtonTextStyle;

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
  /// If [toggleButtonsUnselectedSchemeColor] is not defined,
  /// [toggleButtonsSchemeColor] is used as foreground color for unselected
  /// buttons.
  ///
  /// If [toggleButtonsBorderSchemeColor] is not defined, then in Material-2
  /// mode it is also used as color base for the border color. In Material-3
  /// mode an undefined [toggleButtonsBorderSchemeColor] results in
  /// [ColorScheme.outline] color being used.
  ///
  /// If not defined it defaults to [SchemeColor.primary].
  final SchemeColor? toggleButtonsSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [ToggleButtons] use as its selected item foreground theme color.
  ///
  /// If not defined, contrast color pair to [toggleButtonsSchemeColor] will
  /// be used, which for its default value is onPrimary.
  final SchemeColor? toggleButtonsSelectedForegroundSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [ToggleButtons] use as the foreground color for unselected toggle buttons.
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

  /// The default text style for [ToggleButtons.children].
  ///
  /// [TextStyle.color] will be ignored and substituted by
  /// [toggleButtonsSchemeColor],[toggleButtonsSelectedForegroundSchemeColor]
  /// or [toggleButtonsUnselectedSchemeColor] complement or computed
  /// disabled color, depending on whether the buttons
  /// are active, selected, or disabled.
  final TextStyle? toggleButtonsTextStyle;

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

  /// Defines which [Theme] based [ColorScheme] based color a selected
  /// [SegmentedButton] use as its foreground theme color.
  ///
  /// If not defined, contrast color pair to [segmentedButtonSchemeColor]
  /// will be used.
  final SchemeColor? segmentedButtonSelectedForegroundSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [SegmentedButton] use as the background color for unselected buttons.
  ///
  /// If not defined it defaults to [SchemeColor.transparent].
  final SchemeColor? segmentedButtonUnselectedSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the
  /// [SegmentedButton] use as the foreground color for unselected buttons.
  ///
  /// If not defined, contrast color pair to
  /// [segmentedButtonUnselectedSchemeColor]
  /// will be used, for transparent it is onSurface.
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

  /// The style for the segmented button's [Text] widget descendants.
  ///
  /// The color of the [segmentedButtonTextStyle] is typically not used
  /// directly, the [segmentedButtonSchemeColor] and
  /// [segmentedButtonUnselectedForegroundSchemeColor] are used instead.
  final WidgetStateProperty<TextStyle?>? segmentedButtonTextStyle;

  /// Base color used as [ThemeData.scaffoldBackgroundColor] in a theme
  /// produced by [FlexColorScheme.light] and [FlexColorScheme.dark] factories,
  /// or extensions [FlexThemeData.light] and [FlexThemeData.dark].
  ///
  /// The used base color is modified by used `surfaceMode` and `blendLevel`
  /// parameters in the [FlexColorScheme] factory constructors or extensions.
  ///
  /// By using different base colors you can create alpha blended scaffold
  /// background colors with even more variation, as they are mixed with the
  /// blend color, but start at different base colors.
  ///
  /// If you do not want to get any blend in the Scaffold background color, but
  /// otherwise want to use surface blends with `blendLevel` > 0, you can
  /// set the `FlexSubThemesData(scaffoldBackgroundSchemeColor)` to any
  /// [SchemeColor]. Setting this property overrides all scaffold background
  /// color definitions, and always uses the selected color as is.
  final FlexScaffoldBaseColor? scaffoldBackgroundBaseColor;

  /// Defines which [Theme] based [ColorScheme] color, that the color
  /// [ThemeData.scaffoldBackgroundColor] will use as override color.
  ///
  /// Defining this color will override any blended Scaffold background and
  /// also parameters `lightIsWhite` in light mode, and `darkIsTrueBlack` in
  /// dark mode theme produced by [FlexColorScheme.light] and
  /// [FlexColorScheme.dark] factories or extensions [FlexThemeData.light] and
  /// [FlexThemeData.dark], the other parts of their impacts will remain
  /// in effect.
  ///
  /// Recommend sticking to surface colors, but if ScaffoldBackground is
  /// only as a background effect color, it is feasible to use any ColorScheme
  /// color you like. White, Black and transparent are also available.
  /// Transparent will only show the background color of the parent widget,
  /// which in root MaterialApp case is black, so you will not see the desktop
  ///  behind
  ///
  /// Defaults to null, the color depends on other FlexColorScheme settings,
  /// but is no blends are used, the starting point values are:
  ///
  /// Defaults in Material-2 mode are equal to Material-2 spec:
  /// - Light mode: [FlexColor.materialLightScaffoldBackground] (0xFFFFFFFF)
  /// - Dark mode: [FlexColor.materialDarkScaffoldBackground] (0xFF121212)
  ///
  /// Defaults in Material-3 mode are:
  /// - Light mode: [FlexColor.lightFlexSurfaceContainerLowest] (0xFFFFFFFF)
  /// - Dark mode: [FlexColor.darkFlexSurfaceContainerLowest] (0xFF010101)
  ///
  /// The Material-3 defaults are an internal FCS standard used when not using
  /// seed generated ColorSchemes. There is no official spec for when not
  /// using the M3 ColorScheme seeding in the M3 guide. The defaults are based
  /// on very low starting point values that can be used to create a wide range
  /// of blended or tinted results.
  final SchemeColor? scaffoldBackgroundSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color, that the old
  /// [MaterialButton] use as its main theme color.
  ///
  /// The [MaterialButton] is the parent class of old deprecated and removed
  /// buttons `RaisedButton`, `OutlineButton` and `FlatButton`. The theme
  /// `ButtonThemeData` it affects, is also used by
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
  /// - [switchSchemeColor] if [FlexColorScheme.useMaterial3] is false.
  /// - [SchemeColor.primaryContainer] if [FlexColorScheme.useMaterial3] is true
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

  /// Controls if the Material-3 Switch uses an adaptive response to change its
  /// style to be more like the iOS or Cupertino Switch.
  ///
  /// This style is different from using [Switch.adaptive] as it changes the
  /// Material [Switch] on selected platforms to look a lot like the Flutter iOS
  /// [CupertinoSwitch], but only when the app is run on platforms selected to
  /// use this adaptive response.
  ///
  /// It does not use a constructor with own platform builder to change the
  /// Switch to a CupertinoSwitch like [Switch.adaptive], it uses a different
  /// Switch theme on the selected platforms. The [Switch.adaptive]
  /// constructor is more appropriate if you want the exact [CupertinoSwitch]
  /// style on Apple platforms.
  ///
  /// This feature is more like a light version of the adaptive switch style
  /// and it is not an exact match, only as close as we can make it
  /// when theming a Material Switch. It does have the advantage that you
  /// can have this adaptive response on more platforms than just Apple
  /// platforms and it only requires theming the [Switch], not changing the
  /// Switch constructor in your app.
  ///
  /// See class [FlexAdaptive] on how to configure the platform adaptive
  /// behavior. You may for example like the [FlexAdaptive.appleWeb]
  /// for a configuration that only changes the [Switch] style to be more like
  /// the iOS or Cupertino Switch when the app is run on iOS, macOS and web
  /// on iOS and macOS hosts.
  ///
  /// If activated and we are on platform where it is chosen to be used, only
  /// the [switchSchemeColor] property of the Switch theming properties
  /// will impact the style, other Switch theming properties will be ignored.
  ///
  /// This feature only has any impact when
  /// [FlexColorScheme.useMaterial3] is true.
  ///
  /// If not defined, defaults to [FlexAdaptive.off].
  final FlexAdaptive? switchAdaptiveCupertinoLike;

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
  /// disabled. By setting [unselectedToggleIsColored] to true, they
  /// use their themed color also in the unselected state.
  ///
  /// * The [Checkbox] and [Radio] use their theme color in the outline.
  /// * The [Switch] has just a hint of its themed color in it inactive track.
  ///
  /// Defaults to false, set it to for slightly different style.
  final bool unselectedToggleIsColored;

  /// The ColorScheme based color used on the [Slider] as its overall base
  /// color.
  ///
  /// If not defined, the [Slider] theme defaults to using the
  /// ambient theme's primary color.
  final SchemeColor? sliderBaseSchemeColor;

  /// The ColorScheme based color used on the [Slider]'s thumb color.
  ///
  /// If not defined, the [Slider] thumb defaults to using the
  /// [sliderBaseSchemeColor].
  final SchemeColor? sliderThumbSchemeColor;

  /// The ColorScheme based color used on the [Slider] indicator color.
  ///
  /// If not defined, the [Slider] theme defaults in M2 mode to a dark grey in
  /// light mode, and a light grey in dark mode. In M3 mode it uses the
  /// [sliderThumbSchemeColor] as its color if not defined and then to
  /// [sliderBaseSchemeColor], and defaulting to primary color if
  /// neither is defined.
  final SchemeColor? sliderIndicatorSchemeColor;

  /// If true, the value indicator becomes a tinted high contrast version of
  /// current [sliderIndicatorSchemeColor], with a bit of opacity.
  ///
  /// Default to false.
  final bool sliderValueTinted;

  // TODO(rydmike): RangeSlider to use real M3 style when supported.
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

  /// The border radius value for themed [InputDecoration].
  ///
  /// If not defined and [defaultRadius] is undefined, then defaults to:
  /// * [kInputDecoratorRadius] = 10dp, if [FlexColorScheme.useMaterial3]
  ///   is false.
  /// * [kInputDecoratorM3Radius] = 4dp, if [FlexColorScheme.useMaterial3]
  ///   is true.
  final double? inputDecoratorRadius;

  /// The [inputDecoratorRadiusAdaptive] has the same definition and usage as
  /// [inputDecoratorRadius], but is used as decorator radius on platforms
  /// as configured by [adaptiveInputDecoratorRadius].
  ///
  /// If you keep [inputDecoratorRadius] null for M3 default, try setting
  /// [inputDecoratorRadiusAdaptive] to 6 dp and
  /// [adaptiveInputDecoratorRadius] to [FlexAdaptive.iOSAndDesktop], for a
  /// more platform agnostic design on other platforms than Android and Fuchsia.
  ///
  /// If not defined, and [defaultRadiusAdaptive], [defaultRadius] and
  /// [inputDecoratorRadius] are undefined, then defaults to:
  /// * [kInputDecoratorRadius] = 10dp, if [FlexColorScheme.useMaterial3]
  ///   is false.
  /// * [kInputDecoratorM3Radius] = 4dp, if [FlexColorScheme.useMaterial3]
  ///   is true.
  final double? inputDecoratorRadiusAdaptive;

  /// Defines which [Theme] based [ColorScheme] color the input decorator
  /// uses as color for the border and for fill color when they are used.
  ///
  /// If not defined, in M3 mode border color defaults to primary and fill
  /// color to surfaceContainerHighest. In M2 mode border and fill color both
  /// default to primary.
  ///
  /// The border [inputDecoratorBorderSchemeColor] can be used to define the
  /// border color separately. It defaults to this color, if
  /// [inputDecoratorBorderSchemeColor] is not defined, and this color is.
  final SchemeColor? inputDecoratorSchemeColor;

  /// The padding for the input decoration's container.
  ///
  /// The decoration's container is the area which is filled if
  /// [InputDecoration.filled] is true and bordered per the
  /// [InputDecoration.border].
  /// It's the area adjacent to [InputDecoration.icon] and above the
  /// [InputDecoration.icon] and above the widgets that contain
  /// [InputDecoration.helperText], [InputDecoration.errorText], and
  /// [InputDecoration.counterText].
  ///
  /// By default the [inputDecoratorContentPadding] reflects
  /// [inputDecoratorIsDense] and the
  /// type of the [InputDecoration.border]. If [InputDecoration.isCollapsed]
  /// is true then [inputDecoratorContentPadding] is [EdgeInsets.zero].
  ///
  /// When [inputDecoratorIsDense] is true, the content padding can be made
  /// smaller and tighter than when it is false.
  ///
  /// If no [inputDecoratorContentPadding] is given, Flutter SDK uses default
  /// padding values that depends on if [inputDecoratorIsDense] is true or
  /// false and if we use outline or underline border.
  final EdgeInsetsGeometry? inputDecoratorContentPadding;

  /// Whether the input decorator's child is part of a dense form (i.e., uses
  /// less vertical space).
  ///
  /// Defaults to false.
  final bool? inputDecoratorIsDense;

  /// Determines if the [InputDecorator] is filled with a color.
  ///
  /// This property also affects if the fill color is used when not opting in
  /// on sub-themes. Giving an opportunity to make the past always filled input
  /// decorator even less opinionated.
  ///
  /// Defaults to false, if not defined.
  final bool? inputDecoratorIsFilled;

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
  /// defaults to [kFillColorLightOpacity] (0x0D = 5% opacity) in light theme
  /// and to [kFillColorDarkOpacity] (0x14 = 8% opacity) in dark mode.
  ///
  /// The border [inputDecoratorBorderSchemeColor] can be used to define the
  /// border color separately, but it defaults to this color if not defined.
  final int? inputDecoratorBackgroundAlpha;

  /// Defines which [Theme] based [ColorScheme] color the input decorator
  /// uses as color for the border color when it is defined to be used.
  ///
  ///
  /// If not defined and [inputDecoratorSchemeColor] is also not defined, then
  /// in M3 and M2 mode, the border color defaults to primary.
  ///
  /// If not defined and [inputDecoratorSchemeColor] is defined, it defaults
  /// to the color given by [inputDecoratorSchemeColor].
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
  /// If undefined, defaults to [FlexInputBorderType.underline].
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
  /// Applies to both outline and underline mode. Does not have any effect
  /// if [inputDecoratorUnfocusedHasBorder] is false.
  ///
  /// The default design in FlexColorScheme when this is true, creates
  /// unfocused border that use [inputDecoratorSchemeColor] as it s color with
  /// alpha set to [kEnabledBorderOpacity] (90%) using the [thinBorderWidth] as
  /// its width.
  ///
  /// When false the border/underline will revert back to using Flutter M2
  /// defaults when unselected, which is [ColorScheme.onSurface] with 38%
  /// opacity.
  ///
  /// The unfocused border color selection also applies to it hovered state.
  ///
  /// If undefined, defaults to false.
  final bool? inputDecoratorUnfocusedBorderIsColored;

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

  /// The icon color of the suffixIcon in a focused [InputDecoration].
  ///
  /// If not defined, defaults to [inputDecoratorSchemeColor] in FCS M2 and to
  /// [SchemeColor.onSurface] in FCS M3.
  final SchemeColor? inputDecoratorSuffixIconSchemeColor;

  /// The [SchemeColor] based color of the cursor in the text field.
  ///
  /// The cursor indicates the current location of text insertion point in
  /// the field.
  ///
  /// If not defined, defaults to [inputDecoratorSchemeColor] and if it is
  /// not defined [ColorScheme.primary] is used.
  final SchemeColor? inputCursorSchemeColor;

  /// The [SchemeColor] based background color of selected text.
  ///
  /// If not defined, defaults to [inputDecoratorSchemeColor] and if it is
  /// not defined [ColorScheme.primary] is used.
  final SchemeColor? inputSelectionSchemeColor;

  /// The opacity applied to [inputSelectionSchemeColor].
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
  /// defined to [SchemeColor.primary] same as Flutter SDK default.
  final SchemeColor? inputSelectionHandleSchemeColor;

  /// Defines the color used for icons and text when the [ListTile] is
  /// selected.
  ///
  /// If not defined, defaults to [ColorScheme.primary].
  final SchemeColor? listTileSelectedSchemeColor;

  /// Defines the default color for [ListTile.leading] and
  /// [ListTile.trailing] icons.
  ///
  /// If this property is null and [ListTile.selected] is false then this
  /// color is used.
  ///
  /// If null and [ThemeData.useMaterial3] is true,
  /// [ColorScheme.onSurfaceVariant] is used, otherwise in M2 and if
  /// [ThemeData.brightness] is [Brightness.light], [Colors.black54] is used,
  /// and if [ThemeData.brightness] is [Brightness.dark], the value is null.
  ///
  /// If [ListTile.selected] is true then [listTileSelectedSchemeColor] is
  /// used. If it is null then [ColorScheme.primary] is used.
  final SchemeColor? listTileIconSchemeColor;

  /// Defines the text color for the [ListTile.title], [ListTile.subtitle],
  /// [ListTile.leading] and [ListTile.trailing] widgets when they are [Text].
  ///
  /// If this property is null and [ListTile.selected] is false then
  /// [ListTileThemeData.textColor] is used. If that is also null then
  /// default text color is used for the [ListTile.title], [ListTile.subtitle],
  /// [ListTile.leading], and [ListTile.trailing]. Except for
  /// [ListTile.subtitle], if [ThemeData.useMaterial3] is false,
  /// [TextTheme.bodySmall] is used.
  ///
  /// If this property is null and [ListTile.selected] is true then
  /// [ListTileThemeData.selectedColor] is used. If that is also null
  /// then [ColorScheme.primary] is used.
  ///
  /// If this color is a [WidgetStateColor] it will be resolved against
  /// [WidgetState.selected] and [WidgetState.disabled] states.
  final SchemeColor? listTileTextSchemeColor;

  /// The text style for ListTile's [ListTile.title].
  ///
  /// If this property is null, then [ListTileThemeData.titleTextStyle] is
  /// used.
  ///
  /// If that is also null and [ThemeData.useMaterial3] is true,
  /// [TextTheme.bodyLarge] with [ColorScheme.onSurface] will be used.
  ///
  /// Otherwise, If ListTile style is [ListTileStyle.list],
  /// [TextTheme.titleMedium] will be used and if ListTile style
  /// is [ListTileStyle.drawer], [TextTheme.bodyLarge] will be used.
  final TextStyle? listTileTitleTextStyle;

  /// The text style for ListTile's [ListTile.subtitle].
  ///
  /// If this property is null, then [ListTileThemeData.subtitleTextStyle]
  /// is used.
  ///
  /// If that is also null and [ThemeData.useMaterial3] is true,
  /// [TextTheme.bodyMedium] with [ColorScheme.onSurfaceVariant] will be used,
  /// otherwise [TextTheme.bodyMedium] with [TextTheme.bodySmall] color will
  /// be used.
  final TextStyle? listTileSubtitleTextStyle;

  /// The text style for ListTile's [ListTile.leading] and [ListTile.trailing].
  ///
  /// If this property is null, then
  /// [ListTileThemeData.leadingAndTrailingTextStyle] is used.
  ///
  /// If that is also null and [ThemeData.useMaterial3] is true,
  /// [TextTheme.labelSmall] with [ColorScheme.onSurfaceVariant] will be used,
  /// otherwise [TextTheme.bodyMedium] will be used.
  final TextStyle? listTileLeadingAndTrailingTextStyle;

  /// Defines the background color of [ListTile] when
  /// [ListTile.selected] is false.
  ///
  /// If this property is null and [ListTile.selected] is false then
  /// [ListTileThemeData.tileColor] is used. If that is also null and
  /// [ListTile.selected] is true, [ListTile.selectedTileColor] is used.
  ///
  /// When that is also null, the [ListTileTheme.selectedTileColor] is used,
  /// otherwise [Colors.transparent] is used.
  final SchemeColor? listTileTileSchemeColor;

  /// Defines the background color of [ListTile] when
  /// [ListTile.selected] is true.
  ///
  /// When the value if null, the [ListTile.selectedTileColor] is set to
  /// [ListTileTheme.selectedTileColor] if it's not null and to
  /// [Colors.transparent] if it's null.
  final SchemeColor? listTileSelectedTileSchemeColor;

  /// The ListTile's title internal padding.
  ///
  /// Insets a [ListTile]'s contents: its [ListTile.leading], [ListTile.title],
  /// [ListTile.subtitle] and [ListTile.trailing] widgets.
  ///
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used, if
  /// `useMaterial3` is `false`. If `useMaterial3` is `true` then
  /// `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` is used.
  final EdgeInsetsGeometry? listTileContentPadding;

  /// The horizontal gap between the [ListTile] titles and the leading/trailing
  /// widgets.
  ///
  /// If not defined, defaults to 16.
  final double? listTileHorizontalTitleGap;

  /// The minimum padding on the top and bottom of the [ListTile.title] and
  /// [ListTile.subtitle] widgets on the [ListTile].
  ///
  /// If not defined, defaults to 4.
  final double? listTileMinVerticalPadding;

  /// Defines the font used for the [ListTile.title].
  ///
  /// If this property is null then [ListTileThemeData.style] is used. If that
  /// is also null then [ListTileStyle.list] is used.
  final ListTileStyle? listTileStyle;

  /// Defines how [ListTile.leading] and [ListTile.trailing] are
  /// vertically aligned relative to the [ListTile]'s titles
  /// ([ListTile.title] and [ListTile.subtitle]).
  ///
  /// If this property is null then [ListTileThemeData.titleAlignment]
  /// is used. If that is also null then [ListTileTitleAlignment.threeLine]
  /// is used.
  final ListTileTitleAlignment? listTileTitleAlignment;

  /// If specified, overrides the default value of
  /// [CheckboxListTile.controlAffinity] or [ExpansionTile.controlAffinity]
  /// or [SwitchListTile.controlAffinity] or [RadioListTile.controlAffinity].
  ///
  /// This property does not yet have any theming support in Flutter 3.24, but
  /// probably coming in next release.
  final ListTileControlAffinity? listTileControlAffinity;

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
  /// Action Button (FABs) use as its background color.
  ///
  /// If not defined, effective default is [ColorScheme.secondary] color in M2
  /// and [ColorScheme.primaryContainer] in M3 via Flutter theme defaults.
  final SchemeColor? fabSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the Floating
  /// Action Button (FABs) uses as its foreground color.
  ///
  /// If not defined, effective default is the complement color to used
  /// [fabSchemeColor].
  final SchemeColor? fabForegroundSchemeColor;

  /// The text style for an extended [FloatingActionButton]'s label.
  final TextStyle? fabExtendedTextStyle;

  /// Border radius value for [Chip] widgets.
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kChipRadius] 8dp, based on M3 Specification
  /// https://m3.material.io/components/chips/specs
  final double? chipRadius;

  /// Defines if the [chipSelectedSchemeColor] and [chipSelectedSchemeColor]
  /// are alpha blended with the surface color.
  ///
  /// If not defined, defaults to false in Material-3 mode and to true
  /// in Material-2 mode.
  ///
  /// When true, the [chipSchemeColor] is alpha blended with the surface
  /// color using [kChipBackgroundAlphaBlend] alpha blend value.
  /// The [chipSelectedSchemeColor] is alpha blended with the surface color
  /// using [kChipSelectedBackgroundAlphaBlend] alpha blend value.
  final bool? chipBlendColors;

  /// Defines which [Theme] based [ColorScheme] based color the Chips
  /// use as their background base color.
  ///
  /// If not defined and [FlexColorScheme.useMaterial3] is true, it defaults
  /// [SchemeColor.surface].
  ///
  /// If not defined and [FlexColorScheme.useMaterial3] is false, it defaults
  /// [SchemeColor.primary] with a surface alpha blend of
  /// [kChipBackgroundAlphaBlend] applied, if [chipBlendColors] is true,
  /// which it defaults to in Material-2 mode.
  final SchemeColor? chipSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the selected Chips
  /// use as their selected state color.
  ///
  /// The color scheme contrast pair color is used for text and icons, on the
  /// [chipSelectedSchemeColor].
  ///
  /// If not defined and [FlexColorScheme.useMaterial3] is true, defaults to
  /// [SchemeColor.secondaryContainer].
  ///
  /// If not defined and [FlexColorScheme.useMaterial3] is false, defaults to
  /// [SchemeColor.secondaryContainer] if [chipBlendColors] is false.
  ///
  /// If [chipBlendColors] is true, defaults to [SchemeColor.primary] with
  /// a surface alpha blend of [kChipSelectedBackgroundAlphaBlend] applied.
  final SchemeColor? chipSelectedSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the selected
  /// [ChoiceChip] use as their selected state color.
  ///
  /// The color scheme contrast pair color is used for text and icons, on the
  /// [chipSecondarySelectedSchemeColor].
  ///
  /// If not defined and [FlexColorScheme.useMaterial3] is true, defaults to
  /// [chipSelectedSchemeColor].
  final SchemeColor? chipSecondarySelectedSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the Chips
  /// use as color of the delete icon.
  ///
  /// The selected color is only used as base for the [Chip] colors, it also
  /// uses alpha blend and opacity to create the effective Chip colors using
  /// the selected scheme color as base.
  ///
  /// If not defined it defaults to effective theme based color from using
  /// [SchemeColor.onSurfaceVariant] same as Material-3 default.
  final SchemeColor? chipDeleteIconSchemeColor;

  /// Overrides the default for [ChipAttributes.labelStyle],
  /// the style of the [DefaultTextStyle] that contains the
  /// chip's label.
  ///
  /// This only has an effect on label widgets that respect the
  /// [DefaultTextStyle], such as [Text].
  ///
  /// This property applies to [ActionChip], [Chip],
  /// [FilterChip], [InputChip], [RawChip].
  ///
  ///
  /// If not defined, defaults to `labelLarge` and if the default label large
  /// does not have a size defined yet, then defaults to 14.
  final TextStyle? chipLabelStyle;

  /// Overrides the default for [ChoiceChip.labelStyle],
  /// the style of the [DefaultTextStyle] that contains the
  /// chip's label.
  ///
  /// This only has an effect on label widgets that respect the
  /// [DefaultTextStyle], such as [Text].
  ///
  /// If not defined, defaults to `labelLarge` and if the default label large
  /// does not have a size defined yet, then defaults to 14.
  final TextStyle? chipSecondaryLabelStyle;

  /// Chip font size of the [chipLabelStyle].
  ///
  /// If defined, overrides the default font size used by either the
  /// default font of the default [chipLabelStyle] or the font size of the
  /// passed in [chipLabelStyle].
  ///
  /// If not defined the default text style font sizes are used, but if they
  /// did not have size defined, defaults 14.
  final double? chipFontSize;

  /// Chip font size of the [chipSecondaryFontSize].
  ///
  /// If defined, overrides the default font size used by either the
  /// default font of the default [chipSecondaryLabelStyle] or the font size of
  /// the passed in [chipSecondaryLabelStyle].
  ///
  /// If not defined, defaults to [chipFontSize].
  final double? chipSecondaryFontSize;

  /// Icon size used by the [IconTheme] used by [Chip]s.
  ///
  /// If not defined defaults to 18.
  final double? chipIconSize;

  /// Overrides the default for [ChipAttributes.padding],
  /// the padding between the contents of the chip and the chip edge.
  ///
  /// This property applies to [ActionChip], [Chip], [ChoiceChip],
  /// [FilterChip], [InputChip], [RawChip].
  ///
  /// If not defined, defaults to EdgeInsets.symmetric(horizontal: 8) in
  /// Material mode and to EdgeInsets.symmetric(horizontal: 4) in
  /// Material2 mode.
  final EdgeInsetsGeometry? chipPadding;

  /// Border radius value for [Card].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kCardRadius] 12dp, based on M3 Specification
  /// https://m3.material.io/components/cards/specs
  final double? cardRadius;

  /// Elevation of [Card].
  ///
  /// If not defined, defaults Flutter SDK defaults. For the default [Card]
  /// constructor this is 1.0. For [Card.filled] and [Card.outlined]
  /// constructors this is 0.0.
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
  /// To be on the safe side it only follows the [defaultRadius] to max 10.
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
  /// If not defined, then if [FlexColorScheme.useMaterial3] is:
  ///
  /// - false : defaults to [kPopupMenuM2Elevation] = 6 dp.
  /// - true  : defaults to [kPopupMenuM3Elevation] = 3 dp.
  final double? popupMenuElevation;

  /// The ColorScheme based color used as background color on [PopupMenuButton].
  ///
  /// If not defined, then if [FlexColorScheme.useMaterial3] is:
  /// - false : defaults to theme.cardColor.
  /// - true  : defaults to theme.colorScheme.surface.
  ///
  /// Usually they are the same.
  final SchemeColor? popupMenuSchemeColor;

  /// Popup menu background opacity.
  ///
  /// Defaults to undefined (null). If undefined, produced result is same as 1,
  /// fully opaque.
  final double? popupMenuOpacity;

  /// The [TextStyle] of the text entry in a [DropdownMenu].
  ///
  /// If not defined, defaults to [TextTheme.bodyLarge] this size matches
  /// the default on the menu entries and in a normal [TextField].
  /// Flutter SDK defaults via widget default to [TextTheme.labelLarge]. This
  /// does not match the default of the entries or the [TextField] and looks
  /// bad. This styling issue is discussed in issue:
  /// https://github.com/flutter/flutter/issues/131350
  final TextStyle? dropdownMenuTextStyle;

  /// The border radius of [MenuBar], [MenuAnchor] and [DropdownMenu]
  /// containers.
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
  /// To be on the safe side it only follows the [defaultRadius] to max 10.
  ///
  /// The built-in behavior in FlexColorScheme allows it to match at low
  /// inherited default radius values, but to also stay below the usable max
  /// rounding automatically at higher global default border radius values.
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to 4dp based on
  /// widget default behavior, that is based on M3 Specification
  /// https://m3.material.io/components/menus/specs.
  final double? menuRadius;

  /// The elevation of [MenuBar], [MenuAnchor] and [DropdownMenu] containers.
  ///
  /// If not defined, defaults to 3 via Flutter SDK default.
  final double? menuElevation;

  /// The ColorScheme based color used as background color on [MenuBar],
  /// [MenuAnchor] and [DropdownMenu].
  ///
  /// If not defined, defaults to surface.
  final SchemeColor? menuSchemeColor;

  /// Menu background opacity.
  ///
  /// Used by FlexColorScheme to modify the opacity the themed [MenuBar],
  /// [MenuAnchor] and [DropdownMenu] background color.
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

  /// The style for a menu button's [Text] widget descendants.
  ///
  /// The color of the [menuButtonTextStyle] is typically not used directly, the
  /// [menuSchemeColor] complement pair is used instead.
  final WidgetStateProperty<TextStyle?>? menuButtonTextStyle;

  /// Select which color from active [ColorScheme] to use as background color
  /// for the [MenuBar].
  ///
  /// If not defined, defaults to [menuSchemeColor].
  final SchemeColor? menuBarBackgroundSchemeColor;

  /// The border radius of the [MenuBar] container.
  ///
  /// If not defined, defaults to 4.
  ///
  /// Flutter SDK defaults to 4.0, but M3 spec does not show rounded corners
  /// on MenuBar components, but as of Aug 28, 2024, there is no spec for it
  /// either, see https://m3.material.io/components/menus/guidelines
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
  /// If not defined, defaults to [ColorScheme.shadow] via Flutter SDK
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
  /// If not defined, defaults to [menuItemBackgroundSchemeColor] and the
  /// indicator only get overlay color for hover, focus and press states.
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

  /// The search bar's background fill color.
  ///
  /// If null, the default value is `surfaceContainerHigh`.
  final SchemeColor? searchBarBackgroundSchemeColor;

  /// The search view's background fill color.
  ///
  /// If null, the default value is `surfaceContainerHigh`.
  final SchemeColor? searchViewBackgroundSchemeColor;

  /// The elevation of the search bar's [Material].
  ///
  /// If null, default value is 6.0.
  final double? searchBarElevation;

  /// The elevation of the search bar's [Material].
  ///
  /// If null, default value is 6.0.
  final double? searchViewElevation;

  /// The border radius of the search bar's underlying [Material].
  ///
  /// If not defined defaults to Stadium shape.
  final double? searchBarRadius;

  /// The border radius of the search view's underlying [Material].
  ///
  /// If not defined defaults to 28.0.
  /// If in full screen defaults to 0.
  final double? searchViewRadius;

  /// Use global shape theming on SearchBar and SearchView.
  ///
  /// When [searchUseGlobalShape] is `true`, and if either [searchBarRadius] or
  /// [searchViewRadius] properties are not to defined the global shape and
  /// radius are used as their default.
  ///
  /// Defaults to false, global radius [defaultRadius] or
  /// [defaultRadiusAdaptive] are not used.
  final bool searchUseGlobalShape;

  /// The height of the search field on the search view.
  ///
  /// If null, the default value is 56.0.
  final double? searchViewHeaderHeight;

  /// The style to use for the text being edited in the search bar.
  ///
  /// If null, defaults to the `bodyLarge` text style from the current
  /// [Theme]. The default text color is [ColorScheme.onSurface].
  final WidgetStateProperty<TextStyle?>? searchBarTextStyle;

  /// The style to use for the text being edited in the search view.
  ///
  /// If null, defaults to the `bodyLarge` text style from the current
  /// [Theme]. The default text color is [ColorScheme.onSurface].
  final TextStyle? searchViewHeaderTextStyle;

  /// The style to use for the hint text in the search bar.
  ///
  /// If null, defaults to `bodyLarge` text style from the current [Theme].
  /// The default text color is [ColorScheme.onSurfaceVariant].
  final WidgetStateProperty<TextStyle?>? searchBarHintStyle;

  /// The style to use for the hint text in the search view.
  ///
  /// If null, defaults to `bodyLarge` text style from the current [Theme].
  /// The default text color is [ColorScheme.onSurfaceVariant].
  final TextStyle? searchViewHeaderHintStyle;

  /// The color of the divider on the search view.
  ///
  /// If this property is null, the default value is
  /// `ThemeData.dividerTheme.color` if it is null, then the default value is
  /// [ColorScheme.outline].
  final Color? searchViewDividerColor;

  /// The shadow color of the search bar's [Material].
  ///
  /// If null, the default value is [ColorScheme.shadow].
  final Color? searchBarShadowColor;

  /// Configures how the platform keyboard will select an uppercase or
  /// lowercase keyboard for the search bar input field.
  ///
  /// Only supports text keyboards, other keyboard types will ignore this
  /// configuration. Capitalization is locale-aware.
  ///
  /// If not defined, defaults to [TextCapitalization.none]
  final TextCapitalization? searchBarTextCapitalization;

  /// The padding between the search bar's boundary and its contents.
  ///
  /// If null, then the default value is 16.0 horizontally.
  final EdgeInsetsGeometry? searchBarPadding;

  /// Optional size constraints for the search bar.
  ///
  /// If null, the value of [SearchBarThemeData.constraints] will be used. If
  /// this is also null, then the constraints defaults to:
  ///
  /// ```dart
  /// const BoxConstraints(minWidth: 360.0, maxWidth: 800.0, minHeight: 56.0)
  /// ```
  final BoxConstraints? searchBarConstraints;

  /// Optional size constraints for the search view.
  ///
  /// By default, the search view has the same width as the anchor and is 2/3
  /// the height of the screen. If the width and height of the view are within
  /// the view constraints, the view will show its default size. Otherwise,
  /// the size of the view will be constrained by this property.
  ///
  /// If null, the constraints defaults to:
  ///
  /// ```dart
  /// const BoxConstraints(minWidth: 360.0, minHeight: 240.0)
  /// ```
  final BoxConstraints? searchViewConstraints;

  /// Border radius value for [Tooltip].
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

  /// The ColorScheme based color used as background color on [Tooltip]s.
  ///
  /// If defined this overrides the style set via
  /// [FlexColorScheme.tooltipsMatchBackground].
  ///
  /// If not defined, defaults to FCS default styling, see
  /// [FlexColorScheme.tooltipsMatchBackground] for details.
  final SchemeColor? tooltipSchemeColor;

  /// Tooltip background opacity.
  ///
  /// If defined this overrides the default tooltip opacity included via
  /// [FlexColorScheme.tooltipsMatchBackground].
  ///
  /// If not defined, defaults to 95% if [tooltipSchemeColor] is not defined
  /// and tooltip uses custom default color. If [tooltipSchemeColor] is defined
  /// then defaults to 100%. Set a value to define it as usual.
  ///
  /// See [FlexColorScheme.tooltipsMatchBackground] for additional details.
  final double? tooltipOpacity;

  /// Set to true to use the app overall app [InputDecoration] theme in
  /// dialogs themes.
  ///
  /// Currently only applies to [TimePickerThemeData], will later also be used
  /// by [DatePickerDialog] theme when it becomes supported.
  ///
  /// If not defined, defaults to false.
  final bool? useInputDecoratorThemeInDialogs;

  /// Border radius value for [Dialog].
  ///
  /// If not defined and [defaultRadius] is undefined, defaults to
  /// [kDialogRadius] 28dp, based on M3 Specification
  /// https://m3.material.io/components/dialogs/specs
  final double? dialogRadius;

  /// The [dialogRadiusAdaptive] has the same definition and usage
  /// [dialogRadius], but is used as default radius on platforms as configured
  /// by [adaptiveDialogRadius].
  ///
  /// If you keep [dialogRadius] null for M3 default, try setting
  /// [dialogRadiusAdaptive] to 12 dp and [adaptiveDialogRadius] to
  /// [FlexAdaptive.iOSAndDesktop], for a more platform agnostic design on
  /// other platforms and Android and Fuchsia.
  ///
  /// Defaults to null, M3 defaults are used per widget.
  /// If not defined and [dialogRadius], [defaultRadiusAdaptive] and
  /// [defaultRadius] are undefined, defaults to [kDialogRadius] 28dp,
  /// based on M3 specification https://m3.material.io/components/dialogs/specs
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

  /// Defines which [Theme] based [ColorScheme] color, dialogs use as
  /// their background color.
  ///
  /// This will affect default background color in [DialogThemeData] and
  /// [TimePickerThemeData].
  ///
  /// If undefined, dialogs will use Flutter SDK default, which is
  /// [ColorScheme.surface] in Material-2 mode and
  /// [ColorScheme.surfaceContainerHigh] in Material-3 mode.
  final SchemeColor? dialogBackgroundSchemeColor;

  /// Overrides the default value for [DefaultTextStyle] for
  /// [SimpleDialog.title] and [AlertDialog.title].
  final TextStyle? dialogTitleTextStyle;

  /// Overrides the default value for [DefaultTextStyle] for
  /// [SimpleDialog.children] and [AlertDialog.content].
  final TextStyle? dialogContentTextStyle;

  /// The background color of the header in a [DatePickerDialog].
  ///
  /// If not defined, default to [ColorScheme.primary] in Material-2 and to
  /// [ColorScheme.surfaceContainerHigh] in Material-3.
  ///
  /// The foreground color automatically defaults to the correct contrast pair
  /// for used [SchemeColor].
  final SchemeColor? datePickerHeaderBackgroundSchemeColor;

  /// Defines the foreground color of the header in a [DatePickerDialog],
  /// used for text labels and icons.
  ///
  /// The dialog's header displays the currently selected date.
  ///
  /// This is used instead of the [TextStyle.color] property of
  /// [datePickerHeaderHeadlineStyle] and
  /// [datePickerRangePickerHeaderHelpStyle].
  ///
  /// If not defined, defaults to correct contrast pair for the used
  /// [datePickerHeaderBackgroundSchemeColor], with a preference to
  /// [SchemeColor.onSurfaceVariant] if any surface color is used as the
  /// background color.
  final SchemeColor? datePickerHeaderForegroundSchemeColor;

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

  /// The color of the divider in the [DatePickerDialog].
  ///
  /// If not defined, defaults to [ColorScheme.outlineVariant] in M3. In M2
  /// the divider does not exist in the [DatePickerDialog] build.
  ///
  /// Set it to [SchemeColor.transparent] to get rid of the divider in M3.
  final SchemeColor? datePickerDividerSchemeColor;

  /// Overrides the date picker header's default headline text style.
  ///
  /// The dialog's header displays the currently selected date.
  ///
  /// The [TextStyle.color] of the [datePickerHeaderHeadlineStyle] is not used,
  /// the [datePickerHeaderForegroundSchemeColor] is used instead.
  final TextStyle? datePickerHeaderHeadlineStyle;

  /// Overrides the date picker header's default help text style.
  ///
  /// The help text (also referred to as "supporting text" in the Material
  /// spec) is usually a prompt to the user at the top of the header
  /// (i.e. 'Select date').
  ///
  /// The [TextStyle.color] of the [datePickerHeaderHelpStyle] is not used,
  /// the [datePickerHeaderForegroundSchemeColor] is used instead.
  final TextStyle? datePickerHeaderHelpStyle;

  /// Overrides the default text style used for the row of weekday
  /// labels at the top of the date picker grid.
  final TextStyle? datePickerWeekdayStyle;

  /// Overrides the default text style used for each individual day
  /// label in the grid of the date picker.
  ///
  /// The [TextStyle.color] of the [datePickerDayStyle] is not used,
  /// day foreground color is used instead.
  final TextStyle? datePickerDayStyle;

  /// Overrides the default text style used to paint each of the year
  /// entries in the year selector of the date picker.
  ///
  /// The [TextStyle.color] of the [datePickerYearStyle] is not used,
  /// year foreground color is used instead.
  final TextStyle? datePickerYearStyle;

  /// Overrides the default text style used for the headline text in
  /// the header of a full screen [DateRangePickerDialog].
  ///
  /// The dialog's header displays the currently selected date range.
  ///
  /// The [TextStyle.color] of [datePickerRangePickerHeaderHeadlineStyle] is
  /// not used, range picker Header ForegroundColor is used instead.
  final TextStyle? datePickerRangePickerHeaderHeadlineStyle;

  /// Overrides the default text style used for the help text of the
  /// header of a full screen [DateRangePickerDialog].
  ///
  /// The help text (also referred to as "supporting text" in the Material
  /// spec) is usually a prompt to the user at the top of the header
  /// (i.e. 'Select date').
  ///
  /// The [TextStyle.color] of the [datePickerRangePickerHeaderHelpStyle] is
  /// not used, the range picker Header ForegroundColor is used instead.
  final TextStyle? datePickerRangePickerHeaderHelpStyle;

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

  /// Used to configure the [TextStyle]s for the day period control.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [TextTheme.titleMedium].
  final TextStyle? timePickerDayPeriodTextStyle;

  /// The [TextStyle] for the numbers on the time selection dial.
  ///
  /// If [timePickerDialTextStyle]'s [TextStyle.color] is a [WidgetStateColor],
  /// then the effective text color can depend on the [WidgetState.selected]
  /// state, i.e. if the text is selected or not.
  ///
  /// If this style is null then the dial's text style is based on the theme's
  /// [ThemeData.textTheme].
  final TextStyle? timePickerDialTextStyle;

  /// Used to configure the [TextStyle]s for the helper text in the header.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [TextTheme.labelSmall].
  final TextStyle? timePickerHelpTextStyle;

  /// Used to configure the [TextStyle]s for the hour/minute controls.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [TextTheme.displayMedium].
  final TextStyle? timePickerHourMinuteTextStyle;

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

  /// Used to configure the [DefaultTextStyle] for the [SnackBar.content]
  /// widget.
  ///
  /// If null, [SnackBar] defines its default using titleMedium
  final TextStyle? snackBarContentTextStyle;

  /// Defines which [Theme] based [ColorScheme] based color the [AppBar]
  /// background uses.
  ///
  /// If not defined, [AppBar] uses the color defined in
  /// [FlexColorScheme.appBarBackground]. If made with [FlexColorScheme.light]
  /// or [FlexColorScheme.dark], then the enum [FlexAppBarStyle] in parameter
  /// `appBarStyle`, is used to determine the [AppBar] color and background.
  ///
  /// The themed [AppBar] background color is typically determined by defined
  /// [FlexAppBarStyle] in [FlexColorScheme.light] or [FlexColorScheme.dark].
  /// This property is an override that offers more quick config options by
  /// allowing picking a color from the effective [ColorScheme] different from
  /// options offered via [FlexColorScheme.light] and [FlexColorScheme.dark]
  /// ([appBarStyle) factory parameter.
  final SchemeColor? appBarBackgroundSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the [AppBar]
  /// foreground uses.
  ///
  /// If not defined, it uses the onPair complement color to the
  /// [appBarBackgroundSchemeColor]. If it is not defined, then
  /// [AppBar] uses the default contrast color defined for
  /// [FlexColorScheme.appBarBackground].
  final SchemeColor? appBarForegroundSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the [AppBar]
  /// main icon uses as foreground color. The AppBar main icon is the one on
  /// the start side of the AppBar.
  ///
  /// If not defined, it uses the [appBarForegroundSchemeColor], if it is
  /// not defined either, it uses the onPair complement color to the
  /// [appBarBackgroundSchemeColor].
  final SchemeColor? appBarIconSchemeColor;

  /// Defines which [Theme] based [ColorScheme] based color the [AppBar]
  /// actions icons use as foreground color. The AppBar actions icons are the
  /// ones on the end side of the AppBar.
  ///
  /// If not defined, they uses the [appBarForegroundSchemeColor], if it is
  /// not defined either, they use the onPair complement color to the
  /// [appBarBackgroundSchemeColor].
  final SchemeColor? appBarActionsIconSchemeColor;

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

  /// Overrides the default value of the [AppBar.toolbarTextStyle]
  /// property in all descendant [AppBar] widgets.
  final TextStyle? appBarToolbarTextStyle;

  /// Overrides the default value of [AppBar.titleTextStyle]
  /// property in all descendant [AppBar] widgets.
  final TextStyle? appBarTitleTextStyle;

  /// Defines which [Theme] based [ColorScheme] based color the [BottomAppBar]
  /// uses as background color.
  ///
  /// The [BottomAppBarTheme] has no properties for foreground color. If you use
  /// a background color that requires different contrast color than the
  /// active theme's surface colors, you will need to set their colors on
  /// widget level.
  ///
  /// If not defined, defaults to `surfaceContainer` in Material-3 mode
  /// and to `surface`in Material-2 mode.
  final SchemeColor? bottomAppBarSchemeColor;

  /// The double value used to indicate the height of the [BottomAppBar].
  ///
  /// In Material-2, the default value is the minimum in relation to content.
  /// In Material-3, it is 80dp.
  final double? bottomAppBarHeight;

  /// Defines which [Theme] based [ColorScheme] based color the [TabBar]
  /// items use.
  ///
  /// If not defined, then [TabBar] uses the enum [FlexTabBarStyle] parameter
  /// `tabBarStyle`] in factories [FlexColorScheme.light] or
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
  /// then [TabBar] uses the enum [FlexTabBarStyle] parameter
  /// `tabBarStyle`] in factories [FlexColorScheme.light] or
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
  /// tab's overall bounds if [tabBarIndicatorSize] is [TabBarIndicatorSize.tab]
  /// (the default) or relative to the bounds of the tab's widget if
  /// [tabBarIndicatorSize] is [TabBarIndicatorSize.label].
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
  /// If null and [ThemeData.useMaterial3] is true,
  /// [TabBarThemeData.dividerColor]
  /// color is used. If that is null and [ThemeData.useMaterial3] is true,
  /// [ColorScheme.outlineVariant] will be used, otherwise divider will
  /// not be drawn.
  final Color? tabBarDividerColor;

  // TODO(rydmike): Open issue about using TabAlignment. Theme variant issue.
  /// Specifies the horizontal alignment of the tabs within a [TabBar].
  ///
  /// If [TabBar.isScrollable] is false, only [TabAlignment.fill] and
  /// [TabAlignment.center] are supported. Otherwise an exception is thrown.
  ///
  /// If [TabBar.isScrollable] is true, only [TabAlignment.start],
  /// [TabAlignment.startOffset], and [TabAlignment.center] are supported.
  /// Otherwise an exception is thrown.
  ///
  /// If this is null, then the value of [TabBarThemeData.tabAlignment] is used.
  ///
  /// If [TabBarThemeData.tabAlignment] is null and [ThemeData.useMaterial3] is
  /// true, then [TabAlignment.startOffset] is used if [TabBar.isScrollable]
  /// is true, otherwise [TabAlignment.fill] is used.
  ///
  /// If [TabBarThemeData.tabAlignment] is null and [ThemeData.useMaterial3] is
  /// false, then [TabAlignment.center] is used if [TabBar.isScrollable] is
  /// true, otherwise [TabAlignment.fill] is used.
  ///
  /// In Material-3 the default is [TabAlignment.startOffset] if [TabBar]
  /// property [TabBar.isScrollable] is true, if false the default is
  /// [TabAlignment.fill].
  ///
  /// In Material-2 the default is [TabAlignment.start] if [TabBar] property
  /// [TabBar.isScrollable] is true, if false, the default is
  /// [TabAlignment.fill].
  ///
  /// **NOTE:**
  ///
  /// [TabAlignment.start] and [TabAlignment.startOffset] are only usable
  /// when widget sets [TabBar.isScrollable] to true. If used when
  /// [TabBar.isScrollable] is false, the [TabBar] will throw an exception
  /// error.
  ///
  /// Likewise [TabAlignment.fill] is only usable when widgets sets
  /// [TabBar.isScrollable] to false. If used when [TabBar.isScrollable] is
  /// true, the [TabBar] will throw an exception error.
  ///
  /// Only universal theming option usable in a theme, other than widget
  /// default behavior is [TabAlignment.center]. This is not a good
  /// design setup. We need to be able to specify the themed alignment
  /// for both scrollable and non-scrollable [TabBar]s so we can style them
  /// with different alignments. That do not throw for the used [TabBar]
  /// variant.
  final TabAlignment? tabBarTabAlignment;

  /// Specifies the animation behavior of the tab indicator in a [TabBar].
  ///
  /// If not defined, the tab indicator will animate linearly if
  /// the [tabBarIndicatorSize] is [TabBarIndicatorSize.tab], otherwise it will
  /// animate with an elastic effect if the [tabBarIndicatorSize] is
  /// [TabBarIndicatorSize.label].
  final TabIndicatorAnimation? tabBarIndicatorAnimation;

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
  /// If not defined, defaults to [SchemeColor.surfaceContainerLow].
  ///
  /// Flutter SDK uses surfaceContainerLow color as default in M3 and
  /// ThemeData's canvasColor in M2 mode, which is Colors.grey(50) in
  /// light mode and Colors.grey(850) in dark mode.
  final SchemeColor? drawerBackgroundSchemeColor;

  /// Defines the width of [Drawer] and [NavigationDrawer].
  ///
  /// If not defined, defaults to 304dp via Flutter SDK defaults for both
  /// M2 and M3.
  ///
  /// M3 spec has it at 360dp for [NavigationDrawer], but
  /// Flutter still uses 304dp as default in M3 mode.
  ///
  /// For more info see issue: https://github.com/flutter/flutter/issues/123380
  final double? drawerWidth;

  /// Defines the width of [NavigationDrawer]'s indicator.
  ///
  /// If [drawerWidth] is defined and [drawerIndicatorWidth] is not, then
  /// [drawerIndicatorWidth] will be [drawerWidth] - 2 * 12, where 12dp is the
  /// M3 padding spec around the indicator.
  ///
  /// If not defined, and [drawerWidth] is not defined it defaults to 336dp
  /// via Flutter SDK defaults for M3/M2. The 336dp width value is derived
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
  /// [drawerBackgroundSchemeColor], when [drawerSelectedItemSchemeColor] is
  /// undefined, defaults to [SchemeColor.onSurfaceVariant].
  ///
  /// By default also uses [SchemeColor.onSurfaceVariant] as contrast color pair
  /// for [drawerBackgroundSchemeColor] when it uses any surface color.
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
  /// If null, defaults to [kBottomSheetElevation] = 1, if
  /// [FlexColorScheme.useMaterial3]
  /// is true, and to [kBottomSheetElevationM2] = 4, if
  /// [FlexColorScheme.useMaterial3] is false.
  final double? bottomSheetElevation;

  /// Elevation of modal [BottomSheet].
  ///
  /// If null, defaults to [kBottomSheetModalElevation] = 2, if
  /// [FlexColorScheme.useMaterial3] is true, and to
  /// [kBottomSheetModalElevationM2] = 8 if [FlexColorScheme.useMaterial3]
  /// is false.
  final double? bottomSheetModalElevation;

  /// Defines the bottom sheet's [Material.clipBehavior]
  /// by overriding the default value for [BottomSheet.clipBehavior].
  ///
  /// Use this property to enable clipping of content when the bottom sheet
  /// has a custom shape and the content can extend past this shape.
  /// For example, a bottom sheet with rounded corners and an edge-to-edge
  /// [Image] at the top.
  ///
  /// If this property is null then then the behavior will be [Clip.none],
  /// via Flutter's default values.
  final Clip? bottomSheetClipBehavior;

  // ---------------------------------------------------------------------------
  //
  // BottomNavigationBar Properties
  //
  // ---------------------------------------------------------------------------

  /// Optional text style for the [BottomNavigationBar] labels.
  ///
  /// If not defined, the text style [TextTheme.bodyMedium]
  /// will be used as base style for the text style.
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
  /// on unselected items. Defaults to [bottomNavigationBarSelectedLabelSize]-2,
  /// but min 8. Smaller than 8dp is not legible on most screens.
  ///
  /// [BottomNavigationBar] uses this -2dp smaller font on the unselected
  /// label as default, since it is so based on Material 2 spec. By assigning
  /// same value as to selectedLabelSize, you can make them the same size.
  final double? bottomNavigationBarUnselectedLabelSize;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [BottomNavigationBar]'s selected label text color.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  final SchemeColor? bottomNavigationBarSelectedLabelSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [BottomNavigationBar]'s unselected label text color.
  ///
  /// When undefined, if [bottomNavigationBarBackgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [bottomNavigationBarBackgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [bottomNavigationBarBackgroundSchemeColor] is also
  /// undefined, then in Material-3 this defaults to
  /// [SchemeColor.onSurfaceVariant] and in Material-2 to
  /// [SchemeColor.onSurface].
  ///
  /// Flutter SDK defaults to [ThemeData.unselectedWidgetColor] which is
  /// [Colors.black54] in light mode and [Colors.white70] in dark.
  final SchemeColor? bottomNavigationBarUnselectedLabelSchemeColor;

  /// If true, the unselected label in the [BottomNavigationBar] use a more
  /// muted color version of the color defined by
  /// [bottomNavigationBarUnselectedLabelSchemeColor].
  ///
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to true in Material-2 and to false in Material-3.
  ///
  /// When true, this is visually similar to the default styling used in
  /// Material-2, but it is on purpose not an exact match, it is bit more
  /// color expressive.
  final bool? bottomNavigationBarMutedUnselectedLabel;

  /// The size of the icon on selected [BottomNavigationBar] item.
  ///
  /// If undefined, defaults to 24.
  final double? bottomNavigationBarSelectedIconSize;

  /// The size of the icon on unselected [BottomNavigationBar] items.
  ///
  /// If undefined, defaults to [bottomNavigationBarSelectedIconSize].
  final double? bottomNavigationBarUnselectedIconSize;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [BottomNavigationBar]'s selected item icon color.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.primary].
  ///
  /// If this property and all other
  /// icon modifying properties are undefined, the effective color will be
  /// [ColorScheme.primary] in light and [ColorScheme.dark] in dark theme mode.
  final SchemeColor? bottomNavigationBarSelectedIconSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use for
  /// the [BottomNavigationBar]'s unselected items icon color.
  ///
  /// When undefined, if [bottomNavigationBarBackgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [bottomNavigationBarBackgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [bottomNavigationBarBackgroundSchemeColor] is also
  /// undefined, then in Material-3 this defaults to
  /// [SchemeColor.onSurfaceVariant] and in Material-2 to
  /// [SchemeColor.onSurface].
  ///
  /// Flutter SDK defaults to [ThemeData.unselectedWidgetColor] which is
  /// [Colors.black54] in light mode and [Colors.white70] in dark.
  final SchemeColor? bottomNavigationBarUnselectedIconSchemeColor;

  /// If true, the unselected icon in the [BottomNavigationBar] use a more muted
  /// color version of the color defined by
  /// [bottomNavigationBarUnselectedIconSchemeColor].
  ///
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to true in Material-2 and to false in Material-3.
  ///
  /// When true, this is visually similar to the default styling used in
  /// Material-2, but it is on purpose not an exact match, it is bit more
  /// color expressive.
  final bool? bottomNavigationBarMutedUnselectedIcon;

  /// Select which color from the theme's [ColorScheme] to use as background
  /// color for the [BottomNavigationBar].
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  ///
  /// If undefined, defaults to [SchemeColor.surface].
  final SchemeColor? bottomNavigationBarBackgroundSchemeColor;

  /// BottomNavigationBar background opacity.
  ///
  /// If undefined, default to 1, fully opaque.
  final double? bottomNavigationBarOpacity;

  /// Elevation of [BottomNavigationBar].
  ///
  /// If not defined, defaults to [kBottomNavigationBarElevation] = 3
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
  /// If undefined, defaults to Flutter SDK default.
  ///
  /// The default behavior is
  /// [BottomNavigationBarType.fixed] for 3 or fewer items, and
  /// [BottomNavigationBarType.shifting] is used for 4+ items.
  final BottomNavigationBarType? bottomNavigationBarType;

  /// The arrangement of the [BottomNavigationBar.items] when the enclosing
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
  /// The text style [TextTheme.labelMedium]  will be used as base style for the
  /// text style.
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

  /// Select which color from the passed in [ColorScheme] to use for
  /// the [NavigationBar]'s label text color.
  ///
  /// When undefined, if [navigationBarBackgroundSchemeColor] is defined, its
  /// contrasting on color will be used, if it is also undefined
  /// [SchemeColor.onSurface] will be used, which is also Flutter SDK default.
  final SchemeColor? navigationBarSelectedLabelSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationBar]'s unselected label text color.
  ///
  /// When undefined, if [navigationBarBackgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [navigationBarBackgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [navigationBarBackgroundSchemeColor] is also undefined,
  /// then this defaults to [SchemeColor.onSurfaceVariant].
  ///
  /// Flutter SDK defaults to [ColorScheme.onSurface] in M2 mode and
  /// [ColorScheme.onSurfaceVariant] in M3 mode.
  final SchemeColor? navigationBarUnselectedLabelSchemeColor;

  /// If true, the unselected label in the [NavigationBar] use a more
  /// muted color version of the color defined by
  /// [navigationBarUnselectedLabelSchemeColor].
  ///
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to false.
  final bool? navigationBarMutedUnselectedLabel;

  /// The size of the icon on selected [NavigationBar] item.
  ///
  /// If undefined, defaults to 24.
  final double? navigationBarSelectedIconSize;

  /// The size of the icon on unselected [NavigationBar] items.
  ///
  /// If undefined, defaults to [navigationBarSelectedIconSize].
  final double? navigationBarUnselectedIconSize;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationBar]'s selected item icon color.
  ///
  /// If undefined, and [navigationBarIndicatorSchemeColor] is also
  /// undefined, then defaults to [SchemeColor.onSecondaryContainer].
  /// If undefined, but [navigationBarIndicatorSchemeColor] is defined, then
  /// it defaults to the contrast onColor pair of the indicator color
  /// [navigationBarIndicatorSchemeColor]
  ///
  /// Flutter SDK defaults to [ColorScheme.onSurface] in M2 mode and
  /// [ColorScheme.onSecondaryContainer] in M3.
  final SchemeColor? navigationBarSelectedIconSchemeColor;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationBar]'s unselected item icon color.
  ///
  /// When undefined, if [navigationBarBackgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [navigationBarBackgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [navigationBarBackgroundSchemeColor] is also undefined,
  /// then this defaults to [SchemeColor.onSurfaceVariant].
  ///
  /// Flutter SDK defaults to [ColorScheme.onSurface] in M2 mode and to
  /// [ColorScheme.onSurfaceVariant] in M3 mode.
  final SchemeColor? navigationBarUnselectedIconSchemeColor;

  /// If true, the unselected icon in the [NavigationBar] use a more muted
  /// color version of the color defined by
  /// [navigationBarUnselectedIconSchemeColor].
  ///
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to false.
  final bool? navigationBarMutedUnselectedIcon;

  /// Select which color from the theme [ColorScheme] to use for
  /// the [NavigationBar]'s selected item indicator.
  ///
  /// If undefined, defaults to [SchemeColor.secondaryContainer].
  ///
  /// Flutter SDK defaults to secondaryContainer in M3 mode and to
  /// secondary in M2 mode with opacity 24%.
  final SchemeColor? navigationBarIndicatorSchemeColor;

  /// Opacity used on the [NavigationBar] indicator.
  ///
  /// If not defined, defaults to is 0xFF, or opacity 1.
  ///
  /// Flutter SDK uses 24% in M2 and 100% in M3.
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
  /// If undefined, defaults to [SchemeColor.surfaceContainer]
  ///
  /// Flutter SDK defaults to surfaceContainer in M3 and in M2 mode to
  /// surface color, with a color overlay using onSurface at
  /// fixed elevation 3.
  final SchemeColor? navigationBarBackgroundSchemeColor;

  /// Height of the container for the Material 3 [NavigationBar].
  ///
  /// In undefined, defaults to component default which is 80dp.
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
  /// The text style [TextTheme.labelMedium] is used as base
  /// style for the text style.
  ///
  /// If all label modifying properties (size and scheme color) are null, it
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
  /// on selected item, 12 is used as fallback if needed.
  final double? navigationRailSelectedLabelSize;

  /// The size of the text label on unselected [NavigationRail] items.
  ///
  /// If defined, it overrides the font size on effective label TextStyle
  /// on unselected items, 12 is used as fallback if needed.
  final double? navigationRailUnselectedLabelSize;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationRail]'s selected label text color.
  ///
  /// When undefined, if [navigationRailBackgroundSchemeColor] is defined, its
  /// contrasting on color will be used, if it is also undefined
  /// [SchemeColor.onSurface] will be used.
  ///
  /// Flutter M2 default is primary, M3 default is onSurface.
  final SchemeColor? navigationRailSelectedLabelSchemeColor;

  // TODO(rydmike): Report spec bug issue and add link
  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationRail]'s unselected label text color.
  ///
  /// When undefined, if [navigationRailBackgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [navigationRailBackgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [navigationRailBackgroundSchemeColor] is also undefined,
  /// then this defaults to [SchemeColor.onSurfaceVariant].
  ///
  /// Flutter Material-2 default is onSurface with opacity 0.64,
  /// In Flutter version 3.24 and earlier,
  /// the Material-3 default is still also onSurface.
  /// This is a spec BUG in Flutter's Material-3 defaults, it should be
  /// onSurfaceVariant. See issue: add new issue link here
  final SchemeColor? navigationRailUnselectedLabelSchemeColor;

  /// If true, the unselected label in the [NavigationRail] use a more
  /// muted color version of the color defined by
  /// [navigationRailUnselectedLabelSchemeColor].
  ///
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to false.
  final bool? navigationRailMutedUnselectedLabel;

  /// The size of the icon on selected [NavigationRail] item.
  ///
  /// If undefined, it defaults to 24.
  final double? navigationRailSelectedIconSize;

  /// The size of the icon on unselected [NavigationRail] items.
  ///
  /// If undefined, defaults to [navigationRailSelectedIconSize].
  final double? navigationRailUnselectedIconSize;

  /// Select which color from the theme's [ColorScheme] to use for
  /// the [NavigationRail]'s selected item icon color.
  ///
  /// If undefined, and [navigationRailIndicatorSchemeColor] is also
  /// undefined, then defaults to [SchemeColor.onSecondaryContainer].
  /// If undefined, but [navigationRailIndicatorSchemeColor] is defined, then
  /// it defaults to the contrast onColor pair of the indicator color
  /// [navigationRailIndicatorSchemeColor]
  ///
  /// Flutter Material-2 default is primary, Material-3 default is
  /// onSecondaryContainer.
  final SchemeColor? navigationRailSelectedIconSchemeColor;

  /// Select which color from the passed in [ColorScheme] to use for
  /// the [NavigationRail]'s unselected items icon color.
  ///
  /// When undefined, if [navigationRailBackgroundSchemeColor] is
  /// using any of the surface colors, the default on pair used will be
  /// [SchemeColor.onSurfaceVariant], instead of [SchemeColor.onSurface]
  /// that is the typical contrast color for surface colors.
  /// This is to make the unselected labels and icons look more muted.
  ///
  /// If other [navigationRailBackgroundSchemeColor] colors are used,
  /// while this value is undefined, their default contrasting onColor will
  /// be used. If the [navigationRailBackgroundSchemeColor] is also undefined,
  /// then this defaults to [SchemeColor.onSurfaceVariant].
  ///
  /// Flutter's Material-2 default is onSurface and in Material-3 it is
  /// onSurfaceVariant.
  final SchemeColor? navigationRailUnselectedIconSchemeColor;

  /// If true, the unselected icon in the [NavigationRail] use a more muted
  /// color version of the color defined by
  /// [navigationBarUnselectedIconSchemeColor].
  /// The muting is unselected color with
  /// blendAlpha(unselected color, [kUnselectedBackgroundPrimaryAlphaBlend])
  /// and withAlpha([kUnselectedAlphaBlend]).
  ///
  /// If undefined, defaults to false.
  final bool? navigationRailMutedUnselectedIcon;

  /// Whether or not the selected [NavigationRail] item should include a
  /// [NavigationIndicator].
  ///
  /// If `true`, adds a rounded [NavigationIndicator] behind the selected
  /// destination's icon.
  ///
  /// The indicator's shape will be circular if [navigationRailLabelType] is
  /// [NavigationRailLabelType.none], or a [StadiumBorder] if
  /// [navigationRailLabelType] is
  /// [NavigationRailLabelType.all] or [NavigationRailLabelType.selected].
  ///
  /// If undefined, defaults to [ThemeData.useMaterial3]. Indicator is used by
  /// default in Material-3 but not in Material-2 mode.
  ///
  /// This logic is used by Flutter defaults as well.
  final bool? navigationRailUseIndicator;

  /// Select which color from the theme [ColorScheme] to use for
  /// the selected [NavigationRail]'s highlighted item.
  ///
  /// If undefined, defaults to [SchemeColor.secondaryContainer].
  ///
  /// Flutter defaults to secondary in Material-2 and to secondaryContainer
  /// in Material-3.
  final SchemeColor? navigationRailIndicatorSchemeColor;

  /// Opacity used on the [NavigationBar] indicator.
  ///
  /// If undefined, defaults to 1, fully opaque.
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
  /// If this property is undefined,
  /// the effective background color will be [ColorScheme.surface] same
  /// as Flutter default.
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
  /// When a navigation rail is [NavigationRail.extended], the labels are
  /// always shown. If the [NavigationRail.extended] is true, then the
  /// [navigationRailLabelType] can only be set to
  /// [NavigationRailLabelType.none], if any other value is used the Flutter
  /// framework throws an assertion error. This is a strange limitation in the
  /// framework, but it is what it is. You can work around it it, by own
  /// component level setting label type to [NavigationRailLabelType.none] when
  /// you extend the rail.
  ///
  /// If not defined, it will default Flutter SDK default
  /// behavior [NavigationRailLabelType.none].
  final NavigationRailLabelType? navigationRailLabelType;

  /// The vertical alignment for the group of [NavigationRail.destinations]
  /// within a [NavigationRail].
  ///
  /// The [NavigationRailDestination]s are grouped together with the
  /// [NavigationRail.trailing] widget, between the [NavigationRail.leading]
  /// widget and the bottom of the rail.
  ///
  /// The value must be between -1.0 and 1.0.
  ///
  /// * If [navigationRailGroupAlignment] is -1.0, then the items are aligned
  ///   to the top.
  /// * If [navigationRailGroupAlignment] is 0.0, then the items are aligned
  ///   to the center.
  /// * If [navigationRailGroupAlignment] is 1.0, then the items are aligned
  ///   to the bottom.
  ///
  /// The default is -1.0.
  final double? navigationRailGroupAlignment;

  /// Overrides the default value of [NavigationRail]'s minimum width when it
  /// is not extended.
  ///
  /// If not defined, defaults to M3 spec default value 80 dp.
  ///
  /// Flutter SDK uses 72 in M2 mode and 80 dp in M3 mode.
  final double? navigationRailMinWidth;

  /// Overrides the default value of [NavigationRail]'s minimum width when it
  /// is extended.
  ///
  /// If not defined, defaults to M3 spec default value 256 dp.
  ///
  /// Flutter M2 and M3 use 256 dp as default.
  final double? navigationRailMinExtendedWidth;

  /// **DEPRECATED** and has no function anymore.
  /// Use [useMaterial3Typography] instead.
  ///
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
  /// component themes are not used, then default typography is
  /// [Typography.material2018]. Note that if [FlexColorScheme] is
  /// not used at all, and your [ThemeData] has [ThemeData.useMaterial3] false,
  /// then Flutter defaults to using very old poor [Typography.material2014].
  /// In such cases consider defining your typography manually to
  /// [Typography.material2018] or why not even [Typography.material2021].
  ///
  /// FlexColorScheme fully supports using any custom TextTheme and fonts, just
  /// like ThemeData. You apply and use them just as you would with ThemeData.
  /// This text theme is just a convenience Typography toggle.
  ///
  /// If you specify a custom typography in [FlexColorScheme.typography] then
  /// this property has no impact on used typography.
  ///
  /// This property was originally used in [FlexColorScheme] to opt-in on using
  /// a custom text theme defined internally by [FlexColorScheme] to look like
  /// the typography and text theme used in Material-3, before such a text theme
  /// and typography existed in Flutter. When Flutter started providing M3
  /// text theme and typography, this property was converted into toggle to opt
  /// in and out of using the text theme. Typically, you do not want to
  /// opt-out of it, but in M2 mode you may want to opt-in and set it to true.
  @Deprecated('This property has been replaced by the more aptly named '
      'useMaterial3Typography property and no longer has any function '
      'in V8 and will be removed in v9.0.0.')
  final bool? useTextTheme;

  /// **DEPRECATED** and has no function anymore.
  ///
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
  /// ```text
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
  /// ```text
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
  /// ```text
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
  @Deprecated('The `useFlutterDefaults` is deprecated, it no longer has any '
      'function and will be removed in v9. FlexColorScheme in M3 mode '
      'defaults to using mostly Flutter defaults styles. '
      'For other configurations modify the theme as desired. '
      'In M2 mode FCS will continue to use its own opinionated defaults for '
      'as long as M2 exists.')
  final bool? useFlutterDefaults;

  /// Copy the object with one or more provided properties changed.
  FlexSubThemesData copyWith({
    final bool? interactionEffects,
    final bool? tintedDisabledControls,
    final int? blendOnLevel,
    final bool? blendOnColors,
    //
    final FlexAdaptive? adaptiveRemoveElevationTint,
    final FlexAdaptive? adaptiveElevationShadowsBack,
    final FlexAdaptive? adaptiveAppBarScrollUnderOff,
    final FlexAdaptive? adaptiveRadius,
    final FlexAdaptive? adaptiveDialogRadius,
    final FlexAdaptive? adaptiveInputDecoratorRadius,
    //
    final FlexAdaptive? adaptiveSplash,
    final FlexSplashType? splashType,
    final FlexSplashType? splashTypeAdaptive,
    //
    final bool? blendTextTheme,
    final bool? useMaterial3Typography,
    final bool? useM2StyleDividerInM3,
    //
    final double? defaultRadius,
    final double? defaultRadiusAdaptive,
    //
    final Size? buttonMinSize,
    final bool? alignedDropdown,
    final EdgeInsetsGeometry? buttonPadding,
    //
    final double? thickBorderWidth,
    final double? thinBorderWidth,
    //
    final double? textButtonRadius,
    final SchemeColor? textButtonSchemeColor,
    final WidgetStateProperty<TextStyle?>? textButtonTextStyle,
    //
    final double? filledButtonRadius,
    final SchemeColor? filledButtonSchemeColor,
    final WidgetStateProperty<TextStyle?>? filledButtonTextStyle,
    //
    // TODO(rydmike): Hold for https://github.com/flutter/flutter/issues/115827
    // final double? filledButtonTonalRadius,
    // final SchemeColor? filledButtonTonalSchemeColor,
    // final WidgetStateProperty<TextStyle?>? filledButtonTonalTextStyle,
    //
    final double? elevatedButtonRadius,
    final double? elevatedButtonElevation,
    final SchemeColor? elevatedButtonSchemeColor,
    final SchemeColor? elevatedButtonSecondarySchemeColor,
    final WidgetStateProperty<TextStyle?>? elevatedButtonTextStyle,
    //
    final double? outlinedButtonRadius,
    final SchemeColor? outlinedButtonSchemeColor,
    final SchemeColor? outlinedButtonOutlineSchemeColor,
    final double? outlinedButtonBorderWidth,
    final double? outlinedButtonPressedBorderWidth,
    final WidgetStateProperty<TextStyle?>? outlinedButtonTextStyle,
    //
    final double? toggleButtonsRadius,
    final SchemeColor? toggleButtonsSchemeColor,
    final SchemeColor? toggleButtonsSelectedForegroundSchemeColor,
    final SchemeColor? toggleButtonsUnselectedSchemeColor,
    final SchemeColor? toggleButtonsBorderSchemeColor,
    final double? toggleButtonsBorderWidth,
    final TextStyle? toggleButtonsTextStyle,
    //
    final double? segmentedButtonRadius,
    final SchemeColor? segmentedButtonSchemeColor,
    final SchemeColor? segmentedButtonSelectedForegroundSchemeColor,
    final SchemeColor? segmentedButtonUnselectedSchemeColor,
    final SchemeColor? segmentedButtonUnselectedForegroundSchemeColor,
    final SchemeColor? segmentedButtonBorderSchemeColor,
    final double? segmentedButtonBorderWidth,
    final WidgetStateProperty<TextStyle?>? segmentedButtonTextStyle,
    //
    final FlexScaffoldBaseColor? scaffoldBackgroundBaseColor,
    final SchemeColor? scaffoldBackgroundSchemeColor,
    final SchemeColor? materialButtonSchemeColor,
    //
    final SchemeColor? switchSchemeColor,
    final SchemeColor? switchThumbSchemeColor,
    final bool? switchThumbFixedSize,
    final FlexAdaptive? switchAdaptiveCupertinoLike,
    //
    final SchemeColor? checkboxSchemeColor,
    final SchemeColor? radioSchemeColor,
    final bool? unselectedToggleIsColored,
    //
    final SchemeColor? sliderBaseSchemeColor,
    final SchemeColor? sliderThumbSchemeColor,
    final SchemeColor? sliderIndicatorSchemeColor,
    final bool? sliderValueTinted,
    final FlexSliderIndicatorType? sliderValueIndicatorType,
    final ShowValueIndicator? sliderShowValueIndicator,
    final double? sliderTrackHeight,
    //
    final double? inputDecoratorRadius,
    final double? inputDecoratorRadiusAdaptive,
    final SchemeColor? inputDecoratorSchemeColor,
    final EdgeInsetsGeometry? inputDecoratorContentPadding,
    final bool? inputDecoratorIsDense,
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
    final SchemeColor? inputDecoratorSuffixIconSchemeColor,
    //
    final SchemeColor? inputCursorSchemeColor,
    final SchemeColor? inputSelectionSchemeColor,
    final double? inputSelectionOpacity,
    final SchemeColor? inputSelectionHandleSchemeColor,
    //
    final SchemeColor? listTileSelectedSchemeColor,
    final SchemeColor? listTileIconSchemeColor,
    final SchemeColor? listTileTextSchemeColor,
    final TextStyle? listTileTitleTextStyle,
    final TextStyle? listTileSubtitleTextStyle,
    final TextStyle? listTileLeadingAndTrailingTextStyle,
    final SchemeColor? listTileTileSchemeColor,
    final SchemeColor? listTileSelectedTileSchemeColor,
    final EdgeInsetsGeometry? listTileContentPadding,
    final double? listTileHorizontalTitleGap,
    final double? listTileMinVerticalPadding,
    final ListTileStyle? listTileStyle,
    final ListTileTitleAlignment? listTileTitleAlignment,
    final ListTileControlAffinity? listTileControlAffinity,
    //
    final double? fabRadius,
    final bool? fabUseShape,
    final bool? fabAlwaysCircular,
    final SchemeColor? fabSchemeColor,
    final SchemeColor? fabForegroundSchemeColor,
    final TextStyle? fabExtendedTextStyle,
    //
    final double? chipRadius,
    final bool? chipBlendColors,
    final SchemeColor? chipSchemeColor,
    final SchemeColor? chipSelectedSchemeColor,
    final SchemeColor? chipSecondarySelectedSchemeColor,
    final SchemeColor? chipDeleteIconSchemeColor,
    final TextStyle? chipLabelStyle,
    final TextStyle? chipSecondaryLabelStyle,
    final double? chipFontSize,
    final double? chipSecondaryFontSize,
    final double? chipIconSize,
    final EdgeInsetsGeometry? chipPadding,
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
    final WidgetStateProperty<TextStyle?>? menuButtonTextStyle,
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
    final SchemeColor? searchBarBackgroundSchemeColor,
    final SchemeColor? searchViewBackgroundSchemeColor,
    final double? searchBarElevation,
    final double? searchViewElevation,
    final double? searchBarRadius,
    final double? searchViewRadius,
    final bool? searchUseGlobalShape,
    final double? searchViewHeaderHeight,
    final WidgetStateProperty<TextStyle?>? searchBarTextStyle,
    final TextStyle? searchViewHeaderTextStyle,
    final WidgetStateProperty<TextStyle?>? searchBarHintStyle,
    final TextStyle? searchViewHeaderHintStyle,
    final Color? searchViewDividerColor,
    final Color? searchBarShadowColor,
    final TextCapitalization? searchBarTextCapitalization,
    final EdgeInsetsGeometry? searchBarPadding,
    final BoxConstraints? searchBarConstraints,
    final BoxConstraints? searchViewConstraints,
    //
    final bool? useInputDecoratorThemeInDialogs,
    final double? dialogRadius,
    final double? dialogRadiusAdaptive,
    final double? dialogElevation,
    final SchemeColor? dialogBackgroundSchemeColor,
    final TextStyle? dialogTitleTextStyle,
    final TextStyle? dialogContentTextStyle,
    //
    final SchemeColor? datePickerHeaderBackgroundSchemeColor,
    final SchemeColor? datePickerHeaderForegroundSchemeColor,
    final double? datePickerDialogRadius,
    final SchemeColor? datePickerDividerSchemeColor,
    final TextStyle? datePickerHeaderHeadlineStyle,
    final TextStyle? datePickerHeaderHelpStyle,
    final TextStyle? datePickerWeekdayStyle,
    final TextStyle? datePickerDayStyle,
    final TextStyle? datePickerYearStyle,
    final TextStyle? datePickerRangePickerHeaderHeadlineStyle,
    final TextStyle? datePickerRangePickerHeaderHelpStyle,
    //
    final double? timePickerDialogRadius,
    final double? timePickerElementRadius,
    final TextStyle? timePickerDayPeriodTextStyle,
    final TextStyle? timePickerDialTextStyle,
    final TextStyle? timePickerHelpTextStyle,
    final TextStyle? timePickerHourMinuteTextStyle,
    //
    final double? snackBarRadius,
    final double? snackBarElevation,
    final SchemeColor? snackBarBackgroundSchemeColor,
    final SchemeColor? snackBarActionSchemeColor,
    final TextStyle? snackBarContentTextStyle,
    //
    final SchemeColor? appBarBackgroundSchemeColor,
    final SchemeColor? appBarForegroundSchemeColor,
    final SchemeColor? appBarIconSchemeColor,
    final SchemeColor? appBarActionsIconSchemeColor,
    final bool? appBarCenterTitle,
    final double? appBarScrolledUnderElevation,
    final TextStyle? appBarToolbarTextStyle,
    final TextStyle? appBarTitleTextStyle,
    //
    final SchemeColor? bottomAppBarSchemeColor,
    final double? bottomAppBarHeight,
    //
    final SchemeColor? tabBarItemSchemeColor,
    final SchemeColor? tabBarUnselectedItemSchemeColor,
    final double? tabBarUnselectedItemOpacity,
    final SchemeColor? tabBarIndicatorSchemeColor,
    final TabBarIndicatorSize? tabBarIndicatorSize,
    final double? tabBarIndicatorWeight,
    final double? tabBarIndicatorTopRadius,
    final Color? tabBarDividerColor,
    final TabAlignment? tabBarTabAlignment,
    final TabIndicatorAnimation? tabBarIndicatorAnimation,
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
    final Clip? bottomSheetClipBehavior,
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
    final double? navigationRailMinWidth,
    final double? navigationRailMinExtendedWidth,
    //
    @Deprecated('This property has been replaced by the more aptly named '
        'useMaterial3Typography property and no longer has any function '
        'in V8 and will be removed in v9.0.0.')
    final bool? useTextTheme,
    @Deprecated('The `useFlutterDefaults` is deprecated, it no longer has any '
        'function and will be removed in v9. FlexColorScheme in M3 mode '
        'defaults to using mostly Flutter defaults styles. '
        'For other configurations modify the theme as desired. '
        'In M2 mode FCS will continue to use its own opinionated defaults for '
        'as long as M2 exists.')
    final bool? useFlutterDefaults,
  }) {
    return FlexSubThemesData(
      interactionEffects: interactionEffects ?? this.interactionEffects,
      tintedDisabledControls:
          tintedDisabledControls ?? this.tintedDisabledControls,
      blendOnLevel: blendOnLevel ?? this.blendOnLevel,
      blendOnColors: blendOnColors ?? this.blendOnColors,
      //
      adaptiveRemoveElevationTint:
          adaptiveRemoveElevationTint ?? this.adaptiveRemoveElevationTint,
      adaptiveElevationShadowsBack:
          adaptiveElevationShadowsBack ?? this.adaptiveElevationShadowsBack,
      adaptiveAppBarScrollUnderOff:
          adaptiveAppBarScrollUnderOff ?? this.adaptiveAppBarScrollUnderOff,
      adaptiveRadius: adaptiveRadius ?? this.adaptiveRadius,
      adaptiveDialogRadius: adaptiveDialogRadius ?? this.adaptiveDialogRadius,
      adaptiveInputDecoratorRadius:
          adaptiveInputDecoratorRadius ?? this.adaptiveInputDecoratorRadius,
      //
      adaptiveSplash: adaptiveSplash ?? this.adaptiveSplash,
      splashType: splashType ?? this.splashType,
      splashTypeAdaptive: splashTypeAdaptive ?? this.splashTypeAdaptive,
      //
      // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
      // blendTextTheme: blendTextTheme ?? this.blendTextTheme,
      useMaterial3Typography:
          useMaterial3Typography ?? this.useMaterial3Typography,
      useM2StyleDividerInM3:
          useM2StyleDividerInM3 ?? this.useM2StyleDividerInM3,
      //
      defaultRadius: defaultRadius ?? this.defaultRadius,
      defaultRadiusAdaptive:
          defaultRadiusAdaptive ?? this.defaultRadiusAdaptive,
      //
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
      toggleButtonsSelectedForegroundSchemeColor:
          toggleButtonsSelectedForegroundSchemeColor ??
              this.toggleButtonsSelectedForegroundSchemeColor,
      toggleButtonsUnselectedSchemeColor: toggleButtonsUnselectedSchemeColor ??
          this.toggleButtonsUnselectedSchemeColor,
      toggleButtonsBorderSchemeColor:
          toggleButtonsBorderSchemeColor ?? this.toggleButtonsBorderSchemeColor,
      toggleButtonsBorderWidth:
          toggleButtonsBorderWidth ?? this.toggleButtonsBorderWidth,
      toggleButtonsTextStyle:
          toggleButtonsTextStyle ?? this.toggleButtonsTextStyle,
      //
      segmentedButtonRadius:
          segmentedButtonRadius ?? this.segmentedButtonRadius,
      segmentedButtonSchemeColor:
          segmentedButtonSchemeColor ?? this.segmentedButtonSchemeColor,
      segmentedButtonSelectedForegroundSchemeColor:
          segmentedButtonSelectedForegroundSchemeColor ??
              this.segmentedButtonSelectedForegroundSchemeColor,
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
      segmentedButtonTextStyle:
          segmentedButtonTextStyle ?? this.segmentedButtonTextStyle,
      //
      scaffoldBackgroundBaseColor:
          scaffoldBackgroundBaseColor ?? this.scaffoldBackgroundBaseColor,
      scaffoldBackgroundSchemeColor:
          scaffoldBackgroundSchemeColor ?? this.scaffoldBackgroundSchemeColor,
      materialButtonSchemeColor:
          materialButtonSchemeColor ?? this.materialButtonSchemeColor,
      //
      switchSchemeColor: switchSchemeColor ?? this.switchSchemeColor,
      switchThumbSchemeColor:
          switchThumbSchemeColor ?? this.switchThumbSchemeColor,
      switchThumbFixedSize: switchThumbFixedSize ?? this.switchThumbFixedSize,
      switchAdaptiveCupertinoLike:
          switchAdaptiveCupertinoLike ?? this.switchAdaptiveCupertinoLike,
      //
      checkboxSchemeColor: checkboxSchemeColor ?? this.checkboxSchemeColor,
      radioSchemeColor: radioSchemeColor ?? this.radioSchemeColor,
      unselectedToggleIsColored:
          unselectedToggleIsColored ?? this.unselectedToggleIsColored,
      //
      sliderBaseSchemeColor:
          sliderBaseSchemeColor ?? this.sliderBaseSchemeColor,
      sliderThumbSchemeColor:
          sliderThumbSchemeColor ?? this.sliderThumbSchemeColor,
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
      inputDecoratorRadiusAdaptive:
          inputDecoratorRadiusAdaptive ?? this.inputDecoratorRadiusAdaptive,
      inputDecoratorSchemeColor:
          inputDecoratorSchemeColor ?? this.inputDecoratorSchemeColor,
      inputDecoratorContentPadding:
          inputDecoratorContentPadding ?? this.inputDecoratorContentPadding,
      inputDecoratorIsDense:
          inputDecoratorIsDense ?? this.inputDecoratorIsDense,
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
      inputDecoratorSuffixIconSchemeColor:
          inputDecoratorSuffixIconSchemeColor ??
              this.inputDecoratorSuffixIconSchemeColor,
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
      listTileSelectedSchemeColor:
          listTileSelectedSchemeColor ?? this.listTileSelectedSchemeColor,
      listTileIconSchemeColor:
          listTileIconSchemeColor ?? this.listTileIconSchemeColor,
      listTileTextSchemeColor:
          listTileTextSchemeColor ?? this.listTileTextSchemeColor,
      listTileTitleTextStyle:
          listTileTitleTextStyle ?? this.listTileTitleTextStyle,
      listTileSubtitleTextStyle:
          listTileSubtitleTextStyle ?? this.listTileSubtitleTextStyle,
      listTileLeadingAndTrailingTextStyle:
          listTileLeadingAndTrailingTextStyle ??
              this.listTileLeadingAndTrailingTextStyle,
      listTileTileSchemeColor:
          listTileTileSchemeColor ?? this.listTileTileSchemeColor,
      listTileSelectedTileSchemeColor: listTileSelectedTileSchemeColor ??
          this.listTileSelectedTileSchemeColor,
      listTileContentPadding:
          listTileContentPadding ?? this.listTileContentPadding,
      listTileHorizontalTitleGap:
          listTileHorizontalTitleGap ?? this.listTileHorizontalTitleGap,
      listTileMinVerticalPadding:
          listTileMinVerticalPadding ?? this.listTileMinVerticalPadding,
      listTileStyle: listTileStyle ?? this.listTileStyle,
      listTileTitleAlignment:
          listTileTitleAlignment ?? this.listTileTitleAlignment,
      listTileControlAffinity:
          listTileControlAffinity ?? this.listTileControlAffinity,
      //
      fabRadius: fabRadius ?? this.fabRadius,
      fabUseShape: fabUseShape ?? this.fabUseShape,
      fabAlwaysCircular: fabAlwaysCircular ?? this.fabAlwaysCircular,
      fabSchemeColor: fabSchemeColor ?? this.fabSchemeColor,
      fabForegroundSchemeColor:
          fabForegroundSchemeColor ?? this.fabForegroundSchemeColor,
      fabExtendedTextStyle: fabExtendedTextStyle ?? this.fabExtendedTextStyle,
      //
      chipRadius: chipRadius ?? this.chipRadius,
      chipBlendColors: chipBlendColors ?? this.chipBlendColors,
      chipSchemeColor: chipSchemeColor ?? this.chipSchemeColor,
      chipSelectedSchemeColor:
          chipSelectedSchemeColor ?? this.chipSelectedSchemeColor,
      chipSecondarySelectedSchemeColor: chipSecondarySelectedSchemeColor ??
          this.chipSecondarySelectedSchemeColor,
      chipDeleteIconSchemeColor:
          chipDeleteIconSchemeColor ?? this.chipDeleteIconSchemeColor,
      chipLabelStyle: chipLabelStyle ?? this.chipLabelStyle,
      chipSecondaryLabelStyle:
          chipSecondaryLabelStyle ?? this.chipSecondaryLabelStyle,
      chipFontSize: chipFontSize ?? this.chipFontSize,
      chipSecondaryFontSize:
          chipSecondaryFontSize ?? this.chipSecondaryFontSize,
      chipIconSize: chipIconSize ?? this.chipIconSize,
      chipPadding: chipPadding ?? this.chipPadding,
      //
      cardRadius: cardRadius ?? this.cardRadius,
      cardElevation: cardElevation ?? this.cardElevation,
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
      menuButtonTextStyle: menuButtonTextStyle ?? this.menuButtonTextStyle,
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
      searchBarBackgroundSchemeColor:
          searchBarBackgroundSchemeColor ?? this.searchBarBackgroundSchemeColor,
      searchViewBackgroundSchemeColor: searchViewBackgroundSchemeColor ??
          this.searchViewBackgroundSchemeColor,
      searchBarElevation: searchBarElevation ?? this.searchBarElevation,
      searchViewElevation: searchViewElevation ?? this.searchViewElevation,
      searchBarRadius: searchBarRadius ?? this.searchBarRadius,
      searchViewRadius: searchViewRadius ?? this.searchViewRadius,
      searchUseGlobalShape: searchUseGlobalShape ?? this.searchUseGlobalShape,
      searchViewHeaderHeight:
          searchViewHeaderHeight ?? this.searchViewHeaderHeight,
      searchBarTextStyle: searchBarTextStyle ?? this.searchBarTextStyle,
      searchViewHeaderTextStyle:
          searchViewHeaderTextStyle ?? this.searchViewHeaderTextStyle,
      searchBarHintStyle: searchBarHintStyle ?? this.searchBarHintStyle,
      searchViewHeaderHintStyle:
          searchViewHeaderHintStyle ?? this.searchViewHeaderHintStyle,
      searchViewDividerColor:
          searchViewDividerColor ?? this.searchViewDividerColor,
      searchBarShadowColor: searchBarShadowColor ?? this.searchBarShadowColor,
      searchBarTextCapitalization:
          searchBarTextCapitalization ?? this.searchBarTextCapitalization,
      searchBarPadding: searchBarPadding ?? this.searchBarPadding,
      searchBarConstraints: searchBarConstraints ?? this.searchBarConstraints,
      searchViewConstraints:
          searchViewConstraints ?? this.searchViewConstraints,
      //
      useInputDecoratorThemeInDialogs: useInputDecoratorThemeInDialogs ??
          this.useInputDecoratorThemeInDialogs,
      dialogRadius: dialogRadius ?? this.dialogRadius,
      dialogRadiusAdaptive: dialogRadiusAdaptive ?? this.dialogRadiusAdaptive,
      dialogElevation: dialogElevation ?? this.dialogElevation,
      dialogBackgroundSchemeColor:
          dialogBackgroundSchemeColor ?? this.dialogBackgroundSchemeColor,
      dialogTitleTextStyle: dialogTitleTextStyle ?? this.dialogTitleTextStyle,
      dialogContentTextStyle:
          dialogContentTextStyle ?? this.dialogContentTextStyle,
      //
      datePickerHeaderBackgroundSchemeColor:
          datePickerHeaderBackgroundSchemeColor ??
              this.datePickerHeaderBackgroundSchemeColor,
      datePickerHeaderForegroundSchemeColor:
          datePickerHeaderForegroundSchemeColor ??
              this.datePickerHeaderForegroundSchemeColor,
      datePickerDialogRadius:
          datePickerDialogRadius ?? this.datePickerDialogRadius,
      datePickerDividerSchemeColor:
          datePickerDividerSchemeColor ?? this.datePickerDividerSchemeColor,
      datePickerHeaderHeadlineStyle:
          datePickerHeaderHeadlineStyle ?? this.datePickerHeaderHeadlineStyle,
      datePickerHeaderHelpStyle:
          datePickerHeaderHelpStyle ?? this.datePickerHeaderHelpStyle,
      datePickerWeekdayStyle:
          datePickerWeekdayStyle ?? this.datePickerWeekdayStyle,
      datePickerDayStyle: datePickerDayStyle ?? this.datePickerDayStyle,
      datePickerYearStyle: datePickerYearStyle ?? this.datePickerYearStyle,
      datePickerRangePickerHeaderHeadlineStyle:
          datePickerRangePickerHeaderHeadlineStyle ??
              this.datePickerRangePickerHeaderHeadlineStyle,
      datePickerRangePickerHeaderHelpStyle:
          datePickerRangePickerHeaderHelpStyle ??
              this.datePickerRangePickerHeaderHelpStyle,
      //
      timePickerDialogRadius:
          timePickerDialogRadius ?? this.timePickerDialogRadius,
      timePickerElementRadius:
          timePickerElementRadius ?? this.timePickerElementRadius,
      timePickerDayPeriodTextStyle:
          timePickerDayPeriodTextStyle ?? this.timePickerDayPeriodTextStyle,
      timePickerDialTextStyle:
          timePickerDialTextStyle ?? this.timePickerDialTextStyle,
      timePickerHelpTextStyle:
          timePickerHelpTextStyle ?? this.timePickerHelpTextStyle,
      timePickerHourMinuteTextStyle:
          timePickerHourMinuteTextStyle ?? this.timePickerHourMinuteTextStyle,
      //
      snackBarRadius: snackBarRadius ?? this.snackBarRadius,
      snackBarElevation: snackBarElevation ?? this.snackBarElevation,
      snackBarBackgroundSchemeColor:
          snackBarBackgroundSchemeColor ?? this.snackBarBackgroundSchemeColor,
      snackBarActionSchemeColor:
          snackBarActionSchemeColor ?? this.snackBarActionSchemeColor,
      snackBarContentTextStyle:
          snackBarContentTextStyle ?? this.snackBarContentTextStyle,
      //
      appBarBackgroundSchemeColor:
          appBarBackgroundSchemeColor ?? this.appBarBackgroundSchemeColor,
      appBarForegroundSchemeColor:
          appBarForegroundSchemeColor ?? this.appBarForegroundSchemeColor,
      appBarIconSchemeColor:
          appBarIconSchemeColor ?? this.appBarIconSchemeColor,
      appBarActionsIconSchemeColor:
          appBarActionsIconSchemeColor ?? this.appBarActionsIconSchemeColor,
      appBarCenterTitle: appBarCenterTitle ?? this.appBarCenterTitle,
      appBarScrolledUnderElevation:
          appBarScrolledUnderElevation ?? this.appBarScrolledUnderElevation,
      appBarToolbarTextStyle:
          appBarToolbarTextStyle ?? this.appBarToolbarTextStyle,
      appBarTitleTextStyle: appBarTitleTextStyle ?? this.appBarTitleTextStyle,
      //
      bottomAppBarSchemeColor:
          bottomAppBarSchemeColor ?? this.bottomAppBarSchemeColor,
      bottomAppBarHeight: bottomAppBarHeight ?? this.bottomAppBarHeight,
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
      tabBarTabAlignment: tabBarTabAlignment ?? this.tabBarTabAlignment,
      tabBarIndicatorAnimation:
          tabBarIndicatorAnimation ?? this.tabBarIndicatorAnimation,
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
      bottomSheetClipBehavior:
          bottomSheetClipBehavior ?? this.bottomSheetClipBehavior,
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
      navigationRailMinWidth:
          navigationRailMinWidth ?? this.navigationRailMinWidth,
      navigationRailMinExtendedWidth:
          navigationRailMinExtendedWidth ?? this.navigationRailMinExtendedWidth,
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
        //
        other.adaptiveRemoveElevationTint == adaptiveRemoveElevationTint &&
        other.adaptiveElevationShadowsBack == adaptiveElevationShadowsBack &&
        other.adaptiveAppBarScrollUnderOff == adaptiveAppBarScrollUnderOff &&
        other.adaptiveRadius == adaptiveRadius &&
        other.adaptiveDialogRadius == adaptiveDialogRadius &&
        other.adaptiveInputDecoratorRadius == adaptiveInputDecoratorRadius &&
        //
        other.adaptiveSplash == adaptiveSplash &&
        other.splashType == splashType &&
        other.splashTypeAdaptive == splashTypeAdaptive &&
        //
        // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
        // other.blendTextTheme == blendTextTheme &&
        other.useMaterial3Typography == useMaterial3Typography &&
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
        other.toggleButtonsSelectedForegroundSchemeColor ==
            toggleButtonsSelectedForegroundSchemeColor &&
        other.toggleButtonsUnselectedSchemeColor ==
            toggleButtonsUnselectedSchemeColor &&
        other.toggleButtonsBorderSchemeColor ==
            toggleButtonsBorderSchemeColor &&
        other.toggleButtonsBorderWidth == toggleButtonsBorderWidth &&
        other.toggleButtonsTextStyle == toggleButtonsTextStyle &&
        //
        other.segmentedButtonRadius == segmentedButtonRadius &&
        other.segmentedButtonSchemeColor == segmentedButtonSchemeColor &&
        other.segmentedButtonSelectedForegroundSchemeColor ==
            segmentedButtonSelectedForegroundSchemeColor &&
        other.segmentedButtonUnselectedSchemeColor ==
            segmentedButtonUnselectedSchemeColor &&
        other.segmentedButtonUnselectedForegroundSchemeColor ==
            segmentedButtonUnselectedForegroundSchemeColor &&
        other.segmentedButtonBorderSchemeColor ==
            segmentedButtonBorderSchemeColor &&
        other.segmentedButtonBorderWidth == segmentedButtonBorderWidth &&
        other.segmentedButtonTextStyle == segmentedButtonTextStyle &&
        //
        other.scaffoldBackgroundBaseColor == scaffoldBackgroundBaseColor &&
        other.scaffoldBackgroundSchemeColor == scaffoldBackgroundSchemeColor &&
        other.materialButtonSchemeColor == materialButtonSchemeColor &&
        //
        other.switchSchemeColor == switchSchemeColor &&
        other.switchThumbSchemeColor == switchThumbSchemeColor &&
        other.switchThumbFixedSize == switchThumbFixedSize &&
        other.switchAdaptiveCupertinoLike == switchAdaptiveCupertinoLike &&
        //
        other.checkboxSchemeColor == checkboxSchemeColor &&
        other.radioSchemeColor == radioSchemeColor &&
        other.unselectedToggleIsColored == unselectedToggleIsColored &&
        //
        other.sliderBaseSchemeColor == sliderBaseSchemeColor &&
        other.sliderThumbSchemeColor == sliderThumbSchemeColor &&
        other.sliderIndicatorSchemeColor == sliderIndicatorSchemeColor &&
        other.sliderValueTinted == sliderValueTinted &&
        other.sliderValueIndicatorType == sliderValueIndicatorType &&
        other.sliderShowValueIndicator == sliderShowValueIndicator &&
        other.sliderTrackHeight == sliderTrackHeight &&
        //
        other.inputDecoratorRadius == inputDecoratorRadius &&
        other.inputDecoratorRadiusAdaptive == inputDecoratorRadiusAdaptive &&
        other.inputDecoratorSchemeColor == inputDecoratorSchemeColor &&
        other.inputDecoratorContentPadding == inputDecoratorContentPadding &&
        other.inputDecoratorIsDense == inputDecoratorIsDense &&
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
        other.inputDecoratorSuffixIconSchemeColor ==
            inputDecoratorSuffixIconSchemeColor &&
        //
        other.inputCursorSchemeColor == inputCursorSchemeColor &&
        other.inputSelectionSchemeColor == inputSelectionSchemeColor &&
        other.inputSelectionOpacity == inputSelectionOpacity &&
        other.inputSelectionHandleSchemeColor ==
            inputSelectionHandleSchemeColor &&
        //
        other.listTileSelectedSchemeColor == listTileSelectedSchemeColor &&
        other.listTileIconSchemeColor == listTileIconSchemeColor &&
        other.listTileTextSchemeColor == listTileTextSchemeColor &&
        other.listTileTitleTextStyle == listTileTitleTextStyle &&
        other.listTileSubtitleTextStyle == listTileSubtitleTextStyle &&
        other.listTileLeadingAndTrailingTextStyle ==
            listTileLeadingAndTrailingTextStyle &&
        other.listTileTileSchemeColor == listTileTileSchemeColor &&
        other.listTileSelectedTileSchemeColor ==
            listTileSelectedTileSchemeColor &&
        other.listTileContentPadding == listTileContentPadding &&
        other.listTileHorizontalTitleGap == listTileHorizontalTitleGap &&
        other.listTileMinVerticalPadding == listTileMinVerticalPadding &&
        other.listTileStyle == listTileStyle &&
        other.listTileTitleAlignment == listTileTitleAlignment &&
        other.listTileControlAffinity == listTileControlAffinity &&
        //
        other.fabRadius == fabRadius &&
        other.fabUseShape == fabUseShape &&
        other.fabAlwaysCircular == fabAlwaysCircular &&
        other.fabSchemeColor == fabSchemeColor &&
        other.fabForegroundSchemeColor == fabForegroundSchemeColor &&
        other.fabExtendedTextStyle == fabExtendedTextStyle &&
        //
        other.chipRadius == chipRadius &&
        other.chipBlendColors == chipBlendColors &&
        other.chipSchemeColor == chipSchemeColor &&
        other.chipSelectedSchemeColor == chipSelectedSchemeColor &&
        other.chipSecondarySelectedSchemeColor ==
            chipSecondarySelectedSchemeColor &&
        other.chipDeleteIconSchemeColor == chipDeleteIconSchemeColor &&
        other.chipLabelStyle == chipLabelStyle &&
        other.chipSecondaryLabelStyle == chipSecondaryLabelStyle &&
        other.chipFontSize == chipFontSize &&
        other.chipSecondaryFontSize == chipSecondaryFontSize &&
        other.chipIconSize == chipIconSize &&
        other.chipPadding == chipPadding &&
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
        other.menuButtonTextStyle == menuButtonTextStyle &&
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
        other.searchBarBackgroundSchemeColor ==
            searchBarBackgroundSchemeColor &&
        other.searchViewBackgroundSchemeColor ==
            searchViewBackgroundSchemeColor &&
        other.searchBarElevation == searchBarElevation &&
        other.searchViewElevation == searchViewElevation &&
        other.searchBarRadius == searchBarRadius &&
        other.searchViewRadius == searchViewRadius &&
        other.searchUseGlobalShape == searchUseGlobalShape &&
        other.searchViewHeaderHeight == searchViewHeaderHeight &&
        other.searchBarTextStyle == searchBarTextStyle &&
        other.searchViewHeaderTextStyle == searchViewHeaderTextStyle &&
        other.searchBarHintStyle == searchBarHintStyle &&
        other.searchViewHeaderHintStyle == searchViewHeaderHintStyle &&
        other.searchViewDividerColor == searchViewDividerColor &&
        other.searchBarShadowColor == searchBarShadowColor &&
        other.searchBarTextCapitalization == searchBarTextCapitalization &&
        other.searchBarPadding == searchBarPadding &&
        other.searchBarConstraints == searchBarConstraints &&
        other.searchViewConstraints == searchViewConstraints &&
        //
        other.useInputDecoratorThemeInDialogs ==
            useInputDecoratorThemeInDialogs &&
        other.dialogRadius == dialogRadius &&
        other.dialogRadiusAdaptive == dialogRadiusAdaptive &&
        other.dialogElevation == dialogElevation &&
        other.dialogBackgroundSchemeColor == dialogBackgroundSchemeColor &&
        other.dialogTitleTextStyle == dialogTitleTextStyle &&
        other.dialogContentTextStyle == dialogContentTextStyle &&
        //
        other.datePickerHeaderBackgroundSchemeColor ==
            datePickerHeaderBackgroundSchemeColor &&
        other.datePickerHeaderForegroundSchemeColor ==
            datePickerHeaderForegroundSchemeColor &&
        other.datePickerDialogRadius == datePickerDialogRadius &&
        other.datePickerDividerSchemeColor == datePickerDividerSchemeColor &&
        other.datePickerHeaderHeadlineStyle == datePickerHeaderHeadlineStyle &&
        other.datePickerHeaderHelpStyle == datePickerHeaderHelpStyle &&
        other.datePickerWeekdayStyle == datePickerWeekdayStyle &&
        other.datePickerDayStyle == datePickerDayStyle &&
        other.datePickerYearStyle == datePickerYearStyle &&
        other.datePickerRangePickerHeaderHeadlineStyle ==
            datePickerRangePickerHeaderHeadlineStyle &&
        other.datePickerRangePickerHeaderHelpStyle ==
            datePickerRangePickerHeaderHelpStyle &&
        //
        other.timePickerDialogRadius == timePickerDialogRadius &&
        other.timePickerElementRadius == timePickerElementRadius &&
        other.timePickerDayPeriodTextStyle == timePickerDayPeriodTextStyle &&
        other.timePickerDialTextStyle == timePickerDialTextStyle &&
        other.timePickerHelpTextStyle == timePickerHelpTextStyle &&
        other.timePickerHourMinuteTextStyle == timePickerHourMinuteTextStyle &&
        //
        other.snackBarRadius == snackBarRadius &&
        other.snackBarElevation == snackBarElevation &&
        other.snackBarBackgroundSchemeColor == snackBarBackgroundSchemeColor &&
        other.snackBarActionSchemeColor == snackBarActionSchemeColor &&
        other.snackBarContentTextStyle == snackBarContentTextStyle &&
        //
        other.appBarBackgroundSchemeColor == appBarBackgroundSchemeColor &&
        other.appBarForegroundSchemeColor == appBarForegroundSchemeColor &&
        other.appBarIconSchemeColor == appBarIconSchemeColor &&
        other.appBarActionsIconSchemeColor == appBarActionsIconSchemeColor &&
        other.appBarCenterTitle == appBarCenterTitle &&
        other.appBarScrolledUnderElevation == appBarScrolledUnderElevation &&
        other.appBarToolbarTextStyle == appBarToolbarTextStyle &&
        other.appBarTitleTextStyle == appBarTitleTextStyle &&
        //
        other.bottomAppBarSchemeColor == bottomAppBarSchemeColor &&
        other.bottomAppBarHeight == bottomAppBarHeight &&
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
        other.tabBarTabAlignment == tabBarTabAlignment &&
        other.tabBarIndicatorAnimation == tabBarIndicatorAnimation &&
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
        other.bottomSheetClipBehavior == bottomSheetClipBehavior &&
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
        other.navigationRailGroupAlignment == navigationRailGroupAlignment &&
        other.navigationRailMinWidth == navigationRailMinWidth &&
        other.navigationRailMinExtendedWidth == navigationRailMinExtendedWidth;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hashAll(<Object?>[
        interactionEffects,
        tintedDisabledControls,
        blendOnLevel,
        blendOnColors,
        //
        adaptiveRemoveElevationTint,
        adaptiveElevationShadowsBack,
        adaptiveAppBarScrollUnderOff,
        adaptiveRadius,
        adaptiveDialogRadius,
        adaptiveInputDecoratorRadius,
        //
        adaptiveSplash,
        splashType,
        splashTypeAdaptive,
        //
        // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
        // blendTextTheme,
        useMaterial3Typography,
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
        toggleButtonsSelectedForegroundSchemeColor,
        toggleButtonsUnselectedSchemeColor,
        toggleButtonsBorderSchemeColor,
        toggleButtonsBorderWidth,
        toggleButtonsTextStyle,
        //
        segmentedButtonRadius,
        segmentedButtonSchemeColor,
        segmentedButtonSelectedForegroundSchemeColor,
        segmentedButtonUnselectedSchemeColor,
        segmentedButtonUnselectedForegroundSchemeColor,
        segmentedButtonBorderSchemeColor,
        segmentedButtonBorderWidth,
        segmentedButtonTextStyle,
        //
        scaffoldBackgroundBaseColor,
        scaffoldBackgroundSchemeColor,
        materialButtonSchemeColor,
        //
        switchSchemeColor,
        switchThumbSchemeColor,
        switchThumbFixedSize,
        switchAdaptiveCupertinoLike,
        //
        checkboxSchemeColor,
        radioSchemeColor,
        unselectedToggleIsColored,
        //
        sliderBaseSchemeColor,
        sliderThumbSchemeColor,
        sliderIndicatorSchemeColor,
        sliderValueTinted,
        sliderValueIndicatorType,
        sliderShowValueIndicator,
        sliderTrackHeight,
        //
        inputDecoratorRadius,
        inputDecoratorRadiusAdaptive,
        inputDecoratorSchemeColor,
        inputDecoratorContentPadding,
        inputDecoratorIsDense,
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
        inputDecoratorSuffixIconSchemeColor,
        //
        inputCursorSchemeColor,
        inputSelectionSchemeColor,
        inputSelectionOpacity,
        inputSelectionHandleSchemeColor,
        //
        listTileSelectedSchemeColor,
        listTileIconSchemeColor,
        listTileTextSchemeColor,
        listTileTitleTextStyle,
        listTileSubtitleTextStyle,
        listTileLeadingAndTrailingTextStyle,
        listTileTileSchemeColor,
        listTileSelectedTileSchemeColor,
        listTileContentPadding,
        listTileHorizontalTitleGap,
        listTileMinVerticalPadding,
        listTileStyle,
        listTileTitleAlignment,
        listTileControlAffinity,
        //
        fabRadius,
        fabUseShape,
        fabAlwaysCircular,
        fabSchemeColor,
        fabForegroundSchemeColor,
        fabExtendedTextStyle,
        //
        chipRadius,
        chipBlendColors,
        chipSchemeColor,
        chipSelectedSchemeColor,
        chipSecondarySelectedSchemeColor,
        chipDeleteIconSchemeColor,
        chipLabelStyle,
        chipSecondaryLabelStyle,
        chipFontSize,
        chipSecondaryFontSize,
        chipIconSize,
        chipPadding,
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
        menuButtonTextStyle,
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
        searchBarBackgroundSchemeColor,
        searchViewBackgroundSchemeColor,
        searchBarElevation,
        searchViewElevation,
        searchBarRadius,
        searchViewRadius,
        searchUseGlobalShape,
        searchViewHeaderHeight,
        searchBarTextStyle,
        searchViewHeaderTextStyle,
        searchBarHintStyle,
        searchViewHeaderHintStyle,
        searchViewDividerColor,
        searchBarShadowColor,
        searchBarTextCapitalization,
        searchBarPadding,
        searchBarConstraints,
        searchViewConstraints,
        //
        useInputDecoratorThemeInDialogs,
        dialogRadius,
        dialogRadiusAdaptive,
        dialogElevation,
        dialogBackgroundSchemeColor,
        dialogTitleTextStyle,
        dialogContentTextStyle,
        //
        datePickerHeaderBackgroundSchemeColor,
        datePickerHeaderForegroundSchemeColor,
        datePickerDialogRadius,
        datePickerDividerSchemeColor,
        datePickerHeaderHeadlineStyle,
        datePickerHeaderHelpStyle,
        datePickerWeekdayStyle,
        datePickerDayStyle,
        datePickerYearStyle,
        datePickerRangePickerHeaderHeadlineStyle,
        datePickerRangePickerHeaderHelpStyle,
        //
        timePickerDialogRadius,
        timePickerElementRadius,
        timePickerDayPeriodTextStyle,
        timePickerDialTextStyle,
        timePickerHelpTextStyle,
        timePickerHourMinuteTextStyle,
        //
        snackBarRadius,
        snackBarElevation,
        snackBarBackgroundSchemeColor,
        snackBarActionSchemeColor,
        snackBarContentTextStyle,
        //
        appBarBackgroundSchemeColor,
        appBarForegroundSchemeColor,
        appBarIconSchemeColor,
        appBarActionsIconSchemeColor,
        appBarCenterTitle,
        appBarScrolledUnderElevation,
        appBarToolbarTextStyle,
        appBarTitleTextStyle,
        //
        bottomAppBarSchemeColor,
        bottomAppBarHeight,
        //
        tabBarItemSchemeColor,
        tabBarUnselectedItemSchemeColor,
        tabBarUnselectedItemOpacity,
        tabBarIndicatorSchemeColor,
        tabBarIndicatorSize,
        tabBarIndicatorWeight,
        tabBarIndicatorTopRadius,
        tabBarDividerColor,
        tabBarTabAlignment,
        tabBarIndicatorAnimation,
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
        bottomSheetClipBehavior,
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
        navigationRailMinWidth,
        navigationRailMinExtendedWidth,
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
    //
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveRemoveElevationTint', adaptiveRemoveElevationTint));
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveElevationShadowsBack', adaptiveElevationShadowsBack));
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveAppBarScrollUnderOff', adaptiveAppBarScrollUnderOff));
    properties.add(
        DiagnosticsProperty<FlexAdaptive>('adaptiveRadius', adaptiveRadius));
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveDialogRadius', adaptiveDialogRadius));
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'adaptiveInputDecoratorRadius', adaptiveInputDecoratorRadius));
    //
    properties.add(
        DiagnosticsProperty<FlexAdaptive>('adaptiveSplash', adaptiveSplash));
    properties.add(EnumProperty<FlexSplashType>('splashType', splashType));
    properties.add(
        EnumProperty<FlexSplashType>('splashTypeAdaptive', splashTypeAdaptive));
    //
    // TODO(rydmike): Commented as part of deprecation of blendTextTheme.
    // properties.add(DiagnosticsProperty<bool>('blendTextTheme',
    // blendTextTheme));
    properties.add(DiagnosticsProperty<bool>(
        'useMaterial3Typography', useMaterial3Typography));
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
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'textButtonTextStyle', textButtonTextStyle));
    //
    properties.add(
        DiagnosticsProperty<double>('filledButtonRadius', filledButtonRadius));
    properties.add(EnumProperty<SchemeColor>(
        'filledButtonSchemeColor', filledButtonSchemeColor));
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'filledButtonTextStyle', filledButtonTextStyle));
    //
    // TODO(rydmike): Hold for https://github.com/flutter/flutter/issues/115827
    // properties.add(DiagnosticsProperty<double>(
    //     'filledButtonTonalRadius', filledButtonTonalRadius));
    // properties.add(EnumProperty<SchemeColor>(
    //     'filledButtonTonalSchemeColor', filledButtonTonalSchemeColor));
    // properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
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
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
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
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'outlinedButtonTextStyle', outlinedButtonTextStyle));
    //
    properties.add(DiagnosticsProperty<double>(
        'toggleButtonsRadius', toggleButtonsRadius));
    properties.add(EnumProperty<SchemeColor>(
        'toggleButtonsSchemeColor', toggleButtonsSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'toggleButtonsSelectedForegroundSchemeColor',
        toggleButtonsSelectedForegroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'toggleButtonsUnselectedSchemeColor',
        toggleButtonsUnselectedSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'toggleButtonsBorderSchemeColor', toggleButtonsBorderSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'toggleButtonsBorderWidth', toggleButtonsBorderWidth));
    properties.add(DiagnosticsProperty<TextStyle>(
        'toggleButtonsTextStyle', toggleButtonsTextStyle));
    //
    properties.add(DiagnosticsProperty<double>(
        'segmentedButtonRadius', segmentedButtonRadius));
    properties.add(EnumProperty<SchemeColor>(
        'segmentedButtonSchemeColor', segmentedButtonSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'segmentedButtonSelectedForegroundSchemeColor',
        segmentedButtonSelectedForegroundSchemeColor));
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
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'segmentedButtonTextStyle', segmentedButtonTextStyle));
    //
    properties.add(EnumProperty<FlexScaffoldBaseColor>(
        'scaffoldBackgroundBaseColor', scaffoldBackgroundBaseColor));
    properties.add(EnumProperty<SchemeColor>(
        'scaffoldBackgroundSchemeColor', scaffoldBackgroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'materialButtonSchemeColor', materialButtonSchemeColor));
    //
    properties
        .add(EnumProperty<SchemeColor>('switchSchemeColor', switchSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'switchThumbSchemeColor', switchThumbSchemeColor));
    properties.add(DiagnosticsProperty<bool>(
        'switchThumbFixedSize', switchThumbFixedSize));
    properties.add(DiagnosticsProperty<FlexAdaptive>(
        'switchAdaptiveCupertinoLike', switchAdaptiveCupertinoLike));
    //
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
        'sliderThumbSchemeColor', sliderThumbSchemeColor));
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
    properties.add(DiagnosticsProperty<double>(
        'inputDecoratorRadiusAdaptive', inputDecoratorRadiusAdaptive));
    properties.add(EnumProperty<SchemeColor>(
        'inputDecoratorSchemeColor', inputDecoratorSchemeColor));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'inputDecoratorContentPadding', inputDecoratorContentPadding));
    properties.add(DiagnosticsProperty<bool>(
        'inputDecoratorIsDense', inputDecoratorIsDense));
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
    properties.add(EnumProperty<SchemeColor>(
        'inputDecoratorSuffixIconSchemeColor',
        inputDecoratorSuffixIconSchemeColor));
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
    properties.add(EnumProperty<SchemeColor>(
        'listTileSelectedSchemeColor', listTileSelectedSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'listTileIconSchemeColor', listTileIconSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'listTileTextSchemeColor', listTileTextSchemeColor));
    properties.add(DiagnosticsProperty<TextStyle>(
        'listTileTitleTextStyle', listTileTitleTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'listTileSubtitleTextStyle', listTileSubtitleTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'listTileLeadingAndTrailingTextStyle',
        listTileLeadingAndTrailingTextStyle));
    properties.add(EnumProperty<SchemeColor>(
        'listTileTileSchemeColor', listTileTileSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'listTileSelectedTileSchemeColor', listTileSelectedTileSchemeColor));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'listTileContentPadding', listTileContentPadding));
    properties.add(DiagnosticsProperty<double>(
        'listTileHorizontalTitleGap', listTileHorizontalTitleGap));
    properties.add(DiagnosticsProperty<double>(
        'listTileMinVerticalPadding', listTileMinVerticalPadding));
    properties.add(EnumProperty<ListTileStyle>('listTileStyle', listTileStyle));
    properties.add(EnumProperty<ListTileTitleAlignment>(
        'listTileTitleAlignment', listTileTitleAlignment));
    properties.add(EnumProperty<ListTileControlAffinity>(
        'listTileControlAffinity', listTileControlAffinity));
    //
    properties.add(DiagnosticsProperty<double>('fabRadius', fabRadius));
    properties.add(DiagnosticsProperty<bool>('fabUseShape', fabUseShape));
    properties
        .add(DiagnosticsProperty<bool>('fabAlwaysCircular', fabAlwaysCircular));
    properties.add(EnumProperty<SchemeColor>('fabSchemeColor', fabSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'fabForegroundSchemeColor', fabForegroundSchemeColor));
    properties.add(DiagnosticsProperty<TextStyle>(
        'fabExtendedTextStyle', fabExtendedTextStyle));
    //
    properties.add(DiagnosticsProperty<double>('chipRadius', chipRadius));
    properties
        .add(DiagnosticsProperty<bool>('chipBlendColors', chipBlendColors));
    properties
        .add(EnumProperty<SchemeColor>('chipSchemeColor', chipSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'chipSelectedSchemeColor', chipSelectedSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'chipSecondarySelectedSchemeColor', chipSecondarySelectedSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'chipDeleteIconSchemeColor', chipDeleteIconSchemeColor));
    properties
        .add(DiagnosticsProperty<TextStyle>('chipLabelStyle', chipLabelStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'chipSecondaryLabelStyle', chipSecondaryLabelStyle));
    properties.add(DiagnosticsProperty<double>('chipFontSize', chipFontSize));
    properties.add(DiagnosticsProperty<double>(
        'chipSecondaryFontSize', chipSecondaryFontSize));
    properties.add(DiagnosticsProperty<double>('chipIconSize', chipIconSize));
    properties.add(
        DiagnosticsProperty<EdgeInsetsGeometry>('chipPadding', chipPadding));
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
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'menuButtonTextStyle', menuButtonTextStyle));
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
    properties.add(EnumProperty<SchemeColor>(
        'searchBarBackgroundSchemeColor', searchBarBackgroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'searchViewBackgroundSchemeColor', searchViewBackgroundSchemeColor));
    properties.add(
        DiagnosticsProperty<double>('searchBarElevation', searchBarElevation));
    properties.add(DiagnosticsProperty<double>(
        'searchViewElevation', searchViewElevation));
    properties
        .add(DiagnosticsProperty<double>('searchBarRadius', searchBarRadius));
    properties
        .add(DiagnosticsProperty<double>('searchViewRadius', searchViewRadius));
    properties
        .add(DiagnosticsProperty<bool>('searchUseShape', searchUseGlobalShape));
    properties.add(DiagnosticsProperty<double>(
        'searchViewHeaderHeight', searchViewHeaderHeight));
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'searchBarTextStyle', searchBarTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'searchViewHeaderTextStyle', searchViewHeaderTextStyle));
    properties.add(DiagnosticsProperty<WidgetStateProperty<TextStyle?>>(
        'searchBarHintStyle', searchBarHintStyle));
    properties.add(DiagnosticsProperty<TextStyle?>(
        'searchViewHeaderHintStyle', searchViewHeaderHintStyle));
    properties
        .add(ColorProperty('searchViewDividerColor', searchViewDividerColor));
    properties.add(ColorProperty('searchBarShadowColor', searchBarShadowColor));
    properties.add(EnumProperty<TextCapitalization>(
        'searchBarTextCapitalization', searchBarTextCapitalization));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'searchBarPadding', searchBarPadding));
    properties.add(DiagnosticsProperty<BoxConstraints>(
        'searchBarConstraints', searchBarConstraints));
    properties.add(DiagnosticsProperty<BoxConstraints>(
        'searchViewConstraints', searchViewConstraints));
    //
    properties.add(DiagnosticsProperty<bool>(
        'useInputDecoratorThemeInDialogs', useInputDecoratorThemeInDialogs));
    properties.add(DiagnosticsProperty<double>('dialogRadius', dialogRadius));
    properties.add(DiagnosticsProperty<double>(
        'dialogRadiusAdaptive', dialogRadiusAdaptive));
    properties
        .add(DiagnosticsProperty<double>('dialogElevation', dialogElevation));
    properties.add(EnumProperty<SchemeColor>(
        'dialogBackgroundSchemeColor', dialogBackgroundSchemeColor));
    properties.add(DiagnosticsProperty<TextStyle>(
        'dialogTitleTextStyle', dialogTitleTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'dialogContentTextStyle', dialogContentTextStyle));
    //
    properties.add(EnumProperty<SchemeColor>(
        'datePickerHeaderBackgroundSchemeColor',
        datePickerHeaderBackgroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'datePickerHeaderForegroundSchemeColor',
        datePickerHeaderForegroundSchemeColor));
    properties.add(DiagnosticsProperty<double>(
        'datePickerDialogRadius', datePickerDialogRadius));
    properties.add(EnumProperty<SchemeColor>(
        'datePickerDividerSchemeColor', datePickerDividerSchemeColor));
    properties.add(DiagnosticsProperty<TextStyle>(
        'datePickerHeaderHeadlineStyle', datePickerHeaderHeadlineStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'datePickerHeaderHelpStyle', datePickerHeaderHelpStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'datePickerWeekdayStyle', datePickerWeekdayStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'datePickerDayStyle', datePickerDayStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'datePickerYearStyle', datePickerYearStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'datePickerRangePickerHeaderHeadlineStyle',
        datePickerRangePickerHeaderHeadlineStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'datePickerRangePickerHeaderHelpStyle',
        datePickerRangePickerHeaderHelpStyle));
    //
    properties.add(DiagnosticsProperty<double>(
        'timePickerDialogRadius', timePickerDialogRadius));
    properties.add(DiagnosticsProperty<double>(
        'timePickerElementRadius', timePickerElementRadius));
    properties.add(DiagnosticsProperty<TextStyle>(
        'timePickerDayPeriodTextStyle', timePickerDayPeriodTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'timePickerDialTextStyle', timePickerDialTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'timePickerHelpTextStyle', timePickerHelpTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'timePickerHourMinuteTextStyle', timePickerHourMinuteTextStyle));
    //
    properties
        .add(DiagnosticsProperty<double>('snackBarRadius', snackBarRadius));
    properties.add(
        DiagnosticsProperty<double>('snackBarElevation', snackBarElevation));
    properties.add(EnumProperty<SchemeColor>(
        'snackBarBackgroundSchemeColor', snackBarBackgroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'snackBarActionSchemeColor', snackBarActionSchemeColor));
    properties.add(DiagnosticsProperty<TextStyle>(
        'snackBarContentTextStyle', snackBarContentTextStyle));
    //
    properties.add(EnumProperty<SchemeColor>(
        'appBarBackgroundSchemeColor', appBarBackgroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'appBarForegroundSchemeColor', appBarForegroundSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'appBarIconSchemeColor', appBarIconSchemeColor));
    properties.add(EnumProperty<SchemeColor>(
        'appBarActionsIconSchemeColor', appBarActionsIconSchemeColor));
    properties
        .add(DiagnosticsProperty<bool>('appBarCenterTitle', appBarCenterTitle));
    properties.add(DiagnosticsProperty<double>(
        'appBarScrolledUnderElevation', appBarScrolledUnderElevation));
    properties.add(DiagnosticsProperty<TextStyle>(
        'appBarToolbarTextStyle', appBarToolbarTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'appBarTitleTextStyle', appBarTitleTextStyle));
    //
    properties.add(EnumProperty<SchemeColor>(
        'bottomAppBarSchemeColor', bottomAppBarSchemeColor));
    properties.add(
        DiagnosticsProperty<double>('bottomAppBarHeight', bottomAppBarHeight));
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
    properties.add(
        EnumProperty<TabAlignment>('tabBarTabAlignment', tabBarTabAlignment));
    properties.add(EnumProperty<TabIndicatorAnimation>(
        'tabBarIndicatorAnimation', tabBarIndicatorAnimation));
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
    properties.add(
        EnumProperty<Clip>('bottomSheetClipBehavior', bottomSheetClipBehavior));
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
    properties.add(DiagnosticsProperty<double>(
        'navigationRailMinWidth', navigationRailMinWidth));
    properties.add(DiagnosticsProperty<double>(
        'navigationRailMinExtendedWidth', navigationRailMinExtendedWidth));
  }
}
