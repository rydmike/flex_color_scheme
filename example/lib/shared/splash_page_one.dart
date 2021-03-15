import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// SplashPageOne splash example page.
class SplashPageOne extends StatelessWidget {
  /// Default const constructor.
  const SplashPageOne({
    Key? key,
    this.invertStatusIcons = false,
  }) : super(key: key);

  final bool invertStatusIcons;

  /// A static convenience function show this screen.
  static Future<void> show(
      BuildContext context, bool invisibleStatusIcons) async {
    await Navigator.of(context).push(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) =>
            SplashPageOne(invertStatusIcons: invisibleStatusIcons),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    // This splash page sets scaffold background to white in light theme and
    // to black in dark mode AND does the same via the annotated region for
    // the system navigation bar, make it match the color.
    // It also set noAppBar to true, making its scrim transparent in Android.
    // This setup should only be used when the Scaffold has no app bar, like
    // here. This is a setup for the Splash page demo 1a in Example 5.
    // When invertStatusIcons is set to true we get demo 1b in Example 5.
    // This inverts the colors of the status bar icons making them invisible,
    // BUT only if the background is white in light theme mode and black in
    // dark theme mode, both are usable for splash and onboarding flows.
    //
    // This setup is an alternative way to produce a clean splash page, the
    // other more standard way is presented with SplashPageTwo.
    //
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavigationBarColor: isLight ? Colors.white : Colors.black,
        noAppBar: true,
        invertStatusIcons: invertStatusIcons,
      ),
      child: Scaffold(
        backgroundColor: isLight ? Colors.white : Colors.black,
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Splash!',
                  style: theme.textTheme.headline2!
                      .copyWith(color: theme.colorScheme.primary),
                ),
                const SizedBox(height: 20),
                const Text('A clean splash screen'),
                const SizedBox(height: 8),
                if (invertStatusIcons)
                  const Text('No status bar scrim and inverted status icons',
                      textAlign: TextAlign.center)
                else
                  const Text('No status bar scrim and normal status icons',
                      textAlign: TextAlign.center),
                const SizedBox(height: 30),
                Text('Tap screen to close',
                    style: TextStyle(color: theme.colorScheme.secondary)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
