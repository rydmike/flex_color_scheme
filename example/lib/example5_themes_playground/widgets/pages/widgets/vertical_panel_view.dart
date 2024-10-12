import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/header_card.dart';
import '../../panels/panel.dart';
import '../model/theme_topic.dart';
import 'topic_selector.dart';

/// A [Panel] wrapper that puts the content of our panels in a [Row]
/// with a [TopicSelectorVertical] on the left or right of a [Panel]
/// in a [ListView] inside a HeaderCard.
///
/// The [isRight] property is used to control if the
/// [TopicSelectorVertical] goes on left or right side of the [Panel].
class VerticalPanelView extends StatefulWidget {
  const VerticalPanelView({
    super.key,
    required this.panel,
    this.isRight = false,
    required this.onPanelChanged,
    required this.controller,
    this.addTopPadding = false,
  });
  final int panel;
  final bool isRight;
  final ThemeController controller;
  final ValueChanged<int>? onPanelChanged;
  final bool addTopPadding;

  @override
  State<VerticalPanelView> createState() => _VerticalPanelViewState();
}

class _VerticalPanelViewState extends State<VerticalPanelView>
    with TickerProviderStateMixin {
  late final ScrollController scrollController;

  late final AnimationController scaleController = AnimationController(
    duration: const Duration(milliseconds: 180),
    lowerBound: 0.90,
    upperBound: 1.0,
    vsync: this,
  );
  late final Animation<double> scaleAnimation = CurvedAnimation(
    parent: scaleController,
    curve: Curves.fastOutSlowIn,
  );

  late final AnimationController fadeController = AnimationController(
    duration: const Duration(milliseconds: 180),
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
    scrollController = ScrollController(
      keepScrollOffset: true,
      debugLabel: widget.isRight ? 'Right panel' : 'Left panel',
    );
    scaleController.value = 1.0;
    fadeController.value = 1.0;
  }

  @override
  void dispose() {
    scrollController.dispose();
    scaleController.dispose();
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onSurface)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onSurface);

    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final bool isCompact = widget.controller.compactMode;
    final double margins = App.responsiveInsets(mediaSize.width, isCompact);
    final double bottomPadding = mediaPadding.bottom;
    final double topPadding =
        widget.addTopPadding ? mediaPadding.top + margins : 0;

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!widget.isRight)
            TopicSelectorVertical(
              key: const ValueKey<String>('Left Selector'),
              page: widget.panel,
              onSelect: (int newIndex) {
                if (newIndex == widget.panel) return;
                widget.onPanelChanged?.call(newIndex);
                // A scale and fade up animation when user taps on them topic
                // item, we trigger a slight fade and zoom in effect.
                scaleController.value = 0.9;
                fadeController.value = 0.2;
                scaleController.forward();
                fadeController.forward();
              },
              isCompact: isCompact,
              isRight: widget.isRight,
              addTopPadding: widget.addTopPadding,
            ),
          Expanded(
            // TODO(rydmike): Evaluating SingleChildScrollView vs ListView
            // The content is always fixed and known amount of widgets, but
            // always a single child, so a ListView is not needed, trying the
            // the SingleChildScrollView instead. Which for use cases
            // with only a few items, or just one, like this case, may be
            // faster. This test started Oct 12, 2024.
            child: SingleChildScrollView(
              primary: false,
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                widget.isRight ? margins / 2 : 4,
                topPadding,
                widget.isRight ? 4 : margins / 2,
                margins + bottomPadding,
              ),
              child: ScaleTransition(
                scale: scaleAnimation,
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: HeaderCard(
                    title: Text(themeTopics[widget.panel].heading),
                    leading:
                        Icon(themeTopics[widget.panel].icon, color: iconColor),
                    info: themeTopics[widget.panel].info,
                    child: Panel(widget.panel, widget.controller),
                  ),
                ),
              ),
            ),
          ),
          if (widget.isRight)
            TopicSelectorVertical(
              key: const ValueKey<String>('Right Selector'),
              page: widget.panel,
              onSelect: (int newIndex) {
                if (newIndex == widget.panel) return;
                widget.onPanelChanged?.call(newIndex);
                // A scale and fade up animation when user taps on them topic
                // item, we trigger a slight fade and zoom in effect.
                scaleController.value = 0.9;
                fadeController.value = 0.2;
                scaleController.forward();
                fadeController.forward();
              },
              isCompact: isCompact,
              isRight: widget.isRight,
              addTopPadding: widget.addTopPadding,
            ),
        ],
      ),
    );
  }
}
