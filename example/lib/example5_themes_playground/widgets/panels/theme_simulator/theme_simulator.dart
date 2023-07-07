import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/app_scroll_behavior.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../theme/flex_theme_dark.dart';
import '../../../theme/flex_theme_light.dart';
import '../../../theme/theme_data_dark.dart';
import '../../../theme/theme_data_light.dart';
import 'app_example_components.dart';
import 'app_example_login.dart';
import 'app_example_material3/app_example_material3.dart';
import 'app_example_shop.dart';
import 'app_example_undraw.dart';

/// An example that show what an app using the theme might look like
class ThemeSimulator extends StatefulWidget {
  const ThemeSimulator({required this.controller, super.key});

  final ThemeController controller;

  @override
  State<ThemeSimulator> createState() => _ThemeSimulatorState();
}

class _ThemeSimulatorState extends State<ThemeSimulator>
    with TickerProviderStateMixin {
  late int currentPage;
  late int device;
  late Orientation orientation;
  late double turns;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    device = widget.controller.simulatorDeviceIndex;
    orientation = Orientation.portrait;
    turns = 1 / 8;
    currentPage = widget.controller.simulatorAppIndex;
    tabController = TabController(
      initialIndex: currentPage,
      length: 5,
      vsync: this,
    );
    // Update stored page info also if swiped to new page.
    tabController.addListener(() {
      if (tabController.index != currentPage) {
        currentPage = tabController.index;
        widget.controller.setSimulatorAppIndex(currentPage);
      }
    });
  }

  String _phoneInfo(int phoneIndex) {
    final SimDevice di = Simulator.devices[phoneIndex];
    final double resWidth = di.info.screenSize.width * di.info.pixelRatio;
    final double resHeight = di.info.screenSize.height * di.info.pixelRatio;
    return 'Device pixels ${di.info.screenSize.width.toStringAsFixed(0)}x'
        '${di.info.screenSize.height.toStringAsFixed(0)}  '
        'Screen resolution ${resWidth.toStringAsFixed(0)}x'
        '${resHeight.toStringAsFixed(0)}  '
        'Pixel ratio ${di.info.pixelRatio.toStringAsFixed(2)}';
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ScrollConfiguration(
      behavior: const DragScrollBehavior(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 45,
              child: TabBar(
                indicatorColor: theme.colorScheme.primary,
                labelColor: theme.colorScheme.primary,
                unselectedLabelColor: theme.colorScheme.onSurface,
                controller: tabController,
                onTap: (int newPage) {
                  setState(() {
                    currentPage = newPage;
                    widget.controller.setSimulatorAppIndex(currentPage);
                  });
                },
                tabs: const <Widget>[
                  Tab(text: 'Widgets'),
                  Tab(text: 'Material'),
                  Tab(text: 'Login'),
                  Tab(text: 'Shop'),
                  Tab(text: 'Undraw'),
                ],
              ),
            ),
            ListTileReveal(
              leading: IconButton(
                icon: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.screen_rotation_outlined,
                    color: theme.colorScheme.primary,
                    size: 36,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (orientation == Orientation.portrait) {
                      orientation = Orientation.landscape;
                      turns = 3 / 8;
                    } else {
                      orientation = Orientation.portrait;
                      turns = 1 / 8;
                    }
                  });
                },
              ),
              title: Text('${Simulator.devices[device].name} ('
                  '${Simulator.devices[device].info.identifier.platform.name}'
                  ')'),
              subtitleDense: true,
              subtitle: Text('${_phoneInfo(device)}\n'),
              trailing: Simulator(
                index: device,
                onChanged: (int index) {
                  setState(() {
                    device = index;
                    widget.controller.setSimulatorDeviceIndex(device);
                  });
                },
              ),
            ),
            Slider(
              min: 400,
              max: 1600,
              divisions: 100,
              label: widget.controller.deviceSize.toStringAsFixed(0),
              value: widget.controller.deviceSize,
              onChanged: widget.controller.setDeviceSize,
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              elevation: 0,
              color: theme.colorScheme.surfaceVariant,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: widget.controller.deviceSize,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      SimulatorFrame(
                        controller: widget.controller,
                        device: device,
                        orientation: orientation,
                        child:
                            AppExampleComponents(controller: widget.controller),
                      ),
                      SimulatorFrame(
                        controller: widget.controller,
                        device: device,
                        orientation: orientation,
                        child: AppExampleMaterial3(
                            themeController: widget.controller),
                      ),
                      SimulatorFrame(
                        controller: widget.controller,
                        device: device,
                        orientation: orientation,
                        child: const AppExampleLogin(),
                      ),
                      SimulatorFrame(
                        controller: widget.controller,
                        device: device,
                        orientation: orientation,
                        child: const AppExampleShop(),
                      ),
                      SimulatorFrame(
                        controller: widget.controller,
                        device: device,
                        orientation: orientation,
                        child: AppExampleUndraw(controller: widget.controller),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}

class SimulatorFrame extends StatelessWidget {
  const SimulatorFrame({
    super.key,
    required this.controller,
    required this.device,
    required this.orientation,
    required this.child,
  });
  final ThemeController controller;
  final int device;
  final Orientation orientation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DeviceFrame(
      device: Simulator.devices[device].info,
      orientation: orientation,
      screen: Builder(
        builder: (BuildContext deviceContext) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // TODO(rydmike): Experiment, simulator app uses theme directly.
          // Instead of theming simulator via inherited theme.of(context), let
          // us try this version where use same theme function as the main app.
          // It will be more costly, since now new theme is computed twice, but
          // the advantage is that its change happens at the same time as main
          // app theme changes, and not after it has concluded its change. This
          // feels "faster", or more concurrent and imo offers better UX.
          theme: controller.useFlexColorScheme
              ? flexThemeLight(controller)
              : themeDataLight(controller),
          darkTheme: controller.useFlexColorScheme
              ? flexThemeDark(controller)
              : themeDataDark(controller),
          // Use the dark or light theme based on controller setting.
          themeMode: controller.themeMode,
          home: child,
        ),
      ),
    );
  }
}

