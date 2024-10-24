/// Abstract class for handling query parameters.
abstract class QueryParamsHandlerInterface {
  Map<String, String> getQueryParameters();
  String? getQueryParameter(String key);
  void dispose();
  void clearQueryParams();
}
