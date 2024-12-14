import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void testColorSchemeEquality(ColorScheme scheme1, ColorScheme scheme2,
    {double threshold = 0.004}) {
  expect(scheme1.primary, isSameColorAs(scheme2.primary, threshold: threshold));
  expect(scheme1.onPrimary,
      isSameColorAs(scheme2.onPrimary, threshold: threshold));
  expect(scheme1.primaryContainer,
      isSameColorAs(scheme2.primaryContainer, threshold: threshold));
  expect(scheme1.onPrimaryContainer,
      isSameColorAs(scheme2.onPrimaryContainer, threshold: threshold));
  expect(scheme1.primaryFixed,
      isSameColorAs(scheme2.primaryFixed, threshold: threshold));
  expect(scheme1.primaryFixedDim,
      isSameColorAs(scheme2.primaryFixedDim, threshold: threshold));
  expect(scheme1.onPrimaryFixed,
      isSameColorAs(scheme2.onPrimaryFixed, threshold: threshold));
  expect(scheme1.onPrimaryFixedVariant,
      isSameColorAs(scheme2.onPrimaryFixedVariant, threshold: threshold));
  expect(scheme1.secondary,
      isSameColorAs(scheme2.secondary, threshold: threshold));
  expect(scheme1.onSecondary,
      isSameColorAs(scheme2.onSecondary, threshold: threshold));
  expect(scheme1.secondaryContainer,
      isSameColorAs(scheme2.secondaryContainer, threshold: threshold));
  expect(scheme1.onSecondaryContainer,
      isSameColorAs(scheme2.onSecondaryContainer, threshold: threshold));
  expect(scheme1.secondaryFixed,
      isSameColorAs(scheme2.secondaryFixed, threshold: threshold));
  expect(scheme1.secondaryFixedDim,
      isSameColorAs(scheme2.secondaryFixedDim, threshold: threshold));
  expect(scheme1.onSecondaryFixed,
      isSameColorAs(scheme2.onSecondaryFixed, threshold: threshold));
  expect(scheme1.onSecondaryFixedVariant,
      isSameColorAs(scheme2.onSecondaryFixedVariant, threshold: threshold));
  expect(
      scheme1.tertiary, isSameColorAs(scheme2.tertiary, threshold: threshold));
  expect(scheme1.onTertiary,
      isSameColorAs(scheme2.onTertiary, threshold: threshold));
  expect(scheme1.tertiaryContainer,
      isSameColorAs(scheme2.tertiaryContainer, threshold: threshold));
  expect(scheme1.onTertiaryContainer,
      isSameColorAs(scheme2.onTertiaryContainer, threshold: threshold));
  expect(scheme1.tertiaryFixed,
      isSameColorAs(scheme2.tertiaryFixed, threshold: threshold));
  expect(scheme1.tertiaryFixedDim,
      isSameColorAs(scheme2.tertiaryFixedDim, threshold: threshold));
  expect(scheme1.onTertiaryFixed,
      isSameColorAs(scheme2.onTertiaryFixed, threshold: threshold));
  expect(scheme1.onTertiaryFixedVariant,
      isSameColorAs(scheme2.onTertiaryFixedVariant, threshold: threshold));
  expect(scheme1.error, isSameColorAs(scheme2.error, threshold: threshold));
  expect(scheme1.onError, isSameColorAs(scheme2.onError, threshold: threshold));
  expect(scheme1.errorContainer,
      isSameColorAs(scheme2.errorContainer, threshold: threshold));
  expect(scheme1.onErrorContainer,
      isSameColorAs(scheme2.onErrorContainer, threshold: threshold));
  expect(scheme1.surface, isSameColorAs(scheme2.surface, threshold: threshold));
  expect(scheme1.onSurface,
      isSameColorAs(scheme2.onSurface, threshold: threshold));
  expect(scheme1.surfaceDim,
      isSameColorAs(scheme2.surfaceDim, threshold: threshold));
  expect(scheme1.surfaceBright,
      isSameColorAs(scheme2.surfaceBright, threshold: threshold));
  expect(scheme1.surfaceContainerLowest,
      isSameColorAs(scheme2.surfaceContainerLowest, threshold: threshold));
  expect(scheme1.surfaceContainerLow,
      isSameColorAs(scheme2.surfaceContainerLow, threshold: threshold));
  expect(scheme1.surfaceContainer,
      isSameColorAs(scheme2.surfaceContainer, threshold: threshold));
  expect(scheme1.surfaceContainerHigh,
      isSameColorAs(scheme2.surfaceContainerHigh, threshold: threshold));
  expect(scheme1.surfaceContainerHighest,
      isSameColorAs(scheme2.surfaceContainerHighest, threshold: threshold));
  expect(scheme1.onSurfaceVariant,
      isSameColorAs(scheme2.onSurfaceVariant, threshold: threshold));
  expect(scheme1.outline, isSameColorAs(scheme2.outline, threshold: threshold));
  expect(scheme1.outlineVariant,
      isSameColorAs(scheme2.outlineVariant, threshold: threshold));
  expect(scheme1.shadow, isSameColorAs(scheme2.shadow, threshold: threshold));
  expect(scheme1.scrim, isSameColorAs(scheme2.scrim, threshold: threshold));
  expect(scheme1.inverseSurface,
      isSameColorAs(scheme2.inverseSurface, threshold: threshold));
  expect(scheme1.onInverseSurface,
      isSameColorAs(scheme2.onInverseSurface, threshold: threshold));
  expect(scheme1.inversePrimary,
      isSameColorAs(scheme2.inversePrimary, threshold: threshold));
  expect(scheme1.surfaceTint,
      isSameColorAs(scheme2.surfaceTint, threshold: threshold));
}
