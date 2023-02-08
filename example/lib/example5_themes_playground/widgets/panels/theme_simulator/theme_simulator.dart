import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import 'app_example_chat.dart';
import 'app_example_login.dart';
import 'app_example_shop.dart';

/// An example that show what an app using the theme might look like
class ThemeSimulator extends StatelessWidget {
  const ThemeSimulator({required this.controller, super.key});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Themed app simulated on a device'),
          subtitle: Text('Select device device: iPhone 13 Max Pro'),
        ),
        ListTile(
          title: const Text('Device size'),
          subtitle: Slider(
            min: 200,
            max: 600,
            divisions: 100,
            label: controller.deviceSize.toStringAsFixed(0),
            value: controller.deviceSize,
            onChanged: controller.setDeviceSize,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WIDTH',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '${controller.deviceSize.toStringAsFixed(0)} dp',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: <Widget>[
            SimulatorFrame(
              width: controller.deviceSize,
              child: const AppExampleLogin(),
            ),
            SimulatorFrame(
              width: controller.deviceSize,
              child: const AppExampleShop(),
            ),
            SimulatorFrame(
              width: controller.deviceSize,
              child: AppExampleChat(controller: controller),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class SimulatorFrame extends StatelessWidget {
  const SimulatorFrame({super.key, required this.child, required this.width});

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
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
