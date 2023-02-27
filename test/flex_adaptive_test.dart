import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexAdaptive unit tests.
  //
  // Basic object tests, equality, none equal.
  //****************************************************************************
  group('FA1: WITH FlexAdaptive ', () {
    // m1, is the baseline for FlexAdaptive tests
    const FlexAdaptive m1 = FlexAdaptive(
      android: false,
      androidWeb: false,
      fuchsia: false,
      fuchsiaWeb: false,
      iOS: false,
      iOSWeb: false,
      linux: false,
      linuxWeb: false,
      macOS: false,
      macOSWeb: false,
      windows: false,
      windowsWeb: false,
    );
    // m2, has same definition as m1, but via off constructor
    const FlexAdaptive m2 = FlexAdaptive.off();
    // m3, has same definition as m1, but one value is different.
    const FlexAdaptive m3 = FlexAdaptive.off(android: true);
    // m4, has all values different from m1
    const FlexAdaptive m4 = FlexAdaptive.all();
    // Do identity tests
    test(
        'FA1.01: GIVEN same FlexAdaptive objects '
        'EXPECT them to be equal', () {
      expect(m1, equals(m1));
    });
    test(
        'FA1.02: GIVEN same FlexAdaptive objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m1), true);
    });
    test(
        'FA1.03: GIVEN two equal FlexAdaptive objects '
        'EXPECT them to have equality', () {
      expect(m1, equals(m2));
    });
    test(
        'FA1.04: GIVEN two equal FlexAdaptive objects '
        'EXPECT them to have identity', () {
      expect(identical(m1, m2), true);
    });
    test(
        'FA1.05: GIVEN two equal FlexAdaptive objects '
        'EXPECT them to have equality with operator', () {
      expect(m1 == m2, true);
    });
    test(
        'FA1.06: GIVEN none equal FlexAdaptive objects '
        'EXPECT them to be unequal', () {
      expect(m1, isNot(m3));
    });
    test(
        'FA1.07: GIVEN none equal FlexAdaptive objects '
        'EXPECT them to be unequal with operator', () {
      expect(m1 != m3, true);
    });
    //**************************************************************************
    // FlexAdaptive unit tests.
    //
    // Test .copyWith, full and null..
    //**************************************************************************
    test(
        'FA1.08: GIVEN a FlexAdaptive object EXPECT it to be equal to '
        'an unequal object when made equal with copyWith.', () {
      expect(
        m3.copyWith(
          android: false,
        ),
        equals(m1),
      );
    });
    test(
        'FA1.09: GIVEN a FlexAdaptive object EXPECT it to be unchanged '
        'after and empty copyWith.', () {
      expect(
        m1.copyWith(),
        equals(m1),
      );
    });
    test(
        'FA1.09c: GIVEN a FlexAdaptive with all different values '
        'EXPECT equal to an unequal one when made equal with copyWith.', () {
      expect(
        m4.copyWith(
          android: false,
          androidWeb: false,
          fuchsia: false,
          fuchsiaWeb: false,
          iOS: false,
          iOSWeb: false,
          linux: false,
          linuxWeb: false,
          macOS: false,
          macOSWeb: false,
          windows: false,
          windowsWeb: false,
        ),
        equals(m1),
      );
    });

    //**************************************************************************
    // FlexAdaptive unit tests.
    //
    // toString and hashcode.
    //**************************************************************************

    test(
        'FA1.10: Test toString implemented via debugFillProperties '
        'EXPECT exact print string value.', () {
      expect(
          m1.toString(),
          //
          equalsIgnoringHashCodes(
              // ignore: lines_longer_than_80_chars
              'FlexAdaptive#00000(android: false, androidWeb: false, fuchsia: false, fuchsiaWeb: false, iOS: false, iOSWeb: false, linux: false, linuxWeb: false, macOS: false, macOSWeb: false, windows: false, windowsWeb: false)'));
    });
    test(
        'FA1.11: Test toStringShort implemented via debugFillProperties '
        'EXPECT exact short printout.', () {
      expect(m1.toStringShort(), equalsIgnoringHashCodes('FlexAdaptive#00000'));
    });
    test('FA1.12: Test hashCode has value.', () {
      expect(m1.hashCode, isNotNull);
    });
    test('FA1.13: Test hashCode copyWith has same exact value.', () {
      expect(m1.hashCode, equals(m1.copyWith().hashCode));
    });

    //**************************************************************************
    // FlexAdaptive unit tests.
    //
    // Test that all built in FlexAdaptive definitions are as they were defined
    // originally. Main purposes just to check that nobody fiddled with the
    // definition values, without also changing tests and knowingly doing a
    // a breaking change.
    //**************************************************************************

    test('FA1.014: Verify FlexAdaptive.off definition. ', () {
      const FlexAdaptive m = FlexAdaptive.off();
      expect(
        m,
        equals(
          const FlexAdaptive(
            android: false,
            androidWeb: false,
            fuchsia: false,
            fuchsiaWeb: false,
            iOS: false,
            iOSWeb: false,
            linux: false,
            linuxWeb: false,
            macOS: false,
            macOSWeb: false,
            windows: false,
            windowsWeb: false,
          ),
        ),
      );
      expect(m.adapt(TargetPlatform.android, false), false);
      expect(m.adapt(TargetPlatform.android, true), false);
      expect(m.adapt(TargetPlatform.fuchsia, false), false);
      expect(m.adapt(TargetPlatform.fuchsia, true), false);
      expect(m.adapt(TargetPlatform.iOS, false), false);
      expect(m.adapt(TargetPlatform.iOS, true), false);
      expect(m.adapt(TargetPlatform.linux, false), false);
      expect(m.adapt(TargetPlatform.linux, true), false);
      expect(m.adapt(TargetPlatform.macOS, false), false);
      expect(m.adapt(TargetPlatform.macOS, true), false);
      expect(m.adapt(TargetPlatform.windows, false), false);
      expect(m.adapt(TargetPlatform.windows, true), false);
      // For coverage, let's hit with no overrides.
      expect(m.adapt(), false);
    });
    test('FA1.015: Verify FlexAdaptive.all definition. ', () {
      const FlexAdaptive m = FlexAdaptive.all();
      expect(
        m,
        equals(
          const FlexAdaptive(
            android: true,
            androidWeb: true,
            fuchsia: true,
            fuchsiaWeb: true,
            iOS: true,
            iOSWeb: true,
            linux: true,
            linuxWeb: true,
            macOS: true,
            macOSWeb: true,
            windows: true,
            windowsWeb: true,
          ),
        ),
      );
      expect(m.adapt(TargetPlatform.android, false), true);
      expect(m.adapt(TargetPlatform.android, true), true);
      expect(m.adapt(TargetPlatform.fuchsia, false), true);
      expect(m.adapt(TargetPlatform.fuchsia, true), true);
      expect(m.adapt(TargetPlatform.iOS, false), true);
      expect(m.adapt(TargetPlatform.iOS, true), true);
      expect(m.adapt(TargetPlatform.linux, false), true);
      expect(m.adapt(TargetPlatform.linux, true), true);
      expect(m.adapt(TargetPlatform.macOS, false), true);
      expect(m.adapt(TargetPlatform.macOS, true), true);
      expect(m.adapt(TargetPlatform.windows, false), true);
      expect(m.adapt(TargetPlatform.windows, true), true);
      // For coverage, let's hit with no overrides.
      expect(m.adapt(), true);
    });
    test('FA1.016: Verify FlexAdaptive.apple definition. ', () {
      const FlexAdaptive m = FlexAdaptive.apple();
      expect(
        m,
        equals(
          const FlexAdaptive(
            android: false,
            androidWeb: false,
            fuchsia: false,
            fuchsiaWeb: false,
            iOS: true,
            iOSWeb: false,
            linux: false,
            linuxWeb: false,
            macOS: true,
            macOSWeb: false,
            windows: false,
            windowsWeb: false,
          ),
        ),
      );
      expect(m.adapt(TargetPlatform.android, false), false);
      expect(m.adapt(TargetPlatform.android, true), false);
      expect(m.adapt(TargetPlatform.fuchsia, false), false);
      expect(m.adapt(TargetPlatform.fuchsia, true), false);
      expect(m.adapt(TargetPlatform.iOS, false), true);
      expect(m.adapt(TargetPlatform.iOS, true), false);
      expect(m.adapt(TargetPlatform.linux, false), false);
      expect(m.adapt(TargetPlatform.linux, true), false);
      expect(m.adapt(TargetPlatform.macOS, false), true);
      expect(m.adapt(TargetPlatform.macOS, true), false);
      expect(m.adapt(TargetPlatform.windows, false), false);
      expect(m.adapt(TargetPlatform.windows, true), false);
    });
    test('FA1.017: Verify FlexAdaptive.desktop definition. ', () {
      const FlexAdaptive m = FlexAdaptive.desktop();
      expect(
        m,
        equals(
          const FlexAdaptive(
            android: false,
            androidWeb: false,
            fuchsia: false,
            fuchsiaWeb: false,
            iOS: false,
            iOSWeb: false,
            linux: true,
            linuxWeb: true,
            macOS: true,
            macOSWeb: true,
            windows: true,
            windowsWeb: true,
          ),
        ),
      );
      expect(m.adapt(TargetPlatform.android, false), false);
      expect(m.adapt(TargetPlatform.android, true), false);
      expect(m.adapt(TargetPlatform.fuchsia, false), false);
      expect(m.adapt(TargetPlatform.fuchsia, true), false);
      expect(m.adapt(TargetPlatform.iOS, false), false);
      expect(m.adapt(TargetPlatform.iOS, true), false);
      expect(m.adapt(TargetPlatform.linux, false), true);
      expect(m.adapt(TargetPlatform.linux, true), true);
      expect(m.adapt(TargetPlatform.macOS, false), true);
      expect(m.adapt(TargetPlatform.macOS, true), true);
      expect(m.adapt(TargetPlatform.windows, false), true);
      expect(m.adapt(TargetPlatform.windows, true), true);
    });
    test('FA1.018: Verify FlexAdaptive.iOSAndDesktop definition. ', () {
      const FlexAdaptive m = FlexAdaptive.iOSAndDesktop();
      expect(
        m,
        equals(
          const FlexAdaptive(
            android: false,
            androidWeb: false,
            fuchsia: false,
            fuchsiaWeb: false,
            iOS: true,
            iOSWeb: true,
            linux: true,
            linuxWeb: true,
            macOS: true,
            macOSWeb: true,
            windows: true,
            windowsWeb: true,
          ),
        ),
      );
      expect(m.adapt(TargetPlatform.android, false), false);
      expect(m.adapt(TargetPlatform.android, true), false);
      expect(m.adapt(TargetPlatform.fuchsia, false), false);
      expect(m.adapt(TargetPlatform.fuchsia, true), false);
      expect(m.adapt(TargetPlatform.iOS, false), true);
      expect(m.adapt(TargetPlatform.iOS, true), true);
      expect(m.adapt(TargetPlatform.linux, false), true);
      expect(m.adapt(TargetPlatform.linux, true), true);
      expect(m.adapt(TargetPlatform.macOS, false), true);
      expect(m.adapt(TargetPlatform.macOS, true), true);
      expect(m.adapt(TargetPlatform.windows, false), true);
      expect(m.adapt(TargetPlatform.windows, true), true);
    });
    test('FA1.019: Verify FlexAdaptive.excludeAndroidFuchsia definition. ', () {
      const FlexAdaptive m = FlexAdaptive.excludeAndroidFuchsia();
      expect(
        m,
        equals(
          const FlexAdaptive(
            android: false,
            androidWeb: true,
            fuchsia: false,
            fuchsiaWeb: true,
            iOS: true,
            iOSWeb: true,
            linux: true,
            linuxWeb: true,
            macOS: true,
            macOSWeb: true,
            windows: true,
            windowsWeb: true,
          ),
        ),
      );
      expect(m.adapt(TargetPlatform.android, false), false);
      expect(m.adapt(TargetPlatform.android, true), true);
      expect(m.adapt(TargetPlatform.fuchsia, false), false);
      expect(m.adapt(TargetPlatform.fuchsia, true), true);
      expect(m.adapt(TargetPlatform.iOS, false), true);
      expect(m.adapt(TargetPlatform.iOS, true), true);
      expect(m.adapt(TargetPlatform.linux, false), true);
      expect(m.adapt(TargetPlatform.linux, true), true);
      expect(m.adapt(TargetPlatform.macOS, false), true);
      expect(m.adapt(TargetPlatform.macOS, true), true);
      expect(m.adapt(TargetPlatform.windows, false), true);
      expect(m.adapt(TargetPlatform.windows, true), true);
    });
    test('FA1.020: Verify FlexAdaptive.excludeWebAndroidFuchsia definition. ',
        () {
      const FlexAdaptive m = FlexAdaptive.excludeWebAndroidFuchsia();
      expect(
        m,
        equals(
          const FlexAdaptive(
            android: false,
            androidWeb: false,
            fuchsia: false,
            fuchsiaWeb: false,
            iOS: true,
            iOSWeb: false,
            linux: true,
            linuxWeb: false,
            macOS: true,
            macOSWeb: false,
            windows: true,
            windowsWeb: false,
          ),
        ),
      );
      expect(m.adapt(TargetPlatform.android, false), false);
      expect(m.adapt(TargetPlatform.android, true), false);
      expect(m.adapt(TargetPlatform.fuchsia, false), false);
      expect(m.adapt(TargetPlatform.fuchsia, true), false);
      expect(m.adapt(TargetPlatform.iOS, false), true);
      expect(m.adapt(TargetPlatform.iOS, true), false);
      expect(m.adapt(TargetPlatform.linux, false), true);
      expect(m.adapt(TargetPlatform.linux, true), false);
      expect(m.adapt(TargetPlatform.macOS, false), true);
      expect(m.adapt(TargetPlatform.macOS, true), false);
      expect(m.adapt(TargetPlatform.windows, false), true);
      expect(m.adapt(TargetPlatform.windows, true), false);
    });
  });
}
