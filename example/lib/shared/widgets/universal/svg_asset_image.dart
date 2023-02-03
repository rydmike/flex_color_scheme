import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';

// ignore_for_file: prefer_asserts_with_message

/// Displays an SVG image provided in the applications asset bundle.
///
/// The [assetName] is the path and name of the SVG file in the asset bundle.
/// This SVG asset display widget is tuned for usage with the Undraw images
/// by Katerina Limpitsouni found at https://undraw.co/
/// The [color] property can be used to change the main color theme in the
/// drawing and thus theme the image to fit with colors used in the application.
class SvgAssetImage extends StatelessWidget {
  const SvgAssetImage({
    super.key,
    required this.assetName,
    required this.color,
    this.semanticLabel,
    this.alignment = Alignment.topCenter,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
    this.padding,
  });

  final String assetName;
  final Color color;
  final String? semanticLabel;
  final Alignment alignment;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final EdgeInsets? padding;

  Future<SvgPicture> renderIllustration(
      final String name, final Color changeColor) async {
    String image = await loadAsset();
    String valueString = changeColor.toString().split('(0x')[1].split(')')[0];
    valueString = valueString.substring(2, valueString.length);

    // Find the default image 'theme' color in the Undraw SVG, and replace
    // the color with another color string value we want to use instead.
    image = image.replaceAll('#6c63ff', '#$valueString');
    return SvgPicture.string(
      image,
      height: height,
      width: width,
      alignment: alignment,
      fit: fit,
      semanticsLabel: semanticLabel,
    );
  }

  Future<String> loadAsset() async {
    return rootBundle.loadString(assetName);
  }

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<SvgPicture>(
      // ignore: discarded_futures, this seems to be a bug in the linter
      future: renderIllustration(assetName, color),
      builder:
          (final BuildContext context, final AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: snapshot.data,
          );
        } else if (snapshot.hasError) {
          return ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: height,
              width: width,
            ),
            child: Center(
              child: errorWidget ?? const Text('Could not load asset image!'),
            ),
          );
        } else {
          return Center(
            child: placeholder ?? const CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
