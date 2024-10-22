import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';
import '../../../shared/controllers/theme_controller.dart';
import 'widgets/theme_color_selector_header_delegate.dart';
import 'widgets/topic_selector.dart';
import 'widgets/vertical_panel_view.dart';

// ignore_for_file: comment_references

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off there too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && false;

/// This is the two topics view of the Playground.
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
/// The used [VerticalPanelView]s are identical, they just use different
/// index and have control that selects if the [TopicSelectorVertical]
/// selector should be on the left o right side.
///
/// One advantage with this scroll view is that the two sides scroll
/// independently from each other, not as in the [ThemeTopicPage] where they
/// are in the same [PageView] and partially scroll together.
///
/// This view was a quick rework of [ThemeTopicPage] to create a totally
/// new layout by mostly re-using already existing parts in the app.
class TwoTopicsPage extends StatefulWidget {
  const TwoTopicsPage({
    super.key,
    required this.controller,
  });
  final ThemeController controller;

  @override
  State<TwoTopicsPage> createState() => _TwoTopicsPageState();
}

class _TwoTopicsPageState extends State<TwoTopicsPage>
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
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);

    final bool isCompact = widget.controller.compactMode;
    final bool isPinned = mediaSize.height >= App.pinnedSelector;
    final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint ||
        isCompact;
    final double phoneReduce = isPhone ? App.colorButtonPhoneReduce : 0;
    final double margins = App.responsiveInsets(mediaSize.width, isCompact);
    // The height diff of the switch = dense - normal.
    final double phoneSwitchReduce =
        isPhone ? _kHeightDenseListTile - _kHeightNormaListTile : 0;
    // The height diff with switches removed.
    final double switchRemove = isCompact ? -_kHeightDenseListTile : 0;
    // All the above is so we can below calculate how high the
    // [ThemeColorSelectorHeaderDelegate] extent should be in different modes,
    // compact and phone responsive layouts.
    final double headerExtent = _kHeightSelector +
        mediaPadding.top +
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
      debugPrint('media.padding.top ....... : ${mediaPadding.top}');
      debugPrint('media.padding.bottom..... : ${mediaPadding.bottom}');
      debugPrint('media.size.width ........ : ${mediaSize.width}');
      debugPrint('media.size.height ....... : ${mediaSize.height}');
    }
    return CustomScrollView(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      slivers: <Widget>[
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
                VerticalPanelView(
                  key: const ValueKey<String>('Left Panel'),
                  panel: controller.topicIndexStartSide,
                  onPanelChanged: controller.setTopicIndexStartSide,
                  controller: controller,
                ),
                VerticalPanelView(
                  key: const ValueKey<String>('Right Panel'),
                  isRight: true,
                  panel: controller.topicIndexEndSide,
                  onPanelChanged: controller.setTopicIndexEndSide,
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
