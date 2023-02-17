import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/const/app_data.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/utils/app_scroll_behavior.dart';
import '../../../shared/widgets/universal/header_card.dart';
import '../panels/panel_content.dart';
import '../panels/panel_selector.dart';
import '../panels/theme_color_selector.dart';
import '../panels/theme_topic.dart';
import '../shared/color_scheme_box.dart';

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off there too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && false;

/// This is the smaller more focused single panel view of the Themes Playground.
///
/// It shows one or two panel at a time as a PageView. This is a nice layout
/// on mid size screen, like tablets, probably preferable on a phone too.
class PanelView extends StatefulWidget {
  const PanelView({
    super.key,
    required this.themeController,
  });
  final ThemeController themeController;

  @override
  State<PanelView> createState() => _PanelViewState();
}

class _PanelViewState extends State<PanelView> with TickerProviderStateMixin {
  late final PageController pageController;
  late final ScrollController scrollCtrl;
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
    lowerBound: 0.1,
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
      initialPage: widget.themeController.viewIndex,
    );
    previousPage = widget.themeController.viewIndex;
    scrollCtrl = ScrollController(debugLabel: 'PanelViewScrollController');
    scaleController.value = 1.0;
    fadeController.value = 1.0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // TODO(rydmike): Nasty switch screen bug on platform swap, maybe here?
    // pageController.jumpToPage(widget.themeController.viewIndex);
    previousPage = widget.themeController.viewIndex;
  }

  @override
  void dispose() {
    pageController.dispose();
    scrollCtrl.dispose();
    scaleController.dispose();
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeCtrl = widget.themeController;
    final MediaQueryData media = MediaQuery.of(context);
    final bool isCompact = widget.themeController.compactMode;
    final bool isPinned = media.size.height >= AppData.pinnedSelector;
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint ||
        isCompact;
    final double margins =
        AppData.responsiveInsets(media.size.width, isCompact);
    final double buttonHeight = AppData.panelButtonHeight +
        (isPhone ? AppData.panelButtonPhoneHeightReduce : 0);
    final double headerExtent = buttonHeight + media.padding.top + margins * 2;
    if (_debug) {
      debugPrint('headerExtent ............ : $headerExtent');
      debugPrint('margins ................. : $margins');
      debugPrint('kToolbarHeight .......... : $kToolbarHeight');
      debugPrint('media.viewPadding.top.... : ${media.viewPadding.top}');
      debugPrint('media.viewPadding.bottom. : ${media.viewPadding.bottom}');
      debugPrint('media.padding.top ....... : ${media.padding.top}');
      debugPrint('media.padding.bottom..... : ${media.padding.bottom}');
      debugPrint('media.size.width ........ : ${media.size.width}');
      debugPrint('media.size.height ....... : ${media.size.height}');
    }
    return Scrollbar(
      controller: scrollCtrl,
      child: NestedScrollView(
        controller: scrollCtrl,
        headerSliverBuilder: (BuildContext context, bool value) {
          return <Widget>[
            SliverPersistentHeader(
              pinned: isPinned,
              floating: true,
              delegate: PanelSelectorHeaderDelegate(
                  vsync: this,
                  extent: headerExtent,
                  page: themeCtrl.viewIndex,
                  previousPage: previousPage,
                  isCompact: isCompact,
                  onSelect: (int index) {
                    if (previousPage != index) {
                      setState(() {
                        previousPage = index;
                      });
                    }
                    if (themeCtrl.viewIndex != index) {
                      themeCtrl.setViewIndex(index);
                      // This is a handmade scale and fade up animation
                      // when user taps on header item. We use it instead
                      // animating to the page with the page controller.
                      // Instead we jump to the page and trigger a slight
                      // fade and zoom in effect, without it it is hard too
                      // notice that the page changed.
                      scaleController.value = 0.7;
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
          itemCount: panelItems.length,
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
                child: PanelPage(pageIndex, themeCtrl),
              ),
            );
          },
        ),
      ),
    );
  }
}

// A PanelPage wrapper that puts the content of our panels, in a ListView
// inside a HeaderCard. The ListView is needed so it grows as far as needed
// inside the page in the PageView.
class PanelPage extends StatelessWidget {
  const PanelPage(
    this.leftPageIndex,
    this.controller, {
    super.key,
  });
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

    final MediaQueryData media = MediaQuery.of(context);
    final bool isCompact = controller.compactMode;
    final double margins =
        AppData.responsiveInsets(media.size.width, isCompact);
    final double bottomPadding = media.padding.bottom;

    final int rightPageIndex = controller.sideViewIndex;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // A custom breakpoint, when the layout width is larger than breakpoint
      // we show the code panel in a side-by side view.
      final bool showSecondPage =
          constraints.maxWidth >= AppData.codeViewWidthBreakpoint;
      // We get double implicit scrollbars and that causes issues with the
      // scroll controller, this removes it, we don't need one here.
      return Row(
        children: <Widget>[
          ScrollConfiguration(
            behavior: const NoScrollbarBehavior(),
            // This ListView allows the content in the PageView to scroll
            // vertically as apart of the NestedScroll view the PageView is
            // included in, but by itself, but we need the ListView to allow
            // its page content to grow beyond the visible page.
            child: Expanded(
              child: ListView(
                padding: EdgeInsetsDirectional.fromSTEB(
                  margins,
                  0,
                  margins / (showSecondPage ? 2 : 1),
                  margins + bottomPadding,
                ),
                children: <Widget>[
                  HeaderCard(
                    title: Text(panelItems[leftPageIndex].heading),
                    leading:
                        Icon(panelItems[leftPageIndex].icon, color: iconColor),
                    child: PanelContent(leftPageIndex, controller),
                  ),
                ],
              ),
            ),
          ),
          if (showSecondPage)
            Expanded(
              child: ListView(
                  controller: ScrollController(),
                  padding: EdgeInsetsDirectional.fromSTEB(
                    margins / 2,
                    0,
                    margins,
                    margins + bottomPadding,
                  ),
                  children: <Widget>[
                    HeaderCard(
                      title: Text(panelItems[rightPageIndex].heading),
                      leading: Icon(panelItems[rightPageIndex].icon,
                          color: iconColor),
                      trailing: SelectSecondPage(
                        index: rightPageIndex,
                        onChanged: controller.setSideViewIndex,
                        iconColor: iconColor,
                      ),
                      child: PanelContent(rightPageIndex, controller),
                    ),
                  ]),
            )
        ],
      );
    });
  }
}

/// Widget used to select used side-by-side second panel with a popup menu.
class SelectSecondPage extends StatelessWidget {
  const SelectSecondPage({
    super.key,
    required this.index,
    this.onChanged,
    this.contentPadding,
    required this.iconColor,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.
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
        for (int i = 0; i < panelItems.length; i++)
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
                        child: Icon(panelItems[i].icon),
                      ),
                    )
                  : IconTheme(
                      data: unSelectedIconTheme,
                      child: ColorSchemeBox(
                        backgroundColor: Colors.transparent,
                        borderColor: iconColor,
                        child: Icon(panelItems[i].icon),
                      ),
                    ),
              title: Text(panelItems[i].heading, style: txtStyle),
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
