// Named Shad*ColorScheme.light/dark factories are const constructors. Invoking them without `const` is required so coverage records the constructor bodies.
// ignore_for_file: prefer_const_constructors

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_blue_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_gray_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_green_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_neutral_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_orange_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_red_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_rose_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_slate_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_stone_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_violet_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_yellow_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_shad_colors/shad_zinc_color_scheme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void expectShadColors(
  ShadColorScheme scheme, {
  required Color background,
  required Color foreground,
  required Color card,
  required Color cardForeground,
  required Color popover,
  required Color popoverForeground,
  required Color primary,
  required Color primaryForeground,
  required Color secondary,
  required Color secondaryForeground,
  required Color muted,
  required Color mutedForeground,
  required Color accent,
  required Color accentForeground,
  required Color destructive,
  required Color destructiveForeground,
  required Color border,
  required Color input,
  required Color ring,
  required Color selection,
}) {
  expect(scheme.background, background);
  expect(scheme.foreground, foreground);
  expect(scheme.card, card);
  expect(scheme.cardForeground, cardForeground);
  expect(scheme.popover, popover);
  expect(scheme.popoverForeground, popoverForeground);
  expect(scheme.primary, primary);
  expect(scheme.primaryForeground, primaryForeground);
  expect(scheme.secondary, secondary);
  expect(scheme.secondaryForeground, secondaryForeground);
  expect(scheme.muted, muted);
  expect(scheme.mutedForeground, mutedForeground);
  expect(scheme.accent, accent);
  expect(scheme.accentForeground, accentForeground);
  expect(scheme.destructive, destructive);
  expect(scheme.destructiveForeground, destructiveForeground);
  expect(scheme.border, border);
  expect(scheme.input, input);
  expect(scheme.ring, ring);
  expect(scheme.selection, selection);
}

ShadColorScheme shadFrom({
  required Color background,
  required Color foreground,
  required Color card,
  required Color cardForeground,
  required Color popover,
  required Color popoverForeground,
  required Color primary,
  required Color primaryForeground,
  required Color secondary,
  required Color secondaryForeground,
  required Color muted,
  required Color mutedForeground,
  required Color accent,
  required Color accentForeground,
  required Color destructive,
  required Color destructiveForeground,
  required Color border,
  required Color input,
  required Color ring,
  required Color selection,
}) {
  return ShadColorScheme(
    background: background,
    foreground: foreground,
    card: card,
    cardForeground: cardForeground,
    popover: popover,
    popoverForeground: popoverForeground,
    primary: primary,
    primaryForeground: primaryForeground,
    secondary: secondary,
    secondaryForeground: secondaryForeground,
    muted: muted,
    mutedForeground: mutedForeground,
    accent: accent,
    accentForeground: accentForeground,
    destructive: destructive,
    destructiveForeground: destructiveForeground,
    border: border,
    input: input,
    ring: ring,
    selection: selection,
  );
}

