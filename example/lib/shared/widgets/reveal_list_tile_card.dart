import 'package:flutter/material.dart';

/// A list tile in a [Card] that can be toggled via its trailing widget to
/// open and reveal more content provided via [child].
///
/// The open reveal is animated.
///
/// The ListTile and its revealed child are wrapped in a Card widget. The
/// [RevealListTileCard] is primarily designed to be placed on scaffold using
/// its themed background color.
///
/// The header and background color of the Card get a slight primary color
/// blend, a notch above whatever the scaffold background might be using.
/// It always avoids the same color as the scaffold background, for both the
/// list tile heading and the card itself.
///
/// The widget is kept alive with [AutomaticKeepAliveClientMixin] so it does
/// not get dismissed and closed in scroll views. This "may" be a bit expensive
/// memory usage wise if this widget is used a lot in large lists. This widget
/// is intended for a limited amount of containers enabling showing and hiding
/// their content and keeping their open/close state alive. If you need one that
/// is more memory efficient, consider removing the
/// AutomaticKeepAliveClientMixin.
class RevealListTileCard extends StatefulWidget {
  const RevealListTileCard({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.margin = EdgeInsets.zero,
    this.headerPadding,
    this.enabled = true,
    this.isClosed = false,
    this.onChange,
    this.duration = const Duration(milliseconds: 200),
    this.child,
  }) : super(key: key);

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

  /// Whether this list tile is interactive.
  final bool enabled;

  /// Set to true to close the reveal list tile card and hide the child.
  ///
  /// Defaults to false, the card is open and child is shown.
  final bool isClosed;

  /// Callback called if the open/close state was changed.
  final ValueChanged<bool>? onChange;

  /// The duration of the show and hide animation of child.
  final Duration duration;

  /// The child to be revealed.
  final Widget? child;

  @override
  _RevealListTileCardState createState() => _RevealListTileCardState();
}

class _RevealListTileCardState extends State<RevealListTileCard>
    with AutomaticKeepAliveClientMixin {
  bool _closed = true;

  // Must override wantKeepAlive, when using AutomaticKeepAliveClientMixin.
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _closed = widget.isClosed;
  }

  @override
  void didUpdateWidget(covariant RevealListTileCard oldWidget) {
    if (oldWidget.isClosed != widget.isClosed) {
      _closed = widget.isClosed;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // Must call super when using AutomaticKeepAliveClientMixin.
    super.build(context);

    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final bool isDark = theme.brightness == Brightness.dark;

    // Dark mode needs stronger blends to be visible.
    final int blendFactor = isDark ? 3 : 2;

    // Make card slightly more colored than card background is
    Color cardColor = Color.alphaBlend(
        scheme.primary.withAlpha(4 * blendFactor), theme.cardColor);

    // Compute a header color with fixed primary blend, make it a stronger tint.
    Color headerColor =
        Color.alphaBlend(scheme.primary.withAlpha(14 * blendFactor), cardColor);

    // If card or its header color, is equal to scaffold background, we will
    // adjust both and make them more primary tinted.
    if (cardColor == theme.scaffoldBackgroundColor ||
        headerColor == theme.scaffoldBackgroundColor) {
      cardColor = Color.alphaBlend(
          scheme.primary.withAlpha(4 * blendFactor), cardColor);
      headerColor = Color.alphaBlend(
          scheme.primary.withAlpha(4 * blendFactor), headerColor);
    }
    // If it was header color that was equal, the same adjustment on card, may
    // have caused card body to become equal to scaffold background, let's
    // check for it and adjust only it once again if it happened. Very unlikely
    // that this happens, but it is possible.
    if (cardColor == theme.scaffoldBackgroundColor) {
      cardColor = Color.alphaBlend(
          scheme.primary.withAlpha(2 * blendFactor), cardColor);
    }
    return Card(
      margin: widget.margin,
      color: cardColor,
      child: Column(
        children: <Widget>[
          Theme(
            data: theme.copyWith(cardColor: headerColor),
            child: Material(
              type: MaterialType.card,
              child: ListTile(
                contentPadding: widget.headerPadding,
                leading: widget.leading,
                title: widget.title,
                trailing: ExpandIcon(
                  size: 36,
                  isExpanded: !_closed,
                  padding: EdgeInsets.zero,
                  onPressed: (_) {
                    setState(() {
                      _closed = !_closed;
                    });
                    widget.onChange?.call(_closed);
                  },
                ),
                onTap: () {
                  setState(() {
                    _closed = !_closed;
                  });
                  widget.onChange?.call(_closed);
                },
              ),
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
            child: (_closed || widget.child == null)
                ? const SizedBox.shrink()
                : widget.child,
          ),
        ],
      ),
    );
  }
}
