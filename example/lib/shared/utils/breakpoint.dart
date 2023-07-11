import 'package:flutter/material.dart';

enum WindowSize {
  xxsmall,
  xsmall,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
  xxxlarge
}

enum LayoutClass {
  smallWatch,
  largeWatch,
  smallHandset,
  mediumHandset,
  largeHandset,
  smallTablet,
  largeTablet,
  desktop,
  largeDesktop,
  hugeDesktop
}

enum BreakType { material, large }

/// This class provides a breakpoint system for your Flutter app.
///
/// Material 2 Design specifies responsive layouts based on Layouts using
/// 4-column, 8-column, and 12-column grids that are available for use across
/// different screens, devices, and orientations.
///
/// This [Breakpoint] class is a modification and enhancement of Rody Davis
/// breakpoint package: https://pub.dev/packages/breakpoint. It also fixes that
/// the orientation was not considered correctly for the returned layout class.
///
/// The default type [BreakType.material] follows the Material 2 Design Guide
/// https://material.io/design/layout/responsive-layout-grid.html#grid-behavior
///
/// This version also provides another layout type called [BreakType.large],
/// that has more even column spread over the width and it is using
/// a bit denser gutters and has up to max 24 columns at 4k media sizes.
/// The [BreakType.large] name refers to that it is more suitable
/// for large 4k screen layouts. It actually returns a bit
/// fewer columns at lower resolutions and distributes the columns
/// returned more evenly as resolution increase. It returns up 24 columns for
/// very large screens, instead of the maximum 12 in Material breakpoints.
///
/// Use a layout builder to get [BoxConstraints].
///
/// The [WindowSize.xxsmall] and [WindowSize.xxlarge], [WindowSize.xxxlarge]
/// are custom additions to the Material
/// Design Guidelines window sizes. Apple watch [LayoutClass.smallWatch] and
/// [LayoutClass.largeWatch] has also been added to the enum [LayoutClass].
//
// 17.4.2020 Added 24 columns and new column reducer [usedColumns] function
// and optional properties it needs. The API is backwards compatible.

class Breakpoint {
  const Breakpoint({
    required this.columns,
    required this.gutters,
    required this.device,
    required this.window,
    required this.orientation,
  });

  /// Number of columns for content
  final int columns;

  /// Spacing between columns
  final double gutters;

  /// The [device] is a [LayoutClass] and can be smallWatch, largeWatch,
  /// smallHandset, mediumHandset, largeHandset, smallTablet, largeTablet,
  /// desktop, largeDesktop and hugeDesktop
  final LayoutClass device;

  /// The [window] is a [WindowSize] and can be xxsmall, xsmall, small, medium,
  /// large, xlarge, xxlarge, xxxlarge
  final WindowSize window;

  /// Current device orientation
  final Orientation orientation;

  /// Create breakpoint data from the current box constraints that are passed
  /// in.
  ///
  /// The default type [BreakType.material] follows the Material Design Guide
  /// [https://material.io/design/layout/responsive-layout-grid.html#grid-behavior]
  /// The optional layout [BreakType.large] has smaller gutters
  /// and more columns (24) and more column distribution. It also includes
  /// watch and large desktop classes suitable for 4 screen.
  ///
  /// Use a layout builder to get [BoxConstraints]
  factory Breakpoint.fromConstraints(
    BoxConstraints constraints, {
    BreakType type = BreakType.material,
    int? columnInterval,
    double? minColumnSize,
  }) {
    /// The predefined amount of columns for the BreakType for a given width
    /// will be returned if columnsInterval is null or minColumnSize is null.
    assert(
        columnInterval == null || (columnInterval >= 1 && columnInterval <= 24),
        'columnInterval must be null or from 1 to 24');
    assert(
        minColumnSize == null ||
            (minColumnSize >= 137 / 2 && minColumnSize <= 8192),
        'MinColumnSize must be null or from 137/2 (=two columns on a small watch) '
        ' to 8192 (=1 column on a 8k screen)');

    double width = 359;
    Orientation orientation = Orientation.portrait;

    if (constraints.debugAssertIsValid()) {
      width = constraints.normalize().maxWidth;
      orientation = constraints.maxHeight > constraints.maxWidth
          ? Orientation.portrait
          : Orientation.landscape;
    }

    return type == BreakType.material
        ? Breakpoint._calcBreakpoint(
            orientation: orientation,
            width: width,
            columnInterval: columnInterval,
            minColumnSize: minColumnSize,
          )
        : Breakpoint._calcBreakpointLarge(
            orientation: orientation,
            width: width,
            columnInterval: columnInterval,
            minColumnSize: minColumnSize,
          );
  }

