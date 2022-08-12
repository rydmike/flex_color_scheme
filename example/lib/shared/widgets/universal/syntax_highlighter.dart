import 'package:flutter/material.dart';
import 'package:string_scanner/string_scanner.dart';

import '../../../example5_themes_playground/theme/code_theme.dart';

/// This syntax highlighter is adopted and converted from the Google Flutter
/// Gallery application.
///
/// Copyright 2016 The Chromium Authors. All rights reserved.
/// Use of this source code is governed by a BSD-style license that can be
/// found in the LICENSE file.
class SyntaxHighlighterStyle {
  SyntaxHighlighterStyle(
      {this.baseStyle,
      this.numberStyle,
      this.commentStyle,
      this.keywordStyle,
      this.stringStyle,
      this.punctuationStyle,
      this.classStyle,
      this.constantStyle});

  /// A fixed example light code view style.
  ///
  /// This constructor does not create a ThemeData extensions based
  /// SyntaxHighlighterStyle.
  /// It uses the same colors as the colors used in the [CodeTheme] theme
  /// extension, but it could be any fixed none theme related colors.
  static SyntaxHighlighterStyle lightThemeStyle() => SyntaxHighlighterStyle(
        baseStyle: const TextStyle(color: Color(0xFF092249)),
        numberStyle: const TextStyle(color: Color(0xFF1565C0)),
        commentStyle: const TextStyle(color: Color(0xFF446736)),
        keywordStyle: const TextStyle(color: Color(0xFF9C27B0)),
        stringStyle: const TextStyle(color: Color(0xFF43A047)),
        punctuationStyle: const TextStyle(color: Color(0xFF081936)),
        classStyle: const TextStyle(color: Color(0xFF6607C5)),
        constantStyle: const TextStyle(color: Color(0xFF795548)),
      );

  /// A fixed example dark code view style.
  ///
  /// This constructor does not create a ThemeData extensions based
  /// SyntaxHighlighterStyle.
  /// It uses the same colors as the colors used in the [CodeTheme] theme
  /// extension, but it could be any fixed none theme related colors.
  static SyntaxHighlighterStyle darkThemeStyle() => SyntaxHighlighterStyle(
        baseStyle: const TextStyle(color: Color(0xFFEEEED6)),
        numberStyle: const TextStyle(color: Color(0xFFB4CDA8)),
        commentStyle: const TextStyle(color: Color(0xFF90C07A)),
        keywordStyle: const TextStyle(color: Color(0xFF5BAAE8)),
        stringStyle: const TextStyle(color: Color(0xFFD3A384)),
        punctuationStyle: const TextStyle(color: Color(0xFFEAE9D4)),
        classStyle: const TextStyle(color: Color(0xFF39C8B0)),
        constantStyle: const TextStyle(color: Color(0xFFB9A1DC)),
      );

  /// A theme harmonized code view syntax syntax highlighter style.
  ///
  /// This style gets its colors from the theme extension [CodeTheme] baked
  /// into [ThemeData].
  static SyntaxHighlighterStyle harmonized(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    // Get our custom code view theme from the CodeTheme extension, with a
    // fallback to brightness dependent CodeTheme.light or CodeTheme.dark.
    // We use the static const light and dark versions as fallback highlight
    // colors in case the theme extension CodeTheme has not been added to
    // ThemeData, making this harmonized constructor more robust.
    //
    // The theme extension CodeTheme in this example is based on same
    // colors as its static light and dark mode, but the harmonized one from
    // ThemeData is M3 color harmonized to source color. In this case active
    // theme primary color. Another benefit from using the colors via the
    // ThemeData extension, is that its harmonization function result is color
    // lerp animated, in sync with the rest of the ThemeData color changes
    // automatically as you change theme in the app, as it should be.
    final CodeTheme colors = theme.extension<CodeTheme>() ??
        (isLight ? CodeTheme.light : CodeTheme.dark);

    return SyntaxHighlighterStyle(
      baseStyle: TextStyle(color: colors.baseColor),
      numberStyle: TextStyle(color: colors.numberColor),
      commentStyle: TextStyle(color: colors.commentColor),
      keywordStyle: TextStyle(color: colors.keywordColor),
      stringStyle: TextStyle(color: colors.stringColor),
      punctuationStyle: TextStyle(color: colors.punctuationColor),
      classStyle: TextStyle(color: colors.classColor),
      constantStyle: TextStyle(color: colors.constantColor),
    );
  }

