// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/controllers/theme_controller.dart';
import '../../../../../shared/utils/app_scroll_behavior.dart';
import '../../../../theme/flex_theme_dark.dart';
import '../../../../theme/flex_theme_light.dart';

const Widget divider = SizedBox(height: 10);

// If screen content width is greater or equal to this value, the light and dark
// color schemes will be displayed in a column. Otherwise, they will
// be displayed in a row.
const double narrowScreenWidthThreshold = 400;

class ColorPalettesScreen extends StatelessWidget {
  const ColorPalettesScreen({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.paddingOf(context);

    final ColorScheme lightScheme =
        flexColorSchemeLight(themeController, Colors.black).toScheme;

    final ColorScheme darkScheme =
        flexColorSchemeDark(themeController, Colors.black).toScheme;

    Widget schemeLabel(String brightness) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          brightness,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget schemeView(ColorScheme colorScheme) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ColorSchemeView(
          colorScheme: colorScheme,
        ),
      );
    }

    Widget dynamicColorNotice() => RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall,
            children: <TextSpan>[
              const TextSpan(
                  text: 'This color presentation shows colors from '
                      'ThemesPlayground light and dark ColorScheme. '
                      'To create color schemes based on a '
                      "platform's implementation of dynamic color, "
                      'use the '),
              TextSpan(
                text: 'dynamic_color',
                style: const TextStyle(decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final Uri url = Uri.parse(
                      'https://pub.dev/packages/dynamic_color',
                    );
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
              ),
              const TextSpan(text: ' package.'),
            ],
          ),
        );

    return ScrollConfiguration(
      behavior: const DragScrollBehavior(),
      child: Expanded(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < narrowScreenWidthThreshold) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 8 + padding.top,
                bottom: 8 + padding.bottom,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: dynamicColorNotice(),
                  ),
                  schemeLabel('Light ColorScheme'),
                  schemeView(lightScheme),
                  divider,
                  schemeLabel('Dark ColorScheme'),
                  schemeView(darkScheme),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 8 + padding.top,
                  bottom: 8 + padding.bottom,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      child: dynamicColorNotice(),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              schemeLabel('Light ColorScheme'),
                              schemeView(lightScheme),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              schemeLabel('Dark ColorScheme'),
                              schemeView(darkScheme),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}

