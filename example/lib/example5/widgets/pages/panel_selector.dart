import 'package:flutter/material.dart';

// The width size of the scrolling button.
const double _kWidthOfScrollItem = 115;

/// Horizontal panel selector of active panel page to view.
class PanelSelector extends StatefulWidget {
  const PanelSelector({
    Key? key,
    required this.index,
    required this.onChanged,
  }) : super(key: key);
  final int index;
  final ValueChanged<int> onChanged;

  @override
  _PanelSelectorState createState() => _PanelSelectorState();
}

class _PanelSelectorState extends State<PanelSelector> {
  late ScrollController scrollController;
  late int viewIndex;

  @override
  void initState() {
    super.initState();
    viewIndex = widget.index;
    scrollController = ScrollController(
      keepScrollOffset: true,
      initialScrollOffset: _kWidthOfScrollItem * viewIndex,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PanelSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != viewIndex) {
      viewIndex = widget.index;
      scrollController.animateTo(_kWidthOfScrollItem * viewIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic);
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    // Paddings so content shows up in visible area when we use Scaffold props
    // extendBodyBehindAppBar and extendBody.
    final double topPadding = media.padding.top; // + kToolbarHeight;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: SizedBox(
        height: _kWidthOfScrollItem + 15,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: _panelItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return PanelButton(
                    item: _panelItems[index],
                    onSelect: () {
                      scrollController.animateTo(_kWidthOfScrollItem * index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic);
                      viewIndex = index;
                      widget.onChanged(index);
                    },
                    selected: widget.index == index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PanelButton extends StatelessWidget {
  const PanelButton({
    Key? key,
    required this.item,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);
  final _PanelItem item;
  final bool selected;
  final VoidCallback onSelect;

  static bool _colorsAreClose(Color a, Color b) {
    final int dR = a.red - b.red;
    final int dG = a.green - b.green;
    final int dB = a.blue - b.blue;
    final int distance = dR * dR + dG * dG + dB * dB;
    // Calculating orthogonal distance between colors should take the the
    // square root as well, but we don't need that extra compute step.
    // We just need a number to represents some relative closeness of the
    // colors. We use this to determine a level when we should draw a border
    // around our panel.
    // This value was just determined by visually testing what was a good
    // trigger for when the border appeared and disappeared during testing.
    if (distance < 120) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final Color cardColor = theme.cardColor;
    final Color scaffoldColor = theme.scaffoldBackgroundColor;
    final Color background =
        Color.alphaBlend(scheme.primary.withAlpha(15), cardColor);
    final bool closeColors = _colorsAreClose(background, scaffoldColor);
    final bool isLight = theme.brightness == Brightness.light;

    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    final Color textColor = theme.colorScheme.onBackground.withAlpha(0xCC);

    // Get the card's ShapeBorder from the theme card shape
    ShapeBorder? shapeBorder = theme.cardTheme.shape;
    // Make a shape border if our background color is close in color
    // to the scaffold background color, because if that happens we want to
    // separate it from the background with a border.
    // If we had one shape, copy in a border side to it.
    if (shapeBorder is RoundedRectangleBorder) {
      shapeBorder = shapeBorder.copyWith(
        side: selected
            ? BorderSide(color: iconColor, width: 5)
            : closeColors
                ? BorderSide(
                    color: theme.dividerColor,
                    width: 1,
                  )
                : BorderSide.none,
      );
      // If
    } else {
      // If border was null, make one matching Card default, but with a
      // BorderSide, if it was not null, we leave it as it was, it means it
      // has some other preexisting ShapeBorder, but it was not a
      // RoundedRectangleBorder, we don't know what it was, just let it be.
      shapeBorder ??= RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        side: selected
            ? BorderSide(color: iconColor, width: 5)
            : closeColors
                ? BorderSide(
                    color: theme.dividerColor,
                    width: 1,
                  )
                : BorderSide.none,
      );
    }

    return SizedBox(
      width: _kWidthOfScrollItem,
      child: Card(
        color: background,
        // null, //selected ? scheme.primaryContainer.lighten(10) : null,
        shape: shapeBorder,
        child: InkWell(
          onTap: onSelect,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  item.icon,
                  size: 45,
                  color: iconColor,
                ),
                Text(
                  item.label,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: textColor,
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

@immutable
class _PanelItem {
  const _PanelItem({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

const List<_PanelItem> _panelItems = <_PanelItem>[
  _PanelItem(
    label: 'Introduction',
    icon: Icons.info_outlined,
  ),
  _PanelItem(
    label: 'Input\ncolors',
    icon: Icons.palette_outlined,
  ),
  _PanelItem(
    label: 'Seeded\nColorScheme',
    icon: Icons.colorize_outlined,
  ),
  _PanelItem(
    label: 'Surface\nblends',
    icon: Icons.invert_colors_outlined,
  ),
  _PanelItem(
    label: 'Effective\ncolors',
    icon: Icons.gradient_outlined,
  ),
  _PanelItem(
    label: 'Component\nthemes',
    icon: Icons.widgets_outlined,
  ),
  _PanelItem(
    label: 'TextField',
    icon: Icons.pin_outlined,
  ),
  _PanelItem(
    label: 'AppBar',
    icon: Icons.web_asset_outlined,
  ),
  _PanelItem(
    label: 'TabBar',
    icon: Icons.tab_outlined,
  ),
  _PanelItem(
    label: 'NavigationBar',
    icon: Icons.video_label_outlined,
  ),
  _PanelItem(
    label: 'Bottom\nNavigationBar',
    icon: Icons.video_label_outlined,
  ),
  _PanelItem(
    label: 'Navigation\nRail',
    icon: Icons.view_sidebar_outlined,
  ),
  _PanelItem(
    label: 'AndroidBar',
    icon: Icons.android_outlined,
  ),
  _PanelItem(
    label: 'Material\nButtons',
    icon: Icons.crop_16_9_outlined,
  ),
  _PanelItem(
    label: 'FAB\nToggleButtons',
    icon: Icons.add_circle,
  ),
  _PanelItem(
    label: 'Switch\nCheckBox',
    icon: Icons.toggle_on_outlined,
  ),
  _PanelItem(
    label: 'ListTile',
    icon: Icons.dns_outlined,
  ),
  _PanelItem(
    label: 'Dialog',
    icon: Icons.branding_watermark_outlined,
  ),
  _PanelItem(
    label: 'TimePicker\nDialog',
    icon: Icons.schedule_outlined,
  ),
  _PanelItem(
    label: 'DatePicker\nDialog',
    icon: Icons.event_outlined,
  ),
  _PanelItem(
    label: 'Material\nBanner, Snack',
    icon: Icons.call_to_action_outlined,
  ),
  _PanelItem(
    label: 'Card',
    icon: Icons.picture_in_picture_alt_outlined,
  ),
  _PanelItem(
    label: 'Text\nTheme',
    icon: Icons.font_download_outlined,
  ),
  _PanelItem(
    label: 'Primary\nTextTheme',
    icon: Icons.font_download_outlined,
  ),
  _PanelItem(
    label: 'Page\nExamples',
    icon: Icons.article_outlined,
  ),
  _PanelItem(
    label: 'Widget\nshowcase',
    icon: Icons.flutter_dash,
  ),
  _PanelItem(
    label: 'Theme\ncode',
    icon: Icons.integration_instructions_outlined,
  ),
];
