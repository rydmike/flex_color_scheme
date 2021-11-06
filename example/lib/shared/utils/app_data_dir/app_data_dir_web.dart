// The functions listed here are not supported nor needed on Web, so calls to
// them will do nothing when an app is built for Web. We do need to include
// stubs for them though, so that the code is and reads the same regardless of
// what platform we build for.

/// Document directory for WEB apps.
///
/// Flutter Web apps that store data typically use Web IndexDB instead and
/// don't need a document path to store data.
///
/// This dummy version of [getAppDataDir] returns an empty string as the path.
Future<String> getAppDataDir() async {
  return '';
}
