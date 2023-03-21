import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const bool _debug = kDebugMode && false;

/// Generate random colors that are visually appealing.
///
/// This is a port of: https://github.com/lzyzsd/AndroidRandomColor to dart.
class RandomColor {
  /// Constructor for random generator
  /// [seed] Random seed to use for generating colors
  RandomColor([int? seed]) {
    if (seed != null) {
      _random = Random(seed);
    } else {
      _random = Random();
    }
  }

  final int minBrightness = 16;
  final int maxBrightness = 84;
  late Random _random;

  /// Get random color.
  ///
  /// Optional arguments:
  /// [colorHue] Random color hue [Range] to use
  /// [colorSaturation] Random color saturation [Range]
  /// [colorBrightness] Random color brightness [Range]
  Color randomColor({
    ColorHue colorHue = ColorHue.random,
    ColorSaturation colorSaturation = ColorSaturation.random,
    ColorBrightness colorBrightness = ColorBrightness.random,
  }) {
    int s;
    int h;
    int b;

    h = colorHue.returnHue(_random);
    s = colorSaturation.returnSaturation(_random);
    b = colorBrightness.returnBrightness(_random);

    _log('Color hue: $h');
    _log('Color saturation: $s');
    _log('Color brightness: $b');

    return _getColor(h, s, b);
  }

  /// Return a random Material color swatch.
  MaterialColor randomMaterialColor({
    ColorHue colorHue = ColorHue.random,
    ColorSaturation colorSaturation = ColorSaturation.random,
    bool debug = false,
  }) {
    int saturation;
    int hue;
    int brightness;

    hue = colorHue.returnHue(_random);
    saturation = colorSaturation.returnSaturation(_random);
    brightness =
        const ColorBrightness.custom(Range(45, 55)).returnBrightness(_random);

    /// Middle color
    final Color baseColor = _getColor(hue, saturation, brightness);

    Color getLighterColor(int lighterShade) {
      return _getColor(hue, saturation, brightness + (lighterShade * 5));
    }

    Color getDarkerColor(int darkerShade) {
      return _getColor(hue, saturation, brightness - (darkerShade * 5));
    }

    final MaterialColor finishedColor =
        MaterialColor(baseColor.value, <int, Color>{
      50: getLighterColor(5),
      100: getLighterColor(4),
      200: getLighterColor(3),
      300: getLighterColor(2),
      400: getLighterColor(1),
      500: baseColor,
      600: getDarkerColor(1),
      700: getDarkerColor(2),
      800: getDarkerColor(3),
      900: getDarkerColor(4),
    });
    return finishedColor;
  }

  /// Get list of random colors
  /// Calls [randomColor] for [count] number of times.
  /// [count] Number of colors
  List<Color> randomColors({
    required int count,
    ColorHue colorHue = ColorHue.random,
    ColorSaturation colorSaturation = ColorSaturation.random,
    ColorBrightness colorBrightness = ColorBrightness.random,
    bool debug = false,
  }) {
    final List<Color> colors = <Color>[];
    for (int i = 0; i < count; i++) {
      colors.add(randomColor(
        colorHue: colorHue,
        colorSaturation: colorSaturation,
        colorBrightness: colorBrightness,
      ));
    }
    return colors;
  }

  /// Need to get RGB from hsv values and make new color from them.
  /// Ported to dart from: https://stackoverflow.com/a/25964657/3700909
  Color _getColor(int hue, int saturation, int brightness) {
    final double s = saturation / 100;
    final double v = brightness / 100;
    return HSLColor.fromAHSL(1, hue.toDouble(), s, v).toColor();
  }

  void _log(String s) {
    if (_debug) {
      debugPrint('RandomColor: $s');
    }
  }
}

@immutable
class ColorBrightness {
  const ColorBrightness.custom(Range brightnessRange)
      : _brightness = brightnessRange,
        type = -1;

  const ColorBrightness._(this._brightness, this.type);

  static const int minBrightness = 16;
  static const int maxBrightness = 84;

  static const ColorBrightness dark =
      ColorBrightness._(Range(minBrightness, minBrightness + 30), 3);
  static const ColorBrightness light = ColorBrightness._(
      Range((maxBrightness + minBrightness) ~/ 2, maxBrightness), 1);

  static const ColorBrightness primary =
      ColorBrightness._(Range(minBrightness + 20, maxBrightness - 20), 2);
  static const ColorBrightness random =
      ColorBrightness._(Range(minBrightness, maxBrightness), 5);

  static const List<ColorBrightness> values = <ColorBrightness>[
    veryLight,
    light,
    primary,
    dark,
    veryDark,
    random
  ];
  static const ColorBrightness veryDark =
      ColorBrightness._(Range(minBrightness ~/ 2, minBrightness + 30), 4);
  static const ColorBrightness veryLight = ColorBrightness._(
      Range((maxBrightness + minBrightness) ~/ 2,
          maxBrightness + (minBrightness ~/ 2)),
      0);
  final Range _brightness;
  final int type;

