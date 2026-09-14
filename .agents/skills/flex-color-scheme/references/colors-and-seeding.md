# Colors and seeding in 9.x

Choose inputs for the intended result. `scheme` selects a built-in palette; `colors` accepts `FlexSchemeColor`; `colorScheme` supplies an existing Material `ColorScheme`. Direct color arguments can override corresponding inputs, and subsequent seeding/blending can transform effective colors. For a combination, consult that resolved version's factory documentation rather than assuming that every supplied color will remain unchanged.

If both `scheme` and `colors` are specified, `colors` is used. If both are null, `scheme` defaults to `FlexScheme.material`.

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

This snippet uses the imports from the skill entrypoint. A default `FlexKeyColors()` enables seeding from effective primary. Secondary, tertiary, and error seeding have separate opt-in flags (`useSecondary`, `useTertiary`, `useError`); providing a seed override alone is not a substitute for enabling its category.

In 9.x, seeded **light** themes match Flutter 3.47 `ColorScheme.fromSeed` expressive on-container colors (tone 30). `useExpressiveOnContainerColors` defaults to **true** when undefined. Set `useExpressiveOnContainerColors: false` on `FlexKeyColors` to keep the older higher-contrast tone 10 on-container colors. The flag does not change dark on-container tones. Flutter's `ColorScheme.fromSeed` has no such opt-out.

Built-in `scheme` seeding uses the light palette's seed inputs for the dark theme too. With custom inputs, keep seed colors consistent yourself unless different palettes are intentional. A seed color does not necessarily equal the generated theme's primary: the seed determines a palette and the selected tone supplies the role color.

`keepPrimary`, `keepPrimaryContainer`, `keepSecondary`, and related keep flags retain selected input roles instead of accepting their generated tones. They change color-pair relationships; inspect the corresponding on-colors and contrast rather than enabling them automatically for branding.

`FlexTones` and `FlexSchemeVariant` (re-exported FlexSeedScheme APIs) provide advanced tonal configuration. Use them only when the default tonal behavior does not meet the design requirement. `tones` and `variant` are mutually exclusive. `contrastLevel` is ignored unless `variant.isFlutterScheme` is true.

## Surface treatment

`surfaceMode` and `blendLevel` configure surface blending; light and dark can use different levels. These transformations can be combined with seeding. Inspect actual `.toScheme` or `ThemeData.colorScheme` values when precise colors matter. Do not diagnose a seed mismatch by comparing only raw input colors.

If an existing ColorScheme must remain exact, verify each affected role after conversion and disable or avoid transformations that conflict with that requirement. Component themes can still use different roles; matching a widget color is not always equivalent to matching `colorScheme.primary`.

## 9.0 color leftovers

`background`, `onBackground`, and `surfaceVariant` were removed from FCS types in 9.0 (`FlexColorScheme`, `FlexThemeData`, `FlexSchemeOnColors`, `FlexSchemeSurfaceColors`). Use `surface` / `onSurface` and current surface-container roles. Matching unused alpha fields were removed from `FlexAlphaValues`.
