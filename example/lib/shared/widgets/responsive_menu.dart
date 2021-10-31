import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../const/app_data.dart';

/// A side menu with some fake content.
///
/// The side menu content and all widgets in this file in this example have no
/// actual function for the demo, other than to create a visual demo of what the
/// example theme looks like with a side rail or side menu that uses the primary
/// color branded surface or background colors.
class ResponsiveMenu extends StatefulWidget {
  const ResponsiveMenu({
    Key? key,
    required this.maxWidth,
    this.onTap,
  }) : super(key: key);
  final double maxWidth;
  final VoidCallback? onTap;

  @override
  _ResponsiveMenuState createState() => _ResponsiveMenuState();
}

class _ResponsiveMenuState extends State<ResponsiveMenu> {
  int selectedItem = 4;

  static const List<IconData> _icons = <IconData>[
    Icons.ac_unit,
    Icons.hvac_outlined,
    Icons.account_balance,
    Icons.add_circle_outline,
    Icons.assignment_ind,
    Icons.assignment_turned_in,
    Icons.arrow_upward,
    Icons.logout
  ];

  static const List<String> _labels = <String>[
    'Cooling',
    'Ventilation',
    'Key safe',
    'Add keys',
    'My tasks',
    'Done tasks',
    'Upload report',
    'Sign out',
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
                    onPressed: widget.onTap,
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
                          // Create a list of dummy menu items
                          for (int i = 0; i < 8; i++)
                            _SideItem(
                              width: size.maxWidth,
                              menuWidth: widget.maxWidth,
                              onTap: () {
                                setState(() {
                                  selectedItem = i;
                                });
                              },
                              selected: selectedItem == i,
                              icon: _icons[i],
                              label: _labels[i],
                              showDivider: i.isEven, // && i != 0,
                            ),
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
    final ThemeData _theme = Theme.of(context);
    final Color _itemColor =
        _theme.colorScheme.onBackground.blend(_theme.colorScheme.primary, 30);
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
              color: selected ? _theme.focusColor : Colors.transparent,
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
                                  ? _itemColor.withOpacity(0.9)
                                  : _itemColor.withOpacity(0.7)),
                        ),
                        if (width < AppData.railWidth + 10)
                          const SizedBox.shrink()
                        else
                          Text(
                            label,
                            style: selected
                                ? _theme.textTheme.bodyText1!.copyWith(
                                    color: _itemColor.withOpacity(0.9))
                                : _theme.textTheme.bodyText1!.copyWith(
                                    color: _itemColor.withOpacity(0.7)),
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

/// A dummy user profile widget that we use as leading widget ins side panel.
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
              size: 36,
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
