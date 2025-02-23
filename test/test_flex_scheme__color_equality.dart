import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_test/flutter_test.dart';

void testFlexSchemeColorEquality(FlexSchemeColor scheme1, FlexSchemeColor scheme2) {
  expect(scheme1.primary, isSameColorAs(scheme2.primary));
  expect(scheme1.primaryContainer, isSameColorAs(scheme2.primaryContainer));
  expect(scheme1.primaryLightRef, scheme1.primaryLightRef != null ? isSameColorAs(scheme2.primaryLightRef!) : isNull);
  expect(scheme1.secondary, isSameColorAs(scheme2.secondary));
  expect(scheme1.secondaryContainer, isSameColorAs(scheme2.secondaryContainer));
  expect(
    scheme1.secondaryLightRef,
    scheme1.secondaryLightRef != null ? isSameColorAs(scheme2.secondaryLightRef!) : isNull,
  );
  expect(scheme1.tertiary, isSameColorAs(scheme2.tertiary));
  expect(scheme1.tertiaryContainer, isSameColorAs(scheme2.tertiaryContainer));
  expect(
    scheme1.tertiaryLightRef,
    scheme1.tertiaryLightRef != null ? isSameColorAs(scheme2.tertiaryLightRef!) : isNull,
  );
  expect(scheme1.appBarColor, scheme1.appBarColor != null ? isSameColorAs(scheme2.appBarColor!) : isNull);
  expect(scheme1.error, scheme1.error != null ? isSameColorAs(scheme2.error!) : isNull);
  expect(scheme1.errorContainer, scheme1.errorContainer != null ? isSameColorAs(scheme2.errorContainer!) : isNull);
  expect(scheme1.swapOnMaterial3, equals(scheme2.swapOnMaterial3));
}
