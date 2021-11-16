import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

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

  // This widget is stateful is because the ColorTools methods may be a bit
  // expensive so we are try to avoid calling them when not needed.
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

  @override
  Widget build(BuildContext context) {
    // treeDepthInfo(context, 'ColorNameValue ${widget.label}');
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.label,
              textAlign: TextAlign.start,
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
                child: SelectableText(
                  '#${widget.color.hexCode}',
                  // overflow: TextOverflow.fade,
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  style: TextStyle(
                      color: widget.textColor,
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
