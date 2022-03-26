import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Copy the color value as a String to the Clipboard in Flutter Dart format.
///
/// Notify with snackbar that it was copied.
Future<void> copyColorToClipboard(BuildContext context, Color color) async {
  final ClipboardData data = ClipboardData(text: '0x${color.hexAlpha}');
  await Clipboard.setData(data);
  final String materialName = ColorTools.materialName(color);
  final String nameThatColor = ColorTools.nameThatColor(color);
  final String space = materialName == '' ? '' : ' ';
  // Show a snack bar with the copy message.
  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: <Widget>[
          Card(
            color: color,
            elevation: 0.5,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text('#${color.hexCode}',
                  style: TextStyle(
                      color: ThemeData.estimateBrightnessForColor(color) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Copied color $nameThatColor $materialName${space}to '
              'the clipboard',
            ),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 2000),
    ),
  );
}
