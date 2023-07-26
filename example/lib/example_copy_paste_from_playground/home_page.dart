// The HomePage
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/const/app.dart';
import '../shared/widgets/app/responsive_scaffold.dart';
import '../shared/widgets/app/show_color_scheme_colors.dart';
import '../shared/widgets/app/show_sub_pages.dart';
import '../shared/widgets/app/show_theme_data_colors.dart';
import '../shared/widgets/universal/page_body.dart';
import '../shared/widgets/universal/showcase_material.dart';
import '../shared/widgets/universal/stateful_header_card.dart';
import '../shared/widgets/universal/theme_mode_switch.dart';

// -----------------------------------------------------------------------------
// Home Page for the Copy Paste Playground
// This hom page is used to visualize and demonstrate the active theme
// copied from the Themes Playground, by showing all theming colors and
// commonly used widgets in Flutter with their theme applied.
// -----------------------------------------------------------------------------
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController scrollController;
  // Enabled state of each menuItem.
  late List<bool> menuItemsEnabled;
  // Active state of each menuItem.
  late List<ResponsiveMenuItemIconState> menuItemsIconState;

  @override
  void initState() {
    super.initState();
    scrollController =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0);
    // Set enabled menu items.
    menuItemsEnabled =
        List<bool>.generate(App.menuItems.length, (int i) => false);
    menuItemsEnabled[0] = true;
    // Set menu icons states to initial states, some are a loaded from
    // persisted values via the theme controller.
    menuItemsIconState = List<ResponsiveMenuItemIconState>.generate(
        App.menuItems.length, (int i) => ResponsiveMenuItemIconState.primary);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    menuItemsIconState[0] = Theme.of(context).brightness == Brightness.light
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final double margins = App.responsiveInsets(mediaSize.width);
    final double topPadding = mediaPadding.top + kToolbarHeight + margins;
    final double bottomPadding = mediaPadding.bottom + margins;
    final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: FlexSystemNavBarStyle.transparent,
      ),
      child: ResponsiveScaffold(
        title: Text(App.title(context)),
        menuTitle: const Text(App.packageName),
        menuLeadingTitle: Text(
          App.title(context),
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        menuLeadingSubtitle: const Text('Version ${App.versionMajor}'),
        menuLeadingAvatarLabel: 'FCS',
        menuItems: App.menuItems,
        menuItemsEnabled: menuItemsEnabled,
        menuItemsIconState: menuItemsIconState,
        // Make Rail width larger when using it on tablet or desktop.
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: App.desktopWidthBreakpoint,
        extendBodyBehindAppBar: true,
        extendBody: true,
        onSelect: (int index) {
          if (index == 0) {
            if (isDark) {
              widget.onThemeModeChanged(ThemeMode.light);
            } else {
              widget.onThemeModeChanged(ThemeMode.dark);
            }
          }
        },
        body: PageBody(
          controller: scrollController,
          constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
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
              const _ButtonsSwitchesIconsShowcase(),
              const SizedBox(height: 8),
              const _ToggleFabSwitchesChipsShowcase(),
              const SizedBox(height: 8),
              const _TextInputFieldShowcase(),
              const SizedBox(height: 8),
              const _AppTabBottomSearchBars(),
              const SizedBox(height: 8),
              const _BottomNavigationBarsShowCase(),
              const SizedBox(height: 8),
              const _NavigationRailShowCase(),
              const SizedBox(height: 8),
              const _NavigationDrawerShowCase(),
              const SizedBox(height: 8),
              const _DialogShowcase(),
              const SizedBox(height: 8),
              const _MaterialAndBottomSheetShowcase(),
              const SizedBox(height: 8),
              const _CardShowcase(),
              const SizedBox(height: 8),
              const _ListTileShowcase(),
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
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<_MainPanel> createState() => _MainPanelState();
}

class _MainPanelState extends State<_MainPanel> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.gradient_outlined, color: iconColor),
      title: const Text('Theme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text('Theme setup copied from Themes Playground'),
          ),
          ListTile(
            title: const Text('Theme mode'),
            subtitle: Text('Theme '
                '${widget.themeMode.toString().dotTail}'),
            trailing: ThemeModeSwitch(
              themeMode: widget.themeMode,
              onChanged: widget.onThemeModeChanged,
            ),
            onTap: () {
              if (isLight) {
                widget.onThemeModeChanged(ThemeMode.dark);
              } else {
                widget.onThemeModeChanged(ThemeMode.light);
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShowColorSchemeColors(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: ShowThemeDataColors(),
          ),
        ],
      ),
    );
  }
}

