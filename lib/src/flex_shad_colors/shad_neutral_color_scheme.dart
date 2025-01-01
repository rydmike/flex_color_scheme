import 'package:flutter/material.dart';

import 'shad_color_scheme.dart';

/// Shadcn based Neutral color scheme.
@immutable
class ShadNeutralColorScheme extends ShadColorScheme {
  /// Shadcn based Neutral color scheme, light.
  const ShadNeutralColorScheme.light({
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

  /// Shadcn based Neutral color scheme, dark.
  const ShadNeutralColorScheme.dark({
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

  static const Color backgroundLight = Color(0xffffffff);
  static const Color foregroundLight = Color(0xff0a0a0a);
  static const Color cardLight = Color(0xffffffff);
  static const Color cardForegroundLight = Color(0xff0a0a0a);
  static const Color popoverLight = Color(0xffffffff);
  static const Color popoverForegroundLight = Color(0xff0a0a0a);
  static const Color primaryLight = Color(0xff171717);
  static const Color primaryForegroundLight = Color(0xfffafafa);
  static const Color secondaryLight = Color(0xfff5f5f5);
  static const Color secondaryForegroundLight = Color(0xff171717);
  static const Color mutedLight = Color(0xfff5f5f5);
  static const Color mutedForegroundLight = Color(0xff737373);
  static const Color accentLight = Color(0xfff5f5f5);
  static const Color accentForegroundLight = Color(0xff171717);
  static const Color destructiveLight = Color(0xffef4444);
  static const Color destructiveForegroundLight = Color(0xfffafafa);
  static const Color borderLight = Color(0xffe5e5e5);
  static const Color inputLight = Color(0xffe5e5e5);
  static const Color ringLight = Color(0xff0a0a0a);
  static const Color selectionLight = Color(0xFFB4D7FF);

  static const Color backgroundDark = Color(0xff0a0a0a);
  static const Color foregroundDark = Color(0xfffafafa);
  static const Color cardDark = Color(0xff0a0a0a);
  static const Color cardForegroundDark = Color(0xfffafafa);
  static const Color popoverDark = Color(0xff0a0a0a);
  static const Color popoverForegroundDark = Color(0xfffafafa);
  static const Color primaryDark = Color(0xfffafafa);
  static const Color primaryForegroundDark = Color(0xff171717);
  static const Color secondaryDark = Color(0xff262626);
  static const Color secondaryForegroundDark = Color(0xfffafafa);
  static const Color mutedDark = Color(0xff262626);
  static const Color mutedForegroundDark = Color(0xffa3a3a3);
  static const Color accentDark = Color(0xff262626);
  static const Color accentForegroundDark = Color(0xfffafafa);
  static const Color destructiveDark = Color(0xff7f1d1d);
  static const Color destructiveForegroundDark = Color(0xfffafafa);
  static const Color borderDark = Color(0xff262626);
  static const Color inputDark = Color(0xff262626);
  static const Color ringDark = Color(0xffd4d4d4);
  static const Color selectionDark = Color(0xFF355172);
}
