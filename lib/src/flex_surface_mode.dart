import 'flex_scheme_surface_colors.dart'; // For comment refs.

/// Enum for using predefined surface blend modes for all surfaces and scaffold
/// background colors in FlexColorScheme based themes.
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
  /// * Surfaces & dialogs (2x)
  /// * Scaffold background (1/2x)
  ///
  /// > **NOTE:** Since Flutter 3.22 deprecated the background color, this mode
  /// > in FCS 8.0 and Flutter 3.22, sets surface and dialog blends to 2x
  /// > so that it represents the "high background" style as before, but done
  /// > via surface. Without this breaking change this mode would produce the
  /// > same result [levelSurfacesLowScaffold] and be redundant.
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
