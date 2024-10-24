import 'query_params_handler_interface.dart';

/// A query params handler for Dart VM (none Web) builds
///
/// Currently identical to the stub implementation, but if we need
/// to implement any platform-specific logic, we can do it here.
class QueryParamsHandler implements QueryParamsHandlerInterface {
  QueryParamsHandler(this.onParamsChanged);

  final void Function(Map<String, String> params) onParamsChanged;

  @override
  Map<String, String> getQueryParameters() => <String, String>{};

  @override
  String? getQueryParameter(String key) => null;

  @override
  void clearQueryParams() {}

  @override
  void dispose() {}
}
