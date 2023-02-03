import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../../controllers/theme_controller.dart';
import 'app_example_home.dart';

/// An example that show what an app using the theme might look like
class AppExample extends StatelessWidget {
  const AppExample({this.controller, super.key});

  final ThemeController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Simulated themed app on a device'),
          subtitle: Text('Selected a device and see the active theme style on '
              'mock application.'),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: const <Widget>[
            AppExampleFrame(child: AppExampleHome()),
            AppExampleFrame(child: AppExampleHome()),
            AppExampleFrame(child: AppExampleHome()),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class AppExampleFrame extends StatelessWidget {
  const AppExampleFrame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: DeviceFrame(
        device: Devices.ios.iPhone13ProMax,
        orientation: Orientation.portrait,
        screen: Builder(
          builder: (BuildContext deviceContext) => MaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            theme: Theme.of(context),
            home: child,
          ),
        ),
      ),
    );
  }
}
