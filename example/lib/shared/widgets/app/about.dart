import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../const/app_data.dart';
import '../../utils/link_text_span.dart';

/// An about icon button used on the example's app app bar.
class AboutIconButton extends StatelessWidget {
  const AboutIconButton({Key? key, this.color}) : super(key: key);

  /// The color used on the icon button.
  ///
  /// If null, default to Icon() class default color.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info, color: color),
      onPressed: () {
        showAppAboutDialog(context);
      },
    );
  }
}

// This [showAppAboutDialog] function is based on the [AboutDialog] example
// that exist(ed) in the Flutter Gallery App.
void showAppAboutDialog(BuildContext context) {
  final ThemeData themeData = Theme.of(context);
  final TextStyle aboutTextStyle = themeData.textTheme.bodyLarge!;
  final TextStyle footerStyle = themeData.textTheme.bodySmall!;
  final TextStyle linkStyle = themeData.textTheme.bodyLarge!
      .copyWith(color: themeData.colorScheme.primary);

  showAboutDialog(
    context: context,
    applicationName: AppData.appName,
    applicationVersion: AppData.version,
    applicationIcon: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlexThemeModeOptionButton(
          selected: true,
          width: 30,
          height: 30,
          flexSchemeColor: FlexSchemeColor(
            primary: themeData.colorScheme.primary,
            primaryContainer: themeData.colorScheme.primaryContainer,
            secondary: themeData.colorScheme.secondary,
            secondaryContainer: themeData.colorScheme.secondaryContainer,
          ),
        ),
      ],
    ),
    applicationLegalese:
        '${AppData.copyright}\n${AppData.author}\n${AppData.license}',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: aboutTextStyle,
                text: 'This example shows some features of the '
                    '${AppData.appName} Flutter theming package.\n'
                    'To learn more, check out the package on ',
              ),
              LinkTextSpan(
                style: linkStyle,
                url: AppData.packageUrl,
                text: 'pub.dev',
              ),
              TextSpan(
                style: aboutTextStyle,
                text: '.\n'
                    'It is thoroughly documented and includes the source '
                    'code of this application.\n\n',
              ),
              TextSpan(
                style: footerStyle,
                text: 'Built with Flutter ${AppData.flutterVersion}, '
                    'using ${AppData.packageVersion}\n\n',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
