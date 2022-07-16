import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Widget used to display a colored box used in PopupMenus.
///
/// It has a palette icon fo none default color, and a texture icon representing
/// the default unknown color.
class ColorSchemeBox extends StatelessWidget {
  const ColorSchemeBox({
    super.key,
    this.color = Colors.white,
    this.size = const Size(45, 35),
    this.defaultColor = false,
  });

  final Color color;
  final Size size;
  final bool defaultColor;

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      FlexSchemeOnColors.estimateErrorBrightness(color) == Brightness.light;

  // On color used when a theme color property does not have a theme onColor.
  static Color _onColor(final Color color) => _isLight(color)
      ? Colors.black.withOpacity(0.4)
      : Colors.white.withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Material(
        color: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
        child: defaultColor
            ? Icon(Icons.texture_outlined, color: _onColor(color))
            : Icon(Icons.palette_outlined, color: _onColor(color)),
      ),
    );
  }
}
