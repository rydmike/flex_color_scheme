import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Static App color schemes used in examples 4 & 5.
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
    // custom app bar color, it could of course be any color, for consistency
    // we will do the same in this custom FlexSchemeColor.
    appBarColor: Color(0xFF002411),
  );
// Create a corresponding custom flex scheme color for a dark theme.
  static const FlexSchemeColor _myScheme1Dark = FlexSchemeColor(
    primary: Color(0xFF9E7389),
    primaryVariant: Color(0xFF775C69),
    secondary: Color(0xFF738F81),
    secondaryVariant: Color(0xFF5C7267),
    // We use same secondaryVariant color as optional custom app bar color.
    appBarColor: Color(0xFF5C7267),
  );

// You can build a scheme the long way, by specifying all the required hand
// picked scheme colors, like above, or you can also build schemes from a
// single primary color. With the [FlexSchemeColor.from] factory. When doing so
// then the only required color is the primary color, the other colors will be
// computed. You can optionally also provide the primaryVariant, secondary and
// secondaryVariant colors with the factory, but any color that is not provided
// will always be computed to get all the required colors in FlexSchemeColor.

// In this example we create our 2nd scheme from just a primary color
// for the light and dark schemes. The custom app bar color will also
// also receive the same color value as the one that is computed for
// secondaryVariant color, this is the default with the factory.
  static final FlexSchemeColor _myScheme2Light =
      FlexSchemeColor.from(primary: const Color(0xFF4C4E06));
  static final FlexSchemeColor _myScheme2Dark =
      FlexSchemeColor.from(primary: const Color(0xFF9D9E76));

// For our 3rd custom scheme we will define primary and secondary colors, but no
// variant colors, we will not make any dark scheme definitions either.
  static final FlexSchemeColor _myScheme3Light = FlexSchemeColor.from(
    primary: const Color(0xFF993200),
    secondary: const Color(0xFF1B5C62),
  );

// Create a list with all color schemes we will use, starting with all
// the built-in ones and then adding our custom ones at the end.
  static final List<FlexSchemeData> schemes = <FlexSchemeData>[
    // Use all the built in FlexColor schemes.
    ...FlexColor.schemesList,
    // Then add our first custom FlexSchemeData to the end of list.
    // We give it a name and description too.
    const FlexSchemeData(
      name: 'Toledo purple',
      description:
          'Purple theme, created from full custom defined color scheme.',
      // FlexSchemeData holds separate defined color schemes for light and
      // matching dark theme colors. Dark theme colors need to be much less
      // saturated than light theme. Using the same colors in light and dark
      // theme modes does not look nice.
      light: _myScheme1Light,
      dark: _myScheme1Dark,
    ),
    // Do the same for our second custom scheme.
    FlexSchemeData(
      name: 'Olive green',
      description:
          'Olive green theme, created from primary light and dark colors.',
      light: _myScheme2Light,
      dark: _myScheme2Dark,
    ),
    // We also do the same for our 3rd custom scheme, BUT we create its matching
    // dark colors, from the light FlexSchemeColor with the toDark method.
    FlexSchemeData(
      name: 'Oregon orange',
      description:
          'Custom orange and blue theme, from only light scheme colors.',
      light: _myScheme3Light,
      // We create the dark desaturated colors from the light scheme.
      dark: _myScheme3Light.toDark(),
    ),
  ];
}
