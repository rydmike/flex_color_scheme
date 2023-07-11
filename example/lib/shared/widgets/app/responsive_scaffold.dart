import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../const/app.dart';
import '../../utils/colors_are_close.dart';
import 'about.dart';

// ignore_for_file: comment_references

// The default width of the side menu when expanded to full menu.
const double _kMenuWidth = 280;

// The default width of the side menu when collapsed to a rail.
// We make it extra compact to not be so intrusive on phones. It looks a bit
// silly on desktop. But parent can vary it based on media size if so desired.
// The default example and example 5 do so.
const double _kRailWidth = 52;

// The minimum media size needed for desktop/large tablet menu view.
// Only at higher than this breakpoint will the menu open and be possible
// to toggle between menu and rail. Below this breakpoint it toggles between
// hidden in the Drawer and rail, also on phones. This is just the default
// value for the constructor and it can be set differently in the
// ResponsiveScaffold constructor.
const double _kBreakpointShowFullMenu = 900;

// Menu animation duration. This constant is the same value that
// Flutter SDK uses for its Drawer open/close animation
const Duration _kMenuAnimationDuration = Duration(milliseconds: 246);

/// Used to define tap items for the the responsive Scaffold menu.
@immutable
class ResponsiveMenuItems {
  const ResponsiveMenuItems({
    this.label = '',
    this.icon = Icons.info,
    this.dividerAbove = false,
    this.dividerBelow = false,
    this.turns = 0,
    this.turnsSecondary = 0,
    String? tooltip,
    String? labelSecondary,
    String? tooltipSecondary,
    IconData? iconSecondary,
  })  : _tooltip = tooltip,
        _labelSecondary = labelSecondary,
        _tooltipSecondary = tooltipSecondary,
        _iconSecondary = iconSecondary;

  final String label;
  final IconData icon;
  final String? _tooltip;
  final String? _labelSecondary;
  final String? _tooltipSecondary;
  final IconData? _iconSecondary;
  final bool dividerAbove;
  final bool dividerBelow;
  final int turns;
  final int turnsSecondary;

  String get tooltip => _tooltip ?? label;
  String get labelSecondary => _labelSecondary ?? label;
  String get tooltipSecondary =>
      _tooltipSecondary ?? _labelSecondary ?? tooltip;
  IconData get iconSecondary => _iconSecondary ?? icon;
}

// Enum used to represent available icon states in the responsive Scaffold
// menus items.
enum ResponsiveMenuItemIconState { primary, secondary }

