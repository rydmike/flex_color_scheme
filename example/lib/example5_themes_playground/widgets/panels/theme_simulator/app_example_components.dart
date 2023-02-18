import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_data.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/app_scroll_behavior.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/app/show_color_scheme_colors.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/app/show_theme_data_colors.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/theme_mode_switch_list_tile.dart';

/// An example that show what the Widget Showcase component look like in a
/// simulated mobile device frame.
class AppExampleComponents extends StatefulWidget {
  const AppExampleComponents({super.key, required this.controller});

  final ThemeController controller;

  @override
  State<AppExampleComponents> createState() => _AppExampleComponentsState();
}

class _AppExampleComponentsState extends State<AppExampleComponents>
    with TickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    currentPage = widget.controller.simulatorComponentsIndex;
    tabController = TabController(
      initialIndex: currentPage,
      length: 12,
      vsync: this,
    );
    // Update stored tab page info also if swiped to new page.
    tabController.addListener(() {
      if (tabController.index != currentPage) {
        currentPage = tabController.index;
        widget.controller.setSimulatorComponentsIndex(currentPage);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const DragScrollBehavior(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          title: const Text('Themed Components'),
          actions: const <Widget>[AboutIconButton(useRootNavigator: false)],
          bottom: TabBar(
            controller: tabController,
            onTap: (int newPage) {
              setState(() {
                currentPage = newPage;
                widget.controller.setSimulatorComponentsIndex(currentPage);
              });
            },
            isScrollable: true,
            tabs: const <Widget>[
              Tab(text: 'Colors'),
              Tab(text: 'Buttons'),
              Tab(text: 'Input'),
              Tab(text: 'Menus'),
              Tab(text: 'Toggles'),
              Tab(text: 'ListTile'),
              Tab(text: 'Slider'),
              Tab(text: 'AppBar'),
              Tab(text: 'Navigation'),
              Tab(text: 'Dialogs'),
              Tab(text: 'Card'),
              Tab(text: 'Text'),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            ShowcaseColors(controller: widget.controller),
            const ShowcaseButtons(),
            const ShowcaseInput(),
            const ShowcaseMenus(),
            const ShowcaseSwitches(),
            const ShowcaseListTile(),
            const ShowcaseSlider(),
            const ShowcaseAppBar(),
            const ShowcaseNavigation(),
            const ShowcaseDialogs(),
            const ShowcaseCard(),
            const ShowcaseText(),
          ],
        ),
      ),
    );
  }
}

/// An about icon button used on the example's app app bar.
class AboutIconButton extends StatelessWidget {
  const AboutIconButton({super.key, this.color, this.useRootNavigator = true});

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
        showAppAboutDialog(context, useRootNavigator);
      },
    );
  }
}

// This [showAppAboutDialog] function is based on the [AboutDialog] example
// that exist(ed) in the Flutter Gallery App.
void showAppAboutDialog(BuildContext context, [bool useRootNavigator = true]) {
  final ThemeData theme = Theme.of(context);
  final TextStyle aboutTextStyle = theme.textTheme.bodyLarge!;
  final TextStyle footerStyle = theme.textTheme.bodySmall!;
  final TextStyle linkStyle =
      theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.primary);

  final MediaQueryData media = MediaQuery.of(context);
  final double width = media.size.width;
  final double height = media.size.height;

  // Get the card's ShapeBorder from the themed card shape.
  // This was kind of interesting to do, seem to work, for this case at least.
  final ShapeBorder? shapeBorder = theme.cardTheme.shape;
  double buttonRadius = 4; // Default un-themed value
  if (shapeBorder is RoundedRectangleBorder?) {
    final BorderRadiusGeometry? border = shapeBorder?.borderRadius;
    if (border is BorderRadius?) {
      final Radius? radius = border?.topLeft;
      buttonRadius = radius?.x == radius?.y ? (radius?.x ?? 4.0) : 4.0;
    }
  }

  showAboutDialog(
    context: context,
    applicationName: AppData.title(context),
    applicationVersion: AppData.version,
    useRootNavigator: useRootNavigator,
    applicationIcon: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlexThemeModeOptionButton(
          optionButtonBorderRadius: buttonRadius,
          selected: true,
          width: 30,
          height: 30,
          flexSchemeColor: FlexSchemeColor(
            primary: theme.colorScheme.primary,
            primaryContainer: theme.colorScheme.primaryContainer,
            secondary: theme.colorScheme.secondary,
            secondaryContainer: theme.colorScheme.secondaryContainer,
          ),
        ),
      ],
    ),
    applicationLegalese:
        '${AppData.copyright}\n${AppData.author}\n${AppData.license}',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: aboutTextStyle,
                text: 'This app demonstrates what ${AppData.packageName} '
                    'themed components look like by showing them in a mock '
                    'device. '
                    'To learn more about ${AppData.packageName}, check out '
                    'the package on ',
              ),
              LinkTextSpan(
                style: linkStyle,
                uri: AppData.packageUri,
                text: 'pub.dev',
              ),
              TextSpan(
                style: aboutTextStyle,
                text: '. It also includes the source '
                    'code of this application.\n\n',
              ),
              TextSpan(
                style: footerStyle,
                text: 'Built with Flutter ${AppData.flutterVersion}, '
                    'using ${AppData.packageName} '
                    '${AppData.packageVersion}\n'
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

class ShowcaseColors extends StatelessWidget {
  const ShowcaseColors({super.key, required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: <Widget>[
        ThemeModeSwitchListTile(controller: controller),
        // Show all key active theme colors.
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ShowColorSchemeColors(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ShowThemeDataColors(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ShowSubThemeColors(),
        ),
      ],
    );
  }
}

class ShowcaseButtons extends StatelessWidget {
  const ShowcaseButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        16,
        media.padding.top + AppData.edgeInsetsTablet,
        16,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        ElevatedButtonShowcase(),
        SizedBox(height: 8),
        FilledButtonShowcase(),
        SizedBox(height: 8),
        FilledButtonTonalShowcase(),
        SizedBox(height: 8),
        OutlinedButtonShowcase(),
        SizedBox(height: 8),
        TextButtonShowcase(),
        SizedBox(height: 8),
        ToggleButtonsShowcase(),
        SizedBox(height: 8),
        SegmentedButtonShowcase(),
        SizedBox(height: 8),
        FabShowcase(),
        SizedBox(height: 8),
        IconButtonCircleAvatarDropdownShowcase(),
        SizedBox(height: 8),
      ],
    );
  }
}

