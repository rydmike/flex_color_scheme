import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This widget is intended to be wrapped in material with [color].
/// It shows a [label] describing the theme property name of the [color] and
/// color code name as a Material color, if it is a Material color and a common
/// color name for the color.
class ColorNameValue extends StatefulWidget {
  const ColorNameValue({
    Key? key,
    required this.color,
    required this.textColor,
    required this.label,
    this.fontSize = 12.0,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final String label;
  final double fontSize;

  @override
  _ColorNameValueState createState() => _ColorNameValueState();
}

class _ColorNameValueState extends State<ColorNameValue> {
  late String materialName;
  late String nameThatColor;

  // This widget is stateful because the ColorTools methods may be a bit
  // expensive so we try to avoid calling them when not needed, by keeping
  // their values in state and only updating them when the Material they
  // describe actually changes color. Which happens quite a bit still during
  // theme changes when the theme change goes through its color lerp to new
  // theme colors.
  @override
  void initState() {
    materialName = ColorTools.materialName(widget.color);
    nameThatColor = ColorTools.nameThatColor(widget.color);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ColorNameValue oldWidget) {
    if (widget.color != oldWidget.color) {
      materialName = ColorTools.materialName(widget.color);
      nameThatColor = ColorTools.nameThatColor(widget.color);
      // debugPrint('ColorNameValue: didUpdateWidget() called names changed');
    }
    super.didUpdateWidget(oldWidget);
  }

  // Set current selected color value as a String on the Clipboard in
  // currently configured format, notify with snackbar that it was copied.
  Future<void> _setClipboard() async {
    final ClipboardData data = ClipboardData(text: widget.color.hexCode);
    await Clipboard.setData(data);
    final String space = materialName == '' ? '' : ' ';
    if (!mounted) return;
    // Show a snack bar with the paste error message.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied color code ${widget.color.hexCode} for color '
            '$nameThatColor $materialName${space}to the clipboard!'),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.label,
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  color: widget.textColor,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          // Nearest name match from a list of 1566 color names
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  nameThatColor,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: widget.textColor,
                      fontSize: widget.fontSize - 1,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          // Name match and shade from Material colors.
          if (materialName != '')
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text(
                    materialName,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    style: TextStyle(
                        color: widget.textColor,
                        fontSize: widget.fontSize - 1,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          // Hex code of the color, with alpha
          Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  hoverColor: isLight
                      ? const Color(0x40BCBCBC)
                      : const Color(0x30FFFFFF),
                  splashColor: isLight
                      ? const Color(0x40BCBCBC)
                      : const Color(0x30FFFFFF),
                  focusColor: isLight
                      ? const Color(0x40BCBCBC)
                      : const Color(0x30FFFFFF),
                  highlightColor: isLight
                      ? const Color(0x40BCBCBC)
                      : const Color(0x30FFFFFF),
                  child: Text(
                    '#${widget.color.hexCode}',
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                        color: widget.textColor,
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () async {
                    await _setClipboard();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
