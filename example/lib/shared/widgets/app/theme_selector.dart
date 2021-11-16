import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../const/app_color.dart';
import '../../controllers/theme_controller.dart';

// The width size of the scrolling button.
const double _kWidthOfScrollItem = 67.2;

// Horizontal theme selector of themes offered in our [AppColor.schemes].
//
// This example uses a StatefulWidget for the scroll controller and
// index to keep track of previously selected color scheme, so we can animate
// to the new selection, also done when the themeController schemeIndex is
// changed via other UI controls, like in the drop box that is also used in
// this demo as another way to change the color scheme.
//
// The theme is controlled via the passed in ThemeController.
class ThemeSelector extends StatefulWidget {
  const ThemeSelector({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ThemeController controller;

  @override
  _ThemeSelectorState createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  late ScrollController scrollController;
  late int schemeIndex;

  @override
  void initState() {
    super.initState();
    schemeIndex = widget.controller.schemeIndex;
    scrollController = ScrollController(
        keepScrollOffset: true,
        initialScrollOffset: _kWidthOfScrollItem * schemeIndex);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // Index got updated in popup and deps changed, animate it to new index.
    if (widget.controller.schemeIndex != schemeIndex) {
      schemeIndex = widget.controller.schemeIndex;
      scrollController.animateTo(_kWidthOfScrollItem * schemeIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return SizedBox(
      height: 76,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: AppColor.schemesCustom(widget.controller).length,
              itemBuilder: (BuildContext context, int index) {
                return FlexThemeModeOptionButton(
                  optionButtonBorderRadius: widget.controller.useSubThemes
                      ? widget.controller.useDefaultRadius
                          ? 12
                          : widget.controller.cornerRadius
                      : 4,
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(0.3),
                  optionButtonMargin: EdgeInsets.zero,
                  borderRadius: 0,
                  unselectedBorder: BorderSide.none,
                  selectedBorder: BorderSide(
                    color: Theme.of(context).primaryColorLight,
                    width: 4,
                  ),
                  onSelect: () {
                    scrollController.animateTo(_kWidthOfScrollItem * index,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOutCubic);
                    schemeIndex = index;
                    widget.controller.setSchemeIndex(index);
                  },
                  selected: widget.controller.schemeIndex == index,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  flexSchemeColor: isLight
                      ? AppColor.schemesCustom(widget.controller)[index].light
                      : AppColor.schemesCustom(widget.controller)[index].dark,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
