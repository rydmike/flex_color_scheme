import 'dart:ui';

import 'package:flex_color_scheme/src/flex_color.dart';
import 'package:flex_color_scheme/src/flex_scheme.dart';
import 'package:flutter_test/flutter_test.dart';

//****************************************************************************
// These unit test monitors that the FlexScheme extended enum functions
// return expected values.
//****************************************************************************

void main() {
  group('FST: Test FlexScheme enum functions work as expected ', () {
    test('FST FlexScheme.material.data is FlexColor.material', () {
      expect(
        FlexScheme.material.data,
        equals(FlexColor.material),
      );
    });
    test('FST FlexScheme.material.colors light is FlexColor.material.light',
        () {
      expect(
        FlexScheme.material.colors(Brightness.light),
        equals(FlexColor.material.light),
      );
    });
    test('FST FlexScheme.material.colors dark is FlexColor.material.dark', () {
      expect(
        FlexScheme.material.colors(Brightness.dark),
        equals(FlexColor.material.dark),
      );
    });
  });
}
