import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// A list tile that can be toggled via trailing widget to open to reveal
/// more content and hidden again.
///
/// The ListTile and its revealed child are wrapped in a Card widget.
class RevealListTileCard extends StatefulWidget {
  const RevealListTileCard({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.enabled = true,
    this.closed = true,
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

  /// The tile's internal padding.
  ///
  /// Insets a [ListTile]'s contents: its [leading], [title], [subtitle].
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used.
  final EdgeInsetsGeometry? contentPadding;

  /// Whether this list tile is interactive.
  final bool enabled;

  /// Whether widget is closed or open-
  ///
  /// Set to false to hide child.
  final bool closed;

  /// Callback called if the open/close state was changed.
  final ValueChanged<bool>? onChange;

  /// The duration of the hide animation.
  final Duration duration;

  /// The child to be revealed
  final Widget? child;

  @override
  _RevealListTileCardState createState() => _RevealListTileCardState();
}

class _RevealListTileCardState extends State<RevealListTileCard>
    with AutomaticKeepAliveClientMixin {
  bool _closed = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _closed = widget.closed;
  }

  @override
  void didUpdateWidget(covariant RevealListTileCard oldWidget) {
    if (oldWidget.closed != widget.closed) {
      _closed = widget.closed;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // Must call super.
    super.build(context);

    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final bool isDark = theme.brightness == Brightness.dark;
    final int blendFactor = isDark ? 3 : 2;
    Color surface = scheme.surface.blend(scheme.primary, 3 * blendFactor);
    if (surface == theme.scaffoldBackgroundColor) {
      surface = surface.blend(scheme.primary, 1 * blendFactor);
    }
    return Card(
      color: scheme.surface.blend(scheme.primary, 1 * blendFactor),
      child: Column(
        children: <Widget>[
          Theme(
            data: theme.copyWith(
                cardColor: surface,
                colorScheme: scheme.copyWith(surface: surface)),
            child: Material(
              type: MaterialType.card,
              child: ListTile(
                contentPadding: widget.contentPadding,
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