void main() {
  group('FSCS1: WITH ShadColorScheme ', () {
    const ShadBlueColorScheme light = ShadBlueColorScheme.light();
    const ShadBlueColorScheme dark = ShadBlueColorScheme.dark();
    final ShadColorScheme sameColors = shadFrom(
      background: const Color(0xffffffff),
      foreground: const Color(0xff020817),
      card: const Color(0xffffffff),
      cardForeground: const Color(0xff020817),
      popover: const Color(0xffffffff),
      popoverForeground: const Color(0xff020817),
      primary: const Color(0xff2563eb),
      primaryForeground: const Color(0xfff8fafc),
      secondary: const Color(0xfff1f5f9),
      secondaryForeground: const Color(0xff0f172a),
      muted: const Color(0xfff1f5f9),
      mutedForeground: const Color(0xff64748b),
      accent: const Color(0xfff1f5f9),
      accentForeground: const Color(0xff0f172a),
      destructive: const Color(0xffef4444),
      destructiveForeground: const Color(0xfff8fafc),
      border: const Color(0xffe2e8f0),
      input: const Color(0xffe2e8f0),
      ring: const Color(0xff2563eb),
      selection: const Color(0xFFB4D7FF),
    );
    test('FSCS1.01: GIVEN the same ShadColorScheme object EXPECT equal', () {
      expect(light, equals(light));
    });
    test('FSCS1.02: GIVEN the same ShadColorScheme object EXPECT identity', () {
      expect(identical(light, light), isTrue);
    });
    test('FSCS1.03: GIVEN two equal ShadBlueColorScheme objects EXPECT equal', () {
      expect(light, equals(ShadBlueColorScheme.light()));
    });
    test('FSCS1.04: GIVEN light and dark ShadBlueColorScheme EXPECT unequal', () {
      expect(light, isNot(dark));
      expect(light == dark, isFalse);
    });
    test('FSCS1.05: GIVEN ShadColorScheme compared to a different type EXPECT unequal', () {
      expect(light == Object(), isFalse);
    });
    test('FSCS1.06: GIVEN ShadBlueColorScheme and ShadColorScheme with same colors EXPECT unequal runtimeType', () {
      expect(light == sameColors, isFalse);
    });
    test('FSCS1.07: GIVEN equal ShadBlueColorScheme objects EXPECT same hashCode', () {
      expect(light.hashCode, equals(ShadBlueColorScheme.light().hashCode));
    });
    test('FSCS1.08: GIVEN ShadColorScheme.lerp t=0 EXPECT a', () {
      expect(ShadColorScheme.lerp(light, dark, 0), equals(sameColors));
    });
    test('FSCS1.09: GIVEN ShadColorScheme.lerp t=1 EXPECT b', () {
      expect(
        ShadColorScheme.lerp(light, dark, 1),
        equals(
          shadFrom(
            background: const Color(0xff020817),
            foreground: const Color(0xfff8fafc),
            card: const Color(0xff020817),
            cardForeground: const Color(0xfff8fafc),
            popover: const Color(0xff020817),
            popoverForeground: const Color(0xfff8fafc),
            primary: const Color(0xff3b82f6),
            primaryForeground: const Color(0xff0f172a),
            secondary: const Color(0xff1e293b),
            secondaryForeground: const Color(0xfff8fafc),
            muted: const Color(0xff1e293b),
            mutedForeground: const Color(0xff94a3b8),
            accent: const Color(0xff1e293b),
            accentForeground: const Color(0xfff8fafc),
            destructive: const Color(0xff7f1d1d),
            destructiveForeground: const Color(0xfff8fafc),
            border: const Color(0xff1e293b),
            input: const Color(0xff1e293b),
            ring: const Color(0xff1d4ed8),
            selection: const Color(0xFF355172),
          ),
        ),
      );
    });
    test('FSCS1.10: GIVEN ShadColorScheme.lerp t=0.5 EXPECT midway colors', () {
      final ShadColorScheme mid = ShadColorScheme.lerp(light, dark, 0.5);
      expect(mid.background, Color.lerp(light.background, dark.background, 0.5));
      expect(mid.primary, Color.lerp(light.primary, dark.primary, 0.5));
      expect(mid.selection, Color.lerp(light.selection, dark.selection, 0.5));
      expect(mid.foreground, Color.lerp(light.foreground, dark.foreground, 0.5));
      expect(mid.card, Color.lerp(light.card, dark.card, 0.5));
      expect(mid.cardForeground, Color.lerp(light.cardForeground, dark.cardForeground, 0.5));
      expect(mid.popover, Color.lerp(light.popover, dark.popover, 0.5));
      expect(mid.popoverForeground, Color.lerp(light.popoverForeground, dark.popoverForeground, 0.5));
      expect(mid.primaryForeground, Color.lerp(light.primaryForeground, dark.primaryForeground, 0.5));
      expect(mid.secondary, Color.lerp(light.secondary, dark.secondary, 0.5));
      expect(mid.secondaryForeground, Color.lerp(light.secondaryForeground, dark.secondaryForeground, 0.5));
      expect(mid.muted, Color.lerp(light.muted, dark.muted, 0.5));
      expect(mid.mutedForeground, Color.lerp(light.mutedForeground, dark.mutedForeground, 0.5));
      expect(mid.accent, Color.lerp(light.accent, dark.accent, 0.5));
      expect(mid.accentForeground, Color.lerp(light.accentForeground, dark.accentForeground, 0.5));
      expect(mid.destructive, Color.lerp(light.destructive, dark.destructive, 0.5));
      expect(mid.destructiveForeground, Color.lerp(light.destructiveForeground, dark.destructiveForeground, 0.5));
      expect(mid.border, Color.lerp(light.border, dark.border, 0.5));
      expect(mid.input, Color.lerp(light.input, dark.input, 0.5));
      expect(mid.ring, Color.lerp(light.ring, dark.ring, 0.5));
    });
    test('FSCS1.11: Test toString implemented via debugFillProperties', () {
      expect(light.toString(), contains('ShadBlueColorScheme'));
      expect(sameColors.toString(), contains('ShadColorScheme'));
      expect(light.toString(), contains('background:'));
      expect(light.toString(), contains('foreground:'));
      expect(light.toString(), contains('card:'));
      expect(light.toString(), contains('cardForeground:'));
      expect(light.toString(), contains('popover:'));
      expect(light.toString(), contains('popoverForeground:'));
      expect(light.toString(), contains('primary:'));
      expect(light.toString(), contains('primaryForeground:'));
      expect(light.toString(), contains('secondary:'));
      expect(light.toString(), contains('secondaryForeground:'));
      expect(light.toString(), contains('muted:'));
      expect(light.toString(), contains('mutedForeground:'));
      expect(light.toString(), contains('accent:'));
      expect(light.toString(), contains('accentForeground:'));
      expect(light.toString(), contains('destructive:'));
      expect(light.toString(), contains('destructiveForeground:'));
      expect(light.toString(), contains('border:'));
      expect(light.toString(), contains('input:'));
      expect(light.toString(), contains('ring:'));
      expect(light.toString(), contains('selection:'));
    });
    test('FSCS1.12: Test toStringShort implemented via debugFillProperties', () {
      expect(light.toStringShort(), equalsIgnoringHashCodes('ShadBlueColorScheme#00000'));
    });
  });

  group('FSCS2: ShadBlueColorScheme token lock ', () {
    test('ShadBlueColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadBlueColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadBlueColorScheme.foregroundLight, const Color(0xff020817));
      expect(ShadBlueColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadBlueColorScheme.cardForegroundLight, const Color(0xff020817));
      expect(ShadBlueColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadBlueColorScheme.popoverForegroundLight, const Color(0xff020817));
      expect(ShadBlueColorScheme.primaryLight, const Color(0xff2563eb));
      expect(ShadBlueColorScheme.primaryForegroundLight, const Color(0xfff8fafc));
      expect(ShadBlueColorScheme.secondaryLight, const Color(0xfff1f5f9));
      expect(ShadBlueColorScheme.secondaryForegroundLight, const Color(0xff0f172a));
      expect(ShadBlueColorScheme.mutedLight, const Color(0xfff1f5f9));
      expect(ShadBlueColorScheme.mutedForegroundLight, const Color(0xff64748b));
      expect(ShadBlueColorScheme.accentLight, const Color(0xfff1f5f9));
      expect(ShadBlueColorScheme.accentForegroundLight, const Color(0xff0f172a));
      expect(ShadBlueColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadBlueColorScheme.destructiveForegroundLight, const Color(0xfff8fafc));
      expect(ShadBlueColorScheme.borderLight, const Color(0xffe2e8f0));
      expect(ShadBlueColorScheme.inputLight, const Color(0xffe2e8f0));
      expect(ShadBlueColorScheme.ringLight, const Color(0xff2563eb));
      expect(ShadBlueColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadBlueColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff020817),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff020817),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff020817),
        primary: const Color(0xff2563eb),
        primaryForeground: const Color(0xfff8fafc),
        secondary: const Color(0xfff1f5f9),
        secondaryForeground: const Color(0xff0f172a),
        muted: const Color(0xfff1f5f9),
        mutedForeground: const Color(0xff64748b),
        accent: const Color(0xfff1f5f9),
        accentForeground: const Color(0xff0f172a),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfff8fafc),
        border: const Color(0xffe2e8f0),
        input: const Color(0xffe2e8f0),
        ring: const Color(0xff2563eb),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadBlueColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadBlueColorScheme.backgroundDark, const Color(0xff020817));
      expect(ShadBlueColorScheme.foregroundDark, const Color(0xfff8fafc));
      expect(ShadBlueColorScheme.cardDark, const Color(0xff020817));
      expect(ShadBlueColorScheme.cardForegroundDark, const Color(0xfff8fafc));
      expect(ShadBlueColorScheme.popoverDark, const Color(0xff020817));
      expect(ShadBlueColorScheme.popoverForegroundDark, const Color(0xfff8fafc));
      expect(ShadBlueColorScheme.primaryDark, const Color(0xff3b82f6));
      expect(ShadBlueColorScheme.primaryForegroundDark, const Color(0xff0f172a));
      expect(ShadBlueColorScheme.secondaryDark, const Color(0xff1e293b));
      expect(ShadBlueColorScheme.secondaryForegroundDark, const Color(0xfff8fafc));
      expect(ShadBlueColorScheme.mutedDark, const Color(0xff1e293b));
      expect(ShadBlueColorScheme.mutedForegroundDark, const Color(0xff94a3b8));
      expect(ShadBlueColorScheme.accentDark, const Color(0xff1e293b));
      expect(ShadBlueColorScheme.accentForegroundDark, const Color(0xfff8fafc));
      expect(ShadBlueColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadBlueColorScheme.destructiveForegroundDark, const Color(0xfff8fafc));
      expect(ShadBlueColorScheme.borderDark, const Color(0xff1e293b));
      expect(ShadBlueColorScheme.inputDark, const Color(0xff1e293b));
      expect(ShadBlueColorScheme.ringDark, const Color(0xff1d4ed8));
      expect(ShadBlueColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadBlueColorScheme.dark(),
        background: const Color(0xff020817),
        foreground: const Color(0xfff8fafc),
        card: const Color(0xff020817),
        cardForeground: const Color(0xfff8fafc),
        popover: const Color(0xff020817),
        popoverForeground: const Color(0xfff8fafc),
        primary: const Color(0xff3b82f6),
        primaryForeground: const Color(0xff0f172a),
        secondary: const Color(0xff1e293b),
        secondaryForeground: const Color(0xfff8fafc),
        muted: const Color(0xff1e293b),
        mutedForeground: const Color(0xff94a3b8),
        accent: const Color(0xff1e293b),
        accentForeground: const Color(0xfff8fafc),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfff8fafc),
        border: const Color(0xff1e293b),
        input: const Color(0xff1e293b),
        ring: const Color(0xff1d4ed8),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadBlue maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadBlueName, 'Shadcn Blue');
      expect(FlexColor.shadBlueDescription, 'Shadcn blue based theme.');
      expect(FlexColor.shadBlue.light.primary, ShadBlueColorScheme.primaryLight);
      expect(FlexColor.shadBlue.light.primaryLightRef, ShadBlueColorScheme.primaryLight);
      expect(FlexColor.shadBlue.light.secondary, ShadBlueColorScheme.secondaryLight);
      expect(FlexColor.shadBlue.light.secondaryLightRef, ShadBlueColorScheme.secondaryLight);
      expect(FlexColor.shadBlue.light.tertiary, ShadBlueColorScheme.accentLight);
      expect(FlexColor.shadBlue.light.tertiaryLightRef, ShadBlueColorScheme.accentLight);
      expect(FlexColor.shadBlue.light.error, ShadBlueColorScheme.destructiveLight);
      expect(FlexColor.shadBlue.dark.primary, ShadBlueColorScheme.primaryDark);
      expect(FlexColor.shadBlue.dark.primaryLightRef, ShadBlueColorScheme.primaryLight);
      expect(FlexColor.shadBlue.dark.secondary, ShadBlueColorScheme.secondaryDark);
      expect(FlexColor.shadBlue.dark.secondaryLightRef, ShadBlueColorScheme.secondaryLight);
      expect(FlexColor.shadBlue.dark.tertiary, ShadBlueColorScheme.accentDark);
      expect(FlexColor.shadBlue.dark.tertiaryLightRef, ShadBlueColorScheme.accentLight);
      expect(FlexColor.shadBlue.dark.error, ShadBlueColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadBlue], FlexColor.shadBlue);
      expect(FlexColor.schemesList.contains(FlexColor.shadBlue), isTrue);
      expect(FlexScheme.shadBlue.data, FlexColor.shadBlue);
    });
  });

  group('FSCS2: ShadGrayColorScheme token lock ', () {
    test('ShadGrayColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadGrayColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadGrayColorScheme.foregroundLight, const Color(0xff030712));
      expect(ShadGrayColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadGrayColorScheme.cardForegroundLight, const Color(0xff030712));
      expect(ShadGrayColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadGrayColorScheme.popoverForegroundLight, const Color(0xff030712));
      expect(ShadGrayColorScheme.primaryLight, const Color(0xff111827));
      expect(ShadGrayColorScheme.primaryForegroundLight, const Color(0xfff9fafb));
      expect(ShadGrayColorScheme.secondaryLight, const Color(0xfff3f4f6));
      expect(ShadGrayColorScheme.secondaryForegroundLight, const Color(0xff111827));
      expect(ShadGrayColorScheme.mutedLight, const Color(0xfff3f4f6));
      expect(ShadGrayColorScheme.mutedForegroundLight, const Color(0xff6b7280));
      expect(ShadGrayColorScheme.accentLight, const Color(0xfff3f4f6));
      expect(ShadGrayColorScheme.accentForegroundLight, const Color(0xff111827));
      expect(ShadGrayColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadGrayColorScheme.destructiveForegroundLight, const Color(0xfff9fafb));
      expect(ShadGrayColorScheme.borderLight, const Color(0xffe5e7eb));
      expect(ShadGrayColorScheme.inputLight, const Color(0xffe5e7eb));
      expect(ShadGrayColorScheme.ringLight, const Color(0xff030712));
      expect(ShadGrayColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadGrayColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff030712),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff030712),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff030712),
        primary: const Color(0xff111827),
        primaryForeground: const Color(0xfff9fafb),
        secondary: const Color(0xfff3f4f6),
        secondaryForeground: const Color(0xff111827),
        muted: const Color(0xfff3f4f6),
        mutedForeground: const Color(0xff6b7280),
        accent: const Color(0xfff3f4f6),
        accentForeground: const Color(0xff111827),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfff9fafb),
        border: const Color(0xffe5e7eb),
        input: const Color(0xffe5e7eb),
        ring: const Color(0xff030712),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadGrayColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadGrayColorScheme.backgroundDark, const Color(0xff030712));
      expect(ShadGrayColorScheme.foregroundDark, const Color(0xfff9fafb));
      expect(ShadGrayColorScheme.cardDark, const Color(0xff030712));
      expect(ShadGrayColorScheme.cardForegroundDark, const Color(0xfff9fafb));
      expect(ShadGrayColorScheme.popoverDark, const Color(0xff030712));
      expect(ShadGrayColorScheme.popoverForegroundDark, const Color(0xfff9fafb));
      expect(ShadGrayColorScheme.primaryDark, const Color(0xfff9fafb));
      expect(ShadGrayColorScheme.primaryForegroundDark, const Color(0xff111827));
      expect(ShadGrayColorScheme.secondaryDark, const Color(0xff1f2937));
      expect(ShadGrayColorScheme.secondaryForegroundDark, const Color(0xfff9fafb));
      expect(ShadGrayColorScheme.mutedDark, const Color(0xff1f2937));
      expect(ShadGrayColorScheme.mutedForegroundDark, const Color(0xff9ca3af));
      expect(ShadGrayColorScheme.accentDark, const Color(0xff1f2937));
      expect(ShadGrayColorScheme.accentForegroundDark, const Color(0xfff9fafb));
      expect(ShadGrayColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadGrayColorScheme.destructiveForegroundDark, const Color(0xfff9fafb));
      expect(ShadGrayColorScheme.borderDark, const Color(0xff1f2937));
      expect(ShadGrayColorScheme.inputDark, const Color(0xff1f2937));
      expect(ShadGrayColorScheme.ringDark, const Color(0xffd1d5db));
      expect(ShadGrayColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadGrayColorScheme.dark(),
        background: const Color(0xff030712),
        foreground: const Color(0xfff9fafb),
        card: const Color(0xff030712),
        cardForeground: const Color(0xfff9fafb),
        popover: const Color(0xff030712),
        popoverForeground: const Color(0xfff9fafb),
        primary: const Color(0xfff9fafb),
        primaryForeground: const Color(0xff111827),
        secondary: const Color(0xff1f2937),
        secondaryForeground: const Color(0xfff9fafb),
        muted: const Color(0xff1f2937),
        mutedForeground: const Color(0xff9ca3af),
        accent: const Color(0xff1f2937),
        accentForeground: const Color(0xfff9fafb),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfff9fafb),
        border: const Color(0xff1f2937),
        input: const Color(0xff1f2937),
        ring: const Color(0xffd1d5db),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadGray maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadGrayName, 'Shadcn Gray');
      expect(FlexColor.shadGrayDescription, 'Shadcn gray based theme.');
      expect(FlexColor.shadGray.light.primary, ShadGrayColorScheme.primaryLight);
      expect(FlexColor.shadGray.light.primaryLightRef, ShadGrayColorScheme.primaryLight);
      expect(FlexColor.shadGray.light.secondary, ShadGrayColorScheme.secondaryLight);
      expect(FlexColor.shadGray.light.secondaryLightRef, ShadGrayColorScheme.secondaryLight);
      expect(FlexColor.shadGray.light.tertiary, ShadGrayColorScheme.accentLight);
      expect(FlexColor.shadGray.light.tertiaryLightRef, ShadGrayColorScheme.accentLight);
      expect(FlexColor.shadGray.light.error, ShadGrayColorScheme.destructiveLight);
      expect(FlexColor.shadGray.dark.primary, ShadGrayColorScheme.primaryDark);
      expect(FlexColor.shadGray.dark.primaryLightRef, ShadGrayColorScheme.primaryLight);
      expect(FlexColor.shadGray.dark.secondary, ShadGrayColorScheme.secondaryDark);
      expect(FlexColor.shadGray.dark.secondaryLightRef, ShadGrayColorScheme.secondaryLight);
      expect(FlexColor.shadGray.dark.tertiary, ShadGrayColorScheme.accentDark);
      expect(FlexColor.shadGray.dark.tertiaryLightRef, ShadGrayColorScheme.accentLight);
      expect(FlexColor.shadGray.dark.error, ShadGrayColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadGray], FlexColor.shadGray);
      expect(FlexColor.schemesList.contains(FlexColor.shadGray), isTrue);
      expect(FlexScheme.shadGray.data, FlexColor.shadGray);
    });
  });

  group('FSCS2: ShadGreenColorScheme token lock ', () {
    test('ShadGreenColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadGreenColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadGreenColorScheme.foregroundLight, const Color(0xff09090b));
      expect(ShadGreenColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadGreenColorScheme.cardForegroundLight, const Color(0xff09090b));
      expect(ShadGreenColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadGreenColorScheme.popoverForegroundLight, const Color(0xff09090b));
      expect(ShadGreenColorScheme.primaryLight, const Color(0xff16a34a));
      expect(ShadGreenColorScheme.primaryForegroundLight, const Color(0xfffff1f2));
      expect(ShadGreenColorScheme.secondaryLight, const Color(0xfff4f4f5));
      expect(ShadGreenColorScheme.secondaryForegroundLight, const Color(0xff18181b));
      expect(ShadGreenColorScheme.mutedLight, const Color(0xfff4f4f5));
      expect(ShadGreenColorScheme.mutedForegroundLight, const Color(0xff71717a));
      expect(ShadGreenColorScheme.accentLight, const Color(0xfff4f4f5));
      expect(ShadGreenColorScheme.accentForegroundLight, const Color(0xff18181b));
      expect(ShadGreenColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadGreenColorScheme.destructiveForegroundLight, const Color(0xfffafafa));
      expect(ShadGreenColorScheme.borderLight, const Color(0xffe4e4e7));
      expect(ShadGreenColorScheme.inputLight, const Color(0xffe4e4e7));
      expect(ShadGreenColorScheme.ringLight, const Color(0xff16a34a));
      expect(ShadGreenColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadGreenColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff09090b),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff09090b),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff09090b),
        primary: const Color(0xff16a34a),
        primaryForeground: const Color(0xfffff1f2),
        secondary: const Color(0xfff4f4f5),
        secondaryForeground: const Color(0xff18181b),
        muted: const Color(0xfff4f4f5),
        mutedForeground: const Color(0xff71717a),
        accent: const Color(0xfff4f4f5),
        accentForeground: const Color(0xff18181b),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfffafafa),
        border: const Color(0xffe4e4e7),
        input: const Color(0xffe4e4e7),
        ring: const Color(0xff16a34a),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadGreenColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadGreenColorScheme.backgroundDark, const Color(0xff0c0a09));
      expect(ShadGreenColorScheme.foregroundDark, const Color(0xfff2f2f2));
      expect(ShadGreenColorScheme.cardDark, const Color(0xff1c1917));
      expect(ShadGreenColorScheme.cardForegroundDark, const Color(0xfff2f2f2));
      expect(ShadGreenColorScheme.popoverDark, const Color(0xff171717));
      expect(ShadGreenColorScheme.popoverForegroundDark, const Color(0xfff2f2f2));
      expect(ShadGreenColorScheme.primaryDark, const Color(0xff22c55e));
      expect(ShadGreenColorScheme.primaryForegroundDark, const Color(0xff052e16));
      expect(ShadGreenColorScheme.secondaryDark, const Color(0xff27272a));
      expect(ShadGreenColorScheme.secondaryForegroundDark, const Color(0xfffafafa));
      expect(ShadGreenColorScheme.mutedDark, const Color(0xff262626));
      expect(ShadGreenColorScheme.mutedForegroundDark, const Color(0xffa1a1aa));
      expect(ShadGreenColorScheme.accentDark, const Color(0xff292524));
      expect(ShadGreenColorScheme.accentForegroundDark, const Color(0xfffafafa));
      expect(ShadGreenColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadGreenColorScheme.destructiveForegroundDark, const Color(0xfffef2f2));
      expect(ShadGreenColorScheme.borderDark, const Color(0xff27272a));
      expect(ShadGreenColorScheme.inputDark, const Color(0xff27272a));
      expect(ShadGreenColorScheme.ringDark, const Color(0xff15803d));
      expect(ShadGreenColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadGreenColorScheme.dark(),
        background: const Color(0xff0c0a09),
        foreground: const Color(0xfff2f2f2),
        card: const Color(0xff1c1917),
        cardForeground: const Color(0xfff2f2f2),
        popover: const Color(0xff171717),
        popoverForeground: const Color(0xfff2f2f2),
        primary: const Color(0xff22c55e),
        primaryForeground: const Color(0xff052e16),
        secondary: const Color(0xff27272a),
        secondaryForeground: const Color(0xfffafafa),
        muted: const Color(0xff262626),
        mutedForeground: const Color(0xffa1a1aa),
        accent: const Color(0xff292524),
        accentForeground: const Color(0xfffafafa),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfffef2f2),
        border: const Color(0xff27272a),
        input: const Color(0xff27272a),
        ring: const Color(0xff15803d),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadGreen maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadGreenName, 'Shadcn Green');
      expect(FlexColor.shadGreenDescription, 'Shadcn green based theme.');
      expect(FlexColor.shadGreen.light.primary, ShadGreenColorScheme.primaryLight);
      expect(FlexColor.shadGreen.light.primaryLightRef, ShadGreenColorScheme.primaryLight);
      expect(FlexColor.shadGreen.light.secondary, ShadGreenColorScheme.secondaryLight);
      expect(FlexColor.shadGreen.light.secondaryLightRef, ShadGreenColorScheme.secondaryLight);
      expect(FlexColor.shadGreen.light.tertiary, ShadGreenColorScheme.accentLight);
      expect(FlexColor.shadGreen.light.tertiaryLightRef, ShadGreenColorScheme.accentLight);
      expect(FlexColor.shadGreen.light.error, ShadGreenColorScheme.destructiveLight);
      expect(FlexColor.shadGreen.dark.primary, ShadGreenColorScheme.primaryDark);
      expect(FlexColor.shadGreen.dark.primaryLightRef, ShadGreenColorScheme.primaryLight);
      expect(FlexColor.shadGreen.dark.secondary, ShadGreenColorScheme.secondaryDark);
      expect(FlexColor.shadGreen.dark.secondaryLightRef, ShadGreenColorScheme.secondaryLight);
      expect(FlexColor.shadGreen.dark.tertiary, ShadGreenColorScheme.accentDark);
      expect(FlexColor.shadGreen.dark.tertiaryLightRef, ShadGreenColorScheme.accentLight);
      expect(FlexColor.shadGreen.dark.error, ShadGreenColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadGreen], FlexColor.shadGreen);
      expect(FlexColor.schemesList.contains(FlexColor.shadGreen), isTrue);
      expect(FlexScheme.shadGreen.data, FlexColor.shadGreen);
    });
  });

  group('FSCS2: ShadNeutralColorScheme token lock ', () {
    test('ShadNeutralColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadNeutralColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadNeutralColorScheme.foregroundLight, const Color(0xff0a0a0a));
      expect(ShadNeutralColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadNeutralColorScheme.cardForegroundLight, const Color(0xff0a0a0a));
      expect(ShadNeutralColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadNeutralColorScheme.popoverForegroundLight, const Color(0xff0a0a0a));
      expect(ShadNeutralColorScheme.primaryLight, const Color(0xff171717));
      expect(ShadNeutralColorScheme.primaryForegroundLight, const Color(0xfffafafa));
      expect(ShadNeutralColorScheme.secondaryLight, const Color(0xfff5f5f5));
      expect(ShadNeutralColorScheme.secondaryForegroundLight, const Color(0xff171717));
      expect(ShadNeutralColorScheme.mutedLight, const Color(0xfff5f5f5));
      expect(ShadNeutralColorScheme.mutedForegroundLight, const Color(0xff737373));
      expect(ShadNeutralColorScheme.accentLight, const Color(0xfff5f5f5));
      expect(ShadNeutralColorScheme.accentForegroundLight, const Color(0xff171717));
      expect(ShadNeutralColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadNeutralColorScheme.destructiveForegroundLight, const Color(0xfffafafa));
      expect(ShadNeutralColorScheme.borderLight, const Color(0xffe5e5e5));
      expect(ShadNeutralColorScheme.inputLight, const Color(0xffe5e5e5));
      expect(ShadNeutralColorScheme.ringLight, const Color(0xff0a0a0a));
      expect(ShadNeutralColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadNeutralColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff0a0a0a),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff0a0a0a),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff0a0a0a),
        primary: const Color(0xff171717),
        primaryForeground: const Color(0xfffafafa),
        secondary: const Color(0xfff5f5f5),
        secondaryForeground: const Color(0xff171717),
        muted: const Color(0xfff5f5f5),
        mutedForeground: const Color(0xff737373),
        accent: const Color(0xfff5f5f5),
        accentForeground: const Color(0xff171717),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfffafafa),
        border: const Color(0xffe5e5e5),
        input: const Color(0xffe5e5e5),
        ring: const Color(0xff0a0a0a),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadNeutralColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadNeutralColorScheme.backgroundDark, const Color(0xff0a0a0a));
      expect(ShadNeutralColorScheme.foregroundDark, const Color(0xfffafafa));
      expect(ShadNeutralColorScheme.cardDark, const Color(0xff0a0a0a));
      expect(ShadNeutralColorScheme.cardForegroundDark, const Color(0xfffafafa));
      expect(ShadNeutralColorScheme.popoverDark, const Color(0xff0a0a0a));
      expect(ShadNeutralColorScheme.popoverForegroundDark, const Color(0xfffafafa));
      expect(ShadNeutralColorScheme.primaryDark, const Color(0xfffafafa));
      expect(ShadNeutralColorScheme.primaryForegroundDark, const Color(0xff171717));
      expect(ShadNeutralColorScheme.secondaryDark, const Color(0xff262626));
      expect(ShadNeutralColorScheme.secondaryForegroundDark, const Color(0xfffafafa));
      expect(ShadNeutralColorScheme.mutedDark, const Color(0xff262626));
      expect(ShadNeutralColorScheme.mutedForegroundDark, const Color(0xffa3a3a3));
      expect(ShadNeutralColorScheme.accentDark, const Color(0xff262626));
      expect(ShadNeutralColorScheme.accentForegroundDark, const Color(0xfffafafa));
      expect(ShadNeutralColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadNeutralColorScheme.destructiveForegroundDark, const Color(0xfffafafa));
      expect(ShadNeutralColorScheme.borderDark, const Color(0xff262626));
      expect(ShadNeutralColorScheme.inputDark, const Color(0xff262626));
      expect(ShadNeutralColorScheme.ringDark, const Color(0xffd4d4d4));
      expect(ShadNeutralColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadNeutralColorScheme.dark(),
        background: const Color(0xff0a0a0a),
        foreground: const Color(0xfffafafa),
        card: const Color(0xff0a0a0a),
        cardForeground: const Color(0xfffafafa),
        popover: const Color(0xff0a0a0a),
        popoverForeground: const Color(0xfffafafa),
        primary: const Color(0xfffafafa),
        primaryForeground: const Color(0xff171717),
        secondary: const Color(0xff262626),
        secondaryForeground: const Color(0xfffafafa),
        muted: const Color(0xff262626),
        mutedForeground: const Color(0xffa3a3a3),
        accent: const Color(0xff262626),
        accentForeground: const Color(0xfffafafa),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfffafafa),
        border: const Color(0xff262626),
        input: const Color(0xff262626),
        ring: const Color(0xffd4d4d4),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadNeutral maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadNeutralName, 'Shadcn Neutral');
      expect(FlexColor.shadNeutralDescription, 'Shadcn neutral based theme.');
      expect(FlexColor.shadNeutral.light.primary, ShadNeutralColorScheme.primaryLight);
      expect(FlexColor.shadNeutral.light.primaryLightRef, ShadNeutralColorScheme.primaryLight);
      expect(FlexColor.shadNeutral.light.secondary, ShadNeutralColorScheme.secondaryLight);
      expect(FlexColor.shadNeutral.light.secondaryLightRef, ShadNeutralColorScheme.secondaryLight);
      expect(FlexColor.shadNeutral.light.tertiary, ShadNeutralColorScheme.accentLight);
      expect(FlexColor.shadNeutral.light.tertiaryLightRef, ShadNeutralColorScheme.accentLight);
      expect(FlexColor.shadNeutral.light.error, ShadNeutralColorScheme.destructiveLight);
      expect(FlexColor.shadNeutral.dark.primary, ShadNeutralColorScheme.primaryDark);
      expect(FlexColor.shadNeutral.dark.primaryLightRef, ShadNeutralColorScheme.primaryLight);
      expect(FlexColor.shadNeutral.dark.secondary, ShadNeutralColorScheme.secondaryDark);
      expect(FlexColor.shadNeutral.dark.secondaryLightRef, ShadNeutralColorScheme.secondaryLight);
      expect(FlexColor.shadNeutral.dark.tertiary, ShadNeutralColorScheme.accentDark);
      expect(FlexColor.shadNeutral.dark.tertiaryLightRef, ShadNeutralColorScheme.accentLight);
      expect(FlexColor.shadNeutral.dark.error, ShadNeutralColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadNeutral], FlexColor.shadNeutral);
      expect(FlexColor.schemesList.contains(FlexColor.shadNeutral), isTrue);
      expect(FlexScheme.shadNeutral.data, FlexColor.shadNeutral);
    });
  });

  group('FSCS2: ShadOrangeColorScheme token lock ', () {
    test('ShadOrangeColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadOrangeColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadOrangeColorScheme.foregroundLight, const Color(0xff0c0a09));
      expect(ShadOrangeColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadOrangeColorScheme.cardForegroundLight, const Color(0xff0c0a09));
      expect(ShadOrangeColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadOrangeColorScheme.popoverForegroundLight, const Color(0xff0c0a09));
      expect(ShadOrangeColorScheme.primaryLight, const Color(0xfff97316));
      expect(ShadOrangeColorScheme.primaryForegroundLight, const Color(0xfffafaf9));
      expect(ShadOrangeColorScheme.secondaryLight, const Color(0xfff5f5f4));
      expect(ShadOrangeColorScheme.secondaryForegroundLight, const Color(0xff1c1917));
      expect(ShadOrangeColorScheme.mutedLight, const Color(0xfff5f5f4));
      expect(ShadOrangeColorScheme.mutedForegroundLight, const Color(0xff78716c));
      expect(ShadOrangeColorScheme.accentLight, const Color(0xfff5f5f4));
      expect(ShadOrangeColorScheme.accentForegroundLight, const Color(0xff1c1917));
      expect(ShadOrangeColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadOrangeColorScheme.destructiveForegroundLight, const Color(0xfffafaf9));
      expect(ShadOrangeColorScheme.borderLight, const Color(0xffe7e5e4));
      expect(ShadOrangeColorScheme.inputLight, const Color(0xffe7e5e4));
      expect(ShadOrangeColorScheme.ringLight, const Color(0xfff97316));
      expect(ShadOrangeColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadOrangeColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff0c0a09),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff0c0a09),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff0c0a09),
        primary: const Color(0xfff97316),
        primaryForeground: const Color(0xfffafaf9),
        secondary: const Color(0xfff5f5f4),
        secondaryForeground: const Color(0xff1c1917),
        muted: const Color(0xfff5f5f4),
        mutedForeground: const Color(0xff78716c),
        accent: const Color(0xfff5f5f4),
        accentForeground: const Color(0xff1c1917),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfffafaf9),
        border: const Color(0xffe7e5e4),
        input: const Color(0xffe7e5e4),
        ring: const Color(0xfff97316),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadOrangeColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadOrangeColorScheme.backgroundDark, const Color(0xff0c0a09));
      expect(ShadOrangeColorScheme.foregroundDark, const Color(0xfffafaf9));
      expect(ShadOrangeColorScheme.cardDark, const Color(0xff0c0a09));
      expect(ShadOrangeColorScheme.cardForegroundDark, const Color(0xfffafaf9));
      expect(ShadOrangeColorScheme.popoverDark, const Color(0xff0c0a09));
      expect(ShadOrangeColorScheme.popoverForegroundDark, const Color(0xfffafaf9));
      expect(ShadOrangeColorScheme.primaryDark, const Color(0xffea580c));
      expect(ShadOrangeColorScheme.primaryForegroundDark, const Color(0xfffafaf9));
      expect(ShadOrangeColorScheme.secondaryDark, const Color(0xff292524));
      expect(ShadOrangeColorScheme.secondaryForegroundDark, const Color(0xfffafaf9));
      expect(ShadOrangeColorScheme.mutedDark, const Color(0xff292524));
      expect(ShadOrangeColorScheme.mutedForegroundDark, const Color(0xffa8a29e));
      expect(ShadOrangeColorScheme.accentDark, const Color(0xff292524));
      expect(ShadOrangeColorScheme.accentForegroundDark, const Color(0xfffafaf9));
      expect(ShadOrangeColorScheme.destructiveDark, const Color(0xffdc2626));
      expect(ShadOrangeColorScheme.destructiveForegroundDark, const Color(0xfffafaf9));
      expect(ShadOrangeColorScheme.borderDark, const Color(0xff292524));
      expect(ShadOrangeColorScheme.inputDark, const Color(0xff292524));
      expect(ShadOrangeColorScheme.ringDark, const Color(0xffea580c));
      expect(ShadOrangeColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadOrangeColorScheme.dark(),
        background: const Color(0xff0c0a09),
        foreground: const Color(0xfffafaf9),
        card: const Color(0xff0c0a09),
        cardForeground: const Color(0xfffafaf9),
        popover: const Color(0xff0c0a09),
        popoverForeground: const Color(0xfffafaf9),
        primary: const Color(0xffea580c),
        primaryForeground: const Color(0xfffafaf9),
        secondary: const Color(0xff292524),
        secondaryForeground: const Color(0xfffafaf9),
        muted: const Color(0xff292524),
        mutedForeground: const Color(0xffa8a29e),
        accent: const Color(0xff292524),
        accentForeground: const Color(0xfffafaf9),
        destructive: const Color(0xffdc2626),
        destructiveForeground: const Color(0xfffafaf9),
        border: const Color(0xff292524),
        input: const Color(0xff292524),
        ring: const Color(0xffea580c),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadOrange maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadOrangeName, 'Shadcn Orange');
      expect(FlexColor.shadOrangeDescription, 'Shadcn orange based theme.');
      expect(FlexColor.shadOrange.light.primary, ShadOrangeColorScheme.primaryLight);
      expect(FlexColor.shadOrange.light.primaryLightRef, ShadOrangeColorScheme.primaryLight);
      expect(FlexColor.shadOrange.light.secondary, ShadOrangeColorScheme.secondaryLight);
      expect(FlexColor.shadOrange.light.secondaryLightRef, ShadOrangeColorScheme.secondaryLight);
      expect(FlexColor.shadOrange.light.tertiary, ShadOrangeColorScheme.accentLight);
      expect(FlexColor.shadOrange.light.tertiaryLightRef, ShadOrangeColorScheme.accentLight);
      expect(FlexColor.shadOrange.light.error, ShadOrangeColorScheme.destructiveLight);
      expect(FlexColor.shadOrange.dark.primary, ShadOrangeColorScheme.primaryDark);
      expect(FlexColor.shadOrange.dark.primaryLightRef, ShadOrangeColorScheme.primaryLight);
      expect(FlexColor.shadOrange.dark.secondary, ShadOrangeColorScheme.secondaryDark);
      expect(FlexColor.shadOrange.dark.secondaryLightRef, ShadOrangeColorScheme.secondaryLight);
      expect(FlexColor.shadOrange.dark.tertiary, ShadOrangeColorScheme.accentDark);
      expect(FlexColor.shadOrange.dark.tertiaryLightRef, ShadOrangeColorScheme.accentLight);
      expect(FlexColor.shadOrange.dark.error, ShadOrangeColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadOrange], FlexColor.shadOrange);
      expect(FlexColor.schemesList.contains(FlexColor.shadOrange), isTrue);
      expect(FlexScheme.shadOrange.data, FlexColor.shadOrange);
    });
  });

  group('FSCS2: ShadRedColorScheme token lock ', () {
    test('ShadRedColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadRedColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadRedColorScheme.foregroundLight, const Color(0xff0a0a0a));
      expect(ShadRedColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadRedColorScheme.cardForegroundLight, const Color(0xff0a0a0a));
      expect(ShadRedColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadRedColorScheme.popoverForegroundLight, const Color(0xff0a0a0a));
      expect(ShadRedColorScheme.primaryLight, const Color(0xffdc2626));
      expect(ShadRedColorScheme.primaryForegroundLight, const Color(0xfffef2f2));
      expect(ShadRedColorScheme.secondaryLight, const Color(0xfff5f5f5));
      expect(ShadRedColorScheme.secondaryForegroundLight, const Color(0xff171717));
      expect(ShadRedColorScheme.mutedLight, const Color(0xfff5f5f5));
      expect(ShadRedColorScheme.mutedForegroundLight, const Color(0xff737373));
      expect(ShadRedColorScheme.accentLight, const Color(0xfff5f5f5));
      expect(ShadRedColorScheme.accentForegroundLight, const Color(0xff171717));
      expect(ShadRedColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadRedColorScheme.destructiveForegroundLight, const Color(0xfffafafa));
      expect(ShadRedColorScheme.borderLight, const Color(0xffe5e5e5));
      expect(ShadRedColorScheme.inputLight, const Color(0xffe5e5e5));
      expect(ShadRedColorScheme.ringLight, const Color(0xffdc2626));
      expect(ShadRedColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadRedColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff0a0a0a),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff0a0a0a),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff0a0a0a),
        primary: const Color(0xffdc2626),
        primaryForeground: const Color(0xfffef2f2),
        secondary: const Color(0xfff5f5f5),
        secondaryForeground: const Color(0xff171717),
        muted: const Color(0xfff5f5f5),
        mutedForeground: const Color(0xff737373),
        accent: const Color(0xfff5f5f5),
        accentForeground: const Color(0xff171717),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfffafafa),
        border: const Color(0xffe5e5e5),
        input: const Color(0xffe5e5e5),
        ring: const Color(0xffdc2626),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadRedColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadRedColorScheme.backgroundDark, const Color(0xff0a0a0a));
      expect(ShadRedColorScheme.foregroundDark, const Color(0xfffafafa));
      expect(ShadRedColorScheme.cardDark, const Color(0xff0a0a0a));
      expect(ShadRedColorScheme.cardForegroundDark, const Color(0xfffafafa));
      expect(ShadRedColorScheme.popoverDark, const Color(0xff0a0a0a));
      expect(ShadRedColorScheme.popoverForegroundDark, const Color(0xfffafafa));
      expect(ShadRedColorScheme.primaryDark, const Color(0xffdc2626));
      expect(ShadRedColorScheme.primaryForegroundDark, const Color(0xfffef2f2));
      expect(ShadRedColorScheme.secondaryDark, const Color(0xff262626));
      expect(ShadRedColorScheme.secondaryForegroundDark, const Color(0xfffafafa));
      expect(ShadRedColorScheme.mutedDark, const Color(0xff262626));
      expect(ShadRedColorScheme.mutedForegroundDark, const Color(0xffa3a3a3));
      expect(ShadRedColorScheme.accentDark, const Color(0xff262626));
      expect(ShadRedColorScheme.accentForegroundDark, const Color(0xfffafafa));
      expect(ShadRedColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadRedColorScheme.destructiveForegroundDark, const Color(0xfffafafa));
      expect(ShadRedColorScheme.borderDark, const Color(0xff262626));
      expect(ShadRedColorScheme.inputDark, const Color(0xff262626));
      expect(ShadRedColorScheme.ringDark, const Color(0xffdc2626));
      expect(ShadRedColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadRedColorScheme.dark(),
        background: const Color(0xff0a0a0a),
        foreground: const Color(0xfffafafa),
        card: const Color(0xff0a0a0a),
        cardForeground: const Color(0xfffafafa),
        popover: const Color(0xff0a0a0a),
        popoverForeground: const Color(0xfffafafa),
        primary: const Color(0xffdc2626),
        primaryForeground: const Color(0xfffef2f2),
        secondary: const Color(0xff262626),
        secondaryForeground: const Color(0xfffafafa),
        muted: const Color(0xff262626),
        mutedForeground: const Color(0xffa3a3a3),
        accent: const Color(0xff262626),
        accentForeground: const Color(0xfffafafa),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfffafafa),
        border: const Color(0xff262626),
        input: const Color(0xff262626),
        ring: const Color(0xffdc2626),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadRed maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadRedName, 'Shadcn Red');
      expect(FlexColor.shadRedDescription, 'Shadcn red based theme.');
      expect(FlexColor.shadRed.light.primary, ShadRedColorScheme.primaryLight);
      expect(FlexColor.shadRed.light.primaryLightRef, ShadRedColorScheme.primaryLight);
      expect(FlexColor.shadRed.light.secondary, ShadRedColorScheme.secondaryLight);
      expect(FlexColor.shadRed.light.secondaryLightRef, ShadRedColorScheme.secondaryLight);
      expect(FlexColor.shadRed.light.tertiary, ShadRedColorScheme.accentLight);
      expect(FlexColor.shadRed.light.tertiaryLightRef, ShadRedColorScheme.accentLight);
      expect(FlexColor.shadRed.light.error, ShadRedColorScheme.destructiveLight);
      expect(FlexColor.shadRed.dark.primary, ShadRedColorScheme.primaryDark);
      expect(FlexColor.shadRed.dark.primaryLightRef, ShadRedColorScheme.primaryLight);
      expect(FlexColor.shadRed.dark.secondary, ShadRedColorScheme.secondaryDark);
      expect(FlexColor.shadRed.dark.secondaryLightRef, ShadRedColorScheme.secondaryLight);
      expect(FlexColor.shadRed.dark.tertiary, ShadRedColorScheme.accentDark);
      expect(FlexColor.shadRed.dark.tertiaryLightRef, ShadRedColorScheme.accentLight);
      expect(FlexColor.shadRed.dark.error, ShadRedColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadRed], FlexColor.shadRed);
      expect(FlexColor.schemesList.contains(FlexColor.shadRed), isTrue);
      expect(FlexScheme.shadRed.data, FlexColor.shadRed);
    });
  });

  group('FSCS2: ShadRoseColorScheme token lock ', () {
    test('ShadRoseColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadRoseColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadRoseColorScheme.foregroundLight, const Color(0xff09090b));
      expect(ShadRoseColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadRoseColorScheme.cardForegroundLight, const Color(0xff09090b));
      expect(ShadRoseColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadRoseColorScheme.popoverForegroundLight, const Color(0xff09090b));
      expect(ShadRoseColorScheme.primaryLight, const Color(0xffe11d48));
      expect(ShadRoseColorScheme.primaryForegroundLight, const Color(0xfffff1f2));
      expect(ShadRoseColorScheme.secondaryLight, const Color(0xfff4f4f5));
      expect(ShadRoseColorScheme.secondaryForegroundLight, const Color(0xff18181b));
      expect(ShadRoseColorScheme.mutedLight, const Color(0xfff4f4f5));
      expect(ShadRoseColorScheme.mutedForegroundLight, const Color(0xff71717a));
      expect(ShadRoseColorScheme.accentLight, const Color(0xfff4f4f5));
      expect(ShadRoseColorScheme.accentForegroundLight, const Color(0xff18181b));
      expect(ShadRoseColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadRoseColorScheme.destructiveForegroundLight, const Color(0xfffafafa));
      expect(ShadRoseColorScheme.borderLight, const Color(0xffe4e4e7));
      expect(ShadRoseColorScheme.inputLight, const Color(0xffe4e4e7));
      expect(ShadRoseColorScheme.ringLight, const Color(0xffe11d48));
      expect(ShadRoseColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadRoseColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff09090b),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff09090b),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff09090b),
        primary: const Color(0xffe11d48),
        primaryForeground: const Color(0xfffff1f2),
        secondary: const Color(0xfff4f4f5),
        secondaryForeground: const Color(0xff18181b),
        muted: const Color(0xfff4f4f5),
        mutedForeground: const Color(0xff71717a),
        accent: const Color(0xfff4f4f5),
        accentForeground: const Color(0xff18181b),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfffafafa),
        border: const Color(0xffe4e4e7),
        input: const Color(0xffe4e4e7),
        ring: const Color(0xffe11d48),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadRoseColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadRoseColorScheme.backgroundDark, const Color(0xff0c0a09));
      expect(ShadRoseColorScheme.foregroundDark, const Color(0xfff2f2f2));
      expect(ShadRoseColorScheme.cardDark, const Color(0xff1c1917));
      expect(ShadRoseColorScheme.cardForegroundDark, const Color(0xfff2f2f2));
      expect(ShadRoseColorScheme.popoverDark, const Color(0xff171717));
      expect(ShadRoseColorScheme.popoverForegroundDark, const Color(0xfff2f2f2));
      expect(ShadRoseColorScheme.primaryDark, const Color(0xffe11d48));
      expect(ShadRoseColorScheme.primaryForegroundDark, const Color(0xfffff1f2));
      expect(ShadRoseColorScheme.secondaryDark, const Color(0xff27272a));
      expect(ShadRoseColorScheme.secondaryForegroundDark, const Color(0xfffafafa));
      expect(ShadRoseColorScheme.mutedDark, const Color(0xff262626));
      expect(ShadRoseColorScheme.mutedForegroundDark, const Color(0xffa1a1aa));
      expect(ShadRoseColorScheme.accentDark, const Color(0xff292524));
      expect(ShadRoseColorScheme.accentForegroundDark, const Color(0xfffafafa));
      expect(ShadRoseColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadRoseColorScheme.destructiveForegroundDark, const Color(0xfffef2f2));
      expect(ShadRoseColorScheme.borderDark, const Color(0xff27272a));
      expect(ShadRoseColorScheme.inputDark, const Color(0xff27272a));
      expect(ShadRoseColorScheme.ringDark, const Color(0xffe11d48));
      expect(ShadRoseColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadRoseColorScheme.dark(),
        background: const Color(0xff0c0a09),
        foreground: const Color(0xfff2f2f2),
        card: const Color(0xff1c1917),
        cardForeground: const Color(0xfff2f2f2),
        popover: const Color(0xff171717),
        popoverForeground: const Color(0xfff2f2f2),
        primary: const Color(0xffe11d48),
        primaryForeground: const Color(0xfffff1f2),
        secondary: const Color(0xff27272a),
        secondaryForeground: const Color(0xfffafafa),
        muted: const Color(0xff262626),
        mutedForeground: const Color(0xffa1a1aa),
        accent: const Color(0xff292524),
        accentForeground: const Color(0xfffafafa),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfffef2f2),
        border: const Color(0xff27272a),
        input: const Color(0xff27272a),
        ring: const Color(0xffe11d48),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadRose maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadRoseName, 'Shadcn Rose');
      expect(FlexColor.shadRoseDescription, 'Shadcn rose based theme.');
      expect(FlexColor.shadRose.light.primary, ShadRoseColorScheme.primaryLight);
      expect(FlexColor.shadRose.light.primaryLightRef, ShadRoseColorScheme.primaryLight);
      expect(FlexColor.shadRose.light.secondary, ShadRoseColorScheme.secondaryLight);
      expect(FlexColor.shadRose.light.secondaryLightRef, ShadRoseColorScheme.secondaryLight);
      expect(FlexColor.shadRose.light.tertiary, ShadRoseColorScheme.accentLight);
      expect(FlexColor.shadRose.light.tertiaryLightRef, ShadRoseColorScheme.accentLight);
      expect(FlexColor.shadRose.light.error, ShadRoseColorScheme.destructiveLight);
      expect(FlexColor.shadRose.dark.primary, ShadRoseColorScheme.primaryDark);
      expect(FlexColor.shadRose.dark.primaryLightRef, ShadRoseColorScheme.primaryLight);
      expect(FlexColor.shadRose.dark.secondary, ShadRoseColorScheme.secondaryDark);
      expect(FlexColor.shadRose.dark.secondaryLightRef, ShadRoseColorScheme.secondaryLight);
      expect(FlexColor.shadRose.dark.tertiary, ShadRoseColorScheme.accentDark);
      expect(FlexColor.shadRose.dark.tertiaryLightRef, ShadRoseColorScheme.accentLight);
      expect(FlexColor.shadRose.dark.error, ShadRoseColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadRose], FlexColor.shadRose);
      expect(FlexColor.schemesList.contains(FlexColor.shadRose), isTrue);
      expect(FlexScheme.shadRose.data, FlexColor.shadRose);
    });
  });

  group('FSCS2: ShadSlateColorScheme token lock ', () {
    test('ShadSlateColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadSlateColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadSlateColorScheme.foregroundLight, const Color(0xff020817));
      expect(ShadSlateColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadSlateColorScheme.cardForegroundLight, const Color(0xff020817));
      expect(ShadSlateColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadSlateColorScheme.popoverForegroundLight, const Color(0xff020817));
      expect(ShadSlateColorScheme.primaryLight, const Color(0xff0f172a));
      expect(ShadSlateColorScheme.primaryForegroundLight, const Color(0xfff8fafc));
      expect(ShadSlateColorScheme.secondaryLight, const Color(0xfff1f5f9));
      expect(ShadSlateColorScheme.secondaryForegroundLight, const Color(0xff0f172a));
      expect(ShadSlateColorScheme.mutedLight, const Color(0xfff1f5f9));
      expect(ShadSlateColorScheme.mutedForegroundLight, const Color(0xff64748b));
      expect(ShadSlateColorScheme.accentLight, const Color(0xfff1f5f9));
      expect(ShadSlateColorScheme.accentForegroundLight, const Color(0xff0f172a));
      expect(ShadSlateColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadSlateColorScheme.destructiveForegroundLight, const Color(0xfff8fafc));
      expect(ShadSlateColorScheme.borderLight, const Color(0xffe2e8f0));
      expect(ShadSlateColorScheme.inputLight, const Color(0xffe2e8f0));
      expect(ShadSlateColorScheme.ringLight, const Color(0xff020817));
      expect(ShadSlateColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadSlateColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff020817),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff020817),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff020817),
        primary: const Color(0xff0f172a),
        primaryForeground: const Color(0xfff8fafc),
        secondary: const Color(0xfff1f5f9),
        secondaryForeground: const Color(0xff0f172a),
        muted: const Color(0xfff1f5f9),
        mutedForeground: const Color(0xff64748b),
        accent: const Color(0xfff1f5f9),
        accentForeground: const Color(0xff0f172a),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfff8fafc),
        border: const Color(0xffe2e8f0),
        input: const Color(0xffe2e8f0),
        ring: const Color(0xff020817),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadSlateColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadSlateColorScheme.backgroundDark, const Color(0xff020817));
      expect(ShadSlateColorScheme.foregroundDark, const Color(0xfff8fafc));
      expect(ShadSlateColorScheme.cardDark, const Color(0xff020817));
      expect(ShadSlateColorScheme.cardForegroundDark, const Color(0xfff8fafc));
      expect(ShadSlateColorScheme.popoverDark, const Color(0xff020817));
      expect(ShadSlateColorScheme.popoverForegroundDark, const Color(0xfff8fafc));
      expect(ShadSlateColorScheme.primaryDark, const Color(0xfff8fafc));
      expect(ShadSlateColorScheme.primaryForegroundDark, const Color(0xff0f172a));
      expect(ShadSlateColorScheme.secondaryDark, const Color(0xff1e293b));
      expect(ShadSlateColorScheme.secondaryForegroundDark, const Color(0xfff8fafc));
      expect(ShadSlateColorScheme.mutedDark, const Color(0xff1e293b));
      expect(ShadSlateColorScheme.mutedForegroundDark, const Color(0xff94a3b8));
      expect(ShadSlateColorScheme.accentDark, const Color(0xff1e293b));
      expect(ShadSlateColorScheme.accentForegroundDark, const Color(0xfff8fafc));
      expect(ShadSlateColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadSlateColorScheme.destructiveForegroundDark, const Color(0xfff8fafc));
      expect(ShadSlateColorScheme.borderDark, const Color(0xff1e293b));
      expect(ShadSlateColorScheme.inputDark, const Color(0xff1e293b));
      expect(ShadSlateColorScheme.ringDark, const Color(0xffcbd5e1));
      expect(ShadSlateColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadSlateColorScheme.dark(),
        background: const Color(0xff020817),
        foreground: const Color(0xfff8fafc),
        card: const Color(0xff020817),
        cardForeground: const Color(0xfff8fafc),
        popover: const Color(0xff020817),
        popoverForeground: const Color(0xfff8fafc),
        primary: const Color(0xfff8fafc),
        primaryForeground: const Color(0xff0f172a),
        secondary: const Color(0xff1e293b),
        secondaryForeground: const Color(0xfff8fafc),
        muted: const Color(0xff1e293b),
        mutedForeground: const Color(0xff94a3b8),
        accent: const Color(0xff1e293b),
        accentForeground: const Color(0xfff8fafc),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfff8fafc),
        border: const Color(0xff1e293b),
        input: const Color(0xff1e293b),
        ring: const Color(0xffcbd5e1),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadSlate maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadSlateName, 'Shadcn Slate');
      expect(FlexColor.shadSlateDescription, 'Shadcn slate based theme.');
      expect(FlexColor.shadSlate.light.primary, ShadSlateColorScheme.primaryLight);
      expect(FlexColor.shadSlate.light.primaryLightRef, ShadSlateColorScheme.primaryLight);
      expect(FlexColor.shadSlate.light.secondary, ShadSlateColorScheme.secondaryLight);
      expect(FlexColor.shadSlate.light.secondaryLightRef, ShadSlateColorScheme.secondaryLight);
      expect(FlexColor.shadSlate.light.tertiary, ShadSlateColorScheme.accentLight);
      expect(FlexColor.shadSlate.light.tertiaryLightRef, ShadSlateColorScheme.accentLight);
      expect(FlexColor.shadSlate.light.error, ShadSlateColorScheme.destructiveLight);
      expect(FlexColor.shadSlate.dark.primary, ShadSlateColorScheme.primaryDark);
      expect(FlexColor.shadSlate.dark.primaryLightRef, ShadSlateColorScheme.primaryLight);
      expect(FlexColor.shadSlate.dark.secondary, ShadSlateColorScheme.secondaryDark);
      expect(FlexColor.shadSlate.dark.secondaryLightRef, ShadSlateColorScheme.secondaryLight);
      expect(FlexColor.shadSlate.dark.tertiary, ShadSlateColorScheme.accentDark);
      expect(FlexColor.shadSlate.dark.tertiaryLightRef, ShadSlateColorScheme.accentLight);
      expect(FlexColor.shadSlate.dark.error, ShadSlateColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadSlate], FlexColor.shadSlate);
      expect(FlexColor.schemesList.contains(FlexColor.shadSlate), isTrue);
      expect(FlexScheme.shadSlate.data, FlexColor.shadSlate);
    });
  });

  group('FSCS2: ShadStoneColorScheme token lock ', () {
    test('ShadStoneColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadStoneColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadStoneColorScheme.foregroundLight, const Color(0xff0c0a09));
      expect(ShadStoneColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadStoneColorScheme.cardForegroundLight, const Color(0xff0c0a09));
      expect(ShadStoneColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadStoneColorScheme.popoverForegroundLight, const Color(0xff0c0a09));
      expect(ShadStoneColorScheme.primaryLight, const Color(0xff1c1917));
      expect(ShadStoneColorScheme.primaryForegroundLight, const Color(0xfffafaf9));
      expect(ShadStoneColorScheme.secondaryLight, const Color(0xfff5f5f4));
      expect(ShadStoneColorScheme.secondaryForegroundLight, const Color(0xff1c1917));
      expect(ShadStoneColorScheme.mutedLight, const Color(0xfff5f5f4));
      expect(ShadStoneColorScheme.mutedForegroundLight, const Color(0xff78716c));
      expect(ShadStoneColorScheme.accentLight, const Color(0xfff5f5f4));
      expect(ShadStoneColorScheme.accentForegroundLight, const Color(0xff1c1917));
      expect(ShadStoneColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadStoneColorScheme.destructiveForegroundLight, const Color(0xfffafaf9));
      expect(ShadStoneColorScheme.borderLight, const Color(0xffe7e5e4));
      expect(ShadStoneColorScheme.inputLight, const Color(0xffe7e5e4));
      expect(ShadStoneColorScheme.ringLight, const Color(0xff0c0a09));
      expect(ShadStoneColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadStoneColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff0c0a09),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff0c0a09),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff0c0a09),
        primary: const Color(0xff1c1917),
        primaryForeground: const Color(0xfffafaf9),
        secondary: const Color(0xfff5f5f4),
        secondaryForeground: const Color(0xff1c1917),
        muted: const Color(0xfff5f5f4),
        mutedForeground: const Color(0xff78716c),
        accent: const Color(0xfff5f5f4),
        accentForeground: const Color(0xff1c1917),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfffafaf9),
        border: const Color(0xffe7e5e4),
        input: const Color(0xffe7e5e4),
        ring: const Color(0xff0c0a09),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadStoneColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadStoneColorScheme.backgroundDark, const Color(0xff0c0a09));
      expect(ShadStoneColorScheme.foregroundDark, const Color(0xfffafaf9));
      expect(ShadStoneColorScheme.cardDark, const Color(0xff0c0a09));
      expect(ShadStoneColorScheme.cardForegroundDark, const Color(0xfffafaf9));
      expect(ShadStoneColorScheme.popoverDark, const Color(0xff0c0a09));
      expect(ShadStoneColorScheme.popoverForegroundDark, const Color(0xfffafaf9));
      expect(ShadStoneColorScheme.primaryDark, const Color(0xfffafaf9));
      expect(ShadStoneColorScheme.primaryForegroundDark, const Color(0xff1c1917));
      expect(ShadStoneColorScheme.secondaryDark, const Color(0xff292524));
      expect(ShadStoneColorScheme.secondaryForegroundDark, const Color(0xfffafaf9));
      expect(ShadStoneColorScheme.mutedDark, const Color(0xff292524));
      expect(ShadStoneColorScheme.mutedForegroundDark, const Color(0xffa8a29e));
      expect(ShadStoneColorScheme.accentDark, const Color(0xff292524));
      expect(ShadStoneColorScheme.accentForegroundDark, const Color(0xfffafaf9));
      expect(ShadStoneColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadStoneColorScheme.destructiveForegroundDark, const Color(0xfffafaf9));
      expect(ShadStoneColorScheme.borderDark, const Color(0xff292524));
      expect(ShadStoneColorScheme.inputDark, const Color(0xff292524));
      expect(ShadStoneColorScheme.ringDark, const Color(0xffd6d3d1));
      expect(ShadStoneColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadStoneColorScheme.dark(),
        background: const Color(0xff0c0a09),
        foreground: const Color(0xfffafaf9),
        card: const Color(0xff0c0a09),
        cardForeground: const Color(0xfffafaf9),
        popover: const Color(0xff0c0a09),
        popoverForeground: const Color(0xfffafaf9),
        primary: const Color(0xfffafaf9),
        primaryForeground: const Color(0xff1c1917),
        secondary: const Color(0xff292524),
        secondaryForeground: const Color(0xfffafaf9),
        muted: const Color(0xff292524),
        mutedForeground: const Color(0xffa8a29e),
        accent: const Color(0xff292524),
        accentForeground: const Color(0xfffafaf9),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfffafaf9),
        border: const Color(0xff292524),
        input: const Color(0xff292524),
        ring: const Color(0xffd6d3d1),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadStone maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadStoneName, 'Shadcn Stone');
      expect(FlexColor.shadStoneDescription, 'Shadcn stone based theme.');
      expect(FlexColor.shadStone.light.primary, ShadStoneColorScheme.primaryLight);
      expect(FlexColor.shadStone.light.primaryLightRef, ShadStoneColorScheme.primaryLight);
      expect(FlexColor.shadStone.light.secondary, ShadStoneColorScheme.secondaryLight);
      expect(FlexColor.shadStone.light.secondaryLightRef, ShadStoneColorScheme.secondaryLight);
      expect(FlexColor.shadStone.light.tertiary, ShadStoneColorScheme.accentLight);
      expect(FlexColor.shadStone.light.tertiaryLightRef, ShadStoneColorScheme.accentLight);
      expect(FlexColor.shadStone.light.error, ShadStoneColorScheme.destructiveLight);
      expect(FlexColor.shadStone.dark.primary, ShadStoneColorScheme.primaryDark);
      expect(FlexColor.shadStone.dark.primaryLightRef, ShadStoneColorScheme.primaryLight);
      expect(FlexColor.shadStone.dark.secondary, ShadStoneColorScheme.secondaryDark);
      expect(FlexColor.shadStone.dark.secondaryLightRef, ShadStoneColorScheme.secondaryLight);
      expect(FlexColor.shadStone.dark.tertiary, ShadStoneColorScheme.accentDark);
      expect(FlexColor.shadStone.dark.tertiaryLightRef, ShadStoneColorScheme.accentLight);
      expect(FlexColor.shadStone.dark.error, ShadStoneColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadStone], FlexColor.shadStone);
      expect(FlexColor.schemesList.contains(FlexColor.shadStone), isTrue);
      expect(FlexScheme.shadStone.data, FlexColor.shadStone);
    });
  });

  group('FSCS2: ShadVioletColorScheme token lock ', () {
    test('ShadVioletColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadVioletColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadVioletColorScheme.foregroundLight, const Color(0xff030712));
      expect(ShadVioletColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadVioletColorScheme.cardForegroundLight, const Color(0xff030712));
      expect(ShadVioletColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadVioletColorScheme.popoverForegroundLight, const Color(0xff030712));
      expect(ShadVioletColorScheme.primaryLight, const Color(0xff7c3aed));
      expect(ShadVioletColorScheme.primaryForegroundLight, const Color(0xfff9fafb));
      expect(ShadVioletColorScheme.secondaryLight, const Color(0xfff3f4f6));
      expect(ShadVioletColorScheme.secondaryForegroundLight, const Color(0xff111827));
      expect(ShadVioletColorScheme.mutedLight, const Color(0xfff3f4f6));
      expect(ShadVioletColorScheme.mutedForegroundLight, const Color(0xff6b7280));
      expect(ShadVioletColorScheme.accentLight, const Color(0xfff3f4f6));
      expect(ShadVioletColorScheme.accentForegroundLight, const Color(0xff111827));
      expect(ShadVioletColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadVioletColorScheme.destructiveForegroundLight, const Color(0xfff9fafb));
      expect(ShadVioletColorScheme.borderLight, const Color(0xffe5e7eb));
      expect(ShadVioletColorScheme.inputLight, const Color(0xffe5e7eb));
      expect(ShadVioletColorScheme.ringLight, const Color(0xff7c3aed));
      expect(ShadVioletColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadVioletColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff030712),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff030712),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff030712),
        primary: const Color(0xff7c3aed),
        primaryForeground: const Color(0xfff9fafb),
        secondary: const Color(0xfff3f4f6),
        secondaryForeground: const Color(0xff111827),
        muted: const Color(0xfff3f4f6),
        mutedForeground: const Color(0xff6b7280),
        accent: const Color(0xfff3f4f6),
        accentForeground: const Color(0xff111827),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfff9fafb),
        border: const Color(0xffe5e7eb),
        input: const Color(0xffe5e7eb),
        ring: const Color(0xff7c3aed),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadVioletColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadVioletColorScheme.backgroundDark, const Color(0xff030712));
      expect(ShadVioletColorScheme.foregroundDark, const Color(0xfff9fafb));
      expect(ShadVioletColorScheme.cardDark, const Color(0xff030712));
      expect(ShadVioletColorScheme.cardForegroundDark, const Color(0xfff9fafb));
      expect(ShadVioletColorScheme.popoverDark, const Color(0xff030712));
      expect(ShadVioletColorScheme.popoverForegroundDark, const Color(0xfff9fafb));
      expect(ShadVioletColorScheme.primaryDark, const Color(0xff6d28d9));
      expect(ShadVioletColorScheme.primaryForegroundDark, const Color(0xfff9fafb));
      expect(ShadVioletColorScheme.secondaryDark, const Color(0xff1f2937));
      expect(ShadVioletColorScheme.secondaryForegroundDark, const Color(0xfff9fafb));
      expect(ShadVioletColorScheme.mutedDark, const Color(0xff1f2937));
      expect(ShadVioletColorScheme.mutedForegroundDark, const Color(0xff9ca3af));
      expect(ShadVioletColorScheme.accentDark, const Color(0xff1f2937));
      expect(ShadVioletColorScheme.accentForegroundDark, const Color(0xfff9fafb));
      expect(ShadVioletColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadVioletColorScheme.destructiveForegroundDark, const Color(0xfff9fafb));
      expect(ShadVioletColorScheme.borderDark, const Color(0xff1f2937));
      expect(ShadVioletColorScheme.inputDark, const Color(0xff1f2937));
      expect(ShadVioletColorScheme.ringDark, const Color(0xff6d28d9));
      expect(ShadVioletColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadVioletColorScheme.dark(),
        background: const Color(0xff030712),
        foreground: const Color(0xfff9fafb),
        card: const Color(0xff030712),
        cardForeground: const Color(0xfff9fafb),
        popover: const Color(0xff030712),
        popoverForeground: const Color(0xfff9fafb),
        primary: const Color(0xff6d28d9),
        primaryForeground: const Color(0xfff9fafb),
        secondary: const Color(0xff1f2937),
        secondaryForeground: const Color(0xfff9fafb),
        muted: const Color(0xff1f2937),
        mutedForeground: const Color(0xff9ca3af),
        accent: const Color(0xff1f2937),
        accentForeground: const Color(0xfff9fafb),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfff9fafb),
        border: const Color(0xff1f2937),
        input: const Color(0xff1f2937),
        ring: const Color(0xff6d28d9),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadViolet maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadVioletName, 'Shadcn Violet');
      expect(FlexColor.shadVioletDescription, 'Shadcn violet based theme.');
      expect(FlexColor.shadViolet.light.primary, ShadVioletColorScheme.primaryLight);
      expect(FlexColor.shadViolet.light.primaryLightRef, ShadVioletColorScheme.primaryLight);
      expect(FlexColor.shadViolet.light.secondary, ShadVioletColorScheme.secondaryLight);
      expect(FlexColor.shadViolet.light.secondaryLightRef, ShadVioletColorScheme.secondaryLight);
      expect(FlexColor.shadViolet.light.tertiary, ShadVioletColorScheme.accentLight);
      expect(FlexColor.shadViolet.light.tertiaryLightRef, ShadVioletColorScheme.accentLight);
      expect(FlexColor.shadViolet.light.error, ShadVioletColorScheme.destructiveLight);
      expect(FlexColor.shadViolet.dark.primary, ShadVioletColorScheme.primaryDark);
      expect(FlexColor.shadViolet.dark.primaryLightRef, ShadVioletColorScheme.primaryLight);
      expect(FlexColor.shadViolet.dark.secondary, ShadVioletColorScheme.secondaryDark);
      expect(FlexColor.shadViolet.dark.secondaryLightRef, ShadVioletColorScheme.secondaryLight);
      expect(FlexColor.shadViolet.dark.tertiary, ShadVioletColorScheme.accentDark);
      expect(FlexColor.shadViolet.dark.tertiaryLightRef, ShadVioletColorScheme.accentLight);
      expect(FlexColor.shadViolet.dark.error, ShadVioletColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadViolet], FlexColor.shadViolet);
      expect(FlexColor.schemesList.contains(FlexColor.shadViolet), isTrue);
      expect(FlexScheme.shadViolet.data, FlexColor.shadViolet);
    });
  });

  group('FSCS2: ShadYellowColorScheme token lock ', () {
    test('ShadYellowColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadYellowColorScheme.backgroundLight, const Color(0xffffffff));
      expect(ShadYellowColorScheme.foregroundLight, const Color(0xff0c0a09));
      expect(ShadYellowColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadYellowColorScheme.cardForegroundLight, const Color(0xff0c0a09));
      expect(ShadYellowColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadYellowColorScheme.popoverForegroundLight, const Color(0xff0c0a09));
      expect(ShadYellowColorScheme.primaryLight, const Color(0xfffacc15));
      expect(ShadYellowColorScheme.primaryForegroundLight, const Color(0xff422006));
      expect(ShadYellowColorScheme.secondaryLight, const Color(0xfff5f5f4));
      expect(ShadYellowColorScheme.secondaryForegroundLight, const Color(0xff1c1917));
      expect(ShadYellowColorScheme.mutedLight, const Color(0xfff5f5f4));
      expect(ShadYellowColorScheme.mutedForegroundLight, const Color(0xff78716c));
      expect(ShadYellowColorScheme.accentLight, const Color(0xfff5f5f4));
      expect(ShadYellowColorScheme.accentForegroundLight, const Color(0xff1c1917));
      expect(ShadYellowColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadYellowColorScheme.destructiveForegroundLight, const Color(0xfffafaf9));
      expect(ShadYellowColorScheme.borderLight, const Color(0xffe7e5e4));
      expect(ShadYellowColorScheme.inputLight, const Color(0xffe7e5e4));
      expect(ShadYellowColorScheme.ringLight, const Color(0xff0c0a09));
      expect(ShadYellowColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadYellowColorScheme.light(),
        background: const Color(0xffffffff),
        foreground: const Color(0xff0c0a09),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff0c0a09),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff0c0a09),
        primary: const Color(0xfffacc15),
        primaryForeground: const Color(0xff422006),
        secondary: const Color(0xfff5f5f4),
        secondaryForeground: const Color(0xff1c1917),
        muted: const Color(0xfff5f5f4),
        mutedForeground: const Color(0xff78716c),
        accent: const Color(0xfff5f5f4),
        accentForeground: const Color(0xff1c1917),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfffafaf9),
        border: const Color(0xffe7e5e4),
        input: const Color(0xffe7e5e4),
        ring: const Color(0xff0c0a09),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadYellowColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadYellowColorScheme.backgroundDark, const Color(0xff0c0a09));
      expect(ShadYellowColorScheme.foregroundDark, const Color(0xfffafaf9));
      expect(ShadYellowColorScheme.cardDark, const Color(0xff0c0a09));
      expect(ShadYellowColorScheme.cardForegroundDark, const Color(0xfffafaf9));
      expect(ShadYellowColorScheme.popoverDark, const Color(0xff0c0a09));
      expect(ShadYellowColorScheme.popoverForegroundDark, const Color(0xfffafaf9));
      expect(ShadYellowColorScheme.primaryDark, const Color(0xfffacc15));
      expect(ShadYellowColorScheme.primaryForegroundDark, const Color(0xff422006));
      expect(ShadYellowColorScheme.secondaryDark, const Color(0xff292524));
      expect(ShadYellowColorScheme.secondaryForegroundDark, const Color(0xfffafaf9));
      expect(ShadYellowColorScheme.mutedDark, const Color(0xff292524));
      expect(ShadYellowColorScheme.mutedForegroundDark, const Color(0xffa8a29e));
      expect(ShadYellowColorScheme.accentDark, const Color(0xff292524));
      expect(ShadYellowColorScheme.accentForegroundDark, const Color(0xfffafaf9));
      expect(ShadYellowColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadYellowColorScheme.destructiveForegroundDark, const Color(0xfffafaf9));
      expect(ShadYellowColorScheme.borderDark, const Color(0xff292524));
      expect(ShadYellowColorScheme.inputDark, const Color(0xff292524));
      expect(ShadYellowColorScheme.ringDark, const Color(0xffa16207));
      expect(ShadYellowColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadYellowColorScheme.dark(),
        background: const Color(0xff0c0a09),
        foreground: const Color(0xfffafaf9),
        card: const Color(0xff0c0a09),
        cardForeground: const Color(0xfffafaf9),
        popover: const Color(0xff0c0a09),
        popoverForeground: const Color(0xfffafaf9),
        primary: const Color(0xfffacc15),
        primaryForeground: const Color(0xff422006),
        secondary: const Color(0xff292524),
        secondaryForeground: const Color(0xfffafaf9),
        muted: const Color(0xff292524),
        mutedForeground: const Color(0xffa8a29e),
        accent: const Color(0xff292524),
        accentForeground: const Color(0xfffafaf9),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfffafaf9),
        border: const Color(0xff292524),
        input: const Color(0xff292524),
        ring: const Color(0xffa16207),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadYellow maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadYellowName, 'Shadcn Yellow');
      expect(FlexColor.shadYellowDescription, 'Shadcn yellow based theme.');
      expect(FlexColor.shadYellow.light.primary, ShadYellowColorScheme.primaryLight);
      expect(FlexColor.shadYellow.light.primaryLightRef, ShadYellowColorScheme.primaryLight);
      expect(FlexColor.shadYellow.light.secondary, ShadYellowColorScheme.secondaryLight);
      expect(FlexColor.shadYellow.light.secondaryLightRef, ShadYellowColorScheme.secondaryLight);
      expect(FlexColor.shadYellow.light.tertiary, ShadYellowColorScheme.accentLight);
      expect(FlexColor.shadYellow.light.tertiaryLightRef, ShadYellowColorScheme.accentLight);
      expect(FlexColor.shadYellow.light.error, ShadYellowColorScheme.destructiveLight);
      expect(FlexColor.shadYellow.dark.primary, ShadYellowColorScheme.primaryDark);
      expect(FlexColor.shadYellow.dark.primaryLightRef, ShadYellowColorScheme.primaryLight);
      expect(FlexColor.shadYellow.dark.secondary, ShadYellowColorScheme.secondaryDark);
      expect(FlexColor.shadYellow.dark.secondaryLightRef, ShadYellowColorScheme.secondaryLight);
      expect(FlexColor.shadYellow.dark.tertiary, ShadYellowColorScheme.accentDark);
      expect(FlexColor.shadYellow.dark.tertiaryLightRef, ShadYellowColorScheme.accentLight);
      expect(FlexColor.shadYellow.dark.error, ShadYellowColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadYellow], FlexColor.shadYellow);
      expect(FlexColor.schemesList.contains(FlexColor.shadYellow), isTrue);
      expect(FlexScheme.shadYellow.data, FlexColor.shadYellow);
    });
  });

  group('FSCS2: ShadZincColorScheme token lock ', () {
    test('ShadZincColorScheme.light locks all tokens and constructor defaults', () {
      expect(ShadZincColorScheme.backgroundLight, const Color(0xFFFFFFFF));
      expect(ShadZincColorScheme.foregroundLight, const Color(0xff09090b));
      expect(ShadZincColorScheme.cardLight, const Color(0xffffffff));
      expect(ShadZincColorScheme.cardForegroundLight, const Color(0xff09090b));
      expect(ShadZincColorScheme.popoverLight, const Color(0xffffffff));
      expect(ShadZincColorScheme.popoverForegroundLight, const Color(0xff09090b));
      expect(ShadZincColorScheme.primaryLight, const Color(0xff18181b));
      expect(ShadZincColorScheme.primaryForegroundLight, const Color(0xfffafafa));
      expect(ShadZincColorScheme.secondaryLight, const Color(0xfff4f4f5));
      expect(ShadZincColorScheme.secondaryForegroundLight, const Color(0xff18181b));
      expect(ShadZincColorScheme.mutedLight, const Color(0xfff4f4f5));
      expect(ShadZincColorScheme.mutedForegroundLight, const Color(0xff71717a));
      expect(ShadZincColorScheme.accentLight, const Color(0xfff4f4f5));
      expect(ShadZincColorScheme.accentForegroundLight, const Color(0xff18181b));
      expect(ShadZincColorScheme.destructiveLight, const Color(0xffef4444));
      expect(ShadZincColorScheme.destructiveForegroundLight, const Color(0xfffafafa));
      expect(ShadZincColorScheme.borderLight, const Color(0xffe4e4e7));
      expect(ShadZincColorScheme.inputLight, const Color(0xffe4e4e7));
      expect(ShadZincColorScheme.ringLight, const Color(0xff18181b));
      expect(ShadZincColorScheme.selectionLight, const Color(0xFFB4D7FF));
      expectShadColors(
        ShadZincColorScheme.light(),
        background: const Color(0xFFFFFFFF),
        foreground: const Color(0xff09090b),
        card: const Color(0xffffffff),
        cardForeground: const Color(0xff09090b),
        popover: const Color(0xffffffff),
        popoverForeground: const Color(0xff09090b),
        primary: const Color(0xff18181b),
        primaryForeground: const Color(0xfffafafa),
        secondary: const Color(0xfff4f4f5),
        secondaryForeground: const Color(0xff18181b),
        muted: const Color(0xfff4f4f5),
        mutedForeground: const Color(0xff71717a),
        accent: const Color(0xfff4f4f5),
        accentForeground: const Color(0xff18181b),
        destructive: const Color(0xffef4444),
        destructiveForeground: const Color(0xfffafafa),
        border: const Color(0xffe4e4e7),
        input: const Color(0xffe4e4e7),
        ring: const Color(0xff18181b),
        selection: const Color(0xFFB4D7FF),
      );
    });
    test('ShadZincColorScheme.dark locks all tokens and constructor defaults', () {
      expect(ShadZincColorScheme.backgroundDark, const Color(0xff09090b));
      expect(ShadZincColorScheme.foregroundDark, const Color(0xfffafafa));
      expect(ShadZincColorScheme.cardDark, const Color(0xff09090b));
      expect(ShadZincColorScheme.cardForegroundDark, const Color(0xfffafafa));
      expect(ShadZincColorScheme.popoverDark, const Color(0xff09090b));
      expect(ShadZincColorScheme.popoverForegroundDark, const Color(0xfffafafa));
      expect(ShadZincColorScheme.primaryDark, const Color(0xfffafafa));
      expect(ShadZincColorScheme.primaryForegroundDark, const Color(0xff18181b));
      expect(ShadZincColorScheme.secondaryDark, const Color(0xff27272a));
      expect(ShadZincColorScheme.secondaryForegroundDark, const Color(0xfffafafa));
      expect(ShadZincColorScheme.mutedDark, const Color(0xff27272a));
      expect(ShadZincColorScheme.mutedForegroundDark, const Color(0xffa1a1aa));
      expect(ShadZincColorScheme.accentDark, const Color(0xff27272a));
      expect(ShadZincColorScheme.accentForegroundDark, const Color(0xfffafafa));
      expect(ShadZincColorScheme.destructiveDark, const Color(0xff7f1d1d));
      expect(ShadZincColorScheme.destructiveForegroundDark, const Color(0xfffafafa));
      expect(ShadZincColorScheme.borderDark, const Color(0xff27272a));
      expect(ShadZincColorScheme.inputDark, const Color(0xff27272a));
      expect(ShadZincColorScheme.ringDark, const Color(0xffd4d4d8));
      expect(ShadZincColorScheme.selectionDark, const Color(0xFF355172));
      expectShadColors(
        ShadZincColorScheme.dark(),
        background: const Color(0xff09090b),
        foreground: const Color(0xfffafafa),
        card: const Color(0xff09090b),
        cardForeground: const Color(0xfffafafa),
        popover: const Color(0xff09090b),
        popoverForeground: const Color(0xfffafafa),
        primary: const Color(0xfffafafa),
        primaryForeground: const Color(0xff18181b),
        secondary: const Color(0xff27272a),
        secondaryForeground: const Color(0xfffafafa),
        muted: const Color(0xff27272a),
        mutedForeground: const Color(0xffa1a1aa),
        accent: const Color(0xff27272a),
        accentForeground: const Color(0xfffafafa),
        destructive: const Color(0xff7f1d1d),
        destructiveForeground: const Color(0xfffafafa),
        border: const Color(0xff27272a),
        input: const Color(0xff27272a),
        ring: const Color(0xffd4d4d8),
        selection: const Color(0xFF355172),
      );
    });
    test('FlexColor.shadZinc maps Shad tokens and scheme lookup', () {
      expect(FlexColor.shadZincName, 'Shadcn Zinc');
      expect(FlexColor.shadZincDescription, 'Shadcn zinc based theme.');
      expect(FlexColor.shadZinc.light.primary, ShadZincColorScheme.primaryLight);
      expect(FlexColor.shadZinc.light.primaryLightRef, ShadZincColorScheme.primaryLight);
      expect(FlexColor.shadZinc.light.secondary, ShadZincColorScheme.secondaryLight);
      expect(FlexColor.shadZinc.light.secondaryLightRef, ShadZincColorScheme.secondaryLight);
      expect(FlexColor.shadZinc.light.tertiary, ShadZincColorScheme.accentLight);
      expect(FlexColor.shadZinc.light.tertiaryLightRef, ShadZincColorScheme.accentLight);
      expect(FlexColor.shadZinc.light.error, ShadZincColorScheme.destructiveLight);
      expect(FlexColor.shadZinc.dark.primary, ShadZincColorScheme.primaryDark);
      expect(FlexColor.shadZinc.dark.primaryLightRef, ShadZincColorScheme.primaryLight);
      expect(FlexColor.shadZinc.dark.secondary, ShadZincColorScheme.secondaryDark);
      expect(FlexColor.shadZinc.dark.secondaryLightRef, ShadZincColorScheme.secondaryLight);
      expect(FlexColor.shadZinc.dark.tertiary, ShadZincColorScheme.accentDark);
      expect(FlexColor.shadZinc.dark.tertiaryLightRef, ShadZincColorScheme.accentLight);
      expect(FlexColor.shadZinc.dark.error, ShadZincColorScheme.destructiveDark);
      expect(FlexColor.schemes[FlexScheme.shadZinc], FlexColor.shadZinc);
      expect(FlexColor.schemesList.contains(FlexColor.shadZinc), isTrue);
      expect(FlexScheme.shadZinc.data, FlexColor.shadZinc);
    });
  });
}
