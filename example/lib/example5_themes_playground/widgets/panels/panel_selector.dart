import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../shared/const/app_data.dart';
import '../../../shared/utils/app_scroll_behavior.dart';
import 'panel_item.dart';

// PanelSelectorHeaderDelegate for our custom SliverPersistentHeader.
//
// Used to keep a part of our nested scroll view pinned to the top
// (in tablet desktop view), and floating on phone and snapping
// back when scrolling back just a bit.
class PanelSelectorHeaderDelegate extends SliverPersistentHeaderDelegate {
  PanelSelectorHeaderDelegate({
    required this.vsync,
    required this.extent,
    required this.page,
    required this.previousPage,
    required this.onSelect,
  });
  @override
  final TickerProvider vsync;
  final double extent;
  final int page;
  final int previousPage;
  final ValueChanged<int> onSelect;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return PanelSelector(
      page: page,
      onSelect: onSelect,
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

/// Horizontal panel selector of active panel page to view.
class PanelSelector extends StatefulWidget {
  const PanelSelector({
    super.key,
    required this.page,
    required this.onSelect,
  });
  final int page;
  final ValueChanged<int> onSelect;

  @override
  State<PanelSelector> createState() => _PanelSelectorState();
}

class _PanelSelectorState extends State<PanelSelector> {
  late final ScrollController scrollController;
  late int selectedPage;
  late double scrollOffset;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.page;
    scrollOffset = AppData.panelButtonWidth * selectedPage;
    scrollController = ScrollController(
      keepScrollOffset: true,
      initialScrollOffset: scrollOffset,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PanelSelector oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (selectedPage != widget.page) {
      selectedPage = widget.page;
      final MediaQueryData media = MediaQuery.of(context);
      final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
          media.size.height < AppData.phoneHeightBreakpoint;
      final double effectiveWidth = AppData.panelButtonWidth +
          (isPhone ? AppData.panelButtonPhoneWidthReduce : 0);
      scrollOffset = effectiveWidth * selectedPage;
      unawaited(scrollController.animateTo(scrollOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic));
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint;
    final double margins = AppData.responsiveInsets(media.size.width);
    final double effectiveHeight = AppData.panelButtonHeight +
        margins * 2 +
        (isPhone ? AppData.panelButtonPhoneHeightReduce : 0);
    final double topPadding = media.padding.top;

    return Material(
      color: Theme.of(context).colorScheme.surfaceTint.withAlpha(0x38),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding:
                EdgeInsets.only(top: topPadding + margins, bottom: margins),
            child: SizedBox(
              height: effectiveHeight - margins,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: const DragScrollBehavior(),
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: margins - 4),
                        controller: scrollController,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: panelItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _PanelButton(
                            item: panelItems[index],
                            onSelect: () {
                              widget.onSelect(index);
                              setState(() {
                                selectedPage = index;
                              });
                            },
                            selected: selectedPage == index,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PanelButton extends StatelessWidget {
  const _PanelButton({
    required this.item,
    required this.selected,
    required this.onSelect,
  });
  final PanelItem item;
  final bool selected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint;
    final double effectiveWidth = AppData.panelButtonWidth +
        (isPhone ? AppData.panelButtonPhoneWidthReduce : 0);
    final double textSize = isPhone ? 10 : 11;
    final double iconSize = isPhone ? 28 : 45;
    final double borderWidth = isPhone ? 3 : 5;
    final double verticalPadding = isPhone ? 6 : 10;
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final Color cardColor = theme.cardColor;
    final Color background =
        Color.alphaBlend(scheme.surfaceTint.withAlpha(15), cardColor);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    final Color textColor = theme.colorScheme.onBackground.withAlpha(0xCC);
    // Get the card's ShapeBorder from the theme card shape
    ShapeBorder? shapeBorder = theme.cardTheme.shape;
    // Make a shape border if our background color is close in color
    // to the scaffold background color, because if that happens we want to
    // separate it from the background with a border.
    // If we had one shape, copy in a border side to it.
    if (shapeBorder is RoundedRectangleBorder) {
      shapeBorder = shapeBorder.copyWith(
        side: selected
            ? BorderSide(color: iconColor, width: borderWidth)
            : BorderSide(color: theme.dividerColor),
      );
      // If
    } else {
      // If border was null, make one matching Card default, but with a
      // BorderSide, if it was not null, we leave it as it was, it means it
      // has some other preexisting ShapeBorder, but it was not a
      // RoundedRectangleBorder, we don't know what it was, just let it be.
      shapeBorder ??= RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(useMaterial3 ? 12 : 4)),
        side: selected
            ? BorderSide(color: iconColor, width: borderWidth)
            : BorderSide(color: theme.dividerColor),
      );
    }
    return SizedBox(
      width: effectiveWidth,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        color: background,
        shape: shapeBorder,
        child: InkWell(
          onTap: onSelect,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  item.icon,
                  size: iconSize,
                  color: iconColor,
                ),
                Text(
                  item.buttonLabel,
                  style: theme.textTheme.labelSmall!.copyWith(
                    color: textColor,
                    fontSize: textSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
