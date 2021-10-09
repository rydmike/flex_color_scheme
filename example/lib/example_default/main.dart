import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/all_shared_imports.dart';

// This is a copy of the default main.dart file in the example/lib folder.
// It is just here to have a handy copy of it. To build the tutorials in
// examples 1-5 on a device, you can just copy/paste the main.dart code without
// imports from these examples to example/lib/main.dart file. Then you do not
// have to setup build configs for them in your project.

/// FlexColorScheme default example.
///
/// This example shows how you can use define a few colors, use
/// [FlexColorScheme] to theme your app with them, and also define other custom
/// theme properties and how to use a [GoogleFonts] based font as the overall
/// default font for your theme, and how to use a customized [TextTheme].
///
/// To learn more about how to use FlexColorScheme and all its features,
/// please go through the examples in the readme documentation.
void main() => runApp(const DemoApp());

// For our custom color scheme we will define primary and secondary colors,
// but no variant or other colors.
// ignore: unused_element
final FlexSchemeColor _mySchemeLight = FlexSchemeColor.from(
  primary: const Color(0xFF3B5997),
  // If you do not want to define secondary, primaryVariant and
  // secondaryVariant, error and appBar colors you do not have to,
  // they will get defined automatically when using the FlexSchemeColor.from()
  // factory. With raw default constructor FlexSchemeColor() you have to define
  // more required color properties.
  //
  // Here we do define a secondary color, but if you don't it will get a
  // default shade based on the primary color.
  secondary: const Color(0xFFFB8123),
);

// These are custom defined matching dark mode colors, but below we instead show
// how to base them of the light color scheme. You can swap in these too in the
// code example further below.
// ignore: unused_element
final FlexSchemeColor _mySchemeDark = FlexSchemeColor.from(
  primary: const Color(0xFF8B9DC3),
  secondary: const Color(0xFFFCB075),
);

// We define a custom text theme for our app. Here we have decided that
// Headline1 is too big to be useful for us, so we make it a bit smaller.
// We also think buttons should have a bit bigger text, tighter letter spacing,
// and that overline is a bit too small and have weird letter spacing,
// so we change them too.
const TextTheme _myTextTheme = TextTheme(
  headline1: TextStyle(
    fontSize: 70, // Defaults to 96 in Material2018 Typography.
  ),
  button: TextStyle(
    fontSize: 16, // Defaults to 14 in Material2018 Typography.
    letterSpacing: 0.9, // Defaults to 1.25 in Material2018 Typography.
  ),
  overline: TextStyle(
    fontSize: 11, // Defaults to 10 in Material2018 Typography.
    letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
  ),
);

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Default Example',
      // Define the light theme for the app, based on defined colors.
      theme: FlexThemeData.light(
        colors: _mySchemeLight,
        // Just want to use a built in scheme? Then comment colors above and
        // use scheme below to select a built-in one:
        // scheme: FlexScheme.hippieBlue,
        surfaceStyle: FlexSurface.medium,
        // TODO(rydmike): Get these to work
        surfaceMode: FlexSurfaceMode.scaffoldSurfaceBackground,
        blendLevel: FlexBlendLevel.none,
        //
        appBarStyle: FlexAppBarStyle.primary,
        appBarElevation: 0,
        transparentStatusBar: true,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        tooltipsMatchBackground: false,
        swapColors: false,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // Set the default font for the ThemeData using GoogleFonts.
        fontFamily: GoogleFonts.lato().fontFamily,
        // And custom text themes.
        textTheme: _myTextTheme,
        primaryTextTheme: _myTextTheme,
      ),
      // Define the dark theme for the app, based on custom colors.
      darkTheme: FlexThemeData.dark(
        // If you want to base the dark scheme on your light colors, this is
        // a nice shortcut if you do not want to design your dark theme.
        // The whiteBlend for the desaturation of the light theme colors
        // defaults to 35%, you can try other values too, here we use 30.
        colors: _mySchemeLight.toDark(30),
        // If you want to use the defined custom dark colors, use it instead:
        // colors: _mySchemeDark,
        // Just want to use a built in scheme? Then comment colors above and
        // use scheme below to select a built-in one:
        // scheme: FlexScheme.hippieBlue,
        surfaceStyle: FlexSurface.strong,
        appBarStyle: FlexAppBarStyle.background,
        appBarElevation: 0,
        transparentStatusBar: true,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        tooltipsMatchBackground: false,
        swapColors: false,
        darkIsTrueBlack: false,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: _myTextTheme,
        primaryTextTheme: _myTextTheme,
      ),
      // Use the above dark or light theme based on active themeMode below.
      // Toggle in code here, or set to system to toggle with device.
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

