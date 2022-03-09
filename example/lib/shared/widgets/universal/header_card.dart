import 'package:flutter/material.dart';

/// A [Card] with a [ListTile] header that can be toggled via its trailing
/// widget to open and reveal more content provided via [child] in the card.
///
/// The open reveal is animated.
///
/// The ListTile and its revealed child are wrapped in a Card widget. The
/// [HeaderCard] is primarily designed to be placed on [Scaffold] using
/// its themed background color.
///
/// The header and background color of the [Card] get a slight primary color
/// blend added to its default surface color.
/// It always avoids the same color as the scaffold background, for both the
/// list tile heading and the card itself.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.margin = EdgeInsets.zero,
    this.headerPadding,
    this.elevation = 0,
    this.enabled = true,
    this.isOpen = true,
    required this.onTap,
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

  /// Void callback to indicate the desire to toggle state was clicked.
  ///
  /// You can click on the trailing icon ot the header to trigger the callback.
  /// This widget does not keep any state, it is up to caller
  /// to set [isOpen] to the right state.
  final VoidCallback onTap;

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
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    final bool isDark = theme.brightness == Brightness.dark;
    // Scaling for the blend value, used to tune the look a bit.
    final int blendFactor = isDark ? 3 : 2;

    // Use passed in color for the Card, or default themed Card theme color.
    final Color cardColor = color ?? theme.cardColor;
    // Compute a header color with fixed primary blend, make a stronger tint
    // of current blended on card color using same primary as card has, if any.
    final Color headerColor = Color.alphaBlend(
        scheme.primary.withAlpha(5 * blendFactor), theme.cardColor);

    // Get the card's ShapeBorder from the theme card shape
    ShapeBorder? shapeBorder = theme.cardTheme.shape;
    // Make a shape border if card or its header color is equal to scaffold
    // background color, because if we have a theme where that happens
    // we want to separate the header card from the background with a border.
    if (cardColor == theme.scaffoldBackgroundColor ||
        headerColor == theme.scaffoldBackgroundColor) {
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
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          side: BorderSide(
            color: theme.dividerColor,
            width: 1,
          ),
        );
      }
    }

    // Force title widget for Card header to use opinionated bold style,
    // if we have a title, boldTitle is true and title was a Text.
    Widget? cardTitle = title;
    if (cardTitle != null && cardTitle is Text && boldTitle) {
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
      margin: margin,
      color: cardColor,
      shape: shapeBorder,
      elevation: elevation,
      child: Column(
        children: <Widget>[
          Theme(
            data: theme.copyWith(cardColor: headerColor),
            child: Material(
              type: MaterialType.card,
              child: ListTile(
                contentPadding: headerPadding,
                leading: leading,
                title: cardTitle,
                trailing: ExpandIcon(
                  size: 32,
                  isExpanded: isOpen,
                  padding: EdgeInsets.zero,
                  onPressed: (_) {
                    onTap();
                  },
                ),
                onTap: onTap,
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: child,
              );
            },
            child: (isOpen && child != null) ? child : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
