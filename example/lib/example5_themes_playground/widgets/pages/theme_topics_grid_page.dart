import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../shared/const/app.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/header_card.dart';
import 'theme_color_selector.dart';
import 'theme_panel.dart';
import 'theme_topic.dart';

// ignore_for_file: comment_references

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off there too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && false;

// TODO(rydmike): Considering removing the grid view totally.
//  Now that ThemeTopicPage can be set to view any two panels side-by-side,
//  this grid view is not so useful anymore. Maybe we remove it totally?
//  Do a Tweet and GitHub discussions poll about it later.

/// This is the super large masonry grid layout of the Themes Playground.
///
/// It is somewhat useful on a 4k screen, since you can see and use a lot
/// of settings in one view.
///
/// It works thanks to collapsible panels and responsive layout down to
/// phone size too, but the [ThemeTopicPage] is more convenient on phone and
/// tablet sizes.
///
/// Considering removing this view from the Themes Playground. If you happen
/// to read this let me know in the repo discussions poll here:
///
class ThemeTopicsGridPage extends StatefulWidget {
  const ThemeTopicsGridPage({
    super.key,
    required this.controller,
    required this.isCardOpen,
    required this.toggleCard,
  });
  final ThemeController controller;
  final List<bool> isCardOpen;
  final ValueChanged<int> toggleCard;

  @override
  State<ThemeTopicsGridPage> createState() => _ThemeTopicsGridPageState();
}

class _ThemeTopicsGridPageState extends State<ThemeTopicsGridPage>
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
      debugLabel: 'masonryGridScrollController',
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
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final bool isCompact = widget.controller.compactMode;
    final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint ||
        isCompact;

    final double phoneReduce = isPhone ? App.colorButtonPhoneReduce : 0;
    final bool isPinned = mediaSize.height >= App.pinnedSelector;
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    final ThemeController controller = widget.controller;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // Just a suitable breakpoint for when we want to have more
      // than one column in the body with this particular content.
      final int columns = constraints.maxWidth ~/ 860 + 1;
      final double margins = App.responsiveInsets(mediaSize.width, isCompact);
      // The height diff of the switch = dense - normal.
      final double phoneSwitchReduce =
          isPhone ? _kHeightDenseListTile - _kHeightNormaListTile : 0;
      // The height diff with switches removed.
      final double switchRemove = isCompact ? -_kHeightDenseListTile : 0;
      final double headerExtent = _kHeightSelector +
          mediaPadding.top +
          margins * 3 +
          phoneReduce +
          phoneSwitchReduce +
          switchRemove;
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
            padding: EdgeInsets.fromLTRB(
              margins,
              margins,
              margins,
              margins + mediaPadding.bottom,
            ),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: columns,
              mainAxisSpacing: margins,
              crossAxisSpacing: margins,
              childCount: widget.isCardOpen.length,
              itemBuilder: (BuildContext context, int index) => HeaderCard(
                title: Text(themeTopics[index].heading),
                info: themeTopics[index].info,
                leading: Icon(themeTopics[index].icon, color: iconColor),
                isOpen: widget.isCardOpen[index],
                onTap: () {
                  widget.toggleCard(index);
                },
                child: ThemePanel(index, controller),
              ),
            ),
          ),
        ],
      );
    });
  }
}
