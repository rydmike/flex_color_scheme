// The HomePage
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/const/app_data.dart';
import '../shared/widgets/app/responsive_scaffold.dart';
import '../shared/widgets/app/show_color_scheme_colors.dart';
import '../shared/widgets/app/show_sub_pages.dart';
import '../shared/widgets/app/show_theme_data_colors.dart';
import '../shared/widgets/universal/page_body.dart';
import '../shared/widgets/universal/stateful_header_card.dart';
import '../shared/widgets/universal/theme_mode_switch.dart';
import '../shared/widgets/universal/theme_showcase.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.themeMode,
    required this.onThemeModeChanged,
  }) : super(key: key);

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double margins = AppData.responsiveInsets(media.size.width);
    final double topPadding = media.padding.top + kToolbarHeight + margins;
    final double bottomPadding = media.padding.bottom + margins;
    final bool isPhone = media.size.width < AppData.phoneBreakpoint;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: FlexSystemNavBarStyle.transparent,
      ),
      child: ResponsiveScaffold(
        title: Text(AppData.title(context)),
        menuTitle: const Text(AppData.appName),
        menuLeadingTitle: Text(
          'Copy Playground Theme',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        menuLeadingSubtitle: const Text('Version ${AppData.versionMajor}'),
        menuLeadingAvatarLabel: 'FCS',
        // Make Rail width larger when using it on tablet or desktop.
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: AppData.desktopBreakpoint,
        extendBodyBehindAppBar: true,
        extendBody: true,
        onSelect: (int index) {
          if (index == 5) {
            if (isDark) {
              widget.onThemeModeChanged(ThemeMode.light);
            } else {
              widget.onThemeModeChanged(ThemeMode.dark);
            }
          }
        },
        body: PageBody(
          controller: scrollController,
          constraints: const BoxConstraints(maxWidth: AppData.maxBodyWidth),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.fromLTRB(
                margins, topPadding, margins, bottomPadding),
            children: <Widget>[
              _MainPanel(
                themeMode: widget.themeMode,
                onThemeModeChanged: widget.onThemeModeChanged,
              ),
              const SizedBox(height: 8),
              const ShowSubPages(),
              const SizedBox(height: 8),
              const _MaterialButtonsShowcase(),
              const SizedBox(height: 8),
              const _ToggleFabSwitchesChipsShowcase(),
              const SizedBox(height: 8),
              const _TextInputFieldShowcase(),
              const SizedBox(height: 8),
              const _ListTileShowcase(),
              const SizedBox(height: 8),
              const _TabBarAndBottomBarShowCase(),
              const SizedBox(height: 8),
              const _NavigationRailShowCase(),
              const SizedBox(height: 8),
              const _DialogShowcase(),
              const SizedBox(height: 8),
              const _TimePickerDialogShowcase(),
              const SizedBox(height: 8),
              const _DatePickerDialogShowcase(),
              const SizedBox(height: 8),
              const _MaterialAndBottomSheetShowcase(),
              const SizedBox(height: 8),
              const _CardShowcase(),
              const SizedBox(height: 8),
              const _TextThemeShowcase(),
              const SizedBox(height: 8),
              const _PrimaryTextThemeShowcase(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainPanel extends StatefulWidget {
  const _MainPanel({
    Key? key,
    required this.themeMode,
    required this.onThemeModeChanged,
  }) : super(key: key);

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<_MainPanel> createState() => _MainPanelState();
}

class _MainPanelState extends State<_MainPanel> {
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return StatefulHeaderCard(
      title: const Text('Theme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text('Copy a FlexColorScheme V5 '
                'theme, from the Themes Playground'),
          ),
          ListTile(
            title: const Text('Theme mode'),
            subtitle: Text('Mode '
                '${widget.themeMode.toString().dotTail}'),
            trailing: ThemeModeSwitch(
              themeMode: widget.themeMode,
              onChanged: widget.onThemeModeChanged,
            ),
            onTap: () {
              if (isDark) {
                widget.onThemeModeChanged(ThemeMode.light);
              } else {
                widget.onThemeModeChanged(ThemeMode.dark);
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShowColorSchemeColors(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: ShowThemeDataColors(),
          ),
        ],
      ),
    );
  }
}

class _MaterialButtonsShowcase extends StatelessWidget {
  const _MaterialButtonsShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulHeaderCard(
      title: const Text('Themed Material Buttons'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            ElevatedButtonShowcase(),
            SizedBox(height: 8),
            OutlinedButtonShowcase(),
            SizedBox(height: 8),
            TextButtonShowcase(),
          ],
        ),
      ),
    );
  }
}

class _ToggleFabSwitchesChipsShowcase extends StatelessWidget {
  const _ToggleFabSwitchesChipsShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulHeaderCard(
      title: const Text('Themed Buttons Switches and Chips'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            ToggleButtonsShowcase(),
            SizedBox(height: 8),
            FabShowcase(),
            SwitchShowcase(),
            CheckboxShowcase(),
            RadioShowcase(),
            PopupDropdownButtonsShowcase(),
            SizedBox(height: 8),
            CircleAvatarAndTooltipShowcase(),
            SizedBox(height: 8),
            ChipShowcase(),
          ],
        ),
      ),
    );
  }
}

