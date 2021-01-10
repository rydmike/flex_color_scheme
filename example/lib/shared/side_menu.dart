import 'package:flutter/material.dart';
import 'constants.dart';

// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the example.

// The side panel and all widgets in this file in this example have no actual
// function for the demo, other than to create a visual demo of what the
// example theme looks like with a side rail or side menu that uses the primary
// color branded surface or background colors.
class SideMenu extends StatefulWidget {
  const SideMenu({
    Key key,
    this.isVisible,
    this.menuWidth,
  }) : super(key: key);
  final bool isVisible;
  final double menuWidth;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = 2;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints size) {
        return OverflowBox(
          alignment: AlignmentDirectional.topStart,
          minWidth: 0,
          maxWidth: widget.menuWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBar(
                title: const Text('Side panel'),
                leading: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 56),
                  child: IconButton(
                    icon: const Icon(Icons.auto_awesome_motion),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: size.maxWidth,
                  decoration: BoxDecoration(
                    border: widget.isVisible
                        ? BorderDirectional(
                            end: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          )
                        : null,
                  ),
                  child: ClipRect(
                    child: OverflowBox(
                      alignment: AlignmentDirectional.topStart,
                      minWidth: 0,
                      maxWidth: widget.menuWidth,
                      child: ListView(
                        padding:
                            const EdgeInsets.only(), //  Removes all edge insets
                        children: <Widget>[
                          // A dummy user profile on the dummy menu/rail.
                          const _UserProfile(),
                          // Create a list of dummy menu items
                          for (int i = 0; i < 8; i++)
                            _SideItem(
                              width: size.maxWidth,
                              menuWidth: widget.menuWidth,
                              onTap: () {
                                setState(() {
                                  selectedItem = i;
                                });
                              },
                              selected: selectedItem == i,
                              icon: Icons.article_outlined,
                              label: 'This is item $i',
                              showDivider: (i % 3 == 0) && i != 0,
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

// Menu side items, just to make the demo look more like a real use case.
class _SideItem extends StatelessWidget {
  const _SideItem({
    Key key,
    this.width,
    this.menuWidth,
    this.onTap,
    this.selected = false,
    this.icon,
    this.label,
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
                  ? Theme.of(context).colorScheme.primary.withAlpha(0x3d)
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
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurface
                                      .withOpacity(0.55)),
                        ),
                        if (width < AppConst.shrinkWidth + 10)
                          const SizedBox.shrink()
                        else
                          Text(
                            label,
                            style: selected
                                ? theme.textTheme.bodyText1
                                    .copyWith(color: theme.colorScheme.primary)
                                : theme.textTheme.bodyText1.copyWith(
                                    color: theme.colorScheme.onSurface
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

// A dummy user profile widget that we use as leading widget ins side panel.
class _UserProfile extends StatefulWidget {
  const _UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<_UserProfile> {
  bool collapsedProfile;

  @override
  void initState() {
    super.initState();
    collapsedProfile = true;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextTheme primaryTextTheme = theme.primaryTextTheme;
    const double hPadding = 5;

    final Widget closedProfile = ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: hPadding,
      ),
      onTap: () {
        setState(() {
          collapsedProfile = !collapsedProfile;
        });
      },
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary,
        radius: AppConst.shrinkWidth / 2 - hPadding,
        child: Text('JS',
            style: primaryTextTheme.subtitle1.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600)),
      ),
      title: Text('John Smith',
          style: textTheme.subtitle1.copyWith(fontWeight: FontWeight.w600)),
      subtitle: const Text('Company Inc'),
      trailing: ExpandIcon(
        isExpanded: !collapsedProfile,
        padding: const EdgeInsets.all(0),
        onPressed: (_) {
          setState(() {
            collapsedProfile = !collapsedProfile;
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
              OutlineButton(
                onPressed: () {},
                visualDensity: VisualDensity.comfortable,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  children: <Widget>[
                    const Icon(Icons.person),
                    Text('Profile', style: textTheme.overline),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              OutlineButton(
                onPressed: () {},
                visualDensity: VisualDensity.comfortable,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  children: <Widget>[
                    const Icon(Icons.exit_to_app),
                    Text('Logout', style: textTheme.overline),
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
      crossFadeState: collapsedProfile
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 200),
    );
  }
}
