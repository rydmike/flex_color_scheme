// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';

import '../../../../../shared/const/app.dart';
import '../../../../../shared/controllers/theme_controller.dart';
import '../../../../../shared/utils/link_text_span.dart';
import 'color_palettes_screen.dart';
import 'component_screen.dart';
import 'constants.dart';
import 'elevation_screen.dart';
import 'typography_screen.dart';

class AppExampleMaterial3 extends StatefulWidget {
  const AppExampleMaterial3({super.key, required this.themeController});
  final ThemeController themeController;

  @override
  State<AppExampleMaterial3> createState() => _AppExampleMaterial3State();
}

class _AppExampleMaterial3State extends State<AppExampleMaterial3>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final AnimationController oneTwoController;
  late final CurvedAnimation oneTwoAnimation;
  late final AnimationController railController;
  late final CurvedAnimation railAnimation;
  bool oneTwoControllerInitialized = false;
  bool railControllerInitialized = false;
  bool showMediumSizeLayout = false;
  bool showLargeSizeLayout = false;
  bool showRail = false;

  int screenIndex = ScreenSelected.component.value;

  @override
  void initState() {
    super.initState();
    oneTwoController = AnimationController(
      duration: Duration(milliseconds: kTransitionLength.toInt() * 2),
      value: 0,
      vsync: this,
    );
    oneTwoAnimation = CurvedAnimation(
      parent: oneTwoController,
      curve: const Interval(0.5, 1.0),
    );
    railController = AnimationController(
      duration: Duration(milliseconds: kTransitionLength.toInt() * 2),
      value: 0,
      vsync: this,
    );
    railAnimation = CurvedAnimation(
      parent: railController,
      curve: const Interval(0.5, 1.0),
    );
  }

  @override
  void dispose() {
    oneTwoController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.sizeOf(context).width;
    final AnimationStatus oneTwoStatus = oneTwoController.status;
    final AnimationStatus railStatus = railController.status;
    // Use rail or navigation bar
    if (width > kNarrowScreenWidthThreshold) {
      showRail = true;
      showMediumSizeLayout = false;
      showLargeSizeLayout = false;
      if (railStatus != AnimationStatus.forward &&
          railStatus != AnimationStatus.completed) {
        railController.forward();
      }
    } else {
      showRail = false;
      showMediumSizeLayout = false;
      showLargeSizeLayout = false;
      if (railStatus != AnimationStatus.reverse &&
          railStatus != AnimationStatus.dismissed) {
        railController.reverse();
      }
    }
    if (!railControllerInitialized) {
      railControllerInitialized = true;
      railController.value = width > kNarrowScreenWidthThreshold ? 1 : 0;
    }
    // One or Two colum with rail
    if (width > kMediumWidthBreakpoint) {
      if (width > kLargeWidthBreakpoint) {
        showMediumSizeLayout = false;
        showLargeSizeLayout = true;
      } else {
        showMediumSizeLayout = true;
        showLargeSizeLayout = false;
      }
      if (oneTwoStatus != AnimationStatus.forward &&
          oneTwoStatus != AnimationStatus.completed) {
        oneTwoController.forward();
      }
    } else {
      showMediumSizeLayout = false;
      showLargeSizeLayout = false;
      if (oneTwoStatus != AnimationStatus.reverse &&
          oneTwoStatus != AnimationStatus.dismissed) {
        oneTwoController.reverse();
      }
    }
    if (!oneTwoControllerInitialized) {
      oneTwoControllerInitialized = true;
      oneTwoController.value = width > kMediumWidthBreakpoint ? 1 : 0;
    }
    setState(() {});
  }

  void handleScreenChanged(int screenSelected) {
    setState(() {
      screenIndex = screenSelected;
    });
  }

  Widget createScreenFor(
      ScreenSelected screenSelected, bool showNavBarExample) {
    switch (screenSelected) {
      case ScreenSelected.component:
        return Expanded(
          child: OneTwoTransition(
            animation: oneTwoAnimation,
            one: FirstComponentList(
                showNavBottomBar: showNavBarExample,
                scaffoldKey: scaffoldKey,
                showSecondList: showMediumSizeLayout || showLargeSizeLayout),
            two: SecondComponentList(
                scaffoldKey: scaffoldKey,
                showSecondList: showMediumSizeLayout || showLargeSizeLayout),
          ),
        );
      case ScreenSelected.color:
        return ColorPalettesScreen(themeController: widget.themeController);
      case ScreenSelected.typography:
        return const TypographyScreen();
      case ScreenSelected.elevation:
        return const ElevationScreen();
      // ignore: no_default_cases
      default:
        return FirstComponentList(
            showNavBottomBar: showNavBarExample,
            scaffoldKey: scaffoldKey,
            showSecondList: showMediumSizeLayout || showLargeSizeLayout);
    }
  }

  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: Theme.of(context).useMaterial3
          ? const Text('Material 3')
          : const Text('Material 2'),
      leading: const Material3About(useRootNavigator: false),
      actions: !showRail
          ? <Widget>[
              _BrightnessButton(controller: widget.themeController),
              _Material3Button(controller: widget.themeController),
            ]
          : <Widget>[const SizedBox.shrink()],
    );
  }

  Widget _expandedTrailingActions() => Container(
        constraints: const BoxConstraints.tightFor(width: kRailExpandedWidth),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text('Light'),
                const Spacer(),
                Switch(
                    value: Theme.of(context).brightness == Brightness.light,
                    onChanged: (bool value) {
                      if (value) {
                        widget.themeController.setThemeMode(ThemeMode.light);
                      } else {
                        widget.themeController.setThemeMode(ThemeMode.dark);
                      }
                    })
              ],
            ),
            Row(
              children: <Widget>[
                const Text('Material 3'),
                const Spacer(),
                Switch(
                  value: widget.themeController.useMaterial3,
                  onChanged: widget.themeController.setUseMaterial3,
                )
              ],
            ),
          ],
        ),
      );

  Widget _trailingActions() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: _BrightnessButton(
              controller: widget.themeController,
              showTooltipBelow: false,
            ),
          ),
          Flexible(
            child: _Material3Button(
              controller: widget.themeController,
              showTooltipBelow: false,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: oneTwoController,
      builder: (BuildContext context, Widget? child) {
        return AnimatedBuilder(
            animation: railAnimation,
            builder: (BuildContext context, Widget? child) {
              return NavigationTransition(
                scaffoldKey: scaffoldKey,
                animationController: railController,
                railAnimation: railAnimation,
                appBar: createAppBar(),
                body: createScreenFor(ScreenSelected.values[screenIndex],
                    railController.value == 1),
                navigationRail: NavigationRail(
                  minExtendedWidth: kRailExpandedWidth,
                  extended: showLargeSizeLayout,
                  // The Rail is silly, it does not expand if type is something
                  // else than none, e.g. set via themes.
                  labelType:
                      showLargeSizeLayout ? NavigationRailLabelType.none : null,
                  destinations: navRailDestinations,
                  selectedIndex: screenIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      screenIndex = index;
                      handleScreenChanged(screenIndex);
                    });
                  },
                  trailing: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: showLargeSizeLayout
                          ? _expandedTrailingActions()
                          : _trailingActions(),
                    ),
                  ),
                ),
                navigationBar: NavigationBars(
                  onSelectItem: (int index) {
                    setState(() {
                      screenIndex = index;
                      handleScreenChanged(screenIndex);
                    });
                  },
                  selectedIndex: screenIndex,
                  isExampleBar: false,
                ),
              );
            });
      },
    );
  }
}

