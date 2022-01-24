import 'package:flutter/material.dart';

/// A [Card] with a [ListTile] header that can be toggled via its trailing
/// widget to open and reveal more content provided via [child] in the card.
///
/// The open reveal is animated.
///
/// The ListTile and its revealed child are wrapped in a Card widget. The
/// [StatefulHeaderCard] is primarily designed to be placed on [Scaffold] using
/// its themed background color.
///
/// The header and background color of the [Card] get a slight primary color
/// blend added to its default surface color.
/// It always avoids the same color as the scaffold background, for both the
/// list tile heading and the card itself.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class StatefulHeaderCard extends StatefulWidget {
  const StatefulHeaderCard({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.margin = EdgeInsets.zero,
    this.headerPadding,
    this.enabled = true,
    this.isOpen = true,
    this.duration = const Duration(milliseconds: 200),
    this.color,
    this.boldTitle = true,
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

  /// Whether this list tile and card operation is interactive.
  final bool enabled;

  /// Set to true top open card, to false to close.
  ///
  /// Defaults to true.
  final bool isOpen;

  /// The duration of the show and hide animation of child.
  final Duration duration;

  /// Define this color to override that automatic adaptive background color.
  final Color? color;

  /// Make the title bold.
  ///
  /// The title Widget will be made bold if it is a [Text] widget,
  /// regardless of used style it has.
  final bool boldTitle;

  /// The child to be revealed.
  final Widget? child;

  @override
  State<StatefulHeaderCard> createState() => _StatefulHeaderCardState();
}

class _StatefulHeaderCardState extends State<StatefulHeaderCard> {
  late bool _isOpen;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.isOpen;
  }

  @override
  void didUpdateWidget(covariant StatefulHeaderCard oldWidget) {
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
    final ColorScheme scheme = theme.colorScheme;
    final bool isDark = theme.brightness == Brightness.dark;
    // Scaling for the blend value, used to tune the look a bit.
    final int blendFactor = isDark ? 3 : 2;

    // start with no extra blend on card, assume it is bit different from
    // scaffold background where this Card is designed to be placed.
    Color cardColor = theme.cardColor;
    // Compute a header color with fixed primary blend, make a stronger tint
    // of current blended on card color using same primary as card has, if any.
    Color headerColor =
        Color.alphaBlend(scheme.primary.withAlpha(5 * blendFactor), cardColor);
    // If card or its header color, is equal to scaffold background, we will
    // adjust both and make them more primary tinted. This happens e.g. when we
    // use not blend level, or with the all level blend mode. In this
    // design we want the Card on the scaffold to always have a slightly
    // different background color from scaffold background where it is placed,
    // not necessarily a lot, but always a bit at least.
    if (cardColor == theme.scaffoldBackgroundColor ||
        headerColor == theme.scaffoldBackgroundColor) {
      cardColor = Color.alphaBlend(
          scheme.primary.withAlpha(4 * blendFactor), cardColor);
      headerColor = Color.alphaBlend(
          scheme.primary.withAlpha(4 * blendFactor), headerColor);
    }
    // If it was header color that was equal, the adjustment on card, may
    // have caused card body to become equal to scaffold background, let's
    // check for it and adjust only it once again if it happened. Very unlikely
    // that this happens, but it is possible.
    if (cardColor == theme.scaffoldBackgroundColor) {
      cardColor = Color.alphaBlend(
          scheme.primary.withAlpha(2 * blendFactor), cardColor);
    }

    // Force title widget for Card header to use opinionated bold style,
    // if we have a title, boldTitle is true and title was a Text.
    Widget? _title = widget.title;
    if (_title != null && _title is Text && widget.boldTitle) {
      final Text textTitle = _title;
      final TextStyle? _style = _title.style;
      final String _text = textTitle.data ?? '';
      _title = Text(
        _text,
        style: _style?.copyWith(fontWeight: FontWeight.bold) ??
            const TextStyle(fontWeight: FontWeight.bold),
      );
    }

    // If in rare occasion we had passed a background card color, we just
    // use that as color. This is intended to be an exception when we need
    // to present something in the card that must be on a certain color.
    // Like primary text theme, text must be on primary color.
    if (widget.color != null) cardColor = widget.color!;

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
                title: _title,
                trailing: ExpandIcon(
                  size: 32,
                  isExpanded: _isOpen,
                  padding: EdgeInsets.zero,
                  onPressed: (_) {
                    _handleTap();
                  },
                ),
                onTap: _handleTap,
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
            child: (_isOpen && widget.child != null)
                ? widget.child
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
