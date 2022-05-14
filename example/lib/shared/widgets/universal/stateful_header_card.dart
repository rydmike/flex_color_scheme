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
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.margin = EdgeInsets.zero,
    this.headerPadding,
    this.elevation = 0,
    this.enabled = true,
    this.isOpen = true,
    this.duration = const Duration(milliseconds: 200),
    this.color,
    this.boldTitle = true,
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

  static bool _colorsAreClose(Color a, Color b) {
    final int dR = a.red - b.red;
    final int dG = a.green - b.green;
    final int dB = a.blue - b.blue;
    final int distance = dR * dR + dG * dG + dB * dB;
    // Calculating orthogonal distance between colors should take the the
    // square root as well, but we don't need that extra compute step.
    // We just need a number to represents some relative closeness of the
    // colors. We use this to determine a level when we should draw a border
    // around our panel.
    // This value was just determined by visually testing what was a good
    // trigger for when the border appeared and disappeared during testing.
    if (distance < 120) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final Color background = theme.scaffoldBackgroundColor;
    // Use passed in color for the Card, or default themed Card theme color.
    final Color cardColor = widget.color ?? theme.cardColor;
    // Compute a header color with fixed primary blend from the card color,
    final Color headerColor =
        Color.alphaBlend(scheme.primary.withAlpha(20), cardColor);
    // Get the card's ShapeBorder from the theme card shape
    ShapeBorder? shapeBorder = theme.cardTheme.shape;
    final bool useHeading = widget.title != null ||
        widget.subtitle != null ||
        widget.leading != null;
    // Make a shape border if Card or its header color are close in color
    // to the scaffold background color, because if that happens we want to
    // separate the header card from the background with a border.
    if (_colorsAreClose(cardColor, background) ||
        (_colorsAreClose(headerColor, background) && useHeading)) {
      // If we had one shape, copy in a border side to it.
      if (shapeBorder is RoundedRectangleBorder) {
        shapeBorder = shapeBorder.copyWith(
          side: BorderSide(
            color: theme.dividerColor,
            width: 1,
          ),
        );
        // If
      } else {
        // If border was null, make one matching Card default, but with a
        // BorderSide, if it was not null, we leave it as it was, it means it
        // has some other preexisting ShapeBorder, but it was not a
        // RoundedRectangleBorder, we don't know what it was, just let it be.
        shapeBorder ??= RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(useMaterial3 ? 12 : 4)),
          side: BorderSide(
            color: theme.dividerColor,
            width: 1,
          ),
        );
      }
    }

    // Force title widget for Card header to use opinionated bold style,
    // if we have a title, boldTitle is true and title was a Text.
    Widget? cardTitle = widget.title;
    if (cardTitle != null && cardTitle is Text && widget.boldTitle) {
      final Text textTitle = cardTitle;
      final TextStyle? cardTitleStyle = cardTitle.style;
      final String cardTitleText = textTitle.data ?? '';
      cardTitle = Text(
        cardTitleText,
        style: cardTitleStyle?.copyWith(fontWeight: FontWeight.bold) ??
            const TextStyle(fontWeight: FontWeight.bold),
      );
    }

    return Card(
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
              title: cardTitle,
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
    );
  }
}