class _BrightnessButton extends StatelessWidget {
  const _BrightnessButton({
    this.showTooltipBelow = true,
    required this.controller,
  });
  final bool showTooltipBelow;
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool isBright = Theme.of(context).brightness == Brightness.light;
    return Tooltip(
      preferBelow: showTooltipBelow,
      message: isBright ? 'Set to dark' : 'Set to light',
      child: IconButton(
        icon: isBright
            ? const Icon(Icons.dark_mode_outlined)
            : const Icon(Icons.light_mode_outlined),
        onPressed: () {
          if (isBright) {
            controller.setThemeMode(ThemeMode.dark);
          } else {
            controller.setThemeMode(ThemeMode.light);
          }
        },
      ),
    );
  }
}

class _Material3Button extends StatelessWidget {
  const _Material3Button({
    this.showTooltipBelow = true,
    required this.controller,
  });
  final bool showTooltipBelow;
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    return Tooltip(
      preferBelow: showTooltipBelow,
      message: 'Switch to Material ${useMaterial3 ? 2 : 3}',
      child: IconButton(
          icon: useMaterial3
              ? const Icon(Icons.looks_two_outlined)
              : const Icon(Icons.looks_3_outlined),
          onPressed: () {
            controller.setUseMaterial3(!controller.useMaterial3);
          }),
    );
  }
}

