import 'dart:async';
import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/const/app.dart';

/// Util helpers for making a URL for sharing settings.
sealed class ShareSettings {
  // Compress JSON string
  static String _compressJsonString(String jsonString) {
    final List<int> jsonBytes = utf8.encode(jsonString);
    final List<int>? compressedBytes =
        GZipEncoder().encode(Uint8List.fromList(jsonBytes));
    return base64UrlEncode(compressedBytes ?? <int>[0]);
  }

  /// Make URL for sharing settings Playground settings.
  ///
  /// Takes a JSON string [jsonString] with the playground settings
  /// and compresses it to a URL safe string.
  static Future<String> makeUrl(final String jsonString) async {
    if (jsonString.isNotEmpty) {
      final String compressedConfig = _compressJsonString(jsonString);
      final String url = '${App.playgroundURL}?config=$compressedConfig';
      return url;
    } else {
      return '';
    }
  }

  /// Copy String [clipBoardData] to clipboard and show snackbar with [message].
  static Future<void> copyToClipboardWithSnackBarInfo(
    BuildContext context,
    String clipBoardData,
    String message,
  ) async {
    final double? width = MediaQuery.sizeOf(context).width > 800 ? 700 : null;
    final ClipboardData data = ClipboardData(text: clipBoardData);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: width,
        content: Text(message),
        duration: const Duration(milliseconds: 2000),
      ),
    );
    await Clipboard.setData(data);
  }
}
