import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// The Shadcn features are still beta nd not included in test coverage.
// coverage:ignore-file

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

  /// The [background] color corresponds to [ColorScheme.surface].
  final Color background;

  /// The [foreground] color corresponds to [ColorScheme.onSurface].
  final Color foreground;

  /// The [card] color corresponds to [ColorScheme.surfaceContainerLow].
  final Color card;

  /// The [card] color corresponds to [ColorScheme.onSurface].
  final Color cardForeground;

  /// The [popover] color corresponds to [ColorScheme.surfaceContainerLowest].
  final Color popover;

  /// The [popoverForeground] color corresponds to [ColorScheme.onSurface].
  final Color popoverForeground;

  /// The [primary] color corresponds to [ColorScheme.primary].
  final Color primary;

  /// The [primaryForeground] color corresponds to [ColorScheme.onPrimary].
  final Color primaryForeground;

  /// The [secondary] color corresponds to [ColorScheme.secondary].
  final Color secondary;

  /// The [secondaryForeground] color corresponds to [ColorScheme.onSecondary].
  final Color secondaryForeground;

  /// The [muted] color corresponds to [ColorScheme.surfaceContainerHigh].
  final Color muted;

  /// The [mutedForeground] color corresponds to [ColorScheme.onSurfaceVariant].
  final Color mutedForeground;

  /// The [accent] color corresponds to [ColorScheme.tertiary].
  final Color accent;

  /// The [accentForeground] color corresponds to [ColorScheme.onTertiary].
  final Color accentForeground;

  /// The [destructive] color corresponds to [ColorScheme.error].
  final Color destructive;

  /// The [destructiveForeground] color corresponds to [ColorScheme.onError].
  final Color destructiveForeground;

  /// The [border] color corresponds to [ColorScheme.outlineVariant].
  final Color border;

  /// Used as border on Shad outlined button, select outline, Switch unselected
  /// track color. The unselected switch track color is
  /// [ColorScheme.surfaceContainerHighest] in Material, we can potentially also
  /// use it to map this color.
  final Color input;

  /// This is only used as focused or secondary focused border around input.
  ///
  /// There is no direct suitable mapping in Material [ColorScheme]. Material
  /// uses [primary]. We can get the same result if we use the color
  /// directly in input decoration theme.
  final Color ring;

  /// Used for text selection and selection control colors on mobile.
  ///
  /// In Material text selection defaults to [primary] with 50% opacity.
  /// The way to get this color into Material is to set its text selection
  /// theme, but there is no fitting place for it in the [ColorScheme].
  final Color selection;

  // TODO(rydmike): Add toFlexSchemeColor mapping function.

  /// The toFlexSchemeColor function converts this Shadcn color scheme to a
  /// FlexSchemeColor. This is useful when you want to use a Shadcn colorscheme.
  ///
  /// It uses th above defined mappings.
  ///
  // FlexSchemeColor toFlexSchemeColor(Brightness brightness) {
  //   return FlexSchemeColor.from(
  //     primary: primary,
  //     secondary: secondary,
  //     tertiary: accent,
  //     error: destructive,
  //     brightness: brightness,
  //   );
  // }

  // TODO(rydmike): Add toColorScheme mapping function.
  // TODO(rydmike): To FlexColorScheme add toShadcnColorScheme mapping function.
  // TODO(rydmike): How to use shadcn surface colors? Add to FlexSchemeColor?

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
