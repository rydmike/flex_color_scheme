String? getQueryParam(String key) {
  return null;
}

void listenForUrlChanges(Function(String?) onChange) {
  // No-op for non-web platforms
}

// import 'package:flutter/material.dart'
//     if (dart.library.html) 'web_query_handler.dart'
//     if (!dart.library.html) 'default_query_handler.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String? _param;
//
//   @override
//   void initState() {
//     super.initState();
//     _param = getQueryParam('param');
//     listenForUrlChanges((newParam) {
//       setState(() {
//         _param = newParam;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Query Parameter Example')),
//         body: Center(
//           child: Text(_param ?? 'No parameter found'),
//         ),
//       ),
//     );
//   }
// }
