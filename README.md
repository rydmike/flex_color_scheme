# FlexColorScheme

FlexColorScheme is a Flutter package to help you make beautiful Flutter themes with optional primary color branded surfaces. The created themes are based on the same concept as Flutter's newer `ColorScheme` based theming, with a few interesting twists.

A total of 20 different color schemes for both light and dark modes are available as predefined color schemes. These are ready to use examples, you can just easily create your own custom color schemes and make themes from them. If you have seen the Flutter [FlexFold demo](https://rydmike.com/demoflexfold) application, then you have already seen **FlexColorScheme** in action. The FlexFold demo uses this package for its fancy theming and enable switching between all the themes without any major effort. The examples in this package will show you how it is done.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/CollageSize50.png?raw=true" alt="ColorScheme Intro"/>

FlexColorScheme makes a few opinionated modifications compared to the default Flutter `ThemeData.from` theme created from a `ColorScheme`. It also corrects known minor theme inconsistency issues, that exist in the current version of Flutter's `ThemeData.from` factory. Both of these topics are explained in detail further below.

The Material guide also talks about using [color branded surfaces](https://material.io/design/color/dark-theme.html#properties), with **FlexColorScheme** you can easily create such primary color branded themes. This done by using four built-in blend strengths of primary color into surface and background colors, while avoiding blending it in with the scaffold background color, for all but the highest strength.

The scheme colors can like Flutter's standard `ColorScheme`, be created by specifying all required schemes colors, but you can also specify just the primary color and get all other colors needed for a complete color scheme computed based on just the provided primary color.

When you have defined your `FlexColorScheme` you turn it into a theme with the `toTheme` method that returns a `ThemeData` object that you can use just like any other `ThemeData` object. You can of course still override this returned theme and add additional custom sub-theming to it with the normal ThemeData `copyWith` method. 

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
 
To try the simplest default sample, example number 1 of `FlexColorScheme` on a device or simulator, clone the [repository](https://github.com/rydmike/flex_color_scheme) and run the example:

```bash
cd example/
flutter run --release
```

The result is a sample app that uses one of the built color schemes as its theme, has a light/dark/system theme mode toggle and includes a theme showcase, so you can see the impact of the theme on common Material widgets.

**NOTE:**
>If you clone the repo to build the samples, then open the package `/example` folder with your IDE to build the above default example, which is the same as the example in the `/example/lib/example1` folder. If you want to build the other examples, without setting up different configurations in you IDE for the different main files, you can just copy and paste in each example's code into the `/example/lib/main.dart` file to quickly build it. Just correct the relative import of `import 'all_shared_imports.dart';` in the copy, and you are ready to go. 

## Tutorial

We will go through the key topics in each example below and explain the features step by step. For simplicity the example applications do not use any advanced state management solution. The key part to each example is always in the used stateful Material app, where all the scheme setup for the themes are made in these demos. The rest of the content in the examples are just there, so you can change some settings and see the actual results.

### Live WEB demos

If you just want to have a quick look at all the example applications, you can try live web versions of them.


#### Example 1
Use a built-in scheme as your application theme and toggle between its light and dark variant, or allow device mode setting to control if the dark or light theme is used. [Try example 1 here.](https://rydmike.com/flexcolorscheme1/)

2. Like the previous example, but here we use custom colors to make a custom scheme and turn it into a theme. [Try example 2 here.](https://rydmike.com/flexcolorscheme2/)  

3. In this example we can toggle the active theme between 3 different built in color schemes, plus the custom one we made. [Try example 3 here.](https://rydmike.com/flexcolorscheme3/)

4. In example 4 we can toggle between all the different built in themes. [Try example 4 here.](https://rydmike.com/flexcolorscheme4/)

5. The last, and most complex example presents more configuration options that you can modify interactively. This example is more suitable to be tested on a tablet, desktop or desktop web browser. It is presented in more detail further below. [Try example 5 here.](https://rydmike.com/flexcolorscheme5/)

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
void main() => runApp(const DemoApp());

// Create a custom FlexSchemeData scheme with name, description and a light
// and dark FlexSchemeColor.
const FlexSchemeData customFlexScheme = FlexSchemeData(
  name: 'Custom purple',
  description: 'Purple theme created from custom defined colors.',
  light: FlexSchemeColor(
    primary: Color(0xFF4E0028),
    primaryVariant: Color(0xFF320019),
    secondary: Color(0xFF003419),
    secondaryVariant: Color(0xFF002411),
  ),
  dark: FlexSchemeColor(
    primary: Color(0xFF9E7389),
    primaryVariant: Color(0xFF775C69),
    secondary: Color(0xFF738F81),
    secondaryVariant: Color(0xFF5C7267),
  ),
);

class DemoApp extends StatefulWidget {
  const DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Used to select if we use the dark or light theme.
  ThemeMode themeMode;

  @override
  void initState() {
    themeMode = ThemeMode.light;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',
      // Use the custom light scheme to define a light FlexColorScheme for the
      // app and call .toTheme method to create the slightly opinionated theme
      // from the defined custom flex scheme data.
      theme: FlexColorScheme.light(colors: customFlexScheme.light).toTheme,
      // We do the exact same definition for the dark theme, but using
      // FlexColorScheme.dark factory and the flexSchemeColor dark scheme.
      darkTheme: FlexColorScheme.dark(colors: customFlexScheme.dark).toTheme,
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
      // This simple example app has only one page.
      home: HomePage(
        // We pass it the current theme mode.
        themeMode: themeMode,
        // On the home page we toggle theme mode between light and dark.
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
        // Pass in the FlexSchemeData we used for the active theme. Not really
        // needed to use FlexColorScheme, but we will use it to show the
        // active theme's name, descriptions and colors in the demo.
        // We also use it for the theme mode switch that shows the theme's
        // color's in the different theme modes.
        flexSchemeData: customFlexScheme,
      ),
    );
  }
}
 ```

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2al.png?raw=true" alt="ColorScheme example 2 light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2ad.png?raw=true" alt="ColorScheme example 2 dark" width="250"/>

[See example 2 live on the web here.](https://rydmike.com/flexcolorscheme2)

Scroll down to see the theme showcase widgets further below presenting the theme with some widgets. This example is not using primary color surface branding, it is just a normal theme with a few convenient fixes for certain theme properties.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2bl.png?raw=true" alt="ColorScheme example 2b light" width="250"/></nb></nb><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2cl.png?raw=true" alt="ColorScheme example 2c light" width="250"/>

### Example 3) Toggle between different color schemes

This example shows how you can use three built-in color schemes, and add one custom scheme as selectable FlexColorScheme based theme options in an application. The example also uses strong branded surface colors. A theme showcase widget shows the theme with several common Material widgets.

 ```dart
 void main() => runApp(const DemoApp());
 
 // Create a custom FlexSchemeData scheme with name, description and a light
 // and dark FlexSchemeColor.
 const FlexSchemeData customFlexScheme = FlexSchemeData(
   name: 'Custom purple',
   description: 'Purple theme created from custom defined colors.',
   light: FlexSchemeColor(
     primary: Color(0xFF4E0028),
     primaryVariant: Color(0xFF320019),
     secondary: Color(0xFF003419),
     secondaryVariant: Color(0xFF002411),
   ),
   dark: FlexSchemeColor(
     primary: Color(0xFF9E7389),
     primaryVariant: Color(0xFF775C69),
     secondary: Color(0xFF738F81),
     secondaryVariant: Color(0xFF5C7267),
   ),
 );
 
 class DemoApp extends StatefulWidget {
   const DemoApp({Key key}) : super(key: key);
 
   @override
   _DemoAppState createState() => _DemoAppState();
 }
 
 class _DemoAppState extends State<DemoApp> {
   // Used to select if we use the dark or light theme.
   ThemeMode themeMode;
   // Used to select which FlexSchemeData we use.
   FlexScheme flexScheme;
 
   @override
   void initState() {
     themeMode = ThemeMode.light;
     flexScheme = FlexScheme.hippieBlue;
     super.initState();
   }
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'FlexColorScheme',
       // Define the light theme for the app, using current theme index and
       // medium branded surfaces. Then use the .toTheme method to create and
       // return a slightly opinionated theme using these properties.
       theme: FlexColorScheme.light(
         colors: flexScheme == FlexScheme.custom
             ? customFlexScheme.light
             : FlexColor.schemesWithCustom[flexScheme].light,
         surfaceStyle: FlexSurface.strong,
       ).toTheme,
       // We do the exact same definition for the dark theme, but using
       // FlexColorScheme.dark factory and the dark FlexSchemeColor instead.
       darkTheme: FlexColorScheme.dark(
         colors: flexScheme == FlexScheme.custom
             ? customFlexScheme.dark
             : FlexColor.schemesWithCustom[flexScheme].dark,
         surfaceStyle: FlexSurface.strong,
       ).toTheme,
       // Use the above dark or light theme based on active themeMode.
       themeMode: themeMode,
       // This simple example app has only one page
       home: HomePage(
         // We pass it the current theme mode.
         themeMode: themeMode,
         // On the home page we toggle theme mode between light and dark.
         onThemeModeChanged: (ThemeMode mode) {
           setState(() {
             themeMode = mode;
           });
         },
         // We can pass it the enum value of the active scheme.
         flexScheme: flexScheme,
         // We can select a new scheme and get its enum value back.
         onFlexSchemeChanged: (FlexScheme selectedScheme) {
           setState(() {
             flexScheme = selectedScheme;
           });
         },
         // Pass in the FlexSchemeData we used for the active theme. Not really
         // needed to use FlexColorScheme, but we will use it to show the
         // active theme's name, descriptions and colors in the demo.
         // We also use it for the theme mode switch that shows the theme's
         // color's in the different theme modes.
         flexSchemeData: flexScheme == FlexScheme.custom
             ? customFlexScheme
             : FlexColor.schemesWithCustom[flexScheme],
       ),
     );
   }
 }
 ```

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3al.png?raw=true" alt="ColorScheme example 3a light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3ad.png?raw=true" alt="ColorScheme example 3a dark" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bl.png?raw=true" alt="ColorScheme example 3b light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bd.png?raw=true" alt="ColorScheme example 3b dark" width="180"/>

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3cl.png?raw=true" alt="ColorScheme example 3c light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3cd.png?raw=true" alt="ColorScheme example 3c dark" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3dl.png?raw=true" alt="ColorScheme example 3d light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3dd.png?raw=true" alt="ColorScheme example 3d dark" width="180"/>

[See example 3 live on the web here.](https://rydmike.com/flexcolorscheme3)

### Example 4) Toggle between all built in color schemes 

This example shows how you can use all the built in color schemes in FlexColorScheme to interactively select which one of the built in schemes is used to define the active theme. The example also uses medium strength branded background and surface colors. A theme showcase widget shows the theme with several common Material widgets.

 ```dart
 void main() => runApp(const DemoApp());
 
 class DemoApp extends StatefulWidget {
   const DemoApp({Key key}) : super(key: key);
 
   @override
   _DemoAppState createState() => _DemoAppState();
 }
 
 class _DemoAppState extends State<DemoApp> {
   // Used to select if we use the dark or light theme.
   ThemeMode themeMode;
   // Used to select which FlexSchemeData we use.
   int themeIndex;
 
   @override
   void initState() {
     themeMode = ThemeMode.light;
     themeIndex = 6; // Start with index 6, should be the brand blue colors
     super.initState();
   }
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'FlexColorScheme',
       // Define the light theme for the app, using current theme index and
       // medium branded surfaces. Then use the .toTheme method to create and
       // return a slightly opinionated theme using these properties.
       theme: FlexColorScheme.light(
         colors: FlexColor.schemesList[themeIndex].light,
         surfaceStyle: FlexSurface.medium,
       ).toTheme,
       // We do the exact same definition for the dark theme, but using
       // FlexColorScheme.dark factory and the dark FlexSchemeColor instead.
       darkTheme: FlexColorScheme.dark(
         colors: FlexColor.schemesList[themeIndex].dark,
         surfaceStyle: FlexSurface.medium,
       ).toTheme,
       // Use the above dark or light theme based on active themeMode.
       themeMode: themeMode,
       // This simple example app has only one page.
       home: HomePage(
         // We pass it the current theme mode.
         themeMode: themeMode,
         // On the home page we toggle theme mode between light and dark.
         onThemeModeChanged: (ThemeMode mode) {
           setState(() {
             themeMode = mode;
           });
         },
         // We can pass it the index of the active theme.
         schemeIndex: themeIndex,
         // We can select a new theme and get its index back.
         onSchemeChanged: (int index) {
           setState(() {
             themeIndex = index;
           });
         },
         // Pass in the FlexSchemeData we used for the active theme. Not really
         // needed to use FlexColorScheme, but we will use it to show the
         // active theme's name, descriptions and colors in the demo.
         // We also use it for the theme mode switch that shows the theme's
         // color's in the different theme modes.
         flexSchemeData: FlexColor.schemesList[themeIndex],
       ),
     );
   }
 }
 ```

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4al.png?raw=true" alt="ColorScheme example 4a light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4bl.png?raw=true" alt="ColorScheme example 4b light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cl.png?raw=true" alt="ColorScheme example 4c light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cd.png?raw=true" alt="ColorScheme example 4c dark" width="180"/>

[See example 4 live on the web here.](https://rydmike.com/flexcolorscheme4)

### Example 5) All built-in themes, plus two custom ones, with branded surfaces, app bar theme toggle and more 

This example shows how you can use all the built in color schemes in FlexColorScheme to define themes from them and how you can define your own custom scheme colors and use them together with the predefined ones. It can give you an idea of how you can create your own complete custom list of themes if you do not want to use any of the predefined ones.

The example also shows how you can use the surface branding feature and how to use the custom app bar theme features of FlexColorScheme. The usage of the true black theme feature for dark themes is also demonstrated. Using the optional Windows desktop like tooltip theme is also shown.

The example includes a dummy responsive side menu and rail to give a visual presentation of what applications that have larger visible surfaces using the surface branding look like. A theme showcase widget again shows the theme with several common Material widgets.

 ```dart
 void main() => runApp(const DemoApp());
 
 // Create a custom flex color scheme for a light theme.
 const FlexSchemeColor myScheme1Light = FlexSchemeColor(
   primary: Color(0xFF4E0028),
   primaryVariant: Color(0xFF320019),
   secondary: Color(0xFF003419),
   secondaryVariant: Color(0xFF002411),
   // The built in color schemes use their secondary variant color as their
   // custom app bar color, it could of course be any color, but for consistency
   // we will do the same in this custom FlexSchemeColor.
   appBarColor: Color(0xFF002411),
 );
 // Create a corresponding custom flex color scheme for a dark theme.
 const FlexSchemeColor myScheme1Dark = FlexSchemeColor(
   primary: Color(0xFF9E7389),
   primaryVariant: Color(0xFF775C69),
   secondary: Color(0xFF738F81),
   secondaryVariant: Color(0xFF5C7267),
   // Again we use same secondaryVariant color as optional custom app bar color.
   appBarColor: Color(0xFF5C7267),
 );
 
 // You can build a scheme the long way, by specifying all the required hand
 // picked scheme colors, like above. You can also build color schemes from a
 // single primary color. With the [.from] factory, then the only required color
 // is the primary color, the other colors will be computed. You can optionally
 // also provide the primaryVariant, secondary and secondaryVariant colors with
 // the factory, but any color that is not provided will always be computed for
 // the full set of required colors in a FlexSchemeColor.
 //
 // In this example we create our 2nd scheme from just a primary color
 // for the light and dark schemes. The custom app bar color will in this case
 // also receive the same color value as the one that is computed for
 // secondaryVariant color.
 final FlexSchemeColor myScheme2Light =
     FlexSchemeColor.from(primary: const Color(0xFF4C4E06));
 final FlexSchemeColor myScheme2Dark =
     FlexSchemeColor.from(primary: const Color(0xFF9D9E76));
 
 // Create a list with all color schemes we will use, starting with all
 // the built-in ones and then adding our custom ones at the end.
 final List<FlexSchemeData> myFlexSchemes = <FlexSchemeData>[
   // Use the built in FlexColor schemes, but exclude the placeholder for custom
   // scheme, a selection that would typically be used to compose a theme
   // interactively in the app using a color picker, we won't be doing that in
   // this example.
   ...FlexColor.schemesList,
   // Then add our first custom FlexSchemeData to the list, we give it a name
   // and description too.
   const FlexSchemeData(
     name: 'Custom purple',
     description: 'Purple theme created from custom defined colors.',
     // Flex scheme data holds separate defined color schemes for its light and
     // matching dark theme color. Dark theme colors need to be much less
     // saturated than light theme. Using the same colors in light and dark
     // theme modes does not look nice.
     light: myScheme1Light,
     dark: myScheme1Dark,
   ),
   // Do the same for our second custom scheme.
   FlexSchemeData(
     name: 'Custom olive green',
     description: 'Olive green theme created from custom primary color.',
     light: myScheme2Light,
     dark: myScheme2Dark,
   ),
 ];
 
 class DemoApp extends StatefulWidget {
   const DemoApp({Key key}) : super(key: key);
 
   @override
   _DemoAppState createState() => _DemoAppState();
 }
 
 class _DemoAppState extends State<DemoApp> {
   // Used to select if we use the dark or light theme.
   ThemeMode themeMode;
 
   // Used to select which FlexSchemeData we use in our list of schemes.
   int themeIndex;
 
   // Enum used to select what app bar style we use.
   FlexAppBarStyle flexAppBarStyle;
 
   // Enum used to control the level of primary color surface branding applied
   // to surfaces and backgrounds.
   FlexSurface flexSurface;
 
   // If true, tooltip theme background will be light in light theme, and dark
   // in dark themes. The Flutter and Material default and standard is the other
   // way, tooltip background color is inverted compared to app background.
   // Set to true, to mimic e.g. the look of Windows desktop tooltips. You
   // could tie this to the active platform and have different style of tooltips
   // on different platforms.
   bool tooltipsMatchBackground;
 
   // Allow toggling between normal dark mode and true black dark mode.
   bool darkIsTrueBlack;
 
   // Use the toTheme method to create Themes from [FlexColorScheme]. This
   // is the preferred method when using [FlexColorScheme]. In this demo
   // you can use a toggle to see what a FlexColorScheme looks like if you just
   // return its color scheme and use [ThemeData.from] to instead create your
   // theme.
   bool useToThemeMethod;
 
   @override
   void initState() {
     themeMode = ThemeMode.light;
     themeIndex = 21; // Start with the last index, the custom olive green one.
     flexAppBarStyle = FlexAppBarStyle.primary;
     flexSurface = FlexSurface.medium;
     tooltipsMatchBackground = false;
     darkIsTrueBlack = false;
     useToThemeMethod = true;
     super.initState();
   }
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'FlexColorScheme',
       // Define the light theme for the app, using current theme index, selected
       // surface style and app bar style. With the built in 20 themes and the
       // custom ones we defined above, we can use 22 different app themes via
       // the definition below, times the surface styles and app bar variants.
       // The factory FlexColorScheme.light is used to define a FlexColorScheme
       // for a light theme, from the light FlexSchemeColor plus some other theme
       // factory properties, like the surface and app bar style used in
       // this example as well as the tooltip and true black setting for the dark
       // theme.
       // Lastly the method .toTheme is used to create the slightly opinionated
       // theme from the defined color scheme.
       //
       // In this example we also demonstrate how to create the same theme with
       // the standard from color scheme ThemeData factory. The surface style
       // works, but will not be applied as elegantly, but it works fairly OK up
       // to medium blend. The app bar style has no effect here, nor the tooltip
       // style. We also have to make sure we use the same typography as the one
       // used in FlexColorScheme, otherwise the animated theme will show an
       // assertion error as it cannot animate between different typography or
       // null default typography in the theme data.
       //
       // When toggling between the standard ThemeData.from and the
       // FlexColorScheme.toTheme we can observe the differences and also see
       // some of the colors the standard method does not fully adjust to match
       // the used color scheme.
       theme: useToThemeMethod
           ? FlexColorScheme.light(
               colors: myFlexSchemes[themeIndex].light,
               surfaceStyle: flexSurface,
               appBarStyle: flexAppBarStyle,
               tooltipsMatchBackground: tooltipsMatchBackground,
             ).toTheme
           : ThemeData.from(
               colorScheme: FlexColorScheme.light(
                 colors: myFlexSchemes[themeIndex].light,
                 surfaceStyle: flexSurface,
                 appBarStyle: flexAppBarStyle,
                 tooltipsMatchBackground: tooltipsMatchBackground,
               ).toScheme,
             ).copyWith(
               typography: Typography.material2018(
                 platform: defaultTargetPlatform,
               ),
             ),
       // We do the exact same definition for the dark theme, but using
       // FlexColorScheme.dark factory and the dark FlexSchemeColor and we add
       // the true black option as well.
       //
       // In dark mode we can see many gaps in the resulting ThemeData when
       // using the standard ThemeData.from factory to create the theme.
       darkTheme: useToThemeMethod
           ? FlexColorScheme.dark(
               colors: myFlexSchemes[themeIndex].dark,
               surfaceStyle: flexSurface,
               appBarStyle: flexAppBarStyle,
               tooltipsMatchBackground: tooltipsMatchBackground,
               darkIsTrueBlack: darkIsTrueBlack,
             ).toTheme
           : ThemeData.from(
               colorScheme: FlexColorScheme.dark(
                 colors: myFlexSchemes[themeIndex].dark,
                 surfaceStyle: flexSurface,
                 appBarStyle: flexAppBarStyle,
                 tooltipsMatchBackground: tooltipsMatchBackground,
                 darkIsTrueBlack: darkIsTrueBlack,
               ).toScheme,
             ).copyWith(
               typography: Typography.material2018(
                 platform: defaultTargetPlatform,
               ),
             ),
       // Use the above dark or light theme based on active themeMode.
       themeMode: themeMode,
       // This simple example app has only one page.
       home: HomePage(
         // We pass it the current theme mode.
         themeMode: themeMode,
         // On the home page we toggle theme mode between light and dark.
         onThemeModeChanged: (ThemeMode mode) {
           setState(() {
             themeMode = mode;
           });
         },
         // We pass it the index of the active theme.
         schemeIndex: themeIndex,
         // We can select a new theme and get its index back.
         onSchemeChanged: (int index) {
           setState(() {
             themeIndex = index;
           });
         },
         // We pass in the active app bar style.
         appBarStyle: flexAppBarStyle,
         // And select a new app bar style.
         onAppBarStyleChanged: (FlexAppBarStyle style) {
           setState(() {
             flexAppBarStyle = style;
           });
         },
         // We pass in the current surface and background style.
         themeSurface: flexSurface,
         // And select a new surface and background style.
         onThemeSurfaceChanged: (FlexSurface surface) {
           setState(() {
             flexSurface = surface;
           });
         },
         // We pass in the current tooltip style.
         tooltipsMatchBackground: tooltipsMatchBackground,
         // And toggle the tooltip style.
         onTooltipsMatchBackgroundChanged: (bool value) {
           setState(() {
             tooltipsMatchBackground = value;
           });
         },
         // We pass in the current true black value.
         darkIsTrueBlack: darkIsTrueBlack,
         // And toggle the dark mode's true black value.
         onDarkIsTrueBlackChanged: (bool value) {
           setState(() {
             darkIsTrueBlack = value;
           });
         },
         // We pass in the current theme creation method
         useToTheme: useToThemeMethod,
         // And toggle the theme creation method.
         onUseToThemeChanged: (bool value) {
           setState(() {
             useToThemeMethod = value;
           });
         },
         // Pass in the FlexSchemeData we used for the active theme. Not really
         // needed to use FlexColorScheme, but we will use it to show the
         // active theme's name, descriptions and colors in the demo.
         // We also use it for the theme mode switch that shows the theme's
         // color's in the different theme modes.
         flexSchemeData: myFlexSchemes[themeIndex],
       ),
     );
   }
 }
 ```

With this example we include a side rail, it actually expands to menu on web sites and even phone landscape, just for demo purposes. It is there to give us a better idea what a surface branded theme looks like. It is of course best viewe on a tablet or the web demo where the theming effect is more obvious, but it works on phones too.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5al.png?raw=true" alt="ColorScheme example 5 light" width="250"/>

[See example 5 live on the web here.](https://rydmike.com/flexcolorscheme5)

Let us now explore the effect of branded surface color in both light and dark mode. Branded surfaces are often associated with dark mode, but it works with light mode too. Below you see how the right color get blended into to material surface and even more so into material background color. This is using the medium branding strength. You can use the toggle in the example to change from standard no branding, to light, medium, strong and heavy. The scaffold background does not receive any branding, before the heavy mode. You might think that this and all the other theming can be done by just passing the same scheme colors to the `ThemeData.from` factory. That is why this demo allows you to flip a switch to do just that so you can see and observe the theme difference between color scheme based themes created by `FlexColorScheme.toTheme` and `ThemeData.from`. Feel free to give it a try, The differences are ven easier to observer on the Web version where you can have both version side by side in different browser windows.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5bl.png?raw=true" alt="ColorScheme example 5b light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5cl.png?raw=true" alt="ColorScheme example 5c light" width="250"/>

Now that we have tried the branding, you might have noticed that `FlexColorScheme` can also do some trick with the `AppBarTheme` you can easily toggle for both dark and light mode to use primary color, the standard surface/background color, the primary branded surface and bakground versions as well as an extra custom app bar scheme color that does not have to be any of the colors in Flutter `ColorScheme`. The predefined schemes are actually use the color defined for scheme `secondaryVariant` as the custom color used for the app bar. When you make your own theme you can do the same or use a totally not traditional scheme related color as the app bar color.

Here you can see some different branding strengths with branded app bar color defined as well. This is medium versus heavy. The medium choice is usually well-balanced, but light can be subtle and nice too. If you want to make a bold statement theme, go with heavy. The visual impact of the branding also depends on how saturated the primary color.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5dl.png?raw=true" alt="ColorScheme example 5d light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5el.png?raw=true" alt="ColorScheme example 5e light" width="250"/>

Here are few more images of the heavy version when looking at some widgets as well.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5fl.png?raw=true" alt="ColorScheme example 5f light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5gl.png?raw=true" alt="ColorScheme example 5g light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5hl.png?raw=true" alt="ColorScheme example 5h light" width="180"/>

Dark mode is nice, but with `FlexColorScheme` you can go even "deeper", to **true black** with the flick of a switch. When using the true black option for dark mode, surface and background are set fully black. This can save power on OLED screens, but it can also cause scrolling issues when pixels turn fully off. You can read about this in the Material design guide [here](https://material.io/design/color/dark-theme.html#ui-application) as well (scroll back up one heading to get to the mention of it). 
 
If you use branded surfaces with true black on, you will notice that it has less of an impact, only at strong and heavy mode will it have an impact.

Here is an example of a branded dark theme with true black ON and true black OFF and heavy branding. 

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5cd.png?raw=true" alt="ColorScheme example 5c dark" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5bd.png?raw=true" alt="ColorScheme example 5b dark" width="250"/>

## Behind the scenes

**FlexColorScheme** does not actually use the `ThemeData.from` factory with a passed in `ColorScheme` to make its theme. It uses the `ThemeData` factory directly with some custom theming. It does of course define a `ColorScheme` that is uses for the `ThemeData`. It includes color calculations for the primary color brand blended surfaces, and for the lazy schemes that does not specify all colors in a color scheme.

### Theme Customizations and Corrections

In addition to the primary color branded surfaces, full shaded schemes from just one primary color, true black and app bar tricks. The returned `ThemeData` contains some opinionated modifications and theme corrections, compared to what you get if you would just use the standard `ThemeData.from` with a `ColorScheme`. You can still of course override this theme with your own theme modifications and additions, by using the `copyWith` method on the resulting theme.
  
If you want the details of what the differences compared to the standard `ThemeData.from` factory are, here is a complete list:

   * `ScaffoldBackground` has its color own property in `FlexColorScheme` and
     can if so desired differ from the `ColorScheme` background color. In the
     branding implementation, the `scaffoldBackground` typically gets no
     primary branding applied, only in the heavy choice is there a small
     amount of it. Whereas `background` in the scheme receives the most
     color branding of the surface colors. Which fits well for where the
     `background` color is used by material in Widgets.
     
   * The `dialogBackgroundColor` uses the `ColorScheme.surface` color instead
     of the `ColorScheme.background` because the `background` color gets the
     strongest branding when branding is used. This did not look so good on
     dialogs, so its color choice was changed to `surface` instead, that gets
     very light branding applied. With standard default Material surface
     colors the `background` and `surface` colors are the same, so there is
     no difference in that case.
     
   * The `indicatorColor` uses color scheme `primary` instead of the default
     that is `onSurface` in dark mode, and `onPrimary` in light mode.
     This is just an opinionated choice.
     
   * For `toggleableActiveColor` the color scheme `secondary` color is used.
     The Flutter default just uses the default `ThemeData` colors and
     not the actual colors you define in a color scheme you create your
     theme from. This is probably not yet corrected, perhaps an oversight?
     See issue: https://github.com/flutter/flutter/issues/65782.
     
   * Flutter themes created with `ThemeData.from` does not define any color
     scheme related color for the `primaryColorDark` color, this method does.
     See issue: https://github.com/flutter/flutter/issues/65782.
     `ThemeData.from leaves this color at `ThemeData` factory default, this 
     may not match your scheme. Widgets seldom use this color, so the issue
     is rarely seen.
     
   * Flutter themes created with `ThemeData.from` does not define any color
     scheme based color for the `primaryColorLight` color, this method does.
     See issue: https://github.com/flutter/flutter/issues/65782.
     `ThemeData.from` leaves this color at `ThemeData` factory default this
     may not match your scheme. Widgets seldom use this color, so the issue
     is rarely seen.
     
   * Flutter themes created with `ThemeData.from` does not define any color
     scheme based color for the `secondaryHeaderColor` color, this method
     does. See issue: https://github.com/flutter/flutter/issues/65782.
     `ThemeData.from` leaves this color at `ThemeData` factory default this
     may not match your scheme. Widgets seldom use this color, so the issue
     is rarely seen.
     
   * Background color for `AppBarTheme` can use a custom colored appbar theme
     in both light and dark themes that is not dependent on theme primary
     or surface color. This functionality needs a custom text theme to be
     possible to implement it without a context. The implementation does however
     not give correct localized typography. A new feature implemented via:
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
     The `AppBarTheme` elevation defaults to 0.
     
   * Like standard `ThemeData.from` color scheme themes, the `bottomAppBarColor`
     also uses scheme `surface` color. Additionally, this color is also applied to
     `BottomAppBarTheme`, that like the app bar also gets default elevation 0.
     
   * A deviation from `ThemeData.from` color scheme based theme's is
     that `ThemeData.accentColor` is set to color scheme primary and not to
     secondary. This is done to get an easy way for borders on `TextField.decoration`
     to use theme based primary color in dark mode, and not `accentColor`
     color. There may be a bug in the way [InputDecorationTheme] gets used
     by the [InputDecorator]. We were unable to define a theme that would
     work correctly for such a setup without resorting to making `accentColor`
     equal to [ThemeData.primaryColor]. This definition has less of an impact
     visually to any built-in widgets than one might suspect. With our other 
     existing theme definitions we saw no other widget that used accentColor. 
     FAB and toggles have their own theme and colors, so they still use the 
     default expected colorScheme.secondary color, despite this change. 
     
   * The fairly recent `TextSelectionThemeData` is slightly modified. The
     default for `cursorColor` is `colorScheme.primary`, we also use it, 
     likewise for the deprecated `ThemeData.cursorColor` property.
     The default `selectionHandleColor` is color scheme primary, we use a
     slightly darker custom shade via `primaryColorDark` instead, and
     do the same for the deprecated `ThemeData.textSelectionHandleColor`. The
     standard for `selectionColor` is `colorScheme.primary` with opacity
     value `0.4` for dark, and `0.12` for light mode, we use primary with `0.5` 
     for dark, and `0.3` for light mode. We apply the same defaults to
     the deprecated property `ThemeData.textSelectionColor`.
     
     The deprecated values thus all use the same theme as the one we defined 
     for `TextSelectionThemeData` that replaces the old properties. 
     The values for the old properties     
     will be removed when they are fully deprecated on channel stable, or
     potentially already when they become incompatible with channel beta.
     The design choices on text selection theme are made so that they will
     match and work well together with the `InputDecorationTheme`.
     
   * A predefined slightly opinionated `InputDecorationTheme` is used. It
     sets `filled` to `true` and fill color to color scheme primary color with
     opacity `0.035` in light mode and opacity `0.06` in dark mode. The other
     key theme change is done via modification of the `ThemeData.accentColor`
     described earlier. Since the theme does not define a `border`
     property `TextField` in an app can still easily use both the default
     underline style or the outline style by specifying the default
     `const OutlineInputBorder()` for the border property. If you don't
     want the filled style, or the primary colored borders in dark mode, 
     you can override them back with `copyWith`.
     
   * Button theming is applied to `ThemeData.buttonColor` using color scheme
     primary. The entire color scheme is passed to old button's 
     `ButtonThemeData` and it uses `textTheme` set to
     `ButtonTextTheme.primary`, with minor changes to padding and tap
     target size, it makes the old buttons almost match the default design and
     look of their corresponding newer buttons. Thus `RaisedButton` looks
     very similar to `ElevatedButton`, `OutlineButton` to `OutlinedButton`
     and `FlatButton` to `TextButton`. There are some differences in margins,
     and looks, especially in dark mode, but they are close enough. This is a
     button style we used before the introduction of the new buttons with
     their improved defaults. It just happened to be very close as theme was
     based on how things looked in the design guide prior to Flutter
     releasing the new buttons that fully implement the correct design. 
     
     The newer buttons are thus still nicer, especially when it
     comes to their interactions and all the theming options they provide,
     but they are tedious to theme. If you want to make custom styled
     buttons we still recommend using the newer buttons instead of the old ones,
     as they offer more customization possibilities. Still, this theming applied 
     to the old buttons make them look close enough to the new ones, with
     their nice defaults. To the extent that most might not even notice 
     if you still use the old buttons. 
     
   * The default theme for Chips contain a design bug that makes the
     selected `ChoiceChip()` widget look disabled in dark mode, regardless if
     created with `ThemeData` or `ThemeData.from` factory.
     See issue: https://github.com/flutter/flutter/issues/65663
     The used `ChipThemeData` modification fixes the issue.
     
   * The `FloatingActionButtonThemeData` is set as follows:
     ```dart
     FloatingActionButtonThemeData(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary),
     ```
     In order to ensure the same FAB style that was the default in ThemeData
     factory via `accentIconTheme` in the past. If it is not defined we
     get a deprecated warning like this:
     
     >Warning: The support for configuring the foreground color of
     FloatingActionButtons using ThemeData.accentIconTheme has been
     deprecated. Please use ThemeData.floatingActionButtonTheme instead.
     See https://flutter.dev/go/remove-fab-accent-theme-dependency.
     This feature was deprecated after v1.13.2.
     
   * For `TabBarTheme` a default design that fits with surface color is
     used, instead of one that fits with the app bar color. Including this
     in the theme design is still being evaluated. It might be removed in the
     final release in preference for guidance on how to theme it like this
     when so needed.
     
   * The `BottomNavigationBarThemeData` uses color scheme primary color for
     the selected item. Flutter defaults to secondary color. Primary color
     is the design commonly used on iOS for the bottom navigation bar. We
     agree and think it looks better as the default choice in apps.
     
   * Default tooltip theming in Flutter is currently a bit flawed on desktop
     and web using very small 10dp font.
     See issue: https://github.com/flutter/flutter/issues/71429
     
     The default theming also does not handle multiline tooltips very well.
     The used `TooltipThemeData` theme design corrects both issues. It uses
     12dp font on desktop and web instead of 10dp, and some padding over
     height constraint to ensure multiline tooltips look nice too.
     `FlexColorScheme` also includes a new property `tooltipsMatchBackground`
     that can be toggled to not used Flutter's Material default theme mode
     inverted background. Tooltips using light background in light theme
     and dark in dark, are commonly used on Windows desktop platform. You
     can tie the extra property to used platform to make an automatic
     platform adaptation of the tooltip style, or give users a preference
     toggle if you like.
     
   * We like same color on the app bar and status bar with in Android, like
     on iOS it is cleaner. We would also like transparent navigation bar in
     Android to be transparent. The first design is included and works, but
     controlling the navigation bar seems to be tricky. 
     See related issue(s): https://github.com/flutter/flutter/issues/69999.
     This pre-release still contains some experiments with these styles by
     using `SystemChrome.setSystemUIOverlayStyle` in the toTheme method. We
     will probably remove it in the first official release version, in favor
     of setting these design elsewhere and via other means in our apps.

