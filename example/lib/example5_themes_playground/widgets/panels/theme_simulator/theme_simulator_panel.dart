import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/app_scroll_behavior.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../theme/flex_theme_dark.dart';
import '../../../theme/flex_theme_light.dart';
import '../../../theme/theme_data_dark.dart';
import '../../../theme/theme_data_light.dart';
import '../../../theme/theme_values.dart';
import 'app_example_components.dart';
import 'app_example_login.dart';
import 'app_example_material3/app_example_material3.dart';
import 'app_example_shop.dart';
import 'app_example_undraw.dart';

/// A mock device simulator that show what an app using the active
/// theme will look like.
class ThemeSimulatorPanel extends StatefulWidget {
  const ThemeSimulatorPanel({required this.controller, super.key});

  final ThemeController controller;

  @override
  State<ThemeSimulatorPanel> createState() => _ThemeSimulatorPanelState();
}

class _ThemeSimulatorPanelState extends State<ThemeSimulatorPanel>
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
    final SimDevice di = SimulatorPopupMenu.devices[phoneIndex];
    final double resWidth = di.info.screenSize.width * di.info.pixelRatio;
    final double resHeight = di.info.screenSize.height * di.info.pixelRatio;
    return 'Device pixels ${di.info.screenSize.width.toStringAsFixed(0)}x'
        '${di.info.screenSize.height.toStringAsFixed(0)}  '
        'Screen resolution ${resWidth.toStringAsFixed(0)}x'
        '${resHeight.toStringAsFixed(0)}  '
        'Pixel ratio ${di.info.pixelRatio.toStringAsFixed(2)}';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabController.index = widget.controller.simulatorAppIndex;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color iconColor = theme.colorScheme.primary;

    return ScrollConfiguration(
      behavior: const DragScrollBehavior(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 34,
              child: TabBar(
                tabAlignment: TabAlignment.fill,
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
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SimulatorPopupMenu(
                    index: device,
                    onChanged: (int index) {
                      setState(() {
                        device = index;
                        widget.controller.setSimulatorDeviceIndex(device);
                      });
                    },
                    child: ListTileReveal(
                      contentPadding: ThemeValues.tilePaddingStart(context),
                      dense: true,
                      leading: IconButton(
                        icon: AnimatedRotation(
                          turns: turns,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.screen_rotation_outlined,
                            color: theme.colorScheme.primary,
                            size: 30,
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
                      title: Text('${SimulatorPopupMenu.devices[device].name} ('
                          // ignore: lines_longer_than_80_chars
                          '${SimulatorPopupMenu.devices[device].info.identifier.platform.name})'),
                      subtitleReveal: Text('${_phoneInfo(device)}\n'),
                      trailing: Icon(
                        SimulatorPopupMenu.devices[device].icon,
                        size: SimulatorPopupMenu.devices[device].size,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Padding(
                  padding: EdgeInsets.only(top: 14.0),
                  child: Text('Zoom'),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    min: 400,
                    max: 1600,
                    divisions: 100,
                    label:
                        widget.controller.simulatorViewZoom.toStringAsFixed(0),
                    value: widget.controller.simulatorViewZoom,
                    onChanged: widget.controller.setSimulatorViewZoom,
                  ),
                ),
              ],
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              elevation: 0,
              color: theme.colorScheme.surfaceContainerHighest,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: widget.controller.simulatorViewZoom,
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
      device: SimulatorPopupMenu.devices[device].info,
      orientation: orientation,
      screen: Builder(
        builder: (BuildContext deviceContext) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // The simulator app uses the same theme definition directly.
          // Instead of using it via inherited theme.of(context). This a bit
          // more costly, since now the new theme is computed twice. The
          // advantage is that its change happens at the same time as the main
          // app theme changes, and not after it has concluded its change. This
          // feels "faster", or more concurrent and imo offers better UX for
          // this use case.
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
class SimulatorPopupMenu extends StatelessWidget {
  const SimulatorPopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.child,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? child;

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
      popUpAnimationStyle: AnimationStyle.noAnimation,
      position: PopupMenuPosition.under,
      offset: const Offset(0, -2),
      constraints: const BoxConstraints(maxHeight: 600),
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
      child: child,
    );
  }
}
