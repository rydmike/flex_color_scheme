import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';

/// An extension on [Color] to return the color values as a string
/// with format Color(0x12345678).
extension ColorStringClass on Color? {
  /// Returns the color values as a string with format Color(0x12345678).
  String toColorString() {
    if (this == null) {
      return 'Color(0x00000000)';
    } else {
      // ignore: lines_longer_than_80_chars
      return 'Color(0x${this!.value32bit.toRadixString(16).padLeft(8, '0').toUpperCase()})';
    }
  }
}
