import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Static App color schemes used in examples 4 & 5.
///
/// Putting static const color data in their own class with only color values
/// and data related to the colors is common useful and convenient practice.
class AppColor {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppColor._();

  // Create a custom flex scheme color for a light theme.
  static const FlexSchemeColor _myScheme1Light = FlexSchemeColor(
    primary: Color(0xFF4E0028),
    primaryVariant: Color(0xFF320019),
    secondary: Color(0xFF003419),
    secondaryVariant: Color(0xFF002411),
    // The built in schemes use their secondary variant color as their
    // custom app bar color, but it can be any color. We use a custom color
    // here. We will see this in example 5 when using this theme and selecting
    // the custom app bar style.
    appBarColor: Color(0xFF490B56),
  );
// Create a corresponding custom flex scheme color for a dark theme.
  static const FlexSchemeColor _myScheme1Dark = FlexSchemeColor(
    primary: Color(0xFF9E7389),
    primaryVariant: Color(0xFF775C69),
    secondary: Color(0xFF738F81),
    secondaryVariant: Color(0xFF5C7267),
    appBarColor: Color(0xFF2D0235),
  );

// You can build a scheme the long way, by specifying all the required hand
// picked scheme colors, like above, or you can also build schemes from a
// single primary color. With the `FlexSchemeColor.from` factory. When doing so
// the only required color is the primary color, the other colors will be
// computed. You can optionally also provide the primaryVariant, secondary and
// secondaryVariant colors with the factory, but any color that is not provided
// will always be computed to get all the required colors in `FlexSchemeColor`.

// In this example we create our 2nd color scheme from just a primary color
// for the light and dark schemes. The custom app bar color will also
// receive the same color value as the one that is computed for
// secondaryVariant color, this is default null behavior for custom app bar
// color when using this factory.
  static final FlexSchemeColor _myScheme2Light =
      FlexSchemeColor.from(primary: const Color(0xFF4C4E06));
  static final FlexSchemeColor _myScheme2Dark =
      FlexSchemeColor.from(primary: const Color(0xFF9D9E76));

// For our 3rd custom scheme we will define primary and secondary colors, but no
// variant colors, we will not make any dark scheme definitions either, all
// these missing colors will be computed, the missing color definitions will
// get computed by the factory `FlexSchemeColor.from` when it creates the
// `FlexSchemeColor` object. To make our dark colors for this light scheme, we
// use the method `toDark` further below with the `_myScheme3Light` instance.
  static final FlexSchemeColor _myScheme3Light = FlexSchemeColor.from(
    primary: const Color(0xFF993200),
    secondary: const Color(0xFF1B5C62),
  );

// Finally we create a list with all color schemes we will use. Starting with
// our custom schemes, since normally when we make custom schemes, those are
// probably the ones we want to use primarily. After our custom schemes,
// we add all the pre-defined built-in ones, offering them as options the users
// can switch to and use if they like.
  static final List<FlexSchemeData> schemes = <FlexSchemeData>[
    // We add our custom light and dark FlexSchemeColor schemes we defined
    // to a list of FlexSchemeData, where we can bundle each light and dark
    // theme that goes together and give it a name and description too.
    const FlexSchemeData(
      name: 'Custom1: Toledo purple',
      description:
          'Custom purple theme, created from full custom defined color scheme.',
      // FlexSchemeData holds separate defined color schemes for light and
      // matching dark theme colors. Dark theme colors typically need to be less
      // saturated versions of their than light counter parts. Using the same
      // colors in light and dark theme modes does not work so well.
      light: _myScheme1Light,
      dark: _myScheme1Dark,
    ),
    // Do the same for our second custom scheme.
    FlexSchemeData(
      name: 'Custom2 Olive green',
      description: 'Custom olive green theme, created from primary '
          'light and dark colors.',
      light: _myScheme2Light,
      dark: _myScheme2Dark,
    ),
    // We also do the same for our 3rd custom scheme, BUT we create its matching
    // dark colors, from the light FlexSchemeColor with the toDark method.
    FlexSchemeData(
      name: 'Custom3: Oregon orange',
      description:
          'Custom orange and blue theme, from only light scheme colors.',
      light: _myScheme3Light,
      // We create the dark desaturated colors from the light scheme.
      dark: _myScheme3Light.toDark(),
    ),

    // Use all the built in FlexColor schemes.
    ...FlexColor.schemesList,
  ];
}
