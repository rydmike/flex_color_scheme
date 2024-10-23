import 'dart:html' as html;

String? getQueryParam(String key) {
  return Uri.base.queryParameters[key];
}

void listenForUrlChanges(Function(String?) onChange) {
  html.window.onPopState.listen((event) {
    onChange(Uri.base.queryParameters['param']);
  });
}
