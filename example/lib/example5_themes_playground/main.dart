import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
import '../shared/services/theme_service_hive.dart';
import 'theme/flex_theme_dark.dart';
import 'theme/flex_theme_light.dart';
import 'theme/theme_data_dark.dart';
import 'theme/theme_data_light.dart';
import 'widgets/pages/home_page.dart';

/// FlexColorScheme EXAMPLE 5 - Themes Playground
///
/// The learn more about using this app see the docs at:
/// - https://docs.flexcolorscheme.com/playground
///
/// The learn more about its history and design see docs at:
/// - https://docs.flexcolorscheme.com/tutorial5
///
/// A ThemeService and ThemeController is used to manage the theme settings.
/// This follows the example architecture you get when you
/// create a Flutter template application architecture with:
///
/// flutter create -t skeleton my_flutter_app
///
/// The theme controller is used to change the theme mode, to toggle
/// opting in and out of FlexColorScheme's opinionated sub-themes, and to
/// change the index value of the used colors from the list of FlexSchemeData
/// in AppColor.schemesCustom and many other options.
///
/// You can try this app as a web app at:
/// https://rydmike.com/flexcolorscheme/themesplayground-v7-2
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
  //
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

  // Only use Google fonts via asset provided fonts.
  GoogleFonts.config.allowRuntimeFetching = false;
  // Add font license info for used fonts from Google fonts.
  LicenseRegistry.addLicense(() async* {
    final String license =
        await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });

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
    // Whenever the theme controller notifies the listenable in the
    // ListenableBuilder, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Themes Playground',
          // The Theme controller controls if we use FlexColorScheme made
          // ThemeData or standard SDK ThemeData. It also
          // controls all the configuration parameters used to define the
          // FlexColorScheme object that produces the ThemeData object.
          theme: controller.useFlexColorScheme
              ? flexThemeLight(controller)
              : themeDataLight(controller),
          darkTheme: controller.useFlexColorScheme
              ? flexThemeDark(controller)
              : themeDataDark(controller),
          // Use the dark/light theme based on controller setting.
          themeMode: controller.themeMode,
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
            //
            // There are more than 270 properties in the controller that can
            // be used to control the two light and dark mode themes.
            // Every time one of them is modified, the themed app is rebuilt
            // with the new ThemeData applied.
            // The code that one need to use the same theme is also updated
            // interactively for each change when the code gen panel is
            // in view.
            child: HomePage(controller: controller),
          ),
        );
      },
    );
  }
}