class _ButtonsSwitchesIconsShowcase extends StatelessWidget {
  const _ButtonsSwitchesIconsShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const TextStyle headerStyle = TextStyle(fontSize: 16);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.crop_16_9_outlined, color: iconColor),
      title: const Text('Buttons, Switches and Icons'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //
            // Buttons
            //
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
            SizedBox(height: 16),
            //
            // ToggleButtons and SegmentedButton
            //
            Text('ToggleButtons and SegmentedButton', style: headerStyle),
            SizedBox(height: 8),
            ToggleButtonsShowcase(),
            SizedBox(height: 8),
            SegmentedButtonShowcase(),
            SizedBox(height: 16),
            //
            // FloatingActionButton and Chip
            //
            Text('FloatingActionButton and Chip', style: headerStyle),
            SizedBox(height: 8),
            FabShowcase(),
            SizedBox(height: 16),
            ChipShowcase(),
            SizedBox(height: 16),
            //
            // Switch, CheckBox and Radio
            //
            Text('Switch, CheckBox and Radio', style: headerStyle),
            SizedBox(height: 8),
            SwitchShowcase(showCupertinoSwitches: false),
            CheckboxShowcase(),
            RadioShowcase(),
            SizedBox(height: 8),
            //
            // Icon
            //
            Text('Icon', style: headerStyle),
            SizedBox(height: 16),
            IconShowcase(),
            SizedBox(height: 16),
            //
            // IconButton
            //
            Text('IconButton', style: headerStyle),
            SizedBox(height: 16),
            IconButtonShowcase(),
            SizedBox(height: 16),
            IconButtonVariantsShowcase(),
            SizedBox(height: 16),
            //
            // CircleAvatar
            //
            Text('CircleAvatar', style: headerStyle),
            SizedBox(height: 16),
            CircleAvatarShowcase(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _ToggleFabSwitchesChipsShowcase extends StatelessWidget {
  const _ToggleFabSwitchesChipsShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const TextStyle headerStyle = TextStyle(fontSize: 16);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.tune, color: iconColor),
      title: const Text('Tooltips, Progress Indicators and Sliders'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //
            // Tooltip
            //
            Text('Tooltip', style: headerStyle),
            SizedBox(height: 8),
            TooltipShowcase(),
            SizedBox(height: 16),
            //
            // ProgressIndicator
            //
            Text('ProgressIndicator', style: headerStyle),
            SizedBox(height: 8),
            ProgressIndicatorShowcase(),
            SizedBox(height: 16),
            //
            // Slider and RangeSlider
            //
            Text('Slider and RangeSlider', style: headerStyle),
            SizedBox(height: 8),
            SliderShowcase(),
            Divider(),
            RangeSliderShowcase(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _TextInputFieldShowcase extends StatelessWidget {
  const _TextInputFieldShowcase();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const TextStyle headerStyle = TextStyle(fontSize: 16);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.pin_outlined, color: iconColor),
      title: const Text('TextFields and Menus'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //
            // TextField
            //
            Text('TextField with InputDecorator', style: headerStyle),
            SizedBox(height: 8),
            TextFieldShowcase(),
            SizedBox(height: 16),
            //
            // PopupMenuButton, DropdownButtonFormField, DropDownButton
            //
            Text('PopupMenuButton and DropdownButtons', style: headerStyle),
            PopupMenuButtonsShowcase(explain: true),
            SizedBox(height: 8),
            DropDownButtonShowcase(explain: true),
            SizedBox(height: 8),
            DropdownButtonFormFieldShowcase(explain: true),
            SizedBox(height: 8),
            //
            // DropdownMenu, MenuBar, MenuAnchor
            //
            Text('Dropdown Menus and MenuBar', style: headerStyle),
            DropDownMenuShowcase(explain: true),
            MenuAnchorShowcase(explain: true),
            MenuBarShowcase(explain: true),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _AppTabBottomSearchBars extends StatelessWidget {
  const _AppTabBottomSearchBars();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const TextStyle headerStyle = TextStyle(fontSize: 16);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.tab_outlined, color: iconColor),
      title: const Text('AppBar TabBar BottomAppBar and SearchBar'),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //
            // AppBars and TabBar
            //
            Text('AppBar and TabBar', style: headerStyle),
            SizedBox(height: 8),
            AppBarShowcase(),
            SizedBox(height: 8),
            TabBarForAppBarShowcase(explain: true),
            SizedBox(height: 8),
            TabBarForBackgroundShowcase(explain: true),
            SizedBox(height: 32),
            //
            // BottomAppBar and SearchBar
            //
            Text('BottomAppBar and SearchBar', style: headerStyle),
            BottomAppBarShowcase(explain: true),
            SearchBarShowcase(explain: true),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationBarsShowCase extends StatelessWidget {
  const _BottomNavigationBarsShowCase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.video_label, color: iconColor),
      title: const Text('Bottom Navigation'),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BottomNavigationBarShowcase(explain: true),
            SizedBox(height: 8),
            NavigationBarShowcase(explain: true),
          ],
        ),
      ),
    );
  }
}

