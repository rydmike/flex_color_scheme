import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

import 'query_params_handler_interface.dart';

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off here too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && true;

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
      if (_debug) debugPrint('Playground URL query param error: $e');
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
    final Uri newUri = uri.replace(queryParameters: <String, String>{});
    if (_debug) debugPrint('QueryParamsHandler clearing query params: $newUri');
    web.window.history.replaceState(null, '', newUri.toString());
  }

  @override
  void dispose() {
    unawaited(_popStateSubscription?.cancel());
    if (_locationChangeListener != null) {
      web.window.removeEventListener('locationchange', _locationChangeListener);
    }
  }
}
