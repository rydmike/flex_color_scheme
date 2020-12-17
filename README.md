# FlexColorScheme

FlexColorScheme is a Flutter package to help you make beautiful color branded Flutter themes. The created themes are based on the same concept and idea as Flutter's newer `ColorScheme` based theming.

A total of 20 different color schemes for both light and dark modes are available as predefined color schemes. These are just ready to use examples, you can easily create your own custom color schemes and make themes from them.  If you have seen the Flutter [FlexFold demo](https://rydmike.com/demoflexfold) application, then you have already observed **FlexColorScheme** in action, the demo uses this package for its theming.

_Insert real teaser image collage here - this is the color picker one_
<img src="https://github.com/rydmike/flex_color_picker/blob/master/resources/ColorPickerSimpleDemo.png?raw=true" alt="ColorPicker Basic"/>

FlexColorScheme also makes a few opinionated modifications to the default Flutter `ThemeData.from` a ´ColorScheme´ created theme. At the same time it also corrects known minor theme inconsistency issues that exist in the current version of the Flutter standard `ThemeData.from` factory. Both of these topics are explained in detail further below.

The Material guide also talks about using [color branded surfaces](https://material.io/design/color/dark-theme.html#properties), with FlexColorScheme you can create primary color branded themes using 4 different built-in blend strengths of primary color into surface and background color, while avoiding blending it in with the scaffold background for all but the highest strength.

The color schemes can just like Flutter's standard color scheme be created by specifying all required schemes colors, but you can also specify just the primary color and get all other need colors for a complete color scheme computed based on the provided primary color.

When you have defined your `FlexColorScheme` you turn it into a theme with the `toTheme` method that returns a `ThemeData` object that yu can use just like any other ThemeData object. You can of course still override this returned theme or add additional custom sub-theming to it with the ThemeData `copyWith` method. 


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

### Example Applications

The package contains five different example applications with increasing complexity.
 
To try the simplest example, example number 1 of the ColorFlexScheme on a device or simulator, clone the flex color scheme repository and run the example:

```bash
cd example/
flutter run --release
```

The result is a sample app that uses one of the built color schemes as its theme, has light/dark/system theme mode toggle and includes a theme showcase, so you can see the impact of the applied theme on common Material widgets.

**NOTE:**
>If you clone the repo to build the samples, then open the package `/example` folder in your IDE to build the above default example, which ss the same as the example in the /example/lib/example1 folder. If you want to build all the other examples one by one, without setting up different configurations in you IDE for the different main files. You can just copy paste in each example's code into the `/example/lib/main.dart` file to build it easily. Just change the relative import of the all the shared imports to `import 'all_shared_imports.dart';` and you are all done to build it. 

## Tutorial

We will review the key parts in each example below and explain the features step by step. For simplicity the example applications does not use any state management solution. The key part to demonstration is actually always in the used stateful Material app where all the scheme setup for the themes are made in these demos.

If you just want to have a quick look at the example applications you can try Live web versions of them.

 
