import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../shared/controllers/theme_controller.dart';
import '../../shared/model/adaptive_response.dart';

/// A sealed class that holds some static theming helper functions.
sealed class ThemeValues {
  /// Return the correct platform effective global border radius setting.
  ///
  /// Depends on platform, its mock version and web and its mock version
  /// and config for if standard or adaptive radius is used on this
  /// mocked platform and mocked web, or actual ones.
  static double? effectiveRadius(ThemeController controller) {
    // Get standard border radius value
    final double? normalRadius = controller.defaultRadius;
    // Get adaptive border radius value
    final double? adaptiveRadius = controller.defaultRadiusAdaptive;
    // Get effective platform
    final TargetPlatform platform =
        controller.platform ?? defaultTargetPlatform;
    // Get fake web platform
    final bool? isWeb = controller.fakeIsWeb;
    // Get Adaptive Settings usage.
    final AdaptiveResponse adaptiveConfig =
        controller.adaptiveResponseRadius ?? AdaptiveResponse.off;
    // Should we use adaptive radius or not?
    final bool adapt = adaptiveConfig.setting(isWeb).adapt(platform, isWeb);
    // Return the effective platform default radius, may be null.
    return adapt ? adaptiveRadius : normalRadius;
  }

  // TODO(rydmike): This is no longer used. Remove it after a while.
  /// Return the correct platform effective dialog border radius setting.
  ///
  /// Depends on platform, its mock version and web and its mock version
  /// and config for if standard or adaptive radius is used on this
  /// mocked platform and mocked web, or actual ones.
  // static double? effectiveDialogRadius(ThemeController controller) {
  //   // Get standard border radius value
  //   final double? normalRadius = controller.dialogBorderRadius;
  //   // Get adaptive border radius value
  //   final double? adaptiveRadius = controller.dialogBorderRadiusAdaptive;
  //   // Get effective platform
  //   final TargetPlatform platform =
  //       controller.platform ?? defaultTargetPlatform;
  //   // Get fake web platform
  //   final bool? isWeb = controller.fakeIsWeb;
  //   // Get Adaptive Settings usage.
  //   final AdaptiveResponse adaptiveConfig =
  //       controller.adaptiveResponseDialogRadius ?? AdaptiveResponse.off;
  //   // Should we use adaptive radius or not?
  //   final bool adapt = adaptiveConfig.setting(isWeb).adapt(platform, isWeb);
  //   // Return the effective platform default radius, can be null for Flutter
  //   // default values.
  //   return adapt ? adaptiveRadius : normalRadius;
  // }

  // Return ListTile content padding for a ListTile used in two column layout,
  // for the first column, that respects the themed content padding and
  // Material3 and Material2 padding logic.
  static EdgeInsetsGeometry? tilePaddingStart(BuildContext context,
      [bool isRow = true]) {
    // If padding is for a single ListTile, return null.
    if (!isRow) return null;
    // Else return the padding for the ListTile in the first/start column.
    final EdgeInsetsGeometry? padding =
        Theme.of(context).listTileTheme.contentPadding;
    if (padding == null) {
      return const EdgeInsetsDirectional.only(start: 16, end: 8);
    } else if (padding is EdgeInsetsDirectional) {
      return EdgeInsetsDirectional.fromSTEB(
          padding.start, padding.top, padding.end / 2, padding.bottom / 2);
    } else {
      return padding;
    }
  }

  // Return ListTile content padding for a ListTile used in two column layout,
  // for the second column, that respects the themed content padding and
  // Material3 and Material2 padding logic.
  static EdgeInsetsGeometry? tilePaddingEnd(BuildContext context,
      [bool isRow = true]) {
    // If padding is for a single ListTile, return null.
    if (!isRow) return null;
    // Else return the padding for the ListTile in the second/end column.
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final EdgeInsetsGeometry? padding = theme.listTileTheme.contentPadding;
    if (padding == null) {
      return EdgeInsetsDirectional.only(start: 8, end: useMaterial3 ? 24 : 16);
    } else if (padding is EdgeInsetsDirectional) {
      return EdgeInsetsDirectional.fromSTEB(
          padding.start / 2, padding.top, padding.end, padding.bottom);
    } else {
      return padding;
    }
  }
}

