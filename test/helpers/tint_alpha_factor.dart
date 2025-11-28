import 'package:flutter/material.dart';


double tintAlphaFactor(
  Color color,
  Brightness mode, [
  bool surfaceMode = false,
]) {
  if (mode == Brightness.light) {
    return surfaceMode
        ? ThemeData.estimateBrightnessForColor(color) == Brightness.dark
            ? 1.5
            : 4.0
        : ThemeData.estimateBrightnessForColor(color) == Brightness.dark
            ? 5.0
            : 2.0;
  } else {
    return surfaceMode
        ? ThemeData.estimateBrightnessForColor(color) == Brightness.dark
            ? 5.0
            : 2.0
        : ThemeData.estimateBrightnessForColor(color) == Brightness.dark
            ? 5.0
            : 4.0;
  }
}
