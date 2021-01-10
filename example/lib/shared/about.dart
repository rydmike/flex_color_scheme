import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'link_text_span.dart';

// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the examples.

// An about icon button used on the example's app app bar, but only if the
// app is built for web or desktop. Main usage is to show licenses on the Web
// version and to show what version of Flutter the Live version of the
// example app was built with. When building the example for an Android or
// iOS device we assume somebody is just learning how to use the package
// and don't show the about info.
class AboutIconButton extends StatelessWidget {
  const AboutIconButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TargetPlatform platformIs = Theme.of(context).platform;
    final bool showIconButton = kIsWeb ||
        platformIs == TargetPlatform.windows ||
        platformIs == TargetPlatform.macOS ||
        platformIs == TargetPlatform.linux;

    return showIconButton
        ? IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showAppAboutDialog(context);
            },
          )
        : const SizedBox.shrink();
  }
}

/// This [showAppAboutDialog] function is based on the [AboutDialog] example
/// that exist(ed) in the Flutter Gallery App.
void showAppAboutDialog(BuildContext context) {
  final ThemeData themeData = Theme.of(context);
  final TextStyle aboutTextStyle = themeData.textTheme.bodyText1;
  final TextStyle footerStyle = themeData.textTheme.caption;
  final TextStyle linkStyle =
      themeData.textTheme.bodyText1.copyWith(color: themeData.primaryColor);

  showAboutDialog(
    context: context,
    applicationName: AppConst.appName,
    applicationVersion: AppConst.version,
    applicationIcon: const Image(image: AssetImage(AppConst.icon)),
    applicationLegalese:
        '${AppConst.copyright} ${AppConst.author} ${AppConst.license}',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: aboutTextStyle,
                text: 'This example shows some of the features of the '
                    '${AppConst.appName} theming package. To learn more, check '
                    'out the package on ',
              ),
              LinkTextSpan(
                style: linkStyle,
                url: AppConst.packageUrl,
                text: 'pub.dev',
              ),
              TextSpan(
                style: aboutTextStyle,
                text: '. It contains extensive documentation and the source '
                    'of this example application.\n\n',
              ),
              TextSpan(
                style: footerStyle,
                text: 'Built with ${AppConst.flutterVersion}, '
                    'using ${AppConst.packageVersion}\n\n',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