  int returnBrightness(Random random) {
    return _brightness.randomWithin(random);
  }

  @override
  String toString() {
    switch (type) {
      case 0:
        return 'very light';
      case 1:
        return 'light';
      case 2:
        return 'primary';
      case 3:
        return 'dark';
      case 4:
        return 'very dark';
      case 5:
        return 'random';
    }
    return 'custom';
  }

  static ColorBrightness multiple(
      {required List<ColorBrightness> colorBrightnessList, Random? random}) {
    colorBrightnessList.shuffle(random);
    return colorBrightnessList.first;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorBrightness &&
          runtimeType == other.runtimeType &&
          _brightness == other._brightness &&
          type == other.type;

  @override
  int get hashCode => _brightness.hashCode ^ type.hashCode;
}

@immutable
class ColorHue {
  const ColorHue.custom(Range hueRange)
      : _hue = hueRange,
        type = -1;
  const ColorHue._(this._hue, this.type);

  static const ColorHue blue = ColorHue._(Range(180, 240), 4);

  static const ColorHue green = ColorHue._(Range(60, 180), 3);

  static const ColorHue orange = ColorHue._(Range(10, 40), 1);

  static const ColorHue pink = ColorHue._(Range(315, 355), 6);
  static const ColorHue purple = ColorHue._(Range(240, 315), 5);

  static const ColorHue random = ColorHue._(Range(0, 360), 7);
  static const ColorHue red = ColorHue._(Range(-5, 10), 0);
  static const List<ColorHue> values = <ColorHue>[
    red,
    orange,
    yellow,
    green,
    blue,
    purple,
    pink,
    random
  ];
  static const ColorHue yellow = ColorHue._(Range(40, 60), 2);
  final Range _hue;
  final int type;

  int returnHue(Random random) {
    int hue = _hue.randomWithin(random);
    if (hue < 0) {
      hue = 360 + hue;
    }
    return hue;
  }

  @override
  String toString() {
    switch (type) {
      case 0:
        return 'red';
      case 1:
        return 'orange';
      case 2:
        return 'yellow';
      case 3:
        return 'green';
      case 4:
        return 'blue';
      case 5:
        return 'purple';
      case 6:
        return 'pink';
      case 7:
        return 'random';
    }
    return 'custom';
  }

  static ColorHue multiple(
      {required List<ColorHue> colorHues, Random? random}) {
    colorHues.shuffle(random);
    return colorHues.first;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorHue &&
          runtimeType == other.runtimeType &&
          _hue == other._hue &&
          type == other.type;

  @override
  int get hashCode => _hue.hashCode ^ type.hashCode;
}

@immutable
class ColorSaturation {
  const ColorSaturation.custom(Range saturationRange)
      : _saturation = saturationRange,
        type = -1;

  const ColorSaturation._(this._saturation, this.type);

  static const ColorSaturation highSaturation =
      ColorSaturation._(Range(80, 100), 2);

  static const ColorSaturation lowSaturation =
      ColorSaturation._(Range(0, 40), 0);

  static const ColorSaturation mediumSaturation =
      ColorSaturation._(Range(40, 80), 1);
  static const ColorSaturation monochrome = ColorSaturation._(Range.zero(), 4);

  static const ColorSaturation random = ColorSaturation._(Range(20, 100), 3);
  static const List<ColorSaturation> values = <ColorSaturation>[
    lowSaturation,
    mediumSaturation,
    highSaturation,
    random,
    monochrome
  ];
  final Range _saturation;
  final int type;

  int returnSaturation(Random random) {
    return _saturation.randomWithin(random);
  }

  @override
  String toString() {
    switch (type) {
      case 0:
        return 'low saturation';
      case 1:
        return 'medium saturation';
      case 2:
        return 'high saturation';
      case 3:
        return 'random';
      case 4:
        return 'monochrome';
    }
    return 'custom';
  }

  static ColorSaturation multiple(
      {required List<ColorSaturation> colorSaturations, Random? random}) {
    colorSaturations.shuffle(random);
    return colorSaturations.first;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorSaturation &&
          runtimeType == other.runtimeType &&
          _saturation == other._saturation &&
          type == other.type;

  @override
  int get hashCode => _saturation.hashCode ^ type.hashCode;
}

@immutable
class Range {
  const Range(this.start, this.end);

  const Range.staticValue(int value)
      : start = value,
        end = value;
  const Range.zero()
      : start = 0,
        end = 0;

  final int start;
  final int end;

  Range operator +(Range range) {
    return Range((start + range.start) ~/ 2, end);
  }

  bool contain(int value) {
    return value >= start && value <= end;
  }

  int randomWithin(Random random) {
    return (start + random.nextDouble() * (end - start)).round();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Range &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          end == other.end;

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}