class ShowcaseInput extends StatelessWidget {
  const ShowcaseInput({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        16,
        media.padding.top + AppData.edgeInsetsTablet,
        16,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        TextInputField(),
        SizedBox(height: 8),
        DropDownButtonFormField(),
        SizedBox(height: 8),
        DropDownMenuShowcase(),
        SizedBox(height: 16),
        ChipShowcase(),
        SizedBox(height: 8),
      ],
    );
  }
}

class ShowcaseMenus extends StatelessWidget {
  const ShowcaseMenus({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: PopupMenuButtonsShowcase(explainUsage: true),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DropDownMenuShowcase(explainUsage: true),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MenuBarShowcase(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MenuAnchorShowcase(),
        ),
      ],
    );
  }
}

class ShowcaseSwitches extends StatelessWidget {
  const ShowcaseSwitches({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: SwitchShowcase(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: CheckboxShowcase(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: RadioShowcase(),
        ),
        Divider(height: 1),
        SwitchTileShowcase(),
        Divider(height: 1),
        CheckboxTileShowcase(),
        Divider(height: 1),
        RadioTileShowcase(),
      ],
    );
  }
}

class ShowcaseListTile extends StatelessWidget {
  const ShowcaseListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        ListTileShowcase(),
        Divider(),
        ExpansionTileShowcase(),
        Divider(),
        ExpansionPanelListShowcase(),
      ],
    );
  }
}

class ShowcaseSlider extends StatelessWidget {
  const ShowcaseSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        SliderShowcase(),
        SizedBox(height: 8),
        Divider(),
        RangeSliderShowcase(),
        Divider(),
        SizedBox(height: 8),
        ListTile(title: Text('Progress indicators')),
        Center(child: ProgressIndicatorShowcase()),
        SizedBox(height: 16),
      ],
    );
  }
}

class ShowcaseAppBar extends StatelessWidget {
  const ShowcaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        AppBarShowcase(),
        SizedBox(height: 8),
        Divider(),
        BottomAppBarShowcase(),
        Divider(),
        TabBarForAppBarShowcase(),
        SizedBox(height: 8),
        Divider(),
        TabBarForBackgroundShowcase(),
      ],
    );
  }
}

class ShowcaseNavigation extends StatelessWidget {
  const ShowcaseNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        BottomNavigationBarShowcase(),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        NavigationBarShowcase(),
        SizedBox(height: 8),
        Divider(),
        NavigationRailShowcase(),
        SizedBox(height: 8),
        NavigationDrawerShowcase(),
        DrawerShowcase(),
      ],
    );
  }
}

class ShowcaseDialogs extends StatelessWidget {
  const ShowcaseDialogs({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        AlertDialogShowcase(),
        TimePickerDialogShowcase(),
        DatePickerDialogShowcase(),
        BottomSheetShowcase(),
        SizedBox(height: 16),
        BottomSheetModalShowcase(),
        SizedBox(height: 32),
        MaterialBannerSnackBarShowcase(),
      ],
    );
  }
}

class ShowcaseCard extends StatelessWidget {
  const ShowcaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: CardShowcase(),
        ),
        Divider(height: 32),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: MaterialShowcase(),
        ),
      ],
    );
  }
}

class ShowcaseText extends StatelessWidget {
  const ShowcaseText({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData media = MediaQuery.of(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        media.padding.top + AppData.edgeInsetsTablet,
        0,
        media.padding.bottom + AppData.edgeInsetsTablet,
      ),
      children: <Widget>[
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: TooltipShowcase(),
        ),
        Card(
          elevation: 0,
          color: theme.scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text('Normal TextTheme',
                      style: theme.textTheme.titleMedium),
                ),
                const TextThemeShowcase(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          color: theme.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text('Primary TextTheme',
                      style: theme.primaryTextTheme.titleMedium),
                ),
                const PrimaryTextThemeShowcase(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
