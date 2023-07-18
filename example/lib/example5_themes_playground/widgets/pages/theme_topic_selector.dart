import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';
import '../../../shared/utils/app_scroll_behavior.dart';
import '../../../shared/utils/colors_are_close.dart';
import 'theme_topic.dart';

// ignore_for_file: comment_references

/// Horizontal panel selector of active theme topic to view.
///
/// Used in phone, tablet, small and medium desktop view.
class ThemeTopicSelectorHorizontal extends StatefulWidget {
  const ThemeTopicSelectorHorizontal({
    super.key,
    required this.page,
    required this.onSelect,
    required this.isCompact,
    required this.buttonWidth,
  });
  final int page;
  final ValueChanged<int> onSelect;
  final bool isCompact;
  final double buttonWidth;

  @override
  State<ThemeTopicSelectorHorizontal> createState() =>
      _ThemeTopicSelectorHorizontalState();
}

class _ThemeTopicSelectorHorizontalState
    extends State<ThemeTopicSelectorHorizontal> {
  late final ScrollController scrollController;
  late int selectedPage;
  late double scrollOffset;
  late double buttonWidth;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.page;
    scrollOffset = widget.buttonWidth * selectedPage;
    scrollController = ScrollController(
      keepScrollOffset: true,
      initialScrollOffset: scrollOffset,
      debugLabel: 'Horizontal topic selector',
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
      scrollOffset = widget.buttonWidth * selectedPage;
      unawaited(scrollController.animateTo(scrollOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint ||
        widget.isCompact;
    final double margins =
        App.responsiveInsets(mediaSize.width, widget.isCompact);
    final double effectiveHeight = App.panelButtonHeight +
        margins * 2 +
        (isPhone ? App.panelButtonPhoneHeightReduce : 0);
    final double topPadding = mediaPadding.top;
    final double buttonHorizontalMargin = isPhone ? 2 : 4;

    return FocusTraversalGroup(
      child: Material(
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
                          padding: EdgeInsets.symmetric(
                            horizontal: margins - buttonHorizontalMargin,
                          ),
                          controller: scrollController,
                          primary: false,
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
                              width: widget.buttonWidth,
                              buttonHorizontalMargin: buttonHorizontalMargin,
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
      ),
    );
  }
}

/// Vertical theme topic selector used in the two columns view.
///
/// Used only on desktop views via [ThemeTwoTopicsPage] and
/// [ThemeTwoTopicsVerticalPage].
class ThemeTopicSelectorVertical extends StatefulWidget {
  const ThemeTopicSelectorVertical({
    super.key,
    required this.page,
    required this.onSelect,
    required this.isCompact,
    this.isRight = false,
    this.addTopPadding = false,
  });
  final int page;
  final ValueChanged<int> onSelect;
  final bool isCompact;
  final bool isRight;
  final bool addTopPadding;

  @override
  State<ThemeTopicSelectorVertical> createState() =>
      _ThemeTopicSelectorVerticalState();
}

class _ThemeTopicSelectorVerticalState
    extends State<ThemeTopicSelectorVertical> {
  late final ScrollController scrollController;
  late int selectedPage;
  late double scrollOffset;

  static const double buttonWidth =
      App.panelButtonWidth + App.panelButtonPhoneWidthReduce - 4;
  static const double buttonHeight = App.panelButtonHeight +
      App.edgeInsetsPhone * 2 +
      App.panelButtonPhoneHeightReduce -
      12;
  static const double buttonMargin = 4;

  static const double heightReduce = 10;
  static const double widthReduce = 14;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.page;
    final double compactHeight = widget.isCompact ? heightReduce : 0;
    scrollOffset = (buttonHeight - compactHeight) * selectedPage;
    scrollController = ScrollController(
      keepScrollOffset: true,
      initialScrollOffset: scrollOffset,
      debugLabel: widget.isRight ? 'Right v topics' : 'Left v topics',
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
      final double compactHeight = widget.isCompact ? heightReduce : 0;
      scrollOffset = (buttonHeight - compactHeight) * selectedPage;
      scrollOffset = buttonHeight * selectedPage;
      unawaited(scrollController.animateTo(scrollOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final double margins =
        App.responsiveInsets(mediaSize.width, widget.isCompact);
    final double topPadding =
        widget.addTopPadding ? mediaPadding.top + margins : 0;
    final double compactWidth = widget.isCompact ? widthReduce : 0;
    final double compactHeight = widget.isCompact ? heightReduce : 0;

    return FocusTraversalGroup(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: buttonWidth + margins - compactWidth),
        child: ScrollConfiguration(
          behavior: const DragScrollBehavior(),
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: widget.isRight ? 0 : margins - buttonMargin,
              right: widget.isRight ? margins - buttonMargin : 0,
              top: topPadding,
              bottom: margins,
            ),
            controller: scrollController,
            primary: false,
            physics: const ClampingScrollPhysics(),
            itemCount: themeTopics.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: buttonMargin),
                child: SizedBox(
                  height: buttonHeight - buttonMargin - compactHeight,
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
                    isSmall: widget.isCompact,
                    width: buttonWidth - compactWidth,
                    buttonHorizontalMargin: buttonMargin,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// A button with [ThemeTopic] button label and icon.
class _ThemeTopicButton extends StatefulWidget {
  const _ThemeTopicButton({
    required this.item,
    required this.selected,
    required this.onSelect,
    required this.isCompact,
    this.isSmall,
    required this.width,
    this.buttonHorizontalMargin = 4,
  });
  final ThemeTopic item;
  final bool selected;
  final VoidCallback onSelect;
  final bool isCompact;
  final bool? isSmall;
  final double width;
  final double buttonHorizontalMargin;

  @override
  State<_ThemeTopicButton> createState() => _ThemeTopicButtonState();
}

class _ThemeTopicButtonState extends State<_ThemeTopicButton> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.sizeOf(context);
    final bool isPhoneSize = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint;
    final bool isPhone = isPhoneSize || widget.isCompact;
    final double textSize = isPhoneSize || widget.isCompact
        ? widget.isSmall ?? false
            ? 8
            : 10
        : 11;
    final double iconSize = isPhoneSize || widget.isCompact
        ? widget.isSmall ?? false
            ? 24
            : 28
        : 45;
    final double borderWidth = isPhone ? 3 : 5;
    final double verticalPadding = isPhone ? 6 : 10;
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final Color cardColor = theme.cardColor;

    final Color scaffoldBackground = theme.scaffoldBackgroundColor;

    final bool isLight = theme.brightness == Brightness.light;

    final Color background = Color.alphaBlend(
        scheme.surfaceTint.withAlpha(isLight ? 10 : 16), cardColor);
    final Color iconColor =
        widget.item.group.color(context); //_onColor(background);
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
        side: widget.selected
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
        side: widget.selected
            ? BorderSide(color: iconColor, width: borderWidth)
            : BorderSide(color: unselectedColor),
      );
    }
    return SizedBox(
      width: widget.width,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: widget.buttonHorizontalMargin),
        color: background,
        shape: shapeBorder,
        child: InkWell(
          focusNode: _focusNode,
          onTap: () {
            _focusNode.requestFocus();
            widget.onSelect.call();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (widget.item.iconTurns == 0)
                  Icon(
                    widget.item.icon,
                    size: iconSize,
                    color: iconColor,
                  )
                else
                  RotatedBox(
                    quarterTurns: widget.item.iconTurns,
                    child: Icon(
                      widget.item.icon,
                      size: iconSize,
                      color: iconColor,
                    ),
                  ),
                Text(
                  widget.item.buttonLabel,
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