  /// Create breakpoint data from the current Media context that is passed in.
  ///
  /// The default type [BreakType.material] follows the Material Design Guide
  /// [https://material.io/design/layout/responsive-layout-grid.html#grid-behavior]
  /// The optional layout [BreakType.large] has smaller gutters
  /// and more columns (24) and more column distribution. It also includes
  /// watch and large desktop classes suitable for 4 screen.
  ///
  /// Uses [BuildContext] and [MediaQuery] to calculate the device breakpoint.
  ///
  /// Use [Breakpoint.fromConstraints] when the widget does not take up the
  /// full screen
  factory Breakpoint.fromMediaQuery(
    BuildContext context, {
    BreakType type = BreakType.material,
    int? columnInterval,
    double? minColumnSize,
  }) {
    /// The predefined amount of columns for the BreakType for a given width
    /// will be returned if columnsSpace is null or minColumnSize is null.
    assert(
        columnInterval == null || (columnInterval >= 1 && columnInterval <= 24),
        'columnInterval must be null or from 1 to 24');
    assert(
        minColumnSize == null ||
            (minColumnSize >= 137 / 2 && minColumnSize <= 8192),
        'MinColumnSize must be null or from 137/2 (=two columns on a small watch) '
        ' to 8192 (=1 column on a 8k screen)');

    final double width = MediaQuery.sizeOf(context).width;
    final Orientation orientation = MediaQuery.orientationOf(context);

    if (type == BreakType.material) {
      return Breakpoint._calcBreakpoint(
        orientation: orientation,
        width: width,
        columnInterval: columnInterval,
        minColumnSize: minColumnSize,
      );
    } else {
      return Breakpoint._calcBreakpointLarge(
        orientation: orientation,
        width: width,
        columnInterval: columnInterval,
        minColumnSize: minColumnSize,
      );
    }
  }

