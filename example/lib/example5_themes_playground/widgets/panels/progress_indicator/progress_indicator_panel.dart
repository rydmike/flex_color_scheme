import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/test_adaptive_response.dart';

class ProgressIndicatorPanel extends StatelessWidget {
  const ProgressIndicatorPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue131690 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/131690',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    // final bool isLight = theme.brightness == Brightness.light;

    // The most common logic for enabling Playground controls.
    // final bool enableControl =
    //     controller.useSubThemes && controller.useFlexColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('ProgressIndicator'),
          subtitleReveal:
              Text('Progress indicators in FCS currently only offer the '
                  'default theme and no customization.\n'),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: ProgressIndicatorShowcase(),
        ),
        TestAdaptiveResponse(controller),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'There is a feature to enable circular '
                      'end-caps in Flutter 3.10. Before Flutter version 3.29 '
                      'these features could not be set via a theme at all. '
                      'Read more about this in the ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue131690,
                  text: 'issue #131690',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. In Flutter 3.29 and later, the circular end-caps '
                      'can be set via the theme as well, but it is currently '
                      'not supported in FCS or the Playground. Support will '
                      'be added in a coming version update.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
