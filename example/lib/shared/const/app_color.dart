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
    primaryContainer: Color(0xFFA0C2ED),
    secondary: Color(0xFFD26900),
    secondaryContainer: Color(0xFFFFD270),
    tertiary: Color(0xFF5C5C95),
    tertiaryContainer: Color(0xFFC8DBF8),
    // The built in schemes use their tertiary color as their default
    // custom app bar color, but it can be any color. We use a custom color
    // here. We will see this in example 5 when using the theme and selecting
    // the custom app bar style. We use a light blue that matches branded
    // surface colors, but is a bit stronger than most surface branding.
    appBarColor: Color(0xFFC8DCF8),
  );
// Create a corresponding custom flex scheme color for a dark theme.
  static const FlexSchemeColor _myScheme1Dark = FlexSchemeColor(
    primary: Color(0xFFB1CFF5),
    primaryContainer: Color(0xFF3873BA),
    secondary: Color(0xFFFFD270),
    secondaryContainer: Color(0xFFD26900),
    tertiary: Color(0xFFC9CBFC),
    tertiaryContainer: Color(0xFF535393),
    // A custom very dark blue, to match the dark theme mode
    appBarColor: Color(0xFF00102B),
  );

  // You can build a scheme the long way, by specifying all the required hand
  // picked scheme colors, like above, or you can also build schemes from a
  // single primary color. With the `FlexSchemeColor.from` factory. When doing
  // so the only required color is the primary color, the other colors will be
  // computed. You can optionally also provide the primaryVariant, secondary and
  // secondaryVariant colors with the factory, but any color that is not
  // provided will always be computed to get all the required colors in
  // `FlexSchemeColor`.

  // In this example we create our 2nd color scheme from just a primary color
  // for the light and dark schemes. The custom app bar color will also
  // receive the same color value as the one that is computed for
  // secondaryVariant color, this is default null behavior for custom app bar
  // color when using this factory.

  // When you figure out the actual colors you want, it might be a good idea to
  // use the method in the above case for the custom _myScheme1Light and dark,
  // since that can be const and you can then make your entire list
  // of color schemes a const.

  // The `brightness` parameter in the FlexSchemeColor.from factory is new
  // from version 5. If brightness is specified the factory computes missing
  // colors that are better suited for an M3 based ColorScheme, of the given
  // brightness. If brightness is not specified the algorithm is same as before
  // version 5, but with two more colors. Such colors schemes fits better for
  // M2 specification, but they do also work in M3, they just don't follow
  // the guidelines with respect to the brightness of the color and container
  // pair color,
  static final FlexSchemeColor _myScheme2Light = FlexSchemeColor.from(
    primary: const Color(0xFF065808),
    brightness: Brightness.light,
  );
  static final FlexSchemeColor _myScheme2Dark = FlexSchemeColor.from(
    primary: const Color(0xFF629F80),
    brightness: Brightness.dark,
  );

  // For our 3rd custom scheme we will define primary and secondary colors, but
  // no container colors, we will not make any dark scheme definitions either.
  // All these missing colors will be computed, the missing color definitions
  // will get computed by the factory `FlexSchemeColor.from` when it creates the
  // `FlexSchemeColor` object. To make our dark colors for this light scheme, we
  // use the method `toDark` further below with the `_myScheme3Light` instance.
  //
  // Same comment as above, when you do figure out the actual colors you want,
  // it might be a good idea to use the method in the above case for the custom
  // _myScheme1Light and dark, since that can be const and you can then make
  // your entire list of color schemes a const.
  static final FlexSchemeColor _myScheme3Light = FlexSchemeColor.from(
    primary: const Color(0xFF1145A4),
    secondary: const Color(0xFFB61D1D),
    brightness: Brightness.light,
  );

  // For example 4, all themes.
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
      // The `swapColors`parameter is `true` here. It is new in version 5. It
      // swaps main and container colors values
      // for the primary its container, likewise for secondary and tertiary and
      // their containers.
      //
      // This is done because in M3 light mode, the main color should be darker
      // or more saturated than the container, but in dark mode it should be
      // the other way around. By setting the flag to true, this is done
      // before the light theme mode colors are reused as dark theme and
      // desaturated using `whiteBlend` level value.
      dark: _myScheme3Light.defaultError.toDark(30, true),
    ),
    // Use all the built-in FlexColor schemes. This list is a const.
    ...FlexColor.schemesList,
  ];

  /// For example 5, the Themes Playground.
  /// We add all schemes from example 4 and a placeholder for the custom data.
  ///
  /// We could also make this a static getter that requires the ThemeController,
  /// so we can use it to return a list where the last item is the
  /// FlexSchemeData it defines (controller.customScheme). I tried it, and it
  /// felt sluggish and heavy. It results in creating a new list very
  /// frequently, which was a bit too inefficient.
  ///
  /// Instead we are making it a final and will add a const placeholder for the
  /// last index for the customized colors and use another static helper
  /// function to get right colors see next step.
  static final List<FlexSchemeData> schemesCustom = <FlexSchemeData>[
    // Use all the built-in FlexColor schemes we setup for example 4
    ...schemes,
    // and a placeholder for the custom colors
    FlexColor.customColors,
  ];

  /// For example 5, the Themes Playground.
  /// Helper function to return current FlexSchemeData at controller index.
  ///
  /// Instead of getting the colors directly from a list that changes frequently
  /// we make a separate helper function that takes a ThemeController and
  /// returns the right FlexSchemeData from the list, but returning the
  /// `ThemeController.customScheme` for the last item, when the controllers
  /// index  is last item in list, otherwise it returns FlexSchemeData at index,
  /// well almost, we include also the logic for computed dark mode colors, in
  /// next helper.
  static FlexSchemeData scheme(final ThemeController controller) =>
      schemeAtIndex(controller.schemeIndex, controller);

  /// For example 5, the Themes Playground.
  /// Helper function to return current FlexSchemeData at given index, also
  /// needed this functionality in theme selector and popup menu, so made
  /// it a sub function to getting the FlexSchemeData at its current index.
  /// We go a bit further and have it help us return the computed dark scheme
  /// when controller says we are using that as well, instead of the defined
  /// dark mode scheme. This simplifies our logic in the MaterialApp
  /// of example 5 and we get right dark colors in ThemeSelector and Popup too.
  static FlexSchemeData schemeAtIndex(
      final int index, final ThemeController controller) {
    if (index == schemesCustom.length - 1) {
      return controller.customScheme.copyWith(
          dark: controller.useToDarkMethod
              ? controller.customScheme.light.defaultError
                  .toDark(controller.darkMethodLevel, true)
              : null);
    }
    return schemesCustom[index].copyWith(
        dark: controller.useToDarkMethod
            ? schemesCustom[index]
                .light
                .defaultError
                .toDark(controller.darkMethodLevel, true)
            : null);
  }

  /// Return a [FlexTones] based on passed in [brightness] and [tones] value.
  static FlexTones flexTonesConfig(Brightness brightness, int tones) {
    if (tones == 2) {
      return FlexTones.soft(brightness);
    } else if (tones == 3) {
      return FlexTones.vivid(brightness);
    } else if (tones == 4) {
      return FlexTones.highContrast(brightness);
    } else {
      return FlexTones.material(brightness);
    }
  }

  /// For example 5, the Themes Playground.
  /// Used to explain the current selection of key colors used to
  /// generate the ColorScheme, when it is activated.
  ///
  /// Normally this is local to the widget where it is used, but I needed
  /// this explanation in different places so I tucked it in here.
  /// It could be placed anywhere as simple top level function too.
  static String explainUsedColors(ThemeController controller) {
    if (!controller.useKeyColors) {
      return 'Material 3 ColorScheme seeding from key colors is OFF and not '
          'used. The ColorScheme is based directly on the effective '
          'input colors';
    }
    if (!controller.useSecondary && !controller.useTertiary) {
      return 'Only Primary input color is used to generate the Colorscheme. '
          'This is like using ColorScheme.fromSeed with Primary color';
    }
    if (controller.useSecondary && !controller.useTertiary) {
      return 'To make tonal palettes for the ColorScheme, Primary and '
          'Secondary colors are used as keys, Tertiary is computed '
          'from Primary';
    }
    if (!controller.useSecondary && controller.useTertiary) {
      return 'To make tonal palettes for the ColorScheme, Primary and '
          'Tertiary colors are used as keys, Secondary is computed '
          'from Primary';
    }
    return 'Input Primary, Secondary and Tertiary colors are used as '
        'keys to generate tonal palettes that define the ColorScheme';
  }
}
