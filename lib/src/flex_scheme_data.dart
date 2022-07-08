import 'package:flutter/foundation.dart';

import 'flex_scheme_color.dart';

// ignore_for_file: comment_references

/// Immutable data class that holds [name] and [description] string scheme
/// descriptions, [light] and [dark], [FlexSchemeColor] definitions.
///
/// The [FlexSchemeData] bundles together a [FlexSchemeColor] pair suitable
/// for light and dark theme mode, that can used by the FlexColorScheme.light
/// and FlexColorScheme.dark factories to create a FlexColorScheme and
/// corresponding [ThemeData] from it.
///
/// This class can also be used to make a map with [FlexScheme] enum or some
/// other usable lookup value as key, and [FlexSchemeData] as values, that you
/// can then use as input to define multiple theme options for FlexColorScheme
/// based themes.
///
/// A predefined example of a [FlexScheme] and [FlexSchemeData] maps are
/// available in [FlexColor.schemes] and [FlexColor.schemesWithCustom].
@immutable
class FlexSchemeData with Diagnosticable {
  /// Default constructor, used to make an immutable FlexSchemeData object.
  ///
  /// Contains [name], [description] plus [light] and [dark] scheme colors.
  const FlexSchemeData({
    required this.name,
    required this.description,
    required this.light,
    required this.dark,
  });

  /// A short name for the [FlexSchemeData] based color scheme.
  final String name;

  /// A longer description of the [FlexSchemeData] based color scheme.
  final String description;

  /// The light scheme colors used by this [FlexSchemeData].
  final FlexSchemeColor light;

  /// The dark scheme colors used by this [FlexSchemeData].
  final FlexSchemeColor dark;

  /// Copy the object with one or more provided properties changed.
  FlexSchemeData copyWith({
    final String? name,
    final String? description,
    final FlexSchemeColor? light,
    final FlexSchemeColor? dark,
  }) {
    return FlexSchemeData(
      name: name ?? this.name,
      description: description ?? this.description,
      light: light ?? this.light,
      dark: dark ?? this.dark,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexSchemeData &&
        other.name == name &&
        other.description == description &&
        other.light == light &&
        other.dark == dark;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hash(
        name,
        description,
        light,
        dark,
      );

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
    properties.add(StringProperty('description', description));
    properties.add(DiagnosticsProperty<FlexSchemeColor>('light', light));
    properties.add(DiagnosticsProperty<FlexSchemeColor>('dark', dark));
  }
}
