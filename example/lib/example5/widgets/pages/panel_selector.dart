import 'package:flutter/material.dart';

// The width size of the scrolling button.
const double _kWidthOfScrollItem = 115;

/// Horizontal panel selector of.
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
    viewIndex = widget.index; //widget.controller.viewIndex;
    scrollController = ScrollController(
        keepScrollOffset: true,
        initialScrollOffset: _kWidthOfScrollItem * viewIndex);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // Index got updated externally, by the page view in this case
    // and dependencies changed, animate to new index.
    if (widget.index != viewIndex) {
      viewIndex = widget.index;
      scrollController.animateTo(_kWidthOfScrollItem * viewIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
  final PanelItem item;
  final bool selected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;

    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    final Color textColor = theme.colorScheme.onBackground.withAlpha(0xCC);

    // Get the card's ShapeBorder from the theme card shape
    ShapeBorder? shapeBorder = theme.cardTheme.shape;
    // Make a shape border if card or its header color is equal to scaffold
    // background color, because if we have a theme where that happens
    // we want to separate the header card from the background with a border.
    // If we had one shape, copy in a border side to it.
    if (shapeBorder is RoundedRectangleBorder) {
      shapeBorder = shapeBorder.copyWith(
        side: BorderSide(color: iconColor, width: 5),
      );
      // If
    } else {
      // If border was null, make one matching Card default, but with a
      // BorderSide, if it was not null, we leave it as it was, it means it
      // has some other preexisting ShapeBorder, but it was not a
      // RoundedRectangleBorder, we don't know what it was, just let it be.
      shapeBorder ??= RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        side: BorderSide(
          color: scheme.primary.withAlpha(0xAA),
          width: 5,
        ),
      );
    }

    return SizedBox(
      width: _kWidthOfScrollItem,
      child: Card(
        color: null, //selected ? scheme.primaryContainer.lighten(10) : null,
        shape: selected ? shapeBorder : null,
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
class PanelItem {
  const PanelItem({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

const List<PanelItem> _panelItems = <PanelItem>[
  PanelItem(
    label: 'Introduction',
    icon: Icons.info_outlined,
  ),
  PanelItem(
    label: 'Input\ncolors',
    icon: Icons.palette_outlined,
  ),
  PanelItem(
    label: 'Seeded\nColorScheme',
    icon: Icons.colorize_outlined,
  ),
  PanelItem(
    label: 'Surface\nblends',
    icon: Icons.invert_colors_outlined,
  ),
  PanelItem(
    label: 'Effective\ncolors',
    icon: Icons.gradient_outlined,
  ),
  PanelItem(
    label: 'Component\nthemes',
    icon: Icons.widgets_outlined,
  ),
  PanelItem(
    label: 'TextField',
    icon: Icons.pin_outlined,
  ),
  PanelItem(
    label: 'AppBar',
    icon: Icons.web_asset_outlined,
  ),
  PanelItem(
    label: 'TabBar',
    icon: Icons.tab_outlined,
  ),
  PanelItem(
    label: 'NavigationBar',
    icon: Icons.video_label_outlined,
  ),
  PanelItem(
    label: 'Bottom\nNavigationBar',
    icon: Icons.video_label_outlined,
  ),
  PanelItem(
    label: 'Navigation\nRail',
    icon: Icons.view_sidebar_outlined,
  ),
  PanelItem(
    label: 'AndroidBar',
    icon: Icons.android_outlined,
  ),
  PanelItem(
    label: 'Material\nButtons',
    icon: Icons.crop_16_9_outlined,
  ),
  PanelItem(
    label: 'FAB\nToggleButtons',
    icon: Icons.add_circle,
  ),
  PanelItem(
    label: 'Switch\nCheckBox',
    icon: Icons.toggle_on_outlined,
  ),
  PanelItem(
    label: 'ListTile',
    icon: Icons.dns_outlined,
  ),
  PanelItem(
    label: 'Dialog',
    icon: Icons.branding_watermark_outlined,
  ),
  PanelItem(
    label: 'TimePicker\nDialog',
    icon: Icons.schedule_outlined,
  ),
  PanelItem(
    label: 'DatePicker\nDialog',
    icon: Icons.event_outlined,
  ),
  PanelItem(
    label: 'Material\nBanner, Snack',
    icon: Icons.call_to_action_outlined,
  ),
  PanelItem(
    label: 'Card',
    icon: Icons.picture_in_picture_alt_outlined,
  ),
  PanelItem(
    label: 'Text\nTheme',
    icon: Icons.font_download_outlined,
  ),
  PanelItem(
    label: 'Primary\nTextTheme',
    icon: Icons.font_download_outlined,
  ),
  PanelItem(
    label: 'Page\nExamples',
    icon: Icons.article_outlined,
  ),
  PanelItem(
    label: 'Widget\nshowcase',
    icon: Icons.flutter_dash,
  ),
  PanelItem(
    label: 'Theme\ncode',
    icon: Icons.integration_instructions_outlined,
  ),
];
