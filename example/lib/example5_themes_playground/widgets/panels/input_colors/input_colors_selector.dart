import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/app_scroll_behavior.dart';

/// Horizontal color scheme selector of schemes in [AppColor.schemes].
///
/// This example uses a StatefulWidget for the scroll controller and
/// index to keep track of previously selected color scheme, so we can animate
/// to the new selection, also done when the themeController schemeIndex is
/// changed via other UI controls, like in the drop box that is also used in
/// this demo as another way to change the color scheme.
///
/// The theme is controlled via the passed in ThemeController.
///
/// This offers a cooler and more visually interactive way of selecting the
/// active theme. The one via the popup menu buttons does te same thing, but
/// this version is kind of cooler. Just to show different ways of doing the
/// same things. This is of course a bit more complicated to build.
class InputColorsSelector extends StatefulWidget {
  const InputColorsSelector({
    super.key,
    required this.controller,
    required this.isPhone,
  });

  final ThemeController controller;
  final bool isPhone;

  @override
  State<InputColorsSelector> createState() => _InputColorsSelectorState();
}

class _InputColorsSelectorState extends State<InputColorsSelector> {
  late final ScrollController scrollController;
  late int schemeIndex;
  late double scrollOffset;

  // The fixed width the scrolling button at desktop size.
  static const double _kWidthOfScrollItem = 67.2;
  // The fixed height of the scrolling button at desktop size.
  static const double _kHeightOfScrollItem = 66;

