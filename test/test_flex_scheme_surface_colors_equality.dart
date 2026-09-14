import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_test/flutter_test.dart';

void testFlexSchemeSurfaceColorsEquality(
  FlexSchemeSurfaceColors scheme1,
  FlexSchemeSurfaceColors scheme2, {
  double threshold = 0.004,
}) {
  expect(scheme1.surface, isSameColorAs(scheme2.surface, threshold: threshold));
  expect(scheme1.surfaceDim, isSameColorAs(scheme2.surfaceDim, threshold: threshold));
  expect(scheme1.surfaceBright, isSameColorAs(scheme2.surfaceBright, threshold: threshold));
  expect(scheme1.surfaceContainerLowest, isSameColorAs(scheme2.surfaceContainerLowest, threshold: threshold));
  expect(scheme1.surfaceContainerLow, isSameColorAs(scheme2.surfaceContainerLow, threshold: threshold));
  expect(scheme1.surfaceContainer, isSameColorAs(scheme2.surfaceContainer, threshold: threshold));
  expect(scheme1.surfaceContainerHigh, isSameColorAs(scheme2.surfaceContainerHigh, threshold: threshold));
  expect(scheme1.surfaceContainerHighest, isSameColorAs(scheme2.surfaceContainerHighest, threshold: threshold));
  expect(scheme1.inverseSurface, isSameColorAs(scheme2.inverseSurface, threshold: threshold));
  expect(scheme1.scaffoldBackground, isSameColorAs(scheme2.scaffoldBackground, threshold: threshold));
  expect(scheme1.dialogBackground, isSameColorAs(scheme2.dialogBackground, threshold: threshold));
}
