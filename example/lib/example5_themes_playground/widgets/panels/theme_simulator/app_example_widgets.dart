import 'package:flutter/material.dart';

import '../../../../shared/const/app_data.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/app_scroll_behavior.dart';
import '../../../../shared/widgets/app/about.dart';
import '../../../../shared/widgets/app/show_color_scheme_colors.dart';
import '../../../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../../../shared/widgets/app/show_theme_data_colors.dart';
import '../../../../shared/widgets/universal/theme_mode_switch.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';

/// An example that show what the Widget Showcase widgets in a
/// mobile frame.
class AppExampleWidgets extends StatelessWidget {
  const AppExampleWidgets({super.key, required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 12,
        child: ScrollConfiguration(
          behavior: const DragScrollBehavior(),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: AppBar(
              title: const Text('Themed Components'),
              actions: const <Widget>[AboutIconButton(useRootNavigator: false)],
              bottom: const TabBar(
                isScrollable: true,
                tabs: <Widget>[
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
              children: <Widget>[
                ShowcaseColors(controller: controller),
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
        ));
  }
}

class ShowcaseColors extends StatelessWidget {
  const ShowcaseColors({super.key, required this.controller});

  final ThemeController controller;

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
        ListTile(
          title: const Text('Theme mode'),
          subtitle: Text('Theme ${controller.themeMode.name}'),
          trailing: ThemeModeSwitch(
            themeMode: controller.themeMode,
            onChanged: controller.setThemeMode,
          ),
          // Toggle theme mode also via the ListTile tap.
          onTap: () {
            if (theme.brightness == Brightness.light) {
              controller.setThemeMode(ThemeMode.dark);
            } else {
              controller.setThemeMode(ThemeMode.light);
            }
          },
        ),
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
      children: <Widget>[
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Wrap(
            spacing: 4,
            runSpacing: 8,
            children: const <Widget>[
              PopupMenuButtonShowcase(),
              SizedBox(width: 8),
              PopupMenuButtonTilesShowcase(),
            ],
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: DropDownMenuShowcase(),
        ),
        const MenuBarShowcase(),
        const MenuAnchorShowcase(),
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
