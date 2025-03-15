import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// A Material widget used as a color indicator to show a color in the
/// TonalPalette.
@immutable
class PaletteColorBox extends StatelessWidget {
  /// Default const constructor for the color indicator.
  const PaletteColorBox(
      {super.key,
      this.onTap,
      this.color = Colors.blue,
      this.height = 40,
      required this.name,
      required this.tone,
      this.child})
      : assert(height > 0, 'Height must be positive.');

  /// Optional void callback, called when the color indicator is tapped.
  ///
  /// To disable selection and ink effect, omit or assign a null callback.
  final VoidCallback? onTap;

  /// The background color of the color indicator.
  ///
  /// Defaults to [Colors.blue].
  final Color color;

  /// Height of the color indicator.
  ///
  /// Defaults to 40.
  final double height;

  /// Name of tonal palette.
  final String name;

  /// String representation of used tone number.
  final String tone;

  /// Child widget to draw in the color indicator
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final bool colorIsLight =
        ThemeData.estimateBrightnessForColor(color) == Brightness.light;
    final String hexCode = color.hexCode;

    return Tooltip(
      waitDuration: const Duration(milliseconds: 700),
      message: '$name tone $tone\n'
          'Color #$hexCode\n'
          'Tap to copy to Clipboard',
      child: Material(
        type: MaterialType.canvas,
        color: color,
        clipBehavior: Clip.none,
        child: SizedBox(
          height: height,
          child: InkWell(
            focusColor: colorIsLight ? Colors.black26 : Colors.white30,
            hoverColor: colorIsLight ? Colors.black26 : Colors.white30,
            onTap: onTap?.call,
            child: child,
          ),
        ),
      ),
    );
  }
}
