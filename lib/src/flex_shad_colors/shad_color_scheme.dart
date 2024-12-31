import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Shadcn based color scheme.
@immutable
class ShadColorScheme with Diagnosticable {
  /// Shadcn based color scheme raw default constructor.
  ///
  /// Requires all colors.
  const ShadColorScheme({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.popover,
    required this.popoverForeground,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.selection,
  });

  // TODO(rydmike): Add toFlexSchemeColor mapping function.
  // TODO(rydmike): Add toColorScheme mapping function.
  // TODO(rydmike): To FlexColorScheme add toShadcnColorScheme mapping function.
  // TODO(rydmike): Consider best way, if at all, to use Shadcn surface colors.

  // TODO(rydmike): Add color and mapping inf comments to Material colors.
  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color popover;
  final Color popoverForeground;
  final Color primary;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;
  final Color muted;
  final Color mutedForeground;
  final Color accent;
  final Color accentForeground;
  final Color destructive;
  final Color destructiveForeground;
  final Color border;
  final Color input;
  final Color ring;
  final Color selection;

  /// Shadcn based color scheme lerp theme transition animation.
  static ShadColorScheme lerp(
    ShadColorScheme a,
    ShadColorScheme b,
    double t,
  ) {
    return ShadColorScheme(
      background: Color.lerp(a.background, b.background, t)!,
      foreground: Color.lerp(a.foreground, b.foreground, t)!,
      card: Color.lerp(a.card, b.card, t)!,
      cardForeground: Color.lerp(a.cardForeground, b.cardForeground, t)!,
      popover: Color.lerp(a.popover, b.popover, t)!,
      popoverForeground:
          Color.lerp(a.popoverForeground, b.popoverForeground, t)!,
      primary: Color.lerp(a.primary, b.primary, t)!,
      primaryForeground:
          Color.lerp(a.primaryForeground, b.primaryForeground, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      secondaryForeground:
          Color.lerp(a.secondaryForeground, b.secondaryForeground, t)!,
      muted: Color.lerp(a.muted, b.muted, t)!,
      mutedForeground: Color.lerp(a.mutedForeground, b.mutedForeground, t)!,
      accent: Color.lerp(a.accent, b.accent, t)!,
      accentForeground: Color.lerp(a.accentForeground, b.accentForeground, t)!,
      destructive: Color.lerp(a.destructive, b.destructive, t)!,
      destructiveForeground:
          Color.lerp(a.destructiveForeground, b.destructiveForeground, t)!,
      border: Color.lerp(a.border, b.border, t)!,
      input: Color.lerp(a.input, b.input, t)!,
      ring: Color.lerp(a.ring, b.ring, t)!,
      selection: Color.lerp(a.selection, b.selection, t)!,
    );
  }

  /// Shadcn based color scheme, equals operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is ShadColorScheme &&
        other.background == background &&
        other.foreground == foreground &&
        other.card == card &&
        other.cardForeground == cardForeground &&
        other.popover == popover &&
        other.popoverForeground == popoverForeground &&
        other.primary == primary &&
        other.primaryForeground == primaryForeground &&
        other.secondary == secondary &&
        other.secondaryForeground == secondaryForeground &&
        other.muted == muted &&
        other.mutedForeground == mutedForeground &&
        other.accent == accent &&
        other.accentForeground == accentForeground &&
        other.destructive == destructive &&
        other.destructiveForeground == destructiveForeground &&
        other.border == border &&
        other.input == input &&
        other.ring == ring &&
        other.selection == selection;
  }

  /// Shadcn based color scheme, hashcode.
  @override
  int get hashCode => Object.hash(
        background,
        foreground,
        card,
        cardForeground,
        popover,
        popoverForeground,
        primary,
        primaryForeground,
        secondary,
        secondaryForeground,
        muted,
        mutedForeground,
        accent,
        accentForeground,
        destructive,
        destructiveForeground,
        border,
        input,
        ring,
        selection,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('background', background));
    properties.add(ColorProperty('foreground', foreground));
    properties.add(ColorProperty('card', card));
    properties.add(ColorProperty('cardForeground', cardForeground));
    properties.add(ColorProperty('popover', popover));
    properties.add(ColorProperty('popoverForeground', popoverForeground));
    properties.add(ColorProperty('primary', primary));
    properties.add(ColorProperty('primaryForeground', primaryForeground));
    properties.add(ColorProperty('secondary', secondary));
    properties.add(ColorProperty('secondaryForeground', secondaryForeground));
    properties.add(ColorProperty('muted', muted));
    properties.add(ColorProperty('mutedForeground', mutedForeground));
    properties.add(ColorProperty('accent', accent));
    properties.add(ColorProperty('accentForeground', accentForeground));
    properties.add(ColorProperty('destructive', destructive));
    properties
        .add(ColorProperty('destructiveForeground', destructiveForeground));
    properties.add(ColorProperty('border', border));
    properties.add(ColorProperty('input', input));
    properties.add(ColorProperty('ring', ring));
    properties.add(ColorProperty('selection', selection));
  }
}
