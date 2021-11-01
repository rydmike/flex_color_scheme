import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../const/app_data.dart';

/// App side menu and rail, used in default example and example 4 and 5.
///
/// Contains command to control the views for example 5 and reset settings to
/// default values. Not super optimal, just a simple working hack fro this demo.
class AppMenu extends StatefulWidget {
  const AppMenu({
    Key? key,
    required this.maxWidth,
    this.onOperate,
    this.onSelect,
  }) : super(key: key);
  final double maxWidth;
  final VoidCallback? onOperate;
  final ValueChanged<int>? onSelect;

  @override
  _AppMenuState createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  int selectedItem = 4;

  static const List<IconData> _icons = <IconData>[
    Icons.open_in_full_outlined,
    Icons.close_fullscreen_outlined,
    Icons.expand_more_outlined,
    Icons.expand_less_outlined,
    Icons.unfold_more_outlined,
    Icons.unfold_less_outlined,
    Icons.replay_outlined,
  ];

  static const List<String> _labels = <String>[
    'Expand all',
    'Close all',
    'Expand settings',
    'Close settings',
    'Expand themed',
    'Close themed',
    'Reset settings',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints size) {
        return OverflowBox(
          alignment: AlignmentDirectional.topStart,
          minWidth: 0,
          maxWidth: widget.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBar(
                title: const Text(AppData.appName),
                leading: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 56),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: widget.onOperate,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: size.maxWidth,
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      end: BorderSide(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  child: ClipRect(
                    child: OverflowBox(
                      alignment: AlignmentDirectional.topStart,
                      minWidth: 0,
                      maxWidth: widget.maxWidth,
                      child: ListView(
                        padding: EdgeInsets.zero, //  Removes all edge insets
                        children: <Widget>[
                          // A dummy user profile on the dummy menu/rail.
                          const _UserProfile(),
                          // Create a list of the menu items
                          for (int i = 0; i < _icons.length; i++)
                            _SideItem(
                              width: size.maxWidth,
                              menuWidth: widget.maxWidth,
                              onTap: () {
                                setState(() {
                                  selectedItem = i;
                                });
                                widget.onSelect?.call(i);
                              },
                              selected: selectedItem == i,
                              icon: _icons[i],
                              label: _labels[i],
                              showDivider: i.isEven,
                            ),
                          const Divider(thickness: 1, height: 1),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Menu side items, just to make the demo look more like a real use case.
class _SideItem extends StatelessWidget {
  const _SideItem({
    Key? key,
    required this.width,
    required this.menuWidth,
    required this.onTap,
    this.selected = false,
    required this.icon,
    required this.label,
    this.showDivider = false,
  }) : super(key: key);

  final double width;
  final double menuWidth;
  final VoidCallback onTap;
  final bool selected;
  final IconData icon;
  final String label;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color itemSelectedColor = isLight
        ? theme.colorScheme.onBackground.blend(theme.primaryColorDark, 60)
        : theme.colorScheme.onBackground.blend(theme.colorScheme.primary, 50);
    final Color itemColor =
        theme.colorScheme.onBackground.blend(theme.colorScheme.primary, 20);
    if (width < 5) {
      return const SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (showDivider) const Divider(thickness: 1, height: 1),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 5, 2),
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50 / 2.0),
                bottomRight: Radius.circular(50 / 2.0),
              ),
              color: selected ? theme.focusColor : Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: SizedBox(
                  height: 50,
                  width: width - 5,
                  child: OverflowBox(
                    alignment: AlignmentDirectional.topStart,
                    minWidth: 0,
                    maxWidth: menuWidth,
                    child: Row(
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                            width: 56,
                            height: 56,
                          ),
                          child: Icon(icon,
                              color: selected
                                  ? itemSelectedColor
                                  : itemColor.withOpacity(0.8)),
                        ),
                        if (width < AppData.railWidth + 10)
                          const SizedBox.shrink()
                        else
                          Text(
                            label,
                            style: selected
                                ? theme.textTheme.bodyText1!
                                    .copyWith(color: itemSelectedColor)
                                : theme.textTheme.bodyText1!.copyWith(
                                    color: itemColor.withOpacity(0.8)),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}

/// A dummy user profile widget that we use as leading widget in the menu.
class _UserProfile extends StatefulWidget {
  const _UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<_UserProfile> {
  bool _collapsed = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextTheme primaryTextTheme = theme.primaryTextTheme;
    const double hPadding = 5;

    return Material(
      color: theme.colorScheme.surface,
      child: Column(
        children: <Widget>[
          ListTile(
            visualDensity: VisualDensity.comfortable,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: hPadding,
              vertical: hPadding,
            ),
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              radius: AppData.railWidth / 2 - hPadding,
              child: Text(
                'JS',
                style: primaryTextTheme.subtitle1!.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600),
              ),
            ),
            title: Text(
              'John Smith',
              style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text('Company Inc'),
            trailing: ExpandIcon(
              isExpanded: !_collapsed,
              size: 32,
              padding: EdgeInsets.zero,
              onPressed: (_) {
                setState(() {
                  _collapsed = !_collapsed;
                });
              },
            ),
            onTap: () {
              setState(() {
                _collapsed = !_collapsed;
              });
            },
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: child,
              );
            },
            child: _collapsed
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: <Widget>[
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Column(
                            children: <Widget>[
                              const Icon(Icons.person),
                              Text('Profile', style: textTheme.overline),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Column(
                            children: <Widget>[
                              const Icon(Icons.exit_to_app),
                              Text('Sign in', style: textTheme.overline),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
