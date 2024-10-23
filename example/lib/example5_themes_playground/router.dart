import 'dart:async';
import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/controllers/theme_controller.dart';
import 'utils/import_export_playground_settings.dart';
import 'widgets/pages/home_page.dart';

// TODO(rydmike): Look at bad_router gist
// https://gist.github.com/jezell/0aa4c66990d17d342efedb19b7621381

class MyRouteInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) async {
    final Uri uri = Uri.parse(routeInformation.location ?? '/');
    debugPrint('Parsed URI: $uri');
    return uri;
  }

  @override
  RouteInformation? restoreRouteInformation(Uri configuration) {
    return RouteInformation(location: configuration.toString());
  }
}

class MyRouterDelegate extends RouterDelegate<Uri>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Uri> {
  MyRouterDelegate({required this.controller})
      : navigatorKey = GlobalKey<NavigatorState>();

  final ThemeController controller;

  String _decompressJsonString(String compressedString) {
    final List<int> compressedBytes = base64Decode(compressedString);
    final List<int> decompressedBytes =
        GZipDecoder().decodeBytes(compressedBytes);
    return utf8.decode(decompressedBytes);
  }

  // Handle import playground theme event.
  Future<void> _handleUrl(String encodedData) async {
    String resultLog = '';
    try {
      if (encodedData.isNotEmpty) {
        final String playgroundConfig = _decompressJsonString(encodedData);
        resultLog = await importPlaygroundSettings(
          controller,
          settings: playgroundConfig,
        );
      }
    } on Exception catch (error, stackTrace) {
      debugPrintStack(
        label: 'Error importing playground theme data: $error',
        stackTrace: stackTrace,
      );
      // Date time now formatted as string dd.MM.yyyy HH:mm:ss
      final String importDate =
          DateFormat('dd.MM.yyyy HH:mm:ss').format(DateTime.now());
      resultLog = 'Failed to decode JSON at $importDate, error:\n$error';
    }
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Uri _uri = Uri.parse('/');

  Uri get uri => _uri;

  @override
  Uri get currentConfiguration => _uri;

  @override
  Future<void> setNewRoutePath(Uri configuration) async {
    _uri = configuration;
    debugPrint('New Route Path: $_uri');
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    final String? encodedData = _uri.queryParameters['config'];
    debugPrint('Current URI: $_uri');
    debugPrint('Query Parameters: ${_uri.queryParameters}');
    debugPrint('encodedData: $encodedData');
    if (encodedData != null) {
      unawaited(_handleUrl(encodedData));
    }
    return Navigator(
      key: navigatorKey,
      pages: <Page>[
        MaterialPage(
          child: HomePage(controller: controller),
        ),
      ],
      onPopPage: (Route route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        return true;
      },
    );
  }
}
