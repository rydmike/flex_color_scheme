import 'package:flutter/material.dart';

import '../../../shared/const/app.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../panels/theme_colors_settings/input_colors_selector.dart';
import 'theme_two_topics_page.dart';

// ignore_for_file: comment_references

/// This is an alternative two theme topics view of the Playground.
///
/// Used only on big desktops, when desktop size is over
/// [App.mediumDesktopWidthBreakpoint] in width.
///
/// This view no longer like the [ThemeTwoTopicsPage] keep the content of the
/// page in [CustomScrollView] with a [SliverPersistentHeader]. This is a lot
/// simpler view suitable for large media where everything is in a row with five
/// different vertical lists in the row.
class ThemeTwoTopicsVerticalPage extends StatelessWidget {
  const ThemeTwoTopicsVerticalPage({
    super.key,
    required this.controller,
  });
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        VerticalThemePanelView(
          key: const ValueKey<String>('Left VPanel'),
          panel: controller.viewIndex,
          onPanelChanged: controller.setViewIndex,
          controller: controller,
          addTopPadding: true,
        ),
        VerticalThemePanelView(
          key: const ValueKey<String>('Right VPanel'),
          isRight: true,
          panel: controller.sideViewIndex,
          onPanelChanged: controller.setSideViewIndex,
          controller: controller,
          addTopPadding: true,
        ),
        InputColorsSelectorVertical(controller: controller),
      ],
    );
  }
}