class _NavigationRailShowCase extends StatelessWidget {
  const _NavigationRailShowCase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.view_sidebar_outlined, color: iconColor),
      title: const Text('NavigationRail'),
      child: const NavigationRailShowcase(explain: true),
    );
  }
}

class _NavigationDrawerShowCase extends StatelessWidget {
  const _NavigationDrawerShowCase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.featured_video_outlined, color: iconColor),
      title: const Text('NavigationDrawer'),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NavigationDrawerShowcase(explain: true),
            DrawerShowcase(explain: true),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _DialogShowcase extends StatelessWidget {
  const _DialogShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.branding_watermark_outlined, color: iconColor),
      title: const Text('Dialogs'),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //
          // AlertDialog, TimePickerDialog, DatePickerDialog
          //
          SizedBox(height: 8),
          AlertDialogShowcase(),
          SizedBox(height: 8),
          TimePickerDialogShowcase(),
          SizedBox(height: 8),
          DatePickerDialogShowcase(),
        ],
      ),
    );
  }
}

class _MaterialAndBottomSheetShowcase extends StatelessWidget {
  const _MaterialAndBottomSheetShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.call_to_action_outlined, color: iconColor),
      title: const Text('Material, Banner, Sheet & Snack'),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //
            // BottomSheet
            //
            SizedBox(height: 16),
            BottomSheetShowcase(),
            SizedBox(height: 16),
            BottomSheetModalShowcase(),
            SizedBox(height: 16),
            //
            // SnackBar and MaterialBanner
            //
            SizedBox(height: 8),
            MaterialBannerSnackBarShowcase(),
          ],
        ),
      ),
    );
  }
}

class _CardShowcase extends StatelessWidget {
  const _CardShowcase();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
        leading: Icon(Icons.picture_in_picture_alt_outlined, color: iconColor),
        title: const Text('Card'),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //
              // Card
              //
              SizedBox(height: 8),
              CardShowcase(explain: true),
              SizedBox(height: 16),
            ],
          ),
        ));
  }
}

class _ListTileShowcase extends StatelessWidget {
  const _ListTileShowcase();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.dns_outlined, color: iconColor),
      title: const Text('ListTiles'),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTileShowcase(),
          Divider(height: 1),
          SwitchListTileShowcase(),
          Divider(height: 1),
          CheckboxListTileShowcase(),
          Divider(height: 1),
          RadioListTileShowcase(),
          Divider(),
          ExpansionTileShowcase(),
          Divider(),
          ExpansionPanelListShowcase(),
        ],
      ),
    );
  }
}

class _TextThemeShowcase extends StatefulWidget {
  const _TextThemeShowcase();

  @override
  State<_TextThemeShowcase> createState() => _TextThemeShowcaseState();
}

class _TextThemeShowcaseState extends State<_TextThemeShowcase> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.font_download_outlined, color: iconColor),
      title: const Text('TextTheme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Show text style details'),
            value: showDetails,
            onChanged: (bool value) {
              setState(() {
                showDetails = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextThemeShowcase(showDetails: showDetails),
          ),
        ],
      ),
    );
  }
}

class _PrimaryTextThemeShowcase extends StatefulWidget {
  const _PrimaryTextThemeShowcase();

  @override
  State<_PrimaryTextThemeShowcase> createState() =>
      _PrimaryTextThemeShowcaseState();
}

class _PrimaryTextThemeShowcaseState extends State<_PrimaryTextThemeShowcase> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.font_download, color: iconColor),
      title: const Text('PrimaryTextTheme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Show text style details'),
            value: showDetails,
            onChanged: (bool value) {
              setState(() {
                showDetails = value;
              });
            },
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Material(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: PrimaryTextThemeShowcase(showDetails: showDetails),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
