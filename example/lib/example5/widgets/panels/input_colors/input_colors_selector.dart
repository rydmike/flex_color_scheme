import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/const/app_data.dart';
import '../../../../shared/controllers/theme_controller.dart';

/// Horizontal theme selector of themes offered in our [AppColor.schemes].
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

  // The fixed width the scrolling button at desktop size.
  static const double _kWidthOfScrollItem = 67.2;
  // The fixed height of the scrolling button at desktop size.
  static const double _kHeightOfScrollItem = 66;

  @override
  void initState() {
    super.initState();
    schemeIndex = widget.controller.schemeIndex;
    final double phoneReduce =
        widget.isPhone ? AppData.colorButtonPhoneReduce : 0;
    final double phoneButtonsSpacingReduce = widget.isPhone ? -3 : 0;
    scrollController = ScrollController(
      keepScrollOffset: true,
      initialScrollOffset:
          (_kWidthOfScrollItem + phoneReduce + phoneButtonsSpacingReduce) *
              schemeIndex,
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
      final double phoneReduce =
          widget.isPhone ? AppData.colorButtonPhoneReduce : 0;
      final double phoneButtonsSpacingReduce = widget.isPhone ? -3 : 0;
      schemeIndex = widget.controller.schemeIndex;
      scrollController.jumpTo(
          (_kWidthOfScrollItem + phoneReduce + phoneButtonsSpacingReduce) *
              schemeIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    final double phoneReduce =
        widget.isPhone ? AppData.colorButtonPhoneReduce : 0;
    final double phoneButtonsSpacingReduce = widget.isPhone ? -3 : 0;
    return SizedBox(
      height: _kHeightOfScrollItem + phoneReduce,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsetsDirectional.only(start: 8, end: 16),
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: AppColor.schemes.length,
              itemBuilder: (BuildContext context, int index) {
                return FlexThemeModeOptionButton(
                  optionButtonPadding: EdgeInsetsDirectional.only(
                      start: 6 + phoneButtonsSpacingReduce),
                  optionButtonBorderRadius: widget.controller.useSubThemes &&
                          widget.controller.useFlexColorScheme
                      // M3 default for Card is 12.
                      ? (widget.controller.cardBorderRadius ??
                          widget.controller.defaultRadius ??
                          12)
                      // M3 or M2 default for Card.
                      : useMaterial3
                          ? 12
                          : 4,
                  height: 30 + phoneReduce / 2,
                  width: 30 + phoneReduce / 2,
                  padding: const EdgeInsets.all(0.3),
                  optionButtonMargin: EdgeInsets.zero,
                  borderRadius: 0,
                  unselectedBorder: BorderSide.none,
                  selectedBorder: BorderSide(
                    color: Theme.of(context).primaryColorLight,
                    width: 4,
                  ),
                  onSelect: () {
                    scrollController.animateTo(
                        (_kWidthOfScrollItem +
                                phoneReduce +
                                phoneButtonsSpacingReduce) *
                            index,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOutCubic);
                    schemeIndex = index;
                    widget.controller.setSchemeIndex(index);
                  },
                  selected: widget.controller.schemeIndex == index,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  flexSchemeColor: isLight
                      ? AppColor.schemeAtIndex(index, widget.controller).light
                      : AppColor.schemeAtIndex(index, widget.controller).dark,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
