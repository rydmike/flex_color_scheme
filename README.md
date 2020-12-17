# FlexColorScheme

FlexColorScheme is a Flutter package to help you make beautiful color branded Flutter themes. The created themes are based on the same concept as Flutter's newer `ColorScheme` based theming.

A total of 20 different color schemes for both light and dark modes are available as predefined color schemes. These are just ready to use examples, you can easily create your own custom color schemes and make themes from them. If you have seen the Flutter [FlexFold demo](https://rydmike.com/demoflexfold) application, then you have already seen **FlexColorScheme** in action, the demo uses this package for its theming.

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
>If you clone the repo to build the samples, then open the package `/example` folder in your IDE to build the above default example, which ss the same as the example in the `/example/lib/example1` folder. If you want to build all the other examples one by one, without setting up different configurations in you IDE for the different main files, you can just copy paste in each example's code into the `/example/lib/main.dart` file to build it easily. Just correct the relative import of `import 'all_shared_imports.dart';` and you are ready to build it. 

## Tutorial

We will review the key parts in each example below and explain the features step by step. For simplicity the example applications does not use any state management solution. The key part to demonstration is always in the used stateful Material app where all the scheme setup for the themes are made in these demos.

The rest of the examples are just there so you can change some settings and see the results.

### All the examples - Live WEB demos

If you just want to have a quick look at all the example applications you can try Live web versions of them.

1. Use a built-in scheme as your application theme and toggle between its light and dark variant, or allow device mode setting to control if the dark or light theme is used. [See example 1 here.](https://rydmike.com/flexcolorscheme1/)
2. Like the previous example, but here we use custom colors to make a custom scheme and turn it into a theme. [See example 2 here.](https://rydmike.com/flexcolorscheme2/)  
3. In this example we can toggle the active theme between 3 different built in color schemes, plus the custom one we made. [See example 3 here.](https://rydmike.com/flexcolorscheme3/)
4. In example 4 we can toggle between all the different built in themes. [See example 4 here.](https://rydmike.com/flexcolorscheme4/)
5. The last, and most complex example presents more configuration options that you can modify interactively. This example is more suitable to be tested on a tablet, desktop or desktop web browser. It is presnted in more detail further below. [See example 5 here.](https://rydmike.com/flexcolorscheme5/)

## Using an existing color scheme - Example 1

This example shows how you can use a selected predefined color scheme inFlexColorScheme to define light and dark themes using the scheme and then switch between the light and dark mode. A theme showcase widget shows the theme with several common Material widgets.



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


## Create a custom color scheme - Example 2

This example shows how you can define your own FlexSchemeData and create a FlexColorScheme based theme from it. A theme showcase widget shows the theme with several common Material widgets.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2al.png?raw=true" alt="ColorScheme example 2 light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2ad.png?raw=true" alt="ColorScheme example 2 dark" width="250"/>


## Toggle between different color schemes - Example 3

This example shows how you can use three built-in color schemes, and a custom scheme as selectable FlexColorScheme based theme options in an application. The example also uses strong branded surface colors. A theme showcase widget shows the theme with several common Material widgets.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3al.png?raw=true" alt="ColorScheme example 3 light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3ad.png?raw=true" alt="ColorScheme example 3 dark" width="250"/>


## Toggle between all built in color schemes - Example 4

This example shows how you can define your own FlexSchemeData and create a FlexColorScheme based theme from it. A theme showcase widget shows the theme with several common Material widgets.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4al.png?raw=true" alt="ColorScheme example 4 light" width="300"/>
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4ad.png?raw=true" alt="ColorScheme example 4 dark" width="300"/>


## All themes, two custom ones, branded surfaces, app bar theme toggle and more - Example 5

This example shows how you can define your own FlexSchemeData and create a FlexColorScheme based theme from it. A theme showcase widget shows the theme with several common Material widgets.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5al.png?raw=true" alt="ColorScheme example 5 light" width="300"/>
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5ad.png?raw=true" alt="ColorScheme example 5 dark" width="300"/>






