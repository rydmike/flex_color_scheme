import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

class SearchBarPanel extends StatelessWidget {
  const SearchBarPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _fcsFlutterIssue126623 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/126623',
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

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;
    // Get effective platform default global radius.
    final double? effectiveRadius = ThemeValues.effectiveRadius(controller);
    final String defaultLabel =
        controller.searchRadius == null && effectiveRadius == null
            ? 'Stadium/28dp'
            : controller.searchRadius == null &&
                    effectiveRadius != null &&
                    controller.searchUseGlobalShape
                ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
                : 'Stadium/28dp';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        SwitchListTileReveal(
          title: const Text('Fullscreen search view'),
          dense: true,
          subtitleReveal: const Text(
              'This is NOT a theming property! It is a toggle that enables '
              'you to test the fullscreen SearchView, instead '
              'of the default one opening under the SearchBar.\n'),
          value: controller.searchIsFullScreen,
          onChanged: controller.setSearchIsFullScreen,
        ),
        SearchBarShowcase(isFullScreen: controller.searchIsFullScreen),
        const Divider(),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Background color'),
          subtitleReveal: const Text('If you use background color with '
              'reverse contrast need to surface colors, you will need '
              'to define custom text themes for different TextStyle '
              'properties in FlexSubThemesData: searchBarTextStyle, '
              'searchBarHintStyle, searchViewHeaderTextStyle and '
              'searchViewHeaderHintStyle with working contrast style. '
              'Additionally the leading and trailing icon colors cannot be '
              'themed, so you will need to give them '
              'correct colors on widget level.\n'
              '\n'
              'Recommend using background colors with a brightness that '
              'default icon and text theme contrast color work on.\n'),
          defaultLabel: 'surfaceContainerHigh',
          value: controller.searchBackgroundSchemeColor,
          onChanged: controller.setSearchBackgroundSchemeColor,
        ),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Elevation'),
          subtitleReveal: const Text('In the Playground there is currently '
              'only one control for the elevation of the SearchBar and '
              'SearchView, but they are separate in the FlexColorScheme API. '
              'You can see this in the generated code too.\n'),
          value: controller.searchElevation,
          onChanged: controller.setSearchElevation,
          min: 0,
          max: 40,
          divisions: 40,
          valueDecimalPlaces: 0,
          valueHeading: 'ELEV',
          valueDefaultLabel: '6',
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Radius'),
              subtitleReveal: const Text(
                'The SearchBar default is Stadium shaped '
                'and the default SearchView is 28dp. In the Playground there '
                'is currently only one control for the radius, but they are '
                'separate in the FlexColorScheme API, you can see this '
                'in the generated code too.\n',
              ),
              value: controller.searchRadius,
              onChanged: controller.setSearchRadius,
              min: 0,
              max: 40,
              divisions: 40,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: defaultLabel,
              valueDefaultDisabledLabel: 'Stadium/28dp',
            ),
            lastWidget: SwitchListTileReveal(
              title: const Text('Use global'),
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              subtitleReveal:
                  const Text('If ON the SearchBar and SearchView will use the '
                      'global border radius or its platform adaptive radius, '
                      'if radius is at the default value here.\n'),
              value: controller.searchUseGlobalShape,
              onChanged: controller.setSearchUseGlobalShape,
            ),
            isRow: isRow,
          );
        }),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('SearchView header height'),
          value: controller.searchViewHeaderHeight,
          onChanged: controller.setSearchViewHeaderHeight,
          min: 40,
          max: 100,
          divisions: 60,
          valueDecimalPlaces: 0,
          valueHeading: 'HEIGHT',
          valueDefaultLabel: '56 dp',
        ),
        const Divider(),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The InputDecoration theme leeks through into '
                      'SearchBar and SearchView. From the SearchView it cannot '
                      'even be removed with a Theme wrapper. For more '
                      'information, see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _fcsFlutterIssue126623,
                  text: 'issue #126623',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. This issue has been fixed in Flutter 3.13.\n'
                      '\n'
                      'The SearchView suffers from the common Flutter lack '
                      'of support f variant themes, thus if you set the '
                      'shape to something else for the none full screen mode '
                      'the full screen mode gets the same shape. You do not '
                      'want or expect that, it should remain without a shape '
                      'in full screen mode. See issue <report and add link>.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
