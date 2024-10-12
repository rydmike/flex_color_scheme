import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import 'theme_color_selector.dart';

/// [ThemeColorSelectorHeaderDelegate] for used custom [SliverPersistentHeader].
///
/// Used to keep a part of our nested scroll view pinned to the top
/// (in tablet desktop view), and floating on phone and snapping
/// back when scrolling back just a bit.
///
/// Not really a widget, but a delegate for a [SliverPersistentHeader],
/// but keeping it in the widgets folder for simplicity.
class ThemeColorSelectorHeaderDelegate extends SliverPersistentHeaderDelegate {
  ThemeColorSelectorHeaderDelegate({
    required this.vsync,
    required this.extent,
    required this.controller,
    required this.updateDelegate,
  });
  @override
  final TickerProvider vsync;
  final double extent;
  final ThemeController controller;
  final bool updateDelegate;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _ThemeColorSelectorDelegateWrapper(controller);
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent ||
        updateDelegate;
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration =>
      FloatingHeaderSnapConfiguration();
}

/// A wrapper for the [ThemeColorSelector] when it is used via a
/// [SliverPersistentHeaderDelegate].
///
/// The wrapper is used to add the correct padding and frosted glass effect
/// when it is used as a [SliverPersistentHeaderDelegate] in the Masonry grid
/// in a custom scroll view.
class _ThemeColorSelectorDelegateWrapper extends StatelessWidget {
  const _ThemeColorSelectorDelegateWrapper(this.controller);
  final ThemeController controller;
  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final bool isCompact = controller.compactMode;
    final double margins = App.responsiveInsets(mediaSize.width, isCompact);
    return Material(
      color: Theme.of(context).colorScheme.surfaceTint.withAlpha(0x38),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: EdgeInsets.only(
              top: mediaPadding.top + margins,
              bottom: margins,
            ),
            child: ThemeColorSelector(controller: controller),
          ),
        ),
      ),
    );
  }
}
