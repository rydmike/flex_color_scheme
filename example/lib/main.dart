import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/all_shared_imports.dart';

// -----------------------------------------------------------------------------
// To easily run and try the tutorial examples 1...5 on a device, you can
// copy/paste all their code starting from their void main() function below.
//
// There are also predefined run configurations for VS-Code and IntelliJ/AS.
// -----------------------------------------------------------------------------

/// FlexColorScheme default example.
///
/// This quick guide example shows how you can define a few colors, use
/// [FlexColorScheme] to theme your app with them or use a predefined theme.
/// It also offers a playground you can use to quickly experiment with its
/// quick theming properties and optional opinionated sub-theming.
///
/// Additional it is demonstrated how to use a [GoogleFonts] based font as the
/// default font for your theme, and how to customize your [TextTheme].
///
/// To learn more about how to use FlexColorScheme and all its features,
/// please go through the tutorial examples in the readme documentation.
void main() => runApp(const DemoApp());

// For our custom color scheme we define primary and secondary colors,
// but no variant or other colors.
// ignore: unused_element
final FlexSchemeColor _schemeLight = FlexSchemeColor.from(
  primary: const Color(0xFF3B5997),
  // If you do not want to define secondary, primaryVariant and
  // secondaryVariant, error and appBar colors you do not have to,
  // they will get defined automatically when using the FlexSchemeColor.from()
  // factory. When using FlexSchemeColor.from() you only have to define the
  // primary color, anything nor defined will get derived automatically from
  // the primary color and you get a theme that is based just on shades of
  // the primary color.
  //
  // With the default constructor FlexSchemeColor() you have to define
  // all 4 main color properties required for a complete color scheme. If you
  // do define them all, then prefer using it, as it can be const.
  //
  // Here we do define a secondary color, but if you don't it will get a
  // default shade based on the primary color. When you do define a secondary
  // color but not a secondaryVariant color, it will get derived from the
  // secondary color instead of the primary.
  secondary: const Color(0xFFFB8123),
);

// These are custom defined matching dark mode colors, below we also show
// how to base them of the light color scheme. You can swap in these too in the
// code example further below and compare the result of these manually defined
// matching dark mode colors, to the ones computed via the "lazy" designer
// matching dark colors.
// ignore: unused_element
final FlexSchemeColor _schemeDark = FlexSchemeColor.from(
  primary: const Color(0xFF8B9DC3),
  secondary: const Color(0xFFFCB075),
);

// Use another font as default font for your theme.
final String? _fontFamily = GoogleFonts.lato().fontFamily;

// To use a pre-defined color scheme, don't assign any FlexSchemeColor to
// `colors` instead, just pick a FlexScheme and assign it to the `scheme`.
const FlexScheme _scheme = FlexScheme.blueWhale;

