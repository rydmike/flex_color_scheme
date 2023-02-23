import 'package:flutter/material.dart';

import '../../utils/colors_are_close.dart';

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
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.margin = EdgeInsets.zero,
    this.headerPadding,
    this.elevation = 0,
    this.enabled = true,
    this.isOpen = true,
    this.onTap,
    this.duration = const Duration(milliseconds: 200),
    this.color,
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
  /// Normal you would not use the property in the HeaderCard, but it
  /// is possible if required.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] widget.
  ///
  /// To show right-aligned metadata (assuming left-to-right reading order;
  /// left-aligned for right-to-left reading order), consider using a [Row] with
  /// [CrossAxisAlignment.baseline] alignment whose first item is [Expanded] and
  /// whose second child is the metadata text, instead of using the [trailing]
  /// property.
  final Widget? trailing;

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
  final VoidCallback? onTap;

  /// The duration of the show and hide animation of child.
  final Duration duration;

  /// Define this color to override that automatic adaptive background color.
  final Color? color;

  /// The child to be revealed.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final Color background = theme.scaffoldBackgroundColor;
    // TODO(rydmike): Monitor deprecation of cardColor.
    // Use passed in color for the Card, or scheme surface, used for Card.
    // As long as cardColor exist in ThemeData, we use it here, to demonstrate
    // the effect it has on an app using Card with default background in M2,
    // if it does not have correct ColorScheme assignment in the theme.
    final Color cardColor = color ?? theme.cardColor;
    // Compute a header color with fixed primary blend from the card color,
    final Color headerColor = Color.alphaBlend(
        scheme.surfaceTint.withAlpha(isLight ? 12 : 30), cardColor);
    // Get the card's ShapeBorder from the theme card shape
    ShapeBorder? shapeBorder = theme.cardTheme.shape;
    final bool useHeading =
        title != null || subtitle != null || leading != null;
    // Make a shape border if Card or its header color are close in color
    // to the scaffold background color, because if that happens we want to
    // separate the header card from the background with a border.
    if (colorsAreClose(cardColor, background, isLight) ||
        (colorsAreClose(headerColor, background, isLight) && useHeading)) {
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

    return FocusTraversalGroup(
      child: Card(
        margin: margin,
        shape: shapeBorder,
        elevation: elevation,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: <Widget>[
            if (useHeading)
              RepaintBoundary(
                child: Material(
                  type: MaterialType.card,
                  color: headerColor,
                  child: ListTile(
                    contentPadding: headerPadding,
                    leading: leading,
                    title: title,
                    subtitle: subtitle,
                    trailing: trailing ??
                        ((enabled && onTap != null)
                            ? ExpandIcon(
                                size: 32,
                                isExpanded: isOpen,
                                padding: EdgeInsets.zero,
                                onPressed: (_) {
                                  onTap?.call();
                                },
                              )
                            : null),
                    onTap: onTap?.call,
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
              child: (isOpen && child != null)
                  ? RepaintBoundary(child: child)
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
