import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
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
        body: SafeArea(
          bottom: false,
          top: false,
          child: TabBarView(
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

  final Size mediaSize = MediaQuery.sizeOf(context);
  final double width = mediaSize.width;
  final double height = mediaSize.height;

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
    applicationName: App.title(context),
    applicationVersion: App.version,
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
    applicationLegalese: '${App.copyright}\n${App.author}\n${App.license}',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: aboutTextStyle,
                text: 'This app demonstrates what ${App.packageName} '
                    'themed components look like by showing them in a mock '
                    'device. '
                    'To learn more about ${App.packageName}, check out '
                    'the package on ',
              ),
              LinkTextSpan(
                style: linkStyle,
                uri: App.packageUri,
                text: 'pub.dev',
              ),
              TextSpan(
                style: aboutTextStyle,
                text: '. It also includes the source '
                    'code of this application.\n\n',
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

class CCard extends StatelessWidget {
  const CCard({super.key, this.padding, this.color, this.child});
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final bool useM3 = Theme.of(context).useMaterial3;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      color: color,
      shadowColor: useM3 ? Colors.transparent : null,
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      elevation: useM3
          ? isDark
              ? 1
              : 0.5
          : isDark
              ? 3
              : 2,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}

class ShowcaseColors extends StatelessWidget {
  const ShowcaseColors({super.key, required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: <Widget>[
        CCard(
          padding: EdgeInsets.zero,
          child: ThemeModeSwitchListTile(
            controller: controller,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        // Show all key active theme colors.
        const CCard(child: ShowColorSchemeColors()),
        const CCard(child: ShowThemeDataColors()),
        const CCard(child: ShowSubThemeColors()),
      ],
    );
  }
}

class ShowcaseButtons extends StatelessWidget {
  const ShowcaseButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle headerStyle = TextStyle(fontSize: 16);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: const <Widget>[
        CCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Material Buttons', style: headerStyle),
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
            ],
          ),
        ),
        CCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('ToggleButtons', style: headerStyle),
              SizedBox(height: 8),
              ToggleButtonsShowcase(),
              SizedBox(height: 8),
              Text('SegmentedButton', style: headerStyle),
              SizedBox(height: 8),
              SegmentedButtonShowcase(),
            ],
          ),
        ),
        CCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('FloatingActionButton', style: headerStyle),
              SizedBox(height: 8),
              FabShowcase(),
              SizedBox(height: 8),
              Text('Chip', style: headerStyle),
              SizedBox(height: 8),
              ChipShowcase(),
            ],
          ),
        ),
        CCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Icon', style: headerStyle),
              SizedBox(height: 8),
              IconShowcase(),
              SizedBox(height: 8),
              Text('IconButton', style: headerStyle),
              IconButtonShowcase(),
              SizedBox(height: 8),
              IconButtonVariantsShowcase(),
              SizedBox(height: 8),
              Text('CircleAvatar', style: headerStyle),
              SizedBox(height: 8),
              CircleAvatarShowcase(),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowcaseInput extends StatelessWidget {
  const ShowcaseInput({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle headerStyle = TextStyle(fontSize: 16);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: const <Widget>[
        CCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('TextField with InputDecorator', style: headerStyle),
              SizedBox(height: 8),
              TextFieldShowcase(),
            ],
          ),
        ),
        CCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('DropdownButtonFormField', style: headerStyle),
              SizedBox(height: 8),
              DropdownButtonFormFieldShowcase(),
              SizedBox(height: 16),
              Text('DropDownButton', style: headerStyle),
              SizedBox(height: 8),
              DropDownButtonShowcase(),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowcaseMenus extends StatelessWidget {
  const ShowcaseMenus({super.key});

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: const <Widget>[
        CCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PopupMenuButtonsShowcase(explain: true),
              SizedBox(height: 8),
              DropDownMenuShowcase(explain: true),
            ],
          ),
        ),
        SizedBox(height: 8),
        MenuBarShowcase(explain: true, explainIndent: 16),
        SizedBox(height: 32),
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
    const TextStyle headerStyle = TextStyle(fontSize: 16);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: const <Widget>[
        CCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Switch', style: headerStyle),
              SizedBox(height: 8),
              SwitchShowcase(),
              Text('CheckBox', style: headerStyle),
              SizedBox(height: 8),
              CheckboxShowcase(),
              Text('Radio', style: headerStyle),
              SizedBox(height: 8),
              RadioShowcase(),
            ],
          ),
        ),
        CCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SwitchListTileShowcase(),
              Divider(height: 1),
              CheckboxListTileShowcase(),
              Divider(height: 1),
              RadioListTileShowcase(),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowcaseListTile extends StatelessWidget {
  const ShowcaseListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: const <Widget>[
        CCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTileShowcase(),
              Divider(),
              ExpansionTileShowcase(),
              Divider(),
              ExpansionPanelListShowcase(),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowcaseSlider extends StatelessWidget {
  const ShowcaseSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: const <Widget>[
        CCard(child: SliderShowcase()),
        CCard(child: RangeSliderShowcase()),
        CCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(title: Text('Progress indicators')),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ProgressIndicatorShowcase(),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowcaseAppBar extends StatelessWidget {
  const ShowcaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle headerStyle = TextStyle(fontSize: 16);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: const <Widget>[
        SizedBox(height: 8),
        AppBarShowcase(),
        SizedBox(height: 8),
        SearchBarShowcase(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('BottomAppBar', style: headerStyle),
        ),
        BottomAppBarShowcase(),
        SizedBox(height: 16),
        TabBarForAppBarShowcase(),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('TabBar on a surface', style: headerStyle),
        ),
        TabBarForBackgroundShowcase(),
      ],
    );
  }
}

class ShowcaseNavigation extends StatelessWidget {
  const ShowcaseNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle headerStyle = TextStyle(fontSize: 16);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('BottomNavigationBar (M2)', style: headerStyle),
        ),
        BottomNavigationBarShowcase(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('NavigationBar (M3)', style: headerStyle),
        ),
        NavigationBarShowcase(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('NavigationRail', style: headerStyle),
        ),
        NavigationRailShowcase(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('NavigationDrawer', style: headerStyle),
        ),
        NavigationDrawerShowcase(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Drawer', style: headerStyle),
        ),
        DrawerShowcase(),
      ],
    );
  }
}

class ShowcaseDialogs extends StatelessWidget {
  const ShowcaseDialogs({super.key});

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: const <Widget>[
        AlertDialogShowcase(),
        TimePickerDialogShowcase(),
        DatePickerDialogShowcase(),
        SizedBox(height: 16),
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
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
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
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return ListView(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top + 8,
        0,
        padding.bottom + 8,
      ),
      children: <Widget>[
        const CCard(
          child: TooltipShowcase(),
        ),
        CCard(
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
        const SizedBox(height: 8),
        CCard(
          color: theme.colorScheme.primary,
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
      ],
    );
  }
}
