# Colors and seeding in 9.x

Choose inputs for the intended result. `scheme` selects a built-in palette; `colors` accepts `FlexSchemeColor`; `colorScheme` supplies an existing Material `ColorScheme`. Direct color arguments can override corresponding inputs, and subsequent seeding/blending can transform effective colors. For a combination, consult that resolved version's factory documentation rather than assuming that every supplied color will remain unchanged.

## Custom colors

For an unseeded theme, provide colors suitable for each brightness. A pair of `FlexSchemeColor` values can be bundled as `FlexSchemeData`; pass its `.light` and `.dark` values to the corresponding factories. `FlexSchemeColor.from` can derive missing palette entries, but review the resulting colors and contrast.

For a seeded design, use the same seed inputs for light and dark so the themes use related tonal palettes:

```dart
const FlexKeyColors seeds = FlexKeyColors(
  keyPrimary: Color(0xFF006A60),
  keySecondary: Color(0xFF705D00),
  useSecondary: true,
);
final ThemeData light = FlexThemeData.light(keyColors: seeds);
final ThemeData dark = FlexThemeData.dark(keyColors: seeds);
```

This snippet uses the imports from the skill entrypoint. A default `FlexKeyColors()` enables seeding from effective primary. Secondary, tertiary, and error seeding have separate opt-in flags; providing a seed override alone is not a substitute for enabling its category.

Built-in `scheme` seeding uses the light palette's seed inputs for the dark theme too. With custom inputs, keep seed colors consistent yourself unless different palettes are intentional. A seed color does not necessarily equal the generated theme's primary: the seed determines a palette and the selected tone supplies the role color.

`keepPrimary`, `keepSecondary`, and related keep flags retain selected input roles instead of accepting their generated tones. They change color-pair relationships; inspect the corresponding on-colors and contrast rather than enabling them automatically for branding.

`FlexTones` and the FlexSeedScheme APIs re-exported by the barrel provide advanced tonal configuration. Use them only when the default tonal behavior does not meet the design requirement and verify the API in the resolved dependency version.

## Surface treatment

`surfaceMode` and `blendLevel` configure surface blending; light and dark can use different levels. These transformations can be combined with seeding. Inspect actual `.toScheme` or `ThemeData.colorScheme` values when precise colors matter. Do not diagnose a seed mismatch by comparing only raw input colors.

If an existing ColorScheme must remain exact, verify each affected role after conversion and disable or avoid transformations that conflict with that requirement. Component themes can still use different roles; matching a widget color is not always equivalent to matching `colorScheme.primary`.