  SyntaxHighlighterStyle copyWith({
    TextStyle? baseStyle,
    TextStyle? numberStyle,
    TextStyle? commentStyle,
    TextStyle? keywordStyle,
    TextStyle? stringStyle,
    TextStyle? punctuationStyle,
    TextStyle? classStyle,
    TextStyle? constantStyle,
  }) =>
      SyntaxHighlighterStyle(
        baseStyle: baseStyle ?? this.baseStyle,
        numberStyle: numberStyle ?? this.numberStyle,
        commentStyle: commentStyle ?? this.commentStyle,
        keywordStyle: keywordStyle ?? this.keywordStyle,
        stringStyle: stringStyle ?? this.stringStyle,
        punctuationStyle: punctuationStyle ?? this.punctuationStyle,
        classStyle: classStyle ?? this.classStyle,
        constantStyle: constantStyle ?? this.constantStyle,
      );

  final TextStyle? baseStyle;
  final TextStyle? numberStyle;
  final TextStyle? commentStyle;
  final TextStyle? keywordStyle;
  final TextStyle? stringStyle;
  final TextStyle? punctuationStyle;
  final TextStyle? classStyle;
  final TextStyle? constantStyle;
}

// ignore: one_member_abstracts
abstract class SyntaxHighlighter {
  TextSpan format(String src);
}

class DartSyntaxHighlighter extends SyntaxHighlighter {
  DartSyntaxHighlighter([this.style]) {
    _spans = <_HighlightSpan>[];
    style ??= SyntaxHighlighterStyle.darkThemeStyle();
  }

  SyntaxHighlighterStyle? style;

  static const List<String> _keywords = <String>[
    'abstract',
    'as',
    'assert',
    'async',
    'await',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'default',
    'deferred',
    'do',
    'dynamic',
    'else',
    'enum',
    'export',
    'external',
    'extends',
    'factory',
    'false',
    'final',
    'finally',
    'for',
    'get',
    'if',
    'implements',
    'import',
    'in',
    'is',
    'library',
    'new',
    'null',
    'operator',
    'part',
    'rethrow',
    'return',
    'set',
    'static',
    'super',
    'switch',
    'sync',
    'this',
    'throw',
    'true',
    'try',
    'typedef',
    'var',
    'void',
    'while',
    'with',
    'yield'
  ];

  static const List<String> _builtInTypes = <String>[
    'int',
    'double',
    'num',
    'bool'
  ];

  late String _src;
  late StringScanner _scanner;

  late List<_HighlightSpan> _spans;

  @override
  TextSpan format(String src) {
    _src = src;
    _scanner = StringScanner(_src);

    if (_generateSpans()) {
      // Successfully parsed the code
      final List<TextSpan> formattedText = <TextSpan>[];
      int currentPosition = 0;

      for (final _HighlightSpan span in _spans) {
        if (currentPosition != span.start) {
          formattedText
              .add(TextSpan(text: _src.substring(currentPosition, span.start)));
        }

        formattedText.add(TextSpan(
            style: span.textStyle(style), text: span.textForSpan(_src)));

        currentPosition = span.end;
      }

      if (currentPosition != _src.length) {
        formattedText
            .add(TextSpan(text: _src.substring(currentPosition, _src.length)));
      }

      return TextSpan(style: style!.baseStyle, children: formattedText);
    } else {
      // Parsing failed, return with only basic formatting
      return TextSpan(style: style!.baseStyle, text: src);
    }
  }

