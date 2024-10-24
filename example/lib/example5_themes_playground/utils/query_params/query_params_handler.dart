import 'query_params_handler_interface.dart';

/// A dummy stub implementation of query params handler.
///
/// Used for conditional imports of VM or Web implementations.
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
