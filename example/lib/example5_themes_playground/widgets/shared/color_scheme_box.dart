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
    this.color = Colors.white,
    this.size = const Size(45, 35),
    this.defaultOption = false,
    this.optionIcon = Icons.palette_outlined,
    this.defaultOptionIcon = Icons.texture_outlined,
  });

  final Color color;
  final Size size;
  final bool defaultOption;
  final IconData optionIcon;
  final IconData defaultOptionIcon;

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      FlexSchemeOnColors.estimateErrorBrightness(color) == Brightness.light;

  // On color for icon on the colored box.
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
        child: defaultOption
            ? Icon(defaultOptionIcon, color: _onColor(color))
            : Icon(optionIcon, color: _onColor(color)),
      ),
    );
  }
}
