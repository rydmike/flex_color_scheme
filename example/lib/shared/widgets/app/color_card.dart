import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../example5/widgets/shared/copy_color_to_clipboard.dart';
import '../../const/app_data.dart';

/// This is just simple SizedBox in a Card, with a passed in label, background
/// and text label color. Used to show the colors of a theme or scheme
/// color property.
///
/// It also has a tooltip to show the color code, its Material name, if it
/// is a Material 2 color, and it always shows its general/common name, from
/// a list of +1600 color names.
///
/// When you tap the ColorCard the color value is copied to the clipboard
/// in Dart format.
class ColorCard extends StatelessWidget {
  const ColorCard({
    Key? key,
    required this.label,
    required this.color,
    required this.textColor,
    this.size,
  }) : super(key: key);

  final String label;
  final Color color;
  final Color textColor;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final String materialName = ColorTools.materialName(color);
    final String nameThatColor = ColorTools.nameThatColor(color);
    final String space = materialName == '' ? '' : ' ';
    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppData.phoneWidthBreakpoint ||
        media.size.height < AppData.phoneHeightBreakpoint;
    final double fontSize = isPhone ? 10 : 11;
    final Size effectiveSize =
        size ?? (isPhone ? const Size(74, 54) : const Size(86, 58));

    return SizedBox(
      width: effectiveSize.width,
      height: effectiveSize.height,
      child: Tooltip(
        waitDuration: const Duration(milliseconds: 700),
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
                style: TextStyle(color: textColor, fontSize: fontSize),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
