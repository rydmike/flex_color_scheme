# FlexColorScheme

> ## !!PRE-RELEASE VERSION !!
> This package is still being worked on, both regarding the API and its documentation. 
> * API is now about 99% ready.
> * Documentation is about 95% ready.
> * This is hopefully the last pre-release before 1.0.0 release.

**FlexColorScheme** helps you make beautiful color scheme based Flutter themes, with optional level of primary 
color branded surfaces. The created themes are based on the same concept as Flutter's newer `ColorScheme` based themes, 
but with a few interesting twists and features.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/CollageSize50.png?raw=true" alt="ColorScheme Intro"/>

## Contents
* [Introduction](#introduction)
* [Installing](#installing)  
    * [Default Sample Application](#default-sample-application)
    * [Live WEB Demos of the Examples](#live-web-demos-of-the-examples)          
* [Tutorial](#tutorial)  
    * [The HomePage of all the Examples](#the-homepage-of-all-the-examples)
    * [Example 1 Use a predefined color scheme](#example-1-use-a-predefined-color-scheme)    
    * [Example 2 Create a custom color scheme](#example-2-create-a-custom-color-scheme)   
    * [Example 3 Switch between different color schemes](#example-3-switch-between-different-color-schemes)    
    * [Example 4 Switch between all built in color schemes](#example-4-switch-between-all-built-in-color-schemes)    
    * [Example 5 Full featured demo](#example-5-full-featured-demo)  
* [Behind the scenes](#behind-the-scenes)  
    * [Used Theme Customizations](#used-theme-customizations)
* [API Reference](https://pub.dev/documentation/flex_color_picker/latest/flex_color_scheme/flex_color_scheme-library.html)    
    
## Introduction

A total of 20 different color schemes for both light and dark modes are available as predefined color schemes. These 
are ready to use nice color schemes, but you can just easily create your own custom color schemes and make themes 
from them. If you have seen the Flutter [**FlexFold web demo**](https://rydmike.com/demoflexfold) application, then you 
have already seen **FlexColorScheme** in action. The FlexFold demo uses this package for its 
fancy theming and to enable switching between all the themes effortlessly. 
The examples in this package show you how it is done.

FlexColorScheme makes a few opinionated, but subtle theme modifications compared to the default Flutter `ThemeData.from`
themes created from a `ColorScheme`. It also corrects a few minor theme inconsistencies that exist in the
current version of Flutter's `ThemeData.from` factory. These topics are covered in detail in
the [last chapter](#used-theme-customizations).

The Material guide also talks about using
[color branded surfaces](https://material.io/design/color/dark-theme.html#properties). With **FlexColorScheme** you
can easily create such primary color branded themes. This is done by using four built-in strengths for blending in
primary color into surface and background colors, while avoiding blending it in with the scaffold background color,
for all but the highest strength.

The scheme colors can like Flutter's standard `ColorScheme`, be created by specifying all required schemes colors,
but you can also specify just the primary color and get all other colors needed for a complete color scheme computed
based on just the provided primary color.

When you have defined your `FlexColorScheme` you make a theme based on it with the `toTheme` method, that returns a
`ThemeData` object that you can use just like any other `ThemeData` object. You can of course override this
returned theme and add additional custom sub-theming to it with the normal ThemeData `copyWith` method. 

## Installing

In the `pubspec.yaml` of your **Flutter** project, add the following dependency:

```yaml
dependencies:
  ...
  flex_color_scheme: any
```

In your library file add the following import:

```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
```

You can now start using `FlexColorScheme`based themes in your application. The easiest way to do so is to use one
of the 20 built-in color schemes. The schemes have enums that you can use to refer to them, their corresponding 
data object holds name, description and separate scheme data for each schemes' light and dark mode. The Google 
Material schemes used as example in the Material Guide, that also exist as defaults for `ColorScheme.light()` and
`ColorScheme.dark()` in Flutter SDK, as well as the high contrast schemes `ColorScheme.highContrastLight()` and
`ColorScheme.highContrastDark()` in Flutter are also included as the first two predefined 
schemes in `FlexColorScheme`. 

### Default Sample Application

The package contains five different example applications with increasing complexity.
 
To try the simplest of them, example 1 in `FlexColorScheme` on a device or simulator,
clone the [repository](https://github.com/rydmike/flex_color_scheme) and run the example:

```bash
cd example/
flutter run --release
```

The result is a sample app that uses one of the built color schemes as its theme, has a light/dark/system theme
mode toggle and includes a theme showcase, so you can see the impact of the theme on common Material widgets.

> #### NOTE:
>If you clone the repository to build the samples, then open the package `/example` folder with your IDE to build
>the above default example. This example is the same as the example in the `/example/lib/example1` folder.
>If you want to build the
>other examples, without setting up different configurations in your IDE for the different main files, you can just
>copy and paste each example's code into the `/example/lib/main.dart` file to build it. Just correct the
>relative import of `import 'all_shared_imports.dart';` in the copy, and you are ready to go. 

### Live WEB Demos of the Examples

If you just want to have a quick look at all the example applications, you can try live web versions of them.

[**Example 1**](https://rydmike.com/flexcolorscheme1)presents the simplest use case, to just use one of the 
built-in color schemes as your application theme and toggle between its light 
and dark variant, or allow device mode setting to control if the dark or light theme is used.  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1al.png?raw=true" alt="ColorScheme example 1 light" width="120"/>
   
[**Example 2**](https://rydmike.com/flexcolorscheme2) is like example 1, but here we use custom colors to make a custom scheme and turn it into a theme.  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2al.png?raw=true" alt="ColorScheme example 2 light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2ad.png?raw=true" alt="ColorScheme example 2 dark" width="120"/> 

[**In example 3**](https://rydmike.com/flexcolorscheme3) we can toggle the active theme between 3 different 
predefined color schemes, plus the custom one we made in example 2.  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3al.png?raw=true" alt="ColorScheme example 3a light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3ad.png?raw=true" alt="ColorScheme example 3a dark" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bl.png?raw=true" alt="ColorScheme example 3b light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bd.png?raw=true" alt="ColorScheme example 3b dark" width="120"/>
   
[**In example 4**](https://rydmike.com/flexcolorscheme4) we can toggle between all the different built in themes.  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4al.png?raw=true" alt="ColorScheme example 4a light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4bl.png?raw=true" alt="ColorScheme example 4b light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cl.png?raw=true" alt="ColorScheme example 4c light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cd.png?raw=true" alt="ColorScheme example 4c dark" width="120"/>
   
[**Example 5**](https://rydmike.com/flexcolorscheme5) is the last, and most complex one of the examples and presents
more configuration options that you can modify interactively.
This example is best seen and tested on a tablet, desktop or desktop web browser, rather than on a phone, but it
certainly works on a phone sized canvas too. This example is explained in more detail further below.  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5al.png?raw=true" alt="ColorScheme example 5 light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5bl.png?raw=true" alt="ColorScheme example 5b light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5fl.png?raw=true" alt="ColorScheme example 5f light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5gl.png?raw=true" alt="ColorScheme example 5g light" width="120"/>

[**Flexfold demo**](https://rydmike.com/demoflexfold)  
The fanciest example of FlexColorScheme usage is in the [**Flexfold demo app**](https://rydmike.com/demoflexfold).  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/FoldTheme1.gif?raw=true" alt="FlexColorScheme" width="650"/>  
This might look and feel complicated, but it is actually only slightly more fancy than above example nr 5, 
that uses almost all the same theming features and exactly the same themes as the Flexfold demo app. 
Just go through the examples, and you will be ready to make cool 
interactively custom themed apps like the ones in the Flexfold demo app in no time.

## Tutorial

Below we will go through the key topics in each of the 5 examples and explain them. For simplicity the
example applications do not use any advanced state management solution. The key part to each example is always in
the used stateful Material app, where all the scheme setup for the themes are made in these demos. The rest of the
content in the examples are just there to make a relevant visual presentation on the resulting theme from the used
FlexColorScheme.

#### The HomePage of all the Examples
 
The content of the `HomePage` in all these examples is not really so relevant for using `FlexColorScheme` based
application theming. The critical parts are in the example `MaterialApp` theme definitions. The `HomePage` just
contains UI to visually show what the defined themes look like when used in an application with commonly 
used Widgets. It also allows interaction with a few FlexColorScheme APIs in the later examples. All 
examples include a theme mode switch.

We pass in the `FlexSchemeData` we used for the active theme to the application's `HomePage`. This is not really 
needed in to use `FlexColorScheme` schemes based themes, but we use it to be able to show the active 
theme's name and description in the examples. We also use it for the 3-way theme mode switch, that uses the
scheme colors in its toggle widget for its custom theme mode option buttons.

#### The Optional FlexThemeModeSwitch

The only thing on the `HomePage` that might be of interest is the `FlexThemeModeSwitch`, which is the UI for the 
3-way theme mode toggle switch used in the examples to change theme mode. 

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/theme_mode_switch.png?raw=true" alt="theme mode switch" width="350"/>

Using it is very simple, pass it the selected theme mode, the active `FlexSchemeData` scheme and check
the `onThemeModeChanged` callback for changes and act on it.

```dart
FlexThemeModeSwitch(
  themeMode: themeMode,
  onThemeModeChanged: onThemeModeChanged,
  flexSchemeData: flexSchemeData,
),
```

Using the `FlexThemeModeSwitch` 3-way theme mode toggle switch is totally optional and not required to
use `FlexColorScheme` based themes. It is a simple, yet interesting theme mode switch design, it was included on
request as a bonus feature in the `FlexColorScheme` package after being requested after it was seen based on
in the Flexfold demo app.  

In the Flexfold demo it was originally a fairly fixed design but now `FlexThemeModeSwitch` has many properties 
that allows you to customize it extensively, please find its [API 
reference here](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexThemeModeSwitch-class.html)
and its companion, the `FlexThemeModeOptionButton` 
[API reference here](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexThemeModeOptionButton-class.html).

You can vary the way it looks, here are some examples that just scratch the surface:

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/ThemeSwitchCustomize.png?raw=true"
alt="theme mode customize"/>

### Example 1 Use a predefined color scheme

The first and very simple example shows how you can use a predefined color scheme in `FlexColorScheme` to
define light and dark themes using the scheme, and then switch between the light and dark mode. A theme showcase 
widget shows the theme with several common Material widgets.

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

  @override
  void initState() {
    themeMode = ThemeMode.light;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Define which predefined flex scheme to use.
    // Go ahead and try some other ones too.
    const FlexScheme usedFlexScheme = FlexScheme.mandyRed;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',

      // A light scheme, passed to FlexColorScheme.light factory, then use the 
      // toTheme method to return the resulting theme to the MaterialApp theme.
      theme: FlexColorScheme.light(colors: 
        FlexColor.schemes[usedFlexScheme].light).toTheme,
      
      // We do the same thing for the dark theme, but using FlexColorScheme.dark 
      // factory and the dark FlexSchemeColor in FlexColor.schemes.
      darkTheme: FlexColorScheme.dark(colors: 
        FlexColor.schemes[usedFlexScheme].dark).toTheme,
      // Use the above dark or light theme, based on active themeMode 
      // value light/dark/system.
      themeMode: themeMode,
      
      home: HomePage(
        themeMode: themeMode,
        onThemeModeChanged: (ThemeMode mode) {
          setState(() { themeMode = mode; });
        },
        flexSchemeData: FlexColor.schemes[usedFlexScheme],
      ),
    );
  }
}

```

#### Building and running example 1

When you build and run **example 1** you get a sample application that looks like this in light and dark mode:

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1al.png?raw=true" alt="ColorScheme example 1 light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1ad.png?raw=true" alt="ColorScheme example 1 dark" width="195"/>

[**Try example 1 live on the web here**](https://rydmike.com/flexcolorscheme1)

Scroll down to see the theme showcase further below, it presents the theme with common Material widgets.
This simple first example is not using primary color surface branding, it is just a normal theme with a few 
convenient fixes for some theme design gaps in Flutter's own themes created with `ThemeData.from` a `ColorScheme`.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1bl.png?raw=true" alt="ColorScheme example 1b light" width="195"/></nb></nb><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1cl.png?raw=true" alt="ColorScheme example 1c light" width="195"/>

## Example 2 Create a custom color scheme

This example shows how you can define your own FlexSchemeData and create a FlexColorScheme based theme from it.
A theme showcase widget shows the theme with several common Material widgets.

The full code is not shown in the tutorial, please see the code in the package folder
[flex_color_scheme/example/lib/example2](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example2/main.dart)
for the entire example.

To make a custom scheme color, let us for simplicity define it as a const in this example. We just need to make a
[FlexSchemeData] object with a name, description and scheme colors for the light and matching dark theme.
In this example we use dark purple and deep green and matching desaturated versions in dark-mode.

```dart
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
```

Then we simply use this customFlexScheme FlexSchemeData instances light and dark properties to
pass the appropriate scheme colors to the FlexColorScheme light and dark factory for each theme mode and again
use the `toTheme` getter to get the themes defined by them.

```dart
  :
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',
      
      theme: FlexColorScheme.light(colors: customFlexScheme.light).toTheme,
      darkTheme: FlexColorScheme.dark(colors: customFlexScheme.dark).toTheme,
      themeMode: themeMode,
      
      home: HomePage(
        themeMode: themeMode,
        onThemeModeChanged: (ThemeMode mode) {
          setState(() { themeMode = mode; });
        },
        flexSchemeData: customFlexScheme,
      ),
    );
  }
}
```
When you build and run **example 2** you get a sample application that looks like this in light and dark mode:

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2al.png?raw=true" alt="ColorScheme example 2 light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2ad.png?raw=true" alt="ColorScheme example 2 dark" width="195"/>

[**Try example 2 live on the web here**](https://rydmike.com/flexcolorscheme2)

Scroll down to see the theme showcase widgets further below, presenting the theme with some widgets. This example is
not using primary color surface branding, it is just a normal theme with a few convenient fixes for certain
theme properties.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2bl.png?raw=true" alt="ColorScheme example 2b light" width="195"/></nb></nb><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2cl.png?raw=true" alt="ColorScheme example 2c light" width="195"/>

### Example 3 Switch between different color schemes

This example shows how you can use three built-in color schemes, and add one custom scheme, using all four as
selectable FlexColorScheme based theme options in an application. The example also uses strong branded surface 
colors. A theme showcase widget shows the theme with several common Material widgets.

The full example code is not shown here, please see the code in the package folder
[flex_color_scheme/example/lib/example3](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example3/main.dart)
for the entire example.

The customFlexScheme FlexSchemeData setup is the same as in example 2. In the example below, if we selected the 
FlexScheme.custom, we use our customFlexScheme object, otherwise the selected built-in scheme we selected on
the HomePage. We also set the surface style to `FlexSurface.strong`, for strong primary branded surfaces.

 ```dart
 :
 class _DemoAppState extends State<DemoApp> {
   ThemeMode themeMode;
   // Used to store which FlexSchemeData option we selected
   FlexScheme flexScheme;
 
   @override
   void initState() {
     themeMode = ThemeMode.light;
     flexScheme = FlexScheme.hippieBlue; // Default selected theme
     super.initState();
   }
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'FlexColorScheme',

       theme: FlexColorScheme.light(
         colors: flexScheme == FlexScheme.custom
             ? customFlexScheme.light
             : FlexColor.schemesWithCustom[flexScheme].light,
         surfaceStyle: FlexSurface.strong,
       ).toTheme,

       darkTheme: FlexColorScheme.dark(
         colors: flexScheme == FlexScheme.custom
             ? customFlexScheme.dark
             : FlexColor.schemesWithCustom[flexScheme].dark,
         surfaceStyle: FlexSurface.strong,
       ).toTheme,
       themeMode: themeMode,

       home: HomePage(
         themeMode: themeMode,
         onThemeModeChanged: (ThemeMode mode) {
           setState(() { themeMode = mode; });
         },
         // We pass the enum value of the active scheme to the HomePage.
         flexScheme: flexScheme,
         // Where we can select a new scheme and get its enum value back.
         onFlexSchemeChanged: (FlexScheme selectedScheme) {
           setState(() { flexScheme = selectedScheme; });
         },
         // We take care to pass in selected built-in scheme data 
         // or the custom one we made if it is selected.
         flexSchemeData: flexScheme == FlexScheme.custom
             ? customFlexScheme 
             : FlexColor.schemesWithCustom[flexScheme],
       ),
     );
   }
 }
 ```

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3al.png?raw=true" alt="ColorScheme example 3a light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3ad.png?raw=true" alt="ColorScheme example 3a dark" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bl.png?raw=true" alt="ColorScheme example 3b light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bd.png?raw=true" alt="ColorScheme example 3b dark" width="195"/>

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3cl.png?raw=true" alt="ColorScheme example 3c light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3cd.png?raw=true" alt="ColorScheme example 3c dark" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3dl.png?raw=true" alt="ColorScheme example 3d light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3dd.png?raw=true" alt="ColorScheme example 3d dark" width="195"/>

[**Try example 3 live on the web here**](https://rydmike.com/flexcolorscheme3)

### Example 4 Switch between all built in color schemes 

This example shows how you can use all the built in color schemes in FlexColorScheme to interactively select
which one of the built in schemes is used to define the active theme. The example also uses medium branded 
background and surface colors. A theme showcase widget shows the theme with several common Material widgets.

The full example code is not shown here, please see the code in the package folder
[flex_color_scheme/example/lib/example4](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example4/main.dart)
for the entire example.

In this example set the surface style to `FlexSurface.medium`, for medium primary color branded surfaces.
The example is straight forward, we use the built in `FlexColor.schemesList` to access all the pre-defined 
schemes by list index number that we simple change with popup menu on the HomePage.


 ```dart
 :
 class _DemoAppState extends State<DemoApp> {
   ThemeMode themeMode;
   // Used to select which FlexSchemeData we use from a popup menu.
   int themeIndex;
 
   @override
   void initState() {
     themeMode = ThemeMode.light;
     themeIndex = 6; // Start with index 6, the brand blue colors.
     super.initState();
   }
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'FlexColorScheme',

       theme: FlexColorScheme.light(
         colors: FlexColor.schemesList[themeIndex].light,
         surfaceStyle: FlexSurface.medium,
       ).toTheme,
       
       darkTheme: FlexColorScheme.dark(
         colors: FlexColor.schemesList[themeIndex].dark,
         surfaceStyle: FlexSurface.medium,
       ).toTheme,

       themeMode: themeMode,
       
       home: HomePage(
         themeMode: themeMode,
         onThemeModeChanged: (ThemeMode mode) {
           setState(() { themeMode = mode; });
         },
         // We can pass the index of the active theme to the HomePage.
         schemeIndex: themeIndex,
         // Where we can select a new theme in a popup menu
         // and get its index back.
         onSchemeChanged: (int index) {
           setState(() { themeIndex = index; });
         },
         flexSchemeData: FlexColor.schemesList[themeIndex],
       ),
     );
   }
 }
 ```

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4al.png?raw=true" alt="ColorScheme example 4a light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4bl.png?raw=true" alt="ColorScheme example 4b light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cl.png?raw=true" alt="ColorScheme example 4c light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cd.png?raw=true" alt="ColorScheme example 4c dark" width="195"/>

[**Try example 4 live on the web here**](https://rydmike.com/flexcolorscheme4)

### Example 5 Full featured demo 

This example shows how you can use all the built in color schemes in FlexColorScheme to define themes from them
and how you can define your own custom scheme colors and use them together with the predefined ones. It can
give you an idea of how you can create your own complete custom list of themes if you do not want to use any
of the predefined ones.

The example also shows how you can use the surface branding feature and how to use the custom app bar theme
features of FlexColorScheme. The usage of the true black theme feature for dark themes is also demonstrated.
Using the optional Windows desktop like tooltip theme is also shown.

The example includes a dummy responsive side menu and rail to give a visual presentation of what applications
that have larger visible surfaces using the surface branding look like. A theme showcase widget again shows
the theme with several common Material widgets.

In this case we also use the laziest option for creating our 2nd custom olive green light and dark theme, we create
the `FlexSchemeColor` with the `from` factory that only requires the primary color. It still usually manages
to create pretty well toned themes from just a single color for each theme mode.

The first scheme we do like in example 2 and 3, but in this case we also define a custom color value
for the FlexSchemeColor appBarColor property. The built in color schemes use their secondary 
variant color as their custom app bar color, it could of course be any color, but for consistency
we will do the same in this custom FlexSchemeColor.

The full example code is not shown here, please see the code in the package folder
[flex_color_scheme/example/lib/example5](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example5/main.dart)
for the entire example.

```dart
 void main() => runApp(const DemoApp());
 
 // Create a custom flex color scheme for a light theme.
 const FlexSchemeColor myScheme1Light = FlexSchemeColor(
   primary: Color(0xFF4E0028),
   primaryVariant: Color(0xFF320019),
   secondary: Color(0xFF003419),
   secondaryVariant: Color(0xFF002411),
   appBarColor: Color(0xFF002411),
 );
 // Create a corresponding custom flex color scheme for a dark theme.
 const FlexSchemeColor myScheme1Dark = FlexSchemeColor(
   primary: Color(0xFF9E7389),
   primaryVariant: Color(0xFF775C69),
   secondary: Color(0xFF738F81),
   secondaryVariant: Color(0xFF5C7267),
   appBarColor: Color(0xFF5C7267),
 );
```

Next we will use a shorter convenient way to define a FlexSchemeColor object
from just single color. The `FlexSchemeColor.from` factory can do the trick with 
just the primary color defined. The custom app bar color will in this case 
also receive the same color value as the computed one for secondaryVariant color.


```dart
 final FlexSchemeColor myScheme2Light =
     FlexSchemeColor.from(primary: const Color(0xFF4C4E06));

 final FlexSchemeColor myScheme2Dark =
     FlexSchemeColor.from(primary: const Color(0xFF9D9E76));
```

Then we simply create a list with all color schemes we will use, starting with all
the built-in ones and then adding our two custom ones at the end.


```dart
  final List<FlexSchemeData> myFlexSchemes = <FlexSchemeData>[
   // Add the predefined FlexColor schemes
   ...FlexColor.schemesList,
   // Then add our first custom ones to the list.
   const FlexSchemeData(
     name: 'Custom purple',
     description: 'Purple theme created from custom defined colors.',
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
```

Now we have list `myFlexSchemes` with all the built-in themes and our own
custom ones, that we can simply use the same way as we did in example 4.

In this example we will also toggle the app bar theme style, the surface
primary color branding strength, tooltip style and try the true black theme
toggle for dark-mode as well.

We will also use a toggle that allows us to instead of using the
`FlexColorScheme.toTheme` method use the standard flutter
`ThemeData.from` factory to create the theme from the same color scheme
definition. This way we can use this toggle to see the differences. 


```dart
 :
 
 class _DemoAppState extends State<DemoApp> {
   // Used to select if we use the dark or light theme.
   ThemeMode themeMode;
    // Used to select which FlexSchemeData we use in our list of schemes.
   int themeIndex; 
   // Enum used to select what app bar style we use.
   FlexAppBarStyle flexAppBarStyle;
   // Enum used to control primary color surface branding on surface and background.
   FlexSurface flexSurface;
   // If true, tooltip theme background will be light in light theme, and dark
   // in dark themes. The Flutter and Material default and standard is the other
   // way, tooltip background color is inverted compared to app background.
   bool tooltipsMatchBackground;
   // Allow toggling between normal dark mode and true black dark mode.
   bool darkIsTrueBlack;
   // Use the toTheme method to create Themes from [FlexColorScheme]. This
   // is the preferred method when using [FlexColorScheme]. In this demo
   // you can use a toggle to see what a FlexColorScheme looks like if you just
   // use its color scheme and use [ThemeData.from] to instead create the theme.
   bool useToThemeMethod;
 
   @override
   void initState() {
     themeMode = ThemeMode.light;
     themeIndex = 7; // Start with deep blue see theme.
     flexAppBarStyle = FlexAppBarStyle.primary;
     flexSurface = FlexSurface.medium;
     tooltipsMatchBackground = false;
     darkIsTrueBlack = false;
     useToThemeMethod = true;
     super.initState();
   }
```

We define the light theme for the app, using current theme index, selected
surface style and app bar style. With the built in 20 themes and the
custom ones we defined above, we can use 22 different app themes via
the definition below, times the surface styles and app bar variants.

The factory FlexColorScheme.light is used to define a FlexColorScheme
for a light theme, from the light FlexSchemeColor plus some other theme
factory properties, like the surface and app bar style used in
this example as well as the tooltip and true black setting for the dark
theme.

```dart
   :
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'FlexColorScheme',


       theme: useToThemeMethod
           ? FlexColorScheme.light(
               colors: myFlexSchemes[themeIndex].light,
               surfaceStyle: flexSurface,
               appBarStyle: flexAppBarStyle,
               tooltipsMatchBackground: tooltipsMatchBackground,
             ).toTheme
```

We also demonstrate how to create the same theme with
the standard from color scheme ThemeData factory. The surface style
works, but will not be applied as elegantly, but it works fairly OK up
to medium branding. The app bar style has no effect, nor the tooltip
style. We also have to make sure we use the same typography as the one
used in FlexColorScheme, otherwise the animated theme will show an
assertion error as it cannot animate between different typography or
null default typography in the theme data.
When toggling between the standard `ThemeData.from` and the
`FlexColorScheme.toTheme` we can observe the differences and see
some theme colors that the standard method does not adjust
to match the used color scheme.

```dart
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
```

We do the equivalent definition for the dark theme, and we add
the true black option as well.
In dark-mode we can see many gaps in the resulting ThemeData when
using the standard `ThemeData.from` factory to create the theme.


```dart
       
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
```

The rest of the additions in the stateful MaterialApp are just
passing in current values and getting a new value for it via
callbacks for all our settings values.


```dart
      
// themeMode value and change callback
       themeMode: themeMode,
       home: HomePage(
         themeMode: themeMode,
         onThemeModeChanged: (ThemeMode mode) {
           setState(() { themeMode = mode; });
         },
         // Used theme index and change callback
         schemeIndex: themeIndex,
         onSchemeChanged: (int index) {
           setState(() { themeIndex = index;});
         },
         // Used app bar style and change callback
         appBarStyle: flexAppBarStyle,
         onAppBarStyleChanged: (FlexAppBarStyle style) {
           setState(() { flexAppBarStyle = style; });
         },
         // Used surface branding and change callback
         themeSurface: flexSurface,
         onThemeSurfaceChanged: (FlexSurface surface) {
           setState(() { flexSurface = surface; });
         },
         // Used tooltip style and change callback
         tooltipsMatchBackground: tooltipsMatchBackground,
         onTooltipsMatchBackgroundChanged: (bool value) {
           setState(() { tooltipsMatchBackground = value; });
         },
         // True black mode and change callback
         darkIsTrueBlack: darkIsTrueBlack,
         onDarkIsTrueBlackChanged: (bool value) {
           setState(() { darkIsTrueBlack = value; });
         },
         // Theme creation method and toggle method callback
         useToTheme: useToThemeMethod,
         onUseToThemeChanged: (bool value) {
           setState(() { useToThemeMethod = value; });
         },

         flexSchemeData: myFlexSchemes[themeIndex],
       ),
     );
   }
 }
```

With this example we include a side rail, it actually expands to menu on web desktop sized canvas and even 
phone landscape, just for demo purposes. It is there to give us a better idea what a surface branded theme 
looks like. It is of course best viewed and experienced on a tablet, or the web demo where the surface branding 
theming effect is more obvious.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5al.png?raw=true" alt="ColorScheme example 5 light" width="250"/>

[**Try example 5 live on the web here**](https://rydmike.com/flexcolorscheme5)

Let us now explore the effect of branded surface color in both light and dark mode. Branded surfaces are often 
associated with dark mode, but it works well with light mode too when applied delicately. Below you see how 
the primary color gets blended into Material surface and even stronger so, into Material background. 
The screen shots below are using the medium branding strength.

You can use the toggle in the example to change from standard no branded surfaces colors, to light, medium, 
strong and heavy.

The scaffold background does not receive any branding until the heavy mode. You might think that this and all 
the other theming can be done by just passing the same scheme colors to the `ThemeData.from` factory. That is why
this demo allows you to flip a switch to do just that, so you can see and observe the difference between
color scheme based themes created by `FlexColorScheme.toTheme` and `ThemeData.from`. Feel free to experiment with
the live web demo where the differences are even easier to observe since you can have both versions open side by 
side, in a large browser windows.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5bl.png?raw=true" alt="ColorScheme example 5b light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5cl.png?raw=true" alt="ColorScheme example 5c light" width="195"/>

Now when we tried the branding, we can test the tricks `FlexColorScheme` can do
with the `AppBarTheme`. You can easily toggle both dark and light mode app bar theme to use differently
themed backgrounds. 
It can use scheme primary color, the default Material plain white/dark background color, or the primary branded 
surface and background color versions, as well as an extra custom app bar scheme color, which is a separate scheme
color, that does not exist in Flutter's `ColorScheme`, it thus does not have to be any of the colors in 
Flutter `ColorScheme`. The predefined schemes actually use the color defined for normal scheme `secondaryVariant` 
as the custom color used for the app bar theme. When you make your own schemes you can do the same or use a totally not 
scheme related color as the app bar's theme color.

Below you can see some different branding strengths with a background primary color branded app bar color used as well.
This example compares medium versus heavy branding. The medium choice is usually well-balanced, but light can be 
subtle and nice too. If you want to make a bold statement theme, go with heavy. Please note that the visual 
impact of the branding also depends on how saturated the primary color is.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5dl.png?raw=true" alt="ColorScheme example 5d light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5el.png?raw=true" alt="ColorScheme example 5e light" width="195"/>

Here are few more images of the heavy primary color branded version, when looking at some widgets as well.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5fl.png?raw=true" alt="ColorScheme example 5f light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5gl.png?raw=true" alt="ColorScheme example 5g light" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5hl.png?raw=true" alt="ColorScheme example 5h light" width="195"/>

Dark-mode is nice, but with `FlexColorScheme` you can go even "deeper", to **true black** with the flick of a 
switch. When using the true black option for dark-mode, surface, background and scaffold background are set to 
fully black. This can save power on OLED screens as the pixels are turned off, but it can also cause scrolling artefact 
issues when pixels turn fully on and off rapidly as you scroll. You can read about this and see an example of it in 
the [Material design guide](https://material.io/design/color/dark-theme.html#ui-application)
as well (scroll back up one heading to get to the mention of it). 
 
If you use branded surfaces with true black mode enabled, you will notice that the branding has less of an impact, 
only at strong and heavy levels will it have an impact. This is by design, to keep most surface totally or very close to
black when true black is combined with surface branding. If you really want total and true black for all surfaces
and backgrounds, then avoid combining true black mode with branded surfaces. On the other hand it still makes an even
darker theme, than normal dark theme, and it eliminates the scrolling issue since all background colored pixels are not
fully off in the strong and heavy branded true black modes.

Here is an example of a branded dark theme with true black OFF and true black ON, when using heavy branding. 

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5cd.png?raw=true" alt="ColorScheme example 5c dark" width="195"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5bd.png?raw=true" alt="ColorScheme example 5b dark" width="195"/>

## Behind the scenes

**FlexColorScheme** does not actually use the `ThemeData.from` factory with a passed 
in `ColorScheme` to make its theme. It uses the `ThemeData` factory directly with some 
custom theming. It does of course define a
`ColorScheme` that is uses for the `ThemeData`. FlexColorScheme uses color calculations for the primary color
brand blended surfaces, and for the lazy schemes that do not specify all colors in a color scheme.

### Used Theme Customizations

In addition to the primary color branded surfaces, full shaded schemes from just one primary color, true
black and app bar tricks. The returned `ThemeData` contains some opinionated modifications and theme
corrections compared to what you get if you would just use the standard `ThemeData.from` with a `ColorScheme`.
You can still of course override the returned theme with your own theme modifications and additions, by using
the `copyWith` method on the resulting theme.
  
If you want the details of what the differences compared to the standard `ThemeData.from` factory
are, here is a complete list:

   * `ScaffoldBackground` has its color own property in `FlexColorScheme` and
     can if so desired differ from the `ColorScheme` `background` color. In the
     branding implementation. The `scaffoldBackground` typically gets no
     primary branding applied, only in the heavy choice is there a small
     amount of it. Whereas `background` in the scheme receives the most
     color branding of the surface colors. Which fits well for where the
     `background` color is used on Material in Widgets, but it does not
     go so well together with `scaffoldBackground`, which is the reason
     why it got its own scheme color value in this implementation.
     
   * The `dialogBackgroundColor` uses the `ColorScheme.surface` color instead
     of the `ColorScheme.background` because the `background` color gets the
     strongest branding when branding is used. This did not look so good on
     dialogs, so its color choice was changed to `surface` instead, that gets
     very light branding applied. With standard default Material surface
     colors the `background` and `surface` colors are the same, so there is
     no difference in that case.
     
   * The `indicatorColor` uses color scheme `primary` instead of the default
     that is `onSurface` in dark-mode, and `onPrimary` in light mode.
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
     not give correct localized typography. 
     
     A new feature implemented via:
     https://github.com/flutter/flutter/pull/71184 also enables this kind
     app bar themes and keep the correct typography localization. This new
     feature is (as of 13.12.2020) not yet available on channel stable.
     The first version on master could also not be enabled via Themes
     only, one also had to opt in on AppBar level, making it difficult to
     adopt the feature. I wrote a proposal to introduce opt in on theme 
     level too: https://github.com/flutter/flutter/issues/72206
     The proposal has already been implemented. When these new features land
     in stable channel, the implementation below will be changed to use
     the new AppBarTheme feature, as it is better than this work-around
     since we no longer need a custom text theme to implement it.
     
   * The `AppBarTheme` elevation defaults to 0.
     
   * Like standard `ThemeData.from` color scheme themes, the `bottomAppBarColor`
     also uses scheme `surface` color. Additionally, this color is also applied to
     `BottomAppBarTheme`, that like the app bar also gets default elevation 0.
     
   * A deviation from `ThemeData.from` color scheme based theme's is
     that `ThemeData.accentColor` is set to color scheme primary and not to
     secondary. This is done to get an easy way for borders on `TextField.decoration`
     to use theme based primary color in dark-mode, and not `accentColor`
     color. There may be a bug in the way `InputDecorationTheme` gets used
     by the `InputDecorator`. We were unable to define a theme that would
     work correctly for such a setup without resorting to making `accentColor`
     equal to `ThemeData.primaryColor`. This definition has less of an impact
     visually to any built-in widgets than one might suspect. With our other 
     existing theme definitions we saw no other widget that used accentColor. 
     FAB and toggles have their own theme and colors, so they still use the 
     default expected colorScheme.secondary color, despite this change. 
     
   * In `TextSelectionThemeData`, the standard for `selectionColor` is
     `colorScheme.primary` with opacity value `0.4` for dark and `0.12` light mode.
     Here primary with `0.5` for dark-mode and `0.3` for light mode is used.
     The standard for `selectionHandleColor` is `colorScheme.primary`, here we use
     the slightly darker shade `primaryColorDark` instead, which does not have a
     proper definition in Flutter standard `ColorScheme` based themes.
     
   * A predefined slightly opinionated `InputDecorationTheme` is used. It
     sets `filled` to `true` and fill color to color scheme primary color
     with opacity `0.035` in light mode and opacity `0.06` in dark-mode.
     The other key theme change is done via modification of the
     `ThemeData.accentColor` described earlier. Since the theme does not
     define a `border` property of `TextField` in an app can still easily
     use both the default underline style, or the outline style by
     specifying the default `const OutlineInputBorder()` for the border
     property. If you don't  want the filled style, or the primary colored
     borders in dark-mode, you can override them back with `copyWith`.
     
   * The property `fixTextFieldOutlineLabel` is set to `true` by default,
     it looks much better.
     
   * Button theming is applied to `ThemeData.buttonColor` using color scheme
     primary. The entire color scheme is passed to old button's 
     `ButtonThemeData` and it uses `textTheme` set to
     `ButtonTextTheme.primary`, with minor changes to padding and tap
     target size, it makes the old buttons almost match the default design and
     look of their corresponding newer buttons. Thus `RaisedButton` looks
     very similar to `ElevatedButton`, `OutlineButton` to `OutlinedButton`
     and `FlatButton` to `TextButton`. There are some differences in margins
     and looks, especially in dark-mode, but they are close enough. This is a
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
     selected `ChoiceChip()` widget look disabled in dark-mode, regardless if
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
     used, instead of one that fits with the app bar color. 
     
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
     
   * On Android devices a `setSystemUIOverlayStyle` call makes
     the AppBar one-colored like on iOS, which looks better (opinionated).
     It would be nice if we could also make the system navigation button area
     on Android transparent, but it does not work if we set
     systemNavigationBarColor to a transparent color.
     It is doable, but requires modifying Android config files, not possible
     as far as I have seen from Flutter only.
     Related issue: https://github.com/flutter/flutter/issues/69999.

