import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

import 'query_params_handler_interface.dart';

/// The query params handler for Dart Web builds
///
/// This implementation listens to URL changes and calls the provided callback
/// when the query parameters change.
class QueryParamsHandler implements QueryParamsHandlerInterface {
  final void Function(Map<String, String> params) _onParamsChanged;
  StreamSubscription<web.PopStateEvent>? _popStateSubscription;
  JSFunction? _locationChangeListener;

  QueryParamsHandler(this._onParamsChanged) {
    _initializeWebListener();
  }

  void _initializeWebListener() {
    // Listen to PopState events (handles both URL changes and history changes)
    _popStateSubscription = web.window.onPopState.listen((_) {
      final Map<String, String> params = getQueryParameters();
      _onParamsChanged(params);
    });

    // Create event listener for URL changes
    _locationChangeListener = ((web.Event event) {
      final Map<String, String> params = getQueryParameters();
      _onParamsChanged(params);
    }).toJS;

    // Add the event listener
    web.window.addEventListener('locationchange', _locationChangeListener);
    // Initial parameters
    _onParamsChanged(getQueryParameters());
  }

  @override
  Map<String, String> getQueryParameters() {
    try {
      final web.Location location = web.window.location;
      final Uri uri = Uri.parse(location.href);
      return uri.queryParameters;
    } catch (e) {
      if (kDebugMode) debugPrint('Playground URL query param error: $e');
      return <String, String>{'error': 'Playground URL query param error: $e'};
    }
  }

  @override
  String? getQueryParameter(String key) {
    return getQueryParameters()[key];
  }

  @override
  void clearQueryParams() {
    final web.Location location = web.window.location;
    final Uri uri = Uri.parse(location.href);
    uri.queryParameters.clear();
    web.window.history.replaceState(null, '', uri.toString());
  }

  @override
  void dispose() {
    unawaited(_popStateSubscription?.cancel());
    if (_locationChangeListener != null) {
      web.window.removeEventListener('locationchange', _locationChangeListener);
    }
  }
}
