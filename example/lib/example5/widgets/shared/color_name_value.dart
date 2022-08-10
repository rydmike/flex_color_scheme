import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'copy_color_to_clipboard.dart';

/// This widget is intended to be wrapped in Material with [color].
/// It shows a [label] describing the theme property name of the [color] and
/// color code name as a Material color, if it is a Material color and a common
/// color name for the color.
class ColorNameValue extends StatefulWidget {
  const ColorNameValue({
    super.key,
    required this.color,
    required this.textColor,
    required this.label,
    this.fontSize = 12,
    this.tone,
    this.showTone = false,
    this.inputColor,
    this.inputTextColor,
    this.showMaterialName = false,
    this.isLocked,
    this.onLocked,
  });

  final Color color;
  final Color textColor;
  final String label;
  final double fontSize;
  final int? tone;
  final bool showTone;
  final Color? inputColor;
  final Color? inputTextColor;
  final bool showMaterialName;
  final bool? isLocked;
  final ValueChanged<bool?>? onLocked;

  @override
  State<ColorNameValue> createState() => _ColorNameValueState();
}

class _ColorNameValueState extends State<ColorNameValue> {
  late String materialName;
  late String nameThatColor;

  // This widget is stateful because the ColorTools methods may be a bit
  // expensive so we try to avoid calling them when not needed, by keeping
  // their values in state and only updating them when the Material they
  // describe actually change color. Which happens quite a bit still during
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
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // Alpha value for opacity on some text further below. Experimented with
    // the look of some opacity on the text on the color code values and names.
    // Decided it was better to just use the actual on colors to better show
    // what they actually look like.
    const int alpha = 0xFF;
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Text(
            widget.label,
            textAlign: TextAlign.start,
            overflow: TextOverflow.clip,
            style: TextStyle(
                color: widget.textColor,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w600),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Tone heading and value
              if (widget.tone != null && widget.showTone)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Tone ${widget.tone}',
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        style: TextStyle(
                            color: widget.textColor.withAlpha(alpha),
                            fontSize: widget.fontSize - 1,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              // Nearest name match from a list of 1566 color names
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      nameThatColor,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: widget.textColor.withAlpha(alpha),
                          fontSize: widget.fontSize - 1,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              // Name match and shade from Material colors.
              if (materialName != '' && widget.showMaterialName)
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
                            color: widget.textColor.withAlpha(alpha),
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
                            color: widget.textColor.withAlpha(alpha),
                            fontSize: widget.fontSize,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () async {
                        await copyColorToClipboard(context, widget.color);
                      },
                    ),
                  ),
                ],
              ),
              // Show input color only if both are defined
              if (widget.inputColor != null && widget.inputTextColor != null)
                Card(
                  margin: const EdgeInsets.only(top: 8.0),
                  color: widget.inputColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    side: BorderSide(color: theme.dividerColor, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Input color',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: widget.inputTextColor,
                                fontSize: widget.fontSize - 1,
                                fontWeight: FontWeight.w500)),
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
                                  '#${widget.inputColor!.hexCode}',
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: widget.inputTextColor
                                          ?.withAlpha(alpha),
                                      fontSize: widget.fontSize - 1,
                                      fontWeight: FontWeight.w600),
                                ),
                                onTap: () async {
                                  await copyColorToClipboard(
                                    context,
                                    // Safe bang, we are checking above != null
                                    widget.inputColor!,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
          if (widget.isLocked != null && widget.onLocked != null)
            Positioned.directional(
              textDirection: Directionality.of(context),
              top: 14,
              start: 0,
              child: Switch(
                value: widget.isLocked!,
                activeColor: Color.alphaBlend(
                    widget.color.withAlpha(0x25), widget.textColor),
                activeTrackColor: Color.alphaBlend(
                    widget.color.withAlpha(0x60), widget.textColor),
                inactiveTrackColor: Color.alphaBlend(
                    widget.color.withAlpha(0xAA), widget.textColor),
                inactiveThumbColor: Color.alphaBlend(
                    widget.color.withAlpha(0xDD), widget.textColor),
                onChanged: widget.onLocked?.call,
                // materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
        ],
      ),
    );
  }
}