class NavigationTransition extends StatefulWidget {
  const NavigationTransition(
      {super.key,
      required this.scaffoldKey,
      required this.animationController,
      required this.railAnimation,
      required this.navigationRail,
      required this.navigationBar,
      required this.appBar,
      required this.body});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final AnimationController animationController;
  final CurvedAnimation railAnimation;
  final Widget navigationRail;
  final Widget navigationBar;
  final PreferredSizeWidget appBar;
  final Widget body;

  @override
  State<NavigationTransition> createState() => _NavigationTransitionState();
}

class _NavigationTransitionState extends State<NavigationTransition> {
  late final AnimationController controller;
  late final CurvedAnimation railAnimation;
  late final ReverseAnimation barAnimation;
  bool controllerInitialized = false;
  bool showDivider = false;

  @override
  void initState() {
    super.initState();

    controller = widget.animationController;
    railAnimation = widget.railAnimation;

    barAnimation = ReverseAnimation(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      key: widget.scaffoldKey,
      appBar: widget.appBar,
      body: Row(
        children: <Widget>[
          RailTransition(
            animation: railAnimation,
            backgroundColor: colorScheme.surface,
            child: widget.navigationRail,
          ),
          widget.body,
        ],
      ),
      bottomNavigationBar: BarTransition(
        animation: barAnimation,
        backgroundColor: colorScheme.surface,
        child: widget.navigationBar,
      ),
      endDrawer: const NavigationDrawerSection(),
    );
  }
}

final List<NavigationRailDestination> navRailDestinations = appBarDestinations
    .map(
      (NavigationDestination destination) => NavigationRailDestination(
        icon: Tooltip(
          message: destination.label,
          child: destination.icon,
        ),
        selectedIcon: Tooltip(
          message: destination.label,
          child: destination.selectedIcon,
        ),
        label: Text(destination.label),
      ),
    )
    .toList();

class SizeAnimation extends CurvedAnimation {
  SizeAnimation(Animation<double> parent)
      : super(
          parent: parent,
          curve: const Interval(
            0.2,
            0.8,
            curve: Curves.easeInOutCubicEmphasized,
          ),
          reverseCurve: Interval(
            0,
            0.2,
            curve: Curves.easeInOutCubicEmphasized.flipped,
          ),
        );
}

class OffsetAnimation extends CurvedAnimation {
  OffsetAnimation(Animation<double> parent)
      : super(
          parent: parent,
          curve: const Interval(
            0.4,
            1.0,
            curve: Curves.easeInOutCubicEmphasized,
          ),
          reverseCurve: Interval(
            0,
            0.2,
            curve: Curves.easeInOutCubicEmphasized.flipped,
          ),
        );
}

class RailTransition extends StatefulWidget {
  const RailTransition(
      {super.key,
      required this.animation,
      required this.backgroundColor,
      required this.child});

  final Animation<double> animation;
  final Widget child;
  final Color backgroundColor;

  @override
  State<RailTransition> createState() => _RailTransition();
}

class _RailTransition extends State<RailTransition> {
  late Animation<Offset> offsetAnimation;
  late Animation<double> widthAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // The animations are only rebuilt by this method when the text
    // direction changes because this widget only depends on Directionality.
    final bool ltr = Directionality.of(context) == TextDirection.ltr;

    widthAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(SizeAnimation(widget.animation));

