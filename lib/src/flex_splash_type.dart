// ignore_for_file: comment_references

import 'package:flutter/material.dart';

import 'flex_highlight_splash.dart';

/// An enum for easy configuration and selection of ink splash effect in
/// a [FlexColorScheme.subThemes] configuration.
enum FlexSplashType {
  /// Use default Material splash effect.
  ///
  /// If [ThemeData.useMaterial3] is false the [inkSplash] effect is used.
  ///
  /// If [ThemeData.useMaterial3] is true and this is not a web build, then
  /// the [inkSparkle] effect is used, otherwise [inkRipple] is used.
  ///
  /// This logic is built into the [ThemeData] factory.
  inkDefault,

  /// The classic and default ink effect used in Material-2.
  ///
  /// A circular ink feature whose origin starts at the input touch point
  /// and whose radius expands from zero.
  inkSplash,

  /// A new faster Material-3 version of [inkSplash].
  ///
  /// By default used by Material-3 on none Android builds and also on all
  /// web builds.
  ///
  /// A circular ink feature whose origin starts at the input touch point and
  /// whose radius expands from 60% of the final radius. The splash origin
  /// animates from the center of its tap/click.
  inkRipple,

  /// Material-3 ink sparkle ripple, centered at the tap or click position
  /// relative to the tap/click.
  ///
  /// This effect relies on a shader and therefore is unsupported on the Flutter
  /// Web HTML backend.
  ///
  /// Used by default on Android builds in Material-3 mode.
  inkSparkle,

  /// A FlexColorScheme custom splash highlight effect.
  ///
  /// An immediate highlight ink feature whose origin starts at the input
  /// touch point, but expands from touch point in zero duration for an
  /// immediate highlight effect instead of animated growing ink.
  inkHighLight,
  ;

  /// Return the actual splashFactory defined by the [FlexSplashType] enum.
  ///
  /// Type [inkDefault] returns null and the type selection is handled by
  /// [ThemeData] factory defaults.
  InteractiveInkFeatureFactory? splashFactory() {
    switch (this) {
      case FlexSplashType.inkDefault:
        return null;
      case FlexSplashType.inkSplash:
        return InkRipple.splashFactory;
      case FlexSplashType.inkRipple:
        return InkRipple.splashFactory;
      case FlexSplashType.inkSparkle:
        return InkSparkle.splashFactory;
      case FlexSplashType.inkHighLight:
        return FlexHighlightSplash.splashFactory;
    }
  }
}
