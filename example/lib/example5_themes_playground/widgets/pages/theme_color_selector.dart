import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../shared/const/app.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/header_card.dart';
import '../panels/theme_colors_settings/input_colors_selector.dart';

/// Used to select used theme colors, can also turn ON/OFF FlexColorScheme
/// and component themes.
///
/// Used at the top of the Masonry grid view and between page and panel page
/// selector on the page view.
class ThemeColorSelector extends StatelessWidget {
  const ThemeColorSelector({super.key, required this.controller});

  final ThemeController controller;

  // Magic numbers for normal and dense ListTile
  static const double _kHeightNormaListTile = 52;
  static const double _kHeightDenseListTile = 44;

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.sizeOf(context);
    final bool isNarrow = mediaSize.width < App.phoneWidthBreakpoint;
    final bool isCompact = controller.compactMode;
    final bool isPhone =
        isCompact || isNarrow || mediaSize.height < App.phoneHeightBreakpoint;
    final double margins = App.responsiveInsets(mediaSize.width, isCompact);
    return RepaintBoundary(
      child: HeaderCard(
        margin: EdgeInsets.symmetric(horizontal: margins),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, margins, 0, 0),
              child: InputColorsSelector(
                controller: controller,
                isPhone: isPhone,
              ),
            ),
            if (!isCompact)
              SizedBox(
                height: isPhone ? _kHeightDenseListTile : _kHeightNormaListTile,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: SwitchListTile(
                        contentPadding: isPhone
                            ? const EdgeInsets.symmetric(horizontal: 8)
                            : null,
                        dense: isPhone,
                        title: isNarrow
                            ? const Text('M3')
                            : const Text('Use Material3'),
                        value: controller.useMaterial3,
                        onChanged: controller.setUseMaterial3,
                      ),
                    ),
                    Expanded(
                      child: SwitchListTile(
                        contentPadding: isPhone
                            ? const EdgeInsetsDirectional.only(
                                start: 16, end: 0)
                            : null,
                        title: isNarrow
                            ? const Text('FCS')
                            : const Text('Use Flex\u200BColor\u200BScheme'),
                        dense: isPhone,
                        value: controller.useFlexColorScheme,
                        onChanged: controller.setUseFlexColorScheme,
                      ),
                    ),
                    Expanded(
                      child: SwitchListTile(
                        contentPadding: isPhone
                            ? const EdgeInsets.symmetric(horizontal: 8)
                            : null,
                        dense: isPhone,
                        title: isNarrow
                            ? const Text('Themes')
                            : const Text('Use sub themes'),
                        value: controller.useSubThemes &&
                            controller.useFlexColorScheme,
                        onChanged: controller.useFlexColorScheme
                            ? controller.setUseSubThemes
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// [ThemeColorSelectorHeaderDelegate] for used custom [SliverPersistentHeader].
///
/// Used to keep a part of our nested scroll view pinned to the top
/// (in tablet desktop view), and floating on phone and snapping
/// back when scrolling back just a bit.
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
