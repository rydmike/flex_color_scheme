import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_redundant_argument_values

void main() {
  //****************************************************************************
  // FlexColorScheme unit tests.
  //
  // Basic object tests, equality, none equal, copyWith.
  //
  // Additionally testing of the .defaultError and .toDark() methods.
  //****************************************************************************
  group('FSC1: WITH FlexSchemeColor ', () {
    // m1 = Basic flex scheme color .
    const FlexSchemeColor m1 = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialLightTertiary,
      appBarColor: FlexColor.materialLightTertiary,
      error: FlexColor.materialLightError,
    );
    const FlexSchemeColor m1v = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      primaryVariant: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryVariant: FlexColor.materialLightTertiary,
      appBarColor: FlexColor.materialLightTertiary,
      error: FlexColor.materialLightError,
    );
    const FlexSchemeColor m1no = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      secondary: FlexColor.materialLightSecondary,
    );
    // m2, same definition as m1.
    const FlexSchemeColor m2 = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      tertiary: FlexColor.materialLightTertiary,
      appBarColor: FlexColor.materialLightTertiary,
      error: FlexColor.materialLightError,
    );
    // m3, different values than m1 and m2.
    const FlexSchemeColor m3 = FlexSchemeColor(
      primary: Color(0xFF342344),
      primaryContainer: Color(0xFF74578F),
      secondary: Color(0xFF274423),
      tertiary: Color(0xFF852185),
      appBarColor: Color(0xFF72AC6E),
      error: Color(0xFFC8133A),
    );
    // mFrom, create from just a primary color.
    final FlexSchemeColor mFrom = FlexSchemeColor.from(
      primary: FlexColor.materialLightPrimary,
    );
    // Identity and equality tests
    test(
        'FSC1.01a: GIVEN same FlexSchemeColor objects '
        'EXPECT them to be equal', () {
      expect(m1, equals(m1));
    });
    test(
        'FSC1.01b: GIVEN same FlexSchemeColor objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FSC1.01c: GIVEN two equal FlexSchemeColor objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
    });
    test(
        'FSC1.01c: GIVEN two equal FlexSchemeColor objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m2), true);
    });
    test(
        'FSC1.01e: GIVEN two identical FlexSchemeColor objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FSC1.01f: GIVEN a FlexSchemeColor object with container and tertiary '
        'but no variant colors defined '
        'EXPECT variant to be equal to container colors. v5.0.0 test', () {
      expect(m1.primaryVariant, equals(m1.primaryContainer));
      expect(m1.secondaryVariant, equals(m1.tertiary));
    });
    test(
        'FSC1.01g: GIVEN a FlexSchemeColor object with variant but no '
        'container colors defined '
        'EXPECT container to be equal to variant colors. v5.0.0 test', () {
      expect(m1v.primaryContainer, equals(m1v.primaryVariant));
      expect(m1v.secondaryContainer, equals(m1v.secondaryVariant));
    });
    test(
        'FSC1.01h: GIVEN a FlexSchemeColor object with no primary variant or '
        'primary container colors defined '
        'EXPECT them to be equal to be equal to primary color. v5.0.0 test',
        () {
      expect(m1no.primaryContainer, equals(m1v.primary));
      expect(m1no.primaryVariant, equals(m1v.primary));
    });
    test(
        'FSC1.01h: GIVEN a FlexSchemeColor object with no secondary variant or '
        'primary container colors defined '
        'EXPECT them to be equal to be equal to secondary color. '
        'v5.0.0 test', () {
      expect(m1no.secondaryContainer, equals(m1v.secondary));
      expect(m1no.secondaryVariant, equals(m1v.secondary));
    });
    test(
        'FSC1.02a: GIVEN none identical FlexSchemeColor objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FSC1.02b: GIVEN none identical FlexSchemeColor objects '
        'EXPECT them to be unequal with operator', () {
      expect(m1 != m3, true);
    });
    test(
        'FSC1.03: GIVEN a FlexSchemeColor object EXPECT it to be equal to '
        'an unequal object when made equal with copyWith.', () {
      expect(
        m3.copyWith(
          primary: FlexColor.materialLightPrimary,
          primaryContainer: FlexColor.materialLightPrimaryContainer,
          secondary: FlexColor.materialLightSecondary,
          secondaryContainer: FlexColor.materialLightSecondary,
          tertiary: FlexColor.materialLightTertiary,
          tertiaryContainer: FlexColor.materialLightTertiary,
          appBarColor: FlexColor.materialLightTertiary,
          error: FlexColor.materialLightError,
          primaryVariant: FlexColor.materialLightPrimaryContainer,
          secondaryVariant: FlexColor.materialLightTertiary,
        ),
        m1,
      );
    });
    test(
        'FSC1.03: GIVEN a FlexSchemeColor object EXPECT it to be unchanged '
        'after an empty copyWith().', () {
      expect(m3.copyWith(), m3);
    });
    test(
        'FSC1.04: GIVEN FlexSchemeColor.from Material default light primary '
        'color EXPECT it to be equal to manually created version with same '
        'reference colors.', () {
      expect(
          mFrom,
          const FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: Color(0xff4d00bb),
            secondary: Color(0xff5800d5),
            secondaryContainer: Color(0xff4500a7),
            tertiary: Color(0xff7d22ff),
            tertiaryContainer: Color(0xff8936ff),
            appBarColor: Color(0xff4500a7),
          ));
    });
    test(
        'FSC1.05: GIVEN a FlexSchemeColor with none null colors EXPECT '
        'its default toDark() to be equal to result from toDark(35).', () {
      expect(m1.toDark(), m1.toDark(35));
    });
    test(
        'FSC1.06: GIVEN a FlexSchemeColor object with one null value  '
        'EXPECT its toDark() to be equal to result from toDark(35).', () {
      expect(m3.toDark(), m3.toDark(35));
    });
    test(
        'FSC1.07: GIVEN a FlexSchemeColor with non null colors EXPECT its '
        'toDark(0) to be equal to original object', () {
      expect(m1, m1.toDark(0));
    });
    test(
        'FSC1.08: GIVEN a FlexSchemeColor with non null colors EXPECT its '
        'toDark(100) to be equal to FlexSchemeColor object with all '
        'white colors.', () {
      expect(
          m1.toDark(100),
          m1.copyWith(
            primary: Colors.white,
            primaryContainer: Colors.white,
            secondary: Colors.white,
            secondaryContainer: Colors.white,
            tertiary: Colors.white,
            tertiaryContainer: Colors.white,
            appBarColor: Colors.white,
            error: Colors.white,
            primaryVariant: Colors.white,
            secondaryVariant: Colors.white,
          ));
    });
    test(
        'FSC1.09: GIVEN a FlexSchemeColor with none null '
        'error color EXPECT its ".defaultError.toDark()" to be null.', () {
      expect(m1.defaultError.toDark().error, null);
    });
    test(
        'FSC1.10: GIVEN a FlexSchemeColor Material light based colors  '
        'EXPECT its toDark(40) error Color to be equal to '
        'FlexColor.materialDarkError.', () {
      // Note: This just works because it is how the Material design team
      // specified and computed the dark error color from their chosen light
      // error color used in the design guide. At the same time it verifies
      // that the here used "white blend" method is the one referred to in the
      // design guide.
      expect(m1.toDark(40).error, FlexColor.materialDarkError);
    });

    test(
        'FSC1.11: GIVEN a FlexSchemeColor.from primary and secondary '
        'EXPECT primary and secondary as given, tertiaries as secondary '
        'others computed.', () {
      expect(
          FlexSchemeColor.from(
              primary: FlexColor.materialLightPrimary,
              secondary: FlexColor.materialLightSecondary),
          const FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: Color(0xff4d00bb),
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: Color(0xff02a898),
            tertiary: FlexColor.materialLightSecondary,
            tertiaryContainer: FlexColor.materialLightSecondary,
            appBarColor: Color(0xff02a898),
          ));
    });

    // m1Full = Basic flex scheme color, with full colors .
    const FlexSchemeColor m1Full = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.blueLightSecondary,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.blueLightTertiary,
      appBarColor: FlexColor.materialLightTertiary,
      error: FlexColor.materialLightError,
    );

    test(
        'FSC1.12: GIVEN a FlexSchemeColor.effective(SchemeColors, 6) '
        'EXPECT it to be equal to SchemeColors ', () {
      expect(FlexSchemeColor.effective(m1Full, 6), m1Full);
    });

    test(
        'FSC1.13: GIVEN a FlexSchemeColor.effective(SchemeColors, 5) '
        'EXPECT equal to SchemeColors with tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 5),
        m1Full.copyWith(
          tertiaryContainer: m1Full.primary.lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.14: GIVEN a FlexSchemeColor.effective(SchemeColors, 4) '
        'EXPECT equal to SchemeColors with tertiary and tertiaryContainer '
        'computed', () {
      expect(
        FlexSchemeColor.effective(m1Full, 4),
        m1Full.copyWith(
          tertiary: m1Full.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Full.primary.lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.15: GIVEN a FlexSchemeColor.effective(SchemeColors, 3) '
        'EXPECT equal to SchemeColors with Secondary variant, tertiary and '
        'tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 3),
        m1Full.copyWith(
          secondaryContainer:
              m1Full.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          secondaryVariant:
              m1Full.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          tertiary: m1Full.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Full.primary.lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.16: GIVEN a FlexSchemeColor.effective(SchemeColors, 2) '
        'EXPECT equal to SchemeColors with primary variant, Secondary '
        'variant, tertiary and tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 2),
        m1Full.copyWith(
          primaryContainer: m1Full.primary.darken(kDarkenPrimaryContainer),
          secondaryContainer:
              m1Full.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          tertiary: m1Full.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Full.primary.lighten(kDarkenSecondaryContainer),
          primaryVariant: m1Full.primary.darken(kDarkenPrimaryContainer),
          secondaryVariant:
              m1Full.secondary.darken(kDarkenSecondaryContainerFromSecondary),
        ),
      );
    });

    test(
        'FSC1.17: GIVEN a FlexSchemeColor.effective(SchemeColors, 1) '
        'EXPECT equal to SchemeColors with primary variant, secondary, '
        'Secondary variant, tertiary and tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 1),
        m1Full.copyWith(
          primaryContainer: m1Full.primary.darken(kDarkenPrimaryContainer),
          secondary: m1Full.primary.darken(kDarkenSecondary),
          secondaryContainer: m1Full.primary.darken(kDarkenSecondaryContainer),
          tertiary: m1Full.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Full.primary.lighten(kDarkenSecondaryContainer),
          primaryVariant: m1Full.primary.darken(kDarkenPrimaryContainer),
          secondaryVariant: m1Full.primary.darken(kDarkenSecondaryContainer),
        ),
      );
    });

    const FlexSchemeColor m1Swap = FlexSchemeColor(
      primary: FlexColor.materialLightSecondary,
      primaryContainer: FlexColor.blueLightSecondary,
      secondary: FlexColor.materialLightPrimary,
      secondaryContainer: FlexColor.materialLightPrimaryContainer, // -> SecVar
      tertiary: FlexColor.materialLightTertiary, // -> primVar
      tertiaryContainer: FlexColor.blueLightTertiary,
      primaryVariant: FlexColor.materialLightTertiary,
      secondaryVariant: FlexColor.materialLightPrimaryContainer,
      appBarColor: FlexColor.materialLightTertiary,
      error: FlexColor.materialLightError,
    );

    test(
        'FSC1.18: GIVEN a FlexSchemeColor.effective(SchemeColors, 6, '
        'swapColors: true) '
        'EXPECT it equal to SchemeColor made with colors swapped. ', () {
      expect(
        FlexSchemeColor.effective(m1Full, 6, swapColors: true),
        equals(m1Swap),
      );
    });

    test(
        'FSC1.19: GIVEN a FlexSchemeColor.effective(SchemeColors, 5, '
        'swapColors: true) '
        'EXPECT equal to SchemeColor made with colors swapped and '
        'with tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 5, swapColors: true),
        m1Swap.copyWith(
          tertiaryContainer: m1Swap.primary.lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.20: GIVEN a FlexSchemeColor.effective(SchemeColors, 4, '
        'swapColors: true) '
        'EXPECT equal to SchemeColor made with colors swapped '
        'with tertiary and tertiaryContainer computed. ', () {
      expect(
        FlexSchemeColor.effective(m1Full, 4, swapColors: true),
        m1Swap.copyWith(
          tertiary: m1Swap.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Swap.primary.lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    // This test fails in version 3.0.0, fix released in 3.0.1.
    test(
        'FSC1.21: GIVEN a FlexSchemeColor.effective(SchemeColors, 3, '
        'swapColors: true) '
        'EXPECT equal to SchemeColor made with colors swapped, '
        'with Secondary variant, tertiary and tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 3, swapColors: true),
        m1Swap.copyWith(
          secondaryContainer:
              m1Swap.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          secondaryVariant:
              m1Swap.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          tertiary: m1Swap.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Swap.primary.lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.22: GIVEN a FlexSchemeColor.effective(SchemeColors, 2, '
        'swapColors: true) '
        'EXPECT equal to SchemeColor made with colors swapped, '
        'with primary variant, Secondary variant, tertiary and '
        'tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 2, swapColors: true),
        m1Swap.copyWith(
          primaryContainer: m1Swap.primary.darken(kDarkenPrimaryContainer),
          secondaryContainer:
              m1Swap.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          primaryVariant: m1Swap.primary.darken(kDarkenPrimaryContainer),
          secondaryVariant:
              m1Swap.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          tertiary: m1Swap.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Swap.primary.lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    // This test failed in version 3.0.0, fix added in release in 3.0.1
    // Test now passes.
    test(
        'FSC1.23: GIVEN a FlexSchemeColor.effective(SchemeColors, 1), '
        'swapColors: true) EXPECT it '
        'to be equal to SchemeColor made with colors swapped, '
        'with primary variant, secondary, secondary variant, tertiary and '
        'tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 1, swapColors: true),
        m1Swap.copyWith(
          primaryContainer: m1Swap.primary.darken(kDarkenPrimaryContainer),
          secondary: m1Swap.primary.darken(kDarkenSecondary),
          secondaryContainer: m1Swap.primary.darken(kDarkenSecondaryContainer),
          tertiary: m1Swap.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Swap.primary.lighten(kDarkenSecondaryContainer),
          primaryVariant: m1Swap.primary.darken(kDarkenPrimaryContainer),
          secondaryVariant: m1Swap.primary.darken(kDarkenSecondaryContainer),
        ),
      );
    });

    //**************************************************************************
    // FlexSchemeColor unit tests.
    //
    // toString and hashcode.
    //**************************************************************************

    test(
        'FSC1.24: Test toString implemented via debugFillProperties '
        'EXPECT exact print string', () {
      expect(
          m1.toString(),
          //
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexSchemeColor#00000(primary: Color(0xff6200ee), primaryContainer: Color(0xff3700b3), secondary: Color(0xff03dac6), secondaryContainer: Color(0xff03dac6), tertiary: Color(0xff018786), tertiaryContainer: Color(0xff018786), appBarColor: Color(0xff018786), error: Color(0xffb00020), primaryVariant: Color(0xff3700b3), secondaryVariant: Color(0xff018786))'));
    });
    test(
        'FSC1.25: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout string.', () {
      expect(
        m1.toStringShort(),
        equalsIgnoringHashCodes('FlexSchemeColor#00000'),
      );
    });
    test('FSC1.26: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    // This happens to be always equal now in tests, if it start failing, test
    // 28 is actually enough.
    test('FSC1.27: Test hashCode exact value.', () {
      expect(m1.hashCode, 35722478);
    });
    test('FSC1.28: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });
  });
}