  bool _generateSpans() {
    int lastLoopPosition = _scanner.position;

    while (!_scanner.isDone) {
      // Skip White space
      _scanner.scan(RegExp(r'\s+'));

      // Block comments
      if (_scanner.scan(RegExp(r'/\*(.|\n)*\*/'))) {
        _spans.add(_HighlightSpan(_HighlightType.comment,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Line comments
      if (_scanner.scan('//')) {
        final int startComment = _scanner.lastMatch!.start;

        bool eof = false;
        int endComment;
        if (_scanner.scan(RegExp(r'.*\n'))) {
          endComment = _scanner.lastMatch!.end - 1;
        } else {
          eof = true;
          endComment = _src.length;
        }

        _spans.add(
            _HighlightSpan(_HighlightType.comment, startComment, endComment));

        if (eof) break;

        continue;
      }

      // Raw r"String"
      // ignore: unnecessary_raw_strings
      if (_scanner.scan(RegExp(r'r".*"'))) {
        _spans.add(_HighlightSpan(_HighlightType.string,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Raw r'String'
      // ignore: unnecessary_raw_strings
      if (_scanner.scan(RegExp(r"r'.*'"))) {
        _spans.add(_HighlightSpan(_HighlightType.string,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Multiline """String"""
      if (_scanner.scan(RegExp(r'"""(?:[^"\\]|\\(.|\n))*"""'))) {
        _spans.add(_HighlightSpan(_HighlightType.string,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Multiline '''String'''
      if (_scanner.scan(RegExp(r"'''(?:[^'\\]|\\(.|\n))*'''"))) {
        _spans.add(_HighlightSpan(_HighlightType.string,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // "String"
      if (_scanner.scan(RegExp(r'"(?:[^"\\]|\\.)*"'))) {
        _spans.add(_HighlightSpan(_HighlightType.string,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // 'String'
      if (_scanner.scan(RegExp(r"'(?:[^'\\]|\\.)*'"))) {
        _spans.add(_HighlightSpan(_HighlightType.string,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Double
      if (_scanner.scan(RegExp(r'\d+\.\d+'))) {
        _spans.add(_HighlightSpan(_HighlightType.number,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Integer
      if (_scanner.scan(RegExp(r'\d+'))) {
        _spans.add(_HighlightSpan(_HighlightType.number,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Punctuation
      if (_scanner.scan(RegExp(r'[\[\]{}().!=<>&\|\?\+\-\*/%\^~;:,]'))) {
        _spans.add(_HighlightSpan(_HighlightType.punctuation,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Meta data
      if (_scanner.scan(RegExp(r'@\w+'))) {
        _spans.add(_HighlightSpan(_HighlightType.keyword,
            _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        continue;
      }

      // Words
      if (_scanner.scan(RegExp(r'\w+'))) {
        _HighlightType? type;

        String word = _scanner.lastMatch![0]!;
        if (word.startsWith('_')) word = word.substring(1);

        if (_keywords.contains(word)) {
          type = _HighlightType.keyword;
        } else if (_builtInTypes.contains(word)) {
          type = _HighlightType.keyword;
        } else if (_firstLetterIsUpperCase(word)) {
          type = _HighlightType.klass;
        } else if (word.length >= 2 &&
            word.startsWith('k') &&
            _firstLetterIsUpperCase(word.substring(1))) {
          type = _HighlightType.constant;
        }

        if (type != null) {
          _spans.add(_HighlightSpan(
              type, _scanner.lastMatch!.start, _scanner.lastMatch!.end));
        }
      }

      // Check if this loop did anything
      if (lastLoopPosition == _scanner.position) {
        // Failed to parse this file, abort gracefully
        return false;
      }
      lastLoopPosition = _scanner.position;
    }

    _simplify();
    return true;
  }

  void _simplify() {
    for (int i = _spans.length - 2; i >= 0; i -= 1) {
      if (_spans[i].type == _spans[i + 1].type &&
          _spans[i].end == _spans[i + 1].start) {
        _spans[i] =
            _HighlightSpan(_spans[i].type, _spans[i].start, _spans[i + 1].end);
        _spans.removeAt(i + 1);
      }
    }
  }

  bool _firstLetterIsUpperCase(String str) {
    if (str.isNotEmpty) {
      final String first = str.substring(0, 1);
      return first == first.toUpperCase();
    }
    return false;
  }
}

enum _HighlightType {
  number,
  comment,
  keyword,
  string,
  punctuation,
  klass,
  constant
}

class _HighlightSpan {
  _HighlightSpan(this.type, this.start, this.end);
  final _HighlightType type;
  final int start;
  final int end;

  String textForSpan(String src) {
    return src.substring(start, end);
  }

  TextStyle? textStyle(SyntaxHighlighterStyle? style) {
    if (type == _HighlightType.number) {
      return style!.numberStyle;
    } else if (type == _HighlightType.comment) {
      return style!.commentStyle;
    } else if (type == _HighlightType.keyword) {
      return style!.keywordStyle;
    } else if (type == _HighlightType.string) {
      return style!.stringStyle;
    } else if (type == _HighlightType.punctuation) {
      return style!.punctuationStyle;
    } else if (type == _HighlightType.klass) {
      return style!.classStyle;
    } else if (type == _HighlightType.constant) {
      return style!.constantStyle;
    } else {
      return style!.baseStyle;
    }
  }
}
