import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import 'query_params_handler.dart'
    if (dart.library.io) 'query_params_handler_vm.dart'
    if (dart.library.js_interop) 'query_params_handler_web.dart';

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off here too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && false;

/// A widget that rebuilds when query parameters change.
///
/// Returns the current query parameters as a map.
class QueryParamsSettings extends StatefulWidget {
  const QueryParamsSettings({
    super.key,
    required this.controller,
    required this.child,
  });

  final ThemeController controller;
  final Widget child;

  @override
  State<QueryParamsSettings> createState() => _QueryParamsSettingsState();
}

class _QueryParamsSettingsState extends State<QueryParamsSettings> {
  late final QueryParamsHandler _handler;

  @override
  void initState() {
    if (_debug) debugPrint('CALL QueryParamsSettings: initState()');
    super.initState();
    // Define the query parameter handler, and the call-back it should
    // use to call when the parameters change.
    _handler = QueryParamsHandler(_onParamsChanged);
  }

  // This call-back is called by QueryParamsHandler when the params change.
  Future<void> _onParamsChanged(Map<String, String> params) async {
    if (_debug) debugPrint('EXEC QueryParamsSettings _onParamsChanged');
    if (params.isNotEmpty) {
      if (_debug) debugPrint('_onParamsChanged: inside IF with $params');
      await ThemeController.importFromQueryParams(
        params,
        widget.controller,
      );
      // After handling the query parameters, clear them from the URL,
      // regardless of whether the import was successful or not.
      _handler.clearQueryParams();
    }
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_debug) debugPrint('Build QueryParamsSettings child HomePage()');
    return widget.child;
  }
}
