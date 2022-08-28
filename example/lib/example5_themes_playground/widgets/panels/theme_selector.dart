import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../shared/const/app_data.dart';
import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/header_card.dart';
import '../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import 'input_colors/input_colors_selector.dart';

// ThemeSelectorHeaderDelegate for our custom SliverPersistentHeader.
//
// Used to keep a part of our nested scroll view pinned to the top
// (in tablet desktop view), and floating on phone and snapping
// back when scrolling back just a bit.
class ThemeSelectorHeaderDelegate extends SliverPersistentHeaderDelegate {
  ThemeSelectorHeaderDelegate({
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
    return ThemeSelectorDelegateWrapper(controller: controller);
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // return true;
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent ||
        updateDelegate;
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration =>
      FloatingHeaderSnapConfiguration();
}

// A wrapper for the ThemeSelector when it is used via a persistent header
// delegate.
//
// The wrapper is used to add the correct padding and frosted glass effect
// when it is used as a SliverPersistentHeaderDelegate in the Masonry grid
// in a custom scroll view.
class ThemeSelectorDelegateWrapper extends StatelessWidget {
  const ThemeSelectorDelegateWrapper({
    super.key,
    required this.controller,
  });
  final ThemeController controller;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double margins = AppData.responsiveInsets(media.size.width);
    return Material(
      color: Theme.of(context).colorScheme.surfaceTint.withAlpha(0x38),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: EdgeInsets.only(
              top: media.padding.top + margins,
              bottom: margins,
            ),
            child: ThemeSelector(controller: controller),
          ),
        ),
      ),
    );
  }
}

// A header card wrapped, without heading. Used to select them colors using
// the Theme Selector and can also turn ON/OFF FlexColorScheme and component
// themes.
//
// Used at the top of the Masonry grid view and between page and panel page
// selector on the page view.
class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key, required this.controller});

  final ThemeController controller;

  // Magic numbers for normal and dense ListTile
  static const double _kHeightNormaListTile = 52;
  static const double _kHeightDenseListTile = 44;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint;
    final double margins = AppData.responsiveInsets(media.size.width);
    return HeaderCard(
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
          SizedBox(
            height: isPhone ? _kHeightDenseListTile : _kHeightNormaListTile,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, margins, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: SwitchListTileAdaptive(
                      contentPadding: isPhone
                          ? const EdgeInsets.symmetric(horizontal: 8)
                          : null,
                      dense: isPhone,
                      title: const Text('Use Material3'),
                      value: controller.useMaterial3,
                      onChanged: controller.setUseMaterial3,
                    ),
                  ),
                  Expanded(
                    child: SwitchListTileAdaptive(
                      contentPadding: isPhone
                          ? const EdgeInsetsDirectional.only(start: 16, end: 0)
                          : null,
                      title: const Text('Flex\u200BColor\u200BScheme'),
                      dense: isPhone,
                      value: controller.useFlexColorScheme,
                      onChanged: controller.setUseFlexColorScheme,
                    ),
                  ),
                  Expanded(
                    child: SwitchListTileAdaptive(
                      contentPadding: isPhone
                          ? const EdgeInsets.symmetric(horizontal: 8)
                          : null,
                      dense: isPhone,
                      title: const Text('Compo\u200Bnent themes'),
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
          ),
        ],
      ),
    );
  }
}
