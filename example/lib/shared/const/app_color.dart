import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../controllers/theme_controller.dart';

/// Static App color schemes used in examples 4 & 5.
///
/// Putting static const color data in their own class with only color values
/// and data related to the colors is a common useful and convenient practice.
class AppColor {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppColor._();

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
      FlexSchemeColor.from(primary: const Color(0xFF055C34));
  static final FlexSchemeColor _myScheme2Dark =
      FlexSchemeColor.from(primary: const Color(0xFF629F80));

// For our 3rd custom scheme we will define primary and secondary colors, but no
// variant colors, we will not make any dark scheme definitions either, all
// these missing colors will be computed, the missing color definitions will
// get computed by the factory `FlexSchemeColor.from` when it creates the
// `FlexSchemeColor` object. To make our dark colors for this light scheme, we
// use the method `toDark` further below with the `_myScheme3Light` instance.
  static final FlexSchemeColor _myScheme3Light = FlexSchemeColor.from(
    primary: const Color(0xFF04368E),
    secondary: const Color(0xFFA00505),
  );

// For example 4.
// Finally we create a list with all color schemes we will use. Starting with
// our custom schemes, since normally when we make custom schemes, those are
// probably the ones we want to use primarily, so we put them first. After our
// custom schemes, we add all the pre-defined built-in ones, offering them as
// options users can switch to and use if they like.
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
    // Use all the built-in FlexColor schemes.
    ...FlexColor.schemesList,
  ];

// For example 5.
// We add all schemes from example 4 and a placeholder for the custom data.
// This is a static getter that requires the ThemeController so we can use
// use it the return the custom it defines as the last FlexSchemeData.
// This might be a bit resource heavy when a lot of things changes, but for
// the purposes of this demo, I'm going to be lazy and do this anyway.
  static List<FlexSchemeData> schemesCustom(ThemeController controller) =>
      <FlexSchemeData>[
        // Use all the built-in FlexColor schemes we setup for example 4
        ...schemes,
        // and...
        // Return the custom colors, defined by the controller as our last
        // color scheme.
        controller.customScheme,
      ];
}
