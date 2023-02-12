import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/app_scroll_behavior.dart';
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
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    device = widget.controller.simulatorDeviceIndex;
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
    final DeviceInfo di = SelectDevice.devices[phoneIndex];
    final double resWidth = di.screenSize.width * di.pixelRatio;
    final double resHeight = di.screenSize.height * di.pixelRatio;
    return 'Device pixels ${di.screenSize.width.toStringAsFixed(0)}x'
        '${di.screenSize.height.toStringAsFixed(0)}  '
        'Screen resolution ${resWidth.toStringAsFixed(0)}x'
        '${resHeight.toStringAsFixed(0)}  '
        'Pixel ratio ${di.pixelRatio.toStringAsFixed(2)}';
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
                  Tab(text: 'Components'),
                  Tab(text: 'Login'),
                  Tab(text: 'Shop'),
                  Tab(text: 'Material'),
                  Tab(text: 'Undraw'),
                ],
              ),
            ),
            ListTile(
              title: Text('${SelectDevice.devices[device].name} '
                  '(${SelectDevice.devices[device].identifier.platform.name})'),
              subtitle: Text(_phoneInfo(device)),
              trailing: SelectDevice(
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
              max: 1400,
              divisions: 100,
              label: widget.controller.deviceSize.toStringAsFixed(0),
              value: widget.controller.deviceSize,
              onChanged: widget.controller.setDeviceSize,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: widget.controller.deviceSize,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    SimulatorFrame(
                      device: device,
                      child:
                          AppExampleComponents(controller: widget.controller),
                    ),
                    SimulatorFrame(
                      device: device,
                      child: const AppExampleLogin(),
                    ),
                    SimulatorFrame(
                      device: device,
                      child: const AppExampleShop(),
                    ),
                    SimulatorFrame(
                      device: device,
                      child: const AppExampleMaterial3(),
                    ),
                    SimulatorFrame(
                      device: device,
                      child: AppExampleUndraw(controller: widget.controller),
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
          ]),
    );
  }
}

class SimulatorFrame extends StatelessWidget {
  const SimulatorFrame({
    super.key,
    required this.device,
    required this.child,
  });
  final int device;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DeviceFrame(
      device: SelectDevice.devices[device],
      orientation: Orientation.portrait,
      screen: Builder(
        builder: (BuildContext deviceContext) => MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: Theme.of(context),
          home: child,
        ),
      ),
    );
  }
}

/// Widget used to select used simulation device.
class SelectDevice extends StatelessWidget {
  const SelectDevice({
    super.key,
    required this.index,
    this.onChanged,
  });
  final int index;
  final ValueChanged<int>? onChanged;

  static List<DeviceInfo> devices = <DeviceInfo>[
    Devices.ios.iPhone13ProMax,
    Devices.ios.iPhone13,
    Devices.ios.iPhone13Mini,
    Devices.ios.iPhone12ProMax,
    Devices.ios.iPhone12Mini,
    Devices.ios.iPhoneSE,
    //
    Devices.android.samsungGalaxyNote20Ultra,
    Devices.android.samsungGalaxyNote20,
    Devices.android.samsungGalaxyS20,
    Devices.android.samsungGalaxyA50,
    Devices.android.onePlus8Pro,
    Devices.android.sonyXperia1II,
    Devices.android.bigPhone,
    Devices.android.mediumPhone,
    Devices.android.smallPhone,
    //
    Devices.ios.iPad,
    Devices.ios.iPadAir4,
    Devices.ios.iPadPro11Inches,
    Devices.ios.iPad12InchesGen4,
    //
    Devices.android.smallTablet,
    Devices.android.mediumTablet,
    Devices.android.largeTablet,
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
                      Icons.phone_iphone,
                      color: iconColor,
                    )
                  : Icon(
                      Icons.phone_iphone,
                      color: unselectedIconColor,
                    ),
              title: Text(devices[i].name, style: txtStyle),
            ),
          )
      ],
      icon: Icon(
        Icons.phone_iphone,
        color: iconColor,
      ),
    );
  }
}
