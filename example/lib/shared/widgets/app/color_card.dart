import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../example5/widgets/shared/copy_color_to_clipboard.dart';

/// This is just simple SizedBox with a Card with a passed in label, background
/// and text label color. Used to show the colors of a theme or scheme
/// color property.
///
/// It also uses a tooltip to shpow the color code, its Material name, if it
/// is a Material 2 color, and iot always shows it general/common name, from
/// a list of +1600 color names.
///
/// When you tap the ColorCard the color value is copied to clipboard.

class ColorCard extends StatelessWidget {
  const ColorCard({
    Key? key,
    required this.label,
    required this.color,
    required this.textColor,
    this.size = const Size(80, 56),
  }) : super(key: key);

  final String label;
  final Color color;
  final Color textColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final String materialName = ColorTools.materialName(color);
    final String nameThatColor = ColorTools.nameThatColor(color);
    final String space = materialName == '' ? '' : ' ';

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Tooltip(
        message: 'Color #${color.hexCode} $nameThatColor$space$materialName.'
            '\nTap box to copy RGB value to Clipboard.',
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          color: color,
          child: InkWell(
            onTap: () {
              copyColorToClipboard(context, color);
            },
            child: Center(
              child: Text(
                label,
                style: TextStyle(color: textColor, fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
