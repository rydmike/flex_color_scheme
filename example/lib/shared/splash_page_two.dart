import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// SplashPage represents the splash page
class SplashPageTwo extends StatefulWidget {
  /// Default const constructor.
  const SplashPageTwo({
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
            SplashPageTwo(invertStatusIcons: invisibleStatusIcons),
      ),
    );
  }

  @override
  _SplashPageTwoState createState() => _SplashPageTwoState();
}

class _SplashPageTwoState extends State<SplashPageTwo> {
  @override
  void initState() {
    //
    // This call will remove to top and bottom UI overlays.
    //
    // For some reason on some newer Android versions, it does not work
    // correctly and leaves a black ugly bar on top. Happens eg on Pixel 4XL
    // (emulator with Android 11), OnePlus 7T (device with Android 10), but not
    // on some Android Tablets Samsung Galaxy Tab A (device with Android 10),
    // Nexus 7 (device with Android 6) nor Pixel C (emulator with Android 11).
    //
    // Because of this issue with this method, you may want to use the method
    // presented a demo 1b instead. If you see this issue with this method
    // on a device and figure out a way to fix it, please let me know.
    // I would prefer this method for clean screens too, since you
    // can completely remove the status bar and navigation bar and use none
    // white/black backgrounds as well.
    //
    // Another thing to be aware of with this method is that eg bringing up
    // the keyboard will bring the navigation bar back.
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
    super.initState();
  }

  @override
  void dispose() {
    //
    // Set the UI overlays back when we dispose this screen.
    //
    // This screen needs to be stateful so we can correctly manage the
    // life-cycle of the removed overlay and putting them back.
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // This splash page sets scaffold background to color scheme background,
    // thus if we have used primary color surface and background branding
    // (blending) in FlexColorScheme, it will included a hint of the
    // primary color. This is just done in this example to show that
    // this way we can use a colored background.
    //
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // This make system navigation bar theme background color, since we use
      // that in this example for the scaffold background as well, it should
      // match nicely if it pops up back up at some point while this screen is
      // used, eg via keyboard activation.
      value: FlexColorScheme.themedSystemNavigationBar(context, noAppBar: true),
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        resizeToAvoidBottomInset: true,
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
                const Text('No status bar and no navigation bar',
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
