// ignore_for_file: comment_references

/// Enum for using predefined surface blend modes for surface and background
/// colors in [FlexColorScheme] based themes.
///
/// The mode [highBackgroundLowScaffold] is the closest equivalent to the style
/// used in [FlexColorScheme] before version 4 via the to be deprecated
/// [FlexSurface] enum property [surfaceStyle] in [FlexColorScheme.light] and
/// [FlexColorScheme.dark] factories.
enum FlexSurfaceMode {
  /// All surfaces have same alpha blend level including scaffold background.
  ///
  /// The blend level is at equal strength as set by blendLevel,
  /// the blend strength mix definition is:
  ///
  /// * Scaffold background, surface, dialogs, background: (1x)
  ///
  /// This mode results in elevation overlay color on [Material] type
  /// [MaterialType.card], [MaterialType.canvas] and [MaterialType.circle]
  /// themed background color in dark theme mode.
  ///
  /// In surface modes that use different blend strengths and blend color,
  /// that differs from the value used for colorScheme.surface,
  /// those [Material] surfaces will not get
  /// elevation overlay color in dark mode, even if set to on. For more
  /// information see issue: https://github.com/flutter/flutter/issues/90353
  level,

  /// Decreasing blend level in order background, surface, scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Background (3/2x)
  /// * Surface & dialogs (1x)
  /// * Scaffold (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color on all surfaces.
  ///
  /// In combination with the blend level [FlexColorScheme.blendLevel], it
  /// results in a style where scaffold background has a much lower blend
  /// strength, 1/3x of blend level value and remains mostly unbranded at
  /// low blend levels. Surface uses the blend level value, and
  /// background gets 3/2x the blend level value.
  ///
  /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] can be used to
  /// replace the style that was produced when using old and removed
  /// `FlexColorScheme.surfaceStyle` enum property `FlexSurface` in
  /// [FlexColorScheme.light] and [FlexColorScheme.dark] before version 4.
  ///
  /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] uses the same
  /// design concept as the only style offered via removed `FlexSurface`
  /// in `FlexColorScheme.surfaceStyle` that was in use before version 4,
  /// and deprecated in version 4.2 and removed in version 5.0.0.
  ///
  /// By adjusting the [FlexColorScheme.blendLevel] property and using this
  /// style, you can find a similar visual effect when using
  /// [FlexSurfaceMode.highBackgroundLowScaffold] with the following values when
  /// matching match most prominent blended [ColorScheme.background] color.
  ///
  /// In light theme mode:
  ///
  /// * [FlexSurface.material] 0% : blendLevel = 0
  /// * [FlexSurface.light]    2% : blendLevel = 3...4
  /// * [FlexSurface.medium]   4% : blendLevel = 7
  /// * [FlexSurface.strong]   6% : blendLevel = 10
  /// * [FlexSurface.heavy]    8% : blendLevel = 13...14
  ///
  /// In dark theme mode:
  ///
  /// * [FlexSurface.material] 0% : blendLevel = 0
  /// * [FlexSurface.light]    5% : blendLevel = 8
  /// * [FlexSurface.medium]   8% : blendLevel = 13...14
  /// * [FlexSurface.strong]  11% : blendLevel = 19
  /// * [FlexSurface.heavy]   14% : blendLevel = 23
  ///
  /// Since there is not the same relationship between background and
  /// surface, when using the older [FlexSurface] based style, that uses
  /// individually tuned relationships. The old and new designs do never
  /// align exactly at any blendLevel. The above values produce visually
  /// similar results for the most prominent background color blend.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces],
  /// [levelSurfacesLowScaffoldVariantDialog] and
  /// [highScaffoldLowSurfacesVariantDialog]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// When using very strong surface branding in dark mode, having an overlay
  /// elevation color in dark mode is less critical, since the elevation
  /// becomes partially visible via shadows and the surface may even have
  /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
  /// or [highScaffoldLowSurfacesVariantDialog].
  highBackgroundLowScaffold,

  /// Decreasing blend level in order surface, background, scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surface & dialogs (3/2x)
  /// * Background (1x)
  /// * Scaffold (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color on all surfaces.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// When using very strong surface branding in dark mode, having an overlay
  /// elevation color in dark mode is less critical, since the elevation
  /// becomes partially visible via shadows and the surface may even have
  /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
  /// or [highScaffoldLowSurfacesVariantDialog].
  highSurfaceLowScaffold,

  /// Decreasing blend level in order scaffold, background, surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Background (1x)
  /// * Surface & dialogs (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color on all surfaces.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// When using very strong surface branding in dark mode, having an overlay
  /// elevation color in dark mode is less critical, since the elevation
  /// becomes partially visible via shadows and the surface may even have
  /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
  /// or [highScaffoldLowSurfacesVariantDialog].
  highScaffoldLowSurface,

  /// Decreasing blend level in order scaffold, background, surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Background (3/2x)
  /// * Surface (1x)
  ///
  /// Theme colorScheme.primary color is used as blend color on all surfaces.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// When using very strong surface branding in dark mode, having an overlay
  /// elevation color in dark mode is less critical, since the elevation
  /// becomes partially visible via shadows and the surface may even have
  /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
  /// or [highScaffoldLowSurfacesVariantDialog].
  highScaffoldLevelSurface,

  /// Decreasing blend level in order background & surface, scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surface & background (1x)
  /// * Scaffold (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color.
  ///
  /// This mode results in elevation overlay color on [Material] type
  /// [MaterialType.card], [MaterialType.canvas] and [MaterialType.circle]
  /// themed background color in dark theme mode. In surface modes that
  /// use different blend strengths and blend color, that differs from the value
  /// used for colorScheme.surface, those [Material] surfaces will not get
  /// elevation overlay color in dark mode, even if set to on. For more
  /// information see issue: https://github.com/flutter/flutter/issues/90353
  levelSurfacesLowScaffold,

  /// Decreasing blend level in order scaffold, background & surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Surface & background (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color.
  ///
  /// This mode results in elevation overlay color on [Material] type
  /// [MaterialType.card], [MaterialType.canvas] and [MaterialType.circle]
  /// themed background color in dark theme mode. In surface modes that
  /// use different blend strengths and blend color, that differs from the value
  /// used for colorScheme.surface, those [Material] surfaces will not get
  /// elevation overlay color in dark mode, even if set to on. For more
  /// information see issue: https://github.com/flutter/flutter/issues/90353
  highScaffoldLowSurfaces,

  /// Decreasing blend level in order background & surface, scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surface, background, dialogs (1x)
  /// * Scaffold (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color, but dialog
  /// background color uses theme colorScheme.secondaryContainer as its
  /// blend color.
  ///
  /// This modes results in elevation overlay color on all Material types and
  /// background colors in dark theme mode, except dialogs that do NOT get any
  /// elevation overlay color. This happens because Dialogs use the
  /// colorScheme.tertiary color for their blend color which typically
  /// differs from the primary color used on surface color.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use elevation overlay
  /// if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// The color scheme secondary variant color is a good place in theme colors
  /// to store a custom color you may want to use for special elements on custom
  /// widgets in your application. The secondary variant color is not used
  /// by default by any widget in Flutter SDK, so it can be assigned a color
  /// without affecting any default color behavior of SDK widgets. If you do so
  /// and want to get some funky dialog blends using this color, you can use
  /// this surface mode.
  levelSurfacesLowScaffoldVariantDialog,

  /// Decreasing blend level in order scaffold, background & surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Surface, background, dialogs (1/2x)
  ///
  /// Theme colorScheme.primary color is used as blend color, but dialog
  /// background uses theme colorScheme.secondaryContainer as its blend color.
  ///
  /// This modes results in elevation overlay color on all Material types and
  /// background colors in dark theme mode, except dialogs that do NOT get any
  /// elevation overlay color. This happens because Dialogs use the
  /// colorScheme.tertiary color for their blend color which typically
  /// differs from the primary color used on surface color.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color equals
  /// the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// The color scheme secondary variant color is a good place in theme colors
  /// to store a custom color you may want to use for special elements on custom
  /// widgets in your application. The secondary variant color is not used
  /// by default by any widget in Flutter SDK, so it can be assigned a color
  /// without affecting any default color behavior of SDK widgets. If you do so
  /// and want to get some funky dialog blends using this color, you can use
  /// this surface mode.
  highScaffoldLowSurfacesVariantDialog,

  /// Use your own custom surface and background blend style.
  ///
  /// Use this option and use the [FlexSchemeSurfaceColors.blend] constructor
  /// to make your custom surface colors using the applied blend levels.
  custom,
}