  /// The private factory [Breakpoint._calcBreakpoint] follows the
  /// Material Design Guidelines for breakpoints:
  /// [https://material.io/design/layout/responsive-layout-grid.html#grid-behavior]
  factory Breakpoint._calcBreakpoint({
    required Orientation orientation,
    required double width,
    int? columnInterval,
    double? minColumnSize,
  }) {
    final bool isPortrait = orientation == Orientation.portrait;

    if (width >= 1920) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 12,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: LayoutClass.desktop,
        window: WindowSize.xlarge,
        orientation: orientation,
      );
    }
    if (width >= 1600) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 12,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: LayoutClass.desktop,
        window: WindowSize.large,
        orientation: orientation,
      );
    }
    if (width >= 1440) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 12,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: LayoutClass.desktop,
        window: WindowSize.large,
        orientation: orientation,
      );
    }
    if (width >= 1280) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 12,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: isPortrait ? LayoutClass.desktop : LayoutClass.largeTablet,
        window: WindowSize.medium,
        orientation: orientation,
      );
    }
    if (width >= 1024) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 12,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: isPortrait ? LayoutClass.desktop : LayoutClass.largeTablet,
        window: WindowSize.medium,
        orientation: orientation,
      );
    }
    if (width >= 960) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 12,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: isPortrait ? LayoutClass.desktop : LayoutClass.smallTablet,
        window: WindowSize.small,
        orientation: orientation,
      );
    }
    if (width >= 840) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 12,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: isPortrait ? LayoutClass.largeTablet : LayoutClass.largeHandset,
        window: WindowSize.small,
        orientation: orientation,
      );
    }
    if (width >= 720) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 8,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: isPortrait ? LayoutClass.largeTablet : LayoutClass.largeHandset,
        window: WindowSize.small,
        orientation: orientation,
      );
    }
    if (width >= 600) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 8,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 16,
        device:
            isPortrait ? LayoutClass.smallTablet : LayoutClass.mediumHandset,
        window: WindowSize.small,
        orientation: orientation,
      );
    }
    if (width >= 480) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 4,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 16,
        device:
            isPortrait ? LayoutClass.largeHandset : LayoutClass.smallHandset,
        window: WindowSize.xsmall,
        orientation: orientation,
      );
    }
    if (width >= 400) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 4,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 16,
        device: LayoutClass.largeHandset,
        window: WindowSize.xsmall,
        orientation: orientation,
      );
    }
    if (width >= 360) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 4,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 16,
        device: LayoutClass.mediumHandset,
        window: WindowSize.xsmall,
        orientation: orientation,
      );
    }
    return Breakpoint(
      columns: usedColumns(
        numberOfColumns: 4,
        width: width,
        columnSpace: columnInterval,
        minColumnSize: minColumnSize,
      ),
      gutters: 16,
      device: LayoutClass.smallHandset,
      window: WindowSize.xsmall,
      orientation: orientation,
    );
  }

  /// The private breakpoint [Breakpoint._calcBreakpointLarge] calculation
  /// does not follow the Material Design Guidelines for breakpoints
  /// [https://material.io/design/layout/responsive-layout-grid.html#grid-behavior].
  /// It is modified to use a bit different breakpoint values with more
  /// granularity and a bit tighter layout. It also contains layout
  /// classification for detecting Apple watch, which is just based on size.
  /// The watch size breakpoints are based on these pixel dimensions:
  /// https://www.natashatherobot.com/watchkit-check-device-screen-size-in-code/
  ///
  /// There is also a [WindowSize.xxlarge] and [WindowSize.xxxlarge]
  /// Window size and [LayoutClass.largeDesktop] and [LayoutClass.hugeDesktop]
  /// devices, last one is for 4k and larger screens. The calculation also
  /// includes and handles breakpoints for upp to 4k screens providing a
  /// total of max 24 columns instead of max 12 columns as in Material.
  factory Breakpoint._calcBreakpointLarge({
    required Orientation orientation,
    required double width,
    int? columnInterval,
    double? minColumnSize,
  }) {
    final bool isPortrait = orientation == Orientation.portrait;

    if (width >= 3840) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 24,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 28,
        device: LayoutClass.hugeDesktop,
        window: WindowSize.xxxlarge,
        orientation: orientation,
      );
    }
    if (width >= 3440) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 22,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 26,
        device: LayoutClass.hugeDesktop,
        window: WindowSize.xxxlarge,
        orientation: orientation,
      );
    }
    if (width >= 3120) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 20,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: LayoutClass.hugeDesktop,
        window: WindowSize.xxxlarge,
        orientation: orientation,
      );
    }
    if (width >= 2880) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 18,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 24,
        device: LayoutClass.largeDesktop,
        window: WindowSize.xxlarge,
        orientation: orientation,
      );
    }
    if (width >= 2560) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 16,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 22,
        device: LayoutClass.largeDesktop,
        window: WindowSize.xxlarge,
        orientation: orientation,
      );
    }
    if (width >= 2100) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 14,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 22,
        device: LayoutClass.largeDesktop,
        window: WindowSize.xxlarge,
        orientation: orientation,
      );
    }
    if (width >= 1920) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 12,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 22,
        device: LayoutClass.desktop,
        window: WindowSize.xlarge,
        orientation: orientation,
      );
    }
    if (width >= 1600) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 12,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 20,
        device: LayoutClass.desktop,
        window: WindowSize.large,
        orientation: orientation,
      );
    }
    if (width >= 1440) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 10,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 20,
        device: LayoutClass.desktop,
        window: WindowSize.large,
        orientation: orientation,
      );
    }
    if (width >= 1280) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 10,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 18,
        device: isPortrait ? LayoutClass.desktop : LayoutClass.largeTablet,
        window: WindowSize.medium,
        orientation: orientation,
      );
    }
    if (width >= 1024) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 8,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 18,
        device: isPortrait ? LayoutClass.desktop : LayoutClass.largeTablet,
        window: WindowSize.medium,
        orientation: orientation,
      );
    }
    if (width >= 960) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 8,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 16,
        device: isPortrait ? LayoutClass.largeTablet : LayoutClass.smallTablet,
        window: WindowSize.small,
        orientation: orientation,
      );
    }
    if (width >= 840) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 6,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 16,
        device: isPortrait ? LayoutClass.largeTablet : LayoutClass.largeHandset,
        window: WindowSize.small,
        orientation: orientation,
      );
    }
    if (width >= 720) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 6,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 14,
        device: isPortrait ? LayoutClass.largeTablet : LayoutClass.largeHandset,
        window: WindowSize.small,
        orientation: orientation,
      );
    }
    if (width >= 700) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 6,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 14,
        device:
            isPortrait ? LayoutClass.smallTablet : LayoutClass.mediumHandset,
        window: WindowSize.small,
        orientation: orientation,
      );
    }
    if (width >= 600) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 6,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 12,
        device:
            isPortrait ? LayoutClass.smallTablet : LayoutClass.mediumHandset,
        window: WindowSize.small,
        orientation: orientation,
      );
    }
    if (width >= 480) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 4,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 12,
        device:
            isPortrait ? LayoutClass.largeHandset : LayoutClass.smallHandset,
        window: WindowSize.xsmall,
        orientation: orientation,
      );
    }
    if (width >= 400) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 4,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 12,
        device: LayoutClass.largeHandset,
        window: WindowSize.xsmall,
        orientation: orientation,
      );
    }
    if (width >= 360) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 4,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 10,
        device: LayoutClass.mediumHandset,
        window: WindowSize.xsmall,
        orientation: orientation,
      );
    }
    if (width >= 280) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 4,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 8,
        device: LayoutClass.smallHandset,
        window: WindowSize.xsmall,
        orientation: orientation,
      );
    }
    if (width >= 171) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 2,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 8,
        device: isPortrait ? LayoutClass.smallHandset : LayoutClass.largeWatch,
        window: WindowSize.xxsmall,
        orientation: orientation,
      );
    }
    if (width >= 137) {
      return Breakpoint(
        columns: usedColumns(
          numberOfColumns: 2,
          width: width,
          columnSpace: columnInterval,
          minColumnSize: minColumnSize,
        ),
        gutters: 8,
        device: isPortrait ? LayoutClass.largeWatch : LayoutClass.smallWatch,
        window: WindowSize.xxsmall,
        orientation: orientation,
      );
    }
    return Breakpoint(
      columns: usedColumns(
        numberOfColumns: 2,
        width: width,
        columnSpace: columnInterval,
        minColumnSize: minColumnSize,
      ),
      gutters: 8,
      device: LayoutClass.smallWatch,
      window: WindowSize.xxsmall,
      orientation: orientation,
    );
  }

  /// The static helper function [useColumns] is used with grid and column
  /// layouts to reduce the amount of columns used in the layout compared
  ///
  /// In the other version [useColumns], give it the columns from your
  /// [Breakpoint] layout and provide it an int [divisor] with a value
  /// from 1 to 24. It returns the floor of the columns divided with [divisor].
  /// It always returns at least 1 as the columns to use.
  static int useColumns(int availableColumns, int divisor) {
    // It is bad style to modify passed in parameters, so we make local
    // copies that we modify as needed for validity checks.
    int usableColumns = availableColumns;
    int divideBy = divisor;

    if (usableColumns < 1 || usableColumns > 24) usableColumns = 1;

    if (divideBy < 1 || divideBy > 24) divideBy = 1;
    return (usableColumns / divideBy).floor() < 1
        ? 1
        : (usableColumns / divideBy).floor();
  }

  /// Return number of columns to use for a given width or breakpoint
  static int usedColumns({
    int? numberOfColumns,
    double? width,
    int? columnSpace,
    double? minColumnSize,
  }) {
    // It is bad style to modify passed in parameters, so we make local
    // copies further below that we modify as needed for validity checks.
    // Make sure numberOfColumns is valid and force it valid if it is not.
    // If it had an invalid input we just use 1 column as columns available.
    int effectiveColumns = numberOfColumns ?? 1;
    if (effectiveColumns < 1 || effectiveColumns > 24) effectiveColumns = 1;

    // If the columnSpace input is null or 1
    // AND the minColumnSize is invalid, then we return numberOfColumns
    // as available columns, basically we did not specify any method
    // for reducing the available columns, so we use all available columns at
    // the given breakpoint.
    if ((columnSpace == null || columnSpace == 1) &&
        (minColumnSize == null ||
            minColumnSize <= 137 / 2 ||
            minColumnSize > 8192)) return effectiveColumns;

    // If columnSpace input was invalid, we use 1
    int? usedColumnSpace = columnSpace;
    if (usedColumnSpace != null &&
        (usedColumnSpace < 1 || usedColumnSpace > 24)) {
      usedColumnSpace = 1;
    }

    // Init both usable column count calculation methods to max allowed columns
    int columnsViaColumnInterval = 24;
    int columnsViaMinSize = 24;

    if (usedColumnSpace != null) {
      // Calculate number of columns to use based on how many columns of the
      // available ones should be used. 1 means it takes up 1 of the available
      // ones, 2 uses two of them, etc.
      columnsViaColumnInterval =
          (effectiveColumns / usedColumnSpace).floor() < 1
              ? 1
              : (effectiveColumns / usedColumnSpace).floor();
    }

    // This is a bit ugly, but if passed width was null or smaller
    // than 50dp, we use 50 as input width. We will not allow creation of
    // columns that are smaller than 50dp wide.
    double? effectiveWidth = width;
    if (effectiveWidth == null || effectiveWidth < 50) effectiveWidth = 50;

    if (minColumnSize != null) {
      // Calculate the number of columns to use based on provided
      // minimum column width. This feature can be used to make columns of
      // any min size that just increases proportionally in amount as the
      // width of the screen increases.
      columnsViaMinSize = (effectiveWidth / minColumnSize).floor() < 1
          ? 1
          : (effectiveWidth / minColumnSize).floor();
    }
    // Both ways of providing desired number of columns should not really be
    // used at the same time, but if they were, we use the smaller calculated
    // column amount result, as the usable column count that is returned.
    if (columnsViaColumnInterval <= columnsViaMinSize) {
      return columnsViaColumnInterval;
    } else {
      return columnsViaMinSize;
    }
  }

  /// The device is a watch, any sized watch
  bool get isWatch =>
      device == LayoutClass.smallWatch || device == LayoutClass.largeWatch;

  /// The device is a phone, any sized phone
  bool get isPhone =>
      device == LayoutClass.smallHandset ||
      device == LayoutClass.mediumHandset ||
      device == LayoutClass.largeHandset;

  /// The device is a tablet, any sized tablet
  bool get isTablet =>
      device == LayoutClass.smallTablet || device == LayoutClass.largeTablet;

  /// The device is a desktop, any sized desktop
  bool get isDesktop =>
      device == LayoutClass.desktop ||
      device == LayoutClass.largeDesktop ||
      device == LayoutClass.hugeDesktop;

  /// This is a helper to determine if we are on a handset or not, which is
  /// defined as any size phone or watch
  bool get isHandset =>
      device == LayoutClass.smallHandset ||
      device == LayoutClass.mediumHandset ||
      device == LayoutClass.largeHandset ||
      device == LayoutClass.largeWatch ||
      device == LayoutClass.smallWatch;

  /// If it is not a handset, it is a "large" device, meaning tablet or desktop!
  bool get isLargeDevice => !isHandset;

  @override
  // Just for debugging
  String toString() {
    return '$columns $window $device $orientation';
  }
}

/// Builds a layout from constraints and returns a [Breakpoint.fromConstraints].
///
/// This is a convenience builder that combines an often together needed
/// LayoutBuilder with a Breakpoint. Instead of using a LayoutBuilder and its
/// build method, to calculate a Breakpoint, this BreakpointBuilder can be used
/// instead. The BreakpointBuilder can e.g. be used together with a GridView to
/// create a grid where the amount of columns depends on the returned columns
/// in the [Breakpoint] info from the BreakpointBuilder.
class BreakpointBuilder extends StatelessWidget {
  const BreakpointBuilder({
    super.key,
    required this.builder,
    this.type = BreakType.material,
    this.columnInterval,
    this.minColumnSize,
  });

  final Widget Function(BuildContext, Breakpoint) builder;
  final BreakType type;
  final int? columnInterval;
  final double? minColumnSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return builder(
          context,
          Breakpoint.fromConstraints(
            constraints,
            type: type,
            columnInterval: columnInterval,
            minColumnSize: minColumnSize,
          ),
        );
      },
    );
  }
}
