import 'package:flutter/material.dart';

import '../../utils/colors_are_close.dart';

/// A [Card] with a [ListTile] header that can be toggled via its trailing
/// widget to open and reveal more content provided via [child] in the card.
///
/// The open reveal is animated.
///
/// The ListTile and its revealed child are wrapped in a Card widget. The
/// [HeaderCardStateful] is primarily designed to be placed on [Scaffold] using
/// its themed background color.
///
/// The header and background color of the [Card] get a slight primary color
/// blend added to its default surface color.
/// It always avoids the same color as the scaffold background, for both the
/// list tile heading and the card itself.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class HeaderCardStateful extends StatefulWidget {
  const HeaderCardStateful({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.margin = EdgeInsets.zero,
    this.headerPadding,
    this.headingColor,
    this.backgroundColor,
    this.elevation = 0,
    this.enabled = true,
    this.isOpen = true,
    this.duration = const Duration(milliseconds: 200),
    this.startStraight = false,
    this.endStraight = false,
    this.child,
  });

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar] widget.
  final Widget? leading;

  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  ///
  /// This should not wrap. To enforce the single line limit, use
  /// [Text.maxLines].
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// The margins around the entire reveal list tile card.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry margin;

  /// The internal padding of the ListTile used as header.
  ///
  /// Insets the header [ListTile]'s contents:
  /// its [leading], [title], [subtitle].
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used.
  final EdgeInsetsGeometry? headerPadding;

  /// The background color for the header.
  ///
  /// If not provided, one that is slightly off from card color
  /// background color is computed.
  final Color? headingColor;

  /// The background color of the [HeaderCardStateful].
  ///
  /// If not defined, defaults to [ColorScheme.surfaceBright] in light theme
  /// mode and to color [ColorScheme.surfaceDim] in dark mode.
  final Color? backgroundColor;

  /// Elevation of the header card.
  ///
  /// Default to 0.
  final double elevation;

  /// Whether this list tile and card operation is interactive.
  final bool enabled;

  /// Set to true top open card, to false to close.
  ///
  /// Defaults to true.
  final bool isOpen;

  /// The duration of the show and hide animation of child.
  final Duration duration;

  /// The start side should be straight, no border radius.
  ///
  /// Defaults to false.
  final bool startStraight;

  /// The end side should be straight, no border radius.
  ///
  /// Defaults to false.
  final bool endStraight;

  /// The child to be revealed.
  final Widget? child;

  @override
  State<HeaderCardStateful> createState() => _HeaderCardStatefulState();
}

class _HeaderCardStatefulState extends State<HeaderCardStateful> {
  late bool _isOpen;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.isOpen;
  }

  @override
  void didUpdateWidget(covariant HeaderCardStateful oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != oldWidget.isOpen) _isOpen = widget.isOpen;
  }

  void _handleTap() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final Color background = theme.scaffoldBackgroundColor;
    final Color cardColor = widget.backgroundColor ??
        (isLight ? scheme.surfaceBright : scheme.surfaceDim);
    final Color headerColor = widget.headingColor ?? scheme.surfaceContainer;

    final bool useHeading = widget.title != null ||
        widget.subtitle != null ||
        widget.leading != null;

    // Default starting point value based on M3 and M2 mode spec values.
    double borderRadius = useMaterial3 ? 12 : 4;
    // Is themed? Try to get the radius from the theme and used that if it was.
    final ShapeBorder? cardShape = theme.cardTheme.shape;
    if (cardShape != null && cardShape is RoundedRectangleBorder) {
      final BorderRadius shape = cardShape.borderRadius as BorderRadius;
      borderRadius = shape.bottomLeft.x;
    }
    final bool useBorderSide = colorsAreClose(cardColor, background, isLight) ||
        (useHeading && colorsAreClose(headerColor, background, isLight));
    final ShapeBorder shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.horizontal(
        start:
            widget.startStraight ? Radius.zero : Radius.circular(borderRadius),
        end: widget.endStraight ? Radius.zero : Radius.circular(borderRadius),
      ),
      side: useBorderSide
          ? BorderSide(
              color: theme.dividerColor,
              width: 0, // This gives a hairline 1 pc border
            )
          : BorderSide.none,
    );

    return FocusTraversalGroup(
      child: Card(
        margin: widget.margin,
        color: cardColor,
        shape: shapeBorder,
        elevation: widget.elevation,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: <Widget>[
            Material(
              type: MaterialType.card,
              color: headerColor,
              child: ListTile(
                contentPadding: widget.headerPadding,
                leading: widget.leading,
                title: widget.title,
                subtitle: widget.subtitle,
                trailing: widget.enabled
                    ? ExpandIcon(
                        size: 32,
                        isExpanded: _isOpen,
                        padding: EdgeInsets.zero,
                        onPressed: (_) {
                          _handleTap();
                        },
                      )
                    : null,
                onTap: widget.enabled ? _handleTap : null,
              ),
            ),
            AnimatedSwitcher(
              duration: widget.duration,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: child,
                );
              },
              child: (_isOpen && widget.child != null)
                  ? widget.child
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
