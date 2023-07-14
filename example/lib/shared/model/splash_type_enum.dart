// ignore_for_file: comment_references

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// An enum for easy configuration and selection of ink splash effect in
/// a [FlexColorScheme.subThemes] configuration.
enum SplashTypeEnum {
  /// Use default Material splash effect.
  ///
  /// If [ThemeData.useMaterial3] is false the [inkSplash] effect is used.
  ///
  /// If [ThemeData.useMaterial3] is true and this is not a web build, then
  /// the [inkSparkle] effect is used, otherwise [inkRipple] is used.
  ///
  /// This logic is built into the [ThemeData] factory.
  defaultSplash(
    label: 'DefaultSplash',
    describe: 'In Material-2 the InkSplash effect is used. In Material-3 '
        'on Android platform, the InkSparkle effect is used, but on any other '
        'platform or web, the InkRipple effect is used in Material-3 mode.\n',
    code: 'FlexSplashType.defaultSplash',
    icon: Icons.touch_app,
  ),

  /// The classic and default ink effect used in Material-2.
  ///
  /// A circular ink feature whose origin starts at the input touch point
  /// and whose radius expands from zero.
  inkSplash(
    label: 'InkSplash',
    describe: 'The classic and default ink effect used in Material-2. '
        'A circular ink feature that starts at the touch point '
        'and radius expands from zero.\n',
    code: 'FlexSplashType.inkSplash',
    icon: Icons.blur_on_outlined,
  ),

  /// A new faster Material-3 version of [inkSplash].
  ///
  /// By default used by Material-3 on none Android builds and also on all
  /// web builds.
  ///
  /// A circular ink feature whose origin starts at the input touch point and
  /// whose radius expands from 60% of the final radius. The splash origin
  /// animates from the center of its tap/click.
  inkRipple(
    label: 'InkRipple',
    describe: 'A new faster Material-3 version of InkSplash. This is default '
        'in Material-3 on none Android builds and also on M3 web builds. '
        'It uses a circular ink feature that starts at the input touch '
        'point and radius that expands from 60% of the final radius.\n',
    code: 'FlexSplashType.inkRipple',
    icon: Icons.blur_circular,
  ),

  /// Material-3 ink sparkle ripple, starts from tap position.
  ///
  /// This effect relies on a shader and therefore is unsupported on the Flutter
  /// Web HTML backend. If used and the app is built for web, the used
  /// ink will be [inkRipple].
  ///
  /// Used by default on Android builds in Material-3 mode.
  inkSparkle(
    label: 'InkSparkle',
    describe: 'Material-3 ink sparkling glitter ripple, starts from tap '
        'position. Used by default on Android builds in Material-3 mode. '
        'This effect relies on a shader and is not available on Flutter '
        'Web builds. If selected and the app is built for web, the used '
        'ink will be InkRipple in M3 mode and InkSplash in M2 mode.\n',
    code: 'FlexSplashType.inkSparkle',
    icon: Icons.auto_awesome_outlined,
  ),

  /// Removes the ink splash effect.
  ///
  /// Use [noSplash] to totally defeat all ink splashes. Only the
  /// pressed highlight remains, which is usually quite subtle due to
  /// the typically used highlight color.
  ///
  /// For a more prominent immediate click splash, use [inkHighLight] that
  /// utilizes the splash color as an immediate ink.
  noSplash(
    label: 'NoSplash',
    describe: 'Removes the ink splash effect. Use this to defeat all '
        'ink splashes. Only the pressed highlight remains, which is usually '
        'subtle due to used highlight color. For a more prominent immediate '
        'click splash, use InstantSplash that utilizes the splash color as '
        'an immediate ink highlight effect.\n',
    code: 'FlexSplashType.noSplash',
    icon: Icons.blur_off_outlined,
  ),

  /// A custom immediate ink splash effect.
  ///
  /// Uses an immediate highlight ink feature whose origin starts at the input
  /// touch point and expands from touch point with zero duration, for an
  /// immediate splash effect, instead of animated splash color based ink.
  instantSplash(
    label: 'InstantSplash',
    describe: 'A custom immediate ink splash effect. Uses an immediate '
        'highlight ink splash color feature whose origin starts at the '
        'input touch point and expands from touch point using ZERO duration. '
        'This creates an immediate splash effect, instead of an animated '
        'growing splash color based ink. Use this option for a more prominent '
        'click highlight than NoSplash.\n',
    code: 'FlexSplashType.instantSplash',
    icon: Icons.brightness_1,
  ),
  ;

  const SplashTypeEnum({
    required this.label,
    required this.describe,
    required this.code,
    required this.icon,
  });

  final String label;
  final String describe;
  final String code;
  final IconData icon;

  /// Return the [FlexSplashType] defined by the [SplashTypeEnum] enum.
  ///
  /// An optional [useMockWeb] can be given to mock the used web platform to
  /// simulate web usage on none web platform, but none web platform result
  /// cannot be simulated on web.
  FlexSplashType setting([bool? useMockWeb, bool useMaterial3 = false]) {
    switch (this) {
      case SplashTypeEnum.defaultSplash:
        return (useMockWeb ?? false) || kIsWeb
            ? useMaterial3
                ? FlexSplashType.inkRipple
                : FlexSplashType.inkSplash
            : FlexSplashType.defaultSplash;
      case SplashTypeEnum.inkSplash:
        return FlexSplashType.inkSplash;
      case SplashTypeEnum.inkRipple:
        return FlexSplashType.inkRipple;
      case SplashTypeEnum.inkSparkle:
        return (useMockWeb ?? false) || kIsWeb
            ? useMaterial3
                ? FlexSplashType.inkRipple
                : FlexSplashType.inkSplash
            : FlexSplashType.inkSparkle;
      case SplashTypeEnum.noSplash:
        return FlexSplashType.noSplash;
      case SplashTypeEnum.instantSplash:
        return FlexSplashType.instantSplash;
    }
  }
}
