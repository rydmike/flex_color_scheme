// ignore_for_file: comment_references

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_instant_splash.dart';

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
  defaultSplash,

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

  /// Material-3 ink sparkle ripple, starts from tap position.
  ///
  /// This effect relies on a shader and therefore is unsupported on the Flutter
  /// Web HTML backend. If used and the app is built for web, the used
  /// ink will be [inkRipple].
  ///
  /// Used by default on Android builds in Material-3 mode.
  inkSparkle,

  /// Removes the ink splash effect.
  ///
  /// Use [noSplash] to totally defeat all ink splashes. Only the
  /// pressed highlight remains, which is usually quite subtle due to
  /// the typically used highlight color.
  ///
  /// For a more prominent immediate click splash, use [instantSplash] that
  /// utilizes the splash color as an immediate ink.
  noSplash,

  /// A custom immediate ink splash effect.
  ///
  /// Uses an immediate highlight ink feature whose origin starts at the input
  /// touch point and expands from touch point with zero duration, for an
  /// immediate splash effect, instead of animated splash color based ink.
  instantSplash;

  /// Return the actual splashFactory defined by the [FlexSplashType] enum.
  ///
  /// Type [defaultSplash] returns null the type selection should be handled
  /// by [ThemeData] factory defaults or caller.
  InteractiveInkFeatureFactory? splashFactory(
      [bool useMaterial3 = true, bool mockIsWeb = false]) {
    switch (this) {
      case FlexSplashType.defaultSplash:
        return null;
      case FlexSplashType.inkSplash:
        return InkSplash.splashFactory;
      case FlexSplashType.inkRipple:
        return InkRipple.splashFactory;
      case FlexSplashType.inkSparkle:
        return kIsWeb || mockIsWeb
            ? useMaterial3
                ? InkRipple.splashFactory
                : InkSplash.splashFactory
            : InkSparkle.splashFactory;
      case FlexSplashType.noSplash:
        return NoSplash.splashFactory;
      case FlexSplashType.instantSplash:
        return FlexInstantSplash.splashFactory;
    }
  }
}
