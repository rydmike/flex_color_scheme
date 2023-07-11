import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../shared/const/app.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/utils/app_scroll_behavior.dart';
import '../../../shared/utils/colors_are_close.dart';
import '../../../shared/widgets/universal/header_card.dart';
import '../shared/color_scheme_box.dart';
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

/// This is the single [ThemeTopic] PageView of the Playground.
///
/// It shows one or two panels at a time, in a single [PageView].
/// This is a nice layout on mid size screen, like tablets,
/// and it works really well on phones too as it features a sliver persistent
/// header delegate that scrolls away the topic panel selections.
///
/// The vertical scrolling of the two side-by-side panels are a bit
/// interlinked, since:
///
/// a) They are in the same PageView.
/// b) They are in the same sliver custom scroll scroll view
///
/// Despite this they do scroll semin independently as the one that has nothing
/// more to scroll, will say put showing most of its content while the other
/// side still scroll ups.
///
/// On bigger screens it shows two panels side-by-side, where the left secondary
/// one can be selected via a popup menu. This is a bit cumbersome, but takes
/// up very little space. See the [ThemeTwoTopicsPage] for one that features
/// own vertical topic selectors for each panel.
class ThemeTopicPage extends StatefulWidget {
  const ThemeTopicPage({
    super.key,
    required this.controller,
  });
  final ThemeController controller;

  @override
  State<ThemeTopicPage> createState() => _ThemeTopicPageState();
}

class _ThemeTopicPageState extends State<ThemeTopicPage>
    with TickerProviderStateMixin {
  late final PageController pageController;
  late final ScrollController scrollController;
  late int previousPage;

  late final AnimationController scaleController = AnimationController(
    duration: const Duration(milliseconds: 260),
    lowerBound: 0.80,
    upperBound: 1.0,
    vsync: this,
  );
  late final Animation<double> scaleAnimation = CurvedAnimation(
    parent: scaleController,
    curve: Curves.fastOutSlowIn,
  );

  late final AnimationController fadeController = AnimationController(
    duration: const Duration(milliseconds: 260),
    lowerBound: 0.2,
    upperBound: 1.0,
    vsync: this,
  );
  late final Animation<double> fadeAnimation = CurvedAnimation(
    parent: fadeController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: widget.controller.viewIndex,
    );
    previousPage = widget.controller.viewIndex;
    scrollController =
        ScrollController(debugLabel: 'PanelViewScrollController');
    scaleController.value = 1.0;
    fadeController.value = 1.0;
  }

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    scaleController.dispose();
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeCtrl = widget.controller;
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final bool isCompact = widget.controller.compactMode;
    final bool isPinned = mediaSize.height >= App.pinnedSelector;
    final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint ||
        isCompact;
    final double margins = App.responsiveInsets(mediaSize.width, isCompact);
    final double buttonHeight = App.panelButtonHeight +
        (isPhone ? App.panelButtonPhoneHeightReduce : 0);
    final double buttonWidth =
        App.panelButtonWidth + (isPhone ? App.panelButtonPhoneWidthReduce : 0);
    // All the above is so we can below calculate how high the
    // [_ThemeTopicSelectorHeaderDelegate] extent should be in different modes,
    // compact and phone responsive layouts.
    final double headerExtent = buttonHeight + mediaPadding.top + margins * 2;
    // It was tricky to figure out all the extent details, these helped.
    if (_debug) {
      debugPrint('headerExtent ............ : $headerExtent');
      debugPrint('margins ................. : $margins');
      debugPrint('kToolbarHeight .......... : $kToolbarHeight');
      debugPrint('media.padding.top ....... : ${mediaPadding.top}');
      debugPrint('media.padding.bottom..... : ${mediaPadding.bottom}');
      debugPrint('media.size.width ........ : ${mediaSize.width}');
      debugPrint('media.size.height ....... : ${mediaSize.height}');
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
              delegate: _ThemeTopicSelectorHeaderDelegate(
                  vsync: this,
                  extent: headerExtent,
                  page: themeCtrl.viewIndex,
                  previousPage: previousPage,
                  isCompact: isCompact,
                  buttonWidth: buttonWidth,
                  onSelect: (int index) {
                    if (previousPage != index) {
                      setState(() {
                        previousPage = index;
                      });
                    }
                    if (themeCtrl.viewIndex != index) {
                      themeCtrl.setViewIndex(index);
                      // This is a handmade scale and fade up animation
                      // when user taps on ThemeTopic, we use this instead
                      // of animating to the page with the page controller.
                      // We jump to the page and trigger a slight
                      // fade and zoom in effect. Without this, it is hard too
                      // notice that the page changed, and this fade-zoom-in
                      // fits well on a tablet view. If we animate to page with
                      // the page view controller, it also looks very confusing.
                      scaleController.value = 0.8;
                      fadeController.value = 0.2;
                      scaleController.forward();
                      fadeController.forward();
                      pageController.jumpToPage(themeCtrl.viewIndex);
                    }
                  }),
            ),
            // SliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: margins),
                child: ThemeColorSelector(controller: themeCtrl),
              ),
            ),
          ];
        },
        body: PageView.builder(
          controller: pageController,
          itemCount: themeTopics.length,
          onPageChanged: (int pageIndex) {
            setState(() {
              previousPage = themeCtrl.viewIndex;
            });
            themeCtrl.setViewIndex(pageIndex);
          },
          itemBuilder: (BuildContext context, int pageIndex) {
            return ScaleTransition(
              scale: scaleAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: _ThemePanelView(pageIndex, themeCtrl),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// A [ThemePanel] wrapper that puts the content of them, in a [ListView]
/// inside a [HeaderCard].
///
/// The view can show two panels side by side when the screen is wide enough,
/// the second panel is selected with a popup menu.
///
/// The ListView is needed so it grows as far as needed inside the page
/// in its PageView.
class _ThemePanelView extends StatelessWidget {
  const _ThemePanelView(this.leftPageIndex, this.controller);
  final int leftPageIndex;
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);

    // Logic to show divider
    final Color background = theme.scaffoldBackgroundColor;
    final Color cardColor = theme.cardColor;
    final Color headerColor = Color.alphaBlend(
        theme.colorScheme.surfaceTint.withAlpha(isLight ? 12 : 15), cardColor);
    final bool showDivider = !(colorsAreClose(cardColor, background, isLight) ||
        colorsAreClose(headerColor, background, isLight));

    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final bool isCompact = controller.compactMode;
    final double margins = App.responsiveInsets(mediaSize.width, isCompact);
    final double bottomPadding = mediaPadding.bottom;

    final int sideViewIndex = controller.sideViewIndex;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // A custom breakpoint, when the layout width is larger than breakpoint
      // we show the code panel in a side-by side view.
      final bool showSecondPage =
          constraints.maxWidth >= App.sideBySideViewBreakpoint;
      // We get double implicit scrollbars and that causes issues with the
      // scroll controller, this removes it, we don't need one here.
      return Row(
        children: <Widget>[
          ScrollConfiguration(
            behavior: const NoScrollbarBehavior(),
            // This ListView allows the content in the PageView to scroll
            // vertically as a part of the NestedScroll view the PageView is
            // included in, but by itself. We need the ListView to allow
            // its page content to grow beyond the visible page.
            child: Expanded(
              child: ListView(
                padding: EdgeInsetsDirectional.fromSTEB(
                  margins,
                  0,
                  showSecondPage ? 0 : margins,
                  margins + bottomPadding,
                ),
                children: <Widget>[
                  HeaderCard(
                    endStraight: showSecondPage,
                    title: Text(themeTopics[leftPageIndex].heading),
                    info: themeTopics[leftPageIndex].info,
                    leading:
                        Icon(themeTopics[leftPageIndex].icon, color: iconColor),
                    child: ThemePanel(leftPageIndex, controller),
                  ),
                ],
              ),
            ),
          ),
          if (showSecondPage && showDivider)
            VerticalDivider(
              width: 1,
              color: background,
            ),
          if (showSecondPage)
            Expanded(
              child: ListView(
                  controller: ScrollController(),
                  primary: false,
                  padding: EdgeInsetsDirectional.fromSTEB(
                    0,
                    0,
                    margins,
                    margins + bottomPadding,
                  ),
                  children: <Widget>[
                    HeaderCard(
                      startStraight: true,
                      title: Text(themeTopics[sideViewIndex].heading),
                      info: themeTopics[sideViewIndex].info,
                      leading: Icon(themeTopics[sideViewIndex].icon,
                          color: iconColor),
                      trailing: _SelectSideThemePanelView(
                        index: sideViewIndex,
                        onChanged: controller.setSideViewIndex,
                        iconColor: iconColor,
                      ),
                      child: ThemePanel(sideViewIndex, controller),
                    ),
                  ]),
            )
        ],
      );
    });
  }
}

