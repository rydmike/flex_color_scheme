import 'package:flutter/material.dart';

import 'app.dart';

/// Dummy side panel.
///
/// The side panel and all widgets in this file in this example have no actual
/// function for the demo, other than to create a visual demo of what the
/// example theme looks like with a side rail or side menu that uses the primary
/// color branded surface or background colors.
class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
    required this.maxWidth,
    this.onTap,
  }) : super(key: key);
  final double maxWidth;
  final VoidCallback? onTap;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
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
                title: const Text(App.appName),
                leading: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 56),
                  child: IconButton(
                    icon: const Icon(Icons.auto_awesome_motion),
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
    final bool _isLight = _theme.brightness == Brightness.light;
    final Color _selectedColor =
        _isLight ? _theme.primaryColorDark : _theme.primaryColorLight;
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
              color: selected
                  ? Theme.of(context).colorScheme.primary.withAlpha(0x2d)
                  : Colors.transparent,
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
                              width: 56, height: 56),
                          child: Icon(icon,
                              color: selected
                                  ? _selectedColor
                                  : _theme.colorScheme.onSurface
                                      .withOpacity(0.55)),
                        ),
                        if (width < App.shrinkWidth + 10)
                          const SizedBox.shrink()
                        else
                          Text(
                            label,
                            style: selected
                                ? _theme.textTheme.bodyText1!
                                    .copyWith(color: _selectedColor)
                                : _theme.textTheme.bodyText1!.copyWith(
                                    color: _theme.colorScheme.onSurface
                                        .withOpacity(0.64)),
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

    final Widget closedProfile = ListTile(
      visualDensity: VisualDensity.comfortable,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: hPadding,
      ),
      onTap: () {
        setState(() {
          _collapsed = !_collapsed;
        });
      },
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary,
        radius: App.shrinkWidth / 2 - hPadding,
        child: Text('JS',
            style: primaryTextTheme.subtitle1!.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600)),
      ),
      title: Text('John Smith',
          style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600)),
      subtitle: const Text('Company Inc'),
      trailing: ExpandIcon(
        isExpanded: !_collapsed,
        padding: EdgeInsets.zero,
        onPressed: (_) {
          setState(() {
            _collapsed = !_collapsed;
          });
        },
      ),
    );
    // An opened version of the mock user profile
    final Widget openProfile = Column(
      children: <Widget>[
        // Included the closed profile above the opened button panel
        closedProfile,
        // Add some buttons for the opened state
        Padding(
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
          // ),
        ),
      ],
    );
    return AnimatedCrossFade(
      firstChild: closedProfile,
      secondChild: openProfile,
      crossFadeState:
          _collapsed ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 200),
    );
  }
}
