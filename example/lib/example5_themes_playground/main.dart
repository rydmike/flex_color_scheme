import 'package:flutter/material.dart';

import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
import '../shared/services/theme_service_hive.dart';
import 'theme/flex_theme_dark.dart';
import 'theme/flex_theme_light.dart';
import 'theme/theme_data_dark.dart';
import 'theme/theme_data_light.dart';
import 'widgets/pages/home_page.dart';

// -----------------------------------------------------------------------------
// EXAMPLE 5 - Themes Playground
//
// This example shows how you can use all the built in color schemes in
// FlexColorScheme to define themes from them and how you can define your own
// custom scheme colors and use them together with the predefined ones.
//
// The example also shows how you can use the surface branding feature and
// how to use the custom app bar theme features of FlexColorScheme. The usage
// of the true black theme feature for dark themes is also demonstrated.
// Using the optional Windows desktop like tooltip theme is also shown.
//
// A toggle that allows us to compare the result of custom defined dark schemes
// its computed versions is also available. To further demonstrate the
// difference between FlexThemeData and just Flutter SDK ThemeData.from, a
// toggle to try both is available for comparison purposes.
//
// The example includes a dummy responsive side menu and rail to give a visual
// presentation of what applications that have larger visible surfaces using
// the surface branding looks like.
//
// The color value definition and list of FlexSchemeData is tucked into
// a static class as AppColor.schemesCustom.
//
// The Google font NotoSans is used to show how to use custom fonts.
//
// A ThemeService and ThemeController is used to manage the theme settings.
// This follows the example architecture you get when you
// create a Flutter template application architecture with:
//
// flutter create -t skeleton my_flutter_app
//
// The theme controller is used to change the theme mode, to toggle
// opting in and out of FlexColorScheme's opinionated sub-themes, and to
// change the index value of the used colors from the list of FlexSchemeData
// in AppColor.schemesCustom and many other options.
//
// You can try this app as a web app at:
// https://rydmike.com/flexcolorscheme/themesplayground-v7
// -----------------------------------------------------------------------------

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Use a ThemeController, which glues our theme settings to Flutter Widgets.
  // The controller uses an abstract ThemeService interface to get and save the
  // settings. There are 3 implementations available to choose from:
  //
  // 0. ThemeService      - Abstract interface base class.
  // 1. ThemeServiceMem   - Only keeps settings in memory.
  // 2. ThemeServicePrefs - Persist settings locally using SharedPreferences.
  // 3. ThemeServiceHive  - Persist settings locally using Hive.
  //
  // Here we use Hive. The examples are all built using same
  // "example" app. If we use SharedPreferences in more than one of the apps
  // they would use the same storage container and share the settings when you
  // build them locally. By using Hive for most examples, we can change
  // the storage container name for each example. In these demos the
  // SharedPreferences service is only used for example 3, but you can swap in
  // the Hive based one for it as well.

  // The ThemeServiceHive constructor requires a box name, the others do not.
  // The box name is just a file name for the file that stores the settings.
  final ThemeService themeService =
      ThemeServiceHive('flex_color_scheme_v5_box_5');
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeController that uses the ThemeService.
  final ThemeController themeController = ThemeController(themeService);
  // Load preferred theme settings, while the app is loading, before MaterialApp
  // is created, this prevents a theme change when the app is first displayed.
  await themeController.loadAll();
  // Run the app and pass in the ThemeController. The app listens to the
  // ThemeController for changes. The same ThemeController as used in example 4
  // controls all the myriad of Theme settings and the ThemeService also
  // persists the settings with the injected ThemeServiceHive.
  runApp(PlaygroundApp(controller: themeController));
}

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({super.key, required this.controller});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    // Whenever the theme controller notifies the animation listener in the
    // AnimatedBuilder, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Themes Playground',
          // The Theme controller controls if we use FlexColorScheme made
          // ThemeData or standard SDK ThemeData.from a ColorScheme. It also
          // controls all the configuration parameters used to define the
          // FlexColorScheme object that produces the ThemeData object.
          theme: controller.useFlexColorScheme
              ? flexThemeLight(controller)
              : themeDataLight(controller),
          darkTheme: controller.useFlexColorScheme
              ? flexThemeDark(controller)
              : themeDataDark(controller),
          // Use the dark or light theme based on controller setting.
          themeMode: controller.themeMode,
          // If wrapping the entire app content in a SelectionArea, would
          // makes text selectable and copy enabled in entire app.
          // How it actually behaves, depends on current
          // platform. Not using it for now, I was not happy with its behavior:
          // SelectionArea(child: ... );
          home: GestureDetector(
            // This allows us to un-focus a widget, typically a TextField
            // with focus by tapping somewhere outside it. It is no longer
            // needed on desktop builds, it is done automatically there for
            // TextField, but not on tablet and phone app. In this app we
            // want it on them too and to unfocus other widgets with focus
            // on desktop too.
            onTap: () => FocusScope.of(context).unfocus(),
            // Pass the controller to the HomePage where we use it to change
            // the theme settings that will cause themes above to change and
            // rebuild the entire look of the app based on modified theme.
            child: HomePage(controller: controller),
          ),
        );
      },
    );
  }
}
