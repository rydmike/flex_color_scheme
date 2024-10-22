import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../panels/input_colors/input_colors_selector.dart';
import 'two_topics_page.dart';
import 'widgets/vertical_panel_view.dart';

// ignore_for_file: comment_references

/// This is an alternative two topics view of the Playground.
///
/// Used only on big desktops, when desktop size is over
/// [App.mediumDesktopWidthBreakpoint] in width.
///
/// This view no longer like the [TwoTopicsPage] keep the content of the
/// page in [CustomScrollView] with a [SliverPersistentHeader]. This is a lot
/// simpler view suitable for large media where everything is in a row with five
/// different vertical lists in the row.
class TwoTopicsVerticalPage extends StatelessWidget {
  const TwoTopicsVerticalPage({
    super.key,
    required this.controller,
  });
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        VerticalPanelView(
          key: const ValueKey<String>('Left VPanel'),
          panel: controller.topicIndexStartSide,
          onPanelChanged: controller.setTopicIndexStartSide,
          controller: controller,
          addTopPadding: true,
        ),
        VerticalPanelView(
          key: const ValueKey<String>('Right VPanel'),
          isRight: true,
          panel: controller.topicIndexEndSide,
          onPanelChanged: controller.setTopicIndexEndSide,
          controller: controller,
          addTopPadding: true,
        ),
        InputColorsSelectorVertical(controller: controller),
      ],
    );
  }
}
