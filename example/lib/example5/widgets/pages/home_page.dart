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
import 'advanced_view.dart';
import 'focused_view.dart';

// -----------------------------------------------------------------------------
// Home Page for EXAMPLE 5 - Themes Playground
// -----------------------------------------------------------------------------
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ThemeController controller;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Open close/state of each card.
  late List<bool> isCardOpen;

  // Scroll controller
  final ScrollController scrollController = ScrollController();

  // Cards in the masonry grid, must match the number we actually add to it!
  static const int _nrOfCards = 26;

  // Toggle the state of a card as open/closed.
  void toggleCard(int index) {
    setState(() {
      isCardOpen[index] = !isCardOpen[index];
    });
  }

  @override
  void initState() {
    super.initState();
    isCardOpen = List<bool>.generate(_nrOfCards, (int i) {
      if (i == 1) {
        // Always start with code view panel closed.
        return false;
      } else {
        return true;
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    // We are on phone width media, based on our definition in this app.
    final bool isPhone =
        MediaQuery.of(context).size.width < AppData.phoneBreakpoint;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a static helper that can be use to theme
      // the system navigation bar using the AnnotatedRegion. Without this
      // wrapper the system navigation bar in Android will not change
      // color as we change themes for the page. This is normal Flutter
      // behavior. By using an annotated region with the helper function
      // FlexColorScheme.themedSystemNavigationBar, we can make the
      // navigation bar follow desired background color and theme-mode easily.
      // This looks much better and as it should on Android devices.
      // It also supports system navbar with opacity or fully transparent
      // Android system navigation bar on Android SDK >= 29.
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: widget.controller.navBarStyle,
        useDivider: widget.controller.useNavDivider,
        opacity: widget.controller.sysBarOpacity,
      ),

      child: ResponsiveScaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: AppData.desktopBreakpoint,
        title: isPhone
            ? Text(AppColor.schemes[widget.controller.schemeIndex].name)
            : Text('${AppData.title(context)} - '
                '${AppColor.schemes[widget.controller.schemeIndex].name}'),
        menuTitle: const Text(AppData.appName),
        menuLeadingTitle: Text(
          'Themes Playground',
          style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
        ),
        menuLeadingSubtitle: const Text('Version ${AppData.versionMajor}'),
        menuLeadingAvatarLabel: 'FCS',
        // Callback from menu, using simple index based actions here.
        onSelect: (int index) async {
          // Open all cards
          if (index == 0) {
            for (int i = 0; i < isCardOpen.length; i++) {
              isCardOpen[i] = true;
            }
            setState(() {});
          }
          // Close all cards
          if (index == 1) {
            for (int i = 0; i < isCardOpen.length; i++) {
              isCardOpen[i] = false;
            }
            setState(() {});
          }
          // Copy theme setup code
          if (index == 2) {
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
          // Reset theme settings.
          if (index == 4) {
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
          // Set theme-mode light/dark
          if (index == 5) {
            if (isDark) {
              await widget.controller.setThemeMode(ThemeMode.light);
            } else {
              await widget.controller.setThemeMode(ThemeMode.dark);
            }
          }
          // Toggle advanced view mode true/false
          if (index == 6) {
            await widget.controller
                .setAdvancedView(!widget.controller.advancedView);
          }
        },
        body: widget.controller.advancedView
            ? AdvancedView(
                controller: widget.controller,
                scrollController: scrollController,
                isCardOpen: isCardOpen,
                toggleCard: toggleCard,
              )
            : FocusedView(controller: widget.controller),
      ),
    );
  }
}
