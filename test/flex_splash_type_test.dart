import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_instant_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexSplashType unit tests.
  //
  //****************************************************************************
  group('FS1: WITH FlexSplashType', () {
    test('FA1.01: test all splashFactory() types', () {
      expect(FlexSplashType.defaultSplash.splashFactory(), null);
      expect(FlexSplashType.inkSplash.splashFactory(), InkSplash.splashFactory);
      expect(FlexSplashType.inkRipple.splashFactory(), InkRipple.splashFactory);
      expect(FlexSplashType.noSplash.splashFactory(), NoSplash.splashFactory);
      expect(FlexSplashType.instantSplash.splashFactory(),
          FlexInstantSplash.splashFactory);
      //
      expect(
          FlexSplashType.inkSparkle.splashFactory(), InkSparkle.splashFactory);
      expect(FlexSplashType.inkSparkle.splashFactory(false, true),
          InkSplash.splashFactory);
      expect(FlexSplashType.inkSparkle.splashFactory(true, true),
          InkRipple.splashFactory);
      expect(FlexSplashType.inkSparkle.splashFactory(false, false),
          InkSparkle.splashFactory);
    });
  });
}
