# FlexColorScheme

**FlexColorScheme** helps you make beautiful color scheme based Flutter themes, with optional level of primary 
color branded surfaces. The created themes are based on the same concept as Flutter's ColorScheme based themes, 
but with a few interesting twists and features.

For more information about **FlexColorScheme**, its use cases and background, this package companion
[**blog post and article**](https://rydmike.com/colorscheme) is recommended reading.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/CollageSize50.png?raw=true" alt="ColorScheme Intro"/>

## Contents
* [Introduction](#introduction)
    * [Color Branded Backgrounds and Surfaces](#color-branded-backgrounds-and-surfaces)    
    * [Nuanced Scheme Set from One Color](#nuanced-scheme-set-from-one-color)
    * [What About My Theme Additions?](#what-about-my-theme-additions)
    * [Built-in Color Schemes](#built-in-color-schemes)
* [Installing and Using](#installing-and-using)  
    * [Default Sample Application](#default-sample-application)
    * [Live WEB Demos of the Examples](#live-web-demos-of-the-examples)          
* [Tutorial](#tutorial)  
    * [HomePage for the Examples](#homepage-for-the-examples)
    * [Optional FlexThemeModeSwitch](#optional-flexthememodeswitch)
    * [Example 1 Use a predefined color scheme](#example-1-use-a-predefined-color-scheme)    
    * [Example 2 Create a custom color scheme](#example-2-create-a-custom-color-scheme)   
    * [Example 3 Switch between different color schemes](#example-3-switch-between-different-color-schemes)    
    * [Example 4 Switch between all built in color schemes and three custom ones](#example-4-switch-between-all-built-in-color-schemes-and-three-custom-ones)
    * [Example 5 Full featured demo](#example-5-full-featured-demo)
      * [Computed Dark Theme](#computed-dark-theme)
      * [Computed Dark Theme with Level Adjustment](#computed-dark-theme-with-level-adjustment)  
      * [Branded Surfaces and App Bar Options](#branded-surfaces-and-app-bar-options)
      * [The TabBar Style](#the-tabbar-style)  
      * [True Black](#true-black)
* [Behind the scenes](#behind-the-scenes)  
    * [Theme Improvements](#theme-improvements)
* [API Reference](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/flex_color_scheme-library.html)    
    
## Introduction

When you design Flutter applications you should base the colors of your application on a light theme mode
ColorScheme and a dark theme mode ColorScheme. Then make your light and dark ThemeData from these color schemes, and in
your MaterialApp use these themes for the light and dark themes. This gives you an application that uses the defined
color scheme on the built-in Material UI Widgets, well on most of them anyway. Flutter's `ThemeData.from` a
`ColorScheme` has a few gaps, the used color scheme is not consistently applied to **all** standard Material UI Widgets.

FlexColorScheme corrects these minor inconsistencies and gaps that exist in the current version of Flutter's
`ThemeData.from` factory. It also makes a few opinionated, but subtle theme modifications compared to the 
`ThemeData.from` themes created from a `ColorScheme`. These topics are covered in detail in  the 
[last chapter](#theme-improvements) and in the article you can find a 
[visual presentation](https://rydmike.com/colorscheme#the-difference) of the differences.

This is just the basic part, FlexColorScheme can do some other nice theme design tricks.
If you have seen the Flutter [**Flexfold web demo**](https://rydmike.com/demoflexfold) application, then you 
have already seen **FlexColorScheme** in action. The Flexfold demo app uses this package for its fancy theming and to
enable effortless switching between all the themes it uses. The package included examples in the 
[tutorial chapter](#tutorial), show you how the Flexfold demo app theming is done with this package.

### Color Branded Backgrounds and Surfaces

The Material Guide briefly mentions 
[color branded surfaces](https://material.io/design/color/dark-theme.html#properties). With **FlexColorScheme** you
can easily create such primary color branded themes. This is done by using the four built-in strengths for blending in
primary color into surface and background colors, while avoiding blending it in with the scaffold background color,
for all but the highest strength. It is quite interesting what a bit of extra flair and purposefully designed feeling it
can result in when used appropriately.

### Nuanced Scheme Set from One Color

A `FlexColorScheme` can like Flutter's standard `ColorScheme` be created by specifying all the required 
scheme colors, but you can also specify just the primary color and get all other colors needed for a complete color 
scheme computed based on just the provided primary color. 

There is a helper class with a factory `FlexSchemeColor.from` that can do this for you. Another helper can 
also create a computed matching dark scheme, from a defined light scheme this is done with `FlexSchemeColor.toDark`. 
This works regardless of if you created a fully specified custom light scheme or just one from a single color. 
These features are presented and explained in the tutorial with 
[example 4](#example-4-switch-between-all-built-in-color-schemes-and-three-custom-ones) and 
[example 5](#example-5-full-featured-demo).

### What About My Theme Additions?

FlexColorScheme does not get in the way of adding your own additional custom theming to your application.
When you have defined your `FlexColorScheme`, you make a theme based on its scheme with `FlexColorScheme.toTheme`, 
that returns a `ThemeData` object that you can use like any other `ThemeData` object. You can then of course 
override this returned theme data and add additional custom sub-theming to it with the normal 
ThemeData `copyWith` method before passing it on to your app. 

### Built-in Color Schemes

Color schemes are no fun without some built-in example schemes to use and play with.
**FlexColorScheme** comes with **24** ready to go color schemes that you can use in your apps if you like.
[**Here**](https://rydmike.com/colorscheme#built-in-color-schemes) you can see phone sized hires screen-shots of 
them all, in both light and dark theme-mode. 

The bundled examples are all tuned matching light and dark theme pairs. The first two color schemes are actually
the Flutter and Material Design guide examples of light and dark mode themes, and the Flutter high contrast light and
dark color versions as well. So OK, there are actually "only" 22 new ready-made light and dark color schemes pairs.

There is of course no need to use any of the built-in color schemes, the package examples show how you can easily
make your own custom schemes, maybe the built-in examples will inspire you.

Here is a low-res composite image of all the currently built-in ready to use color schemes that can you can
use if you like.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_all_schemes_24_at_75.png?raw=true" alt="ColorScheme all"/>

## Installing and Using

In the `pubspec.yaml` of your **Flutter** project, add the following dependency:

```yaml
dependencies:
  flex_color_scheme: any
```

In your library file add the following import:

```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
```

You can now start using `FlexColorScheme` based themes in your application. The easiest way to do so is to use one
of the 24 built-in color schemes. The schemes have enums that you can use to refer to them. Their corresponding 
data object holds name, description and separate scheme data for each schemes' light and dark mode.

As a simple use case, take the **default Flutter counter app**, do the above installation and select one of the 
built-in FlexColorScheme's schemes to use with it. 

In this example we use **"Oh Mandy red"** scheme that is represented by enum value `FlexScheme.mandyRed`. 

There is a `FlexColor.schemes` **map** with the `FlexScheme` enums as keys, with corresponding predefined 
`FlexSchemeData` objects as values. We use this `FlexSchemeData` object's light colors for the light color scheme that 
we make with the `FlexColorScheme.light` factory by assigning the light `FlexSchemeColor` set, from the 
predefined `FlexSchemeData` we got with the enum key from the map, to the `colors` property of the
`FlexColorScheme.light` factory.

Then we use `toTheme` to let the resulting `FlexColorScheme.light` object return the theme this factory defines, 
that we finally assign to the `MaterialApp` `theme` property.

The above may sound a bit complicated, but it is just one line of code:

```dart
theme: FlexColorScheme.light(colors: FlexColor.schemes[FlexScheme.mandyRed].light).toTheme,
```

For the dark theme we do the equivalent using the `FlexColorScheme.dark` factory and the `dark` version of the
`FlexSchemeColor` that we have in our `FlexSchemeData` object from the `FlexColor.schemes` map via 
the same `FlexScheme.mandyRed` key.

```dart
darkTheme: FlexColorScheme.dark(colors: FlexColor.schemes[FlexScheme.mandyRed].dark).toTheme,
```

We also set the app's `themeMode` property to `ThemeMode.system` so that the used device can control if the app 
uses its light or dark theme, based on the device system setting for light and dark theme.

Totally just one property modified, and two properties added to the default counter app, plus the package 
import of course. The modified MaterialApp from the Flutter default counter app is shown below.

```dart
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // The Mandy red light theme.
      theme: FlexColorScheme.light(
        colors: FlexColor.schemes[FlexScheme.mandyRed].light,
      ).toTheme,
      // The Mandy red dark theme.
      darkTheme: FlexColorScheme.dark(
        colors: FlexColor.schemes[FlexScheme.mandyRed].dark,
      ).toTheme,
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
```

This gives us the following counter app look:

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_counter_app.png?raw=true" alt="counter sample"/>

Perhaps not so exciting, that is because the basic counter app uses very few features and widgets, so it cannot really
illustrate the result very well. This is why the included samples contain demo UI, that is not really at all relevant
to using FlexColorScheme and is really only there to better demonstrate the result.

The default example 1, is just a repeat of the above example, but with a `themeMode` 3-way toggle 
switch, an effective theme colors widget, plus a bunch of dummy commonly used Material UI widgets. 

> **Can I use different built-in schemes for my light and dark themes?**  
> Yes this is possible, just use different enums values as keys for the light and dark FlexColorScheme factories
> when you get the predefined FlexSchemeData from the map. If the colors in used schemes are a bit related, this 
> can be used to create nice and unique light and dark combinations of the predefined schemes.
> 
> You can even apply a FlexSchemeColor that has data that was designed for a light theme to the FlexColorScheme.dark 
> factory and wise versa. The result will just not be as useful or pretty.
> The rationale for the slightly involved structure, is to keep it flexible, but at the same time provide self
> documenting API guidance on how the data was designed to be used and consumed.

### Default Sample Application

The package contains five different example applications with increasing complexity.
 
To try the simplest of them, **example 1** on a device or simulator,
clone the [repository](https://github.com/rydmike/flex_color_scheme) and run the example:

```bash
cd example/
flutter run --release
```

The result is a sample app that uses the built-in "Oh Mandy red" color scheme as its theme. Has a 
light/dark/system theme mode switch, includes a theme colors presentation widget and Material UI widget samples. 
With them you can see the active theme's colors, and the created theme's impact on common Material UI widgets.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1al.png?raw=true" alt="ColorScheme example 1 light" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1bl.png?raw=true" alt="ColorScheme example 1 lightb" width="180"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1cl.png?raw=true" alt="ColorScheme example 1 dark" width="180"/>

> **Building the examples**  
>If you cloned the repository to build the examples, you can open the package `/example` folder with your IDE to build
>the above default example. This example is the same as the example in the `/example/lib/example1` folder.
>If you want to build the other examples, without setting up different configurations in your IDE for the different 
>main files, you can copy and paste the wanted example's `main.dart` code into the `/example/lib/main.dart` file to 
> build it from your IDE. After copying the new main example content, change the relative 
> import for the "all shared imports" file to:  
>`import 'all_shared_imports.dart';`   
>and for examples 4 and 5, also the "sub page" import to:  
>`import 'shared/sub_page.dart';` 

### Live WEB Demos of the Examples

If you want to take a quick look at all the examples, you can try live web versions of them.

[**Example 1**](https://rydmike.com/flexcolorscheme1) represents the simplest use case, to just use one of the 
built-in color schemes as your application theme and toggle between its light 
and dark variant, or allow device mode setting to control if the dark or light theme is used.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1al.png?raw=true" alt="ColorScheme example 1 light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1ad.png?raw=true" alt="ColorScheme example 1 dark" width="120"/>
   
[**Example 2**](https://rydmike.com/flexcolorscheme2) is like example 1, but here we use custom colors 
to make a custom scheme and turn it into a theme.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2al.png?raw=true" alt="ColorScheme example 2 light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2ad.png?raw=true" alt="ColorScheme example 2 dark" width="120"/> 

[**In example 3**](https://rydmike.com/flexcolorscheme3) we can toggle the active theme between 3 different 
predefined color schemes, plus the custom one we made in example 2.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3al.png?raw=true" alt="ColorScheme example 3a light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3ad.png?raw=true" alt="ColorScheme example 3a dark" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bl.png?raw=true" alt="ColorScheme example 3b light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bd.png?raw=true" alt="ColorScheme example 3b dark" width="120"/>
   
[**In example 4**](https://rydmike.com/flexcolorscheme4) we can select any of the different built-in themes
and three custom ones we made.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4al.png?raw=true" alt="ColorScheme example 4a light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4bl.png?raw=true" alt="ColorScheme example 4b light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cl.png?raw=true" alt="ColorScheme example 4c light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cd.png?raw=true" alt="ColorScheme example 4c dark" width="120"/>
   
[**Example 5**](https://rydmike.com/flexcolorscheme5) is the last, and most complex one of the examples and presents
more configuration options that you can modify interactively.
This example is best seen and tested on a tablet, desktop or desktop web browser, rather than on a phone, but it
certainly works on a phone sized canvas too. This example is explained in more detail further below. 

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5al.png?raw=true" alt="ColorScheme example 5 light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5bl.png?raw=true" alt="ColorScheme example 5b light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5fl.png?raw=true" alt="ColorScheme example 5f light" width="120"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5gl.png?raw=true" alt="ColorScheme example 5g light" width="120"/>

[**Flexfold demo**](https://rydmike.com/demoflexfold)

A really fancy example of **FlexColorScheme** usage is the [**Flexfold demo app**](https://rydmike.com/demoflexfold).

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/FoldTheme1.gif?raw=true" alt="FlexColorScheme" width="650"/>  

It might look and feel complicated, but it is actually only slightly more involved than the above example nr 5, that
has almost all the same theming features and exactly the same themes as the Flexfold demo app. 
Go through the examples, and you will be ready to make cool interactively custom themed apps like this in no time.

## Tutorial

In this tutorial we go through all the bundled examples and explain the `FlexColorScheme` relevant topics. 
For simplicity the example applications do not use any advanced state management solution. The key part for each 
example is always in the used stateful `MaterialApp`, where all the scheme setup for the themes are made. The rest of 
the content in the examples is just there to make a visual presentation of the resulting theme from the used
color scheme.

### HomePage for the Examples
 
The content of the `HomePage` in all these examples is not really so relevant for using `FlexColorScheme` based
application theming. The critical parts are in the example `MaterialApp` theme definitions. The `HomePage` mostly
contains UI to visually show what the resulting themes look like when used in an application with commonly 
used widgets. In example 5 we can also make interactive changes to many `FlexColorScheme` API values to
see and learn how they work in practice.

In all the examples we pass in the `FlexSchemeData` object we used for the active theme to the application's `HomePage`. 
This is not needed in order to use `FlexColorScheme` based themes, but we use it to be able to show
the active theme name and its description in the examples. We also use its color data for the 3-way theme mode switch
`FlexThemeModeSwitch`, that uses the light and dark scheme colors in its theme toggle widget for the theme mode 
option buttons, that show the 4 main colors in the active light and dark scheme.

### Optional FlexThemeModeSwitch

One special feature on the `HomePage` of all the examples is the `FlexThemeModeSwitch`. It is the UI Widget used 
for the 3-way theme mode switch used in all the examples to change the active theme mode. 

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/theme_mode_switch.png?raw=true" alt="theme mode switch" width="350"/>

Using the switch is very simple, give it the currently selected and active theme mode, the current `FlexSchemeData` 
scheme, so it can color its buttons correctly, and use the `onThemeModeChanged` callback for changes to its mode.
Then change the `themeMode`property in the `MaterialApp` accordingly, to actually change the used theme mode.

```dart
FlexThemeModeSwitch(
  themeMode: themeMode,
  onThemeModeChanged: onThemeModeChanged,
  flexSchemeData: flexSchemeData,
),
```

Using the `FlexThemeModeSwitch` 3-way theme mode switch is optional and not required to
use `FlexColorScheme` based themes. It is just a unique theme mode switch design and was included 
as a bonus feature in the `FlexColorScheme` package. It was added based on a request after it
had been observed in the wild in the Flexfold demo app.  

In the Flexfold demo app the switch was originally a fairly fixed design. This `FlexThemeModeSwitch` has many
properties that allow you to customize it extensively. You can find its [API 
reference here](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexThemeModeSwitch-class.html)
and its companion, the `FlexThemeModeOptionButton` 
[API reference here](https://pub.dev/documentation/flex_color_scheme/latest/flex_color_scheme/FlexThemeModeOptionButton-class.html). 
With the API you can customize the look of the `FlexThemeModeSwitch`, here are some examples:

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/ThemeSwitchCustomize.png?raw=true" alt="theme mode customize"/>

The `FlexThemeModeOptionButton` is typically used by the `FlexThemeModeSwitch`, but it can also be used as a part
of other theme related indicator widgets. Like for example the scrolling horizontal list used in the Flexfold demo app.
Where it is used as a theme indicator in a list, as a way to show all available themes and select the active theme, 
just as an alternative to the rather plain popup menu.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/ThemeIndicatorList.png?raw=true" alt="theme indicator list"/>

## Example 1 Use a predefined color scheme

The first and simplest example shows how you can use a predefined color scheme in `FlexColorScheme` to
define light and dark themes using the scheme, and then switch between the light and dark mode. A theme showcase 
widget shows the theme with several common Material widgets.

This is example basically a repeat of the Flutter default counter app modification example above, but with a different 
`HomePage` and a way to change the `MaterialApp` active `themeMode` property value via the `FlexThemeModeSwitch` 
switch on the `HomePage` via an ordinary callback.

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
    // Define which predefined FlexScheme to use.
    // Go ahead and try some other ones too.
    const FlexScheme usedFlexScheme = FlexScheme.mandyRed;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',
      // A light scheme, passed to FlexColorScheme.light factory, then use  
      // toTheme to return the resulting theme to the MaterialApp theme.
      theme: FlexColorScheme.light(
        colors: FlexColor.schemes[usedFlexScheme].light,
        // Use comfortable on desktops instead of compact, devices use default.
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme,
      // We do the same thing for the dark theme, but using FlexColorScheme.dark 
      // factory and the dark FlexSchemeColor in FlexColor.schemes.
      darkTheme: FlexColorScheme.dark(
        colors: FlexColor.schemes[usedFlexScheme].dark,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme,
      // Use the above dark or light theme, based on active themeMode 
      // value light/dark/system.
      themeMode: themeMode,
      // The HomePage, with its properties. In this example we pass the
      // current themeMode, change it via its call-back. We also pass
      // the currently used FlexSchemeData to the HomePage so we can use
      // it to display some info about it.   
      home: HomePage(
        themeMode: themeMode,
        onThemeModeChanged: (ThemeMode mode) {
          setState(() { themeMode = mode; });
        },
        // Pass in the used active FlexSchemeData so we can 
        // use its properties on the HomePage.
        flexSchemeData: FlexColor.schemes[usedFlexScheme],
      ),
    );
  }
}

```

> **There is one more minor addition**  
> Example 1, and the other examples all use comfortable adaptive platform visual density via
> `FlexColorScheme.comfortablePlatformDensity`, instead of the counter app's normal
> `VisualDensity.adaptivePlatformDensity`.
> 
> This is an alternative that on desktop applications results in the Flutter
> `comfortable` visual density being used, instead of `compact`. On devices, they both result in the default large
> visual density that is good for small touch devices. This helper function was added to provide an easy option 
> for using a bit larger UI elements also on desktop and web apps, while keeping the correct size for devices. 
> This is useful if the desktop and web versions are occasionally used on computers with touch screens. 
> The `comfortable` density is a nice balance that still looks compact enough to be desktop like, while providing 
> a bit more touch friendly space without looking like an overblown device UI on a desktop.
> 
> The Flutter SDK standard `VisualDensity.adaptivePlatformDensity` can of course also be used. If you prefer it, 
> just replace the line with it.

### Building and running example 1

When you build and run **example 1** you get a sample application that looks like this in light and dark mode:

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1al.png?raw=true" alt="ColorScheme example 1 light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1ad.png?raw=true" alt="ColorScheme example 1 dark" width="250"/>

Try example 1 live on the [**web here**](https://rydmike.com/flexcolorscheme1).

In the app, scroll down to see the theme showcase further below, it presents the theme with common Material widgets.
This simple first example is not using primary color surface branding, it is just a normal theme with a few 
convenient fixes for some theme design gaps in Flutter's own themes created with `ThemeData.from` a `ColorScheme`.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1bl.png?raw=true" alt="ColorScheme example 1b light" width="250"/></nb></nb><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex1cl.png?raw=true" alt="ColorScheme example 1c light" width="250"/>

## Example 2 Create a custom color scheme

This example shows how you can define your own `FlexSchemeData` and create `FlexColorScheme` based themes from it.
A theme showcase widget shows the theme with several common Material widgets.

The full code is not shown in the tutorial, please see the code in the package folder
[flex_color_scheme/example/lib/example2](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example2/main.dart)
for the entire example.

To make a custom color scheme, we will for simplicity just define it as a constant in this example. 
We make a `FlexSchemeData` object with a name, description and scheme colors defined with
`FlexSchemeColor` for the light and matching dark scheme. In this example we use dark purple and deep green 
and matching desaturated versions for the dark scheme.

```dart
const FlexSchemeData customFlexScheme = FlexSchemeData(
  name: 'Toledo purple',
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

Then we use this `FlexSchemeData` **customFlexScheme** instance `light` and `dark` properties as scheme `colors` 
for the `FlexColorScheme.light` and `dark` factory for each theme mode and `toTheme` to get the themes they define.

This setup is totally equivalent to how we used one of the built-in predefined `FlexSchemeData` objects in example 1, 
in this case we just defined our own custom `FlexSchemeData` in `customFlexScheme`.

```dart
  :
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexColorScheme',

      theme: FlexColorScheme.light(
        colors: customFlexScheme.light,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme,
      
      darkTheme: FlexColorScheme.dark(
        colors: customFlexScheme.dark,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme,
      
      home: HomePage(
        themeMode: themeMode,
        onThemeModeChanged: (ThemeMode mode) {
          setState(() { themeMode = mode; });
        },
        // We use our custom FlexSchemeData on the HomePage too.
        flexSchemeData: customFlexScheme,
      ),
    );
  }
}
```
When you build and run **example 2** you get a sample application that looks like this in light and dark mode:

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2al.png?raw=true" alt="ColorScheme example 2 light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2ad.png?raw=true" alt="ColorScheme example 2 dark" width="250"/>

Try example 2 live on the [**web here**](https://rydmike.com/flexcolorscheme2).

Scroll down to see the theme showcase widgets further below, presenting the theme with some widgets. This example is
not using primary color surface branding, it is just a normal theme with a few convenient fixes for certain
theme properties.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2bl.png?raw=true" alt="ColorScheme example 2b light" width="250"/></nb></nb><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex2cl.png?raw=true" alt="ColorScheme example 2c light" width="250"/>

## Example 3 Switch between different color schemes

This example shows how you can use three built-in color schemes, add a custom scheme and then use all four as
selectable `FlexColorScheme` based theme options in an application. The example also uses strong branded surface 
colors. A theme showcase widget shows the theme with several common Material widgets.

The full example code is not shown here, please see the code in the package folder
[flex_color_scheme/example/lib/example3](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example3/main.dart)
for the entire example.

The **customFlexScheme** `FlexSchemeData` definition is the same as in example 2, it is not repeated below. 
In the example below, if we select the `FlexScheme.custom` option, we use our **customFlexScheme** object, otherwise 
the selected built-in scheme we selected on the HomePage is used. We also set the surface style to
`FlexSurface.strong`, for a strong primary color branded blend in surfaces and backgrounds.

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
         // When we select the custom FlexScheme on the home 
         // page, we get the custom enum value back and use the custom 
         // scheme we defined, otherwise we use the selected scheme 
         // from the the built in map.
         colors: flexScheme == FlexScheme.custom
             ? customFlexScheme.light
             : FlexColor.schemesWithCustom[flexScheme].light,
         // This surface style gives a strong blend of primary
         // color on surfaces and background colors.
         surfaceStyle: FlexSurface.strong,
         visualDensity: FlexColorScheme.comfortablePlatformDensity,
       ).toTheme,
       // Just a repeat with equivalent setup for the dark theme.
       darkTheme: FlexColorScheme.dark(
         colors: flexScheme == FlexScheme.custom
             ? customFlexScheme.dark
             : FlexColor.schemesWithCustom[flexScheme].dark,
         surfaceStyle: FlexSurface.strong,
         visualDensity: FlexColorScheme.comfortablePlatformDensity,
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

In this example on the **HomePage** we removed the option to allow the theme mode to depend on the system theme mode 
setting, by setting `showSystemMode` to `false`, thus removing this option from the switch. 

```dart
  :
  FlexThemeModeSwitch(
    themeMode: themeMode,
    onThemeModeChanged: onThemeModeChanged,
    flexSchemeData: flexSchemeData,
    showSystemMode: false,
  ),
  :
```


These are the four resulting different themes with their light and dark modes, that we can select and 
use with this example.

**Hippie blue** scheme in light and dark mode.  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3al.png?raw=true" alt="ColorScheme example 3a light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3ad.png?raw=true" alt="ColorScheme example 3a dark" width="250"/>

**Green money** scheme in light and dark mode.  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bl.png?raw=true" alt="ColorScheme example 3b light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3bd.png?raw=true" alt="ColorScheme example 3b dark" width="250"/>

**Red red wine** scheme in light and dark mode.  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3cl.png?raw=true" alt="ColorScheme example 3c light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3cd.png?raw=true" alt="ColorScheme example 3c dark" width="250"/>

**Our custom Toledo purple** scheme in light and dark mode.  
<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3dl.png?raw=true" alt="ColorScheme example 3d light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex3dd.png?raw=true" alt="ColorScheme example 3d dark" width="250"/>

Try example 3 live on the [**web here**](https://rydmike.com/flexcolorscheme3).

## Example 4 Switch between all built in color schemes and three custom ones

This example shows how you can use all the built-in color schemes, plus three custom schemes. 
How to interactively select which one of these schemes is used to define the active theme. The example also uses 
medium branded background and surface colors. A theme showcase widget shows the theme with several common Material 
widgets. A subpage is also available that shows the same theme applied when opening another page, that in Flutter
just inherits the same theme.

The full example code is not shown here, please see the code in the package folder
[flex_color_scheme/example/lib/example4](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example4/main.dart)
for the entire example.

In this example we set the surface style to `FlexSurface.medium`, for medium primary color branded surfaces.

The example is otherwise fairly straight forward. This time we use the built in `FlexColor.schemesList` to access all
the pre-defined `FlexSchemeData` objects as a plain list with the predefined scheme data. 
We unpack this list with the spread operator into a new custom `myFlexSchemes` list, and add our three custom schemes 
as `FlexSchemeData` objects to the end of this new list. We then access the list's `FlexSchemeData` objects with 
an index number, that we simply change with a popup menu on the HomePage. 
That is the general principle, let's go through it step by step.

Begin by defining the same colors that we used in example 2 and 3 for our first custom color. In this 
case we also assign the same color that we used for our `secondaryVariant` scheme color, to the optional `appBarColor`. 
This is done because the built-in schemes use their secondary variant color as their custom app bar color, it could 
of course be any color, but for consistency we will do the same for our custom `FlexSchemeColor` data objects. This
part is not actually used in this example yet, but we will re-use these custom definitions in example 5 where it is
used, so we might as well add it now to make the explanations for example 5 a bit shorter.

We mix it up a bit by first defining the light and dark `FlexSchemeColor` data objects, that we will use as
light and dark matched pairs in the `FlexSchemeData` that we are going to add to our list.

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

We can build a scheme the long way, by specifying all the required hand-picked scheme colors, like above, or we can 
also build schemes from a single primary color. With the `FlexSchemeColor.from` factory. With the factory the 
only required color is the primary color, the other colors will be computed. You can optionally also provide the 
`primaryVariant`, `secondary` and `secondaryVariant` colors with the factory as well, but any color that is not 
provided will always be computed for the full set of required colors in a `FlexSchemeColor`.

In this example we create our 2nd scheme from just a primary color for the light and dark schemes. The custom 
`appBbarColor` will in this case also receive the same color value as the one that is computed for `secondaryVariant` 
color, this is the default with the `FlexSchemeColor.from` factory if the color is not specified. The used example 
color is an olive green like color.

```dart
 final FlexSchemeColor myScheme2Light =
   FlexSchemeColor.from(primary: const Color(0xFF4C4E06));

 final FlexSchemeColor myScheme2Dark =
   FlexSchemeColor.from(primary: const Color(0xFF9D9E76));
```

For our 3rd custom scheme we will define `primary` and `secondary` colors for the light color scheme, but no 
variant colors. We will not make any dark scheme definitions at all. The primary color is "Oregon" orange, 
and the used secondary color is a complementary dark teal like color.

```dart
 final FlexSchemeColor myScheme3Light = FlexSchemeColor.from(
   primary: const Color(0xFF993200),
   secondary: const Color(0xFF1B5C62),
 );
```

Next we create a list with all the `FlexSchemeData` objects we will use as our schemes in this example, 
starting with all the built-in ones and adding our three custom ones at the end.

>A **FlexSchemeData** object stores `name` and `description` plus the matching `FlexSchemeColor` for `light` 
>and `dark` mode color schemes. As a rule of thumb, the dark scheme colors must be less saturated than its light 
>scheme colors used for a light theme. Using the same colors in a light and dark color schemes seldom produce nice
>looking or very usable dark and light theme mode pairs. You can read more in the Material Design guide about 
>selecting suitable [dark theme colors](https://www.material.io/design/color/dark-theme.html#usage).

We first unpack the predefined `FlexSchemeData` into the list `myFlexSchemes` with the spread operator, add our 
own light and dark scheme definition pairs as `FlexSchemeData` to the end. For our last custom `FlexSchemeColor` 
`myScheme3Light` that we did not make a matching dark scheme for, we instead use the `.toDark()` method on 
the light scheme, to get one automatically computed from the defined light scheme colors.

```dart
 final List<FlexSchemeData> myFlexSchemes = <FlexSchemeData>[
   // Add ALL the predefined FlexColor schemes
   ...FlexColor.schemesList,
   // Then add our first custom schemes to the FlexSchemeData list.
   const FlexSchemeData(
     name: 'Toledo purple',
     description: 'Purple theme, created from full custom defined color scheme.',
     light: myScheme1Light,
     dark: myScheme1Dark,
   ),
   // Do the same for our second custom scheme.
   FlexSchemeData(
     name: 'Olive green',
     description: 'Olive green theme, created from primary light and dark colors.',
     light: myScheme2Light,
     dark: myScheme2Dark,
   ),
   FlexSchemeData(
     name: 'Oregon orange',
     description: 'Custom orange and blue theme, from only light scheme colors.',
     light: myScheme3Light,
     // We create the dark desaturated colors from the light scheme.
     dark: myScheme3Light.toDark(),
   ),  
 ];
```

The setup of the stateful MaterialApp is just as simple as in the previous examples.

```dart
 :
 class _DemoAppState extends State<DemoApp> {
   ThemeMode themeMode;
   // Used to select which FlexSchemeData we currently use in our list.
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
       // Light theme definition. 
       theme: FlexColorScheme.light(
         // As scheme colors we use the one from our list
         // pointed to by the current themeIndex.
         colors: myFlexSchemes[themeIndex].light,
         // Medium strength surface branding used in this example.
         surfaceStyle: FlexSurface.medium,
         visualDensity: FlexColorScheme.comfortablePlatformDensity,
       ).toTheme,
       // Just a repeat with equivalent setup for the dark theme.
       darkTheme: FlexColorScheme.dark(
         colors: myFlexSchemes[themeIndex].dark,
         surfaceStyle: FlexSurface.medium,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
       ).toTheme,

       themeMode: themeMode,
       
       home: HomePage(
         themeMode: themeMode,
         onThemeModeChanged: (ThemeMode mode) {
           setState(() { themeMode = mode; });
         },
         // We pass the index of the active theme to the HomePage.
         schemeIndex: themeIndex,
         // Where we can select a new theme in a popup menu
         // and get its index back and update state.
         onSchemeChanged: (int index) {
           setState(() { themeIndex = index; });
         },
         // As FlexSchemeData is needed for info on the home
         // page, we just pass the used from out list
         // pointed to by our current themeIndex.
         flexSchemeData: myFlexSchemes[themeIndex],
       ),
     );
   }
 }
 ```

When you build **Example 4**, it starts with the **Brand blues** theme. It is based on a scheme that uses blue colors 
found in different well known web brands. The primary blue color in the light scheme might thus look very familiar.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4al.png?raw=true" alt="ColorScheme example 4a light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4bl.png?raw=true" alt="ColorScheme example 4b light" width="250"/>

You can use the popup menu available in the ListTile showing the current theme to change the active theme. You
can choose any of the built-in 24 schemes, plus the three custom color schemes we added. When you change scheme, you 
will notice that the active theme color changes are animated by interpolating from the active theme colors, 
to the new theme colors. This is a very nice standard feature when you modify the theme used by a Flutter 
Material applications.

Try some other theme, here is for example the **Mango mojito** theme.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cl.png?raw=true" alt="ColorScheme example 4c light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex4cd.png?raw=true" alt="ColorScheme example 4c dark" width="250"/>

Try example 4 live on the [**web here**](https://rydmike.com/flexcolorscheme4)

## Example 5 Full featured demo 

This example shows how you can use all the built-in color schemes in FlexColorScheme to define themes from them
and how you can define your own custom scheme colors and use them together with the predefined ones. Like the previous
example, this can give you an idea of how you can create your own complete custom list of color schemes if you do not 
want to use any of the predefined ones.

The example also shows how you can use the surface branding feature, vary its strength and how to use the custom app 
bar theme features. The usage of the true black theme feature for dark themes, is also demonstrated.
Using the optional Windows desktop like tooltip theme is also shown.

The example includes a dummy responsive side menu and rail to give a visual presentation of what applications
that have larger visible surfaces using the surface branding look like. A theme showcase widget again shows
the theme with several common Material widgets.

A subpage is also available that show that the same active theme is also applied when opening another page. 
This is because all the built-in widgets use the same inherited theme and use the colors in the theme in
predefined ways by default. This is also a good example and explanation of why you should use the same theme 
colors for your custom re-usable widgets as their default color property values. Then theme your application to 
make it look the way you want, rather than defining constants that you apply directly to widget color properties.

If you tried the previous examples on a device, and not on the Web or a built them as desktop targets, you might 
have noticed that the system navigation bar on Android devices does not always change. It is not themed to
have matching background and theme mode that matches the active application theme as it changes. This example shows 
how this can be fixed and that the used method remain in effect when opening a subpage.

The same custom color schemes as in example 4, are also used in this example. They are not explained here again, please
see [example 4](#example-4-switch-between-all-built-in-color-schemes-and-three-custom-ones) for details. 
The full example code is not shown here either, please see the code in the package folder
[flex_color_scheme/example/lib/example5](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example5/main.dart)
for the entire example's code.

In this example we will be able to toggle the used app bar theme style, the surfaces branding strength, 
tooltip style and try the true black theme toggle for dark-mode. This is done so that you can interactively try the
options and see what they do. 

You can also use the example to toggle the `tabBarStyle` to use a theme that is designed
to fit in an app bar, regardless of which style you have used for it. This is the default style for this sub theme.
Alternatively you can choose a style that makes a `TabBarTheme` that fits well on background colors. Use this 
option if you intend to use the TabBar primarily in a Scaffold body, in dialog or Drawer or other surface and 
background colored material, then you do not have re-theme it or style it for that purpose. 

We also introduce a toggle that allows us to for all the schemes use the `toDark` computed dark schemes, instead
of the hand tuned built-in ones. You can then compare the results, the `toDark` method does a pretty good job and can
even be tuned with a parameter if so desired. If you use this toggle on the last custom scheme, you will not see
any difference, because we already created its dark scheme with this method, the toggle just again computes the same
dark scheme. There is also a slider that you can use to adjust the white blend level of the `toDark` method 
from its default value of 35%, to be anything from 0...100 %, so you can experiment with it and see what it does.

Additionally, we will include a toggle that allows us to instead of using the `FlexColorScheme.toTheme` method, use 
the standard flutter `ThemeData.from` factory to create the theme from the same color scheme definitions. 
We can use this toggle to see and study the differences that `FlexColorScheme.toTheme` brings.


```dart
 :
 
 class _DemoAppState extends State<DemoApp> {
   // Used to select if we use the dark or light theme.
   ThemeMode themeMode;
    // Used to select which FlexSchemeData we use in our list of schemes.
   int themeIndex;
   // Enum used to control primary color branding on surface and background.
   FlexSurface flexSurface;
   // Enum used to select what app bar style we use.
   FlexAppBarStyle flexAppBarStyle;
   // Used to modify the themed app bar elevation.
   double appBarElevation;
   // Enum used to select what tab bar style we use.
   FlexTabBarStyle flexTabBarStyle;
   // If true, tooltip background will be light in light theme, and dark
   // in dark themes. The Flutter Material default and standard is the other
   // way, tooltip background color is inverted compared to app background.
   bool tooltipsMatchBackground;
   // Allow toggling between normal dark mode and true black dark mode.
   bool darkIsTrueBlack;
   // Allow toggling between using the actual defined dark color scheme or 
   // try how it would look if we had not defined the dark colors, but had 
   // been lazy and just created the dark scheme from the light scheme 
   // with the toDark() method.
   bool useToDarkMethod;
   // The 'level' of white blend percentage used when computing dark scheme
   // colors from the light scheme colors with the toDark method.
   int level;
   // Use the toTheme to create Themes from `FlexColorScheme`. This is
   // the preferred method when using `FlexColorScheme`. In the demo
   // you can use a toggle to see what a FlexColorScheme looks like if 
   // you the color scheme and `ThemeData.from` to instead create the theme.
   bool useToThemeMethod;
 
   @override
   void initState() {
     themeMode = ThemeMode.light;
     themeIndex = 7; // Start with deep blue see theme.
     flexSurface = FlexSurface.medium;
     flexAppBarStyle = FlexAppBarStyle.primary;
     appBarElevation = 0;
     flexTabBarStyle = FlexTabBarStyle.forAppBar;
     tooltipsMatchBackground = false;
     darkIsTrueBlack = false;
     useToDarkMethod = false;
     level = 35;
     useToThemeMethod = true;
     super.initState();
   }
```

We define the light theme for the app, using current theme index, selected surface style and app bar style. With 
the built-in 24 themes, and the three custom ones we made, we can use 27 different app themes via the setup below, 
times the five surface styles and five app bar variants.  

The factory `FlexColorScheme.light` is used to define a `FlexColorScheme` for a light theme, from the light 
FlexSchemeColor in the `myFlexSchemes` list, plus some other properties, like the surface and app bar style used in
this example, as well as the tooltip and true black setting for the dark theme.

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
             appBarElevation: appBarElevation,
             tabBarStyle: flexTabBarStyle,
             tooltipsMatchBackground: tooltipsMatchBackground,
             visualDensity: FlexColorScheme.comfortablePlatformDensity,
           ).toTheme
```

We also demonstrate how to create the same theme with the standard from color scheme ThemeData factory
`ThemeData.from`. The surface style works, but will not be applied as elegantly, but it works fairly OK up
to medium branding. The app bar style has no effect, nor the tooltip style. 

We also have to make sure we use the same typography as the one used in FlexColorScheme, otherwise the animated 
theme will show an assertion error as it cannot animate between different typography or null default 
typography in the theme data.

When toggling between the standard `ThemeData.from` and the `FlexColorScheme.toTheme` made themes from the 
same `ColorScheme` data, we can observe the differences and see some theme colors that the standard method does 
not adjust to match the used color scheme. The previously mentioned [article](https://rydmike.com/colorscheme) includes
a visual presentation of the differences.

```dart
         : ThemeData.from(
             colorScheme: FlexColorScheme.light(
               colors: myFlexSchemes[themeIndex].light,
               surfaceStyle: flexSurface,
               appBarStyle: flexAppBarStyle,
               appBarElevation: appBarElevation,
               tabBarStyle: flexTabBarStyle,
               tooltipsMatchBackground: tooltipsMatchBackground,
               visualDensity: FlexColorScheme.comfortablePlatformDensity,
             ).toScheme,
           ).copyWith(
             visualDensity: FlexColorScheme.comfortablePlatformDensity,
             typography: Typography.material2018(
               platform: defaultTargetPlatform,
             ),
           ),
```

We do the equivalent definition for the dark theme, and we add
the true black option as well. We also use the `useToDarkMethod` boolean as switch for `colors` to pass it a 
`FlexSchemeColor` that is either using the predefined ones or computes it from its light `FlexSchemeColor`.

For the `toDark` calculation we give it the level parameter that allows us to tune the dark conversion with
the slider in the UI. We also use the `defaultError` modifier. This ensures that the resulting computed 
toDark scheme will ignore any existing light scheme error color definition, and use Material default dark mode
error color as its error color. Without this modifier, toDark will also compute the error color for the 
dark scheme from the light scheme's error color. It will thus also change with the level adjustment. 
This is certainly also a usable option, but in this example we do not want this behavior. 

> The `defaultError` modifier creates a new copy of the object, where `error` color is null.
> This causes the `toDark` method to skip it and keep it as null, it then gets the default Material error via
> the `toTheme` method. For the custom `FlexSchemeColor` objects we made for example 4 and 5 we did not specify 
> any error color, so they are already `null` and get the default fixed Material error in dark mode anyway.
> However, the built-in schemes do specify their error color for both their light and dark schemes, mostly they use
> the same Material default error color, but some red colored schemes use the high contrast Material error 
> color. Because the light error color is defined, if we do not want `toDark` to compute a dark scheme error color that
> changes with the level, we can modify its value to null before `toDark` is used. 

```dart
     darkTheme: useToThemeMethod
       ? FlexColorScheme.dark(
          colors: useToDarkMethod
             ? myFlexSchemes[themeIndex].light.defaultError.toDark(level)
             : myFlexSchemes[themeIndex].dark,
           surfaceStyle: flexSurface,           
           appBarStyle: flexAppBarStyle,
           appBarElevation: appBarElevation,
           tabBarStyle: flexTabBarStyle,
           tooltipsMatchBackground: tooltipsMatchBackground,
           darkIsTrueBlack: darkIsTrueBlack,
           visualDensity: FlexColorScheme.comfortablePlatformDensity,
         ).toTheme
     
       : ThemeData.from(
           colorScheme: FlexColorScheme.dark(
             colors: useToDarkMethod
               ? myFlexSchemes[themeIndex].light.defaultError.toDark(level)
               : myFlexSchemes[themeIndex].dark,
             surfaceStyle: flexSurface,
             appBarStyle: flexAppBarStyle,
             appBarElevation: appBarElevation,
             tabBarStyle: flexTabBarStyle,
             tooltipsMatchBackground: tooltipsMatchBackground,
             darkIsTrueBlack: darkIsTrueBlack,
             visualDensity: FlexColorScheme.comfortablePlatformDensity,
           ).toScheme,
         ).copyWith(
             visualDensity: FlexColorScheme.comfortablePlatformDensity,      
             typography: Typography.material2018(
             platform: defaultTargetPlatform,
           ),
         ),
```

The rest of the additions in the stateful MaterialApp are just passing in current values and getting a new value for 
it via callbacks for all our settings and their current values.

```dart
       // themeMode value and change callback.
       themeMode: themeMode,
       home: HomePage(
         themeMode: themeMode,
         onThemeModeChanged: (ThemeMode mode) {
           setState(() { themeMode = mode; });
         },
         // Used theme index and change callback.
         schemeIndex: themeIndex,
         onSchemeChanged: (int index) {
           setState(() { themeIndex = index;});
         },
         // Used surface branding and change callback.
         themeSurface: flexSurface,
         onThemeSurfaceChanged: (FlexSurface surface) {
           setState(() { flexSurface = surface; });
         },
         // Used app bar style and change callback.
         appBarStyle: flexAppBarStyle,
         onAppBarStyleChanged: (FlexAppBarStyle style) {
           setState(() { flexAppBarStyle = style; });
         },
         // WUsed app bar elevation and change value callback.
         appBarElevation: appBarElevation,
         onAppBarElevationChanged: (double value) {
           setState(() { appBarElevation = value; });
         },
         // Used tab bar style and change callback.
         tabBarStyle: flexTabBarStyle,
         onTabBarStyleChanged: (FlexTabBarStyle style) {
           setState(() { flexTabBarStyle = style; });
         },
         // Used tooltip style and change callback.
         tooltipsMatchBackground: tooltipsMatchBackground,
         onTooltipsMatchBackgroundChanged: (bool value) {
           setState(() { tooltipsMatchBackground = value; });
         },
         // True black mode and change callback.
         darkIsTrueBlack: darkIsTrueBlack,
         onDarkIsTrueBlackChanged: (bool value) {
           setState(() { darkIsTrueBlack = value; });
         },
         // Dark scheme method and toggle method callback.
         useToDark: useToDarkMethod,
         onUseToDarkChanged: (bool value) {
           setState(() { useToDarkMethod = value; });
         },
        // Dark scheme white blend level and change callback.
         whiteBlend: level,
         onWhiteBlendChanged: (int value) {
           setState(() { level = value; });
         },
         // Theme creation method and toggle method callback.
         useToTheme: useToThemeMethod,
         onUseToThemeChanged: (bool value) {
           setState(() { useToThemeMethod = value; });
         },
         // And pass the current FlexSchemeData to the  
         // homePage so we can use some info from it.
         // We use copyWith to modify the dark scheme to 
         // the colors we get from toggling the switch 
         // for computed dark colors or the actual defined
         // dark colors.
         flexSchemeData: myFlexSchemes[themeIndex].copyWith(
           dark: useToDarkMethod
             ? myFlexSchemes[themeIndex].light.toDark()
             : myFlexSchemes[themeIndex].dark),
       ),
     );
   }
 }
```

With this example we include a side rail, it expands to a menu on desktop/web when using a larger 
canvas, it even does this in phone landscape mode. This just a dummy for demo purposes. It is here to give a better 
idea and presentation of what a surface branded theme looks like. The effect is best viewed and experienced 
on a tablet, or the with a desktop browser via the live web demo, where the surface branded 
theming effect is more obvious.

The HomePage's build method for this example starts by wrapping the entire page content in an `AnnotatedRegion` 
with a value that we get from the static helper `FlexColorScheme.themedSystemNavigationBar(context)`. This way 
we can get a system navigation bar, typically on older Android phones that still uses one, that also follows 
the active theme's background color and theme mode.

```dart
   return AnnotatedRegion<SystemUiOverlayStyle>(
     value: FlexColorScheme.themedSystemNavigationBar(context),
     child: ...
   );
```

This example starts with the **deep blue sea** scheme. In these examples we can also see the correctly 
themed system navigation bar on the Android device. 

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5al.png?raw=true" alt="ColorScheme example 5 light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5ad.png?raw=true" alt="ColorScheme example 5 dark" width="250"/>

Try example 5 live on the [**web here**](https://rydmike.com/flexcolorscheme5)

#### Computed Dark Theme

Since the example allows us to toggle the dark mode from using its hand tuned predefined dark scheme colors, to the
dark scheme colors computed from the light scheme colors. Let's compare some examples.

With the above **deep blue sea** scheme, the computed ones are a bit more dull and muted in this example. 
These screenshots are using medium surface branding, the computed dark scheme is on the right.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5ad.png?raw=true" alt="ColorScheme example 5 dark" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5ad-to-black.png?raw=true" alt="ColorScheme example 5 dark computed" width="250"/>

With some other schemes, like the **Aqua blue** one there is only a minor difference. These screenshots
are using strong surface branding, the computed dark scheme is on the right.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5a2d.png?raw=true" alt="ColorScheme example 5a2 dark" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5a2d-to-black.png?raw=true" alt="ColorScheme example 5 dark computed" width="250"/>

### Computed Dark Theme with Level Adjustment

The result of the `toDark` method varies depending on how saturated the used light scheme colors are. It is possible
to tune the calculated dark scheme by modifying the `whiteBlend` parameter it uses to blend in white to make the 
dark scheme. The default `whiteBlend` is 35%, this is normally a suitable value. For more saturated light scheme 
colors try 40%, which is also used in the Material design guide to convert the default red error color for light mode,
to dark mode. For light scheme color with low saturation, a white blend of 20...30% often also produces nice results.

With the included level slider in the example we can interactively change the `whiteBlend` level for the computed 
dark mode scheme colors. Let's select a color scheme, say the **Brand blues** one, then go dark. 
By default, the built-in predefined hand-picked matching dark scheme colors for the dark theme mode are used.

Turn on the "Compute dark theme" mode, the result is pretty close to the predefined one for this dark scheme with
the default level of 35%. Then adjust the white level blend to tune how saturated the computed dark scheme colors are
compared to their light scheme master. At 0% they are the same as the light scheme, at 100%, well then they are white,
not so useful. A range of 10...50% can produce excellent results. What is best depends on how saturated your starting
light scheme colors are, and of course what kind of matching dark theme look you like and want. If you use the even
darker dark-mode, **true black**, you may want to have a different saturation for your dark scheme colors compared to
standard dark-mode surface. You could easily implement that adjustment with this feature.

This screen recording compares the computed `toDark` theme result, to the built-in hand-picked one. 
It does this by toggling the mode a few times, so you can compare the different results. It also uses the level slider
to adjust the `toDark` theme result. A sharp eye might notice that this recording does not use the `defaultError` 
error color modifier, the changing dark error color does not look so nice when tuning the computed scheme colors.
The bundled example 5 and live web version of it uses the modifier.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_v1-1-0-phone3.gif?raw=true" alt="Dark scheme calc level"/>

### Branded Surfaces and App Bar Options

Let us now explore the effect of branded surface colors. Branded surfaces are often 
associated with dark mode, but it works well with light mode too when applied delicately. Below you can see how 
the primary color gets blended into Material surface and even stronger so, into Material background colors. 
The screenshots below are using the medium branding strength.

You can use the toggle in the example to change from standard no branded surfaces colors, to light, medium, 
strong and heavy.

The scaffold background does not receive any branding until the heavy mode. You might think that this and all 
the other theming can be done by just passing the same scheme colors to the `ThemeData.from` factory. That is why
this demo allows you to flip a switch to do just that, so you can see and observe the difference between
color scheme based themes created by `FlexColorScheme.toTheme` and `ThemeData.from`. 

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5bl.png?raw=true" alt="ColorScheme example 5b light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5cl.png?raw=true" alt="ColorScheme example 5c light" width="250"/>

Feel free to experiment with
the live web demo where the differences are even easier to observe since you can have both versions open side by
side, in a large browser windows. A ready-made example comparison can be
found [here](https://rydmike.com/colorscheme#the-difference).

Now that when we tried basic surface color branding, we can test the tricks `FlexColorScheme` can do
with the `AppBarTheme` and how you can match it to your surface branding if you like. 

You can easily toggle both dark and light mode app bar's to use differently
themed backgrounds than the normal `ColorScheme` primary colored one in light-mode, and dark background in dark-mode,
that you get when you create a theme with `ThemeData.from(colorScheme)`.

Even without using a separately defined `AppBarTheme`, **FlexColorScheme** app bars can use scheme primary color, 
the default Material plain white/dark background color, or the primary branded surface, or primary branded 
background color, as well as an extra custom app bar scheme color, as the app bar's **themed background** color.

The `FlexColorScheme` scheme's `appBarColor` is a separate scheme color that does not exist in Flutter's standard 
`ColorScheme`, so it does not have to be any of the colors available in a `ColorScheme`. 
The predefined schemes use the color defined in a `ColorScheme` scheme's `secondaryVariant` color, as their value for 
the custom `appBarColor`. When you make your own schemes you can do the same or use a totally none `ColorScheme` 
related color as the app bar's custom color option. This color then becomes one of the FlexColorScheme's easy 
selectable app bar theme color options, via the `appBarStyle` property and the `FlexAppBarStyle` enum, in this case 
via the `custom` choice.

Below you can see some different branding strengths with a background primary color branded app bar theme used.
This example compares medium versus heavy branding. The medium choice is usually well-balanced, but light can be 
subtle and nice too. If you want to make a bold statement theme, go with heavy. Please note that the visual 
impact of the branding also depends on how saturated the primary color is.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5dl.png?raw=true" alt="ColorScheme example 5d light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5el.png?raw=true" alt="ColorScheme example 5e light" width="250"/>

Here are few more images of the heavy primary color branded version, when looking at some widgets as well.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5fl.png?raw=true" alt="ColorScheme example 5f light" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5gl.png?raw=true" alt="ColorScheme example 5g light" width="250"/>

### The TabBar Style

The `tabBarStyle` property can be used to toggle the theme the tab bar receives. By default, a theme that is designed
to make it fit in an app bar, regardless of which style you have selected for it, is used. This is the 
`FlexTabBarStyle.forAppBar` style. The typical usage of a TabBar is to have it in an AppBar, and the default style
works for this use case.

Alternatively you can choose a style that makes a `TabBarTheme` that fits well on background colors. Use this
option if you only intend to use the TabBar in a Scaffold body, in Dialogs, Drawers or other surface and
background colored Material, then you do not have re-theme it or style it separately for this purpose.

If you intend to use TabBar widgets in both AppBar's and on surface and backgrounds, you will have to choose the style 
that makes most sense for your use case and theme it separately for the other case, just like you have to do 
with Flutter standard TabBar theme as well. 

Which tab bar style and resulting tab bar theme, actually works best, depends on the background color. Here we see 
tab bars used on surfaces and in an app bar, when the app bar is using the primary color. As can be seen, the tab bar 
theme that goes well in an app bar in such a case, does not fit on the surfaces at all, and wise versa.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/TabBar-on-primary.png?raw=true" alt="tab bar on primary"/>

If you plan to use only surface, background (also the branded ones) colored app bars, you can see that both tab bar 
styles, and their resulting themes work for both situations. The difference is minor, and it is a matter of opinion 
which one is preferable. Both style options can be used if you restrict your app bar color to background colors. 
In such a use case you can get away with using just one of the built-in style options, even if you use tab 
bars in both app bars and on other surfaces.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/TabBar-on-surface.png?raw=true" alt="tab bar on surface"/>


### True Black

Dark-mode is nice, but with `FlexColorScheme` you can go even darker, go **true black** with the flick of a 
switch. When using the true black option for dark-mode, surface, background and scaffold background are set to 
fully black. This can save power on OLED screens as the pixels are turned off, but it can also cause scrolling artefact 
issues when pixels turn fully on and off rapidly as you scroll. You can read about this and see an example of it in 
the [Material design guide](https://material.io/design/color/dark-theme.html#ui-application)
as well. (Scroll back up one heading from the link to get to the mention of it.) 
 
If you use branded surfaces with true black mode enabled, you will notice that the branding has a lower impact, 
only at strong and heavy levels does it have a visible effect. This is by design to keep most surfaces totally or 
very close to black when true black is combined with surface branding. If you really want complete black 
for all surfaces and backgrounds, then avoid combining true black mode with branded surfaces. On the other hand it 
still makes a darker theme than normal dark theme, which can look nice, and it eliminates the scrolling issue since
all background colored pixels are not fully off in the strong and heavy branded true black modes.

Here is an example of a branded dark theme with true black OFF (default and standard) and true black ON, 
when using heavy branding with the **Red red wine** color scheme.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5cd.png?raw=true" alt="ColorScheme example 5c dark" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5bd.png?raw=true" alt="ColorScheme example 5b dark" width="250"/>

Here is another difference example with the **Deep blue sea** scheme, when using medium strength surface branding, and
a primary colored app bar in dark-mode.

<img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5ad.png?raw=true" alt="ColorScheme example 5 dark" width="250"/><img src="https://github.com/rydmike/flex_color_scheme/blob/master/resources/fcs_phone_ex5ad-true-black.png?raw=true" alt="ColorScheme example 5 true black" width="250"/>

## Behind the Scenes

**FlexColorScheme** does not actually use the `ThemeData.from` factory with a passed 
in `ColorScheme` to make its theme. It uses the `ThemeData` factory directly with some 
custom theming. It does of course define a
`ColorScheme` that it uses for the `ThemeData`. FlexColorScheme uses color calculations for the primary color
brand blended surfaces, and for the lazy schemes that do not specify all colors in a color scheme.

### Theme Improvements

In addition to the primary color branded surfaces, full shaded schemes from just one primary color, true
black and app bar tricks. The returned `ThemeData` contains some opinionated modifications and theme
corrections compared to what you get if you would just use the standard `ThemeData.from` with a `ColorScheme`.
You can still of course override the returned theme with your own theme modifications and additions, by using
the `copyWith` method on the resulting theme data object.
  
If you want the details of what the differences compared to the standard `ThemeData.from` factory
are, here is a complete list:

  * `ScaffoldBackground` has its own color property in `FlexColorScheme`
    and can if so desired differ from the `ColorScheme.background`
    color. In the branding implementation, the `scaffoldBackground`
    typically gets no primary branding applied, only in the heavy choice
    is there a small amount. Whereas `background` in a FlexColorScheme
    receives the most color branding of the surface colors. This fits
    well for where the `background` color is used on Material in Widgets,
    but it does not go so well together with `scaffoldBackground`, which
    is the reason why it has its own color value in this implementation.
    

  * The `dialogBackgroundColor` uses the `ColorScheme.surface` color
    instead of `ColorScheme.background`. The `background` color needed
    the strongest branding when branding is used, but this did not look
    so good on dialogs, so its color choice was changed to `surface`
    instead, that gets lighter branding in FlexColorScheme when it is
    used. With standard Material surface colors the `background` and
    `surface` colors are the same, so there is no difference when using
    the default background and surface colors.
    

  * The `indicatorColor` uses color scheme `primary` instead of the
    default, which is `onSurface` in dark-mode, and `onPrimary` in
    light-mode. This is just an opinionated choice and to make the
    indicator work by default on surface colored tabs.
    

  * For `toggleableActiveColor` the `ColorScheme.secondary` color is used.
    The Flutter default just uses the default `ThemeData` colors and
    not the actual colors you define in the `ColorScheme` you create your
    theme from. Perhaps an oversight in Flutter?
    See issue [#65782](https://github.com/flutter/flutter/issues/65782).
    

  * Flutter themes created with `ThemeData.from` does not define any color
    scheme related color for the `primaryColorDark` color, this method
    does.  See issue [#65782](https://github.com/flutter/flutter/issues/65782).
    The `ThemeData.from` leaves this color at `ThemeData` factory default,
    this may not match your scheme. Widgets seldom use this color, so the
    issue is rarely seen.
    

  * Flutter themes created with `ThemeData.from` does not define any color
    scheme based color for the `primaryColorLight` color, this method does.
    See issue [#65782](https://github.com/flutter/flutter/issues/65782).
    The `ThemeData.from` leaves this color at `ThemeData` factory default
    this may not match your scheme. Widgets seldom use this color, so the
    issue is rarely seen.
    

  * Flutter themes created with `ThemeData.from` does not define any color
    scheme based color for the `secondaryHeaderColor` color, this method
    does. See issue [#65782](https://github.com/flutter/flutter/issues/65782).
    `ThemeData.from` leaves this color at `ThemeData` factory default this
    may not match your scheme. Widgets seldom use this color, so the issue
    is rarely seen.
    

  * Background color for `AppBarTheme` can use a custom colored app bar
    theme in both light and dark themes, that is not dependent on theme
    primary or surface color. This functionality needs a custom text theme
    to be possible to implement without a context. This implementation
    does however not get correctly localized typography.  
    
    A new feature implemented via
    [#71184](https://github.com/flutter/flutter/pull/71184) also enables this kind
    app bar theme and keep the correct typography localization. This new
    feature is (as of 31.12.2020) not yet available on channel stable.
    The first version on master could also not be enabled via Themes
    only, one also had to opt in on AppBar level making it difficult to
    adopt the feature. I wrote a proposal to introduce opt-in on theme
    level too, see [#72206](https://github.com/flutter/flutter/issues/72206).
    The proposal has already been implemented. When these new features land
    in stable channel, the implementation below will be changed to use
    the new AppBarTheme feature, which is better than the work-around
    since we no longer need a custom text theme.


  * The `AppBarTheme` elevation defaults to 0, an iOs style influenced
    opinionated choice. It can easily be adjusted directly in the
    `FlexColorScheme` definition with property value `appBarElevation`
    without creating a sub theme or using `copywith`.


  * The `bottomAppBarColor` uses color scheme background color to match the
    background color of the drawer, bottom navigation bar, possible side
    menu and system navigation bar on android (if theming of it is used).
    This is a slight change from the ColorScheme default that uses
    surface color.

 
  * The `BottomAppBarTheme` elevation defaults to `appBarElevation` or 0 if
    it is null, an iOs style influenced opinionated choice. It can easily
    be adjusted directly in the `FlexColorScheme` definition with property
    value `bottomAppBarElevation` without creating a sub theme or
    using `copyWith`.
    

  * A deviation from `ThemeData.from` color scheme based theme's is
    that `ThemeData.accentColor` is set to `ColorScheme.primary` and not to
    `secondary` if not otherwise defined. This is done to get an easy way
    for borders on `TextField.decoration` to use theme based primary
    color in dark-mode, and not `accentColor` color.

    There may be a bug in the way
    `InputDecorationTheme` gets used by the `InputDecorator`. We were
    unable to define a theme that would work correctly for such a setup
    without resorting to making `accentColor` equal to
    `ThemeData.primaryColor`. This definition has less of an impact
    visually to any built-in widgets than one might suspect. With the all
    the other included theme definitions we saw no other widget that used
    `accentColor`. FAB and toggles have their own theme and colors, so
    they still use the default expected `colorScheme.secondary` color
    despite this change.
    

  * The `accentColor` is made available as a separate scheme property.
    Done to enable control of the `OutlineInputBorder()` active border
    color property in color scheme based themes for dark theme-mode.
    

  * In `TextSelectionThemeData`, the standard for `selectionColor` is
    `colorScheme.primary` with opacity value `0.4` for dark-mode and `0.12`
    for light mode. Here primary with `0.5` for dark-mode and `0.3` for
    light mode is used. The standard for `selectionHandleColor` is
    `colorScheme.primary`, here we use the slightly darker shade
    `primaryColorDark` instead, which does not have a proper color
    scheme color value in Flutter standard `ColorScheme` based themes.
    

  * A predefined slightly opinionated `InputDecorationTheme` is used. It
    sets `filled` to `true` and fill color to color scheme primary color
    with opacity `0.035` in light mode and with opacity `0.06` in dark-mode.
    Another theme design change is done via modification of the
    `ThemeData.accentColor` described earlier. Since the used theme, like
    the default theme, does not define a `border` property of `TextField`,
    an app can still easily use both the default underline style, or the
    outline style by just specifying the default `OutlineInputBorder()`
    for the border property when outlined TextField is desired.
    If you don't  want the filled style, or the primary colored
    borders in dark-mode, you can override them back with `copyWith`.
    For totally different border color in dark-mode you can alternatively
    specify it via the `accentColor` property. Which should not affect
    any other color than this border color when using FlexColorScheme
    based themes.
    

  * The property `fixTextFieldOutlineLabel` is set to `true` by default,
    it looks better. The only reason why it is not the default in Flutter,
    is for default backwards legacy design compatibility.
    

  * Button theming is applied to `ThemeData.buttonColor` using color scheme
    primary color. The entire color scheme is passed to old button's
    `ButtonThemeData` and it uses `textTheme` set to
    `ButtonTextTheme.primary`, plus minor changes to padding and tap target
    size. These modifications make the old buttons almost match the
    default design and look of their corresponding newer buttons.
    Thus, the `RaisedButton` looks
    very similar to `ElevatedButton`, `OutlineButton` to `OutlinedButton`
    and `FlatButton` to `TextButton`. There are some differences in
    margins and looks, especially in dark-mode, but they are very similar.

    This is a button style we used before the introduction of
    the new buttons with their improved defaults. It just happened to be
    very close, since the theme was based on how things looked in the Material
    design guide already prior to Google releasing the new Flutter Material 
    buttons that fully implement the correct Material design.

    The newer buttons are nicer, especially when it
    comes to their interactions and all the theming options they provide,
    but they are a bit verbose to theme. If you want to make custom styled
    buttons we still recommend using the newer buttons instead of the old
    ones, as they offer more customization possibilities. Still, this
    theming applied to the old buttons make them look close enough to
    the new ones, to the extent that most might not even notice if
    you still use the old buttons.
    

  * The default theme for Chips contain a design bug that makes the
    selected `ChoiceChip` widget look disabled in dark-mode, regardless
    if was created with `ThemeData` or `ThemeData.from` factory.
    See issue [#65663](https://github.com/flutter/flutter/issues/65663).
    The `ChipThemeData` modification used here fixes the issue.
    

  * The `FloatingActionButtonThemeData` is set as follows:
    ```dart
    FloatingActionButtonThemeData(
      backgroundColor: colorScheme.secondary,
      foregroundColor: colorScheme.onSecondary),
    ```
    In order to ensure the same FAB style that was the default in ThemeData
    factory via `accentIconTheme` in the past. If it is not defined we
    get the following deprecated warning:

    ```
    Warning: The support for configuring the foreground color of 
    FloatingActionButtons using ThemeData.accentIconTheme has been 
    deprecated. Please use ThemeData.floatingActionButtonTheme instead. 
    See https://flutter.dev/go/remove-fab-accent-theme-dependency.
    This feature was deprecated after v1.13.2.
    ```

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
    the selected item. Flutter defaults to secondary color. Primary color
    is a design used on iOS by default for the bottom navigation bar. We
    agree and think it looks better as the default choice for apps.
    

  * Default `tooltipTheme` in Flutter is currently a bit flawed on desktop
    and web, because it defaults to using a very small font (10 dp).
    See issue [#71429](https://github.com/flutter/flutter/issues/71429).

    The default theming also does not handle multiline tooltips very well.
    The here used `TooltipThemeData` theme design corrects both these
    issues. It uses 12 dp font on desktop and web instead of 10 dp,
    and some padding instead of a height constraint to ensure that
    multiline tooltips look nice too.

    FlexColorScheme also includes a new boolean property
    `tooltipsMatchBackground`, that can be toggled to not used Flutter's
    Material default that has a theme mode
    inverted background. Tooltips using light background in light theme
    and dark in dark, are commonly used on the Windows desktop platform.
    You can tie the extra property to used platform to make an automatic
    platform adaptation of the tooltip style if you like, or give users
    a preference toggle the tooltip style to their liking.
    

  * The property `transparentStatusBar` is set to true by default and
    used to make to the AppBar one-toned on Android device like on iOS.
    Set it to `false` to restore default Android design.  

    > The modification is in current implementation made with an extra call
    to `SystemChrome.setSystemUIOverlayStyle` to make the
    statusBarColor transparent. The used implementation will be changed
    when the new AppBarTheme [#71184](https://github.com/flutter/flutter/pull/71184)
    lands in channel stable
    that allows us to modify its AnnotatedRegion with a passed in
    `SystemOverlayStyle`.
    > 
    > It would be nice if we could also make the system navigation button
    area on Android transparent, but it does not work if we set
    systemNavigationBarColor to a transparent color in the same call,
    it does not change it all if called during the theme definition.
    The style is doable, but requires modifying Android config files, not
    possible from Flutter only (as per current information).
    Related issue [#69999](https://github.com/flutter/flutter/issues/69999).
    >
    > FlexColorScheme offers a helper that allows us to easily create
    and annotated region for the system navigation bar that uses
    the active color scheme and theme mode to make it at least use
    a correctly colored theme colored background for the active theme.
    See [example 5](#example-5-full-featured-demo) for an explanation
    on how to use this.
