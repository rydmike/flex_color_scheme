import 'package:flutter/material.dart';

/// Enum to indicate which palette we are using.
///
/// Used to show which TonalPalette a hovered color belongs to.
/// Tucking this ChangeNotifier into the ThemeController is not really kosher
/// it should be in its own Provider/Riverpod or Inherited widget.
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
/// When a ColorScheme color is hoveredm it tones will get an indicator
/// in the tonal palette. We use this controller to communicate this.
class ToneIndicatorController with ChangeNotifier {
  ToneIndicatorController();

// TODO(rydmike): Removed tone hover indication feature 16.3.2023.
// This is the start of adding it back!
//
// For some reason back in 2023 the tone hover feature started causing issues
// in WEB release mode builds, but only in WEB release mode on both SKIA and
// HTML. No idea why that happens only on web release mode and not in
// its debug mode or any mode VM mode build.
// Removal of this feature has removed commented code in,
//
// - theme_controller.dart
// - scheme_colors.dart
// - show_tonal_palette.dart
// - color_scheme_settings.dart
//
// we will bring it back but using its own controller to not mess with theme
// related one, as having this in the same controller was not a good idea
// to begin with.

  // This is just a controller prop for hovered color on Colorscheme.
  Color? _hoverColor;
  Color? get hoverColor => _hoverColor;
  void setHoverColor(Color? value, [bool notify = true]) {
    if (value == _hoverColor) return;
    _hoverColor = value;
    if (notify) notifyListeners();
  }

  // This is just a controller prop for hovered palette on Colorscheme.
  TonalPalettes? _hoverTonalPalette;
  TonalPalettes? get hoverTonalPalette => _hoverTonalPalette;
  void setHoverTonalPalette(TonalPalettes? value, [bool notify = true]) {
    if (value == _hoverTonalPalette) return;
    _hoverTonalPalette = value;
    if (notify) notifyListeners();
  }
}
