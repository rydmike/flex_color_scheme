import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/const/app_images.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/app_scroll_behavior.dart';
import '../../../../shared/utils/breakpoint.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/utils/random_color.dart';
import '../../../../shared/widgets/universal/svg_asset_image.dart';
import '../../../../shared/widgets/universal/svg_asset_image_switcher.dart';
import '../../shared/theme_mode_switch_list_tile.dart';

/// An example that show what an app using the theme might look like
class AppExampleUndraw extends StatefulWidget {
  const AppExampleUndraw({super.key, required this.controller});

  final ThemeController controller;

  @override
  State<AppExampleUndraw> createState() => _AppExampleUndrawState();
}

class _AppExampleUndrawState extends State<AppExampleUndraw> {
  static const int _maxTiles = 500;
  late List<MaterialColor> imageColors;

  @override
  void initState() {
    super.initState();
    // Generate a random image color data list that we will build widgets from.
    // We generate this data list in the stateful widget's init class because
    // we want its colors to remain static as long as the page is not rebuilt.
    // So we will get a new random colored image list, but only every time
    // we rebuild the screen, not as we scroll it back and forth or rescale it,
    // that could be done too, but it feels a bit too random.
    imageColors = List<MaterialColor>.generate(
        _maxTiles, (int index) => RandomColor().randomMaterialColor());
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets safeArea = MediaQuery.viewPaddingOf(context);

    return ScrollConfiguration(
      behavior: const DragScrollBehavior(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          title: const Text('Undraw'),
          actions: const <Widget>[UndrawAbout(useRootNavigator: false)],
        ),
        drawer: AppExampleDrawer(controller: widget.controller),
        bottomNavigationBar: const AppExampleNavigationBar(),
        body: SafeArea(
          top: false,
          bottom: false,
          child: BreakpointBuilder(
            type: BreakType.large,
            builder: (BuildContext context, Breakpoint breakpoint) {
              return CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsetsDirectional.only(
                      top: 16 + safeArea.top + kToolbarHeight,
                      start: 16,
                      end: 16,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          const PageHeader(
                            icon: Icon(Icons.local_florist_outlined),
                            heading: Text('Undraw Images'),
                          ),
                          const Divider(),
                          const PageIntro(
                            introTop: Text(
                              'This demo shows Undraw SVG images '
                              'in a grid and then randomly '
                              'animates in a new one.\n'
                              '\n'
                              'Each image has its own random wait before it '
                              'switches and also a random switch animation '
                              'time. Each time the screen is built, every '
                              'image box gets a new random colored border, '
                              'with good contrast in light theme mode and a '
                              'less saturated version of same color in dark '
                              'mode.\n',
                            ),
                            introBottom: Text(
                              'Each image is colored dynamically to match '
                              'the color of its border. This is done by '
                              'changing a color text string in the image SVG '
                              'file. This demo is mostly a stress test for '
                              'Flutter, especially for Web builds. '
                              'We could make the grid of switching images '
                              'infinite, but this demo stops at $_maxTiles '
                              'images in the grid.\n',
                            ),
                            imageAssets: AppImages.undraw,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsetsDirectional.only(
                        start: 16, end: 16, bottom: 90 + safeArea.bottom),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: breakpoint.columns ~/ 2,
                        mainAxisSpacing: breakpoint.gutters / 2,
                        crossAxisSpacing: breakpoint.gutters / 2,
                        childAspectRatio: 1.4,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext ctx, int index) {
                          return RandomImageWidget(
                            imageColor: imageColors[index],
                            borderWidth: breakpoint.columns.toDouble() / 2 + 4,
                          );
                        },
                        childCount: imageColors.length,
                      ),
                    ),
                  )
                ],
              );
            },
            // ),
          ),
        ),
      ),
    );
  }
}

// Show a random image from the list of all the SVG images we have in our
// constant AppImages.allImages list.
// Not only will we randomly show an image from the list, the display time
// until we shift in a new image is randomized a bit as is the switch
// animation transition time.
// After a theme change the next shown random image will be themed in the color
// hue that is more suitable for the theme mode.
class RandomImageWidget extends StatelessWidget {
  const RandomImageWidget({
    super.key,
    required this.imageColor,
    this.borderRadius,
    this.borderWidth = 10.0,
  });

  final MaterialColor imageColor;
  // Defaults to theme radius of Card if not defined.
  final double? borderRadius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isLight = theme.brightness == Brightness.light;
    final Random random = Random();

    // Default starting point value based on M3 and M2 mode spec values
    double radius = useMaterial3 ? 12 : 4;
    if (borderRadius == null) {
      // Is themed? Get the radius from the theme and used it, if it was.
      final ShapeBorder? cardShape = theme.cardTheme.shape;
      if (cardShape != null && cardShape is RoundedRectangleBorder) {
        final BorderRadius shape = cardShape.borderRadius as BorderRadius;
        radius = shape.bottomLeft.x;
      }
    } else {
      // If a passed value was used we use that
      radius = borderRadius!;
    }
    return Card(
      color: theme.colorScheme.onInverseSurface,
      shadowColor: Colors.transparent,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: isLight ? imageColor[700]! : imageColor[200]!,
            width: borderWidth),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: SvgAssetImageSwitcher(
        assetNames: AppImages.allImages,
        color: isLight ? imageColor[700]! : imageColor[400]!,
        padding: EdgeInsets.all(borderWidth * 4),
        fit: BoxFit.contain,
        switchType: ImageSwitchType.random,
        showDuration: Duration(milliseconds: 2000 + random.nextInt(2000)),
        switchDuration: Duration(milliseconds: 200 + random.nextInt(250)),
      ),
    );
  }
}

