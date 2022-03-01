import 'package:flutter/material.dart';

/// This is just simple SizedBox with a Card with a passed in label, background
/// and text label color. Used to show the colors of a theme or scheme
/// color property.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class ColorCard extends StatelessWidget {
  const ColorCard({
    Key? key,
    required this.label,
    required this.color,
    required this.textColor,
    this.size = const Size(80, 56),
  }) : super(key: key);

  final String label;
  final Color color;
  final Color textColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Card(
        margin: EdgeInsets.zero,
        color: color,
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: textColor, fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