// Simulator device, we add some more to DeviceInfo so we can get better name
// and icons.
class SimDevice {
  const SimDevice({
    String? name,
    this.icon = Icons.phone_iphone,
    this.size = 24,
    required this.info,
  }) : _name = name;

  final String? _name;
  final IconData icon;
  final double size;
  final DeviceInfo info;

  String get name => _name ?? info.name;
}

/// Widget used to select used simulation device.
class Simulator extends StatelessWidget {
  const Simulator({
    super.key,
    required this.index,
    this.onChanged,
  });
  final int index;
  final ValueChanged<int>? onChanged;

  static List<SimDevice> devices = <SimDevice>[
    //
    // iPhones here
    SimDevice(
      info: Devices.ios.iPhone13ProMax,
      size: 30,
    ),
    SimDevice(
      info: Devices.ios.iPhone13,
      size: 26,
    ),
    SimDevice(
      info: Devices.ios.iPhone13Mini,
      size: 22,
    ),
    SimDevice(
      info: Devices.ios.iPhone12ProMax,
      size: 30,
    ),
    SimDevice(
      info: Devices.ios.iPhone12Mini,
      size: 22,
    ),
    SimDevice(
      info: Devices.ios.iPhoneSE,
      size: 20,
    ),
    //
    // iPads here
    SimDevice(
      info: Devices.ios.iPad,
      icon: Icons.tablet_mac_outlined,
      size: 28,
    ),
    SimDevice(
      info: Devices.ios.iPadAir4,
      icon: Icons.tablet_mac_outlined,
      size: 30,
    ),
    SimDevice(
      info: Devices.ios.iPadPro11Inches,
      icon: Icons.tablet_mac_outlined,
      size: 32,
    ),
    SimDevice(
      info: Devices.ios.iPad12InchesGen4,
      icon: Icons.tablet_mac_outlined,
      size: 36,
    ),
    //
    // Android brands here
    SimDevice(
      info: Devices.android.samsungGalaxyNote20Ultra,
      icon: Icons.smartphone_outlined,
      size: 30,
    ),
    SimDevice(
      info: Devices.android.samsungGalaxyNote20,
      icon: Icons.smartphone_outlined,
      size: 28,
    ),
    SimDevice(
      info: Devices.android.samsungGalaxyS20,
      icon: Icons.smartphone_outlined,
      size: 26,
    ),
    SimDevice(
      info: Devices.android.samsungGalaxyA50,
      icon: Icons.smartphone_outlined,
      size: 28,
    ),
    SimDevice(
      info: Devices.android.onePlus8Pro,
      icon: Icons.smartphone_outlined,
      size: 26,
    ),
    SimDevice(
      info: Devices.android.sonyXperia1II,
      icon: Icons.smartphone_outlined,
      size: 30,
    ),
    //
    // Android generic phones.
    SimDevice(
      info: Devices.android.bigPhone,
      icon: Icons.phone_android_outlined,
      name: 'Big Android phone',
      size: 30,
    ),
    SimDevice(
      info: Devices.android.mediumPhone,
      icon: Icons.phone_android_outlined,
      name: 'Medium Android phone',
      size: 26,
    ),
    SimDevice(
      info: Devices.android.smallPhone,
      icon: Icons.phone_android_outlined,
      name: 'Small Android phone',
      size: 22,
    ),
    //
    // Android generic tablets
    SimDevice(
      info: Devices.android.smallTablet,
      icon: Icons.tablet_android_outlined,
      name: 'Small Android tablet',
      size: 28,
    ),
    SimDevice(
      info: Devices.android.mediumTablet,
      icon: Icons.tablet_android_outlined,
      name: 'Medium Android tablet',
      size: 32,
    ),
    SimDevice(
      info: Devices.android.largeTablet,
      icon: Icons.tablet_android_outlined,
      name: 'Big Android tablet',
      size: 34,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final Color iconColor = scheme.primary;
    final Color unselectedIconColor = scheme.onSurface;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;
    return PopupMenuButton<int>(
        initialValue: index,
        tooltip: '',
        padding: EdgeInsets.zero,
        onSelected: (int index) {
          onChanged?.call(index);
        },
        splashRadius: 36,
        enabled: enabled,
        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
              for (int i = 0; i < devices.length; i++)
                PopupMenuItem<int>(
                  value: i,
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: index == i
                        ? Icon(
                            devices[i].icon,
                            size: devices[i].size,
                            color: iconColor,
                          )
                        : Icon(
                            devices[i].icon,
                            size: devices[i].size,
                            color: unselectedIconColor,
                          ),
                    title: Text(devices[i].name, style: txtStyle),
                  ),
                )
            ],
        icon: Icon(
          devices[index].icon,
          size: devices[index].size,
          color: iconColor,
        ));
  }
}
