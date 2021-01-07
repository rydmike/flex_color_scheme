import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the examples.

// An URL link TextSpan that contain an URL link that can be used as a
// working URL link text when using it in a [Text.rich] or lower
// level [RichText] widget.
//
// This class was found in the Flutter Gallery app, including the comment below.
class LinkTextSpan extends TextSpan {
  // Beware!
  // This class is only safe because the TapGestureRecognizer is not
  // given a deadline and therefore never allocates any resources.
  // In any other situation -- setting a deadline, using any of the less trivial
  // recognizers, etc -- you would have to manage the gesture recognizers
  // lifetime and call dispose() when the TextSpan was no longer being rendered.
  // Since TextSpan itself is @immutable, this means that you would have to
  // manage the recognizer from outside the TextSpan, e.g. in the State of a
  // stateful widget that then hands the recognizer to the TextSpan.
  LinkTextSpan({TextStyle style, String url, String text})
      : super(
          style: style,
          text: text ?? url,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launch(url, forceSafariVC: false);
            },
        );
}