  @override
  void initState() {
    super.initState();
    schemeIndex = widget.controller.schemeIndex;
    final bool isCompact = widget.controller.compactMode;
    final double phoneReduce =
        widget.isPhone || isCompact ? App.colorButtonPhoneReduce : 0;
    final double phoneButtonsSpacingReduce =
        widget.isPhone || isCompact ? -3 : 0;
    scrollOffset =
        (_kWidthOfScrollItem + phoneReduce + phoneButtonsSpacingReduce) *
            schemeIndex;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.controller.schemeIndex != schemeIndex) {
      final bool isCompact = widget.controller.compactMode;
      final double phoneReduce =
          widget.isPhone || isCompact ? App.colorButtonPhoneReduce : 0;
      final double phoneButtonsSpacingReduce =
          widget.isPhone || isCompact ? -3 : 0;
      schemeIndex = widget.controller.schemeIndex;
      scrollOffset =
          (_kWidthOfScrollItem + phoneReduce + phoneButtonsSpacingReduce) *
              schemeIndex;
      scrollController.jumpTo(scrollOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompact = widget.controller.compactMode;
    final double phoneReduce =
        widget.isPhone || isCompact ? App.colorButtonPhoneReduce : 0;
    final double phoneButtonsSpacingReduce =
        widget.isPhone || isCompact ? -3 : 0;
    return SizedBox(
      height: _kHeightOfScrollItem + phoneReduce,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ScrollConfiguration(
              behavior: const DragScrollBehavior(),
              child: SchemeButtonsList(
                controller: widget.controller,
                scrollController: scrollController,
                scrollDirection: Axis.horizontal,
                phoneButtonsSpacingReduce: phoneButtonsSpacingReduce,
                phoneReduce: phoneReduce,
                onSelect: (int index) {
                  scrollOffset = scrollController.offset;
                  schemeIndex = index;
                  widget.controller.setSchemeIndex(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputColorsSelectorVertical extends StatefulWidget {
  const InputColorsSelectorVertical({
    super.key,
    required this.controller,
  });

  final ThemeController controller;

  @override
  State<InputColorsSelectorVertical> createState() =>
      _InputColorsSelectorVerticalState();
}

class _InputColorsSelectorVerticalState
    extends State<InputColorsSelectorVertical> {
  late final ScrollController scrollController;
  late int schemeIndex;
  late double scrollOffset;

  // The fixed width the scrolling buttons at start big desktop size.
  static const double _kWidthOfScrollItem = 67.2;

  @override
  void initState() {
    super.initState();
    schemeIndex = widget.controller.schemeIndex;
    final bool isCompact = widget.controller.compactMode;
    final double phoneReduce = isCompact ? App.colorButtonPhoneReduce : 0;
    final double phoneButtonsSpacingReduce = isCompact ? -3 : 0;
    scrollOffset =
        (_kWidthOfScrollItem + phoneReduce + phoneButtonsSpacingReduce) *
            schemeIndex;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.controller.schemeIndex != schemeIndex) {
      final bool isCompact = widget.controller.compactMode;
      final double phoneReduce = isCompact ? App.colorButtonPhoneReduce : 0;
      final double phoneButtonsSpacingReduce = isCompact ? -3 : 0;

      schemeIndex = widget.controller.schemeIndex;
      scrollOffset =
          (_kWidthOfScrollItem + phoneReduce + phoneButtonsSpacingReduce) *
              schemeIndex;
      scrollController.jumpTo(scrollOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompact = widget.controller.compactMode;
    final Size mediaSize = MediaQuery.sizeOf(context);
    final double phoneReduce = isCompact ? App.colorButtonPhoneReduce : 0;
    final double phoneButtonsSpacingReduce = isCompact ? -3 : 0;
    final double margins = App.responsiveInsets(mediaSize.width, isCompact);

    return SizedBox(
      width: _kWidthOfScrollItem + phoneReduce + margins,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ScrollConfiguration(
              behavior: const DragScrollBehavior(),
              child: SchemeButtonsList(
                controller: widget.controller,
                scrollController: scrollController,
                scrollDirection: Axis.vertical,
                phoneButtonsSpacingReduce: phoneButtonsSpacingReduce,
                phoneReduce: phoneReduce,
                onSelect: (int index) {
                  scrollOffset = scrollController.offset;
                  schemeIndex = index;
                  widget.controller.setSchemeIndex(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SchemeButtonsList extends StatelessWidget {
  const SchemeButtonsList({
    super.key,
    required this.controller,
    required this.scrollController,
    required this.scrollDirection,
    required this.phoneButtonsSpacingReduce,
    required this.phoneReduce,
    required this.onSelect,
  });

  final ThemeController controller;
  final ScrollController scrollController;
  final Axis scrollDirection;
  final double phoneButtonsSpacingReduce;
  final double phoneReduce;
  final ValueChanged<int> onSelect;

  double _borderRadius(bool useMaterial3) => controller.useSubThemes &&
          controller.useFlexColorScheme
      // FCS default for Card is 12.
      ? (controller.cardBorderRadius ?? App.effectiveRadius(controller) ?? 12)
      // M3 or M2 default for Card.
      : useMaterial3
          ? 12
          : 4;

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final double margins =
        App.responsiveInsets(mediaSize.width, controller.compactMode);
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    final bool isHorizontal = scrollDirection == Axis.horizontal;
    final double topPadding = isHorizontal ? 0 : mediaPadding.top + margins;

    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsetsDirectional.only(
        start: isHorizontal ? 8 : 0,
        end: isHorizontal ? 16 : margins,
        top: topPadding,
        bottom: isHorizontal ? 0 : margins,
      ),
      physics: const ClampingScrollPhysics(),
      scrollDirection: scrollDirection,
      itemCount: AppColor.schemes.length,
      itemBuilder: (BuildContext context, int index) {
        return Tooltip(
          message: AppColor.schemes[index].name,
          waitDuration: const Duration(milliseconds: 700),
          child: FlexThemeModeOptionButton(
            semanticLabel: 'Set to color scheme '
                '${AppColor.schemes[index].name}',
            setFocusOnTap: true,
            // The buttons are colorful and need custom light/dark mode
            // focus and hover colors that don't depend theme to be visible.
            hoverColor: isLight
                ? Colors.white.withAlpha(0x3F)
                : Colors.black.withAlpha(0x2F),
            focusColor: isLight
                ? Colors.white.withAlpha(0x5F)
                : Colors.black.withAlpha(0x4F),
            optionButtonPadding: EdgeInsetsDirectional.only(
                start: isHorizontal ? 6 + phoneButtonsSpacingReduce : 0,
                bottom: isHorizontal ? 0 : 6 + phoneButtonsSpacingReduce),
            optionButtonBorderRadius: _borderRadius(useMaterial3),
            height: 30 + phoneReduce / 2,
            width: 30 + phoneReduce / 2,
            padding: const EdgeInsets.all(0.3),
            optionButtonMargin: EdgeInsets.zero,
            borderRadius: 0,
            unselectedBorder: BorderSide.none,
            selectedBorder: BorderSide(
              color: theme.primaryColorLight,
              width: 4,
            ),
            onSelect: () {
              onSelect(index);
            },
            selected: controller.schemeIndex == index,
            backgroundColor: theme.colorScheme.surface,
            flexSchemeColor: isLight
                ? AppColor.schemeAtIndex(index, controller).light
                : AppColor.schemeAtIndex(index, controller).dark,
          ),
        );
      },
    );
  }
}
