// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// NavigationRail shows if the screen width is greater or equal to
// kNarrowScreenWidthThreshold; otherwise, NavigationBar is used for navigation.
// (rydmike): This breakpoint did not work in Google sample, fixed.
//            needed another animation controller with own AnimationBuilder.
const double kNarrowScreenWidthThreshold = 600;
// Set these breakpoints so they show and get used on tablets in demo.
const double kMediumWidthBreakpoint = 830; // iPad 810, Air 820, Pro11 834
const double kLargeWidthBreakpoint = 1023; // iPad 12" is 1024
// Added this to make the expanded rail a bit more narrow.
const double kRailExpandedWidth = 180;
const double kTransitionLength = 500;

enum ScreenSelected {
  component(0),
  color(1),
  typography(2),
  elevation(3);

  const ScreenSelected(this.value);
  final int value;
}