class AppExampleDrawer extends StatefulWidget {
  const AppExampleDrawer({super.key, required this.controller});

  final ThemeController controller;

  @override
  State<AppExampleDrawer> createState() => _AppExampleDrawerState();
}

class _AppExampleDrawerState extends State<AppExampleDrawer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: NavigationDrawer(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int value) {
          setState(() {
            selectedIndex = value;
          });
        },
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundColor: theme.colorScheme.secondaryContainer,
            child: SvgAssetImage(
              assetName: AppImages.nature,
              color: theme.colorScheme.secondary,
            ),
          ),
          Center(
            child: Text(
              'Undraw',
              style: textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 16),
          ThemeModeSwitchListTile(controller: widget.controller),
          const Divider(),
          const NavigationDrawerDestination(
            icon: Icon(Icons.image),
            label: Text('Images'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.beenhere),
            label: Text('Notifications'),
          ),
          const NavigationDrawerDestination(
            icon: Badge(
              label: Text('12'),
              child: Icon(Icons.chat_bubble),
            ),
            label: Text('Chat'),
          ),
          const Divider(),
          const NavigationDrawerDestination(
            icon: Icon(Icons.logout),
            label: Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class AppExampleNavigationBar extends StatefulWidget {
  const AppExampleNavigationBar({super.key});

  @override
  State<AppExampleNavigationBar> createState() =>
      _AppExampleNavigationBarState();
}

class _AppExampleNavigationBarState extends State<AppExampleNavigationBar> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: buttonIndex,
      onDestinationSelected: (int value) {
        setState(() {
          buttonIndex = value;
        });
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.image),
          label: 'Images',
        ),
        NavigationDestination(
          icon: Icon(Icons.beenhere),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('12'),
            child: Icon(Icons.chat_bubble),
          ),
          label: 'Chat',
        ),
      ],
    );
  }
}

// A page header widget that is used in this demo to show the value of the
// selected destination returned by Flexfold onDestination. Used only for
// demo purposes in the example application.
class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.icon,
    required this.heading,
  });

  final Widget icon;
  final Widget heading;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: IconTheme(
            data: IconThemeData(
              size: 35,
              color: theme.colorScheme.primary,
            ),
            child: icon,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: DefaultTextStyle(
            style: theme.textTheme.headlineMedium!,
            child: heading,
          ),
        ),
      ],
    );
  }
}

// A page intro class that uses a responsive layout to change the layout
// of the intro text and page related image(s) on a large canvas and phone
// sized layouts.
class PageIntro extends StatelessWidget {
  const PageIntro({
    super.key,
    this.introTop,
    this.introBottom,
    required this.imageAssets,
  });
  final Widget? introTop;
  final Widget? introBottom;
  final List<String> imageAssets;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Widget styledIntroTop = DefaultTextStyle(
      style: theme.textTheme.bodyLarge!,
      child: introTop ?? const Text(''),
    );
    final Widget styledIntroBottom = DefaultTextStyle(
      style: theme.textTheme.bodyLarge!,
      child: introBottom ?? const Text(''),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints size) {
          if (size.maxWidth < 600) {
            // PHONE: Small canvas, layout out all in one column
            return Column(
              children: <Widget>[
                if (introTop != null) styledIntroTop,
                _imageSwitcher(context),
                if (introBottom != null) styledIntroBottom,
              ],
            );
          } else {
            // TABLET/DESKTOP: Larger canvas uses a column with a row in it
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (introTop != null)
                      Flexible(
                        flex: 3,
                        child: styledIntroTop,
                      ),
                    Flexible(flex: 2, child: _imageSwitcher(context)),
                  ],
                ),
                if (introBottom != null) styledIntroBottom,
              ],
            );
          }
        },
      ),
    );
  }

  Widget _imageSwitcher(BuildContext context) {
    return SvgAssetImageSwitcher(
      assetNames: imageAssets,
      color: Theme.of(context).colorScheme.primary,
      alignment: Alignment.center,
      height: 250,
      width: 250,
      padding: const EdgeInsets.all(20),
      fit: BoxFit.contain,
      switchType: ImageSwitchType.random,
    );
  }
}

/// An about icon button used on the example's app app bar.
class UndrawAbout extends StatelessWidget {
  const UndrawAbout({super.key, this.color, this.useRootNavigator = true});

  /// The color used on the icon button.
  ///
  /// If null, default to Icon() class default color.
  final Color? color;

  /// Use root navigator?
  final bool useRootNavigator;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info, color: color),
      onPressed: () {
        showUndrawAboutDialog(context, useRootNavigator);
      },
    );
  }
}

/// This [showUndrawAboutDialog] function is based on the [AboutDialog] example
/// that exist(ed) in the Flutter Gallery App.
void showUndrawAboutDialog(BuildContext context,
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
    host: 'undraw.co',
    path: 'illustrations',
  );

  showAboutDialog(
    context: context,
    applicationName: 'Undraw images',
    applicationVersion: '1.0',
    useRootNavigator: useRootNavigator,
    applicationIcon: Icon(
      Icons.local_florist_outlined,
      size: 50,
      color: theme.colorScheme.primary,
    ),
    applicationLegalese: '© 2023 Images by Katerina Limpitsouni',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: aboutTextStyle,
                text: 'Shows how to use Undraw images '
                    'and color them dynamically in a Flutter app. '
                    'Also demonstrates the NavigationBar and '
                    'NavigationDrawer in an app.\n'
                    '\n'
                    'To learn more about the wonderful Undraw '
                    'images, please visit ',
              ),
              LinkTextSpan(
                style: linkStyle,
                uri: sourceLink,
                text: 'undraw.co',
              ),
              TextSpan(
                style: aboutTextStyle,
                text: '.\n\n',
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
