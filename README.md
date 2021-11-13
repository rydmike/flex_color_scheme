[![Pub Version](https://img.shields.io/pub/v/flex_color_scheme?label=flex_color_scheme&labelColor=333940&logo=dart)](https://pub.dev/packages/flex_color_scheme) ![GitHub Workflow Status (event)](https://img.shields.io/github/workflow/status/rydmike/flex_color_scheme/Test?event=push)
![Test](https://github.com/rydmike/flex_color_scheme/workflows/Test/badge.svg) [![codecov](https://codecov.io/gh/rydmike/flex_color_scheme/branch/master/graph/badge.svg?token=4XJU30IGO3)](https://codecov.io/gh/rydmike/flex_color_scheme) [![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

# FlexColorScheme

Use **FlexColorScheme** to make beautiful color scheme based Flutter themes, 
with optional primary color surface blends. The themes are based on the same 
concept as Flutter's ColorScheme based themes, but with many 
additional features.

[<img src="https://rydmike.com/assets_fcsv4/00-main-image.jpg?raw=true?" alt="main_image"/>](<img src="https://rydmike.com/assets_fcsv4/00-main-image.png?raw=true"/>)  
_FlexColorScheme V4 theme examples (Click for HiRes)_

When you color theme a Flutter application, all built in 
widgets use the colors of your color scheme in your theme. At least in theory, 
and it is almost so if you defined your Flutter ThemeData by using the 
`ThemeData.from` factory, but even it misses some details.
FlexColorScheme goes the extra mile to ensure that all Flutter SDK widgets gets 
themed completely by its built-in color schemes, or custom colors you provide.

You can opt in on using pre-made opinionated widget sub-themes.
By opting in, you can for example adjust the border radius on all widgets 
with a single property to set the same themed border radius on them. Current
Flutter SDK widgets are based on the Material 2 guide and use 4 dp corner 
radius as default on most corners.

When you opt in on the sub themes, the border radius on widgets default to the 
new rounded corners as specified by the 
[Material 3 guide](https://m3.material.io/), where the 
rounding varies by widget type. You can stick with this, or set global 
radius to a value you prefer. You can also easily set the themed border
radius per widget, to override the global value in just a few cases. Use 
simple property values per widget, no need for verbose custom sub theme 
Shape definitions.

# Contents
- [What is new in version4?](#what-is-new-in-version-4)
  - [New Color Schemes](#new-color-schemes)
- [Quick Start Guide](#quick-start-guide)
  - [Default example - Hot Reload Playground](#default-example---hot-reload-playground)
  - [Themes Playground](#themes-playground)
  - [Installing and Using](#installing-and-using)
- [Theming Introduction](#theming-introduction)
  - [Flutter ThemeData](#flutter-themedata)
  - [Color Blended Surfaces](#color-blended-surfaces)
  - [Custom Color Schemes](#custom-color-schemes)
  - [What About Custom Sub Themes?](#what-about-custom-sub-themes)
  - [Built-in Color Schemes](#built-in-color-schemes)
    - [Color Scheme Designs](#color-scheme-designs)
    - [If I don't Use the Predefined Schemes, Why Should I Use FlexColorScheme?](#if-i-dont-use-the-predefined-schemes-why-should-i-use-flexcolorscheme)
    - [Design Your Custom Schemes for FlexColorScheme](#design-your-custom-schemes-for-flexcolorscheme)
    - [Can We Change this Predefined Scheme's Colors?](#can-we-change-this-predefined-schemes-colors)
    - [Can We Add This Scheme?](#can-we-add-this-scheme)
    - [Live WEB Demos of the Examples](#live-web-demos-of-the-examples)
- [Tutorial](#tutorial)
  - [Example 1 - Basic Theme Usage](#example-1---basic-theme-usage)
  - [Example 2 - Custom Theme](#example-2---custom-theme)
  - [Example 3 - Four Themes](#example-3---four-themes)
  - [Example 4 - All Themes](#example-4---all-themes)
  - [Example 5 - Themes Playground](#example-5---themes-playground)
- [Scheme Reference](#scheme-reference)
- [Feature Details (external link)](https://github.com/rydmike/flex_color_scheme/blob/master/FEATURES.md)
- [Inside FlexColorScheme (external link)](https://github.com/rydmike/flex_color_scheme/blob/master/INSIDE.md)

# What is new in version 4?

For a detailed list of what is new in version 4, please refer to the 
[change log](https://pub.dev/packages/flex_color_scheme/changelog).

There are two major new new features. The first one is that FlexColorScheme 
now comes with opinionated widget sub themes that you can opt in on. 
By default, the sub theme mimic Material 3 (You) styled widgets. This is done
as far as reasonably possible when using standard Material 2 theming features
available in Flutter 2.5. There is a Material 3 TextTheme as well, and by 
default this text theme is also slightly tinted using the selected color 
scheme's primary color. You can turn these styles on and off, based on your
your own preferences when you opt in on the sub themes.

The second main new feature is that FlexColorScheme now offers 9 different surface
color blend modes, with 40 different blend levels each. Version 3 only had one
blend style with 5 levels, including no blend.
The version 3 blend style and its API is still available. Despite the major 
version bump, all APIs from version 3 are fully compatible with version 4. 
The version was mostly bumped because it contains so many new features 
that it made sense.

> ### Looking for version 3 docs with working image links?
> #### You can find it [here](https://github.com/rydmike/flex_color_scheme/blob/master/README-V3.md).

### New Color Schemes

There are of course new built-in color schemes. Four of them seems to
be the standard for new releases. The new color schemes are:

* **Blue whale** - Blue whale, jungle green and outrageous tango orange
* **San Juan** - San Juan blue and pink salmon theme
* **Rosewood** - Rosewood red, with horses neck and driftwood theme
* **Blumine** - Blumine, easter blue and saffron mango theme

[<img src="https://rydmike.com/assets_fcsv4/04-news-themes-gang.jpg?raw=true" alt="new_themes"/>](<img src="https://rydmike.com/assets_fcsv4/04-news-themes-gang.png?raw=true" />)  
_FlexColorScheme new V4 themes (Click for HiRes)_

Total number of offered built-in color schemes is now 36 matched light
and dark pairs. By using the swap primary and secondary colors, you can double
the amount of variations with just a boolean toggle. Not all the color
schemes are so attractive when you swap the colors, but some were designed to
support it and look well with the colors reversed too. You can for example use
this to present the dark mode with primary and secondary colors swapped
compared to the light mode.

# Quick Start Guide

The quickest way to try FlexColorScheme V4 is to build the
default example application and use it as a hot reload playground to get to
know it.

## Default example - Hot Reload Playground

To try the default **example** on a device or simulator,
clone the [repository](https://github.com/rydmike/flex_color_scheme) and
run the example:

```bash
cd example/
flutter run --release
```

The result is a demo app that uses a custom defined color scheme. 
It has a theme mode switch, includes theme colors presentation 
and Material widget samples. With these you can see the active color scheme's 
colors and the created theme's impact on common Material UI widgets.

The default sample app, the "Hot Reload Playground", looks like this:

[<img src="https://rydmike.com/assets_fcsv4/00_playground_default.jpg?raw=true" alt="playground_default"/>](
<img src="https://rydmike.com/assets_fcsv4/00_playground_default.png?raw=true"/>)   
_Hot Reload Playground the Default Example App (Click for HiRes)_ 

It comes fully loaded with template settings and thorough 
comments that explain what to change to produce different results. You
could for example change the `_useScheme` to `true`, as shown below and hot 
reload it, to use and the new `FlexScheme.blueWhale` theme.

```dart
// To use a pre-defined color scheme, don't assign any FlexSchemeColor to
// `colors`, instead pick a FlexScheme and assign it to the `scheme`.
// Try eg the new "Blue Whale" color scheme.
const FlexScheme _scheme = FlexScheme.blueWhale;

// To make it easy to toggle between using the above custom colors, or the
// selected predefined scheme in this example, set _useScheme to true to use the
// selected predefined scheme above, change to false to use the custom colors.
const bool _useScheme = true;
```

There are a large amount of other settings you can play with in the default
example application. The above selected **blue whale** theme is the first one
shown in the image below. 

[<img src="https://rydmike.com/assets_fcsv4/01_playground_options.jpg?raw=true" alt="options"/>](
<img src="https://rydmike.com/assets_fcsv4/01_playground_options.png?raw=true" alt="options"/>)   
_Hot Reload Playground (Click for HiRes)_

The other results shown above were also produced by editing a few 
properties in this hot reload playground.

In the hot reload playground the side menu has no real functionality, it is 
mainly there to present more surface area using the theme colorscheme background
color. The theme toggle in the menu does work though.

## Themes Playground

The side menu in the default example is actually made for and used
in the last step and example in the tutorial. The final example, number 5, 
doubles as a complete interactive **Themes Playground** application. There the
menu options actually have their indicated functionality. 

The **Themes Playground** is useful as a tool to find themes and settings you 
prefer, or just use it to figure out everything you can do with 
FlexColorScheme. The playground persists all its settings, and you can also
reset them all back to their default values.

The **Themes Playground** can be used as a [web app 
here](https://rydmike.com/flexcolorschemeV4Tut5/#/). Its source code
is also available in the example sub folder in folder 
[/example5](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example5).

It is recommended to go through the tutorial further below to get introduced to
all features step by step. However, feel free to go straight for example 5 if
your really like to dive into the deep end. It is a bit more advanced example
than those generally bundled with packages, but not that complicated.

The **Themes Playground** is best experienced at as high resolution as possible,
even 4k. It is responsive and works splendidly down to phone sizes too. It 
is however easier to see and experience what each configuration option in 
FlexColorScheme does, when you use a large screen with high resolution, then 
you can see the result of all settings at one glance.

[<img src="https://rydmike.com/assets_fcsv4/05-web-demo-4k.jpg?raw=true" alt="playground-4k"/>](
<img src="https://rydmike.com/assets_fcsv4/05-web-demo-4k.png?raw=true"/>)  
_FlexColorScheme **Themes Playground** app at 4k resolution (Click for HiRes)_

## Installing and Using

In the `pubspec.yaml` of your **Flutter** project, add the following dependency:

```yaml
dependencies:
  flex_color_scheme: ^4.0.0-dev.2
```

In your library file add the following import:

```dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
```

You can now start using `FlexColorScheme` V4 based color schemes and theming 
in your application. A quick way to do so is to try one of the 36 built-in 
color schemes. The schemes have enums that you can use to refer to them. 

Please see the default example for a thorough, quick guide on how to use
**all** the properties in FlexColorScheme. To try it on your own from scratch,
create a default Flutter counter app. Add the FlexColorScheme import and modify 
one line of code and add two lines as shown below.

Here we use the  **"Oh Mandy red"** color scheme that is represented by `enum` 
value `FlexScheme.mandyRed`. We set the `MaterialApp.themeMode` to 
`ThemeMode.system`, so that the device can control if the app uses its light 
or dark theme mode, based on the device theme system setting, you can toggle
theme mode by changing theme mode on the device.

Assign `FlexThemeData.light` to the app's `theme`, which is the application's 
light theme definition property, and `FlexThemeData.dark` to `darkTheme`.
For both `FlexThemeData` dark and light we set the `scheme` property to 
`FlexScheme.mandyRed` to use the "Oh Mandy red" predefined scheme colors and 
get matching light and dark themes based on the scheme's color definitions.

The three line modified `MaterialApp` of the Flutter default counter app 
becomes:

```dart
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // The Mandy red, light theme.
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
```

> **New in version 4:**  
> The `FlexThemeData.light` and `FlexThemeData.dark` APIs are new in 
> version 4. They are extensions on `ThemeData` that create 
> `FlexColorScheme.light` and `FlexColorScheme.dark` objects and call their
> `toTheme` methods in one step. The new syntax is shorter and also look very
> similar to `ThemeData.light` and `ThemeData.dark` factories. 
> 
> The old APIs work as before and will not be deprecated, they implement
> the functionality and are also needed in more advanced theming use 
> cases. They can for example be useful and preferred when you add your own 
> custom widget sub-themes to FlexColorScheme themes. With FlexColorScheme
> you can extract the color scheme it will use for its ThemeData. You 
> often need the colors in this scheme when you create widget sub-themes.

The above additions gives us the following look on the familiar counter app:

<img src="https://rydmike.com/assets_fcsv4/fcs_counter_app.png?raw=true" alt="counter sample"  width="500"/>

Not as exciting as the images above. That is because the basic counter app uses 
very few features and widgets, so it cannot really illustrate the result very 
well. This is why the included examples contain demo UI, that is not really at 
all relevant to using FlexColorScheme and only there to better show the results.

# Theming Introduction

When you make themed Flutter applications, you base the colors of your 
application on a light theme mode suitable `ColorScheme` and a dark theme mode 
`ColorScheme`. Then create your light and dark `ThemeData` using these color 
schemes, by assigning the `ColorScheme` for each mode to the `colorScheme` 
property in `ThemeData`. In your `MaterialApp` you assign the `ThemeData` for
your light, and dark theme respectively to the `theme` 
and `darkTheme` properties in the `MaterialApp`. 

This gives you an application that uses the defined color schemes on all the 
Flutter SDK built-in Material UI widgets. Well, on most of them anyway. 
Flutter's `ThemeData.from` a `ColorScheme` has a few gaps. The used color scheme
is not consistently applied on all standard Material UI Widgets. To get it
right you also have to assign the colors from your `ColorScheme` to a number
of color properties that still only exist in `ThemeData`. 

## Flutter ThemeData

At its core, FlexColorScheme creates a ThemeData object, it helps you make a 
color scheme based, consistent and a more refined Flutter ThemeData object. 

The Flutter ThemeData object is a very large data 
and behaviour controlling class. It can change the look and feel of Flutter
applications completely. It is not really that difficult to use, but it has many
quirks and oddities, especially when it comes to color schemes. This is mostly
due to legacy design and things that were not considered early on. Things were
done differently first, later things changed, but those earlier ways are 
still supported to not break past behavior, together with some newer ways to 
define and setup colors. It is all further complicated since under the hood
many Flutter SDK widgets still use the original color properties from ThemeData. 

This can all be very confusing and frustrating, and also if not used properly,
result in themes with color schemes that are not entirely consistent or logical
across all standard SDK widgets in your application.

One of the fundamental things FlexColorScheme does, is that it fixes these minor
inconsistencies and gaps that exist with Flutter's `ThemeData.from` factory
and handles the complexity of using the `ThemeData` factory directly. It 
releases you from the burden of knowing what colors in it affects which widgets. 

FlexColorScheme makes a few opinionated, but subtle theme modifications compared
to the `ThemeData.from` themes created from a `ColorScheme`. By default,
FlexColorScheme theming refrains from touching theme properties not related 
to making the colors more consistent. Some minor adjustments were however 
needed. These differences are covered in detail in the external
[inside FlexColorScheme (external link)](https://github.com/rydmike/flex_color_scheme/blob/master/INSIDE.md).

There is a Flutter development plan to deprecate most, if not all, the direct 
color properties in the `ThemeData` class, and only use `ColorSceheme` based 
colors that are in the ThemeData `colorScheme` property, as default colors on
SDK UI widgets. This design 
[document](https://flutter.dev/go/material-theme-system-updates)
describes the plan and reasoning. There is also deprecation check list
[issue 91772](https://github.com/flutter/flutter/issues/91772) to mirror the 
plan. For FlexColorScheme the progress of these actions are monitored closely.
Needed changes and updates in FlexColorScheme will be implemented when any 
related changes in ThemeData reach the Flutter stable channel.

## Color Blended Surfaces

The Material 2 Guide briefly mentions
[color branded and blended surfaces](https://material.io/design/color/dark-theme.html#properties). 
In the new version of Material Design called [Material You and know also known as
Material 3](https://m3.material.io/), color branded and blended, and 
just colored surfaces are used extensively. It is done in more flexible ways 
than what can be done with theming alone in current version of Flutter. We look 
forward to seeing these features soon in Flutter too. 

With **FlexColorScheme** you can already now with current version (2.5) of 
Flutter SDK easily create fancy looking primary color branded and alpha blended 
themes. These themes work natively with the Material 2 design based themes and 
all UI widgets in current version of Flutter.

The themes are created by using different blend modes and blend level strengths,
for blending in primary color into surface and background colors. This can bring
different and new nuances to your application themes. Below an example of the 
same theme, but using different blend modes and levels. The effect can be kept  
very subtle or made very bold and impactful.

The first light and dark image pair show the theme using blend level 0. 
At level 0 there are no alpha blends in any surfaces, so all modes look the 
same. The next six image use the same blend level strength 18, but show 6 
different blend modes. Next, one of the modes is repeated, but at blend 
level 33. Last the theme that was used to generate all these 
different nuances of the same color scheme based theme is shown.

[<img src="https://rydmike.com/assets_fcsv4/06-blend-examples.jpg?raw=true" alt="blend examples"/>](
<img src="https://rydmike.com/assets_fcsv4/06-blend-examples.png?raw=true" alt="blend examples"/>)   
_FlexColorScheme using same theme, but with
different blend modes and levels (Click for HiRes)_

There are 9 different blend modes at 40 different levels each, that you can
choose from to tune your themes to your liking. You don't have to use the 
same mode or level for your light and dark theme mode, the included examples 
only does so to keep the examples simpler.

The above images were made with the "Themes Playground" (example 5) app running
as a phone app, instead of using the 
[web demo](https://rydmike.com/flexcolorschemeV4Tut5/#/).
The application source is included as the last example in the pub.dev bundled 
examples and on 
[GitHub](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example5).
The **Themes Playground** is an interesting and useful tool when you want to 
find fitting themes, blend modes and levels to use for your application's 
FlexColorScheme based theme.

## Custom Color Schemes

A `FlexColorScheme` can like Flutter's standard `ColorScheme` be created by 
specifying all the required color scheme colors. However, with `FlexColorScheme` 
you can also specify only the primary color and get all other colors needed 
for a complete color scheme computed based the given primary color.

There is a helper class `FlexSchemeColor`, with a factory called 
`FlexSchemeColor.from` that can create complete color schemes from 
incomplete color scheme data. Additionally, its `toDark` method can create a 
computed matching dark scheme from a defined light scheme. This works regardless
of if you created a fully specified custom light scheme, or one from just a 
single or a few more colors.

These features are useful when you quickly want to test a single color, or maybe 
only a primary and secondary color for a light theme, and get all other scheme 
colors computed. When you figured out the colors you want, you can use exactly
tuned color definitions and make your custom color schemes from const values
instead. Using different ways to create custom color schemes is presented in 
detail in the tutorial examples 2, 3 and 4.

## What About Custom Sub Themes?

When you make a theme with `FlexThemeData.light` or `dark`, it returns a 
`ThemeData` object that you can use like any other `ThemeData` object. 
You can then use this returned `ThemeData` and add 
additional custom sub theming to it with `ThemeData`'s normal `copyWith` method, 
before passing it on to your application's `theme` or `darkTheme` properties.

If you need color values that FlexColorScheme has created, maybe some auto 
calculated main colors, but more typically the blended surface and on surface 
colors, for your sub themes, you can get them too. For this advanced use case, 
it is recommended to use FlexColorScheme with the factory constructor 
`FlexColorScheme.light` and `FlexColorScheme.light`, create 
these objects first. Then get the `ColorScheme` they define with its `toScheme` 
method, and use this `ColorScheme` data as input to your sub theme creation. 
When you make sub themes you often need access to the colors their main
`ThemeData` is using and storing in its `colorScheme` property. This step
gives you that before even creating the ThemeData object from your 
FlexColorScheme object.

Pass the `ColorScheme` you got from `toScheme` or just one or some of its 
colors, along to your methods that define your sub theme data. Turn your
FlexColorScheme to `ThemeData` with its `toTheme` method, and then add your sub 
themes with `copyWith` to this object in the same go. They now use the
same `ColorScheme` colors, that the ThemeData created with `toTheme` will get 
as as well.

You can of course also create the FlexColorScheme `ThemeData` with the 
extensions `FlexThemeData.light` and `dark`, and get the `ColorScheme` 
object from the ThemeData `colorScheme` property you get. Then use that color 
scheme to create your sub-themes that need access to those color values.
Finally, use `copyWith` to create a new `ThemeData` with your custom sub themes 
included. This is however one extra step and additional ThemeData object
compared to the approach.

## Built-in Color Schemes

Color schemes are no fun without some built-in example schemes to use and play 
with. **FlexColorScheme** comes bundled with **36** ready to go matching light
and dark color schemes. You you can use them in your applications if you like.
Here is a composite image showing them all.

>TODO: Update this image

<img src="https://rydmike.com/assets_fcsv4/fcs_all_schemes_32_at_100.png?raw=true" alt="ColorScheme all"/>_All available color schemes (click 
for hires version)_

In the [**scheme reference**](#scheme-reference) you can find a table listing 
all the built-in color schemes, their `FlexScheme` enum values, names and 
descriptions. Plus a thumbnail of each color scheme, with a link to a 
high-resolution image of it.

Another convenient and recommended way to see and try all the predefined color 
schemes is by using the Web versions of the package 
[example 4 "All Themes"](https://rydmike.com/flexcolorschemeV4Tut4) and of course
[example 5 "Themes Playground"](https://rydmike.com/flexcolorschemeV4Tut5). 
Using these examples you can try all the built-in color schemes and see the 
impact they have on often used Flutter UI widgets. 

### Color Scheme Designs

The built-in color schemes are all tuned matching light and dark scheme pairs.
Most of them are pretty conservative, but some are intentionally a bit more 
playful and bold. The first two color schemes are actually the Flutter and 
Material 2 Design Guide examples of light and dark color schemes, and the Flutter
high contrast light and dark color versions as well. So OK, there are actually
"only" 34 new and different from standard Flutter ready-made light and dark
color scheme pairs. The color scheme "Amber blue" is also a high-contrast theme.
An alternative to the built-in Material high contrast theme.

The built-in schemes do not claim to be a "this selection" fits all needs 
collection. Nor do they claim to be more correct than any other color scheme. 
What fits your needs and looks good to you, is the right choice for your 
application and use case.

You can make your own custom scheme totally from scratch, or use these as 
a starting point and inspiration. You can copy colors from existing schemes, 
even via their const `FlexColor` name. All the color values in the color schemes
are available as const values too, so you can easily make new custom 
combinations using existing color schemes and add a few custom ones to the mix.

### Design Your Custom Schemes for FlexColorScheme

The package examples show how you can easily make and use your own custom 
color schemes with FlexColorScheme. Maybe the built-in examples will inspire 
your creative side to define your own schemes. The tutorial walks you through 
how to define your own color schemes and make themes based on them.

You can create your own custom list of schemes, then use this list with 
only your own custom color schemes selection. You may also append some, or 
even all the built-in schemes after your custom schemes, and give your
users a lot of theme options. How to do this is demonstrated in the tutorial
in examples 4 and 5.

While building, testing and using this package over a period of time, a number 
of color schemes were born as a side product. I decided to include them in 
FlexColorscheme and offer them for re-use and inspiration as they are. It is 
however not necessary to use them to reap the benefits of FlexColorScheme.

The color and scheme definitions for the built-in color schemes are in their 
own class. They will not be included in the release compiled version of your 
application if you do not use (reference) them in your application, and instead 
only use your own custom color schemes for the themes.

### If I don't Use the Predefined Schemes, Why Should I Use FlexColorScheme?

The purposes with the FlexColorScheme package is to: 

* Fixes some odd things in Flutter's standard ThemeData definitions and make 
  all SDK Widgets, old, new and even deprecated ones, use the specified color
  scheme in the expected way.
* Enable easy switching among multiple color schemes in an app. 
* Provide an easy way to make themes with primary color branded and blended 
  backgrounds and surfaces. Be able to to easily vary the blend level and mode
  for different surfaces. 
* Provide a quick toggle for different AppBar styles, without the need to 
  manually make a custom theme for it every time, including matching TabBar. 
* Provide optional support for a true black mode for dark themes.
* Quickly swap the primary and secondary color definitions, if you 
  want to try your theme the other way around.
* Theme the Android System navigation bar to match your app theme, and make it 
  partially or totally transparent.
* With default settings FlexColorScheme avoids touching the Widget sub-theme
  definitions, but in a few cases it is needed to fix things and to make some
  minor design changes. In the default produced ThemeData there are as few
  as possible of them, leaving the task of Widget sub theming to you. 
  However, you can also opt in on widget sub themes to get a more refined and 
  opinionated look on widgets and used text theme. The defaults for
  the new opt in sub themes are inspired by the new 
  [Material 3 guide](https://m3.material.io/). Following it when it can easily
  be accomplished by using the Material 2 based theming in Flutter. Full 
  support for Material 3 widgets and themes is coming to Flutter too.
* FlexColorScheme also provides a way to make "lazy" quick toned `ColorScheme` 
  like themes from just a single light scheme color. Even its dark scheme
  counterpart can be made from this single color definition. 

If you like the above features, then FlexColorScheme may fit your theming 
requirements, even if you do not use any of its built-in color schemes. 

### Can We Change this Predefined Scheme's Colors?

No, current predefined schemes will not be changed. Changing them would be a 
breaking change to the package version promise. The scheme colors could in theory 
be changed by releasing a new major version that break past scheme color 
definitions. At the moment, there are no plans to ever add breaking releases 
to just change a predefined scheme's color(s). All current color definition 
values are also included in the package tests, and a failed color value test is 
considered a breaking change.

### Can We Add This Scheme?

To keep things interesting, there will from time to time be new color schemes 
added to package. If you have a beautiful color scheme with matching light and 
dark theme mode colors, that you think would be perfect to include, then please 
post a suggestion as a GitHub issue. 

No promise is made about its eventual inclusion, but if it is a nice, 
unique and overall a pretty color scheme, it will likely be included.
Coming up with nice color schemes is trickier than it seems, 
suggestions and contributions to new ones are welcome.

### Can I use different built-in color schemes for my light and dark themes?

Yes this is possible. Use different `FlexScheme` enum values for the light 
and dark `FlexThemeData.light` and `FlexThemeData.dark` factories' `scheme` 
property. If the colors used by the selected schemes are a bit related, this
can be used to create nice and unique light and dark combinations of 
the predefined schemes.

By using the `colors` property you could even apply a `FlexSchemeColor` that 
has data that was designed for a light theme to the `FlexThemeData.dark` factory,
and wise versa. For example, using the `FlexThemeData.dark` factory, you could
to its `colors` property assign the `FlexSchemeColors` from  
`FlexColor.schemes[FlexScheme.mandyRed].light` that are designed and intended 
to be used with the light mode factory.

The results will typically not be very useful or pretty. The rationale for 
the slightly involved data structure, is to keep it flexible, but at the same
time provide self documenting API guidance on how the data was designed to be 
used and consumed. 

The `scheme` property prevents using the light scheme colors for the dark 
factory and wise versa. It can however be done if so desired by using the
`colors` property as shown above. The `colors` property is always needed and
used when you make custom color schemes with the `FlexThemeData.light` and 
`FlexThemeData.dark` factories.

### Sample Applications

FlexColorScheme comes bundled with six different examples. Earlier we already
saw how you can build the default example, and use it as a 
"Hot Reload Playground". You can use it to experiment and learn on your own a
bout FlexColorSchemes features and how to use them. 

The default example is a template that is heavily commented to guide
you and encourage you to play around with different options in code, then use 
Flutter's hot reload feature and see the results at once.

The other 5 examples are a part of a tutorial path, with increasing complexity, 
that we will walk through in the tutorial. It ends with the complete 
**Themes Playground** demo app included as example 5.

**Building the Examples**
 
You can build the examples by using preconfigured build config files for
VS-Code and Android Studio/IntelliJ. Clone the package repo and open the
project in VS-Code or Android Studio/IntelliJ.

In Android Studio you can use: 

>TODO: Add to repo and info on how to use it, screenshot example.


In VS-Code you can use:

>TODO: Add to repo and info on how to use it, screenshot example.



### Live WEB Demos of the Examples

If you want to take a quick look at all the examples, you can try live web 
versions of them.

[**Example 1**](https://rydmike.com/flexcolorschemeV4Tut1) represents the simplest 
use case. To use one of the built-in color schemes as your application theme. 
You can toggle between its light and dark variant, or allow device system theme 
mode setting to control if the dark or light theme is used.

[<img src="https://rydmike.com/assets_fcsv4/21-example-1-a-small.jpg?raw=true" alt="ColorScheme example 1"/>](<img src="https://rydmike.com/assets_fcsv4/21-example-1-a.png?raw=true" alt="ColorScheme example 1" />)   
_Example 1) Using a built-in FlexColorScheme color scheme as application 
theme. (Click for HiRes)_

[**Example 2**](https://rydmike.com/flexcolorschemeV4Tut2) is like example 1, 
but we use custom colors to make a custom color scheme and turn it into a theme.
The architecture is also more advanced, it uses the approach introduced with 
Flutter skeleton template, using a theme service and theme controller, 
keeping settings only in memory using the in memory `ThemeServiceMem`.

[<img src="https://rydmike.com/assets_fcsv4/22-example-2-a-small.jpg?raw=true" alt="ColorScheme example 2" />](<img src="https://rydmike.com/assets_fcsv4/22-example-2-a.png?raw=true" alt="ColorScheme example 2" />)   
_Example 2) Using custom colors with FlexColorScheme color scheme as
application theme. (Click for HiRes)_

[**In example 3**](https://rydmike.com/flexcolorschemeV4Tut3) we can toggle the 
active theme between 3 different predefined color schemes, plus the custom one 
we defined in example 2. We can opt in and out of using the new sub theming. 
The settings are now also persisted to the device, using a theme service 
called `ThemeServiceHive` to persist the settings with package 
[Hive](https://pub.dev/packages/hive).

[<img src="https://rydmike.com/assets_fcsv4/23-example-3-a-small.jpg?raw=true" alt="ColorScheme example 3" />](<img src="https://rydmike.com/assets_fcsv4/23-example-3-a.png?raw=true" alt="ColorScheme example 3" />)  
_Example 3) Using three built-in schemes, plus a custom color scheme 
as application theme options. (Click for HiRes)_

[**In example 4**](https://rydmike.com/flexcolorschemeV4Tut4) we can select any 
of the different built-in color schemes plus three custom ones, and 
use them as the application theme. As in example 3, we persist the theme 
settings.

[<img src="https://rydmike.com/assets_fcsv4/24-example-4-a-small.jpg?raw=true" alt="ColorScheme example 4" />](<img src="https://rydmike.com/assets_fcsv4/24-example-4-a.png?raw=true" alt="ColorScheme example 4" />)   
_Example 4) Using custom schemes, plus all the built-in ones as application 
theme options. (Click for HiRes)_

[**Example 5**](https://rydmike.com/flexcolorschemeV4Tut5) is the last, and most 
complex of the examples. It presents all configuration and 
settings available in FlexColorScheme. You can modify them interactively
and the application changes theme as you modify any setting.

All the settings are persisted locally, but in this case with another theme
service, called `ThemeServicePrefs`. This service uses the package 
[SharedPreferences](https://pub.dev/packages/shared_preferences) to persist 
the theme settings, instead of Hive. The settings can also be reset back to 
its default values.

This example is best seen and tested on a tablet, desktop or desktop web browser, 
rather than on a phone. The app certainly works well on a phone sized canvas 
too, it is using a very responsive design. It is just difficult to get a nice 
overview of all the settings possibilities and their impact on different, 
widgets while changing the settings on the phone UI, since you cannot see 
everything at the same time.

[<img src="https://rydmike.com/assets_fcsv4/25-example-5-a-small.jpg?raw=true" alt="ColorScheme example 5" />](<img src="https://rydmike.com/assets_fcsv4/25-example-5-a.png?raw=true" alt="ColorScheme example 4" />)   
_Example 5) The Themes Playground. (Click for HiRes)_


[**Flexfold demo**](https://rydmike.com/demoflexfold)

Another classic example of **FlexColorScheme** usage can be seen in the Flutter 
web [**Flexfold demo app**](https://rydmike.com/demoflexfold).

<img src="https://rydmike.com/assets/FoldTheme1.gif?raw=true" alt="FlexColorScheme"/>

_Flexfold Demo uses FlexColorScheme for its themes._

The live version of the Flexfold demo is still using FlexColorScheme version 3. 
So example 5 above, the "Themes Playground" actually now has even more theming 
features than the Flexfold demo does.

The FlexFold demo has it beat in one case. You can use 
the Flexfold demo to make custom themes with colors selected interactively 
with [FlexColorPicker](https://pub.dev/packages/flex_color_picker) and watch 
the theme update and animate as you change and modify selected color properties
in the theme. 

In a later update to Example 5, this might be added to it as well. Adding color
picking and the capability to get a code snippet that produces the currently 
defined theme, be it one using a standard scheme and used settings or even 
one using custom colors, would make example 5 a very handy theme definition 
companion app for setting up FlexColorScheme based themes.


# Tutorial

In this tutorial we go through all the bundled examples and explain the 
used `FlexColorScheme` features in each example.

The key part for each example is always in the used `MaterialApp`, where all the 
FlexColorScheme setup for the themes are made. The rest of the content in the 
examples is just there to make a visual presentation of the resulting theme from 
the used color scheme, and to allow users to control the theme settings.

## Example 1 - Basic Theme Usage

The first and simplest example shows how you can use a predefined color scheme
in `FlexColorScheme` to define light and dark themes using the selected scheme.
How to turn it into a theme used by your application, and then switch between 
its light and dark mode themes. A theme showcase widget shows the theme's effect
on several common Material UI widgets.

> The full code is not shown below, only highlights.
> Please find the complete example code
> [here](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example1).

 ```dart
void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Used to select if we use the dark or light theme, start with system mode.
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    // Select the predefined FlexScheme color scheme to use. Modify the
    // used FlexScheme enum value below to try other pre-made color schemes.
    const FlexScheme usedScheme = FlexScheme.mandyRed;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      title: 'Basic Theme Usage',
      // Use a predefined FlexThemeData.light() theme for the light theme.
      theme: FlexThemeData.light(
        scheme: usedScheme,
        // Use very subtly themed app bar elevation in light mode.
        appBarElevation: 0.5,
      ),
      // Same definition for the dark theme, but using FlexThemeData.dark().
      darkTheme: FlexThemeData.dark(
        scheme: usedScheme,
        // Use stronger themed app bar elevation in dark mode.
        appBarElevation: 2,
      ),
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
      home: HomePage(
        // We pass it the current theme mode.
        themeMode: themeMode,
        // On the home page we can toggle theme mode between light and dark.
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
        // Pass in the FlexSchemeData we used for the active theme. 
        flexSchemeData: FlexColor.schemes[usedScheme]!,
      ),
    );
  }
}
```

To the `HomePage` we pass in the current value of the `themeMode` and use a 
callback to get back its changed value, we use it to update 
`themeMode` in a standard `setState` to make the app rebuild using
the new value.

We also pass in the `FlexSchemeData` we defined for our custom theme to the
`HomePage`. Not really needed, but we use it there to show the active theme's 
name, description and colors in the theme mode switch.

When you build and run **example 1** you get an application that looks 
like this in light and dark mode:

[<img src="https://rydmike.com/assets_fcsv4/21-example-1-a-small.jpg?raw=true" alt="ColorScheme example 1 light"/>](<img src="https://rydmike.com/assets_fcsv4/21-example-1-a.png?raw=true" />)
[<img src="https://rydmike.com/assets_fcsv4/21-example-1-b-small.jpg?raw=true" alt="ColorScheme example 1 dark"/>](<img src="https://rydmike.com/assets_fcsv4/21-example-1-b.png?raw=true" />)   
_Example 1) Using a built-in FlexColorScheme color scheme as application
theme. (Click for HiRes)_

Scroll down in the app to see the theme showcase further below. It presents the
theme with common Material UI widgets. You can try this example as a Flutter
[web app here](https://rydmike.com/flexcolorschemeV4Tut1).

## Example 2 - Custom Theme

This example shows how you can define your own color schemes using
`FlexSchemeColor` and `FlexSchemeData`, to create `FlexColorScheme` based 
application themes from them.

> The full code is not shown below, only highlights. 
> Please find the complete example code
> [here](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example2).


In this example, and the ones after it, we use a `ThemeService` and
`ThemeController` to manage our theme settings. This follows the example
architecture you get when you create a Flutter template application
architecture with:

```bash
 > flutter create -t skeleton my_flutter_app
```

This example uses a theme service with only memory storage and no persistence. 
In later examples we use locally persisting theme services. In this example we 
use the theme controller to change the theme mode and to toggle opting in and 
out of FlexColorScheme's opinionated sub-themes.

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This used theme service.
  final ThemeService themeService = ThemeServiceMem();
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeController that uses the ThemeService. 
  final ThemeController themeController = ThemeController(themeService);
  // Load all the preferred theme settings, while the app is loading, before 
  // MaterialApp is created. This prevents a sudden theme change when the app 
  // is first displayed.
  await themeController.loadAll();
  // Run the app and pass in the ThemeController. The app listens to the
  // ThemeController for changes.
  runApp(DemoApp(themeController: themeController));
}
```

To make a custom color scheme, we for simplicity define it as a local 
constant in this example. We make a `FlexSchemeData` object with a name, 
description and `FlexSchemeColor` scheme colors defined for the light and 
matching dark scheme. 

```dart
const FlexSchemeData _myFlexScheme = FlexSchemeData(
  name: 'Midnight blue',
  description: 'Midnight blue theme, custom definition of all colors',
  light: FlexSchemeColor(
    primary: Color(0xFF00296B),
    primaryVariant: Color(0xFF2F5C91),
    secondary: Color(0xFFFF7B00),
    secondaryVariant: Color(0xFFFDB100),
  ),
  dark: FlexSchemeColor(
    primary: Color(0xFF6B8BC3),
    primaryVariant: Color(0xFF4874AA),
    secondary: Color(0xffff7155),
    secondaryVariant: Color(0xFFF1CB9D),
  ),
);
```

We could also have stored the light and dark scheme only in their own 
`FlexSchemeColor` objects, and added them directly in their respective
`colors` property in `FlexThemeData.light` and `FlexThemeData.dark`. 
However, we will also use this information on the `HomePage` for the 
theme switch widget and to display the scheme name and description. 
Putting them in a `FlexSchemeData` object that bundles the light and 
dark scheme color `FlexSchemeColor`, plus a name and description, is a 
convenient way to pass it along and re-use the information on the home page.

We use the `FlexSchemeData` instance `_myFlexScheme` instance `light` and `dark` 
properties, as `colors` value for our `FlexThemeData.light` and 
`FlexThemeData.dark`, that we then assign to the `MaterialApp` light theme 
property `theme` and `darkTheme` property respectively.

The setup is similar to how we used one of the built-in predefined
`FlexSchemeData` objects in example 1 via its enum selection property, 
but in this case we defined our own custom `FlexSchemeData` in `_myFlexScheme`
and used the `colors` property in `FlexSchemeData` to tell it to use those 
colors instead of a built-in scheme.

We glue the `ThemeController` to the MaterialApp. The Flutter standard 
`AnimatedBuilder` Widget listens to the `ThemeController` for changes.
The Flutter `AnimatedBuilder` is a bit oddly named for this use case. Here 
it serves the purpose of functioning as a "ChangeNotifierBuilder", 
that rebuilds its child when its `Listenable`, the `animation` changes.
Which it does whenever our `ThemeController` calls `notifyListeners`.
Which we do in the `ThemeController` class when we have new updated data
that requires the theme to update.

This results in that whenever you update any theme settings managed by
the `ThemeController`, the `MaterialApp` is rebuilt with the new setting
becoming effective. It rebuilds the entire app UI when any value in 
the `ThemeController` trigger a change via a `notifyListeners` call. 
This is fine though, since all property changes in it are of the 
nature that the entire App UI needs to be redrawn, so this approach 
works well for this use case.

```dart
class DemoApp extends StatelessWidget {
  const DemoApp({Key? key, required this.themeController}) : super(key: key);
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppScrollBehavior(),
          title: 'Custom Theme',
          // Define FlexThemeData.light() theme using above custom colors.
          theme: FlexThemeData.light(
            colors: _myFlexScheme.light,
            // Opt in/out on FlexColorScheme sub-themes with theme controller.
            useSubThemes: themeController.useSubThemes,
            // Use  very low elevation light theme mode. On light colored
            // AppBars this show up as a nice thin underline effect.
            appBarElevation: 0.5,
            // Here we want the large default visual density on all platforms.
            visualDensity: VisualDensity.standard,
            // Use a custom font, Noto Sans in this case.
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          // Same setup for the dark theme, but using FlexThemeData.dark().
          darkTheme: FlexThemeData.dark(
            colors: _myFlexScheme.dark,
            useSubThemes: themeController.useSubThemes,
            appBarElevation: 1,
            visualDensity: VisualDensity.standard,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          // Use the dark or light theme, based on theme controller setting.
          themeMode: themeController.themeMode,
          home: HomePage(
            flexSchemeData: _myFlexScheme,
            // Pass in the theme controller to the home page.
            controller: themeController,
          ),
        );
      });
  }
}
```

As shown above, you can add a font via just a `fontFamily` from GoogleFonts.
For better and more fine controlled results, prefer defining complete 
`TextThemes,` using a font and its different styles, you can then even use
more than one font for your text theme. Then assign the `TextTheme` to 
the `textTheme` and `primaryTextTheme` properties in FlexThemeData. 
This is how you would use do it with standard `ThemeData` too.

The `themeController` is also passed in to the `HomePage` where we use it in UI
widgets to change the theme mode, and to opt in and out of using the sub themes
feature in FlexColorScheme.

When you build and run **example 2** you get a sample application that looks 
like this in light and dark mode:
[<img src="https://rydmike.com/assets_fcsv4/22-example-2-a-small.jpg?raw=true" alt="ColorScheme example 2 light" />](<img src="https://rydmike.com/assets_fcsv4/22-example-2-a.png?raw=true" />)
[<img src="https://rydmike.com/assets_fcsv4/22-example-2-b-small.jpg?raw=true" alt="ColorScheme example 2 dark" />](<img src="https://rydmike.com/assets_fcsv4/22-example-2-b.png?raw=true" />)   
_Example 2) Using custom colors with FlexColorScheme color scheme as
application theme. (Click for HiRes)_

Scroll down in the app to see the theme showcase further below. It presents the
theme with common Material UI widgets. You can try this example as a Flutter
[web app here](https://rydmike.com/flexcolorschemeV4Tut2).


## Example 3 - Four Themes

This example shows how you can use three built-in color schemes, add a custom 
scheme and then use all four as selectable `FlexColorScheme` based theme 
options in an application. The example also uses surface colors with 
primary color blended in.

> The full code is not shown below, only highlights.
> Please find the complete example code
> [here](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example3).


The `main` start function of the app is very similar to example 2, but in this
case we use another `ThemeService` implementation, the `ThemeServiceHive`
version, that will locally persist the theme selection options we make.

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // The ThemeServiceHive constructor requires a box name.
  // The box name is just a file name for the file that stores the settings.
  final ThemeService themeService = ThemeServiceHive('flex_scheme_box_3');
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeController that uses the ThemeService.
  final ThemeController themeController = ThemeController(themeService);
  // Load all the preferred theme settings.
  await themeController.loadAll();
  // Run the app and pass in the ThemeController. The app listens to the
  // ThemeController for changes.
  runApp(DemoApp(themeController: themeController));
}
```

The `_myFlexScheme` custom color definition is the same as in example 2.

We also set the surface mode to 
`FlexSurfaceMode.levelSurfacesLowScaffold` and `blendLevel` to 20. This
gives us the same mid-level primary color alpha blend on in theme colorscheme
background and surface, while scaffold has a much lower color blends.

In dark mode we decided to use the inverted blend surface mode to this,
`highScaffoldLowSurfaces`, where surface and background colors have lower 
primary color alpha blend, in relation the Scaffold background color.

 ```dart
 class DemoApp extends StatelessWidget {
  const DemoApp({Key? key, required this.themeController}) : super(key: key);
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppScrollBehavior(),
          title: 'Four Themes',
          theme: FlexThemeData.light(
            colors: themeController.usedScheme == FlexScheme.custom
                    ? _myFlexScheme.light
                    : FlexColor.schemes[themeController.usedScheme]!.light,
            // We use a surface color mode where all Material surfaces use
            // the same primary color branding, but scaffold background
            // uses much less.
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            // We set the blend level strength to 20.
            blendLevel: 20,
            appBarElevation: 0.5,
            useSubThemes: themeController.useSubThemes,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          // We do the exact same definition for the dark theme.
          darkTheme: FlexThemeData.dark(
            colors: themeController.usedScheme == FlexScheme.custom
                    ? _myFlexScheme.dark
                    : FlexColor.schemes[themeController.usedScheme]!.dark,
            // We don't have to use the same surface mode in dark mode, for an
            // interesting effect here we use a mode where scaffold background
            // color gets a much higher blend value than surface and background.
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            // You don't have to use same blend level or mode in light
            // and dark mode, here we use a lower value in dark mode, that
            // goes better together with the highScaffoldLowSurfaces mode.
            blendLevel: 15,
            appBarElevation: 1,
            useSubThemes: themeController.useSubThemes,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          themeMode: themeController.themeMode,
          // This simple example app has only one page.
          home: HomePage(
            // Pass in the FlexSchemeData we use for the active theme.
            flexSchemeData: themeController.usedScheme == FlexScheme.custom
                    ? _myFlexScheme
                    : FlexColor.schemes[themeController.usedScheme]!,
            // Pass in the theme controller to the home page.
            controller: themeController,
          ),
        );
      },
    );
  }
}
 ```

We select used theme for the app by using the theme controller's 
`usedScheme` property, that contains the value of currently selected 
`FlexScheme` enum. If it is the `custom` value, we use our custom scheme 
`myFlexScheme` colors. If it is any other value, we get the corresponding 
colors from the `FlexColor.schemes` map, using the enum value as key.

On the `HomePage` we have a Flutter SDK `ToggleButtons` UI widget, that
allows us the select 4 different `FlexScheme` enum values, it changes the 
`themeController` accordingly. In this case the used enum values we can use are
`hippieBlue`, `mallardGreen`, `outerSpace` and the `custom` option.
You can find the simple `ToggleButtons` based enum value selector
[here](https://github.com/rydmike/flex_color_scheme/blob/master/example/lib/shared/widgets/app/theme_select_buttons.dart).

The `themeController` is also used to decide if we opt in or out on using
the new sub theming via `useSubThemes`. A simple on/off switch on the `HomePage` 
allows us to toggle its state between true and false, thus turning on or off
the usage of new FlexColorScheme sub themes feature.

Below are the four resulting themes with their light and dark modes, that we 
can select and use in this example.

[<img src="https://rydmike.com/assets_fcsv4/23-example-3-a-small.jpg?raw=true" alt="ColorScheme example 3 light" />](<img src="https://rydmike.com/assets_fcsv4/23-example-3-a.png?raw=true" />)
[<img src="https://rydmike.com/assets_fcsv4/23-example-3-b-small.jpg?raw=true" alt="ColorScheme example 3 dark" />](<img src="https://rydmike.com/assets_fcsv4/23-example-3-b.png?raw=true" />)  
_Example 3) Using three built-in schemes, plus a custom color scheme
as application theme options. (Click for HiRes)_

Scroll down in the app to see the theme showcase further below. It presents the
theme with common Material UI widgets. You can try this example as a Flutter
[web app here](https://rydmike.com/flexcolorschemeV4Tut3).

## Example 4 - All Themes

This example shows how you can use all the built-in color schemes, plus three 
custom color schemes. How to select which one of these schemes is used to 
define the active theme. 

The example also uses primary color blending on background and 
surface colors. A subpage is available that shows the same theme applied when 
opening another page, that in Flutter just inherits the same theme.

> The full code is not shown below, only highlights.
> Please find the complete example code
> [here](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example4).

The `main` start function of the app is identical to example 3, we thus
continue to persist the theme settings with `ThemeServiceHive`, we only
put the data in another file.

```dart
// The ThemeServiceHive constructor requires a box name, the others do not.
// The box name is just a file name for the file that stores the settings.
final ThemeService themeService = ThemeServiceHive('flex_scheme_box_4');
```

Instead of having having our final and const color and scheme definitions 
values in the main file, we moved them into a static class called `AppColor`.


There we begin by defining the same colors that we used in example 2 and 3 
to be our first custom color. In this case we also assign a custom color 
to the optional `appBarColor`.

```dart
// Create a custom flex scheme color for a light theme.
static const FlexSchemeColor _myScheme1Light = FlexSchemeColor(
  primary: Color(0xFF00296B),
  primaryVariant: Color(0xFF2F5C91),
  secondary: Color(0xFFFF7B00),
  secondaryVariant: Color(0xFFFDB100),
  // The built in schemes use their secondary variant color as their
  // custom app bar color, but it can be any color. We use a custom color
  // here. We will see this in example 5 when using the theme and selecting
  // the custom app bar style.
  appBarColor: Color(0xFFf95738),
);
// Create a corresponding custom flex scheme color for a dark theme.
static const FlexSchemeColor _myScheme1Dark = FlexSchemeColor(
  primary: Color(0xFF6B8BC3),
  primaryVariant: Color(0xFF4874AA),
  secondary: Color(0xffff7155),
  secondaryVariant: Color(0xFFF1CB9D),
  appBarColor: Color(0xFF892807),
);
```

You can build a scheme the long way, by specifying all the required 
scheme colors, like above, or you can also build schemes from a
single primary color. With the `FlexSchemeColor.from` factory. When doing so
the only required color is the primary color, the other colors will be
computed. You can optionally also provide the `primaryVariant`, `secondary` and
`secondaryVariant` colors with the factory, but any color that is not provided
will always be computed to get all the required colors in `FlexSchemeColor`.

In this example we create our 2nd scheme from just a primary color for the 
light and dark schemes. The custom `appBarColor` does in this case also receive
the same color value as the one that is computed for `secondaryVariant`
color. This is its default with the `FlexSchemeColor.from` factory if the 
color is not specified.

```dart
 // Vivid green colors.
static final FlexSchemeColor _myScheme2Light =
FlexSchemeColor.from(primary: const Color(0xFF055C34));
static final FlexSchemeColor _myScheme2Dark =
FlexSchemeColor.from(primary: const Color(0xFF629F80));
```

For our 3rd custom color scheme we will define primary and secondary colors, 
but no variant colors, we will not make any dark scheme definitions either, all
these missing colors will be computed, the missing color definitions will
get computed by the factory `FlexSchemeColor.from` when it creates the
`FlexSchemeColor` object. To make our dark colors for this light scheme, we
use the method `toDark` further below with the `_myScheme3Light` instance.


```dart
  // Blue and red colors, for a classic blue and red theme.
 final FlexSchemeColor myScheme3Light = FlexSchemeColor.from(
  primary: const Color(0xFF04368E),
  secondary: const Color(0xFFA00505),
 );
```

Next we create a list `AppData.schemes`, with all the color schemes we will use. 
Starting with our three custom color schemes. Normally when we make custom 
schemes, those are probably the ones we want to use primarily, so we put them 
first in our preferred order. After our custom schemes, we add all the 
pre-defined built-in ones, offering them as options users can switch to 
and use if they like.

> A **FlexSchemeData** object stores `name` and `description` plus the 
> matching `FlexSchemeColor` for `light` and `dark` mode color schemes. 

```dart
static final List<FlexSchemeData> schemes = <FlexSchemeData>[
  // We add our custom light and dark FlexSchemeColor schemes we defined
  // to a list of FlexSchemeData, where we can bundle each light and dark
  // theme that goes together and give it a name and description too.
  const FlexSchemeData(
    name: 'C1: Midnight',
    description: 'Midnight blue theme, created by using custom color values '
            'for all colors in the scheme',
    // FlexSchemeData holds separate defined color schemes for light and
    // matching dark theme colors. Dark theme colors typically need to be less
    // saturated versions of their than light counter parts. Using the same
    // colors in light and dark theme modes does not work so well.
    light: _myScheme1Light,
    dark: _myScheme1Dark,
  ),
  // Do the same for our second custom scheme.
  FlexSchemeData(
    name: 'C2: Greens',
    description: 'Vivid green theme, created from one primary color in light '
            'mode and another primary for dark mode',
    light: _myScheme2Light,
    dark: _myScheme2Dark,
  ),
  // We also do the same for our 3rd custom scheme, BUT we create its matching
  // dark colors, from the light FlexSchemeColor with the toDark method.
  FlexSchemeData(
    name: 'C3: Red & Blue',
    description: 'Classic read and blue, created from only light theme mode '
            'primary and secondary colors',
    light: _myScheme3Light,
    // We create the dark desaturated colors from the light scheme.
    dark: _myScheme3Light.toDark(),
  ),
  // Unpack all built-in FlexColor schemes using spread operator into our list.
  ...FlexColor.schemesList,
];
```

The setup of the `MaterialApp` is as simple as in the previous example and
almost identical, we just use few other choices for `surfaceMode` and its
`blendLevel`. We also use values for the choice of `visualDensity` and 
`fontFamily` from a static `AppData` class.

```dart
class DemoApp extends StatelessWidget {
  const DemoApp({Key? key, required this.themeController}) : super(key: key);
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    // Whenever the user updates theme settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppScrollBehavior(),
          title: 'All Themes',
          // Define the light theme for the app, using current scheme index.
          theme: FlexThemeData.light(
            // We moved the definition of the list of color schemes to use into
            // a separate static class and list. We use the theme controller
            // to change the index of used color scheme from the list.
            colors: AppColor.schemes[themeController.schemeIndex].light,
            // Here we use another surface blend mode, where the scaffold
            // background gets a strong blend. This type is commonly used
            // on web/desktop when you wrap content on the scaffold in a
            // card that has a lighter background.
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            // Our content is not all wrapped in cards in this demo, so
            // we keep the blend level fairly low for good contrast.
            blendLevel: 5,
            appBarElevation: 0.5,
            useSubThemes: themeController.useSubThemes,
            // In this example we use the values for visual density and font
            // from a single static source, so we can change it easily there.
            visualDensity: AppData.visualDensity,
            fontFamily: AppData.font,
          ),
          // We do the exact same definition for the dark theme, but using
          // FlexThemeData.dark() and the dark FlexSchemeColors in our
          // AppColor.schemes list instead.
          darkTheme: FlexThemeData.dark(
            colors: AppColor.schemes[themeController.schemeIndex].dark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            // We go with a slightly stronger blend in dark mode. It is worth
            // noticing, that in light mode, the alpha value used for the blends
            // is the blend level value, but in dark mode it is 2x this value.
            // Visually they match fairly well, but it depends on how saturated
            // your dark mode primary color is.
            blendLevel: 7,
            appBarElevation: 0.5,
            useSubThemes: themeController.useSubThemes,
            visualDensity: AppData.visualDensity,
            fontFamily: AppData.font,
          ),
          // Use the dark or light theme based on controller setting.
          themeMode: themeController.themeMode,
          // Here we only pass the theme controller to the HomePage.
          home: HomePage(controller: themeController),
        );
      },
    );
  }
}
 ```

The to select which of the 39 themes we use, becomes as simple as
giving the `themeController.schemeIndex` te index value of the color scheme
we want to use. We do that with a simple popup menu button the `HemoPage`.
This yet another Flutter SDK standard UI widget, you can find how it is set up
for this use case
[here](https://github.com/rydmike/flex_color_scheme/blob/master/example/lib/shared/widgets/app/theme_popup_menu.dart).

In the app you can then use the popup menu available in the ListTile showing the 
current theme to change the active theme. You can choose any of the built-in 36 
schemes, plus the three custom color schemes we added. When you change scheme, 
you will notice that the active theme color changes are animated by interpolating
from the active theme colors, to the new theme colors. This is a very nice 
standard feature when you modify the theme used by a Flutter
Material applications.

When you build **Example 4**, it starts with the **Bue whale** theme.

[<img src="https://rydmike.com/assets_fcsv4/24-example-4-a-small.jpg?raw=true" alt="ColorScheme example 4 light" />](<img src="https://rydmike.com/assets_fcsv4/24-example-4-a.png?raw=true" />)
[<img src="https://rydmike.com/assets_fcsv4/24-example-4-b-small.jpg?raw=true" alt="ColorScheme example 4 dark" />](<img src="https://rydmike.com/assets_fcsv4/24-example-4-b.png?raw=true" />)   
_Example 4) Using custom schemes, plus all the built-in ones as application
theme options. (Click for HiRes)_

Scroll down in the app to see the theme showcase further below. It presents the
theme with common Material UI widgets. You can try this example as a Flutter
[web app here](https://rydmike.com/flexcolorschemeV4Tut4).

## Example 5 - Themes Playground

This example shows how you can use all the built-in color schemes in 
FlexColorScheme to define themes from them. How you can set up your own 
custom scheme colors, and use them together with the predefined ones. Like the 
previous example, this can give you an idea of how you can create your own 
complete custom list of color schemes if you do not want to use the predefined 
ones.

This example also shows how you can use and vary the surface blend modes, change
the blend strength. You see how the quick custom AppBar theme and its companion 
TabBar theme works. The usage of the true black feature for dark 
themes is also demonstrated. Using the optional Windows desktop like tooltip
theme is also shown.

The example includes a responsive side menu, it gives a visual 
presentation of what applications that have larger visible surfaces using 
surface blends look like. The menu has working click commands that allows you to
show and hide the contents of the cards holding settings and results. On 
smaller media this makes it quicker to find interesting parts. There is a choice
that allows you the reset the persisted settings back to their default values.
To make a light/dark mode quick toggle always accessible when you test options
and themes, it is also available on the side menu as a toggle.

In addition to allowing you to opt in and out of using the sub themes, this demo
also allows you to control many sub theming options, like adjusting the border
radius on all widgets to some other preferred value. To use the Material 3 (M3)
text theme, different theme options on TextField, among many other sub theming 
features.

A subpage is also available that show that the same active theme is also 
applied when opening another page. This works because all built-in widgets use 
the same inherited theme and use the colors in the theme in predefined ways 
by default. This is a good example and explanation of why you should use 
the same theme colors for your custom re-usable widgets as their default color
property values. Then theme your application to make it look the way you want
it to look, rather than defining constant color values that you apply 
directly to widget color properties.

If you tried the previous examples on a device, you might have noticed that 
the system navigation bar on Android devices does not always change. It is 
not themed to have matching background or theme mode that matches the active
application theme as it changes. This example shows how it can be fixed and 
that the used method remain in effect when opening a subpage.

The same custom color schemes as in example 4, are also used in this example. 
They are not explained here again, please
see [example 4](#example-4---all-themes) for details.

The `main` start function of the app is very similar to previous example, but 
in this case we use another `ThemeService` implementation, the 
`ThemeServicePrefs` version. It will also locally persist the theme selection 
and all settings selections we make.

The `ThemeServicePrefs` persistence is based on the popular package
[SharedPreferences](https://pub.dev/packages/shared_preferences).

Since the examples are all built using same "example" app, if we then 
use SharedPreferences in more than one of the apps they would use the same 
storage container and share the settings when you
build them locally. By using Hive for most examples, we can change
the storage container name for each example. In these demos the
SharedPreferences service is only used for example 5, but you can swap in
the Hive based one here as well if you want to try it.

This also demonstrates how to swap used persistence implementation.

> The full code is not shown below, only highlights.
> Please find the complete example code
> [here](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example5).


```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Here we use Shared Preferences. 
  final ThemeService themeService = ThemeServicePrefs();
  // To swap to Hive use this instead:
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeController that uses the ThemeService.
  final ThemeController themeController = ThemeController(themeService);
  // Load all the preferred theme settings
  await themeController.loadAll();
  // Run the app and pass in the ThemeController. The app listens to the
  // ThemeController for changes.
  // The ThemeController controls all the myriad of Theme settings used
  // in the demo application and also persists settings with injected
  // ThemeService.
  runApp(DemoApp(themeController: themeController));
}
```

This example has a toggle that allows you to for all the schemes use `toDark`
computed dark schemes, instead of the hand tuned built-in ones. You can then
compare this result to hand-made dark themes. The `toDark` method does a 
pretty good job and can even be tuned with a level property. 

If you use the `toDark` method on the last custom scheme, you will not see
any difference, because we already created its dark scheme in this 
example with this method. Turning the toggle on for it, computes the same dark
scheme from the same light scheme colors again. There is a slider that 
you can use to adjust the white blend level of the `toDark` method. 
From its default value of 35%, to be anything from 0...100 %, you can experiment 
with it and see what it does.

Additionally, this example includes a toggle that allows you to instead of 
using the `FlexColorScheme.toTheme` method, use the standard Flutter
`ThemeData.from` factory to create the theme from the same color scheme 
definition. We can use this toggle to see and study the differences 
that `FlexThemeData` brings to the standard with different settings.

The code for the `MaterialApp` for this complex looking application is actually
very similar and even identical regarding its core principle to example 4.
It is just a large number of `ThemeController` values that we assign
to properties in `FlexThemeData.light` and `FlexThemeData.dark`. Plus many more
UI widgets used to set new values to the controller. The `ThemeService`
persists all the values as we change them, same way as before too. The theme 
controller notifies its listeners about the change, still using the same setup 
same one as before in our `MaterialApp` since example 2. The app then just
rebuilds the UI to reflect our new theme settings.

It gets repetitive and rather long to show the details here. It is easier to 
read `main` and `MaterialApp` StatelessWidget code [here](https://github.com/rydmike/flex_color_scheme/blob/master/example/lib/example5/main.dart).
It is well commented and explains all its parts well. You can certainly
examine the `HomePage`, I recommend doing that with and IDE though.
It is beyond the scope of this tutorial to explain all its details,
but mostly it is just simple UI layout code and dealing with some issues
not related to FlexColorScheme.

The concludes the walk through of example 5. When we build it, 
the example starts with the **blue whale** color scheme. 

[<img src="https://rydmike.com/assets_fcsv4/25-example-5-a-small.jpg?raw=true" alt="ColorScheme example 5 light" />](<img src="https://rydmike.com/assets_fcsv4/25-example-5-a.png?raw=true" />)
[<img src="https://rydmike.com/assets_fcsv4/25-example-5-b-small.jpg?raw=true" alt="ColorScheme example 5 dark" />](<img src="https://rydmike.com/assets_fcsv4/25-example-5-b.png?raw=true" />)   
_Example 5) The Themes Playground (Click for HiRes)_

You can try the **FlexColorScheme Themes Playground** example as a Flutter
[web app here](https://rydmike.com/flexcolorschemeV4Tut5).

# Scheme Reference

This table lists all current built-in schemes and provides a link to a 
high-resolution example phone image of each one.

| FlexScheme   | Name                   | Description | Light___| Dark___|
| ----         | ----                   | ----        | ----  | ---- |
| material     | Material default       | Default Material color theme, used in the design guide. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb01.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme001.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb01.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme001.png?raw=true) |
| materialHc   | Material high contrast | High contrast Material design guide theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb02.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme002.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb02.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme002.png?raw=true) |
| blue         | Blue delight           | Blue color theme, based on Material blue and light blue colors. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb03.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme003.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb03.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme003.png?raw=true) |
| indigo       | Indigo nights          | Indigo color theme, based on Material indigo and deep purple colors. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb04.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme004.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb04.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme004.png?raw=true) |
| hippieBlue   | Hippie blue            | Hippie blue with surfie green and chock coral pink theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb05.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme005.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb05.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme005.png?raw=true) |
| aquaBlue     | Aqua blue              | Aqua tropical ocean blue theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb06.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme006.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb06.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme006.png?raw=true) |
| brandBlue    | Brand blues            | A mixture of blue colors from well known web brands. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb07.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme007.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb07.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme007.png?raw=true) |
| deepBlue     | Deep blue sea          | Dark deep blue sea color theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb08.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme008.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb08.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme008.png?raw=true) |
| sakura       | Pink sakura            | Pink color theme, based on sakura cherry blossom like colors. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb09.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme009.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb09.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme009.png?raw=true) |
| mandyRed     | Oh Mandy red           | Mandy red and Viking blue colored theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb10.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme010.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb10.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme010.png?raw=true) |
| red          | Red tornado            | Red color theme, based on Material red and pink colors. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb11.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme011.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb11.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme011.png?raw=true) |
| redWine      | Red red wine           | Red color theme, based on red wine like colors. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb12.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme012.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb12.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme012.png?raw=true) |
| purpleBrown  | Purple brown           | Purple brown tinted aubergine and eggplant colored theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb13.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme013.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb13.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme013.png?raw=true) |
| green        | Green forest           | Green color theme, based on Material green and cyan colors. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb14.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme014.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb14.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme014.png?raw=true) |
| money        | Green money            | Green money and finance style color theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb15.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme015.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb15.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme015.png?raw=true) |
| jungle       | Green jungle           | Green jungle and rain forest color theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb16.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme016.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb16.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme016.png?raw=true) |
| greyLaw      | Grey law               | Material blue grey and ultra dark purple color theme. Colors suitable for law firms.  | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb17.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme017.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb17.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme017.png?raw=true) |
| wasabi       | Willow and wasabi      | Wild Willow and wasabi green with orchid purple inspired colors. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb18.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme018.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb18.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme018.png?raw=true) |
| gold         | Gold sunset            | Gold sunset color theme, based on orange like colors. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb19.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme019.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb19.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme019.png?raw=true) |
| mango        | Mango mojito           | Orange and green Mango mojito color theme.  | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb20.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme020.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb20.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme020.png?raw=true) |
| amber        | Amber blue             | Amber blaze and blue color theme, based on Material amber and blue accent colors, a high-contrast theme. An alternative to the default Material high contrast theme.| [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb21.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme021.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb21.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme021.png?raw=true)|
| vesuviusBurn | Vesuvius burned        | Vesuvius burned orange and eden green theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb22.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme022.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb22.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme022.png?raw=true) |
| deepPurple   | Deep purple            | Deep purple daisy bush theme, based on Material deepPurple and lightBlueAccent colors. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb23.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme023.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb23.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme023.png?raw=true)|
| ebonyClay    | Ebony clay             | Ebony clay dark blue-grey and watercourse green colored theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb24.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme024.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb24.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme024.png?raw=true) |
| barossa      | Barossa                | Barossa red and cardin green colored theme. A somber color set suited for courts and law firms. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb25.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme025.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb25.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme025.png?raw=true) |
| shark        | Shark and orange       | Shark grey and orange ecstasy colored theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb26.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme026.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb26.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme026.png?raw=true) |
| bigStone     | Big stone tulip        | Big stone blue and tulip tree yellow colored theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb27.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme027.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb27.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme027.png?raw=true) |
| damask       | Damask and lunar       | Damask red and lunar green colored theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb28.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme028.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb28.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme028.png?raw=true) |
| bahamaBlue       |Bahama and trinidad | Bahama blue and trinidad orange colored theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb29.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme029.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb29.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme029.png?raw=true) |
| mallardGreen       | Mallard and valencia | Mallard green and Valencia pink colored theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb30.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme030.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb30.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme030.png?raw=true) |
| espresso       | Espresso and crema   | Espresso dark brown and crema colored theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb31.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme031.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb31.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme031.png?raw=true) |
| outerSpace       | Outer space stage  | Outer space dark blue-grey and stage red theme. | [<img src="https://rydmike.com/assets_fcsv4/LightSchemeThumb32.jpg?raw=true" width="120"/>](https://rydmike.com/assets/LightScheme032.png?raw=true) | [<img src="https://rydmike.com/assets_fcsv4/DarkSchemeThumb32.jpg?raw=true" width="120"/>](https://rydmike.com/assets/DarkScheme032.png?raw=true) |


