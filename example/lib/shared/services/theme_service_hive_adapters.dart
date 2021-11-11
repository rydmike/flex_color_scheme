import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

/// A Hive data type adapter for enum ThemeMode.
class ThemeModeAdapter extends TypeAdapter<ThemeMode> {
  @override
  ThemeMode read(BinaryReader reader) {
    final int index = reader.readInt();
    return ThemeMode.values[index];
  }

  @override
  void write(BinaryWriter writer, ThemeMode obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 150;
}

/// A Hive data type adapter for class Color.
///
/// Not in use now, but plan to use it later.
class ColorAdapter extends TypeAdapter<Color> {
  @override
  Color read(BinaryReader reader) {
    final int value = reader.readInt();
    return Color(value);
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeInt(obj.value);
  }

  @override
  int get typeId => 151;
}

/// A Hive data type adapter for enum FlexSurface.
class FlexSchemeAdapter extends TypeAdapter<FlexScheme> {
  @override
  FlexScheme read(BinaryReader reader) {
    final int index = reader.readInt();
    return FlexScheme.values[index];
  }

  @override
  void write(BinaryWriter writer, FlexScheme obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 152;
}

/// A Hive data type adapter for enum FlexSurfaceMode.
class FlexSurfaceModeAdapter extends TypeAdapter<FlexSurfaceMode> {
  @override
  FlexSurfaceMode read(BinaryReader reader) {
    final int index = reader.readInt();
    return FlexSurfaceMode.values[index];
  }

  @override
  void write(BinaryWriter writer, FlexSurfaceMode obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 153;
}

/// A Hive data type adapter for enum FlexTabBarStyle.
class FlexInputBorderTypeAdapter extends TypeAdapter<FlexInputBorderType> {
  @override
  FlexInputBorderType read(BinaryReader reader) {
    final int index = reader.readInt();
    return FlexInputBorderType.values[index];
  }

  @override
  void write(BinaryWriter writer, FlexInputBorderType obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 154;
}

/// A Hive data type adapter for enum FlexAppBarStyle.
class FlexAppBarStyleAdapter extends TypeAdapter<FlexAppBarStyle> {
  @override
  FlexAppBarStyle read(BinaryReader reader) {
    final int index = reader.readInt();
    return FlexAppBarStyle.values[index];
  }

  @override
  void write(BinaryWriter writer, FlexAppBarStyle obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 155;
}

/// A Hive data type adapter for enum FlexTabBarStyle.
class FlexTabBarStyleAdapter extends TypeAdapter<FlexTabBarStyle> {
  @override
  FlexTabBarStyle read(BinaryReader reader) {
    final int index = reader.readInt();
    return FlexTabBarStyle.values[index];
  }

  @override
  void write(BinaryWriter writer, FlexTabBarStyle obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 156;
}

/// A Hive data type adapter for enum FlexSystemNavBarStyle.
class FlexSystemNavBarStyleAdapter extends TypeAdapter<FlexSystemNavBarStyle> {
  @override
  FlexSystemNavBarStyle read(BinaryReader reader) {
    final int index = reader.readInt();
    return FlexSystemNavBarStyle.values[index];
  }

  @override
  void write(BinaryWriter writer, FlexSystemNavBarStyle obj) {
    writer.writeInt(obj.index);
  }

  @override
  int get typeId => 157;
}
