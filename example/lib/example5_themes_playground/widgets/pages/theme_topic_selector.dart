import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../shared/const/app_data.dart';
import '../../../shared/utils/app_scroll_behavior.dart';
import '../../../shared/utils/colors_are_close.dart';
import 'theme_topic.dart';

/// Horizontal panel selector of active theme topic to view.
///
/// Used in phone, tablet, small and medium desktop view.
class ThemeTopicSelectorHorizontal extends StatefulWidget {
  const ThemeTopicSelectorHorizontal({
    super.key,
    required this.page,
    required this.onSelect,
    required this.isCompact,
  });
  final int page;
  final ValueChanged<int> onSelect;
  final bool isCompact;

  @override
  State<ThemeTopicSelectorHorizontal> createState() =>
      _ThemeTopicSelectorHorizontalState();
}

class _ThemeTopicSelectorHorizontalState
    extends State<ThemeTopicSelectorHorizontal> {
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
  void didUpdateWidget(covariant ThemeTopicSelectorHorizontal oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (selectedPage != widget.page) {
      selectedPage = widget.page;
      final MediaQueryData media = MediaQuery.of(context);
      final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
          media.size.height < AppData.phoneHeightBreakpoint ||
          widget.isCompact;
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
        media.size.height < AppData.phoneHeightBreakpoint ||
        widget.isCompact;
    final double margins =
        AppData.responsiveInsets(media.size.width, widget.isCompact);
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
                        itemCount: themeTopics.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _ThemeTopicButton(
                            item: themeTopics[index],
                            onSelect: () {
                              widget.onSelect(index);
                              setState(() {
                                selectedPage = index;
                              });
                            },
                            selected: selectedPage == index,
                            isCompact: widget.isCompact,
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

/// Vertical theme topic selector used in two columns view.
///
/// Used only on large desktop views.
class ThemeTopicSelectorVertical extends StatefulWidget {
  const ThemeTopicSelectorVertical({
    super.key,
    required this.page,
    required this.onSelect,
    required this.isCompact,
    this.isRight = false,
  });
  final int page;
  final ValueChanged<int> onSelect;
  final bool isCompact;
  final bool isRight;

  @override
  State<ThemeTopicSelectorVertical> createState() =>
      _ThemeTopicSelectorVerticalState();
}

class _ThemeTopicSelectorVerticalState
    extends State<ThemeTopicSelectorVertical> {
  late final ScrollController scrollController;
  late int selectedPage;
  late double scrollOffset;
  static const double effectiveWidth =
      AppData.panelButtonWidth + AppData.panelButtonPhoneWidthReduce;
  static const double effectiveHeight = AppData.panelButtonHeight +
      AppData.edgeInsetsPhone * 2 +
      AppData.panelButtonPhoneHeightReduce;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.page;
    scrollOffset = (effectiveHeight - 4 * 2) * selectedPage;
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
  void didUpdateWidget(covariant ThemeTopicSelectorVertical oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (selectedPage != widget.page) {
      selectedPage = widget.page;
      scrollOffset = (effectiveHeight - 4 * 2) * selectedPage;
      unawaited(scrollController.animateTo(scrollOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic));
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double margins =
        AppData.responsiveInsets(media.size.width, widget.isCompact);

    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: effectiveWidth + margins),
      child: ScrollConfiguration(
        behavior: const DragScrollBehavior(),
        child: ListView.builder(
          padding: EdgeInsets.only(
            left: widget.isRight ? 0 : margins - 4,
            right: widget.isRight ? margins - 4 : 0,
            bottom: margins,
          ),
          controller: scrollController,
          primary: false,
          physics: const ClampingScrollPhysics(),
          itemCount: themeTopics.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: SizedBox(
                height: effectiveHeight - 4 * 3,
                child: _ThemeTopicButton(
                  item: themeTopics[index],
                  onSelect: () {
                    widget.onSelect(index);
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  selected: selectedPage == index,
                  isCompact: true,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// A button with [ThemeTopic] button label and icon.
class _ThemeTopicButton extends StatelessWidget {
  const _ThemeTopicButton({
    required this.item,
    required this.selected,
    required this.onSelect,
    required this.isCompact,
  });
  final ThemeTopic item;
  final bool selected;
  final VoidCallback onSelect;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint ||
        isCompact;
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

    final Color scaffoldBackground = theme.scaffoldBackgroundColor;

    final bool isLight = theme.brightness == Brightness.light;
    final Color background = Color.alphaBlend(
        scheme.surfaceTint.withAlpha(isLight ? 12 : 30), cardColor);

    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    final Color textColor = theme.colorScheme.onBackground.withAlpha(0xCC);

    final Color unselectedColor =
        colorsAreClose(background, scaffoldBackground, isLight) ||
                colorsAreClose(cardColor, scaffoldBackground, isLight)
            ? theme.dividerColor
            : Colors.transparent;

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
            : BorderSide(color: unselectedColor),
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
            : BorderSide(color: unselectedColor),
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
