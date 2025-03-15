import 'package:flutter/material.dart';

/// Enum to indicate which palette we are using.
///
/// Used to show which TonalPalette a hovered color belongs to.
enum TonalPalettes {
  primary,
  secondary,
  tertiary,
  error,
  neutral,
  neutralVariant,
}

/// A controller used to manage the hovered state on tonal palette color
/// tones.
///
/// When a ColorScheme color is hovered its tones should get an indicator
/// in the tonal palette.
/// We use this controller to communicate this to the UI.
class ToneIndicatorController with ChangeNotifier {
  ToneIndicatorController();

  // This is a controller prop for hovered color on the Colorscheme.
  Color? _hoverColor;
  Color? get hoverColor => _hoverColor;

  /// Set the hovered color.
  void setHover(Color? value, [bool notify = true]) {
    if (value == _hoverColor) return;
    _hoverColor = value;
    if (notify) notifyListeners();
  }

  // This is a controller prop for hovered palette on Colorscheme.
  TonalPalettes? _hoverTonalPalette;
  TonalPalettes? get hoverTonalPalette => _hoverTonalPalette;
  // Set the hovered palette the hovered color belongs to.
  void setPalette(TonalPalettes? value, [bool notify = true]) {
    if (value == _hoverTonalPalette) return;
    _hoverTonalPalette = value;
    if (notify) notifyListeners();
  }
}
