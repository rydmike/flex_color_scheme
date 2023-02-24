import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/const/app_data.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/header_card.dart';
import 'theme_color_selector.dart';
import 'theme_panel.dart';
import 'theme_topic.dart';
import 'theme_topic_selector.dart';

// ignore_for_file: comment_references

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off there too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && false;

/// This is the two theme topics view of the Playground.
///
/// Used only on big desktops, when desktop size is over
/// [App.mediumDesktopWidthBreakpoint] in width.
///
/// This view no longer like the [ThemeTopicPage] keep the content of the two
/// side-by-side theme topic panels in a [PageView], in fact there is no
/// [PageView] in this layout, it is a lot simpler that way.
/// It is just a [CustomScrollView] with a [SliverPersistentHeader] and the
/// same [ThemeColorSelectorHeaderDelegate] that is used in the large masonry
/// grid view.
///
/// The used [VerticalThemePanelView]s are identical, they just use different
/// index and have control that selects if the [ThemeTopicSelectorVertical]
/// selector should be on the left o right side.
///
/// One advantage with this scroll view is that the two sides scroll
/// independently from each other, not as in the [ThemeTopicPage] where they
/// are in the same [PageView] and partially scroll together.
///
/// This view was a quick rework of [ThemeTopicPage] to create a totally
/// new layout by mostly re-using already existing parts in the app.
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
  late int previousSchemeIndex;
  late bool previousUseFlexColorScheme;
  late bool previousUseSubThemes;
  late bool updateDelegate;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController(
      keepScrollOffset: true,
      debugLabel: 'ThemeTwoTopicsPageScrollController',
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
    final bool isPinned = media.size.height >= App.pinnedSelector;
    final bool isPhone = media.size.width < App.phoneWidthBreakpoint ||
        media.size.height < App.phoneHeightBreakpoint ||
        isCompact;
    final double phoneReduce = isPhone ? App.colorButtonPhoneReduce : 0;
    final double margins = App.responsiveInsets(media.size.width, isCompact);
    // The height diff of the switch = dense - normal.
    final double phoneSwitchReduce =
        isPhone ? _kHeightDenseListTile - _kHeightNormaListTile : 0;
    // The height diff with switches removed.
    final double switchRemove = isCompact ? -_kHeightDenseListTile : 0;
    // All the above is so we can below calculate how high the
    // [ThemeColorSelectorHeaderDelegate] extent should be in different modes,
    // compact and phone responsive layouts.
    final double headerExtent = _kHeightSelector +
        media.padding.top +
        margins * 3 +
        phoneReduce +
        phoneSwitchReduce +
        switchRemove;
    // It was tricky to figure out all the extent details, these helped.
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
    return CustomScrollView(controller: scrollController, slivers: <Widget>[
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
      SliverPadding(
        padding: EdgeInsets.only(top: margins),
        sliver: SliverFillRemaining(
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
    ]);
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
      debugLabel: widget.isRight ? 'Right panel' : 'Left panel',
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
    final double margins = App.responsiveInsets(media.size.width, isCompact);
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
              // TODO(rydmike): Do we keep bounce or clamp it down. TBD.
              // physics: const ClampingScrollPhysics(),
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
