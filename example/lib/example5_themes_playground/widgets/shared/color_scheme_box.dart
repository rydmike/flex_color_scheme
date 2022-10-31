import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Widget used to display a colored option box used in PopupMenus.
///
/// Uses a palette icon for none default option, asi it is typically used to
/// select a color in this app. It uses a texture icon representing the the
/// default selection, also often representative of unknown color selection.
class ColorSchemeBox extends StatelessWidget {
  const ColorSchemeBox({
    super.key,
    this.selected = false,
    this.foregroundColor,
    this.backgroundColor,
    this.borderColor,
    this.size,
    this.defaultOption = false,
    this.optionIcon = Icons.palette_outlined,
    this.defaultOptionIcon = Icons.texture_outlined,
    this.child,
  });

  /// The box is selected.
  ///
  ///Changes the border from 1dp to 2.5dp.
  final bool selected;

  /// Color used on foreground icon. If and IconData is provided or default
  /// one used.
  ///
  /// Defaults to
  final Color? foregroundColor;

  /// Color used on the Material used for the box.
  ///
  /// Default to Material default background color.
  final Color? backgroundColor;

  /// Color of the border.
  ///
  /// Defaults theme colorscheme outline.
  final Color? borderColor;

  /// Size of the item.
  ///
  /// Defaults to Themed ToggleButtons min width+16 and height constraints, if
  /// one fo them is not defined, then defaults to width 45+16 and height 35.
  final Size? size;

  /// This is the default options.
  ///
  /// If set to true, the [defaultOptionIcon] is used.
  final bool defaultOption;

  /// Icon used for option.
  ///
  /// Defaults to [Icons.palette_outlined].
  final IconData optionIcon;

  /// Icon used for the default option.
  ///
  /// Defaults to [Icons.texture_outlined].
  final IconData defaultOptionIcon;

  /// Use a child widget as content instead of an icon.
  ///
  /// If child is null the icon or default icon is used.
  /// If a child is used the foreground color has no effect, the child
  /// need to provide its own coloring.
  final Widget? child;

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      FlexSchemeOnColors.estimateErrorBrightness(color) == Brightness.light;

  // On color for icon on the colored box.
  static Color _onColor(final Color color) => _isLight(color)
      ? Colors.black.withOpacity(0.8)
      : Colors.white.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final Color foreground =
        foregroundColor ?? _onColor(backgroundColor ?? scheme.background);
    final double width =
        size?.width ?? theme.toggleButtonsTheme.constraints?.minWidth ?? 45;
    final double height =
        size?.height ?? theme.toggleButtonsTheme.constraints?.minHeight ?? 35;
    final BorderRadius borderRadius = theme.toggleButtonsTheme.borderRadius ??
        const BorderRadius.all(Radius.circular(12));

    return SizedBox(
      width: width + 16,
      height: height,
      child: Material(
        color: backgroundColor ?? scheme.background,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(
            color: borderColor ?? scheme.outline,
            width: selected ? 2 : 1,
          ),
        ),
        child: child ??
            (defaultOption
                ? Icon(defaultOptionIcon, color: foreground)
                : Icon(optionIcon, color: foreground)),
      ),
    );
  }
}