    offsetAnimation = Tween<Offset>(
      begin: ltr ? const Offset(-1, 0) : const Offset(1, 0),
      end: Offset.zero,
    ).animate(OffsetAnimation(widget.animation));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: Align(
          alignment: Alignment.topLeft,
          widthFactor: widthAnimation.value,
          child: FractionalTranslation(
            translation: offsetAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class BarTransition extends StatefulWidget {
  const BarTransition(
      {super.key,
      required this.animation,
      required this.backgroundColor,
      required this.child});

  final Animation<double> animation;
  final Color backgroundColor;
  final Widget child;

  @override
  State<BarTransition> createState() => _BarTransition();
}

class _BarTransition extends State<BarTransition> {
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> heightAnimation;

  @override
  void initState() {
    super.initState();

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(OffsetAnimation(widget.animation));

    heightAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(SizeAnimation(widget.animation));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.topLeft,
        heightFactor: heightAnimation.value,
        child: FractionalTranslation(
          translation: offsetAnimation.value,
          child: widget.child,
        ),
      ),
    );
  }
}

class OneTwoTransition extends StatefulWidget {
  const OneTwoTransition({
    super.key,
    required this.animation,
    required this.one,
    required this.two,
  });

  final Animation<double> animation;
  final Widget one;
  final Widget two;

  @override
  State<OneTwoTransition> createState() => _OneTwoTransitionState();
}

class _OneTwoTransitionState extends State<OneTwoTransition> {
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();

    offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(OffsetAnimation(widget.animation));

    widthAnimation = Tween<double>(
      begin: 0,
      end: 1000,
    ).animate(SizeAnimation(widget.animation));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1100,
          child: widget.one,
        ),
        if (widthAnimation.value.toInt() > 0) ...<Widget>[
          Flexible(
            flex: widthAnimation.value.toInt(),
            child: FractionalTranslation(
              translation: offsetAnimation.value,
              child: widget.two,
            ),
          )
        ],
      ],
    );
  }
}

/// An about icon button used on the example's app app bar.
class Material3About extends StatelessWidget {
  const Material3About({super.key, this.useRootNavigator = true});

  /// Use root navigator?
  final bool useRootNavigator;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info),
      onPressed: () {
        showMaterial3AboutDialog(context, useRootNavigator);
      },
    );
  }
}

// This [showAppAboutDialog] function is based on the [AboutDialog] example
// that exist(ed) in the Flutter Gallery App.
void showMaterial3AboutDialog(BuildContext context,
    [bool useRootNavigator = true]) {
  final ThemeData theme = Theme.of(context);
  final TextStyle aboutTextStyle = theme.textTheme.bodyLarge!;
  final TextStyle footerStyle = theme.textTheme.bodySmall!;
  final TextStyle linkStyle =
      theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.primary);

  final Size mediaSize = MediaQuery.sizeOf(context);
  final double width = mediaSize.width;
  final double height = mediaSize.height;

  final Uri sourceLink = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/samples/tree/main/material_3_demo',
  );

  showAboutDialog(
    context: context,
    applicationName: 'Material3 Demo',
    applicationVersion: 'Made for Flutter 3.10',
    useRootNavigator: useRootNavigator,
    applicationIcon: Icon(
      Icons.looks_3_outlined,
      size: 55,
      color: theme.colorScheme.primary,
    ),
    applicationLegalese: '© 2021-2023 The Flutter Team\nBSD-style license.',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: aboutTextStyle,
                text: 'This is a slightly modified version of the '
                    'official Material 3 demo app found in ',
              ),
              LinkTextSpan(
                style: linkStyle,
                uri: sourceLink,
                text: 'flutter/samples',
              ),
              TextSpan(
                style: aboutTextStyle,
                text: '. It is included here to show the configured theme '
                    'using the official Material 3 sample app.\n\n',
              ),
              TextSpan(
                style: footerStyle,
                text: 'Built with Flutter ${App.flutterVersion}, '
                    'using ${App.packageName} '
                    '${App.packageVersion}\n'
                    'Media size (w:${width.toStringAsFixed(0)}, '
                    'h:${height.toStringAsFixed(0)})\n\n',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
