import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Displays an Undraw SVG image provided in the applications asset bundle.
///
/// The [assetName] is the path and name of the SVG file in the asset bundle.
/// This SVG asset display widget is tuned for usage with the Undraw images
/// by Katerina Limpitsouni found at https://undraw.co/
/// The [color] property can be used to change the main color theme in the SVG
/// drawing and thus theme the image to fit with colors used in the application.
class SvgAssetImage extends StatefulWidget {
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

  @override
  State<SvgAssetImage> createState() => _SvgAssetImageState();
}

class _SvgAssetImageState extends State<SvgAssetImage> {
  late Future<SvgPicture> svgImage;
  // The SVG asset as loaded from the asset bundle.
  late String assetSvgString;

  // The SVG asset with its color changed.
  late String svgString;

  Future<SvgPicture> _coloredUndrawImage(bool load, Color color) async {
    if (load) assetSvgString = await rootBundle.loadString(widget.assetName);
    String valueString = color.toString().split('(0x')[1].split(')')[0];
    valueString = valueString.substring(2, valueString.length);
    // Find the default image 'theme' color in the Undraw SVG, and replace
    // the color with another color string value we want to use instead.
    // We store the original bundle asset and change colors on the original
    // if the same asset is re-used but with new color. We could use previous
    // color as the one to replace on next go and save some memory. However,
    // the color we changed to earlier, might be same as some other color in
    // SVG that is not a part of the original source color designed in these
    // SVGs to be swapped out for a new one. If we then do th with random colors
    // long enough, the SVG will eventually become monochromatic and all colors
    // equal to the new color.
    svgString = assetSvgString.replaceAll('#6c63ff', '#$valueString');
    return SvgPicture.string(
      key: ValueKey<String>('SVG:${widget.assetName}-$color'),
      svgString,
      height: widget.height,
      width: widget.width,
      alignment: widget.alignment,
      fit: widget.fit,
      semanticsLabel: widget.semanticLabel,
    );
  }

  @override
  void initState() {
    super.initState();
    // False positive, see: https://github.com/dart-lang/linter/issues/3739
    // ignore: discarded_futures
    svgImage = _coloredUndrawImage(true, widget.color);
  }

  @override
  void didUpdateWidget(covariant SvgAssetImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.color != oldWidget.color ||
        widget.assetName != oldWidget.assetName) {
      final bool loadSvgAsset = widget.assetName != oldWidget.assetName;
      // False positive, see: https://github.com/dart-lang/linter/issues/3739
      // ignore: discarded_futures
      svgImage = _coloredUndrawImage(loadSvgAsset, widget.color);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<SvgPicture>(
      future: svgImage,
      builder:
          (final BuildContext context, final AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: widget.padding ?? const EdgeInsets.all(16),
            child: snapshot.data,
          );
        } else if (snapshot.hasError) {
          return ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: widget.height,
              width: widget.width,
            ),
            child: Center(
              child: widget.errorWidget ??
                  const Text('Could not load asset image!'),
            ),
          );
        } else {
          return Center(
            child: widget.placeholder ?? const CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
