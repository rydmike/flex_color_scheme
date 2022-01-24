# Inside FlexColorScheme


This document provides more details and explanations
of the inner workings of FlexColorScheme V4. The reason for keeping it in
a separate file from the package readme is that the package readme is
already very long, and keeping it separate document allows it to be updated and
complemented more freely without updating the package due to complementary
documentation updates.

## Version 4 Notice

This document is ported from the version 3 readme documentation.
It still applies to version 4, it will be updated and more inside documentation
added when this document is merged and included in a separate documentation site.

# Contents
- [Introduction](#introduction)
- [None null sub-themes](#none-null-sub-themes)
- [ThemeData modifications](#themedata-modifications)
- [Additional optional widget sub-theming](#additional-optional-widget-sub-theming)

# Introduction 

**FlexColorScheme** does not actually use the `ThemeData.from` factory with a passed
in `ColorScheme` to make its `ThemeData` object. It uses the `ThemeData` factory directly, with
some additional custom theming.  It does of course define a `ColorScheme` that it uses in its `ThemeData`.
FlexColorScheme uses color calculations for the primary color branded/blended surfaces, and
for the lazy schemes that do not specify all colors in a color scheme.

# None Null Sub-Themes

Flutter's default Theme and its ThemeData is moving towards a design where all the sub-theme's in the default
ThemeData are NULL. It is always the widget that defines the default behavior and look when its sub-theme and its
properties are null and its properties for the same values are null. The widget colors for such cases are
then defined by `ThemeData.of(context).colorScheme`.

This Flutter theming design goal is described in this
[document](https://docs.google.com/document/d/1kzIOQN4QYfVsc5lMZgy_A-FWGXBAJBMySGqZqsJytcE). It is mostly implemented
by now, but there might still be some sub-themes in Flutter SDK remaining that do not fully adhere to this design.

FlexColorScheme sets `ThemeData.of(context).colorScheme` to ensure that its colors are applied to all widgets
that adhere to this newer standard. It also sets all still existing legacy colors in
`ThemeData.of(context)`, that some Flutter Widgets still use, to use scheme appropriate or scheme derived colors.
Thanks to this there should not be any built-in Widgets in Flutter that do not get color scheme themed
by FlexColorScheme.

The ThemeData created by `FlexColorScheme().toTheme` also tries to not create and modify sub-themes when it does not
have to. However, to meet its design goals, FlexColorScheme has to create a number of sub-themes and set some
of their properties. In some rare cases this is done to correct theming issues in Flutter SDK, and sometimes to
reach its own design goals. Further below is a list of all the sub-themes it creates and properties that you can
**currently** expect to have none null values in them. These sub-themes and their properties,
would otherwise be null when just using default `ThemeData()` or `ThemeData.from()` factories, if they
did not specify sub-themes.

Even though some sub-themes currently are not null, and have some none null properties in FlexColorScheme
based `ThemeData`. It is still recommended to use null fallback values if you access ThemeData sub-themes and
their properties in `ThemeData.of(context)` that are null in default `ThemeData`.

For example, when using the AppBar's theme data, don't just use:

```dart
final Color fabColor = Theme.of(context).appBarTheme.backgroundColor;
```

It should never be considered fully **safe** to access properties like it without using null fallbacks.
Instead, do something similar to this:

```dart
final Color fabColor = Theme.of(context)?.appBarTheme?.backgroundColor ??
  Theme.of(context).colorScheme.primary ?? kMyDefaultAppBarColor;
```

**FlexColorScheme** will try to not change past creation of its none null sub-themes. However, changes to these
implementation details are only considered breaking if they produce a theme that is visibly different from
past behavior.

**Flutter SDK** may also change some of its implementation details of `ThemeData`. Take for example the broken
Chip case, if it is modified to fix its dark theme bug, then FlexColorScheme would have no reason
for its own fix. In cases where Flutter defaults moves in a direction that the same definition is no longer
needed in FlexColorScheme, such sub-theme definitions may eventually be removed, **but not without due warning**.

One recent such case was the `floatingActionButtonTheme` sub-theme that FlexColorScheme created in earlier
versions. The used sub-theme did not change Flutter's default behavior. However, in some older versions of
Flutter there was a severe deprecation warning if the sub-theme was not defined. Later it was
observed that Flutter SDK default and FlexColorScheme sub-theme now agrees 100% on the design. There was
no longer any deprecated warning if the sub-theme was totally removed from FlexColorScheme's theme definition.
This sub-theme definition was thus no longer needed and was removed starting from FlexColorScheme  
version 2.0.0-nullsafety.2.

Another similar change that has still not landed in Flutter 2.2.x stable channel, is the deprecation
of `ThemeData.accentColor`. From version 3.0.0 **FlexColorScheme** is prepared for when this
change lands in stable.

* **AppBarTheme** in `ThemeData.appBarTheme` is NOT null.  
  The actual values are defined to match the offered convenience theming options for the AppBar.
  The property values depend on made configuration choices.
    * backgroundColor: *Depends on chosen `appBarStyle`.*
    * foregroundColor: Black if brightness of backgroundColor is light otherwise white.
    * iconTheme: Not null, defines:
        * color: : *Depends on chosen `appBarStyle`.*
    * actionsIconTheme: Not null, defines:
        * color: : *Depends on chosen `appBarStyle`.*
    * elevation: *As defined, default is 0*
    * systemOverlayStyle: *A custom SystemUiOverlayStyle is defined*
    * backwardsCompatibility: `false`


* **BottomAppBarTheme** in `ThemeData.bottomAppBarTheme` is NOT null.
    * Color: `colorScheme.background`
    * elevation: *As defined, default is 0*


* **TextSelectionThemeData** in `ThemeData.bottomAppBarTheme` is NOT null.
    * selectionColor: `dark ? primary.withOpacity(0.50) : primary.withOpacity(0.30)`
    * selectionHandleColor: `primaryColorDark`


* **InputDecorationTheme** in `ThemeData.inputDecorationTheme` is NOT null.
    * filled: `true`
    * fillColor: `dark ? primary.withOpacity(0.06) : primary.withOpacity(0.35)`


* **ButtonThemeData** in `ThemeData.buttonTheme` is NOT null.
    * colorScheme: `colorScheme`
    * textTheme: `ButtonTextTheme.primary`
    * materialTapTargetSize: `MaterialTapTargetSize.shrinkWrap`
    * padding: `EdgeInsets.symmetric(horizontal: 16)`


* **ChipThemeData** in `ThemeData.chipTheme` is NOT null.  
  It is defined to fix issue [#65663](https://github.com/flutter/flutter/issues/65663) and uses
  ChipThemeData.fromDefaults to set:
    * secondaryColor: `colorScheme.primary`
    * brightness: `colorScheme.brightness`
    * labelStyle: `textTheme.bodyText1`


* **TabBarTheme** in `ThemeData.tabBarTheme` is NOT null.  
  Its colors depend on if a theme appropriate for current active app bar background color (default), or one for
  background and surface color usage is selected. It sets:
    * indicatorSize: `TabBarIndicatorSize.tab`
    * labelStyle: `TextTheme().button`
    * labelColor: *Depends on selected and targeted main usage.*
    * unselectedLabelColor: *Depends on selected and targeted main usage*.


* **BottomNavigationBarThemeData** in `ThemeData.bottomNavigationBarTheme` is NOT null.
    * selectedIconTheme: Not null, defines:
        *  color: `colorScheme.primary`
    * selectedItemColor: `colorScheme.primary`


* **TooltipThemeData** in `ThemeData.tooltipTheme` is NOT null. This theme is
  modified to address issue [#71429](https://github.com/flutter/flutter/issues/71429) and
  to also enable a toggle that inverts the tooltip colors, which is a style often
  used on Windows desktops. The toggle can be used to change the style depending on the current platform.
  The used logic and theme changes are defined as.
    * margin: `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`
    * padding: `desktop ? EdgeInsets.fromLTRB(8, 3, 8, 4) : EdgeInsets.symmetric(horizontal: 16, vertical: 8)`
    * textStyle:
      ```dart
      textTheme.bodyText2.copyWith(  
        inherit: false,
        color: tooltipsMatchBackground 
           ? dark ? Colors.white : Colors.black    
           : dark ? Colors.black : Colors.white,    
        fontSize: desktop ? 12 : 14)
      ```
    * decoration:
      ```dart
      tooltipsMatchBackground
        ? BoxDecoration(
           color: isDark ? const Color(0xED444444) : const Color(0xF0FCFCFC),
           borderRadius: const BorderRadius.all(Radius.circular(4)),
           border: Border.all(color: dividerThemeColor))
       : null // Use default Flutter SDK decoration.
      ```

# ThemeData Modifications

In addition to the primary color branded surfaces, full shaded schemes from just one primary color, true
black and app bar convenience tricks. The returned `ThemeData` contains some opinionated modifications and theme
corrections compared to what you get if you would just use the standard `ThemeData.from` with a `ColorScheme`.

You can still of course override the returned `ThemeData` with your own theme modifications and
additions, by using the `copyWith` method on the resulting `ThemeData` object.

The following lists the full details of what the differences compared to the standard `ThemeData.from` factory
are, as well as the rationale behind the made design choices and changes to the defaults.

* `ScaffoldBackground` has its own color property in `FlexColorScheme`
  and can if so desired differ from the `ColorScheme.background`
  color. In the used surface branding implementation, the `scaffoldBackground`
  typically gets no primary branding applied. Only in the heavy choice
  is there a small amount. Whereas `background` in a FlexColorScheme theme
  receives the most color branding of the surface colors. This fits
  well for where the `background` color is typically used in Material background
  by Widgets, but it does not go so well together with `scaffoldBackground`.
  This is why it has its own color value in this implementation.


* The `dialogBackgroundColor` uses the `ColorScheme.surface` color
  instead of `ColorScheme.background`. The `background` color needed
  the strongest branding when branding is used, but this did not look
  so good on dialogs. Therefore, its color choice was changed to `surface`
  instead, that gets much lighter branding in FlexColorScheme when it is
  used. With standard Material surface colors, the `background` and
  `surface` colors are the same, so there is no difference when using
  the default background and surface colors.


* The `indicatorColor` is same as effectiveTabColor. It uses a function with
  logic to determine its color bases on if a TabBarTheme was selected that should
  work on current app bar background color, or on surface/background colors.


* For `toggleableActiveColor` the `ColorScheme.secondary` color is used.
  The Flutter default just uses the default `ThemeData` colors and
  not the actual colors you define in the `ColorScheme` you create your
  theme from. Perhaps an oversight in Flutter?
  See issue [#65782](https://github.com/flutter/flutter/issues/65782).


* Flutter themes created with `ThemeData.from` do not define any color
  scheme related color for the `primaryColorDark` color, this method
  does.  See issue [#65782](https://github.com/flutter/flutter/issues/65782).
  The `ThemeData.from` leaves this color at `ThemeData` factory default,
  this may not match your scheme. Flutter SDK Widgets seldom use this color,
  so the issue is rarely seen. Like `accentColor`, this color may be
  deprecated in the Flutter SDK in upcoming versions.


* Flutter themes created with `ThemeData.from` do not define any color
  scheme based color for the `primaryColorLight` color, this method does.
  See issue [#65782](https://github.com/flutter/flutter/issues/65782).
  The `ThemeData.from` leaves this color at `ThemeData` factory default
  this may not match your scheme.  Flutter SDK Widgets seldom use this color,
  so the issue is rarely seen. Like `accentColor`, this color may be
  deprecated in the Flutter SDK in upcoming versions.


* Flutter themes created with `ThemeData.from` do not define any color
  scheme based color for the `secondaryHeaderColor` color, this method
  does. See issue [#65782](https://github.com/flutter/flutter/issues/65782).
  `ThemeData.from` leaves this color at `ThemeData` factory default this
  may not match your scheme.  Flutter SDK Widgets seldom use this color,
  so the issue is rarely seen. Like `accentColor`, this color may be
  deprecated in the Flutter SDK in upcoming versions.


* Background color for `AppBarTheme` can use a custom color theme
  in both light and dark themes, that is not dependent on the theme's
  primary or surface color.
  In the versions prior to Flutter 2.0.0 doing this was difficult to do,
  as presented in [#50606](https://github.com/flutter/flutter/issues/50606)
  A new feature in Flutter 2.0.0 implemented via:
  [#71184](https://github.com/flutter/flutter/pull/71184) makes this easy and
  better. FlexColorScheme's implementation has been changed to use this
  new AppBarTheme feature starting from version 2.0.0-nullsafety.2.


* The `AppBarTheme` elevation defaults to 0, an iOs style influenced
  opinionated choice. It can easily be adjusted directly in the
  `FlexColorScheme` definition with property value `appBarElevation`
  without creating a sub theme or using `copyWith`.


* The `bottomAppBarColor` uses color scheme background color to match the
  background color of the drawer, bottom navigation bar, possible side
  menu and system navigation bar on android, if theming of it is used.
  This is a slight change from the ColorScheme default that uses
  surface color.


* The `BottomAppBarTheme` elevation defaults to `appBarElevation` or 0 if
  it is null, an iOs style influenced opinionated choice. It can easily
  be adjusted directly in the `FlexColorScheme` definition with property
  value `bottomAppBarElevation` without creating a sub theme or
  using `copyWith`.


* In `TextSelectionThemeData`, the standard for `selectionColor` is
  `colorScheme.primary` with opacity value `0.4` for dark-mode and `0.12`
  for light mode. Here, primary with `0.5` opacity for dark-mode and `0.3` for
  light mode is used. The standard for `selectionHandleColor` is
  `colorScheme.primary`, here we use the slightly darker shade
  `primaryColorDark` instead, which does not have a proper color
  scheme color value in Flutter standard `ColorScheme` based themes.


* A predefined slightly opinionated `InputDecorationTheme` is used. It
  sets `filled` to `true` and fill color to color scheme primary color
  with opacity `0.035` in light mode and with opacity `0.06` in dark-mode.    
  Since the used theme, does not define a `border` property of `TextField`,
  an app can easily use both the default underline style, or the
  outline style by just specifying `OutlineInputBorder()`,
  when an outlined `TextField` is desired.
  If you don't  want the filled style, or the primary colored
  borders in dark-mode, you can override them back with `copyWith`.


* The property `fixTextFieldOutlineLabel` is set to `true` by default,
  it looks better. The only reason why it is not the default in Flutter,
  is for default backwards legacy design compatibility.


* **NOTE:**  
  Since the old buttons have been deprecated in Flutter 2.0.0
  they are no longer presented or used in code in FlexColorScheme and its
  examples. **However**, FlexColorScheme still defines the theme for
  them described below. Defining the theme does not yet cause any
  deprecation warnings or errors, as long as that is the case. this
  theming will be kept available to support out of the box nice themes for
  the old buttons as before.


* Button theming is applied to `ThemeData.buttonColor` using color
  `colorScheme.primary` color.


* For `ThemeData.buttonTheme` the entire color scheme is passed to its
  `colorScheme` property, and it uses `textTheme` set to
  `ButtonTextTheme.primary`, plus minor changes to padding and tap target
  size. These modifications make the old buttons almost match the
  default design and look of their corresponding newer buttons.
  The `RaisedButton` looks very similar to `ElevatedButton`,
  `OutlineButton` to `OutlinedButton` and `FlatButton` to `TextButton`.
  There are some differences in margins and looks, especially in
  dark-mode, but they are very similar.


* The default theme for Chips contain a design bug that makes the
  selected `ChoiceChip` widget look disabled in dark-mode, regardless
  if was created with `ThemeData` or `ThemeData.from` factory.
  See issue [#65663](https://github.com/flutter/flutter/issues/65663).
  The `ChipThemeData` modification used here fixes the issue.


* For `TabBarTheme`, the Flutter standard selected tab and indicator
  color is onSurface in dark-mode and onPrimary in light mode, which is
  designed to fit an AppBar colored TabBar. This is kept, and the default
  via `FlexTabBarStyle.forAppBar` style, with a minor modification. If
  AppBar is "light", then black87 is used, not black, it is the same as
  the textTheme on AppBar in light app bar brightness.
  If the `FlexTabBarStyle.forBackground` style was used, the
  selected  color is always color scheme primary color, which works well
  on surface, background and scaffold background colors.

  The unselected TabBar color when `FlexTabBarStyle.forBackground` style
  is used, is always the onSurface color with 60% opacity. This is also
  the color if the AppBar background color brightness is light AND its
  color is white, surface or background colored.
  Otherwise, when the style `FlexTabBarStyle.forAppBar` is used, the
  unselected tab bar color is the selected tab color with 70% opacity.
  This opacity value is the same  as Flutter default for the default
  theme that is also designed for AppBar usage.


* The `BottomNavigationBarThemeData` uses color scheme primary color for
  the selected item in both light and dark theme mode. Flutter default uses
  primary in light mode, but default to secondary color in dark mode. Primary
  color is a design used on iOS by default for the bottom navigation bar in
  both theme modes. We agree and think it looks better as the default 
  choice for apps in both theme modes.


* Default `tooltipTheme` in Flutter is currently a bit flawed on desktop
  and web, because it defaults to using a very small font (10dp).
  See issue [#71429](https://github.com/flutter/flutter/issues/71429).
  The default theming also does not handle multiline tooltips very well.
  The here used `TooltipThemeData` theme design, corrects both these
  issues. It uses 12dp font on desktop and web instead of 10dp,
  and some padding instead of a height constraint to ensure that
  multiline tooltips look nice too.


* FlexColorScheme also includes a boolean property
  `tooltipsMatchBackground`, that can be toggled to not use Flutter's
  Material default design that has a theme mode
  inverted background. Tooltips using light background in light theme
  and dark in dark, are commonly used on the Windows desktop platform.
  You can easily tie this extra property to the used platform to make an automatic
  platform adaptation of the tooltip style if you like. You can also use it
  to give users a preference toggle where they change the tooltip
  style to their liking.


* The property `transparentStatusBar` is set to true by default. It is
  used to make to the AppBar one-toned on Android devices, like on iOS devices.
  Set it to `false` if you want to restore the default Android two toned design.

# Additional Optional Widget Sub-Theming

FlexColorScheme V4 also offers opinionated widget sub-theming that enables you to get
more heavily styled and themed widgets automatically. You can customize the
styles further via
[FlexSubThemesData](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexSubThemesData-class.html).

These sub-themes are as the heading states **opinionated** design choices.
You may or may not like them. They can be modified and tuned, some of them only
a bit, while some offer quite extensive quick configuration options. The intent
is to keep the sub-themes visual results consistent from version to version.
However, changes in the SDK and supporting new features may require minor
visual breaking changes to them from time to time.

The defaults for these
Flutter Material 2 based theming features, draw inspiration from Material 3,
and their defaults follow the [Material 3 Design Guide](https://m3.material.io/), 
within reasonable limits of current Flutter Material 2 based theming capabilities.

The sub-themes will be modified and extended when Material 3 features reaches
Flutter stable channel, to use actual Material 3 implementations in Flutter.
This may modify the design of some sub-themes. These changes
are planned to be included in FlexColorScheme v5, that will be released after
enough Material 3 features have reached Flutter stable channel. A dev version
of the package may be released before that, that requires using Flutter
master channel.

To use the optional sub-theming feature in `FlexColorScheme` use the following
properties:

* [`useSubTheme`](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexColorScheme/useSubThemes.html)
  when `true` activates the opinionated sub theming, it is `false` by default.
* `subThemesData` is a
  [`FlexSubThemesData`](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexSubThemesData-class.html)
  data class that contain many optional quick configuration parameters
  for the opt-in widget sub-themes. For example, one of its parameters gives you
  access to easy use customization of default corner radius on all Flutter SDK
  UI widgets and elements that supports corner radius either via
  ShapeBorder or BorderRadiusGeometry. See its
  [`defaultRadius`](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexSubThemesData/defaultRadius.html)
  property for more information.

When you opt in on using sub-themes, the `FlexColorScheme.toTheme` method uses
the passed in `FlexSubThemesData` configuration data object, passed in via
`FlexColorScheme.subThemesData`, or a default one if one is not provided.

The property values in this `FlexSubThemesData` are used to define the created
opinionated sub-themes. In some simple cases the sub-themes are created
directly with the Flutter SDK widget sub-theme in question, in the `toTheme`
method. But in most cases it uses separate static sub-theme helper functions
from the `FlexSubThemes` class. 

The configuration class `FlexSubThemesData` offers easy to use configuration
properties for using these sub-themes in FlexColorScheme. You can also use
the static sub-themes without using FlexColorScheme based theming.
However, the `FlexSubThemesData` has no impact on the static helpers, it
is the `FlexColorScheme.toTheme` that uses the `FlexSubThemesData` 
class to configure
the opt-in sub-themes. 

You can of course also do this if you use `FlexSubThemesData` outside of 
`FlexColorScheme` or in `copyWith` on each sub-theme with custom ThemeData.

Sub themes for the following widgets are provided and used via opt-in
property the `FlexColorScheme.useSubThemes`:
* `TextButton`
* `ElevatedButton`
* `OutlinedButton`
* Older buttons using `ButtonThemeData`
* `ToggleButtons`
* `InputDecoration`
* `FloatingActionButton`
* `Chip`
* `Card`
* `PopupMenuButton`
* `Dialog`
* `TimePickerDialog`
* `SnackBar`
* `Tooltip`
* `BottomSheet`
* `BottomNavigationBar`
* `NavigationBar`

In `ToggleButtons` hover, press, selected and focus states are not
an exact match for the main buttons. It does not have as flexible styling
as the main buttons. The theme mimics the style of the `OutlinedButton` for
not selected buttons and the style of `ElevatedButton` for selected
button. It does not support `MaterialStateProperty` and has only
one state for different parts of the button. The selected and not selected,
states would need different property values to be able to match the general
buttons. It can therefore not fully match the same theme style as the
Material states used on two different `ButtonStyleButton` buttons that
it should match.

The theme `ButtonThemeData` is included to provide a very similar
theme style on the deprecated legacy buttons `RaisedButton`,
`OutlineButton` and `FlatButton` as on the current main buttons. It is not
an exact match, since the legacy buttons do not offer as flexible
styling as the newer buttons. They do follow and match the styling on
`ToggleButtons` when it comes to hover, press, selected and focus.
Please consider phasing out the legacy buttons, as they are deprecated and
may soon be removed from the Flutter SDK.

The following widgets that have rounded corners are excluded from the
sub-theming:
* `Tooltip`, generally so small that larger prominent rounding the
  opinionated sub-theming is designed for, is not a good fit.
  FlexColorScheme does include out of the box theming options for tooltips,
  that also adapts to color branding when opting in on sub themes,
  it also gets a bit more rounded than when not opting in on sub themes.
* `Scrollbar`, rounding on edges of scrollbars are left to platform default.
* `AppBar` and `BottomAppBar` shape properties are left to their defaults.
* `SnackBar` the floating snackbar should be sub-themed to also include
  border radius, but the none floating one should remain
  straight. Unclear if it can be done via SDK's current theming features,
  will investigate more in future version.
* `Drawer` should have 16dp default rounding on shown side edge, but in
  current version of Flutter SDK (2.8.1 when this was written) it has
  no theme property to enable
  this. It is coming in later Flutter version since it is required by the
  Material 3 design. When it is available, it will be added.


You can find more information about available sub-theme
helpers
[here](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexSubThemes-class.html).
You can also use these static sub-theme helpers to manually define widget
sub-theme and even modify them using `copywith`.