/// [_ThemeTopicSelectorHeaderDelegate] for the used custom
/// [SliverPersistentHeader].
///
/// Used to keep a part of our nested scroll view pinned to the top
/// (in tablet desktop view), and floating on phone and snapping
/// back when scrolling back just a bit.
class _ThemeTopicSelectorHeaderDelegate extends SliverPersistentHeaderDelegate {
  _ThemeTopicSelectorHeaderDelegate({
    required this.vsync,
    required this.extent,
    required this.page,
    required this.previousPage,
    required this.onSelect,
    required this.isCompact,
    required this.buttonWidth,
  });
  @override
  final TickerProvider vsync;
  final double extent;
  final int page;
  final int previousPage;
  final ValueChanged<int> onSelect;
  final bool isCompact;
  final double buttonWidth;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ThemeTopicSelectorHorizontal(
      page: page,
      onSelect: onSelect,
      isCompact: isCompact,
      buttonWidth: buttonWidth,
    );
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent ||
        previousPage != page;
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration =>
      FloatingHeaderSnapConfiguration();
}

/// Widget used to select used side-by-side second [ThemePanel] using
/// a popup menu.
class _SelectSideThemePanelView extends StatelessWidget {
  const _SelectSideThemePanelView({
    required this.index,
    this.onChanged,
    required this.iconColor,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;
    final IconThemeData selectedIconTheme =
        theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
    final IconThemeData unSelectedIconTheme =
        theme.iconTheme.copyWith(color: iconColor);

    return PopupMenuButton<int>(
      initialValue: index,
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        onChanged?.call(index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i < themeTopics.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: index == i
                  ? IconTheme(
                      data: selectedIconTheme,
                      child: ColorSchemeBox(
                        backgroundColor: iconColor,
                        borderColor: Colors.transparent,
                        child: Icon(themeTopics[i].icon),
                      ),
                    )
                  : IconTheme(
                      data: unSelectedIconTheme,
                      child: ColorSchemeBox(
                        backgroundColor: Colors.transparent,
                        borderColor: iconColor,
                        child: Icon(themeTopics[i].icon),
                      ),
                    ),
              title: Text(themeTopics[i].heading, style: txtStyle),
            ),
          )
      ],
      icon: Icon(
        Icons.more_vert,
        color: iconColor,
      ),
    );
  }
}
