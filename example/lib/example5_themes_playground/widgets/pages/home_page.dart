import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../shared/const/app.dart';
import '../../../shared/const/app_color.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/examples/responsive_scaffold.dart';
import '../../../shared/widgets/universal/responsive_dialog.dart';
import '../../utils/generate_colorscheme_dart_code.dart';
import '../../utils/import_export_playground_settings.dart';
import '../../utils/share_settings.dart';
import '../dialogs/dart_code_dialog.dart';
import '../dialogs/reset_settings_dialog.dart';
import '../dialogs/show_copy_setup_code_dialog.dart';
import 'model/theme_topic.dart';
import 'one_or_two_topic_page_view.dart';
import 'two_topics_page.dart';
import 'two_topics_vertical_page.dart';

/// Home Page for FlexColorScheme EXAMPLE 5 - Themes Playground.
///
/// The learn more about using this app see the docs at:
/// - https://docs.flexcolorscheme.com/playground
///
/// The learn more about its history and design see docs at:
/// - https://docs.flexcolorscheme.com/tutorial5
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
        List<bool>.generate(App.menuItems.length, (int i) => true);
    menuItemsEnabled[3] = widget.controller.useFlexColorScheme;

    // Set menu icons states to initial states, some are a loaded from
    // persisted values via the theme controller.
    menuItemsIconState = List<ResponsiveMenuItemIconState>.generate(
        App.menuItems.length, (int i) => ResponsiveMenuItemIconState.primary);

    // The panels can only be opened/closed on the large masonry grid view.
    // Since by default users will start with the page view, they will have
    // New in V7, keeping grid view panels all closed at start. Might
    // phase out the grid view and remove it totally.
    isPanelOpen = List<bool>.generate(themeTopics.length, (int i) => false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    menuItemsIconState[0] = Theme.of(context).brightness == Brightness.light
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
    menuItemsIconState[1] = widget.controller.useMaterial3
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
    menuItemsIconState[2] = widget.controller.useFlexColorScheme
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
    menuItemsIconState[3] = widget.controller.useSubThemes
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
    menuItemsEnabled[3] = widget.controller.useFlexColorScheme;
    menuItemsIconState[6] = widget.controller.compactMode
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
    menuItemsIconState[7] = widget.controller.verticalMode
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
  }

  void updateMenuState(int index) {
    setState(() {
      menuItemsIconState[index] =
          menuItemsIconState[index] == ResponsiveMenuItemIconState.primary
              ? ResponsiveMenuItemIconState.secondary
              : ResponsiveMenuItemIconState.primary;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final TextTheme textTheme = theme.textTheme;
    final Size mediaSize = MediaQuery.sizeOf(context);
    final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint;
    final bool isBigDesktop =
        mediaSize.width > App.mediumDesktopWidthBreakpoint;
    // final String materialType = theme.useMaterial3 ? 'M3 ' : 'M2 ';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: widget.controller.systemNavBarStyle,
        useDivider: widget.controller.useSystemNavBarDivider,
        opacity: widget.controller.systemNavBarOpacity,
      ),
      child: ResponsiveScaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: App.desktopWidthBreakpoint,
        title: isPhone
            ? Text(AppColor.schemes[widget.controller.schemeIndex].name)
            : Text('${App.title(context)} - '
                '${AppColor.schemes[widget.controller.schemeIndex].name}'),
        menuTitle: const Text(App.packageName),
        menuLeadingTitle: Text(
          App.title(context),
          style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        menuLeadingSubtitle: const Text('Version ${App.versionMajor}'),
        menuLeadingAvatarLabel: 'FCS',
        menuItems: App.menuItems,
        menuItemsEnabled: menuItemsEnabled,
        menuItemsIconState: menuItemsIconState,
        // Callback from menu, using simple index based actions here.
        onSelect: (int index) async {
          // Set theme-mode light/dark
          if (index == 0) {
            if (isDark) {
              widget.controller.setThemeMode(ThemeMode.light);
            } else {
              widget.controller.setThemeMode(ThemeMode.dark);
            }
            // On purpose no call to update menu change, it is handled by the
            // didChangeDependencies called when the theme actually changes.
          }
          // Set M3 ON/OFF
          else if (index == 1) {
            if (widget.controller.useMaterial3) {
              widget.controller.setUseMaterial3(false);
            } else {
              widget.controller.setUseMaterial3(true);
            }
            updateMenuState(index);
          }
          // Set FCS ON/OFF
          else if (index == 2) {
            if (widget.controller.useFlexColorScheme) {
              widget.controller.setUseFlexColorScheme(false);
            } else {
              widget.controller.setUseFlexColorScheme(true);
            }
            updateMenuState(index);
          }
          // Set Sub-themes ON/OFF
          else if (index == 3) {
            if (widget.controller.useSubThemes) {
              widget.controller.setUseSubThemes(false);
            } else {
              widget.controller.setUseSubThemes(true);
            }
            updateMenuState(index);
          }
          // Copy theme setup code
          else if (index == 4) {
            await showCopySetupCodeDialog(context, widget.controller);
          }
          // Copy ColorScheme code
          else if (index == 5) {
            final String code = generateColorSchemeDartCode(widget.controller);
            await showResponsiveDialog<void>(
              context: context,
              child: DartCodeDialog(
                dialogHeader: 'Copy light and dark ColorScheme code',
                copyMessage: 'ColorScheme code copied to the clipboard!',
                code: code,
              ),
            );
          }
          // Toggle compact/standard mode.
          else if (index == 6) {
            widget.controller.setCompactMode(!widget.controller.compactMode);
            updateMenuState(index);
          }
          // Toggle horizontal/vertical mode.
          else if (index == 7) {
            widget.controller.setVerticalMode(!widget.controller.verticalMode);
            updateMenuState(index);
          }
          // Make shareable URL
          else if (index == 8) {
            // Steps:
            // 1. Convert settings to JSON.
            final String jsonSetting =
                await exportPlaygroundSettings(widget.controller);
            // 2. Compress the JSON String and make URL.
            final String url = await ShareSettings.makeUrl(jsonSetting);
            // 3. Copy the URL to the clipboard.
            if (context.mounted) {
              unawaited(
                ShareSettings.copyToClipboardWithSnackBarInfo(
                  context,
                  url,
                  'Playground settings share link copied '
                  'to the clipboard. Paste it where you want to share it!',
                ),
              );
            }
          }
          // Reset theme settings.
          else if (index == 9) {
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
        body: isBigDesktop
            ? widget.controller.verticalMode
                ? TwoTopicsVerticalPage(controller: widget.controller)
                : TwoTopicsPage(controller: widget.controller)
            : OneOrTwoTopicPageView(controller: widget.controller),
      ),
    );
  }
}
