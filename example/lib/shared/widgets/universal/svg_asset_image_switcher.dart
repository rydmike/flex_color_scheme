import 'dart:async' show Timer;
import 'dart:math' show Random;

import 'package:flutter/material.dart';

import 'svg_asset_image.dart';

enum ImageSwitchType { forward, reverse, random }

// Animate between SVG asset images provided as a list of asset name strings.
class SvgAssetImageSwitcher extends StatefulWidget {
  const SvgAssetImageSwitcher({
    super.key,
    required this.assetNames,
    required this.color,
    this.showDuration = const Duration(seconds: 5),
    this.switchDuration = const Duration(milliseconds: 400),
    this.switchType = ImageSwitchType.forward,
    this.semanticLabel,
    this.alignment = Alignment.topCenter,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
    this.padding,
  });

  final List<String> assetNames;
  final Color color;
  final Duration showDuration;
  final Duration switchDuration;
  final ImageSwitchType switchType;
  final String? semanticLabel;
  final Alignment alignment;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final EdgeInsets? padding;

  @override
  State<SvgAssetImageSwitcher> createState() => _SvgAssetImageSwitcherState();
}

class _SvgAssetImageSwitcherState extends State<SvgAssetImageSwitcher> {
  late int oldIndex;
  late int currentIndex;
  late Timer timer;
  late Widget currentImage;

  Widget getNextImage() {
    oldIndex = currentIndex;
    // Show images in default forward direction in the list
    if (widget.switchType == ImageSwitchType.forward) {
      if (currentIndex < widget.assetNames.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
    }
    // Show images in reverse direction in the list
    else if (widget.switchType == ImageSwitchType.reverse) {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = widget.assetNames.length;
      }
    }
    // Show images in random order from the list, but never the same one as
    // the one we have, other than that we don't care which one.
    else {
      do {
        currentIndex = Random().nextInt(widget.assetNames.length);
      } while (currentIndex == oldIndex);
    }

    return SvgAssetImage(
      key: ValueKey<int>(currentIndex),
      assetName: widget.assetNames[currentIndex],
      color: widget.color,
      semanticLabel: widget.semanticLabel,
      alignment: widget.alignment,
      fit: widget.fit,
      height: widget.height,
      width: widget.width,
      placeholder: widget.placeholder,
      errorWidget: widget.errorWidget,
      padding: widget.padding,
    );
  }

  Widget getImageIndex(int index) {
    return SvgAssetImage(
      key: ValueKey<int>(index),
      assetName: widget.assetNames[index],
      color: widget.color,
      semanticLabel: widget.semanticLabel,
      alignment: widget.alignment,
      fit: widget.fit,
      height: widget.height,
      width: widget.width,
      placeholder: widget.placeholder,
      errorWidget: widget.errorWidget,
      padding: widget.padding,
    );
  }

  @override
  void initState() {
    super.initState();
    // Set starting image index
    currentIndex = 0;
    oldIndex = 0;
    if (widget.switchType == ImageSwitchType.forward ||
        widget.switchType == ImageSwitchType.random) {
      currentIndex = 0;
    } else {
      currentIndex = widget.assetNames.length;
    }
    currentImage = getNextImage();
    // If we have random set, we need to get the next image one more time
    // so that we start with a random image as well.
    if (widget.switchType == ImageSwitchType.random) {
      currentImage = getNextImage();
    }
    if (widget.assetNames.length > 1) {
      timer = Timer.periodic(widget.showDuration, (Timer timer) {
        setState(() {
          currentImage = getNextImage();
        });
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return  currentImage;
    if (widget.assetNames.length > 1) {
      return AnimatedSwitcher(
          duration: widget.switchDuration,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: getImageIndex(oldIndex));
    } else {
      return getImageIndex(oldIndex);
    }
  }
}
