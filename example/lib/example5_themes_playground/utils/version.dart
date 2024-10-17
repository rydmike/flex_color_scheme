import 'package:package_info_plus/package_info_plus.dart';

/// Get version of this app
Future<String> getVersion() {
  return PackageInfo.fromPlatform().then(
    (PackageInfo value) => value.version,
  );
}
