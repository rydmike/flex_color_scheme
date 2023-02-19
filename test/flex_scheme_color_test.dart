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
      // primaryVariant: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      // secondaryVariant: FlexColor.materialLightTertiary,
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
      secondaryContainer: Color(0xFF55BA46),
      tertiary: Color(0xFF852185),
      tertiaryContainer: Color(0xFF630D63),
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
        'FSC1.01g: GIVEN a FlexSchemeColor object with primary but no '
        'container colors defined '
        'EXPECT container to be equal to primary colors.', () {
      expect(m1v.primaryContainer, equals(m1v.primary));
      expect(m1v.secondaryContainer, equals(m1v.secondary));
    });
    test(
        'FSC1.01h: GIVEN a FlexSchemeColor object with no secondary container '
        'or primary container colors defined '
        'EXPECT equal to be equal to secondary and primary color. ', () {
      expect(m1no.secondaryContainer, equals(m1v.secondary));
      expect(m1no.primaryContainer, equals(m1v.primary));
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
            primary: Color(0xff6200ee),
            primaryContainer: Color(0xff4d00bb),
            secondary: Color(0xff5800d5),
            secondaryContainer: Color(0xff4500a7),
            tertiary: Color(0xff7d22ff),
            tertiaryContainer: Color(0xffa561ff),
            appBarColor: Color(0xff7d22ff),
          ));
    });
    test(
        'FSC1.05: GIVEN a FlexSchemeColor with none null colors EXPECT '
        'its default toDark() to be equal to result from toDark(35).', () {
      expect(m1.toDark(), m1.toDark(35));
    });
    test(
        'FSC1.05-swap: GIVEN a FlexSchemeColor with none null colors EXPECT '
        'its default toDark() to be equal to result from toDark(35).', () {
      expect(
        m1
            .copyWith(
              primary: m1.primaryContainer,
              primaryContainer: m1.primary,
              secondary: m1.secondaryContainer,
              secondaryContainer: m1.secondary,
              tertiary: m1.tertiaryContainer,
              tertiaryContainer: m1.tertiary,
            )
            .toDark(),
        m1.toDark(35, true),
      );
    });
    test(
        'FSC1.06: GIVEN a FlexSchemeColor object with one null value  '
        'EXPECT its toDark() to be equal to result from toDark(35) '
        'and swap = false.', () {
      expect(m3.toDark(), m3.toDark(35, false));
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
          m1.copyWith(errorContainer: Colors.black).toDark(100),
          m1.copyWith(
            primary: Colors.white,
            primaryContainer: Colors.white,
            secondary: Colors.white,
            secondaryContainer: Colors.white,
            tertiary: Colors.white,
            tertiaryContainer: Colors.white,
            appBarColor: Colors.white,
            error: Colors.white,
            errorContainer: Colors.white,
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
        'FSC1.11a: GIVEN a FlexSchemeColor.from primary and secondary '
        'EXPECT primary and secondary as given, others computed.', () {
      expect(
          FlexSchemeColor.from(
            primary: FlexColor.materialLightPrimary,
            secondary: FlexColor.materialLightSecondary,
          ),
          const FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: Color(0xff4d00bb),
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: Color(0xff02a898),
            tertiary: Color(0xff7d22ff),
            tertiaryContainer: Color(0xffa561ff),
            appBarColor: Color(0xff14fce6),
            error: null,
            errorContainer: null,
          ));
    });

    test(
        'FSC1.11b: GIVEN a FlexSchemeColor.from primary,secondary and tertiary '
        'EXPECT primary, secondary and tertiary given, others computed.', () {
      expect(
          FlexSchemeColor.from(
            primary: FlexColor.materialLightPrimary,
            secondary: FlexColor.materialLightSecondary,
            tertiary: FlexColor.materialLightTertiary,
          ),
          const FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: Color(0xff4d00bb),
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: Color(0xff02a898),
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: Color(0xff02cecc),
            appBarColor: FlexColor.materialLightTertiary,
            error: null,
            errorContainer: null,
          ));
    });

    test(
        'FSC1.11-light-1: GIVEN a FlexSchemeColor.from primary '
        'for M3 style (bright) '
        'EXPECT primary as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: const Color(0xffd7bbff),
            secondary: const Color(0xff8033ee),
            secondaryContainer: const Color(0xffccadf8),
            tertiary: const Color(0xff8826ff),
            tertiaryContainer: const Color(0xffe5d1ff),
            appBarColor: const Color(0xffe5d1ff),
            error: FlexColor.materialLightError,
            errorContainer:
                FlexColor.lightErrorContainer(FlexColor.materialLightError),
          ));
    });

    test(
        'FSC1.11-light-2: GIVEN a FlexSchemeColor.from primary and secondary '
        'for M3 style (bright) '
        'EXPECT primary and secondary as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            secondary: FlexColor.materialLightSecondary,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: const Color(0xffd7bbff),
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: const Color(0xff92fef4),
            tertiary: const Color(0xff8826ff),
            tertiaryContainer: const Color(0xffe5d1ff),
            appBarColor: const Color(0xffe5d1ff),
            error: FlexColor.materialLightError,
            errorContainer:
                FlexColor.lightErrorContainer(FlexColor.materialLightError),
          ));
    });

    test(
        'FSC1.11-light-3: GIVEN a FlexSchemeColor.from primary, secondary '
        'and primaryContainer for M3 style (bright) '
        'EXPECT them as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: const Color(0xff92fef4),
            tertiary: const Color(0xff8826ff),
            tertiaryContainer: const Color(0xffe5d1ff),
            appBarColor: const Color(0xffe5d1ff),
            error: FlexColor.materialLightError,
            errorContainer:
                FlexColor.lightErrorContainer(FlexColor.materialLightError),
          ));
    });

    test(
        'FSC1.11-light-4: GIVEN a FlexSchemeColor.from primary, secondary '
        'and primaryContainer + secondaryContainer for M3 style (bright) '
        'EXPECT them as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: const Color(0xff8826ff),
            tertiaryContainer: const Color(0xffe5d1ff),
            appBarColor: const Color(0xffe5d1ff),
            error: FlexColor.materialLightError,
            errorContainer:
                FlexColor.lightErrorContainer(FlexColor.materialLightError),
          ));
    });

    test(
        'FSC1.11-light-5: GIVEN a FlexSchemeColor.from primary, secondary, '
        'primaryContainer, secondaryContainer and tertiary for M3 style '
        '(bright) '
        'EXPECT them as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: FlexColor.materialLightTertiary,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: const Color(0xff96d9d9),
            appBarColor: FlexColor.materialLightTertiary,
            error: FlexColor.materialLightError,
            errorContainer:
                FlexColor.lightErrorContainer(FlexColor.materialLightError),
          ));
    });

    test(
        'FSC1.11-light-6: GIVEN a FlexSchemeColor.from all mains for M3 style '
        '(bright) '
        'EXPECT them as given.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
            appBarColor: FlexColor.materialLightTertiary,
            error: FlexColor.materialLightError,
            errorContainer:
                FlexColor.lightErrorContainer(FlexColor.materialLightError),
          ));
    });

    test(
        'FSC1.11-light-6-ab: GIVEN a FlexSchemeColor.from all mains + an '
        'AppBar color for M3 style (bright) '
        'EXPECT them as given also AppBar.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.light,
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
            appBarColor: Colors.white,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialLightPrimary,
            primaryContainer: FlexColor.materialLightPrimaryContainer,
            secondary: FlexColor.materialLightSecondary,
            secondaryContainer: FlexColor.materialLightSecondaryContainer,
            tertiary: FlexColor.materialLightTertiary,
            tertiaryContainer: FlexColor.materialLightTertiaryContainer,
            appBarColor: Colors.white,
            error: FlexColor.materialLightError,
            errorContainer:
                FlexColor.lightErrorContainer(FlexColor.materialLightError),
          ));
    });

    test(
        'FSC1.11-dark-1: GIVEN a FlexSchemeColor.from primary  '
        'for M3 style (dark) '
        'EXPECT primary as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: const Color(0xff4e3171),
            secondary: const Color(0xffd287ff),
            secondaryContainer: const Color(0xff7e5199),
            tertiary: const Color(0xffe1acff),
            tertiaryContainer: const Color(0xff8331b3),
            appBarColor: const Color(0xff8331b3),
            error: FlexColor.materialDarkError,
            errorContainer:
                FlexColor.darkErrorContainer(FlexColor.materialDarkError),
          ));
    });

    test(
        'FSC1.11-dark-2: GIVEN a FlexSchemeColor.from primary and secondary '
        'for M3 style (dark) '
        'EXPECT them as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            secondary: FlexColor.materialDarkSecondary,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: const Color(0xff4e3171),
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: const Color(0xff002e2a),
            tertiary: const Color(0xffe1acff),
            tertiaryContainer: const Color(0xff8331b3),
            appBarColor: const Color(0xff8331b3),
            error: FlexColor.materialDarkError,
            errorContainer:
                FlexColor.darkErrorContainer(FlexColor.materialDarkError),
            // primaryVariant: const Color(0xff4a3564),
            // secondaryVariant: const Color(0xffe1acff),
          ));
    });

    test(
        'FSC1.11-dark-3: GIVEN a FlexSchemeColor.from primary and secondary '
        'plus primaryContainer for M3 style (dark) '
        'EXPECT them as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: const Color(0xff002e2a),
            tertiary: const Color(0xffe1acff),
            tertiaryContainer: const Color(0xff8331b3),
            appBarColor: const Color(0xff8331b3),
            error: FlexColor.materialDarkError,
            errorContainer:
                FlexColor.darkErrorContainer(FlexColor.materialDarkError),
          ));
    });

    test(
        'FSC1.11-dark-4: GIVEN a FlexSchemeColor.from primary and secondary '
        'plus primaryContainer and secondaryContainer for M3 style (dark) '
        'EXPECT them as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: const Color(0xffe1acff),
            tertiaryContainer: const Color(0xff8331b3),
            appBarColor: const Color(0xff8331b3),
            error: FlexColor.materialDarkError,
            errorContainer:
                FlexColor.darkErrorContainer(FlexColor.materialDarkError),
          ));
    });

    test(
        'FSC1.11-dark-5: GIVEN a FlexSchemeColor.from primary, secondary, '
        'primaryContainer, secondaryContainer and tertiary for M3 style (dark) '
        'EXPECT them as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: const Color(0xff003933),
            appBarColor: FlexColor.materialDarkTertiary,
            error: FlexColor.materialDarkError,
            errorContainer:
                FlexColor.darkErrorContainer(FlexColor.materialDarkError),
          ));
    });

    test(
        'FSC1.11-dark-6: GIVEN a FlexSchemeColor.from all mains for M3 '
        'style (dark) '
        'EXPECT them as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            appBarColor: FlexColor.materialDarkTertiary,
            error: FlexColor.materialDarkError,
            errorContainer:
                FlexColor.darkErrorContainer(FlexColor.materialDarkError),
          ));
    });

    test(
        'FSC1.11-dark-6-ab: GIVEN a FlexSchemeColor.from all mains and given '
        'AppBar for M3 style (dark) '
        'EXPECT them as given, others M3 computed.', () {
      expect(
          FlexSchemeColor.from(
            brightness: Brightness.dark,
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            appBarColor: Colors.black,
          ),
          FlexSchemeColor(
            primary: FlexColor.materialDarkPrimary,
            primaryContainer: FlexColor.materialDarkPrimaryContainer,
            secondary: FlexColor.materialDarkSecondary,
            secondaryContainer: FlexColor.materialDarkSecondaryContainer,
            tertiary: FlexColor.materialDarkTertiary,
            tertiaryContainer: FlexColor.materialDarkTertiaryContainer,
            appBarColor: Colors.black,
            error: FlexColor.materialDarkError,
            errorContainer:
                FlexColor.darkErrorContainer(FlexColor.materialDarkError),
          ));
    });

    // m1Full = Basic flex scheme color, with full colors .
    final FlexSchemeColor m1Full = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer,
      secondary: FlexColor.materialLightSecondary,
      secondaryContainer: FlexColor.blueLightSecondaryContainer,
      tertiary: FlexColor.materialLightTertiary,
      tertiaryContainer: FlexColor.blueLightTertiaryContainer,
      appBarColor: Colors.white,
      error: FlexColor.materialLightError,
      errorContainer:
          FlexColor.lightErrorContainer(FlexColor.materialLightError),
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
          tertiaryContainer: m1Full.tertiary.lighten(kDarkenSecondaryContainer),
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
          tertiaryContainer: m1Full.primary
              .brighten(kDarkenSecondary * 2)
              .lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.15: GIVEN a FlexSchemeColor.effective(SchemeColors, 3) '
        'EXPECT equal to SchemeColors with Secondary container, tertiary and '
        'tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 3),
        m1Full.copyWith(
          secondaryContainer:
              m1Full.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          tertiary: m1Full.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Full.primary
              .brighten(kDarkenSecondary * 2)
              .lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.16: GIVEN a FlexSchemeColor.effective(SchemeColors, 2) '
        'EXPECT equal to SchemeColors with primary container, Secondary '
        'container, tertiary and tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 2),
        m1Full.copyWith(
          primaryContainer: m1Full.primary.darken(kDarkenPrimaryContainer),
          secondaryContainer:
              m1Full.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          tertiary: m1Full.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Full.primary
              .brighten(kDarkenSecondary * 2)
              .lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.17: GIVEN a FlexSchemeColor.effective(SchemeColors, 1) '
        'EXPECT equal to SchemeColors with primary container, secondary, '
        'Secondary container, tertiary and tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 1),
        m1Full.copyWith(
          primaryContainer: m1Full.primary.darken(kDarkenPrimaryContainer),
          secondary: m1Full.primary.darken(kDarkenSecondary),
          secondaryContainer: m1Full.primary.darken(kDarkenSecondaryContainer),
          tertiary: m1Full.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Full.primary
              .brighten(kDarkenSecondary * 2)
              .lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.17-7: GIVEN a FlexSchemeColor.effective(SchemeColors, 7) '
        'EXPECT equal to SchemeColors with primary container, '
        'Secondary container and tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 7),
        m1Full.copyWith(
          primaryContainer: m1Full.primary.darken(kDarkenPrimaryContainer),
          secondaryContainer:
              m1Full.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          tertiaryContainer: m1Full.tertiary.lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.18: GIVEN a FlexSchemeColor.effective(SchemeColors, 6) '
        'with brightness:light for M3 like scheme '
        'EXPECT it to be equal to SchemeColors ', () {
      expect(
        FlexSchemeColor.effective(m1Full, 6, brightness: Brightness.light),
        m1Full,
      );
    });

    test(
        'FSC1.19: GIVEN a FlexSchemeColor.effective(SchemeColors, 5) '
        'with brightness:light for M3 like scheme '
        'EXPECT equal to SchemeColors with tertiaryContainer M3 computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 5, brightness: Brightness.light),
        m1Full.copyWith(
            tertiaryContainer:
                m1Full.tertiary.brighten(18).blend(Colors.white, 50)),
      );
    });

    test(
        'FSC1.20: GIVEN a FlexSchemeColor.effective(SchemeColors, 4) '
        'with brightness:light for M3 like scheme '
        'EXPECT equal to SchemeColors with tertiary and tertiaryContainer '
        'M3 computed', () {
      expect(
        FlexSchemeColor.effective(m1Full, 4, brightness: Brightness.light),
        m1Full.copyWith(
          tertiary: m1Full.primary.brighten(15),
          tertiaryContainer:
              m1Full.primary.brighten(15).lighten(20).blend(Colors.white, 60),
        ),
      );
    });

    test(
        'FSC1.21: GIVEN a FlexSchemeColor.effective(SchemeColors, 3) '
        'with brightness:light for M3 like scheme '
        'EXPECT equal to SchemeColors with Secondary container, tertiary and '
        'tertiaryContainer M3 computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 3, brightness: Brightness.light),
        m1Full.copyWith(
          secondaryContainer:
              m1Full.secondary.brighten(14).blend(Colors.white, 50),
          tertiary: m1Full.primary.brighten(15),
          tertiaryContainer:
              m1Full.primary.brighten(15).lighten(20).blend(Colors.white, 60),
        ),
      );
    });

    test(
        'FSC1.22: GIVEN a FlexSchemeColor.effective(SchemeColors, 2) '
        'with brightness:light for M3 like scheme '
        'EXPECT equal to SchemeColors with primary container, Secondary '
        'container, tertiary and tertiaryContainer M3 computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 2, brightness: Brightness.light),
        m1Full.copyWith(
          primaryContainer: m1Full.primary.lighten(20).blend(Colors.white, 60),
          secondaryContainer:
              m1Full.secondary.brighten(14).blend(Colors.white, 50),
          tertiary: m1Full.primary.brighten(15),
          tertiaryContainer:
              m1Full.primary.brighten(15).lighten(20).blend(Colors.white, 60),
        ),
      );
    });

    test(
        'FSC1.23: GIVEN a FlexSchemeColor.effective(SchemeColors, 1) '
        'with brightness:light for M3 like scheme '
        'EXPECT equal to SchemeColors with primary container, secondary, '
        'Secondary container, tertiary and tertiaryContainer M3 computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 1, brightness: Brightness.light),
        m1Full.copyWith(
          primaryContainer: m1Full.primary.lighten(20).blend(Colors.white, 60),
          secondary: m1Full.primary.darken().brighten(20),
          secondaryContainer:
              m1Full.primary.darken().brighten(20).blend(Colors.white, 60),
          tertiary: m1Full.primary.brighten(15),
          tertiaryContainer:
              m1Full.primary.brighten(15).lighten(20).blend(Colors.white, 60),
        ),
      );
    });

    test(
        'FSC1.23-7: GIVEN a FlexSchemeColor.effective(SchemeColors, 7) '
        'with brightness:light for M3 like scheme '
        'EXPECT equal to SchemeColors with primary container, '
        'Secondary container and tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 7, brightness: Brightness.light),
        m1Full.copyWith(
          primaryContainer: m1Full.primary.lighten(20).blend(Colors.white, 60),
          secondaryContainer:
              m1Full.secondary.brighten(14).blend(Colors.white, 50),
          tertiaryContainer:
              m1Full.tertiary.brighten(18).blend(Colors.white, 50),
        ),
      );
    });

    // Effective with brightness dark

    // m1Full = Basic flex scheme color, with full colors .
    final FlexSchemeColor m1FullD = FlexSchemeColor(
      primary: FlexColor.materialDarkPrimary,
      primaryContainer: FlexColor.materialDarkPrimaryContainer,
      secondary: FlexColor.materialDarkSecondary,
      secondaryContainer: FlexColor.blueDarkSecondaryContainer,
      tertiary: FlexColor.materialDarkTertiary,
      tertiaryContainer: FlexColor.blueDarkTertiaryContainer,
      appBarColor: Colors.black,
      error: FlexColor.materialDarkError,
      errorContainer: FlexColor.darkErrorContainer(FlexColor.materialDarkError),
    );

    test(
        'FSC1.24: GIVEN a FlexSchemeColor.effective(SchemeColors, 6) '
        'with brightness:dark for M3 like scheme '
        'EXPECT it to be equal to SchemeColors ', () {
      expect(
        FlexSchemeColor.effective(m1FullD, 6, brightness: Brightness.dark),
        m1FullD,
      );
    });

    test(
        'FSC1.25: GIVEN a FlexSchemeColor.effective(SchemeColors, 5) '
        'with brightness:dark for M3 like scheme '
        'EXPECT equal to SchemeColors with tertiaryContainer M3 computed.', () {
      expect(
        FlexSchemeColor.effective(m1FullD, 5, brightness: Brightness.dark),
        m1FullD.copyWith(
          tertiaryContainer:
              m1FullD.tertiary.darken(15).blend(Colors.black, 60),
        ),
      );
    });

    test(
        'FSC1.26: GIVEN a FlexSchemeColor.effective(SchemeColors, 4) '
        'with brightness:dark for M3 like scheme '
        'EXPECT equal to SchemeColors with tertiary and tertiaryContainer '
        'M3 computed', () {
      expect(
        FlexSchemeColor.effective(m1FullD, 4, brightness: Brightness.dark),
        m1FullD.copyWith(
          tertiary: m1FullD.primary.brighten(15),
          tertiaryContainer:
              m1FullD.primary.brighten(15).darken(20).blend(Colors.black, 30),
        ),
      );
    });

    test(
        'FSC1.27: GIVEN a FlexSchemeColor.effective(SchemeColors, 3) '
        'with brightness:dark for M3 like scheme '
        'EXPECT equal to SchemeColors with Secondary container, tertiary and '
        'tertiaryContainer M3 computed.', () {
      expect(
        FlexSchemeColor.effective(m1FullD, 3, brightness: Brightness.dark),
        m1FullD.copyWith(
          secondaryContainer:
              m1FullD.secondary.darken(25).blend(Colors.black, 50),
          tertiary: m1FullD.primary.brighten(15),
          tertiaryContainer:
              m1FullD.primary.brighten(15).darken(20).blend(Colors.black, 30),
        ),
      );
    });

    test(
        'FSC1.28: GIVEN a FlexSchemeColor.effective(SchemeColors, 2) '
        'with brightness:dark for M3 like scheme '
        'EXPECT equal to SchemeColors with primary container, Secondary '
        'container, tertiary and tertiaryContainer M3 computed.', () {
      expect(
        FlexSchemeColor.effective(m1FullD, 2, brightness: Brightness.dark),
        m1FullD.copyWith(
          primaryContainer: m1FullD.primary.darken(5).blend(Colors.black, 55),
          secondaryContainer:
              m1FullD.secondary.darken(25).blend(Colors.black, 50),
          tertiary: m1FullD.primary.brighten(15),
          tertiaryContainer:
              m1FullD.primary.brighten(15).darken(20).blend(Colors.black, 30),
        ),
      );
    });

    test(
        'FSC1.29: GIVEN a FlexSchemeColor.effective(SchemeColors, 1) '
        'with brightness:dark for M3 like scheme '
        'EXPECT equal to SchemeColors with primary container, secondary, '
        'Secondary container, tertiary and tertiaryContainer M3 computed.', () {
      expect(
        FlexSchemeColor.effective(m1FullD, 1, brightness: Brightness.dark),
        m1FullD.copyWith(
          primaryContainer: m1FullD.primary.darken(5).blend(Colors.black, 55),
          secondary: m1FullD.primary.darken().brighten(20),
          secondaryContainer:
              m1FullD.primary.darken().brighten(20).blend(Colors.black, 40),
          tertiary: m1FullD.primary.brighten(15),
          tertiaryContainer:
              m1FullD.primary.brighten(15).darken(20).blend(Colors.black, 30),
        ),
      );
    });

    test(
        'FSC1.29-7: GIVEN a FlexSchemeColor.effective(SchemeColors, 7) '
        'with brightness:dark for M3 like scheme '
        'EXPECT equal to SchemeColors with primary container, '
        'Secondary container and tertiaryContainer M3 computed.', () {
      expect(
        FlexSchemeColor.effective(m1FullD, 7, brightness: Brightness.dark),
        m1FullD.copyWith(
          primaryContainer: m1FullD.primary.darken(5).blend(Colors.black, 55),
          secondaryContainer:
              m1FullD.secondary.darken(25).blend(Colors.black, 50),
          tertiaryContainer:
              m1FullD.tertiary.darken(15).blend(Colors.black, 60),
        ),
      );
    });

    final FlexSchemeColor m1SwapLegacy = FlexSchemeColor(
      primary: FlexColor.materialLightPrimary,
      primaryContainer: FlexColor.materialLightPrimaryContainer, // -> SecVar
      secondary: FlexColor.materialLightTertiary, // -> primVar
      secondaryContainer: FlexColor.blueLightTertiaryContainer,
      tertiary: FlexColor.materialLightSecondary,
      tertiaryContainer: FlexColor.blueLightSecondaryContainer,
      appBarColor: Colors.white,
      error: FlexColor.materialLightError,
      errorContainer:
          FlexColor.lightErrorContainer(FlexColor.materialLightError),
    );

    test(
        'FSC1.30-L1: GIVEN a FlexSchemeColor.effective(SchemeColors, 6, '
        'swapLegacy: true) '
        'EXPECT it equal to FlexSchemeColor made with legacy '
        'colors swapped. ', () {
      expect(
        FlexSchemeColor.effective(m1Full, 6, swapLegacy: true),
        equals(m1SwapLegacy),
      );
    });

    final FlexSchemeColor m1SwapLegacyAndSwapColors = FlexSchemeColor(
      primary: FlexColor.materialLightTertiary,
      primaryContainer: FlexColor.blueLightTertiaryContainer,
      secondary: FlexColor.materialLightPrimary,
      secondaryContainer: FlexColor.materialLightPrimaryContainer,
      tertiary: FlexColor.materialLightSecondary,
      tertiaryContainer: FlexColor.blueLightSecondaryContainer,
      appBarColor: Colors.white,
      error: FlexColor.materialLightError,
      errorContainer:
          FlexColor.lightErrorContainer(FlexColor.materialLightError),
    );

    test(
        'FSC1.30-L2: GIVEN a FlexSchemeColor.effective(SchemeColors, 6, '
        'swapLegacy: true, swapColors: true) '
        'EXPECT it equal to FlexSchemeColor made with legacy '
        'colors and then primary and secondary swapped. ', () {
      expect(
        FlexSchemeColor.effective(m1Full, 6,
            swapLegacy: true, swapColors: true),
        equals(m1SwapLegacyAndSwapColors),
      );
    });

    final FlexSchemeColor m1Swap = FlexSchemeColor(
      primary: FlexColor.materialLightSecondary,
      primaryContainer: FlexColor.blueLightSecondaryContainer,
      secondary: FlexColor.materialLightPrimary,
      secondaryContainer: FlexColor.materialLightPrimaryContainer, // -> SecVar
      tertiary: FlexColor.materialLightTertiary, // -> primVar
      tertiaryContainer: FlexColor.blueLightTertiaryContainer,
      appBarColor: Colors.white,
      error: FlexColor.materialLightError,
      errorContainer:
          FlexColor.lightErrorContainer(FlexColor.materialLightError),
    );

    test(
        'FSC1.30: GIVEN a FlexSchemeColor.effective(SchemeColors, 6, '
        'swapColors: true) '
        'EXPECT it equal to SchemeColor made with colors swapped. ', () {
      expect(
        FlexSchemeColor.effective(m1Full, 6, swapColors: true),
        equals(m1Swap),
      );
    });

    test(
        'FSC1.31: GIVEN a FlexSchemeColor.effective(SchemeColors, 5, '
        'swapColors: true) '
        'EXPECT equal to SchemeColor made with colors swapped and '
        'with tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 5, swapColors: true),
        m1Swap.copyWith(
          tertiaryContainer: m1Swap.tertiary.lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.32: GIVEN a FlexSchemeColor.effective(SchemeColors, 4, '
        'swapColors: true) '
        'EXPECT equal to SchemeColor made with colors swapped '
        'with tertiary and tertiaryContainer computed. ', () {
      expect(
        FlexSchemeColor.effective(m1Full, 4, swapColors: true),
        m1Swap.copyWith(
          tertiary: m1Swap.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Swap.primary
              .brighten(kDarkenSecondary * 2)
              .lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    // This test fails in version 3.0.0, fix released in 3.0.1.
    test(
        'FSC1.33: GIVEN a FlexSchemeColor.effective(SchemeColors, 3, '
        'swapColors: true) '
        'EXPECT equal to SchemeColor made with colors swapped, '
        'with Secondary container, tertiary and tertiaryContainer computed.',
        () {
      expect(
        FlexSchemeColor.effective(m1Full, 3, swapColors: true),
        m1Swap.copyWith(
          secondaryContainer:
              m1Swap.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          tertiary: m1Swap.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Swap.primary
              .brighten(kDarkenSecondary * 2)
              .lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    test(
        'FSC1.34: GIVEN a FlexSchemeColor.effective(SchemeColors, 2, '
        'swapColors: true) '
        'EXPECT equal to SchemeColor made with colors swapped, '
        'with primary container, Secondary container, tertiary and '
        'tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 2, swapColors: true),
        m1Swap.copyWith(
          primaryContainer: m1Swap.primary.darken(kDarkenPrimaryContainer),
          secondaryContainer:
              m1Swap.secondary.darken(kDarkenSecondaryContainerFromSecondary),
          //
          tertiary: m1Swap.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Swap.primary
              .brighten(kDarkenSecondary * 2)
              .lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    // This test failed in version 3.0.0, fix added in release in 3.0.1
    // Test now passes.
    test(
        'FSC1.35: GIVEN a FlexSchemeColor.effective(SchemeColors, 1), '
        'swapColors: true) EXPECT it '
        'to be equal to SchemeColor made with colors swapped, '
        'with primary container, secondary, secondary container, tertiary and '
        'tertiaryContainer computed.', () {
      expect(
        FlexSchemeColor.effective(m1Full, 1, swapColors: true),
        m1Swap.copyWith(
          primaryContainer: m1Swap.primary.darken(kDarkenPrimaryContainer),
          //
          secondary: m1Swap.primary.darken(kDarkenSecondary),
          secondaryContainer: m1Swap.primary.darken(kDarkenSecondaryContainer),
          //
          tertiary: m1Swap.primary.lighten(kDarkenPrimaryContainer),
          tertiaryContainer: m1Swap.primary
              .brighten(kDarkenSecondary * 2)
              .lighten(kDarkenSecondaryContainer),
        ),
      );
    });

    //**************************************************************************
    // FlexSchemeColor unit tests.
    //
    // toString and hashcode.
    //**************************************************************************

    test(
        'FSC1.36: Test toString implemented via debugFillProperties '
        'EXPECT exact print string', () {
      expect(
          m1.toString(),
          //
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexSchemeColor#00000(primary: Color(0xff6200ee), primaryContainer: Color(0xffbb86fc), secondary: Color(0xff03dac6), secondaryContainer: Color(0xff03dac6), tertiary: Color(0xff018786), tertiaryContainer: Color(0xff018786), appBarColor: Color(0xff018786), error: Color(0xffb00020), errorContainer: null, swapOnMaterial3: false)'));
    });
    test(
        'FSC1.37: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout string.', () {
      expect(
        m1.toStringShort(),
        equalsIgnoringHashCodes('FlexSchemeColor#00000'),
      );
    });
    test('FSC1.38: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    test('FSC1.39: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });
  });
}