// Enum helper to get the default padding values for the input decorator.
enum DecoratorDefault {
  start,
  top,
  end,
  bottom;

  double padding(ThemeController controller) {
    // Input content padding logic, default is zero, true when collapsed used,
    // but we do not really offer that option, but used as init values.
    double defaultStartPadding = 0;
    double defaultTopPadding = 0;
    double defaultEndPadding = 0;
    double defaultBottomPadding = 0;
    // This complex logic is needed to show the default padding values for the
    // the content padding. The values are taken from hard coded values
    // in the `ìnput_decorator.dart` around lines 2396 to 2433 when this was
    // written.
    // There is also internal constraints in the `InputDecorator` impacting
    // the effective padding, changing them from the defaults. So these default
    // values are not used in all cases.
    if (controller.inputDecoratorBorderType == FlexInputBorderType.underline) {
      if (controller.inputDecoratorIsFilled) {
        if (controller.useMaterial3) {
          if (controller.inputDecoratorIsDense) {
            defaultStartPadding = 12;
            defaultTopPadding = 4;
            defaultEndPadding = 12;
            defaultBottomPadding = 4;
          } else {
            defaultStartPadding = 12;
            defaultTopPadding = 8;
            defaultEndPadding = 12;
            defaultBottomPadding = 8;
          }
          // Using Material2
        } else {
          if (controller.inputDecoratorIsDense) {
            defaultStartPadding = 12;
            defaultTopPadding = 8;
            defaultEndPadding = 12;
            defaultBottomPadding = 8;
          } else {
            defaultStartPadding = 12;
            defaultTopPadding = 12;
            defaultEndPadding = 12;
            defaultBottomPadding = 12;
          }
        }
        // The underline border type, is NOT filled.
      } else {
        if (controller.useMaterial3) {
          if (controller.inputDecoratorIsDense) {
            defaultStartPadding = 0;
            defaultTopPadding = 4;
            defaultEndPadding = 0;
            defaultBottomPadding = 4;
          } else {
            defaultStartPadding = 0;
            defaultTopPadding = 8;
            defaultEndPadding = 0;
            defaultBottomPadding = 8;
          }
          // Using Material2
        } else {
          if (controller.inputDecoratorIsDense) {
            defaultStartPadding = 0;
            defaultTopPadding = 8;
            defaultEndPadding = 0;
            defaultBottomPadding = 8;
          } else {
            defaultStartPadding = 0;
            defaultTopPadding = 12;
            defaultEndPadding = 0;
            defaultBottomPadding = 12;
          }
        }
      }
      // Using outline border type
    } else {
      if (controller.useMaterial3) {
        if (controller.inputDecoratorIsDense) {
          defaultStartPadding = 12;
          defaultTopPadding = 16;
          defaultEndPadding = 12;
          defaultBottomPadding = 8;
        } else {
          defaultStartPadding = 12;
          defaultTopPadding = 20;
          defaultEndPadding = 12;
          defaultBottomPadding = 12;
        }
        // Using Material2
      } else {
        if (controller.inputDecoratorIsDense) {
          defaultStartPadding = 12;
          defaultTopPadding = 20;
          defaultEndPadding = 12;
          defaultBottomPadding = 12;
        } else {
          defaultStartPadding = 12;
          defaultTopPadding = 24;
          defaultEndPadding = 12;
          defaultBottomPadding = 16;
        }
      }
    }
    switch (this) {
      case DecoratorDefault.start:
        return defaultStartPadding;
      case DecoratorDefault.top:
        return defaultTopPadding;
      case DecoratorDefault.end:
        return defaultEndPadding;
      case DecoratorDefault.bottom:
        return defaultBottomPadding;
    }
  }

  // Return the default padding as a label.
  String asLabel(ThemeController controller) {
    final double padding = this.padding(controller);
    return '${padding.toStringAsFixed(0)} dp';
  }
}
