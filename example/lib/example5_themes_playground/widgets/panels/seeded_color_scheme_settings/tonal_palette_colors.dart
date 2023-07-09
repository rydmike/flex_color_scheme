import 'dart:async';

import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

import '../../shared/copy_color_to_clipboard.dart';
import '../../shared/palette_color_box.dart';

/// TonalPaletteColors widget.
class TonalPaletteColors extends StatelessWidget {
  /// Default const constructor.
  const TonalPaletteColors({
    super.key,
    required this.name,
    required this.tonalPalette,
    this.selectedColor,
    this.height = 28,
    this.paletteType = FlexPaletteType.common,
  });

  /// Name of tonal palette.
  final String name;

  /// The tonal palette to draw.
  final List<int> tonalPalette;

  /// The selected color.
  final Color? selectedColor;

  /// Height of the color pick item.
  final double height;

  /// Type of palette displayed.
  final FlexPaletteType paletteType;

  String _toneLabel(int index) {
    return paletteType == FlexPaletteType.common
        ? FlexTonalPalette.commonTones[index].toString()
        : FlexTonalPalette.extendedTones[index].toString();
  }

  static Color _onColor(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Row(
        children: <Widget>[
          for (int i = 0; i < tonalPalette.length; i++)
            Expanded(
              child: PaletteColorBox(
                // TODO(rydmike): Attempt to help compiler with JS release issue
                // Related to tone hover indication feature issue 16.3.2023.
                // That did not work properly anymore on JS release mode builds
                // regardless of html/canvaskit renderer. The feature still
                // worked in web debug builds and any VM build mode for all
                // other platforms. Weird JS compiler optimization bug is my
                // suspected cause.
                key: ValueKey<String>('$name${_toneLabel(i)}'),
                name: name,
                tone: _toneLabel(i),
                color: Color(tonalPalette[i]),
                height: height,
                onTap: () {
                  unawaited(
                      copyColorToClipboard(context, Color(tonalPalette[i])));
                },
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Text(
                          _toneLabel(i),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: _onColor(Color(tonalPalette[i])),
                          ),
                        ),
                      ),
                      if (selectedColor == Color(tonalPalette[i]))
                        Center(
                          child: Icon(
                            Icons.circle,
                            size: height,
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
      ),
    );
  }
}