// Define a custom text theme for our app. Here we have decided that
// Headline1 is too big to be useful for us, so we make it a bit smaller.
// We also think buttons should have a bit bigger text, tighter letter spacing,
// and that overline is a bit too small and have weird letter spacing,
// so we change them too.
const TextTheme _textTheme = TextTheme(
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

// FlexColorScheme before version 4.0.0 used the surfaceStyle property to
// define the surface color blend mode, if you are migrating from an earlier
// version, no worries it still works as before.
const FlexSurface _surfaceStyle = FlexSurface.strong;
// However, if you define the new `surfaceMode` property used below, it
// will override any defined `surfaceStyle`.
// The mode `scaffoldSurfaceBackground` equals all the previous `surfaceStyle`
// settings, but its blend level is set separately in finer and more increments
// via `blendLevel`. There are several new surface blend mode strategies in
// version 4.0.0, instead of just one as in previous versions.
const FlexSurfaceMode _surfaceMode = FlexSurfaceMode.equalSurfacesHighScaffold;
const FlexBlendLevel _blendLevel = FlexBlendLevel.ten;

// The `subThemesOptIn` sets weather you want to opt-in or not on additional
// opinionated sub-theming. By default FlexColorScheme as before does very
// little styling on widgets, other than a few important adjustments, described
// in detail in the readme. Using the sub-theme opt-in it now also offers
// easy to sue additional out-of the box opinionated styling of Widgets.
const bool _subThemesOptIn = true;
// The opt-in opinionated sub-theming offers easy to use consistent corner
// radius rounding setting on all sub-themes and a consistent button design.
// It comes with defaults Material3 like rounded defaults, but you can adjust
// its configuration via simple parameters in a passed in configuration class.
const FlexSubThemeConfig _subThemeConfig = FlexSubThemeConfig(
  // Default is 16, but make it whatever you like, even 0.
  cornerRadius: 16,
  // You can override individual corner rounding for each sub-themes from
  // the global `cornerRadius`, let's do that for the PopupMenuButton, it
  // does not look so nice with super big rounding on the menu container.
  cornerRadiusPopupMenuButton: 8,
  cardElevation: 0,
  thickOutlineWidth: 2,
  thinOutlineWidth: 1.5,
  inputDecoratorIsOutlinedBorder: true,
);

// Visual density setting defaults to same as SDK,
// VisualDensity.adaptivePlatformDensity, but you can define a fixed one too
// or use FlexColorScheme.comfortablePlatformDensity.
final VisualDensity _visualDensity =
    VisualDensity.standard; //FlexColorScheme.comfortablePlatformDensity;

// This is just standard `platform` property in `ThemeData` but handy to have as
// a direct property, you can use it to test how things changes on different
// platforms.
final TargetPlatform _platform = defaultTargetPlatform;

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Default Example',
      // Define the light theme for the app, based on defined colors.
      theme: FlexThemeData.light(
        // colors: _schemeLight,
        // Just want to use a built in scheme? Then comment colors above and
        // use scheme below to select a built-in one:
        scheme: _scheme,
        swapColors: false, // To swap your primaries and secondaries, use true.
        //
        // If you provide a color directly it override anything specified by
        // other properties. The priority from lowest to highest order is:
        // 1. scheme 2. colors 3. Individual color values.
        // You can uncomment a color property below to try it:
        // primary: FlexColor.indigo.light.primary,
        // primaryVariant: FlexColor.indigo.light.primaryVariant,
        // secondary: FlexColor.indigo.light.secondary,
        // secondaryVariant: FlexColor.indigo.light.secondaryVariant,
        // surface: FlexColor.lightSurface,
        // background: FlexColor.lightBackground,
        // scaffoldBackground: FlexColor.lightScaffoldBackground,
        // dialogBackground: FlexColor.lightSurface,
        // appBarBackground: FlexColor.indigo.light.primary,
        //
        // To use the previous surfaceStyle mode, don't assign surfaceMode.
        surfaceStyle: _surfaceStyle,
        surfaceMode: _surfaceMode,
        blendLevel: _blendLevel,
        // The default style of AppBar in light mode uses scheme primary color
        // The appBarStyle FlexAppBarStyle.primary, results in this too and is
        // the default. You can choose another themed style, here we use
        // background that also gets active color blend from used surfaceMode.
        appBarStyle: FlexAppBarStyle.primary,
        appBarElevation: 0,
        // If your AppBar is using surface colors, like `appBarStyle`
        // material, surface or background, you may prefer the
        // forBackground style on your TabBar, even if you use it in an AppBar.
        // For a ´primary` appBarStyle or `custom`, use the
        // FlexTabBarStyle.forAppBar style.
        tabBarStyle: FlexTabBarStyle.forAppBar,
        transparentStatusBar: true, // Status bar becomes same color as AppBar.
        tooltipsMatchBackground: false, // False is default, which is inverted.
        fontFamily: _fontFamily, // Default theme font.
        textTheme: _textTheme, // Add custom text themes.
        primaryTextTheme: _textTheme,
        subThemesOptIn: _subThemesOptIn,
        subThemeConfig: _subThemeConfig,
        visualDensity: _visualDensity,
        platform: _platform,
      ),
      // Define the dark theme for the app, based on custom colors.
      darkTheme: FlexThemeData.dark(
        // If you want to base the dark scheme on your light colors, this is
        // a shortcut if you do not want to define your dark theme colors.
        // The whiteBlend for the desaturation of the light theme colors
        // defaults to 35%, you can try other values too, here we use 30.
        // colors: _schemeLight.toDark(20), // Adjust % to change saturation.
        // If you want to use the defined custom dark colors, use it instead:
        // colors: _schemeDark,
        // To use a built in scheme, Don't assign colors above, use scheme.
        scheme: _scheme,
        swapColors: false, // To swap your primaries and secondaries, use true.
        darkIsTrueBlack: false, // For an ink black dark mode, use true.
        // To use the previous surfaceStyle mode, don't assign surfaceMode.
        surfaceStyle: _surfaceStyle,
        surfaceMode: _surfaceMode,
        blendLevel: _blendLevel,
        // The SDK default style of the AppBar in dark mode uses a fixed dark
        // background color defined via surface color. The appBarStyle
        // FlexAppBarStyle.material defines the same color value.
        // You can use another themed style, here we use background that
        // also gets active color blend from used surfaceMode.
        appBarStyle: FlexAppBarStyle.background,
        appBarElevation: 0,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        transparentStatusBar: true,
        tooltipsMatchBackground: true,
        fontFamily: _fontFamily,
        textTheme: _textTheme,
        primaryTextTheme: _textTheme,
        subThemesOptIn: _subThemesOptIn,
        subThemeConfig: _subThemeConfig,
        visualDensity: _visualDensity,
        platform: _platform,
      ),
      themeMode: themeMode,
      home: HomePage(
        themeMode: themeMode,
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
      ),
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
    required this.themeMode,
    required this.onThemeModeChanged,
  }) : super(key: key);

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

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
  void initState() {
    super.initState();
    scrollController =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
                // key: const ValueKey<String>('PageBody'),
                controller: scrollController,
                constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
                child: ListView(
                  controller: scrollController,
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
                    ListTile(
                      title: const Text('Change theme mode'),
                      subtitle: Text('Theme mode '
                          '${widget.themeMode.toString().dotTail}'),
                      trailing: ThemeModeSwitch(
                        themeMode: widget.themeMode,
                        onChanged: widget.onThemeModeChanged,
                      ),
                    ),
                    // Active theme color indicators.
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: App.edgePadding),
                      child: ShowThemeColors(),
                    ),
                    const SizedBox(height: 8),
                    // Open a sub-page
                    Card(
                      child: Column(
                        children: <Widget>[
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
                        ],
                      ),
                    ),
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
