import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../shared/const/app_color.dart';
import '../../../shared/const/app_data.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/app/responsive_scaffold.dart';
import '../../../shared/widgets/universal/responsive_dialog.dart';
import '../../utils/generate_colorscheme_dart_code.dart';
import '../dialogs/dart_code_dialog_screen.dart';
import '../dialogs/reset_settings_dialog.dart';
import '../dialogs/show_copy_setup_code_dialog.dart';
import '../panels/grid_item.dart';
import 'large_grid_view.dart';
import 'panel_view.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 5 - Themes Playground
// -----------------------------------------------------------------------------
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Open close/state of each panel in the large masonry grid view.
  late List<bool> isPanelOpen;

  // Enabled state of each menuItem.
  late List<bool> menuItemsEnabled;

  // Active state of each menuItem.
  late List<ResponsiveMenuItemIconState> menuItemsIconState;

  // Toggle the state of a card between open/closed.
  void togglePanelOpenClose(int index) {
    setState(() {
      isPanelOpen[index] = !isPanelOpen[index];
    });
  }

  @override
  void initState() {
    super.initState();

    // Set enabled menu items.
    menuItemsEnabled =
        List<bool>.generate(AppData.menuItems.length, (int i) => true);
    menuItemsEnabled[4] = widget.controller.isLargeGridView;
    menuItemsEnabled[5] = widget.controller.isLargeGridView;

    // Set menu icons states to initial states, some are a loaded from
    // persisted values via the theme controller.
    menuItemsIconState = List<ResponsiveMenuItemIconState>.generate(
        AppData.menuItems.length,
        (int i) => ResponsiveMenuItemIconState.primary);
    menuItemsIconState[0] = widget.controller.isLargeGridView
        ? ResponsiveMenuItemIconState.secondary
        : ResponsiveMenuItemIconState.primary;

    // The panels can only be opened/closed on the large masonry grid view.
    // Since by default users will start with the page view, they will have
    // seen the "intro" panel already, so by default we close it here.
    // The code view panel can also be opened on demand in the grid view.
    isPanelOpen = List<bool>.generate(gridItems.length, (int i) {
      if (i == 1 || i == 0) {
        // Always start with info and code view panel closed.
        return false;
      } else {
        return true;
      }
    });
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
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: widget.controller.sysNavBarStyle,
        useDivider: widget.controller.useSysNavDivider,
        opacity: widget.controller.sysNavBarOpacity,
      ),
      child: ResponsiveScaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: AppData.desktopWidthBreakpoint,
        title: isPhone
            ? Text(AppColor.schemes[widget.controller.schemeIndex].name)
            : Text('${AppData.title(context)} - '
                '${AppColor.schemes[widget.controller.schemeIndex].name}'),
        menuTitle: const Text(AppData.packageName),
        menuLeadingTitle: Text(
          AppData.title(context),
          style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
        ),
        menuLeadingSubtitle: const Text('Version ${AppData.versionMajor}'),
        menuLeadingAvatarLabel: 'FCS',
        menuItems: AppData.menuItems,
        menuItemsEnabled: menuItemsEnabled,
        menuItemsIconState: menuItemsIconState,
        // Callback from menu, using simple index based actions here.
        onSelect: (int index) async {
          // Toggle grid view mode true/false.
          if (index == 0) {
            await widget.controller
                .setAdvancedView(!widget.controller.isLargeGridView);
            menuItemsEnabled[4] = !menuItemsEnabled[4];
            menuItemsEnabled[5] = !menuItemsEnabled[5];
            menuItemsIconState[index] = widget.controller.isLargeGridView
                ? ResponsiveMenuItemIconState.secondary
                : ResponsiveMenuItemIconState.primary;
            setState(() {});
          }
          // Set theme-mode light/dark
          if (index == 1) {
            if (isDark) {
              await widget.controller.setThemeMode(ThemeMode.light);
            } else {
              await widget.controller.setThemeMode(ThemeMode.dark);
            }
          }
          // Copy theme setup code
          if (index == 2) {
            // ignore: use_build_context_synchronously
            await showCopySetupCodeDialog(context, widget.controller);
          }
          // Copy ColorScheme code
          if (index == 3) {
            final String code = generateColorSchemeDartCode(colorScheme);
            await showResponsiveDialog<void>(
              context: context,
              child: DartCodeDialogScreen(
                dialogHeader: 'Copy Current ${isDark ? 'Dark' : 'Light'} '
                    'ColorScheme Code',
                copyMessage: 'ColorScheme code copied to the clipboard!',
                code: code,
              ),
            );
          }
          // Open all cards
          if (index == 4) {
            for (int i = 0; i < isPanelOpen.length; i++) {
              isPanelOpen[i] = true;
            }
            setState(() {});
          }
          // Close all cards
          if (index == 5) {
            for (int i = 0; i < isPanelOpen.length; i++) {
              isPanelOpen[i] = false;
            }
            setState(() {});
          }
          // Reset theme settings.
          if (index == 6) {
            final bool? reset = await showDialog<bool?>(
              context: context,
              builder: (BuildContext context) {
                return const ResetSettingsDialog();
              },
            );
            if (reset ?? false) {
              await widget.controller.resetAllToDefaults();
            }
          }
        },
        body: widget.controller.isLargeGridView
            ? LargeGridView(
                controller: widget.controller,
                isCardOpen: isPanelOpen,
                toggleCard: togglePanelOpenClose,
              )
            : PanelView(themeController: widget.controller),
      ),
    );
  }
}