// The content of the HomePage below is not relevant for using FlexColorScheme
// based application theming. The critical parts are in the MaterialApp
// theme definitions. The HomePage just contains UI to visually show what the
// defined example looks like in an application and with commonly used Widgets.
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The reason why HomePage is using a stateful widget is that it holds the
  // state of the dummy side menu/rail locally.
  double _menuWidth = App.expandWidth;
  bool _isExpanded = true;

  // The state for the system navbar style and divider usage is local as it is
  // is only used by the AnnotatedRegion.
  // Used to control system navbar style via an AnnotatedRegion.
  FlexSystemNavBarStyle systemNavBarStyle = FlexSystemNavBarStyle.background;
  // Used to control if we have a top divider on the system navigation bar.
  bool useSysNavDivider = false;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double topPadding = media.padding.top;
    final double bottomPadding = media.padding.bottom;
    final bool menuAvailable = media.size.width > 650;
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;
    final Color appBarColor =
        theme.appBarTheme.backgroundColor ?? theme.primaryColor;

    // Give the width of the side panel some automatic adaptive behavior and
    // make it rail sized when there is not enough room for a menu, even if
    // menu size is requested.
    if (!menuAvailable) {
      _menuWidth = App.shrinkWidth;
    }
    if (menuAvailable && !_isExpanded) {
      _menuWidth = App.shrinkWidth;
    }
    if (menuAvailable && _isExpanded) {
      _menuWidth = App.expandWidth;
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a helper that can be use to theme
      // the system navigation bar using an AnnotatedRegion. Without this
      // page wrapper the system navigation bar in Android will not change
      // theme color as we change themes for the page. This is a
      // Flutter "feature", but with this annotated region we can have the
      // navigation bar follow desired background color and theme-mode,
      // which looks nicer and more as it should on an Android device.
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: systemNavBarStyle,
        useDivider: useSysNavDivider,
      ),
      child: Row(
        children: <Widget>[
          // Contains the demo menu and side rail.
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: App.expandWidth),
            child: Material(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _menuWidth,
                child: SideMenu(
                  maxWidth: App.expandWidth,
                  onTap: menuAvailable
                      ? () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        }
                      : null,
                ),
              ),
            ),
          ),
          // The actual page content is a normal Scaffold.
          Expanded(
            child: Scaffold(
              // For scrolling behind the app bar
              extendBodyBehindAppBar: true,
              // For scrolling behind the bottom nav bar, if there would be one.
              extendBody: true,
              appBar: AppBar(
                title: Text(App.title(context)),
                actions: const <Widget>[AboutIconButton()],
                backgroundColor: Colors.transparent,
                // Gradient partially transparent AppBar, just because it looks
                // nice and we can see content scroll behind it.
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Theme.of(context).dividerColor),
                    ),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: <Color>[
                        appBarColor,
                        appBarColor.withOpacity(0.85),
                      ],
                    ),
                  ),
                ),
              ),
              body: PageBody(
                constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    App.edgePadding,
                    topPadding + kToolbarHeight + App.edgePadding,
                    App.edgePadding,
                    App.edgePadding + bottomPadding,
                  ),
                  children: <Widget>[
                    Text('Theme', style: headline4),
                    const Text(
                        'This example shows how you can use custom colors '
                        'with FlexColorScheme in light and dark mode, '
                        'just as defined values in a stateless app.\n\n'
                        'It uses ThemeMode.system and device settings to '
                        'toggle between light and dark theme.\n\n'
                        'The example also has property place holders that '
                        'you can modify to test other FlexColorScheme '
                        'features.'),
                    const SizedBox(height: 8),
                    // Active theme color indicators.
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: App.edgePadding),
                      child: ShowThemeColors(),
                    ),
                    const SizedBox(height: 8),
                    // Open a sub-page
                    ListTile(
                      title: const Text('Open a demo subpage'),
                      subtitle: const Text(
                        'The subpage will use the same '
                        'color scheme based theme automatically.',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Subpage.show(context);
                      },
                    ),
                    const Divider(),
                    // Splash pages...
                    ListTile(
                      title: const Text('Splash page demo 1a'),
                      subtitle: const Text(
                        'No scrim and normal status icons.\n'
                        'Using themedSystemNavigationBar (noAppBar:true)',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        SplashPageOne.show(context, false);
                      },
                    ),
                    ListTile(
                      title: const Text('Splash page demo 1b'),
                      subtitle: const Text(
                        'No scrim and inverted status icons.\n'
                        'Using themedSystemNavigationBar (noAppBar:true, '
                        'invertStatusIcons:true)',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        SplashPageOne.show(context, true);
                      },
                    ),
                    ListTile(
                      title: const Text('Splash page demo 2'),
                      subtitle: const Text(
                        'No status icons or navigation bar.\n'
                        'Using setEnabledSystemUIOverlays([])',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        SplashPageTwo.show(context, true);
                      },
                    ),
                    const Divider(),
                    Text('Theme Showcase', style: headline4),
                    const ThemeShowcase(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