class _TextInputFieldShowcase extends StatelessWidget {
  const _TextInputFieldShowcase({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const StatefulHeaderCard(
      title: Text('Themed TextInput'),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextInputField(),
      ),
    );
  }
}

class _ListTileShowcase extends StatelessWidget {
  const _ListTileShowcase({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const StatefulHeaderCard(
      title: Text('Themed ListTile'),
      child: ListTileShowcase(),
    );
  }
}

class _TabBarAndBottomBarShowCase extends StatelessWidget {
  const _TabBarAndBottomBarShowCase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulHeaderCard(
      title: const Text('TabBar and BottomNavigationBar'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          SizedBox(height: 8),
          TabBarForAppBarShowcase(),
          SizedBox(height: 8),
          TabBarForBackgroundShowcase(),
          SizedBox(height: 8),
          BottomNavigationBarShowcase(),
          SizedBox(height: 8),
          NavigationBarShowcase(),
        ],
      ),
    );
  }
}

class _NavigationRailShowCase extends StatelessWidget {
  const _NavigationRailShowCase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatefulHeaderCard(
      title: Text('NavigationRail'),
      child: NavigationRailShowcase(),
    );
  }
}

class _TimePickerDialogShowcase extends StatelessWidget {
  const _TimePickerDialogShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatefulHeaderCard(
      title: Text('Themed TimePickerDialog'),
      child: TimePickerDialogShowcase(),
    );
  }
}

class _DatePickerDialogShowcase extends StatelessWidget {
  const _DatePickerDialogShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatefulHeaderCard(
      title: Text('Themed DatePickerDialog'),
      child: DatePickerDialogShowcase(),
    );
  }
}

class _DialogShowcase extends StatelessWidget {
  const _DialogShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatefulHeaderCard(
      title: Text('Themed Dialog'),
      child: AlertDialogShowcase(),
    );
  }
}

class _MaterialAndBottomSheetShowcase extends StatelessWidget {
  const _MaterialAndBottomSheetShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatefulHeaderCard(
      title: Text('Themed Material'),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: MaterialAndBottomSheetShowcase(),
      ),
    );
  }
}

class _CardShowcase extends StatelessWidget {
  const _CardShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatefulHeaderCard(
        title: Text('Themed Card'),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: CardShowcase(),
        ));
  }
}

class _TextThemeShowcase extends StatelessWidget {
  const _TextThemeShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatefulHeaderCard(
      title: Text('Themed TextTheme'),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextThemeShowcase(),
      ),
    );
  }
}

class _PrimaryTextThemeShowcase extends StatelessWidget {
  const _PrimaryTextThemeShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulHeaderCard(
      color: Theme.of(context).colorScheme.primary,
      title: const Text('Themed PrimaryTextTheme'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: PrimaryTextThemeShowcase(),
      ),
    );
  }
}
