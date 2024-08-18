// ignore_for_file: comment_references

/// Enum for using predefined surface blend modes for all surfaces and scaffold
/// background colors in [FlexColorScheme] based themes.
enum FlexSurfaceMode {
  /// All surfaces have same alpha blend level including scaffold background.
  ///
  /// The blend level is at equal strength as set by blendLevel,
  /// the blend strength mix definition is:
  ///
  /// * Surface & dialogs (1x)
  /// * Scaffold background (1x)
  level,

  /// Decreasing blend level in order level surfaces, low scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surfaces & dialogs (1x)
  /// * Scaffold background (1/2x)
  ///
  /// In combination with the blend level [FlexColorScheme.blendLevel], it
  /// results in a style where scaffold background has a much lower blend
  /// strength, 1/2x of blend level value and remains mostly un-tinted at
  /// low blend levels. Surface uses the blend level value.
  ///
  /// > **NOTE:** Since Flutter 3.22 deprecated the background color, this mode
  /// > in FCS 8.0 and Flutter 3.22 and later is redundant, as it produces
  /// > the same result as [levelSurfacesLowScaffold].
  highBackgroundLowScaffold,

  /// Decreasing blend level in order high surface, low scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surfaces & dialogs (3/2x)
  /// * Scaffold (1/2x)
  highSurfaceLowScaffold,

  /// Decreasing blend level in order very high scaffold, low surfaces.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Surface & dialogs (1/2x)
  highScaffoldLowSurface,

  /// Decreasing blend level in order very high scaffold, levl surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Surfaces & dialogs (1x)
  highScaffoldLevelSurface,

  /// Decreasing blend level in order level surfaces, low scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surfaces & dialogs (1x)
  /// * Scaffold (1/2x)
  ///
  /// > **NOTE:** Since Flutter 3.22 deprecated the background color, them mode
  /// > [highBackgroundLowScaffold] will in FCS 8.0 and Flutter 3.22 produce
  /// > the same result as this mode.
  levelSurfacesLowScaffold,

  /// Decreasing blend level in order very high scaffold, low surfaces.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Surfaces & dialogs (1/2x)
  highScaffoldLowSurfaces,

  /// Decreasing blend level in order level surfaces, low scaffold.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Surfaces & dialogs (1x)
  /// * Scaffold (1/2x)
  ///
  /// Theme ColorScheme surfaceTint color is used as blend color by default,
  /// but dialog background color uses theme ColorScheme tertiaryContainer
  /// as its blend color.
  levelSurfacesLowScaffoldVariantDialog,

  /// Decreasing blend level in order very high scaffold, low surface.
  ///
  /// The blend level decreases on surfaces in this order:
  ///
  /// * Scaffold (3x)
  /// * Surfaces & dialogs (1/2x)
  ///
  /// Theme ColorScheme surfaceTint color is used as blend color by default,
  /// but dialog background color uses theme ColorScheme tertiaryContainer
  /// as its blend color.
  highScaffoldLowSurfacesVariantDialog,

  /// Use your own custom surface and background blend style.
  ///
  /// Use this option and use the [FlexSchemeSurfaceColors.blend] constructor
  /// to make your custom surface colors using the applied blend levels.
  custom,
}
