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
    swapOnMaterial3: true,
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
    swapOnMaterial3: true,
  );

  // We can build a scheme the long way, by specifying all the required
  // scheme colors, like above, or we can also build schemes from a single
  // primary color. With the `FlexSchemeColor.from` factory. When doing so the
  // only required color is the primary color, the other colors will be
  // computed. We can optionally also provide the `primaryContainer`,
  // `secondary` and `secondaryContainer` colors with the factory, but any
  // color that is not provided will always be computed to get all the required
  // colors in a `FlexSchemeColor`.

  // In this example we create our 2nd scheme from just a primary color for the
  // light and dark schemes. The custom `appBarColor` does in this case also
  // receive the same color value as the one that is computed for
  // `secondaryContainer` color. This is its default with the
  // `FlexSchemeColor.from` factory if the color is not specified.

  // When you figure out the actual colors you want, it might be a good idea to
  // use the method in the above case for the custom _myScheme1Light and dark,
  // since that can be const and you can then make your entire list
  // of color schemes a const.

  // The `brightness` parameter in the `FlexSchemeColor.from` factory is new
  // in version 5. If `brightness` is specified the factory computes missing
  // colors that are well suited for a Material 3 based ColorScheme, of the
  // given brightness. If brightness is not specified, then the algorithm is
  // same as before version 5, but with two more colors. Its produced colors
  // fit better for M2 specification, they do also work in M3, they just don't
  // follow the guidelines with respect to the hue of the main color and its
  // container pair color. When using the `FlexSchemeColor.from` with
  // Material 3 `ColorScheme`, prefer specifying the brightness value for
  // results following the Material 3 design intent.
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
    swapOnMaterial3: true,
  );

  // These colors are used as default for the customizable colors in
  // example 5, the Themes Playground.
  static const Color customPrimaryLight = Color(0xFF004881);
  static const Color customPrimaryContainerLight = Color(0xFFD0E4FF);
  static const Color customSecondaryLight = Color(0xFFAC3306);
  static const Color customSecondaryContainerLight = Color(0xFFFFDBCF);
  static const Color customTertiaryLight = Color(0xFF006875);
  static const Color customTertiaryContainerLight = Color(0xFF95F0FF);

  static const Color customPrimaryDark = Color(0xFF9FC9FF);
  static const Color customPrimaryContainerDark = Color(0xFF00325B);
  static const Color customSecondaryDark = Color(0xFFFFB59D);
  static const Color customSecondaryContainerDark = Color(0xFF872100);
  static const Color customTertiaryDark = Color(0xFF86D2E1);
  static const Color customTertiaryContainerDark = Color(0xFF004E59);

  // Used by example 4, the "All themes" demo.
  //
  // Finally we create a list with all color schemes we will use. Starting with
  // our custom schemes, since normally when we make custom schemes, those are
  // probably the ones we want to use primarily, so we put them first. After our
  // custom schemes, we add all the pre-defined built-in ones, offering them as
  // options users can switch to and use if they like.
  static final List<FlexSchemeData> customSchemes = <FlexSchemeData>[
    // We add our custom light and dark FlexSchemeColor schemes we defined
    // to a list of FlexSchemeData, where we can bundle each light and dark
    // theme that goes together and give it a name and description too.
    const FlexSchemeData(
      name: 'Example Midnight',
      description: 'Midnight blue theme, created as an in code example by '
          'using custom color values for all colors in the scheme',
      // FlexSchemeData holds separate defined color schemes for light and
      // matching dark theme colors. Dark theme colors typically need to be less
      // saturated versions of their than light counter parts. Using the same
      // colors in light and dark theme modes does not work so well.
      light: _myScheme1Light,
      dark: _myScheme1Dark,
    ),
    // Do the same for our second custom scheme.
    FlexSchemeData(
      name: 'Example Greens',
      description: 'Vivid green theme, created as an in code example from one '
          'primary color in light mode and another primary for dark mode',
      light: _myScheme2Light,
      dark: _myScheme2Dark,
    ),
    // We also do the same for our 3rd custom scheme, BUT we create its matching
    // dark colors, from the light FlexSchemeColor with the toDark method.
    FlexSchemeData(
      name: 'Example Red & Blue',
      description: 'Classic red and blue, created as an in code example from '
          'only light theme mode primary and secondary colors',
      light: _myScheme3Light,
      // We create the dark desaturated colors from the light scheme.
      // The `swapColors` parameter is `true` here. It is new in version 5. It
      // swaps main and container colors values for the primary its container,
      // likewise for secondary and tertiary and their containers.
      //
      // This is done because in Material 3 light mode, the main color should
      // be darker or more saturated than the container, but in dark mode it
      // should be the other way around. By setting the flag to true, this is
      // done before the light theme mode colors are reused as dark theme and
      // desaturated using `whiteBlend` level value.
      dark: _myScheme3Light.defaultError.toDark(30, true),
    ),
    // Use all the built-in FlexColor schemes. This list is a const.
    ...FlexColor.schemesList,
  ];

  /// Used by example 5, the Themes Playground.
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
  static final List<FlexSchemeData> schemes = <FlexSchemeData>[
    // Use all the built-in FlexColor schemes we setup for example 4
    ...customSchemes,
    // and a placeholder for the custom colors, here overriding its name too.
    FlexColor.customColors.copyWith(name: 'Customizable'),
  ];

  /// Return current FlexSchemeData based on the Theme controllers schemeIndex.
  ///
  /// Used by example 5, the Themes Playground.
  ///
  /// Instead of getting the colors directly from a list that changes frequently
  /// we make a separate helper function that takes a ThemeController and
  /// returns the right FlexSchemeData from the list, but returning the
  /// `ThemeController.customScheme` for the last item, when the controllers
  /// index is last item in list, otherwise it returns FlexSchemeData at index,
  /// well almost, we include also the logic for computed dark mode colors and
  /// dark mode seed color behavior, in the schemeAtIndex helper it uses to
  /// get the scheme at an index.
  static FlexSchemeData scheme(final ThemeController controller) =>
      schemeAtIndex(controller.schemeIndex, controller);

  /// Get the FlexSchemeData at current scheme index.
  ///
  /// Used by example 5, the Themes Playground.
  ///
  /// Helper function to return current FlexSchemeData at given index, also
  /// needed this functionality in theme selector and popup menu, so made
  /// it a sub function to getting the FlexSchemeData at its current index.
  /// We go a bit further and have it help us return the computed dark scheme
  /// when controller says we are using that as well, instead of the defined
  /// dark mode scheme. This simplifies our logic in the MaterialApp
  /// of example 5 and we get right dark colors in ThemeSelector and Popup too.
  static FlexSchemeData schemeAtIndex(
      final int index, final ThemeController controller) {
    if (index == schemes.length - 1) {
      return controller.customScheme.copyWith(
          dark: controller.useKeyColors
              ? controller.customScheme.dark
              : controller.useToDarkMethod
                  ? controller.customScheme.light.defaultError.toDark(
                      controller.darkMethodLevel,
                      controller.toDarkSwapPrimaryAndContainer)
                  : null);
    }
    return schemes[index].copyWith(
        dark: controller.useToDarkMethod
            ? schemes[index].light.defaultError.toDark(
                controller.darkMethodLevel,
                controller.toDarkSwapPrimaryAndContainer)
            : null);
  }

  /// Used by example 5, the Themes Playground.
  /// Used to explain the current selection of key colors used to
  /// generate the ColorScheme, when it is activated.
  ///
  /// Normally this is local to the widget where it is used, but I needed
  /// this explanation in different places so I tucked it in here.
  /// It could be placed anywhere as simple top level function too.
  static String explainUsedColors(ThemeController controller) {
    if (!controller.useKeyColors) {
      return 'Material 3 ColorScheme seeding from key colors is OFF and not '
          'used. The effective ColorScheme is based directly on the selected '
          "pre-defined FlexColorScheme's colors";
    }
    if (!controller.useSecondary && !controller.useTertiary) {
      return 'Light scheme defined Primary color is used to generate '
          'the Colorscheme. '
          "This is like using Flutter's ColorScheme.fromSeed with the scheme "
          'defined Primary color as seed color';
    }
    if (controller.useSecondary && !controller.useTertiary) {
      return 'Tonal palettes for the ColorScheme are made with light scheme '
          'defined Primary and Secondary colors as seed keys. Tertiary key '
          'is computed from Primary color';
    }
    if (!controller.useSecondary && controller.useTertiary) {
      return 'Tonal palettes for the ColorScheme, are made with light scheme '
          'defined Primary and Tertiary colors as seed keys, Secondary key is '
          'computed from Primary color';
    }
    return 'Light scheme defined Primary, Secondary and Tertiary colors are '
        'used as key colors to generate tonal palettes that define '
        'the ColorScheme';
  }
}
