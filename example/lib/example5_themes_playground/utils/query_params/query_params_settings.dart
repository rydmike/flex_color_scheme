import 'package:flutter/material.dart';

import 'query_params_handler.dart'
    if (dart.library.io) 'query_params_handler_vm.dart'
    if (dart.library.js_interop) 'query_params_handler_web.dart';

/// A widget that rebuilds when query parameters change.
///
/// Returns the current query parameters as a map.
class QueryParamsSettings extends StatefulWidget {
  const QueryParamsSettings({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, Map<String, String> params)
      builder;

  @override
  State<QueryParamsSettings> createState() => _QueryParamsSettingsState();
}

class _QueryParamsSettingsState extends State<QueryParamsSettings> {
  late final QueryParamsHandler _handler;
  Map<String, String> _currentParams = <String, String>{};

  @override
  void initState() {
    super.initState();
    _handler = QueryParamsHandler(_onParamsChanged);
  }

  void _onParamsChanged(Map<String, String> params) {
    setState(() {
      _currentParams = params;
    });
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _currentParams);
  }
}
