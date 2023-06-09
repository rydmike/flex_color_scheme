import 'package:flutter/material.dart';

/// A ShapeBorder that can draw left and right side outline borders with
/// different thickness and colors.
class VerticalShapeBorder extends ShapeBorder {
  final double cornerRadius;
  final BorderSide leftSide;
  final BorderSide rightSide;

  const VerticalShapeBorder({
    this.cornerRadius = 8.0,
    this.leftSide = BorderSide.none,
    this.rightSide = BorderSide.none,
  });

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.fromLTRB(leftSide.width, 0, rightSide.width, 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(cornerRadius)));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(cornerRadius)))
      ..addRect(Rect.fromLTWH(
        rect.left,
        rect.top + leftSide.width,
        leftSide.width,
        rect.height - leftSide.width * 2,
      ))
      ..addRect(Rect.fromLTWH(
        rect.right - rightSide.width,
        rect.top + rightSide.width,
        rightSide.width,
        rect.height - rightSide.width * 2,
      ));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (leftSide.style != BorderStyle.none) {
      final Path leftBorderPath = Path()
        ..addRect(Rect.fromLTWH(
          rect.left,
          rect.top + leftSide.width / 2,
          leftSide.width,
          rect.height - leftSide.width,
        ));
      canvas.drawPath(leftBorderPath, leftSide.toPaint());
    }

    if (rightSide.style != BorderStyle.none) {
      final Path rightBorderPath = Path()
        ..addRect(Rect.fromLTWH(
          rect.right - rightSide.width,
          rect.top + rightSide.width / 2,
          rightSide.width,
          rect.height - rightSide.width,
        ));
      canvas.drawPath(rightBorderPath, rightSide.toPaint());
    }
  }

  @override
  ShapeBorder scale(double t) {
    return VerticalShapeBorder(
      cornerRadius: cornerRadius * t,
      leftSide: leftSide.scale(t),
      rightSide: rightSide.scale(t),
    );
  }

  // @override
  // ShapeBorder lerpFrom(ShapeBorder a, double t) {
  //   if (a is CustomShapeBorder) {
  //     return CustomShapeBorder(
  //   cornerRadius: lerpDouble(a.cornerRadius, cornerRadius, t)!,
  //   leftBorderSide: BorderSide.lerp(a.leftBorderSide, leftBorderSide, t)!,
  //   rightBorderSide: BorderSide.lerp(a.rightBorderSide, rightBorderSide, t)!,
  //     );
  //   }
  //   return super.lerpFrom(a, t);
  // }
  //
  // @override
  // ShapeBorder lerpTo(ShapeBorder b, double t) {
  //   if (b is CustomShapeBorder) {
  //     return CustomShapeBorder(
  //       cornerRadius: lerpDouble(cornerRadius, b.cornerRadius, t)!,
  //   leftBorderSide: BorderSide.lerp(leftBorderSide, b.leftBorderSide, t)!,
  //   rightBorderSide: BorderSide.lerp(rightBorderSide, b.rightBorderSide, t)!,
  //     );
  //   }
  //   return super.lerpTo(b, t);
  // }
}
