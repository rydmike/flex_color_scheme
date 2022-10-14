import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// SplashPageTwo represents a splash page that uses native full screen mode
/// by using [SystemChrome.setEnabledSystemUIMode].
///
/// It would be nice if it work perfectly, but it only works so, so. Meaning it
/// seems to work on some Android SDK levels, but not all.
class SplashPageTwo extends StatefulWidget {
  /// Default const constructor.
  const SplashPageTwo({
    super.key,
  });

  /// A static convenience function show this screen.
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => const SplashPageTwo(),
      ),
    );
  }

  @override
  State<SplashPageTwo> createState() => _SplashPageTwoState();
}

class _SplashPageTwoState extends State<SplashPageTwo> {
  @override
  void initState() {
    // TODO(rydmike): Test setEnabledSystemUIMode issue and raise Flutter issue.
    // This call should remove the top and bottom UI overlays on Android.
    //
    // For some reason on some newer Android versions, it does not work
    // correctly and in some cases leaves a black ugly bar on top.
    // Happened eg on Pixel 4XL (emulator with Android 11),
    // OnePlus 7T (device with Android 10 & 11), but not on some Android
    // Tablets like Samsung Galaxy Tab A (Android 10), Nexus 7 (Android 6)
    // nor Pixel C (emulator with Android 11).
    //
    // In some cases there is no sad big bar, but the status icons and system
    // navigation bar overlays remained visible, not what we wanted either.
    //
    // Because of the issues with this method, you may want to use the method
    // presented in demo 1b instead. If you see this issue with this method
    // on a device and figure out a way to fix it, please let me know.
    // I would prefer this method for clean screens too, since you
    // can completely remove the status bar and navigation bar with none
    // white/black backgrounds as well.
    //
    // Another thing to be aware of with this method is that eg bringing up
    // the keyboard will bring the navigation bar back, so that is not so nice
    // with it either.
    unawaited(SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: <SystemUiOverlay>[],
    ));
    super.initState();
  }

  @override
  void dispose() {
    // TODO(rydmike): Raise issue in Flutter to request a way to query UiMode.
    // Set the UI overlays back when we dispose this screen.
    // This screen needs to be stateful so we can correctly manage the
    // life-cycle of the removed overlay and putting them back.
    //
    // Another challenge with this approach is that we do not actually know
    // which overlays were in use when we removed them. There is
    // no way to query it, so we could restore the same ones. Best we can do
    // is put them all back. If we control the parent it is not a problem,
    // because then we know and can but back what it had, but if we use this
    // in a package, it is a not possible.
    unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // When using surface blend modes that use strong primary color blends on
    // themed scaffold background color, you will see it on this page as well.
    return Scaffold(
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
                style: theme.textTheme.displayMedium!
                    .copyWith(color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 20),
              const Text('A clean splash screen'),
              const SizedBox(height: 8),
              const Text('No status bar and no navigation bar',
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),
              Text(
                'Tap screen to close',
                style: TextStyle(color: theme.colorScheme.secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
