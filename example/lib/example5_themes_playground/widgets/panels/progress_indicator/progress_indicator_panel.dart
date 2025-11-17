import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
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
    final bool useMaterial3 = theme.useMaterial3;
    final bool use2023Style = controller.progressIndicatorYear2023 ?? true;

    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    // final bool isLight = theme.brightness == Brightness.light;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTileReveal(
          enabled: enableControl && useMaterial3,
          title: const Text('Use legacy Material-3 style'),
          subtitleReveal: const Text(
              'The Material-3 specification for the ProgressIndicator design '
              'changed in December 2023. The old style is ON and used by '
              'default in Flutter and FCS Material-3 to not break past themed '
              'style. Turn OFF this setting to opt-in and enable the newer and '
              'current Material-3 ProgressIndicator style.\n'
              '\n'
              'There are plans to make the new style the default in a future '
              'Flutter release and remove support for the older M3 style. When '
              'that happens and if it is '
              'possible, FCS will retain support for the older '
              'M3 style via theming options.'),
          value: use2023Style,
          onChanged: controller.setProgressIndicatorYear2023,
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
