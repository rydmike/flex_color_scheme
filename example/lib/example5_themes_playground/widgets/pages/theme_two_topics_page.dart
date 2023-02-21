import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/const/app_data.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/header_card.dart';
import 'theme_color_selector.dart';
import 'theme_panel.dart';
import 'theme_topic.dart';
import 'theme_topic_selector.dart';

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off there too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && false;

// TODO(rydmike): Consider a new responsive large layout where both panels
// have on left and right side their own panel selector and scroll
// independently. This would be simpler on wide screen and more efficient
// and provide even more usable vertical space than compact mode.
// Compact toggle could still be kept.

/// This is the two theme topics view of the Playground.
///
/// Used only on big desktops.
class ThemeTwoTopicsPage extends StatefulWidget {
  const ThemeTwoTopicsPage({
    super.key,
    required this.controller,
  });
  final ThemeController controller;

  @override
  State<ThemeTwoTopicsPage> createState() => _ThemeTwoTopicsPageState();
}

class _ThemeTwoTopicsPageState extends State<ThemeTwoTopicsPage>
    with TickerProviderStateMixin {
  late final ScrollController scrollController;
  // late int previousPage;
  late int previousSchemeIndex;
  late bool previousUseFlexColorScheme;
  late bool previousUseSubThemes;
  late bool updateDelegate;

  @override
  void initState() {
    super.initState();
    // previousPage = widget.controller.viewIndex;
    scrollController = ScrollController(
      keepScrollOffset: true,
      debugLabel: 'PanelViewScrollController',
    );
    previousSchemeIndex = widget.controller.schemeIndex;
    previousUseFlexColorScheme = widget.controller.useFlexColorScheme;
    previousUseSubThemes = widget.controller.useSubThemes;
    updateDelegate = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateDelegate = false;
    if (widget.controller.schemeIndex != previousSchemeIndex) {
      previousSchemeIndex = widget.controller.schemeIndex;
      updateDelegate = true;
    }
    if (widget.controller.useFlexColorScheme != previousUseFlexColorScheme) {
      previousUseFlexColorScheme = widget.controller.useFlexColorScheme;
      updateDelegate = true;
    }
    if (widget.controller.useSubThemes != previousUseSubThemes) {
      previousUseSubThemes = widget.controller.useSubThemes;
      updateDelegate = true;
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // The fixed desktop height of the theme selector control,
  // before any margin and media size adjustments
  static const double _kHeightSelector = 118;
  // Magic numbers for normal and dense ListTile
  static const double _kHeightNormaListTile = 52;
  static const double _kHeightDenseListTile = 44;

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = widget.controller;
    final MediaQueryData media = MediaQuery.of(context);
    final bool isCompact = widget.controller.compactMode;
    final bool isPinned = media.size.height >= AppData.pinnedSelector;
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint ||
        isCompact;
    final double phoneReduce = isPhone ? AppData.colorButtonPhoneReduce : 0;
    final double margins =
        AppData.responsiveInsets(media.size.width, isCompact);
    // The height diff of the switch = dense - normal.
    final double phoneSwitchReduce =
        isPhone ? _kHeightDenseListTile - _kHeightNormaListTile : 0;
    // The height diff with switches removed.
    final double switchRemove = isCompact ? -_kHeightDenseListTile : 0;
    final double headerExtent = _kHeightSelector +
        media.padding.top +
        margins * 3 +
        phoneReduce +
        phoneSwitchReduce +
        switchRemove;
    if (_debug) {
      debugPrint('headerExtent ............ : $headerExtent');
      debugPrint('margins ................. : $margins');
      debugPrint('phoneReduce ............. : $phoneReduce');
      debugPrint('kToolbarHeight .......... : $kToolbarHeight');
      debugPrint('media.viewPadding.top.... : ${media.viewPadding.top}');
      debugPrint('media.viewPadding.bottom. : ${media.viewPadding.bottom}');
      debugPrint('media.padding.top ....... : ${media.padding.top}');
      debugPrint('media.padding.bottom..... : ${media.padding.bottom}');
      debugPrint('media.size.width ........ : ${media.size.width}');
      debugPrint('media.size.height ....... : ${media.size.height}');
    }
    return Scrollbar(
      controller: scrollController,
      child: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool value) {
          return <Widget>[
            SliverPersistentHeader(
              pinned: isPinned,
              floating: true,
              delegate: ThemeColorSelectorHeaderDelegate(
                vsync: this,
                extent: headerExtent,
                controller: controller,
                updateDelegate: updateDelegate,
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(top: margins),
          child: Row(
            children: <Widget>[
              VerticalThemePanelView(
                key: const ValueKey<String>('Left Panel'),
                panel: controller.viewIndex,
                onPanelChanged: controller.setViewIndex,
                controller: controller,
              ),
              VerticalThemePanelView(
                key: const ValueKey<String>('Right Panel'),
                isRight: true,
                panel: controller.sideViewIndex,
                onPanelChanged: controller.setSideViewIndex,
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A [ThemePanel] wrapper that puts the content of our panels in a [Row]
/// with a [ThemeTopicSelectorVertical] on the left or right of a [ThemePanel]
/// in a [ListView] inside a HeaderCard.
///
/// The [isRight] property is used to control if the
/// [ThemeTopicSelectorVertical] goes on left or right side of the [ThemePanel].
class VerticalThemePanelView extends StatefulWidget {
  const VerticalThemePanelView({
    required this.panel,
    this.isRight = false,
    required this.onPanelChanged,
    required this.controller,
    super.key,
  });
  final int panel;
  final bool isRight;
  final ThemeController controller;
  final ValueChanged<int>? onPanelChanged;

  @override
  State<VerticalThemePanelView> createState() => _VerticalThemePanelViewState();
}

class _VerticalThemePanelViewState extends State<VerticalThemePanelView> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(
      keepScrollOffset: true,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);

    final MediaQueryData media = MediaQuery.of(context);
    final bool isCompact = widget.controller.compactMode;
    final double margins =
        AppData.responsiveInsets(media.size.width, isCompact);
    final double bottomPadding = media.padding.bottom;

    return Expanded(
      child: Row(
        children: <Widget>[
          if (!widget.isRight)
            ThemeTopicSelectorVertical(
              key: const ValueKey<String>('Left Selector'),
              page: widget.panel,
              onSelect: (int newIndex) {
                widget.onPanelChanged?.call(newIndex);
              },
              isCompact: isCompact,
              isRight: widget.isRight,
            ),
          Expanded(
            child: ListView(
              primary: false,
              controller: scrollController,
              padding: EdgeInsets.fromLTRB(
                widget.isRight ? margins / 2 : 4,
                0,
                widget.isRight ? 4 : margins / 2,
                margins + bottomPadding,
              ),
              children: <Widget>[
                HeaderCard(
                  title: Text(themeTopics[widget.panel].heading),
                  leading:
                      Icon(themeTopics[widget.panel].icon, color: iconColor),
                  child: ThemePanel(widget.panel, widget.controller),
                ),
              ],
            ),
          ),
          if (widget.isRight)
            ThemeTopicSelectorVertical(
              key: const ValueKey<String>('Right Selector'),
              page: widget.panel,
              onSelect: (int newIndex) {
                widget.onPanelChanged?.call(newIndex);
              },
              isCompact: isCompact,
              isRight: widget.isRight,
            ),
        ],
      ),
    );
  }
}
