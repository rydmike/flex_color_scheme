import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WITH: FlexSubThemes.bottomSheetTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes BottomSheet tests
    // -------------------------------------------------------------------------
    test(
        'BottomSheet FST4.1:  GIVEN a default FlexSubTheme.bottomSheetTheme() '
        'EXPECT equal to BottomSheetThemeData() version with same values', () {
      expect(
        FlexSubThemes.bottomSheetTheme(),
        equals(
          const BottomSheetThemeData(
            elevation: 1,
            modalElevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'BottomSheet FST4.2 custom: GIVEN a custom '
        'FlexSubTheme.bottomSheetTheme() '
        'EXPECT equal to BottomSheetThemeData() version with same values', () {
      expect(
        FlexSubThemes.bottomSheetTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          modalElevation: 4,
          radius: 5,
        ),
        equals(
          const BottomSheetThemeData(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            modalElevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
        ),
      );
    });
  });
}
