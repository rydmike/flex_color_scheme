import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';

/// Function to check if two colors are visually close to each other.
bool colorsAreClose(Color a, Color b, bool isLight) {
  final int dR = a.red8bit - b.red8bit;
  final int dG = a.green8bit - b.green8bit;
  final int dB = a.blue8bit - b.blue8bit;
  // Calculating orthogonal distance between colors should take the
  // square root as well, but we don't need that extra compute step.
  // We just need a number to represents some relative closeness of the
  // colors. We use this to determine a level when we should draw a border
  // around our panel.
  // These values were just determined by visually testing what was a good
  // trigger for when the border appeared and disappeared during testing.
  // We get better results if we use a different trigger value for light
  // and dark mode.
  final int distance = dR * dR + dG * dG + dB * dB;
  final int closeTrigger = isLight ? 10 : 65;

  if (distance < closeTrigger) {
    return true;
  } else {
    return false;
  }
}
