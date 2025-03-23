import 'package:flutter/material.dart';

import 'shad_color_scheme.dart';

// The Shadcn features are still beta nd not included in test coverage.
// coverage:ignore-file

/// Shadcn based Stone color scheme.
@immutable
class ShadStoneColorScheme extends ShadColorScheme {
  /// Shadcn based Stone color scheme, light.
  const ShadStoneColorScheme.light({
    super.background = backgroundLight,
    super.foreground = foregroundLight,
    super.card = cardLight,
    super.cardForeground = cardForegroundLight,
    super.popover = popoverLight,
    super.popoverForeground = popoverForegroundLight,
    super.primary = primaryLight,
    super.primaryForeground = primaryForegroundLight,
    super.secondary = secondaryLight,
    super.secondaryForeground = secondaryForegroundLight,
    super.muted = mutedLight,
    super.mutedForeground = mutedForegroundLight,
    super.accent = accentLight,
    super.accentForeground = accentForegroundLight,
    super.destructive = destructiveLight,
    super.destructiveForeground = destructiveForegroundLight,
    super.border = borderLight,
    super.input = inputLight,
    super.ring = ringLight,
    super.selection = selectionLight,
  });

  /// Shadcn based Stone color scheme, dark.
  const ShadStoneColorScheme.dark({
    super.background = backgroundDark,
    super.foreground = foregroundDark,
    super.card = cardDark,
    super.cardForeground = cardForegroundDark,
    super.popover = popoverDark,
    super.popoverForeground = popoverForegroundDark,
    super.primary = primaryDark,
    super.primaryForeground = primaryForegroundDark,
    super.secondary = secondaryDark,
    super.secondaryForeground = secondaryForegroundDark,
    super.muted = mutedDark,
    super.mutedForeground = mutedForegroundDark,
    super.accent = accentDark,
    super.accentForeground = accentForegroundDark,
    super.destructive = destructiveDark,
    super.destructiveForeground = destructiveForegroundDark,
    super.border = borderDark,
    super.input = inputDark,
    super.ring = ringDark,
    super.selection = selectionDark,
  });

  /// The background color in light theme.
  static const Color backgroundLight = Color(0xffffffff);

  /// The foreground color in light theme.
  static const Color foregroundLight = Color(0xff0c0a09);

  /// The card color in light theme.
  static const Color cardLight = Color(0xffffffff);

  /// The card foreground color in light theme.
  static const Color cardForegroundLight = Color(0xff0c0a09);

  /// The popover color in light theme.
  static const Color popoverLight = Color(0xffffffff);

  /// The popover foreground color in light theme.
  static const Color popoverForegroundLight = Color(0xff0c0a09);

  /// The primary color in light theme.
  static const Color primaryLight = Color(0xff1c1917);

  /// The primary foreground color in light theme.
  static const Color primaryForegroundLight = Color(0xfffafaf9);

  /// The secondary color in light theme.
  static const Color secondaryLight = Color(0xfff5f5f4);

  /// The secondary foreground color in light theme.
  static const Color secondaryForegroundLight = Color(0xff1c1917);

  /// The muted color in light theme.
  static const Color mutedLight = Color(0xfff5f5f4);

  /// The muted foreground color in light theme.
  static const Color mutedForegroundLight = Color(0xff78716c);

  /// The accent color in light theme.
  static const Color accentLight = Color(0xfff5f5f4);

  /// The accent foreground color in light theme.
  static const Color accentForegroundLight = Color(0xff1c1917);

  /// The destructive color in light theme.
  static const Color destructiveLight = Color(0xffef4444);

  /// The destructive foreground color in light theme.
  static const Color destructiveForegroundLight = Color(0xfffafaf9);

  /// The border color in light theme.
  static const Color borderLight = Color(0xffe7e5e4);

  /// The input color in light theme.
  static const Color inputLight = Color(0xffe7e5e4);

  /// The ring color in light theme.
  static const Color ringLight = Color(0xff0c0a09);

  /// The selection color in light theme.
  static const Color selectionLight = Color(0xFFB4D7FF);

  /// The background color in dark theme.
  static const Color backgroundDark = Color(0xff0c0a09);

  /// The foreground color in dark theme.
  static const Color foregroundDark = Color(0xfffafaf9);

  /// The card color in dark theme.
  static const Color cardDark = Color(0xff0c0a09);

  /// The card foreground color in dark theme.
  static const Color cardForegroundDark = Color(0xfffafaf9);

  /// The popover color in dark theme.
  static const Color popoverDark = Color(0xff0c0a09);

  /// The popover foreground color in dark theme.
  static const Color popoverForegroundDark = Color(0xfffafaf9);

  /// The primary color in dark theme.
  static const Color primaryDark = Color(0xfffafaf9);

  /// The primary foreground color in dark theme.
  static const Color primaryForegroundDark = Color(0xff1c1917);

  /// The secondary color in dark theme.
  static const Color secondaryDark = Color(0xff292524);

  /// The secondary foreground color in dark theme.
  static const Color secondaryForegroundDark = Color(0xfffafaf9);

  /// The muted color in dark theme.
  static const Color mutedDark = Color(0xff292524);

  /// The muted foreground color in dark theme.
  static const Color mutedForegroundDark = Color(0xffa8a29e);

  /// The accent color in dark theme.
  static const Color accentDark = Color(0xff292524);

  /// The accent foreground color in dark theme.
  static const Color accentForegroundDark = Color(0xfffafaf9);

  /// The destructive color in dark theme.
  static const Color destructiveDark = Color(0xff7f1d1d);

  /// The destructive foreground color in dark theme.
  static const Color destructiveForegroundDark = Color(0xfffafaf9);

  /// The border color in dark theme.
  static const Color borderDark = Color(0xff292524);

  /// The input color in dark theme.
  static const Color inputDark = Color(0xff292524);

  /// The ring color in dark theme.
  static const Color ringDark = Color(0xffd6d3d1);

  /// The selection color in dark theme.
  static const Color selectionDark = Color(0xFF355172);
}
