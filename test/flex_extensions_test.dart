import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  //****************************************************************************
  // FlexColorExtensions unit tests.
  //
  // Color.brighten function, reference value and edge cases tests.
  //****************************************************************************
  group('FCE1: WITH Color extension Color.brighten.', () {
    const Color col = Color(0xFF6200EE);
    const Color white = Color(0xFFFFFFFF);
    // const Color? nullColor = null;
    test('FCE1.01: GIVEN brighten() EXPECT default brighten(10).', () {
      // ignore: avoid_redundant_argument_values
      expect(col.brighten(), col.brighten(10));
    });
    test('FCE1.02: GIVEN brighten(0) EXPECT no change.', () {
      expect(col.brighten(0), col);
    });
    test('FCE1.02: GIVEN brighten(<0) EXPECT no change.', () {
      expect(col.brighten(-1), col);
    });
    test('FCE1.03: GIVEN brighten(100) EXPECT White.', () {
      expect(col.brighten(100), white);
    });
    test('FCE1.04: GIVEN brighten(>100) EXPECT White.', () {
      expect(col.brighten(101), white);
    });
    // test('FCE1.05: GIVEN brighten(null) EXPECT no change.', () {
    //   expect(col.brighten(null), col);
    // });
    test('FCE1.06: GIVEN $col.brighten(20) EXPECT Color(0xff9533ff).', () {
      expect(col.brighten(20), const Color(0xff9533ff));
    });
    // test('FCE1.07: GIVEN <null>.brighten() EXPECT <null>.', () {
    //   expect(nullColor!.brighten(), isNull);
    // });
  });

  //****************************************************************************
  // FlexColorExtensions unit tests.
  //
  // Color.lighten function, reference value and edge cases tests.
  //****************************************************************************
  group('FCE2: WITH Color extension Color.lighten.', () {
    const Color col = Color(0xFF6200EE);
    const Color white = Color(0xFFFFFFFF);
    const Color black = Color(0xFF000000);
    // const Color? nullColor = null;
    test('FCE2.01: GIVEN lighten() EXPECT default lighten(10).', () {
      // ignore: avoid_redundant_argument_values
      expect(col.lighten(), col.lighten(10));
    });
    test('FCE2.02: GIVEN lighten(0) EXPECT no change.', () {
      expect(col.lighten(0), col);
    });
    test('FCE2.03: GIVEN lighten(<0) EXPECT no change.', () {
      expect(col.lighten(-1), col);
    });
    test('FCE2.04: GIVEN lighten(100) EXPECT White.', () {
      expect(col.lighten(100), white);
    });
    test('FCE2.05: GIVEN lighten(>100) EXPECT White.', () {
      expect(col.lighten(101), white);
    });
    // test('FCE2.06: GIVEN lighten(null) EXPECT no change.', () {
    //   expect(col.lighten(null), col);
    // });
    test('FCE2.07: GIVEN $col.lighten(20) EXPECT Color(0xff9b55ff).', () {
      expect(col.lighten(20), const Color(0xff9b55ff));
    });
    test('FCE2.08: GIVEN $black.lighten(1) EXPECT Color(0xff9b55ff).', () {
      expect(black.lighten(1), const Color(0xff030303));
    });
    // test('FCE2.09: GIVEN <null>.lighten() EXPECT <null>.', () {
    //   expect(nullColor!.lighten(), isNull);
    // });
  });

  //****************************************************************************
  // FlexColorExtensions unit tests.
  //
  // Color.darken function, reference value and edge cases tests.
  //****************************************************************************
  group('FCE3: WITH Color extension Color.darken ', () {
    const Color col = Color(0xFF6200EE);
    const Color white = Color(0xFFFFFFFF);
    const Color black = Color(0xFF000000);
    // const Color? nullColor = null;
    test('FCE3.01: GIVEN darken() EXPECT default darken(10).', () {
      // ignore: avoid_redundant_argument_values
      expect(col.darken(), col.darken(10));
    });
    test('FCE3.02: GIVEN darken(0) EXPECT no change.', () {
      expect(col.darken(0), col);
    });
    test('FCE3.03: GIVEN darken(<0) EXPECT no change.', () {
      expect(col.darken(-1), col);
    });
    test('FCE3.04: GIVEN darken(100) EXPECT black.', () {
      expect(col.darken(100), black);
    });
    test('FCE3.05: GIVEN darken(>100) EXPECT black.', () {
      expect(col.darken(101), black);
    });
    // test('FCE3.06: GIVEN darken(null) EXPECT no change.', () {
    //   expect(col.darken(null), col);
    // });
    test('FCE3.07: GIVEN $col.darken(20) EXPECT Color(0xff380088).', () {
      expect(col.darken(20), const Color(0xff380088));
    });
    test('FCE3.08: GIVEN $white.darken(1) EXPECT Color(0xfffcfcfc).', () {
      expect(white.darken(1), const Color(0xfffcfcfc));
    });
    // test('FCE3.09: GIVEN <null>.darken() EXPECT <null>.', () {
    //   expect(nullColor!.darken(), isNull);
    // });
  });

  //****************************************************************************
  // FlexColorExtensions unit tests.
  //
  // Color.blend function, reference value and edge cases tests.
  //****************************************************************************
  group('FCE4: WITH Color extension Color.blend ', () {
    const Color col1 = Color(0xFFB00020);
    const Color col2 = Color(0xFF03DAC6);
    const Color col3 = Color(0xFFCF6679);
    const Color white = Color(0xFFFFFFFF);
    const Color black = Color(0xFF000000);
    // const Color? nullColor = null;
    test('FCE4.01: GIVEN blend(color) EXPECT default blend(color, 10) ', () {
      // ignore: avoid_redundant_argument_values
      expect(col1.blend(white), col1.blend(white, 10));
    });
    // test('FCE4.02: GIVEN color.blend(null, null) EXPECT color.', () {
    //   expect(col1.blend(null, null), col1);
    // });
    // test('FCE4.03: GIVEN color.blend(color2, null) EXPECT color.', () {
    //   expect(col1.blend(white, null), col1);
    // });
    test('FCE4.04: GIVEN color.blend(color2, 0) EXPECT color.', () {
      expect(col1.blend(white, 0), col1);
    });
    test('FCE4.05: GIVEN color.blend(color2, <0) EXPECT color.', () {
      expect(col1.blend(white, -1), col1);
    });
    test('FCE4.06: GIVEN color.blend(color2, 100) EXPECT color2.', () {
      expect(col1.blend(col2, 100), col2);
    });
    test('FCE4.07: GIVEN color.blend(color2, >100) EXPECT color2.', () {
      expect(col1.blend(col2, 101), col2);
    });
    test('FCE4.08: GIVEN color.blend(white, 0) EXPECT color.', () {
      expect(col1.blend(white, 0), col1);
    });
    test('FCE4.09: GIVEN color.blend(white, 100) EXPECT white.', () {
      expect(col1.blend(white, 100), white);
    });
    test('FCE4.10: GIVEN color.blend(black, 0) EXPECT color.', () {
      expect(col1.blend(black, 0), col1);
    });
    test('FCE4.11: GIVEN color.blend(black, 100) EXPECT white.', () {
      expect(col1.blend(black, 100), black);
    });
    test('FCE4.12: GIVEN $col1.blend(white, 40) EXPECT $col3.', () {
      expect(col1.blend(white, 40), col3);
    });
    // test('FCE4.13: GIVEN <null>blend(white, 40) EXPECT <null>.', () {
    //   expect(nullColor!.blend(white, 40), isNull);
    // });
    // test('FCE4.14: GIVEN <null>.blend(null, null) EXPECT <null>.', () {
    //   expect(nullColor!.blend(null, null), isNull);
    // });
  });

  //****************************************************************************
  // FlexColorExtensions unit tests.
  //
  // Color.hexCode function, reference value and edge cases tests.
  //****************************************************************************
  group('FCE5: WITH Color extension Color.hexCode ', () {
    const Color col1 = Color(0xFFB00020);
    const Color col2 = Color(0x0F03DAC6);
    const Color col3 = Color(0xF0CF6679);
    const Color col4 = Color(0x00CF6679);
    const Color white = Color(0xFFFFFFFF);
    const Color black = Color(0xFF000000);
    // const Color? nullColor = null;
    test('FCE5.01: GIVEN $col1 EXPECT "FFB00020".', () {
      expect(col1.hexCode, 'FFB00020');
    });
    test('FCE5.02: GIVEN $col2 EXPECT "0F03DAC6".', () {
      expect(col2.hexCode, '0F03DAC6');
    });
    test('FCE5.03: GIVEN $col3 EXPECT "F0CF6679".', () {
      expect(col3.hexCode, 'F0CF6679');
    });
    test('FCE5.04: GIVEN $col4 EXPECT "00CF6679".', () {
      expect(col4.hexCode, '00CF6679');
    });
    test('FCE5.05: GIVEN $white EXPECT "FFFFFFFF".', () {
      expect(white.hexCode, 'FFFFFFFF');
    });
    test('FCE5.06: GIVEN $black EXPECT "FF000000".', () {
      expect(black.hexCode, 'FF000000');
    });
    // test('FCE5.07: GIVEN <$nullColor>.hexCode EXPECT "".', () {
    //   expect(nullColor!.hexCode, '');
    // });
  });

  //****************************************************************************
  // FlexColorExtensions unit tests.
  //
  // Color.hex function, reference value and edge cases tests.
  //****************************************************************************
  group('FCE6: WITH Color extension Color.hex ', () {
    const Color col1 = Color(0xFFB00020);
    const Color col2 = Color(0x0F03DAC6);
    const Color col3 = Color(0xF0CF6679);
    const Color col4 = Color(0x00CF6679);
    const Color white = Color(0xFFFFFFFF);
    const Color black = Color(0xFF000000);
    // const Color? nullColor = null;
    test('FCE6.01: GIVEN $col1 EXPECT "#B00020".', () {
      expect(col1.hex, '#B00020');
    });
    test('FCE6.02: GIVEN $col2 EXPECT "#03DAC6".', () {
      expect(col2.hex, '#03DAC6');
    });
    test('FCE6.03: GIVEN $col3 EXPECT "#CF6679".', () {
      expect(col3.hex, '#CF6679');
    });
    test('FCE6.04: GIVEN $col4 EXPECT "#CF6679".', () {
      expect(col4.hex, col4.hex);
    });
    test('FCE6.05: GIVEN $white EXPECT "#FFFFFF".', () {
      expect(white.hex, '#FFFFFF');
    });
    test('FCE6.06: GIVEN $black EXPECT "#000000".', () {
      expect(black.hex, '#000000');
    });
    // test('FCE6.07: GIVEN <$nullColor>.hex EXPECT "".', () {
    //   expect(nullColor!.hex, '');
    // });
  });

  //****************************************************************************
  // FlexColorExtensions unit tests.
  //
  // Color.getShadeColor function, reference value and edge cases tests.
  //****************************************************************************
  group('FCE7: WITH Color extension Color.getShadeColor ', () {
    const Color col1 = Color(0xFFB00020);
    const Color white = Color(0xFFFFFFFF);
    const Color black = Color(0xFF000000);
    // const Color? nullColor = null;
    test(
        'FCE7.01: GIVEN color.getShadeColor() EXPECT '
        'color.getShadeColor(shadeValue: 15, lighten: true, keepBlack: true, '
        'keepWhite: true)))', () {
      expect(
          col1.getShadeColor(),
          col1.getShadeColor(
              shadeValue: 15, // ignore: avoid_redundant_argument_values
              lighten: true, // ignore: avoid_redundant_argument_values
              keepBlack: true, // ignore: avoid_redundant_argument_values
              keepWhite: true)); // ignore: avoid_redundant_argument_values
    });
    test(
        'FCE7.02: GIVEN color.getShadeColor(shadeValue: null, lighten: null, '
        'keepBlack: null, keepWhite: null) EXPECT '
        'color.getShadeColor(shadeValue: 15, lighten: true, keepBlack: true, '
        'keepWhite: true)))', () {
      expect(
          col1.getShadeColor(),
          col1.getShadeColor(
              shadeValue: 15, // ignore: avoid_redundant_argument_values
              lighten: true, // ignore: avoid_redundant_argument_values
              keepBlack: true, // ignore: avoid_redundant_argument_values
              keepWhite: true)); // ignore: avoid_redundant_argument_values
    });
    test('FCE7.03: GIVEN $white.getShadeColor() EXPECT $white.', () {
      expect(white.getShadeColor(), white);
    });
    test(
        'FCE7.04: GIVEN $white.getShadeColor(lighten: false) '
        'EXPECT $white.', () {
      expect(white.getShadeColor(lighten: false), white);
    });
    test(
        'FCE7.05: GIVEN $white.getShadeColor(lighten: false) '
        'EXPECT Color(0xffd9d9d9).', () {
      expect(white.getShadeColor(lighten: false, keepWhite: false),
          const Color(0xffd9d9d9));
    });
    test('FCE7.06: GIVEN $black.getShadeColor() EXPECT $black.', () {
      expect(black.getShadeColor(), black);
    });
    test(
        'FCE7.07: GIVEN $black.getShadeColor(lighten: false) '
        'EXPECT $black.', () {
      expect(black.getShadeColor(lighten: false), black);
    });
    test(
        'FCE7.08: GIVEN $black.getShadeColor(keepBlack: false) '
        'EXPECT Color(0xff262626).', () {
      expect(black.getShadeColor(keepBlack: false), const Color(0xff262626));
    });
    test(
        'FCE7.09: GIVEN $col1.getShadeColor(shadeValue: 20) '
        'EXPECT Color(0xffff1741).', () {
      expect(col1.getShadeColor(shadeValue: 20), const Color(0xffff1741));
    });
    test(
        'FCE7.10: GIVEN $col1.getShadeColor(shadeValue: 20, lighten: false) '
        'EXPECT Color(0xff4a000d).', () {
      expect(col1.getShadeColor(shadeValue: 20, lighten: false),
          const Color(0xff4a000d));
    });
    // test('FCE7.11: GIVEN <$nullColor>.getShadeColor() EXPECT <null>.', () {
    //   expect(nullColor!.getShadeColor(), null);
    // });
  });

  //****************************************************************************
  // FlexStringExtensions unit tests.
  //
  // Color.dotTail function, reference value and edge cases tests.
  //****************************************************************************
  group('FSE1: WITH String extension String.dotTail', () {
    const String enumStr1 = 'FlexColor.material';
    const String enumStr2 = 'FlexColor';
    const String enumStr3 = 'FlexColor.';
    const String enumStr4 = '.material';
    const String enumStr5 = 'FlexColor.1.2.hey';
    // const String? nullStr = null;
    test('FSE1.01: GIVEN "$enumStr1".dotTail EXPECT "material".', () {
      expect(enumStr1.dotTail, 'material');
    });
    test('FSE1.02: GIVEN "$enumStr2".dotTail EXPECT "FlexColor".', () {
      expect(enumStr2.dotTail, 'FlexColor');
    });
    test('FSE1.03: GIVEN "$enumStr3".dotTail EXPECT "".', () {
      expect(enumStr3.dotTail, '');
    });
    test('FSE1.04: GIVEN "$enumStr4".dotTail EXPECT "material".', () {
      expect(enumStr4.dotTail, 'material');
    });
    test('FSE1.05: GIVEN "$enumStr5".dotTail EXPECT "hey".', () {
      expect(enumStr5.dotTail, 'hey');
    });
    // test('FSE1.06: GIVEN <$nullStr>.dotTail EXPECT "".', () {
    //   expect(nullStr!.dotTail, '');
    // });
  });

  //****************************************************************************
  // FlexStringExtensions unit tests.
  //
  // Color.capitalize function, reference value and edge cases tests.
  //****************************************************************************
  group('FSE2: WITH String extension String.capitalize', () {
    const String str1 = 'hello you';
    const String str2 = 'HELLO you';
    const String str3 = 'h';
    const String str4 = '.mop floor';
    const String str5 = '';
    // const String? nullStr = null;
    test('FSE2.01: GIVEN "$str1".capitalize EXPECT "Hello you".', () {
      expect(str1.capitalize, 'Hello you');
    });
    test('FSE2.02: GIVEN "$str2".capitalize EXPECT "HELLO you".', () {
      expect(str2.capitalize, 'HELLO you');
    });
    test('FSE2.03: GIVEN "$str3".capitalize EXPECT "h".', () {
      expect(str3.capitalize, 'H');
    });
    test('FSE2.04: GIVEN "$str4".capitalize EXPECT ".mop floor".', () {
      expect(str4.capitalize, '.mop floor');
    });
    test('FSE2.05: GIVEN "$str5".capitalize EXPECT "".', () {
      expect(str5.capitalize, '');
    });
    // test('FSE2.06: GIVEN <$nullStr>.capitalize EXPECT <null>.', () {
    //   expect(nullStr!.capitalize, isNull);
    // });
  });

  //****************************************************************************
  // FlexStringExtensions unit tests.
  //
  // Color.toColor function, reference value and edge cases tests.
  //****************************************************************************
  group('FSE3: WITH String extension String.toColor', () {
    const String str1 = 'FF6200EE'; // -> Color(0xFF6200EE)
    const String str2 = 'F06200EE'; // -> Color(0xF06200EE)
    const String str3 = '0F6200EE'; // -> Color(0x0F6200EE)
    const String str4 = '006200EE'; // -> Color(0x006200EE)
    const String str5 = '6200EE'; // -> Color(0xFF6200EE)
    const String str6 = '#6200EE'; // -> Color(0xFF6200EE)
    const String str7 = '#620#0#EE'; // -> Color(0xFF6200EE)
    const String str8 = '#FF6200EE'; // -> Color(0xFF6200EE)
    const String str9 = '#0F620#0#EE'; // -> Color(0x0F6200EE)
    const String str10 = 'EE'; // -> Color(0xFF0000EE)
    const String str11 = '12Z456'; // -> Color(0xFF000000)
    const String str12 = '12Z45678'; // -> Color(0xFF000000)
    const String str13 = 'E'; // -> Color(0xFF00000E)
    const String str14 = 'AEE'; // -> Color(0xFF000AEE)
    const String str15 = 'A2EE'; // -> Color(0xFF00A2EE)
    const String str16 = '1234567C8910A'; // -> Color(0x67C8910A)
    const String str17 = '1#23#45#678#9#10A#'; // -> Color(0x5678910A)
    const String str18 = '0x1BCEE'; // -> Color(0xFF01BCEE)
    const String str19 = '0x841B0xCE0xE#'; // -> Color(0xF841BCEE)
    const String emptyStr = ''; // -> Color(0xFF000000)
    // const String? nullStr = null; // -> Color(0xFF000000)

    test('FSE3.01: GIVEN "$str1".toColor EXPECT "Color(0xFF6200EE)".', () {
      expect(str1.toColor, const Color(0xFF6200EE));
    });
    test('FSE3.02: GIVEN "$str2".toColor EXPECT "Color(0xF06200EE)".', () {
      expect(str2.toColor, const Color(0xF06200EE));
    });
    test('FSE3.03: GIVEN "$str3".toColor EXPECT "Color(0x0F6200EE)".', () {
      expect(str3.toColor, const Color(0x0F6200EE));
    });
    test('FSE3.04: GIVEN "$str4".toColor EXPECT "Color(0x006200EE)".', () {
      expect(str4.toColor, const Color(0x006200EE));
    });
    test('FSE3.05: GIVEN "$str5".toColor EXPECT "Color(0xFF6200EE)".', () {
      expect(str5.toColor, const Color(0xFF6200EE));
    });
    test('FSE3.06: GIVEN "$str6".toColor EXPECT "Color(0xFF6200EE)".', () {
      expect(str6.toColor, const Color(0xFF6200EE));
    });
    test('FSE3.07: GIVEN "$str7".toColor EXPECT "Color(0xFF6200EE)".', () {
      expect(str7.toColor, const Color(0xFF6200EE));
    });
    test('FSE3.08: GIVEN "$str8".toColor EXPECT "Color(0xFF6200EE)".', () {
      expect(str8.toColor, const Color(0xFF6200EE));
    });
    test('FSE3.09: GIVEN "$str9".toColor EXPECT "Color(0x0F6200EE)".', () {
      expect(str9.toColor, const Color(0x0F6200EE));
    });
    test('FSE3.10: GIVEN "$str10".toColor EXPECT "Color(0xFF0000EE)".', () {
      expect(str10.toColor, const Color(0xFF0000EE));
    });
    test('FSE3.11: GIVEN "$str11".toColor EXPECT "Color(0xFF000000)".', () {
      expect(str11.toColor, const Color(0xFF000000));
    });
    test('FSE3.12: GIVEN "$str12".toColor EXPECT "Color(0xFF000000)".', () {
      expect(str12.toColor, const Color(0xFF000000));
    });
    test('FSE3.13: GIVEN "$str13".toColor EXPECT "Color(0xFF00000E)".', () {
      expect(str13.toColor, const Color(0xFF00000E));
    });
    test('FSE3.14: GIVEN "$str14".toColor EXPECT "Color(0xFF000AEE)".', () {
      expect(str14.toColor, const Color(0xFF000AEE));
    });
    test('FSE3.15: GIVEN "$str15".toColor EXPECT "Color(0xFF00A2EE)".', () {
      expect(str15.toColor, const Color(0xFF00A2EE));
    });
    test('FSE3.16: GIVEN "$str16".toColor EXPECT "Color(0x67C8910A)".', () {
      expect(str16.toColor, const Color(0x67C8910A));
    });
    test('FSE3.17: GIVEN "$str17".toColor EXPECT "Color(0x5678910A)".', () {
      expect(str17.toColor, const Color(0x5678910A));
    });
    test('FSE3.18: GIVEN "$str18".toColor EXPECT "Color(0xFF01BCEE)".', () {
      expect(str18.toColor, const Color(0xFF01BCEE));
    });
    test('FSE3.19: GIVEN "$str19".toColor EXPECT "Color(0xF841BCEE)".', () {
      expect(str19.toColor, const Color(0xF841BCEE));
    });
    test('FSE3.20: GIVEN "$emptyStr".toColor EXPECT "Color(0xFF000000)".', () {
      expect(emptyStr.toColor, const Color(0xFF000000));
    });
    // test('FSE3.21: GIVEN "$nullStr".toColor EXP "Color(0xFF000000)".', () {
    //   expect(nullStr!.toColor, const Color(0xFF000000));
    // });
  });
}
