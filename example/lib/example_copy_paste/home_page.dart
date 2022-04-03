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
        List<bool>.generate(AppData.menuItems.length, (int i) => false);
    menuItemsEnabled[1] = true;
    // Set menu icons states to initial states, some are a loaded from
    // persisted values via the theme controller.
    menuItemsIconState = List<ResponsiveMenuItemIconState>.generate(
        AppData.menuItems.length,
        (int i) => ResponsiveMenuItemIconState.primary);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    menuItemsIconState[1] = isLight
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
    final MediaQueryData media = MediaQuery.of(context);
    final double margins = AppData.responsiveInsets(media.size.width);
    final double topPadding = media.padding.top + kToolbarHeight + margins;
    final double bottomPadding = media.padding.bottom + margins;
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint;
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
          AppData.title(context),
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        menuLeadingSubtitle: const Text('Version ${AppData.versionMajor}'),
        menuLeadingAvatarLabel: 'FCS',
        menuItems: AppData.menuItems,
        menuItemsEnabled: menuItemsEnabled,
        menuItemsIconState: menuItemsIconState,
        // Make Rail width larger when using it on tablet or desktop.
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: AppData.desktopWidthBreakpoint,
        extendBodyBehindAppBar: true,
        extendBody: true,
        onSelect: (int index) {
          if (index == 1) {
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
              const _TabBarShowCase(),
              const SizedBox(height: 8),
              const _BottomBarShowCase(),
              const SizedBox(height: 8),
              const _NavigationRailShowCase(),
              const SizedBox(height: 8),
              const _DialogShowcase(),
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
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.crop_16_9_outlined, color: iconColor),
      title: const Text('Material Buttons'),
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
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.toggle_on_outlined, color: iconColor),
      title: const Text('ToggleButtons FAB Switches and Chips'),
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
            PopupMenuShowcase(),
            SizedBox(height: 8),
            IconButtonCircleAvatarDropdownTooltipShowcase(),
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
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.pin_outlined, color: iconColor),
      title: const Text('TextField'),
      child: const Padding(
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
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.pin_outlined, color: iconColor),
      title: const Text('ListTile'),
      child: const ListTileShowcase(),
    );
  }
}

class _TabBarShowCase extends StatelessWidget {
  const _TabBarShowCase({Key? key}) : super(key: key);

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
      leading: Icon(Icons.tab_outlined, color: iconColor),
      title: const Text('TabBar and BottomNavigationBar'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          SizedBox(height: 8),
          TabBarForAppBarShowcase(),
        ],
      ),
    );
  }
}

class _BottomBarShowCase extends StatelessWidget {
  const _BottomBarShowCase({Key? key}) : super(key: key);

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
      title: const Text('BottomNavigationBar and NavigationBar'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
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
      child: const NavigationRailShowcase(),
    );
  }
}

class _DialogShowcase extends StatelessWidget {
  const _DialogShowcase({Key? key}) : super(key: key);

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
      title: const Text('Themed TimePickerDialog'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
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
  const _MaterialAndBottomSheetShowcase({Key? key}) : super(key: key);

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
      title: const Text('Material, Banner, Sheet and SnackBar'),
      child: const Padding(
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
          child: CardShowcase(),
        ));
  }
}

class _TextThemeShowcase extends StatelessWidget {
  const _TextThemeShowcase({Key? key}) : super(key: key);

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
      title: const Text('Themed TextTheme'),
      child: const Padding(
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
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.font_download, color: iconColor),
      title: const Text('Themed PrimaryTextTheme'),
      child: SizedBox(
        width: double.infinity,
        child: Material(
          color: Theme.of(context).colorScheme.primary,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: PrimaryTextThemeShowcase(),
          ),
        ),
      ),
    );
  }
}
