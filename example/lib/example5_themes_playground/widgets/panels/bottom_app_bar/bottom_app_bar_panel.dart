import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../shared/color_scheme_popup_menu.dart';

class BottomAppBarPanel extends StatelessWidget {
  const BottomAppBarPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterFix117082 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/117082',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isLight = theme.brightness == Brightness.light;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('BottomAppBar'),
          subtitleReveal: Text('A BottomAppBar is typically used with '
              'Scaffold.bottomNavigationBar. '
              'Its elevation in FCS defaults to AppBar elevation in '
              'Material-2 mode, when using Material-3 it defaults to 3, '
              'but shadow defaults to transparent so the elevation '
              'is not visible.\n'),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: theme.colorScheme.surfaceContainerHighest,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: BottomAppBarShowcase(explain: false),
          ),
        ),
        const SizedBox(height: 8),
        if (isLight)
          ColorSchemePopupMenu(
            enabled: enableControl,
            title: const Text('Color (light)'),
            defaultLabel: 'surfaceContainer',
            defaultLabelM2: 'surface',
            defaultDisabledLabelM2: 'White',
            value: controller.bottomAppBarSchemeColorLight,
            onChanged: controller.setBottomAppBarSchemeColorLight,
          )
        else
          ColorSchemePopupMenu(
            enabled: enableControl,
            title: const Text('Color (dark)'),
            defaultLabel: 'surfaceContainer',
            defaultLabelM2: 'surface with elev-overlay',
            defaultDisabledLabelM2: 'Grey[800]',
            value: controller.bottomAppBarSchemeColorDark,
            onChanged: controller.setBottomAppBarSchemeColorDark,
          ),
        SliderListTileReveal(
          enabled: controller.useFlexColorScheme,
          title: const Text('Height'),
          value: controller.bottomAppBarHeight,
          onChanged: controller.setBottomAppBarHeight,
          min: 40,
          max: 140,
          divisions: 100,
          valueHeading: 'HEIGHT',
          valueDecimalPlaces: 1,
          valueDefaultLabel: useMaterial3 ? '80 dp' : 'content',
        ),
        if (isLight) ...<Widget>[
          SliderListTileReveal(
            enabled: controller.useFlexColorScheme,
            title: const Text('Elevation (light)'),
            value: controller.bottomAppBarElevationLight,
            onChanged: controller.setBottomAppBarElevationLight,
            min: 0,
            max: 20,
            divisions: 40,
            valueHeading: 'ELEV',
            valueDecimalPlaces: 1,
            valueDefaultLabel: useMaterial3 ? '3' : '8',
          ),
        ] else ...<Widget>[
          SliderListTileReveal(
            enabled: controller.useFlexColorScheme,
            title: const Text('Elevation (dark)'),
            value: controller.bottomAppBarElevationDark,
            onChanged: controller.setBottomAppBarElevationDark,
            min: 0,
            max: 20,
            divisions: 40,
            valueHeading: 'ELEV',
            valueDecimalPlaces: 1,
            valueDefaultLabel: useMaterial3 ? '3' : '8',
          ),
        ],
        const ListTileReveal(
          dense: true,
          title: Text('Theming info'),
          subtitleReveal: Text('Flutter Material-2 mode original default color '
              'was ThemeData.bottomAppBarColor. '
              'This was deprecated in Flutter 3.7. Now Material-2 mode '
              'defaults to surface color and elevation 8.\n'
              '\n'
              'In Material-3 mode, before Flutter 3.22 ,it defaulted to '
              'surface color, elevation 3, no shadow, and using '
              'surface elevation tint. In Flutter 3.22 and later, defaults '
              'to surfaceContainer. The elevation is still 3, but surfaceTint '
              'is transparent, so the elevation has no visible impact.\n'
              '\n'
              'The color of the items in a BottomAppBar cannot be themed. If '
              'you use a background color that requires other contrasting '
              'color than what works on surface colors, you '
              'will have to color the content on widget level.\n'),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'In Flutter 3.7 the BottomAppBar '
                      'color cannot be changed due to the issue described in ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterFix117082,
                  text: 'FIX PR #117082',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. The fix is available in Flutter 3.10 '
                      'and later.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
