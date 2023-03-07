import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// A Material widget used as a color indicator to show a color in the
/// TonalPalette.
@immutable
class PaletteColorBox extends StatefulWidget {
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
  State<PaletteColorBox> createState() => _PaletteColorBoxState();
}

class _PaletteColorBoxState extends State<PaletteColorBox> {
  late String materialName;
  late String nameThatColor;
  late String space;
  late String hexCode;
  late bool colorIsLight;

  // The nameThatColor and materialName lookups are expensive, especially
  // nameThatColor. Widget stores them as stateful values to avoid computing
  // them every time the widget rebuilds.
  @override
  void initState() {
    super.initState();
    materialName = ColorTools.materialName(widget.color);
    nameThatColor = ColorTools.nameThatColor(widget.color);
    space = materialName == '' ? '' : ' ';
    hexCode = widget.color.hexCode;
    colorIsLight =
        ThemeData.estimateBrightnessForColor(widget.color) == Brightness.light;
  }

  @override
  void didUpdateWidget(covariant PaletteColorBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.color != oldWidget.color) {
      materialName = ColorTools.materialName(widget.color);
      nameThatColor = ColorTools.nameThatColor(widget.color);
      space = materialName == '' ? '' : ' ';
      hexCode = widget.color.hexCode;
      colorIsLight = ThemeData.estimateBrightnessForColor(widget.color) ==
          Brightness.light;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      waitDuration: const Duration(milliseconds: 700),
      message: '${widget.name} tone ${widget.tone}\n'
          '#$hexCode $nameThatColor$space$materialName\n'
          'Tap to copy to Clipboard',
      child: Material(
        type: MaterialType.canvas,
        color: widget.color,
        clipBehavior: Clip.none,
        child: SizedBox(
          height: widget.height,
          child: InkWell(
            focusColor: colorIsLight ? Colors.black26 : Colors.white30,
            hoverColor: colorIsLight ? Colors.black26 : Colors.white30,
            onTap: widget.onTap?.call,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