/// A simplistic animated responsive Scaffold.
///
/// Q: Is this Flexfold?
/// A: No, it is not, this is simpler, but feel free to use it.
///
/// This is just a straw-man for a "real" responsive animated Scaffold. It
/// can give you some ideas about how you can make a simple one. It
/// has hard coded menu and items, but you could easily make them and many
/// other things configurable properties too.
///
/// About the animated menu solution for this menu. I wanted to test if it could
/// be built with just one single implicit AnimatedContainer. As can be seen
/// it can. I thought it would be simpler than using more explicit
/// animation controllers. Turned out getting hold of widths and states got
/// very cumbersome and complex, not really an approach I recommend, but
/// an interesting experiment.
///
/// This is not really a Flutter "Universal" Widget that only depends on the
/// SDK, it also depends on a few other project consts and utilities. It
/// contains some code that is not be 100% reusable since it is a bit app
/// specific. Hence the 'app' level widget classification. This widget
/// could easily be made "universal" and become quite useful.
///
/// (c) BSD 3-clause - Mike Rydstrom (@RydMike)
class ResponsiveScaffold extends StatefulWidget {
  const ResponsiveScaffold({
    super.key,
    // ResponsiveScaffold properties.
    this.title,
    this.menuTitle,
    this.menuLeadingTitle,
    this.menuLeadingSubtitle,
    this.menuLeadingAvatarLabel = '',
    required this.menuItems,
    this.menuItemsEnabled,
    this.menuItemsIconState,
    this.onSelect,
    this.railWidth = _kRailWidth,
    this.menuWidth = _kMenuWidth,
    this.breakpointShowFullMenu = _kBreakpointShowFullMenu,

    // Standard Scaffold properties, just passed along to Scaffold.
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  /// The primary widget displayed in the app bar, just you normal AppBar title.
  ///
  /// Goes into the title of the AppBar, that is not directly accessible as a
  /// property when using the ResponsiveScaffold.
  ///
  /// Typically a [Text] widget that contains a description of the current
  /// contents of the page.
  final Widget? title;

  /// The widget displayed in the app bar on the menu as app title or a logo.
  ///
  /// Typically a [Text] widget that contains a description of the name of the
  /// app, but it could also be small company logo that fits in an AppBar.
  final Widget? menuTitle;

  /// A title for leading menu item.
  final Widget? menuLeadingTitle;

  /// A subtitle for leading menu item.
  final Widget? menuLeadingSubtitle;

  /// A label for the avatar for the leading menu item.
  final String menuLeadingAvatarLabel;

  /// Responsive menu tap items.
  final List<ResponsiveMenuItems> menuItems;

  /// Responsive menu tap items enabled/disabled.
  final List<bool>? menuItemsEnabled;

  /// Responsive menu tap items used icon state.
  final List<ResponsiveMenuItemIconState>? menuItemsIconState;

  /// Callback called with menu index when user taps on a menu item.
  final ValueChanged<int>? onSelect;

  /// The width of the menu when it is rail sized.
  ///
  /// Values from 48...60 work well. You can vary the size depending on
  /// if the rail is shown on larger media and have a wider rail then,
  /// and then make it really tight if the rail is used on a phone.
  ///
  /// Defaults to [_kRailWidth] 50.
  final double railWidth;

  /// The width of the menu when it is full sized.
  ///
  /// Values from 250...304 work well. The Drawer will be the same width as the
  /// menu, when the menu is shown in a Drawer.
  ///
  /// Defaults to [_kMenuWidth] 275.
  ///
  /// Standard Drawer in Flutter is 304 dp. If you make the menu
  /// wider than Flutter's default drawer size 304dp, the menu will be
  /// constrained to 304dp by Flutter SDK when used in the Drawer, it will
  /// however still shrink to the width provided here when smaller than 304dp.
  ///
  /// The M3 design calls for the new Drawer to be even wider 360dp.
  /// https://m3.material.io/components/navigation-drawer/specs
  final double menuWidth;

  /// Breakpoint when we want to show the full sized menu.
  ///
  /// Below this breakpoint, we can toggle between rail and drawer view, over
  /// and equal to this breakpoint, we can toggle between full sized menu
  /// or rail, we never see the drawer over this breakpoint.
  ///
  /// Defaults to [_kBreakpointShowFullMenu] 900.
  final double breakpointShowFullMenu;

  // Rest of the properties are just standard Scaffold properties that
  // are passed along to it.

  /// If true, and [bottomNavigationBar] or [persistentFooterButtons]
  /// is specified, then the [body] extends to the bottom of the Scaffold,
  /// instead of only extending to the top of the [bottomNavigationBar]
  /// or the [persistentFooterButtons].
  ///
  /// If true, a [MediaQuery] widget whose bottom padding matches the height
  /// of the [bottomNavigationBar] will be added above the scaffold's [body].
  ///
  /// This property is often useful when the [bottomNavigationBar] has
  /// a non-rectangular shape, like [CircularNotchedRectangle], which
  /// adds a [FloatingActionButton] sized notch to the top edge of the bar.
  /// In this case specifying `extendBody: true` ensures that scaffold's
  /// body will be visible through the bottom navigation bar's notch.
  final bool extendBody;

  /// If true, and an [AppBar] is specified, then the height of the [body] is
  /// extended to include the height of the app bar and the top of the body
  /// is aligned with the top of the app bar.
  ///
  /// This is useful if the app bar's [AppBar.backgroundColor] is not
  /// completely opaque.
  ///
  /// This property is false by default.
  final bool extendBodyBehindAppBar;

  /// The primary content of the scaffold.
  ///
  /// Displayed below the [AppBar], above the bottom of the ambient
  /// [MediaQuery]'s [MediaQueryData.viewInsets], and behind the
  /// [floatingActionButton] and [Drawer]. If [resizeToAvoidBottomInset] is
  /// false then the body is not resized when the onscreen keyboard appears,
  /// i.e. it is not inset by `viewInsets.bottom`.
  ///
  /// The widget in the body of the scaffold is positioned at the top-left of
  /// the available space between the app bar and the bottom of the scaffold. To
  /// center this widget instead, consider putting it in a [Center] widget and
  /// having that be the body. To expand this widget instead, consider
  /// putting it in a [SizedBox.expand].
  ///
  /// If you have a column of widgets that should normally fit on the screen,
  /// but may overflow and would in such cases need to scroll, consider using a
  /// [ListView] as the body of the scaffold. This is also a good choice for
  /// the case where your body is a scrollable list.
  final Widget? body;

  /// A button displayed floating above [body], in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  final Widget? floatingActionButton;

  /// Responsible for determining where the [floatingActionButton] should go.
  ///
  /// If null, the [ScaffoldState] will use the default location,
  /// [FloatingActionButtonLocation.endFloat].
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Animator to move the [floatingActionButton] to a new
  /// [floatingActionButtonLocation].
  ///
  /// If null, the [ScaffoldState] will use the default animator,
  /// [FloatingActionButtonAnimator.scaling].
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  ///
  /// Typically this is a list of [TextButton] widgets. These buttons are
  /// persistently visible, even if the [body] of the scaffold scrolls.
  ///
  /// These widgets will be wrapped in an [OverflowBar].
  ///
  /// The [persistentFooterButtons] are rendered above the
  /// [bottomNavigationBar] but below the [body].
  final List<Widget>? persistentFooterButtons;

  /// Optional callback that is called when the [Scaffold.drawer] is opened or
  /// closed.
  final DrawerCallback? onDrawerChanged;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from right-to-left ([TextDirection.ltr]) or
  /// left-to-right ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openEndDrawer] function.
  ///
  /// To close the drawer, use [Navigator.pop].
  ///
  /// {@tool dartpad --template=stateful_widget_material}
  /// To disable the drawer edge swipe, set the
  /// [Scaffold.endDrawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openEndDrawer] to open the drawer and [Navigator.pop] to
  /// close it.
  final Widget? endDrawer;

  /// Optional callback that is called when the [Scaffold.endDrawer] is opened
  /// or closed.
  final DrawerCallback? onEndDrawerChanged;

  /// The color to use for the scrim that obscures primary content while a
  /// drawer is open.
  ///
  /// By default, the color is [Colors.black54]
  final Color? drawerScrimColor;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  ///
  /// The theme's [ThemeData.scaffoldBackgroundColor] by default.
  final Color? backgroundColor;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  ///
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget? bottomNavigationBar;

  /// The persistent bottom sheet to display.
  ///
  /// A persistent bottom sheet shows information that supplements the primary
  /// content of the app. A persistent bottom sheet remains visible even when
  /// the user interacts with other parts of the app.
  ///
  /// A closely related widget is a modal bottom sheet, which is an alternative
  /// to a menu or a dialog and prevents the user from interacting with the rest
  /// of the app. Modal bottom sheets can be created and displayed with the
  /// [showModalBottomSheet] function.
  ///
  /// Unlike the persistent bottom sheet displayed by [showBottomSheet]
  /// this bottom sheet is not a [LocalHistoryEntry] and cannot be dismissed
  /// with the scaffold AppBar's back button.
  ///
  /// If a persistent bottom sheet created with [showBottomSheet] is already
  /// visible, it must be closed before building the Scaffold with a new
  /// [bottomSheet].
  ///
  /// The value of [bottomSheet] can be any widget at all. It's unlikely to
  /// actually be a [BottomSheet], which is used by the implementations of
  /// [showBottomSheet] and [showModalBottomSheet]. Typically it's a widget
  /// that includes [Material].
  final Widget? bottomSheet;

  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true.
  final bool? resizeToAvoidBottomInset;

  /// Whether this scaffold is being displayed at the top of the screen.
  ///
  /// If true then the height of the [AppBar] will be extended by the height
  /// of the screen's status bar, i.e. the top padding for [MediaQuery].
  ///
  /// The default value of this property, like the default value of
  /// [AppBar.primary], is true.
  final bool primary;

  /// Configuration of offset passed to [DragStartDetails].
  final DragStartBehavior drawerDragStartBehavior;

  /// The width of the area within which a horizontal swipe will open the
  /// drawer.
  ///
  /// By default, the value used is 20.0 added to the padding edge of
  /// `MediaQuery.of(context).padding` that corresponds to the surrounding
  /// [TextDirection]. This ensures that the drag area for notched devices is
  /// not obscured. For example, if `TextDirection.of(context)` is set to
  /// [TextDirection.ltr], 20.0 will be added to
  /// `MediaQuery.of(context).padding.left`.
  final double? drawerEdgeDragWidth;

  /// Determines if the [Scaffold.drawer] can be opened with a drag
  /// gesture.
  ///
  /// By default, the drag gesture is enabled.
  final bool drawerEnableOpenDragGesture;

  /// Determines if the [Scaffold.endDrawer] can be opened with a
  /// drag gesture.
  ///
  /// By default, the drag gesture is enabled.
  final bool endDrawerEnableOpenDragGesture;

  /// Restoration ID to save and restore the state of the [Scaffold].
  ///
  /// If it is non-null, the scaffold will persist and restore whether the
  /// [Drawer] and [endDrawer] was open or closed.
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  final String? restorationId;

  @override
  State<ResponsiveScaffold> createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends State<ResponsiveScaffold> {
  // Controls the active width of the menu-rail: expanded - collapsed - 0.
  late double activeMenuWidth;
  late double previousMenuWidth;
  // Controls if the menu is expanded, when it can be.
  bool isMenuExpanded = true;
  // Controls if the rail is closed when it can be.
  bool isMenuClosed = false;
  // Menu completed closing.
  bool menuDoneClosing = false;
  // Enabled state of each menuItem.
  late List<bool> menuItemsEnabled;
  // Active state of each menuItem.
  late List<ResponsiveMenuItemIconState> menuItemsIconState;
  // Previous media size.
  late Size previousMediaSize;

  @override
  void didUpdateWidget(covariant ResponsiveScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    final Size mediaSize = MediaQuery.sizeOf(context);
    if (mediaSize != previousMediaSize) {
      previousMediaSize = mediaSize;
      // On purpose not checking the the height here, we want to keep and auto
      // open the rail if this is possibly a phone in landscape mode.
      final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint;
      // This make the rail menu auto-close on phone size and open back up if
      // moving to landscape or none phone size. You can still open a very
      // narrow rail also in phone size, but if you resize the canvas at phone
      // sizes, it will auto close again, but as long as you keep media size the
      // same it stays open. So on a phone with fixed media size, you only see
      // it appearing when you rotate the device, in a logical way.
      // On web/desktop you would no use it this small, but if/when you do the
      // the auto-closing of the thin rail, might feel strange. I just
      // consider it as a "the UI knows it is too narrow" for even a rail case.
      if (isPhone) {
        isMenuClosed = true;
      } else {
        isMenuClosed = false;
      }
    }
    if (widget.menuItemsEnabled != null) {
      if (widget.menuItemsEnabled != oldWidget.menuItemsEnabled &&
          (widget.menuItemsEnabled?.length ?? 0) == widget.menuItems.length) {
        menuItemsEnabled = widget.menuItemsEnabled!;
      }
    }
    if (widget.menuItemsIconState != null) {
      if (widget.menuItemsIconState != oldWidget.menuItemsIconState &&
          (widget.menuItemsIconState?.length ?? 0) == widget.menuItems.length) {
        menuItemsIconState = widget.menuItemsIconState!;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Assume zero media size;
    previousMediaSize = Size.zero;
    // Not set again if changed in the app, only on init,  you can make it do
    // that too if you need it, which you do if want to change the expanded
    // menu max width dynamically while running app.
    activeMenuWidth = widget.menuWidth;
    previousMenuWidth = activeMenuWidth;
    // No value provided for enabled or state used, will default to
    // enabled and primary state.
    menuItemsEnabled =
        List<bool>.generate(widget.menuItems.length, (int i) => true);
    if (widget.menuItemsEnabled != null) {
      if ((widget.menuItemsEnabled?.length ?? 0) == widget.menuItems.length) {
        menuItemsEnabled = widget.menuItemsEnabled!;
      }
    }
    menuItemsIconState = List<ResponsiveMenuItemIconState>.generate(
        widget.menuItems.length,
        (int i) => ResponsiveMenuItemIconState.primary);
    if (widget.menuItemsIconState != null) {
      if ((widget.menuItemsIconState?.length ?? 0) == widget.menuItems.length) {
        menuItemsIconState = widget.menuItemsIconState!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // We are on media width where we allow the menu to be shown as fixed,
    // we are just going to call that isDesktop, but it could be large tablet
    // or tablet in landscape, or even phone in landscape.
    final bool isDesktop =
        MediaQuery.sizeOf(context).width >= widget.breakpointShowFullMenu;
    // Secret sauce for a simple auto responsive & toggleable drawer-rail-menu.
    if (!isDesktop) activeMenuWidth = widget.railWidth;
    if (!isDesktop && isMenuClosed) activeMenuWidth = 0;
    if (!isDesktop && !isMenuClosed) activeMenuWidth = widget.railWidth;
    if (isDesktop && !isMenuExpanded) activeMenuWidth = widget.railWidth;
    if (isDesktop && isMenuExpanded) activeMenuWidth = widget.menuWidth;

    // The entire layout is just a Row!
    return Row(
      children: <Widget>[
        // The menu content when used as a menu or rail is in a constrained
        // box set to the maximum width of the menu.
        FocusTraversalGroup(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: widget.menuWidth),
            // Material is used for proper surface, and it gives us the "right"
            // theme behaving container background.
            child: Material(
              // This simple implicit animation AnimatedContainer is what
              // animates the entire side menu from 0, to rail to menu width.
              // The default type, canvas, makes Material use theme.CanvasColor,
              // which in FlexThemeData and in ThemeData.from is set to
              // theme.colorScheme.background. So our menu will be background
              // colored by default, including any color branding our theme
              // in FlexColorScheme has applied to it, just like a Drawer.
              child: AnimatedContainer(
                duration: _kMenuAnimationDuration,
                onEnd: () {
                  setState(() {
                    // This state was added to not get the automatically implied
                    // leading widget to show up before the menu rail completed
                    // sliding out of visibility, looked better that way.
                    // Otherwise it jumps into visibility when the menu rail
                    // starts its closing animation, and heading jumps to right.
                    if (isMenuClosed) {
                      menuDoneClosing = true;
                    } else {
                      menuDoneClosing = false;
                    }
                  });
                },
                width: activeMenuWidth,
                child: _AppMenu(
                  title: widget.menuTitle,
                  menuLeadingTitle: widget.menuLeadingTitle,
                  menuLeadingSubtitle: widget.menuLeadingSubtitle,
                  menuLeadingAvatarLabel: widget.menuLeadingAvatarLabel,
                  menuItems: widget.menuItems,
                  menuItemsEnabled: menuItemsEnabled,
                  menuItemsIconState: menuItemsIconState,
                  maxWidth: widget.menuWidth,
                  railWidth: widget.railWidth,
                  onSelect: widget.onSelect,
                  // User pushed the menu button, change menu state, on desktop
                  // we toggle the the menuExpanded and not menuExpanded state.
                  // On not desktop size (phone or tablet) we toggle the state
                  // isMenuClosed or not.
                  onOperate: () {
                    setState(() {
                      // Desktop case, we can only expand or collapse the menu.
                      if (isDesktop) {
                        // So we toggle its state.
                        isMenuExpanded = !isMenuExpanded;
                      } else {
                        // Tablet or phone case, we can only close the menu, it
                        // will then be in the Drawer, from where it can be
                        // opened again as a drawer with the menu button.
                        isMenuClosed = true;
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        // The actual page content is a normal Scaffold, in an Expanded Widget
        // in the 2nd part of the Row.
        Expanded(
          child: FocusTraversalGroup(
            child: Scaffold(
              appBar: AppBar(
                title: widget.title,
                // We are using dynamic title content, we want it start aligned.
                centerTitle: false,
                actions: const <Widget>[AboutIconButton()],
                // Some logic to show the implicit menu button on AppBar when
                // there is no rail or menu.
                automaticallyImplyLeading:
                    !isDesktop && isMenuClosed && menuDoneClosing,
              ),
              // The menu content when used in the Drawer.
              drawer: ConstrainedBox(
                // We use the same size on the drawer that we have on our menu.
                // We can do that by constraining the drawer een if it does not
                // have a width size property.
                constraints: BoxConstraints.expand(width: widget.menuWidth),
                child: Drawer(
                  child: _AppMenu(
                    title: widget.menuTitle,
                    menuLeadingTitle: widget.menuLeadingTitle,
                    menuLeadingSubtitle: widget.menuLeadingSubtitle,
                    menuLeadingAvatarLabel: widget.menuLeadingAvatarLabel,
                    menuItems: widget.menuItems,
                    menuItemsEnabled: menuItemsEnabled,
                    menuItemsIconState: menuItemsIconState,
                    maxWidth: widget.menuWidth,
                    railWidth: widget.railWidth,
                    onSelect: (int index) {
                      Navigator.of(context).pop();
                      widget.onSelect?.call(index);
                    },
                    // User pushed menu button in Drawer, close the Drawer and
                    // set menu state to not be closed, it will open as a rail.
                    onOperate: () {
                      Navigator.of(context).pop();
                      // If we do this, we can wait to complete the closing
                      // drawer animation, before we trigger animating the
                      // rail visible:
                      Future<void>.delayed(_kMenuAnimationDuration, () {
                        setState(() {
                          isMenuClosed = false;
                        });
                      });
                      // If we do this instead, both animate at the same time:
                      // setState(() {
                      //   isMenuClosed = false;
                      // });
                    },
                  ),
                ),
              ),
              //
              // All the rest of the standard Scaffold properties that we
              // pass along to the actual Scaffold Widget.
              //
              body: widget.body,
              floatingActionButton: widget.floatingActionButton,
              floatingActionButtonLocation: widget.floatingActionButtonLocation,
              floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
              persistentFooterButtons: widget.persistentFooterButtons,
              onDrawerChanged: widget.onDrawerChanged,
              endDrawer: widget.endDrawer,
              onEndDrawerChanged: widget.onEndDrawerChanged,
              bottomNavigationBar: widget.bottomNavigationBar,
              bottomSheet: widget.bottomSheet,
              backgroundColor: widget.backgroundColor,
              resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
              primary: widget.primary,
              drawerDragStartBehavior: widget.drawerDragStartBehavior,
              extendBody: widget.extendBody,
              extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
              drawerScrimColor: widget.drawerScrimColor,
              drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
              drawerEnableOpenDragGesture: !isDesktop && isMenuClosed,
              endDrawerEnableOpenDragGesture:
                  widget.endDrawerEnableOpenDragGesture,
              restorationId: widget.restorationId,
            ),
          ),
        ),
      ],
    );
  }
}

/// App side menu and rail, used in default example, and examples 4 and 5.
///
/// Contains tap commands control the views for example 5 and reset settings to
/// default values. Added a theme mode toggle on the rail too, noticed it was
/// handy to have there while testing themes.
///
/// This menu is not configurable via properties, it is just a simple fixed
/// solution needed for this demo app.
class _AppMenu extends StatefulWidget {
  const _AppMenu({
    this.title,
    required this.maxWidth,
    this.onOperate,
    this.onSelect,
    required this.railWidth,
    this.menuLeadingTitle,
    this.menuLeadingSubtitle,
    this.menuLeadingAvatarLabel = '',
    required this.menuItems,
    required this.menuItemsEnabled,
    required this.menuItemsIconState,
  });
  final Widget? title;
  final double maxWidth;
  final VoidCallback? onOperate;
  final ValueChanged<int>? onSelect;
  final double railWidth;
  final Widget? menuLeadingTitle;
  final Widget? menuLeadingSubtitle;
  final String menuLeadingAvatarLabel;
  final List<ResponsiveMenuItems> menuItems;
  final List<bool> menuItemsEnabled;
  final List<ResponsiveMenuItemIconState> menuItemsIconState;

  @override
  _AppMenuState createState() => _AppMenuState();
}

class _AppMenuState extends State<_AppMenu> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color menuBackground = theme.canvasColor;
    final Color scaffoldBackground = theme.scaffoldBackgroundColor;
    final bool closeColors =
        colorsAreClose(menuBackground, scaffoldBackground, isLight);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints size) {
        // The overflow box is not the prettiest approach, but has some
        // convenient properties for this simple animated menu using just
        // a single AnimatedContainer.
        return OverflowBox(
          alignment: AlignmentDirectional.topStart,
          minWidth: 0,
          maxWidth: widget.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // We use an AppBar element as header in the menu too, a custom
              // Widget would be less restrictive, but for simplicity, the
              // AppBar has so many nice things built in to handle text style,
              // size and scaling for the title that are tedious to replicate
              AppBar(
                title: widget.title,
                titleSpacing: 0,
                leadingWidth: widget.railWidth,
                leading: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.menu),
                  onPressed: widget.onOperate,
                ),
              ),
              Expanded(
                child: Container(
                  width: size.maxWidth,
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      end: BorderSide(
                        color: closeColors
                            ? theme.dividerColor
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  child: ClipRect(
                    child: OverflowBox(
                      alignment: AlignmentDirectional.topStart,
                      minWidth: 0,
                      maxWidth: widget.maxWidth,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero, //  Removes all edge insets
                        children: <Widget>[
                          // A leading item the menu/rail.
                          _MenuLeadingItem(
                            railWidth: widget.railWidth,
                            menuLeadingTitle: widget.menuLeadingTitle,
                            menuLeadingSubtitle: widget.menuLeadingSubtitle,
                            menuLeadingAvatarLabel:
                                widget.menuLeadingAvatarLabel,
                          ),
                          // Add all the menu items.
                          for (int i = 0; i < widget.menuItems.length; i++)
                            _MenuItem(
                              width: size.maxWidth,
                              menuWidth: widget.maxWidth,
                              onTap: () {
                                setState(() {
                                  selectedItem = i;
                                });
                                widget.onSelect?.call(i);
                              },
                              selected: selectedItem == i,
                              icon: widget.menuItemsIconState[i] ==
                                      ResponsiveMenuItemIconState.primary
                                  ? widget.menuItems[i].icon
                                  : widget.menuItems[i].iconSecondary,
                              turns: widget.menuItemsIconState[i] ==
                                      ResponsiveMenuItemIconState.primary
                                  ? widget.menuItems[i].turns
                                  : widget.menuItems[i].turnsSecondary,
                              label: widget.menuItemsIconState[i] ==
                                      ResponsiveMenuItemIconState.primary
                                  ? widget.menuItems[i].label
                                  : widget.menuItems[i].labelSecondary,
                              tooltip: widget.menuItemsIconState[i] ==
                                      ResponsiveMenuItemIconState.primary
                                  ? widget.menuItems[i].tooltip
                                  : widget.menuItems[i].tooltipSecondary,
                              enabled: widget.menuItemsEnabled[i],
                              dividerAbove: widget.menuItems[i].dividerAbove,
                              dividerBelow: widget.menuItems[i].dividerBelow,
                              railWidth: widget.railWidth,
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

/// The items for the menu.
class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.width,
    required this.menuWidth,
    required this.onTap,
    this.selected = false,
    required this.icon,
    required this.turns,
    required this.label,
    required this.tooltip,
    this.dividerAbove = false,
    this.dividerBelow = false,
    required this.railWidth,
    this.enabled = true,
  });

  final double width;
  final double menuWidth;
  final VoidCallback onTap;
  final bool selected;
  final IconData icon;
  final int turns;
  final String label;
  final String tooltip;
  final bool dividerAbove;
  final bool dividerBelow;
  final double railWidth;
  final bool enabled;

  // Height of the menu item.
  static const double _itemHeight = 50;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    // Just some colors for the menu items, based on the current color schemes.
    // Always when you can, use colors from the theme.colorScheme to make
    // custom elements in your app they react to theme changes and use the theme
    // colors. You can make elaborate hues and opacities of the colors in the
    // theme's color schemes, like here:
    final Color iconColor = enabled
        ? isLight
            ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
                theme.colorScheme.onSurface)
            : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
                theme.colorScheme.onSurface)
        : theme.colorScheme.onSurface.withAlpha(0x55);
    final Color textColor = enabled
        ? theme.colorScheme.onSurface.withAlpha(0xCC)
        : theme.colorScheme.onSurface.withAlpha(0x55);
    // The M3 guide calls for 12dp padding after the selection indicator on
    // the menu highlight in a Drawer or side menu. We can do that, but we
    // have such a narrow rail for phone size, so at rail sizes we will make it
    // much smaller, even 2 different sizes.
    final double endPadding = (width > railWidth + 10)
        ? 12
        // If we use a really narrow rail rail, make padding even smaller-
        : railWidth < 60
            ? 5
            : 8;
    // Remove the menu when it gets smaller than 4dp during animation.
    if (width < 4) {
      return const SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (dividerAbove) const Divider(thickness: 1, height: 1),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 2, endPadding, 2),
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(_MenuItem._itemHeight / 2),
                bottomRight: Radius.circular(_MenuItem._itemHeight / 2),
              ),
              // This is a tap command menu, so we keep selected item
              // transparent. We still get desktop/web hover and tap splash.
              // However, you can do this on a menu that selects an item that
              // should remain highlighted and show last selected item:
              // color: selected ? theme.focusColor : Colors.transparent,
              color: Colors.transparent,
              child: SizedBox(
                height: _MenuItem._itemHeight,
                width: math.max(width - endPadding, 0),
                child: OverflowBox(
                  alignment: AlignmentDirectional.topStart,
                  minWidth: 0,
                  maxWidth: math.max(menuWidth, 0),
                  child: InkWell(
                    onTap: enabled ? onTap : null,
                    child: Row(
                      children: <Widget>[
                        Tooltip(
                          // Show tooltips only at rail size and if enabled.
                          // Setting message to empty never shows tooltip.
                          message: width == railWidth && enabled ? tooltip : '',
                          // Just to get the tooltip outside the rail.
                          margin: const EdgeInsetsDirectional.only(start: 50),
                          waitDuration: const Duration(milliseconds: 500),
                          // Constrain icon to min of rail width.
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                              width: railWidth,
                              height: railWidth,
                            ),
                            child: turns == 0
                                ? Icon(icon, color: iconColor)
                                : RotatedBox(
                                    quarterTurns: turns,
                                    child: Icon(icon, color: iconColor),
                                  ),
                          ),
                        ),
                        // Below width of 10dp we remove the label.
                        if (width < railWidth + 10)
                          const SizedBox.shrink()
                        else
                          Text(
                            label,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: textColor),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (dividerBelow) const Divider(thickness: 1, height: 1),
        ],
      );
    }
  }
}

/// Example of a leading item for the entire menu.
class _MenuLeadingItem extends StatefulWidget {
  const _MenuLeadingItem({
    required this.railWidth,
    this.menuLeadingTitle,
    this.menuLeadingSubtitle,
    this.menuLeadingAvatarLabel = '',
  });
  final double railWidth;
  final Widget? menuLeadingTitle;
  final Widget? menuLeadingSubtitle;
  final String menuLeadingAvatarLabel;

  @override
  _MenuLeadingItemState createState() => _MenuLeadingItemState();
}

class _MenuLeadingItemState extends State<_MenuLeadingItem> {
  bool _collapsed = true;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextTheme primaryTextTheme = theme.primaryTextTheme;
    const double hPadding = 5;

    return Focus(
      focusNode: _focusNode,
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
              radius: widget.railWidth / 2 - hPadding,
              child: Text(
                widget.menuLeadingAvatarLabel,
                style: primaryTextTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            title: widget.menuLeadingTitle,
            subtitle: widget.menuLeadingSubtitle,
            trailing: ExpandIcon(
              isExpanded: !_collapsed,
              size: 32,
              padding: EdgeInsets.zero,
              onPressed: (_) {
                _focusNode.requestFocus();
                setState(() {
                  _collapsed = !_collapsed;
                });
              },
            ),
            onTap: () {
              _focusNode.requestFocus();
              setState(() {
                _collapsed = !_collapsed;
              });
            },
          ),
          // Add some expand actions for access to mock functionality.
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
                          onPressed: () {
                            showAppAboutDialog(context);
                          },
                          child: Column(
                            children: <Widget>[
                              const Icon(Icons.info, size: 30),
                              Text('About', style: textTheme.labelSmall),
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
