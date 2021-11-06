import 'dart:io' show Directory;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart' as path_provider;

// The "Directory" function from dart.io is not supported on Flutter WEB
// So it will only be imported on VM platforms that support compiling them,
// basically all except the WEB platform.

/// The [getAppDataDir] is a custom made folder/directory getter for different
/// platforms that uses package path_provider.dart.
Future<String> getAppDataDir() async {
  // "Web" should not happen in this import branch, but let's check for it
  // anyway, on actual web build this return will be via the
  // 'app_data_dir_web.dart' import file.
  if (kIsWeb) {
    return ''; // WEB return empty string
  } else {
    // Other platforms, use path provider and their app support folder.
    final Directory dir = await path_provider.getApplicationSupportDirectory();
    return dir.path;
  }
}
