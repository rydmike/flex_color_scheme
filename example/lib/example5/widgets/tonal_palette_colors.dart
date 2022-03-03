import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_indicator.dart';

/// TonalPaletteColors widget.
///
/// Not library exposed, private to the library.
class TonalPaletteColors extends StatelessWidget {
  /// Default const constructor.
  const TonalPaletteColors({
    Key? key,
    required this.tonalPalette,
    this.selectedColor,
    this.height = 40,
  }) : super(key: key);

  /// The tonal palette to draw.
  final List<int> tonalPalette;

  /// The selected color.
  final Color? selectedColor;

  /// Height of the color pick item.
  final double height;

  /// Commonly-used tone values.
  static const List<int> commonTones = <int>[
    0,
    10,
    20,
    30,
    40,
    50,
    60,
    70,
    80,
    90,
    95,
    99,
    100,
  ];

  static String _toneLabel(int index) {
    return TonalPaletteColors.commonTones[index].toString();
  }

  static Color _onColor(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  // Set the color value as a String on the Clipboard in
  // currently configured format, notify with snackbar that it was copied.
  Future<void> _setClipboard(BuildContext context, Color color) async {
    final ClipboardData data = ClipboardData(text: '0x${color.hexAlpha}');
    await Clipboard.setData(data);
    final String materialName = ColorTools.materialName(color);
    final String nameThatColor = ColorTools.nameThatColor(color);
    final String space = materialName == '' ? '' : ' ';
    // Show a snack bar with the copy message.
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied color code ${color.hexCode} for color '
            '$nameThatColor $materialName${space}to the clipboard!'),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (int i = 0; i < tonalPalette.length; i++)
          Expanded(
            child: PaletteColorBox(
              color: Color(tonalPalette[i]),
              height: height,
              onTap: () {
                _setClipboard(context, Color(tonalPalette[i]));
              },
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text(
                        _toneLabel(i),
                        style: TextStyle(
                          fontSize: 11,
                          color: _onColor(Color(tonalPalette[i])),
                        ),
                      ),
                    ),
                    if (selectedColor == Color(tonalPalette[i]))
                      Center(
                        child: Icon(
                          Icons.circle,
                          size: 34,
                          color: _onColor(
                            Color(tonalPalette[i]),
                          ).withAlpha(0x33),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