class ColorSchemeView extends StatelessWidget {
  const ColorSchemeView({super.key, required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ColorGroup(
          children: <Widget>[
            ColorChip(
              label: 'primary',
              color: colorScheme.primary,
              onColor: colorScheme.onPrimary,
            ),
            ColorChip(
              label: 'onPrimary',
              color: colorScheme.onPrimary,
              onColor: colorScheme.primary,
            ),
            ColorChip(
              label: 'primaryContainer',
              color: colorScheme.primaryContainer,
              onColor: colorScheme.onPrimaryContainer,
            ),
            ColorChip(
              label: 'onPrimaryContainer',
              color: colorScheme.onPrimaryContainer,
              onColor: colorScheme.primaryContainer,
            ),
          ],
        ),
        divider,
        ColorGroup(
          children: <Widget>[
            ColorChip(
              label: 'primaryFixed',
              color: colorScheme.primaryFixed,
              onColor: colorScheme.onPrimaryFixed,
            ),
            ColorChip(
              label: 'onPrimaryFixed',
              color: colorScheme.onPrimaryFixed,
              onColor: colorScheme.primaryFixed,
            ),
            ColorChip(
              label: 'primaryFixedDim',
              color: colorScheme.primaryFixedDim,
              onColor: colorScheme.onPrimaryFixedVariant,
            ),
            ColorChip(
              label: 'onPrimaryFixedVariant',
              color: colorScheme.onPrimaryFixedVariant,
              onColor: colorScheme.primaryFixedDim,
            ),
          ],
        ),
        divider,
        ColorGroup(
          children: <Widget>[
            ColorChip(
              label: 'secondary',
              color: colorScheme.secondary,
              onColor: colorScheme.onSecondary,
            ),
            ColorChip(
              label: 'onSecondary',
              color: colorScheme.onSecondary,
              onColor: colorScheme.secondary,
            ),
            ColorChip(
              label: 'secondaryContainer',
              color: colorScheme.secondaryContainer,
              onColor: colorScheme.onSecondaryContainer,
            ),
            ColorChip(
              label: 'onSecondaryContainer',
              color: colorScheme.onSecondaryContainer,
              onColor: colorScheme.secondaryContainer,
            ),
          ],
        ),
        divider,
        ColorGroup(
          children: <Widget>[
            ColorChip(
              label: 'secondaryFixed',
              color: colorScheme.secondaryFixed,
              onColor: colorScheme.onSecondaryFixed,
            ),
            ColorChip(
              label: 'onSecondaryFixed',
              color: colorScheme.onSecondaryFixed,
              onColor: colorScheme.secondaryFixed,
            ),
            ColorChip(
              label: 'secondaryFixedDim',
              color: colorScheme.secondaryFixedDim,
              onColor: colorScheme.onSecondaryFixedVariant,
            ),
            ColorChip(
              label: 'onSecondaryFixedVariant',
              color: colorScheme.onSecondaryFixedVariant,
              onColor: colorScheme.secondaryFixedDim,
            ),
          ],
        ),
        divider,
        ColorGroup(
          children: <Widget>[
            ColorChip(
              label: 'tertiary',
              color: colorScheme.tertiary,
              onColor: colorScheme.onTertiary,
            ),
            ColorChip(
              label: 'onTertiary',
              color: colorScheme.onTertiary,
              onColor: colorScheme.tertiary,
            ),
            ColorChip(
              label: 'tertiaryContainer',
              color: colorScheme.tertiaryContainer,
              onColor: colorScheme.onTertiaryContainer,
            ),
            ColorChip(
              label: 'onTertiaryContainer',
              color: colorScheme.onTertiaryContainer,
              onColor: colorScheme.tertiaryContainer,
            ),
          ],
        ),
        divider,
        ColorGroup(
          children: <Widget>[
            ColorChip(
              label: 'tertiaryFixed',
              color: colorScheme.tertiaryFixed,
              onColor: colorScheme.onTertiaryFixed,
            ),
            ColorChip(
              label: 'onTertiaryFixed',
              color: colorScheme.onTertiaryFixed,
              onColor: colorScheme.tertiaryFixed,
            ),
            ColorChip(
              label: 'tertiaryFixedDim',
              color: colorScheme.tertiaryFixedDim,
              onColor: colorScheme.onTertiaryFixedVariant,
            ),
            ColorChip(
              label: 'onTertiaryFixedVariant',
              color: colorScheme.onTertiaryFixedVariant,
              onColor: colorScheme.tertiaryFixedDim,
            ),
          ],
        ),
        divider,
        ColorGroup(
          children: <Widget>[
            ColorChip(
              label: 'error',
              color: colorScheme.error,
              onColor: colorScheme.onError,
            ),
            ColorChip(
              label: 'onError',
              color: colorScheme.onError,
              onColor: colorScheme.error,
            ),
            ColorChip(
              label: 'errorContainer',
              color: colorScheme.errorContainer,
              onColor: colorScheme.onErrorContainer,
            ),
            ColorChip(
              label: 'onErrorContainer',
              color: colorScheme.onErrorContainer,
              onColor: colorScheme.errorContainer,
            ),
          ],
        ),
        divider,
        ColorGroup(
          children: <Widget>[
            ColorChip(
              label: 'surfaceDim',
              color: colorScheme.surfaceDim,
              onColor: colorScheme.onSurface,
            ),
            ColorChip(
              label: 'surface',
              color: colorScheme.surface,
              onColor: colorScheme.onSurface,
            ),
            ColorChip(
              label: 'surfaceBright',
              color: colorScheme.surfaceBright,
              onColor: colorScheme.onSurface,
            ),
            ColorChip(
              label: 'surfaceContainerLowest',
              color: colorScheme.surfaceContainerLowest,
              onColor: colorScheme.onSurface,
            ),
            ColorChip(
              label: 'surfaceContainerLow',
              color: colorScheme.surfaceContainerLow,
              onColor: colorScheme.onSurface,
            ),
            ColorChip(
              label: 'surfaceContainer',
              color: colorScheme.surfaceContainer,
              onColor: colorScheme.onSurface,
            ),
            ColorChip(
              label: 'surfaceContainerHigh',
              color: colorScheme.surfaceContainerHigh,
              onColor: colorScheme.onSurface,
            ),
            ColorChip(
              label: 'surfaceContainerHighest',
              color: colorScheme.surfaceContainerHighest,
              onColor: colorScheme.onSurface,
            ),
            ColorChip(
              label: 'onSurface',
              color: colorScheme.onSurface,
              onColor: colorScheme.surface,
            ),
            ColorChip(
              label: 'onSurfaceVariant',
              color: colorScheme.onSurfaceVariant,
              onColor: colorScheme.surfaceContainerHighest,
            ),
          ],
        ),
        divider,
        ColorGroup(
          children: <Widget>[
            ColorChip(
              label: 'outline',
              color: colorScheme.outline,
              onColor: null,
            ),
            ColorChip(
              label: 'outlineVariant',
              color: colorScheme.outlineVariant,
              onColor: null,
            ),
            ColorChip(
              label: 'shadow',
              color: colorScheme.shadow,
              onColor: null,
            ),
            ColorChip(
              label: 'inverseSurface',
              color: colorScheme.inverseSurface,
              onColor: colorScheme.onInverseSurface,
            ),
            ColorChip(
              label: 'onInverseSurface',
              color: colorScheme.onInverseSurface,
              onColor: colorScheme.inverseSurface,
            ),
            ColorChip(
              label: 'inversePrimary',
              color: colorScheme.inversePrimary,
              onColor: colorScheme.primary,
            ),
            ColorChip(
              label: 'scrim',
              color: colorScheme.scrim,
              onColor: null,
            ),
          ],
        ),
      ],
    );
  }
}

class ColorGroup extends StatelessWidget {
  const ColorGroup({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

class ColorChip extends StatelessWidget {
  const ColorChip({
    super.key,
    required this.color,
    required this.label,
    this.onColor,
  });

  final Color color;
  final Color? onColor;
  final String label;

  static Color contrastColor(Color color) =>
      switch (ThemeData.estimateBrightnessForColor(color)) {
        Brightness.dark => Colors.white,
        Brightness.light => Colors.black
      };

  @override
  Widget build(BuildContext context) {
    final Color labelColor = onColor ?? contrastColor(color);

    return ColoredBox(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(label,
                    style: TextStyle(color: labelColor, fontSize: 11))),
          ],
        ),
      ),
    );
  }
}
