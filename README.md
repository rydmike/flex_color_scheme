# FlexColorScheme

FlexColorScheme is a Flutter package to help you make beautiful color branded Flutter themes. The created themes are based on the same concept as Flutter's newer `ColorScheme` based theming, with a few interesting twists.

A total of 20 different color schemes for both light and dark modes are available as predefined color schemes. These are just ready to use examples, you can easily also create your own custom color schemes and make themes from them. If you have seen the Flutter [FlexFold demo](https://rydmike.com/demoflexfold) application, then you have already seen **FlexColorScheme** in action, the demo uses this package for its theming.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/CollageSize50.png?raw=true" alt="ColorScheme Intro"/>

FlexColorScheme makes a few opinionated modifications to the default Flutter `ThemeData.from` a `ColorScheme` created theme. It also corrects known minor theme inconsistency issues that exist in the current version of Flutter's `ThemeData.from` factory. Both of these topics are explained in detail further below.

The Material guide also talks about using [color branded surfaces](https://material.io/design/color/dark-theme.html#properties), with FlexColorScheme you can easily create primary color branded themes using four built-in blend strengths of primary color into surface and background color, while avoiding blending it in with the scaffold background color, for all but the highest strength.

The color schemes can like Flutter's standard color scheme, be created by specifying all required schemes colors, but you can also specify just the primary color and get all other need colors for a complete color scheme computed based on the provided primary color.

When you have defined your `FlexColorScheme` you turn it into a theme with the `toTheme` method that returns a `ThemeData` object that you can use just like any other ThemeData object. You can of course still override this returned theme and add additional custom sub-theming to it with the normal ThemeData `copyWith` method. 

## Getting Started

In the `pubspec.yaml` of your **Flutter** project, add the following dependency:

```yaml
dependencies:
  ...
  flex_color_scheme:
```

In your library file add the following import:

```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
```

### Default Sample Application

The package contains five different example applications with increasing complexity.
 
To try the simplest default sample, example number 1 of FlexColorScheme on a device or simulator, clone the [repository](https://github.com/rydmike/flex_color_scheme) and run the example:

```bash
cd example/
flutter run --release
```

The result is a sample app that uses one of the built color schemes as its theme, has a light/dark/system theme mode toggle, includes a theme showcase, so you can see the impact of the theme on common Material widgets.

**NOTE:**
>If you clone the repo to build the samples, then open the package `/example` folder in your IDE to build the above default example, which is the same as the example in the `/example/lib/example1` folder. If you want to build all the other examples, without setting up different configurations in you IDE for the different main files, you can just copy paste in each example's code into the `/example/lib/main.dart` file to quickly build it. Just correct the relative import of `import 'all_shared_imports.dart';` in the copy, and you are ready to build it. 

## Tutorial

We will review the key parts in each example below and explain the features step by step. For simplicity the example applications do not use any advanced state management solution. The key part to each example is always in the used stateful Material app, where all the scheme setup for the themes are made in these demos.

The rest of the content in the examples are just there, so you can change some settings and see the actual results.

### All the examples - Live WEB demos

If you just want to have a quick look at all the example applications you can try the live web versions of them.



1. Use a built-in scheme as your application theme and toggle between its light and dark variant, or allow device mode setting to control if the dark or light theme is used. [See example 1 here.](https://rydmike.com/flexcolorscheme1/)

2. Like the previous example, but here we use custom colors to make a custom scheme and turn it into a theme. [See example 2 here.](https://rydmike.com/flexcolorscheme2/)  

3. In this example we can toggle the active theme between 3 different built in color schemes, plus the custom one we made. [See example 3 here.](https://rydmike.com/flexcolorscheme3/)

4. In example 4 we can toggle between all the different built in themes. [See example 4 here.](https://rydmike.com/flexcolorscheme4/)

5. The last, and most complex example presents more configuration options that you can modify interactively. This example is more suitable to be tested on a tablet, desktop or desktop web browser. It is presented in more detail further below. [See example 5 here.](https://rydmike.com/flexcolorscheme5/)

### Example 1) Use an existing color scheme 

This example shows how you can use a selected predefined color scheme in FlexColorScheme to define light and dark themes using the scheme and then switch between the light and dark mode. A theme showcase widget shows the theme with several common Material widgets.

 ```dart
void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({Key key}) : super(key: key);
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode themeMode; // Select if we use the dark or light theme.

  @override
  void initState() {
    themeMode = ThemeMode.light;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Select a predefined flex scheme to use. Feel free to modify the used
    // FlexScheme enum value below to try other predefined flex color schemes.
    const FlexScheme usedFlexScheme = FlexScheme.mandyRed;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',
      // Use a predefined light theme for the app and call toTheme method
      // to create the theme from the defined color scheme.
      theme: FlexColorScheme.light(colors: FlexColor.schemes[usedFlexScheme].light).toTheme,
      // We do the exact same definition for the dark theme, but using
      // FlexColorScheme.dark factory and the dark FlexSchemeColor in FlexColor.schemes.
      darkTheme: FlexColorScheme.dark(colors: FlexColor.schemes[usedFlexScheme].dark).toTheme,
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
      // This simple example app has only one page.
      home: HomePage(
        themeMode: themeMode,
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
        flexSchemeData: FlexColor.schemes[usedFlexScheme],
      ),
    );
  }
}

```
 
We pass in the `FlexSchemeData` we used for the active theme to the application's home page. Not really needed to use `FlexColorScheme`, but we will use it to show the active theme's name and descriptions in the demo. We also use it for the theme mode switch, that uses the scheme colors in as part of its toggle widget for the different theme modes.
 
The content of the HomePage in all these examples is not really so relevant for using `FlexColorScheme` based application theming. The critical parts are in the above `MaterialApp` theme definitions. The `HomePage` just contains UI to visually show what the defined example looks like in an application with commonly used Widgets. The home page also allow interaction with some of its API settings in later examples. All examples included the theme mode switch.

When you run example 1 you get a sample application that looks like this in light and dark mode:

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1al.png?raw=true" alt="ColorScheme example 1 light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1ad.png?raw=true" alt="ColorScheme example 1 dark" width="250"/>

[See example 1 live on the web here.](https://rydmike.com/flexcolorscheme1)

Scroll down to see the theme showcase widgets further below presenting the theme with some widgets. This example is not using primary color surface branding, it is just a normal theme with a few convenient fixes for certain theme properties.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1bl.png?raw=true" alt="ColorScheme example 1b light" width="250"/></nb></nb><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1cl.png?raw=true" alt="ColorScheme example 1c light" width="250"/>

## Example 2) Create a custom color scheme

This example shows how you can define your own FlexSchemeData and create a FlexColorScheme based theme from it. A theme showcase widget shows the theme with several common Material widgets.

 ```dart
 final int a; // Add sample code
 ```

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2al.png?raw=true" alt="ColorScheme example 2 light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2ad.png?raw=true" alt="ColorScheme example 2 dark" width="250"/>

[See example 2 live on the web here.](https://rydmike.com/flexcolorscheme2)

Scroll down to see the theme showcase widgets further below presenting the theme with some widgets. This example is not using primary color surface branding, it is just a normal theme with a few convenient fixes for certain theme properties.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2bl.png?raw=true" alt="ColorScheme example 2b light" width="250"/></nb></nb><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2cl.png?raw=true" alt="ColorScheme example 2c light" width="250"/>

### Example 3) Toggle between different color schemes

This example shows how you can use three built-in color schemes, and add one custom scheme as selectable FlexColorScheme based theme options in an application. The example also uses strong branded surface colors. A theme showcase widget shows the theme with several common Material widgets.

 ```dart
 final int a; // Add sample code
 ```

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3al.png?raw=true" alt="ColorScheme example 3a light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3ad.png?raw=true" alt="ColorScheme example 3a dark" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bl.png?raw=true" alt="ColorScheme example 3b light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bd.png?raw=true" alt="ColorScheme example 3b dark" width="180"/>

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3cl.png?raw=true" alt="ColorScheme example 3c light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3cd.png?raw=true" alt="ColorScheme example 3c dark" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3dl.png?raw=true" alt="ColorScheme example 3d light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3dd.png?raw=true" alt="ColorScheme example 3d dark" width="180"/>

[See example 3 live on the web here.](https://rydmike.com/flexcolorscheme3)

### Example 4) Toggle between all built in color schemes 

This example shows how you can use all the built in color schemes in FlexColorScheme to interactively select which one of the built in schemes is used to define the active theme. The example also uses medium strength branded background and surface colors. A theme showcase widget shows the theme with several common Material widgets.

 ```dart
 final int a; // Add sample code
 ```

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4al.png?raw=true" alt="ColorScheme example 4a light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4bl.png?raw=true" alt="ColorScheme example 4b light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cl.png?raw=true" alt="ColorScheme example 4c light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cd.png?raw=true" alt="ColorScheme example 4c dark" width="180"/>

[See example 4 live on the web here.](https://rydmike.com/flexcolorscheme4)

### Example 5) All built-in themes, plus two custom ones, with branded surfaces, app bar theme toggle and more 

This example shows how you can use all the built in color schemes in FlexColorScheme to define themes from them and how you can define your own custom scheme colors and use them together with the predefined ones. It can give you an idea of how you can create your own complete custom list of themes if you do not want to use any of the predefined ones.

The example also shows how you can use the surface branding feature and how to use the custom app bar theme features of FlexColorScheme. The usage of the true black theme feature for dark themes is also demonstrated. Using the optional Windows desktop like tooltip theme is also shown.

The example includes a dummy responsive side menu and rail to give a visual presentation of what applications that have larger visible surfaces using the surface branding look like. A theme showcase widget again shows the theme with several common Material widgets.

 ```dart
 final int a; // Add sample code
 ```

With this example we include a side rail, it actually expands to menu on web sites and even phone landscape, just for demo purposes. It is there to give us a better idea what a surface branded theme looks like. It is of course best viewe on a tablet or the web demo where the theming effect is more obvious, but it works on phones too.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5al.png?raw=true" alt="ColorScheme example 5 light" width="250"/>

[See example 5 live on the web here.](https://rydmike.com/flexcolorscheme5)

Let us now explore the effect of branded surface color in both light and dark mode. Branded surfaces are often associated with dark mode, but it works with light mode too. Below you see how the right color get blended into to material surface and even more so into material background color. This is using the medium branding strength. You can use the toggle in the example to change from standard no branding, to light, medium, strong and heavy. The scaffold background does not receive any branding, before the heavy mode. You might think that this and all the other theming can be done by just passing the same scheme colors to the `ThemeData.from` factory. That is why this demo allows you to flip a switch to do just that so you can see and observe the theme difference between color scheme based themes created by `FlexColorScheme.toTheme` and `ThemeData.from`. Feel free to give it a try, The differences are ven easier to observer on the Web version where you can have both version side by side in different browser windows.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5bl.png?raw=true" alt="ColorScheme example 5b light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5cl.png?raw=true" alt="ColorScheme example 5c light" width="250"/>

Now that we have tries the branding, you might have noticed that `FlexColorScheme` can also do some trick with the `AppBarTheme` you can easily toggle for both dark and light mode to use primary color, the standard surface/background color, the branded


## Behind the scenes

FlexColorSchemes does not actually use the `ThemeData.from` a paassed in `ColorScheme` to make themes. It uses the `ThemeData` factory directly with some custom theme. It does of course define a `ColorScheme` that is uses for the `ThemeData`.

### Applied Theme customizations

In addition to...  



   Returns the [ThemeData] object defined by [FlexColorScheme] properties
   and its theme logic.
  
   After you have defined your scheme with [FlexColorScheme] or one of its
   factories [FlexColorScheme.light], [FlexColorScheme.dark], call
   the [toTheme] method to get the resulting [ThemeData] object defined by
   your [FlexColorScheme] definition.
  
   The returned [ThemeData] contains some opinionated modifications and dark
   theme corrections, compared to what you get if you would just use the
   standard [ThemeData.from] a [ColorScheme]. You can always override these
   with your own theme modifications by using the `copyWith` method on the
   resulting theme.
  
   The differences from the standard [ThemeData.from] factory are:

   * `ScaffoldBackground` has its color own property in [FlexColorScheme] and
     can if so desired differ from the [ColorScheme] background color. In the
     branding implementation, the `scaffoldBackground` typically gets no
     primary branding applied, only in the heavy choice is there a small
     amount of it. Whereas `background` in the scheme receives the most
     color branding of the surface colors. Which fits well for where the
     `background` color is used by material in Widgets.
   * The `dialogBackgroundColor` uses the [ColorScheme.surface] color instead
     of the [ColorScheme.background] because the `background` color gets the
     strongest branding when branding is used. This did not look so good on
     dialogs, so its color choice was changed to `surface` instead, that gets
     very light branding applied. With standard default Material surface
     colors the `background` and `surface` colors are the same, so there is
     no difference in that case.
   * The `indicatorColor` uses color scheme `primary` instead of the default
     that is `onSurface` in dark mode, and `onPrimary` in light mode.
     This is just an opinionated choice.
   * For `toggleableActiveColor` the color scheme `secondary` color is used.
     The Flutter default just uses the default [ThemeData] colors and
     not the actual colors you define in a color scheme you create your
     theme from. This is probably a not yet corrected, perhaps an oversight.
     See issue: https://github.com/flutter/flutter/issues/65782.
   * Flutter themes created with [ThemeData.from] does not define any color
     scheme related color for the `primaryColorDark` color, this method does.
     See issue: https://github.com/flutter/flutter/issues/65782.
     [ThemeData.from] leaves this color at [ThemeData] factory default that
     will not match your scheme. Widgets seldom use this color, so the issue
     is rarely seen.
   * Flutter themes created with [ThemeData.from] does not define any color
     scheme based color for the `primaryColorLight` color, this method does.
     See issue: https://github.com/flutter/flutter/issues/65782.
     [ThemeData.from] leaves this color at [ThemeData] factory default that
     will not match your scheme. Widgets seldom use this color, so the issue
     is rarely seen.
   * Flutter themes created with [ThemeData.from] does not define any color
     scheme based color for the `secondaryHeaderColor` color, this method
     does. See issue: https://github.com/flutter/flutter/issues/65782.
     [ThemeData.from] leaves this color at [ThemeData] factory default that
     will not match your scheme. Widgets seldom use this color, so the issue
     is rarely seen.
   * Background color for [AppBarTheme] can use a custom colored appbar theme
     in both light and dark themes that is not dependent on theme primary
     or surface color. This functionality needs a custom text theme to be
     possible to implement without a context. The method does however not
     give correct localized typography. A new feature implemented via:
     https://github.com/flutter/flutter/pull/71184 will enable this kind
     of app bar theme and keep the correct typography localization. This
     new feature is (as of 13.12.2020) not yet available on the stable channel.
     The new feature can also not be enabled via Themes only, one must also
     opt in on an AppBar level, making it difficult to adopt the feature.
     A proposal to introduce opt in on app bar theme has been submitted, see:
     https://github.com/flutter/flutter/issues/72206.
     When the feature and the proposal lands in stable, or only the feature
     but so that app bars no longer default to old theme, the implementation
     currently used will be changed to use the new AppBarTheme features.
   * The [AppBarTheme] elevation defaults to 0.
   * Like standard from color scheme themes, the `bottomAppBarColor` also
     uses scheme `surface` color. Additionally, this color is also applied to
     [BottomAppBarTheme], that also gets default elevation 0.
   * A major deviation from [ThemeData.from] color scheme based theme's is
     that [ThemeData.accentColor] is set to color scheme primary and not to
     secondary. Reason is to get an easy way for borders on [TextField.decoration]
     to use theme based primary color also in dark mode, and not accentColor
     color. There may be a bug in the way [InputDecorationTheme] gets used
     by the [InputDecorator]. We were unable to define a theme that would
     work correctly for such a setup without resorting to making accentColor
     equal to [ThemeData.primaryColor]. This definition has less of an impact
     visually to any built-in widgets. With our other existing theme definitions 
     we saw no other widget that seemed to use accentColor. Because FAB and
     toggles have their own theme and colors, that still uses the normal and
     expected colorScheme.secondary color, despite this change.
   * The fairly recent [TextSelectionThemeData] is slightly modified. The
     default for `cursorColor` is `colorScheme.primary`, we also use the same 
     for the deprecated [ThemeData.cursorColor] property.
     The default `selectionHandleColor` is colorScheme.primary, we use a
     slightly darker custom shade via `primaryColorDark` instead and
     do the same for the deprecated [ThemeData.textSelectionHandleColor]. The
     standard for `selectionColor` is `colorScheme.primary` with opacity
     value 0.4 for dark, and 0.12 for light mode, we use primary with 0.5 and
     for dark, and 0.3 for light mode. We apply the same defaults to
     the deprecated property [ThemeData.textSelectionColor]. The deprecated
     values use the same theme as the one via the [TextSelectionThemeData]
     that replaces the old properties. The values for the old properties
     will be removed when they are fully deprecated on the stable channel or
     potentially already when they become incompatible with beta channel.
     The design choices on text selection theme are made so that they will
     match and work well together with the [InputDecorationTheme].
   * A predefined slightly opinionated [InputDecorationTheme] is used. It
     sets `filled` to `true` and fill color to colorscheme primary color with
     opacity 0.035 in light mode and opacity 0.06 in dark mode. The other
     key theme change is done via modification of the [ThemeData.accentColor]
     described earlier above. Since the theme does not define a `border`
     property TextFields in an app can still easily use both the default
     underline style and also the outline style by specifying the default
     `const OutlineInputBorder()` for the border property. If you don't
     want the filled style, or the primary colored borders in dark mode, 
     you can override them back with copyWith.
   * Button theming is applied to [ThemeData.buttonColor] using colorScheme
     primary and the entire colorScheme is passed to old button's 
     [ButtonThemeData] plus using the`textTheme` set to
     [ButtonTextTheme.primary], minor changes to padding and tap
     target size, makes the old buttons almost match the default design and
     look of their corresponding newer buttons. So [RaisedButton] looks
     very similar to [ElevatedButton], [OutlineButton] to [OutlinedButton]
     and [FlatButton] to [TextButton]. There are some differences in margins,
     and looks, especially in dark mode. But they are close enough, this is a
     button style we used before the introduction of the new buttons with  
     their improved defaults, it just happened to be very close as the design was
     based on how things looked in the design guide prior to Flutter
     releasing the new buttons. The newer buttons are still nicer when it
     comes to their interactions and all the theming options they provide,
     but they are tedious to theme. If you want to make custom styled
     buttons we recommend using the newer buttons instead of the old ones,
     as they offer more customization possibilities.
   * The default theme for Chips contains a design bug that makes the
     selected ChoiceChip() widget look disabled in dark mode, regardless if
     created with ThemeData factory or ThemeData.from the default dark
     color scheme. See issue: https://github.com/flutter/flutter/issues/65663
     The used chip theme modification fixes the issue.
   * The [FloatingActionButtonThemeData] is set as follows:
     ```dart
     FloatingActionButtonThemeData(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary),
     ```
     In order to ensure the same FAB style that was the default in ThemeData
     factory via `accentIconTheme` in the past. If it is not defined we
     get a deprecated warning like this:
     Warning: The support for configuring the foreground color of
     FloatingActionButtons using ThemeData.accentIconTheme has been
     deprecated. Please use ThemeData.floatingActionButtonTheme instead.
     See https://flutter.dev/go/remove-fab-accent-theme-dependency.
     This feature was deprecated after v1.13.2.
   * For [TabBarTheme] a default design that fits with surface color is
     used, instead of one that fits with the app bar color. Including this
     in the theme design is still being evaluated. It might be removed in the
     final release in preference for guidance on how to theme it like this
     when so needed.
   * The [BottomNavigationBarThemeData] uses color scheme primary color for
     the selected item. Flutter defaults to secondary color. Primary color
     is the design commonly used on iOS for the bottom navigation bar. We
     agree and think it looks better as the default choice in apps.
   * Default tooltip theming in Flutter is currently a bit flawed on desktop
     and web using very small 10dp font.
     See issue: https://github.com/flutter/flutter/issues/71429
     The default theming also does not handle multiline tooltips very well.
     The used [TooltipThemeData] theme design corrects both issues. It uses
     12dp font on desktop and web instead of 10dp, and some padding over
     height constraint to ensure multiline tooltips look nice too.
     [FlexColorScheme] also includes a new property [tooltipsMatchBackground]
     that can be toggled to not used Flutter's Material default theme mode
     inverted background. Tooltips using light background in light theme
     and dark in dark, are commonly used on Windows desktop platform. You
     can tie the extra property to used platform to make an automatic
     platform adaptation of the tooltip style, or give users a preference
     toggle if you like.
   * We like same color on the app bar and status bar with in Android, like
     on iOS it is cleaner. We would also like transparent navigation bar in
     Android to be transparent. The first design is included and works, but
     controlling the navigation bar seems to be tricky. See
     related issue(s): https://github.com/flutter/flutter/issues/69999.
     This pre-release still contains some experiments with these styles by
     using [SystemChrome.setSystemUIOverlayStyle] in the toTheme method. We
     will probably remove it in the first official release version, in favor
     of setting these design elsewhere and via other means in our apps.

