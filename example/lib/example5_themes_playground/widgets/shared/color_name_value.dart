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
    this.showInputColor = true,
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

  /// If showInputColor is set to false the input color is not shown even if
  /// both inputColor and inputTextColor are defined.
  ///
  /// Defaults to true.
  final bool showInputColor;
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

  // This widget is stateful because the ColorTools methods are
  // expensive, so we try to avoid calling them when not needed, by keeping
  // their values in state and only updating them when the Material they
  // describe actually change color. Which happens quite a bit still during
  // theme changes when the theme change goes through its color lerp to new
  // theme colors.
  @override
  void initState() {
    super.initState();
    materialName = ColorTools.materialName(widget.color);
    nameThatColor = ColorTools.nameThatColor(widget.color);
  }

  @override
  void didUpdateWidget(covariant ColorNameValue oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.color != oldWidget.color) {
      materialName = ColorTools.materialName(widget.color);
      nameThatColor = ColorTools.nameThatColor(widget.color);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Text(widget.label,
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  color: widget.textColor, fontSize: widget.fontSize + 1)),
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
                            color: widget.textColor,
                            fontSize: widget.fontSize - 1),
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
                          color: widget.textColor,
                          fontSize: widget.fontSize - 1),
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
                            color: widget.textColor,
                            fontSize: widget.fontSize - 1),
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
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () async {
                        await copyColorToClipboard(context, widget.color);
                      },
                    ),
                  ),
                ],
              ),
              // Show input color only if both are defined and showInput color
              // is enabled.
              if (widget.inputColor != null &&
                  widget.inputTextColor != null &&
                  widget.showInputColor)
                Card(
                  margin: const EdgeInsets.only(top: 8.0),
                  color: widget.inputColor,
                  elevation: 0,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    side: BorderSide(color: theme.dividerColor, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Scheme input',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: widget.inputTextColor,
                              fontSize: widget.fontSize - 1),
                        ),
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
                                      color: widget.inputTextColor,
                                      fontSize: widget.fontSize - 1),
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
              child: Theme(
                data: theme.copyWith(
                    colorScheme: theme.colorScheme
                        .copyWith(outline: widget.color.withAlpha(0x77))),
                child: Switch(
                  value: widget.isLocked!,
                  activeColor: Color.alphaBlend(
                      widget.color.withAlpha(0x44), widget.textColor),
                  activeTrackColor: Color.alphaBlend(
                      widget.color.withAlpha(0x99), widget.textColor),
                  inactiveTrackColor: Color.alphaBlend(
                      widget.color.withAlpha(0xAA), widget.textColor),
                  inactiveThumbColor: Color.alphaBlend(
                      widget.color.withAlpha(0xCC), widget.textColor),
                  trackOutlineColor: theme.useMaterial3
                      ? MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.transparent;
                          }
                          if (states.contains(MaterialState.disabled)) {
                            return theme.colorScheme.onSurface.withAlpha(0x1F);
                          }
                          return widget.textColor.withAlpha(0x26);
                        })
                      : null,
                  onChanged: widget.onLocked?.call,
                  // materialTapTargetSize: MaterialTapTargetSize.padded,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
