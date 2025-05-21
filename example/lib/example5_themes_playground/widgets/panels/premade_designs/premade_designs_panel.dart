import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../dialogs/set_theme_to_premade_dialog.dart';
import '../../shared/test_adaptive_response.dart';
import '../../shared/use_seeded_color_scheme_switch.dart';

/// A panel with ready premade design we can click on to use.
class PremadeDesignsPanel extends StatelessWidget {
  const PremadeDesignsPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _materialDocs = Uri(
    scheme: 'https',
    host: 'm3.material.io',
    path: 'styles/color/the-color-system/key-colors-tones',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodyMedium!
        .copyWith(color: theme.textTheme.bodySmall!.color);
    final TextStyle linkStyle = theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        SetupListTile(
          title: 'Themes Playground default',
          seeded: false,
          subtitle: 'Set settings to their Playground defaults. In '
              'Material-2 mode the default setup is quite opinionated, it '
              'mimics Material-3 in Material-2 mode. In Material-3 mode the '
              'Playground defaults are 98% Material-3 default styles, '
              'with some minor tweaks on Tooltip and SnackBar, as well as '
              'InputDecorator hovered error labelStyle. It uses error instead '
              'of onErrorContainer. ',
          settingsId: 0,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Material 3 default',
          seeded: true,
          subtitle: 'Set Playground settings to a configuration that '
              'matches the Material-3 design defaults. Seeded color scheme is '
              'activated using the default Flutter Material-3 '
              'DynamicSchemeVariant TonalSpot setting, with only one key color '
              'used to generate the ColorScheme, from the primary light '
              'mode input color.',
          settingsId: 1,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Primary navigators',
          seeded: false,
          subtitle: 'Features primary color on navigators, with filled '
              'TextField using primary opacity, rounder corners and no '
              'unfocused border. Button outlines are also primary colored. '
              'Uses light surface blends with tinted TextTheme and '
              'tinted interactions. It does not use seed generated '
              'ColorScheme, but you can turn it ON.',
          settingsId: 2,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Fabulous 12',
          seeded: true,
          subtitle: 'Primary color favoring theme, with a bit extra blend '
              'blend on Scaffold background. ColorScheme uses 3 seed '
              'key-colors and the more saturated Jolly seed strategy. It of '
              'course works great without using seed generated Colorscheme '
              'too, turn it OFF to compare and see what you prefer. '
              'It has a smooth looking border radius 12 on all '
              'widgets, except FAB, that is back in shape with its M2 circle '
              'and a hip tertiary color.',
          settingsId: 3,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Material-3 does M2',
          seeded: false,
          subtitle: 'Shows how you can emulate Material-2 styles in Material-3 '
              'mode, with Material-3 components. It does not use surface '
              'blends or seeded ColorScheme since it is not used in '
              'Material-2.\n'
              'It removes elevation tint in light mode, but keeps it in dark '
              'where it is useful and sort of exist in M2 as well. It brings '
              'back elevation shadows in both light and dark mode, if they '
              'were removed in M3. It does not totally match default M2, it '
              'keeps some useful consistency cleanups for a bit more refined '
              "M2 design than Flutter's defaults. Need an M2 styled M3 mode "
              'theme for legacy style support? Here it is!',
          settingsId: 4,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'High contrast',
          seeded: true,
          subtitle: 'A theme that looks like it is not seed generated, but '
              'actually is. Uses the FCS ultra high contrast seed '
              'setting with three key colors, that are kept as locked brand '
              'colors in light theme mode. It also uses black and white "on" '
              'colors in light mode. It has very high surface blends, but '
              'since true-black and plain-white setting is used, it is not '
              'very visible and we get an ink black scaffold in dark mode and '
              'plain white one in light mode. It also uses monochrome surface '
              'colors with now primary color in neutrals. This theme shows '
              'how to configure a very high contrast version of any used input '
              'colors, usable for accessibility.',
          settingsId: 5,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'One hue',
          seeded: true,
          subtitle: 'This theme limits input colors to only the primary color. '
              'It uses the "One Hue" seed generation choice to create '
              'a bright ColorScheme where all colors are shades of the same '
              'input primary color. Even if you turn off using seeds, '
              'FlexColorScheme computes all colors based on the primary '
              'input color. This is done by setting "usedColors" to one. '
              'The primary color is also locked in and as used as a fixed '
              'brand color even with seeded ColorSchemes. Need a theme where '
              'primary light theme must have a fixed brand color and '
              'want the rest of theme to be nice color shades derived from it? '
              'This delivers it!',
          settingsId: 6,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Platform adaptive',
          seeded: false,
          subtitle: 'A Material 3 platform adaptive theme. '
              'On platforms other than Android and Fuchsia, a more platform '
              'agnostic design than M3 is used. Components are less rounded, '
              'they use 10dp as default platform adaptive border radius '
              'override. A less rounded design may feel more at '
              'home on none Google platforms. However, Android and Fuchsia '
              'usage of the app still keep M3 default designs, '
              'also on web builds.\n'
              'This platform adaptive theme also removes elevation tint in '
              'light mode, and puts shadows back. These adaptive theme changes '
              'happens on all platforms, except Android and Fuchsia. '
              'It adds elevation shadows back on all platforms in dark mode, '
              'including Android and Fuchsia. Elevation shadows are barely '
              'visible in dark mode, but can sometimes increase layer '
              'separation of edges. The elevation tint is kept in dark mode '
              'on all platforms, as it is typically needed there, e.g. for '
              'menu color separation from background color. '
              'Grey elevation overlay color in dark mode existed back in M2 '
              'design as well.\n'
              'This theme is not key color seeded by default, but it is '
              'preconfigured to work well by just turning seeded '
              'ColorScheme ON. Try it! It is setup to keep your primary '
              'brand color and to create saturated colorful seed '
              'generated colors, instead of the more pastel M3 defaults.',
          settingsId: 7,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Colorful Scaffold',
          seeded: true,
          subtitle: 'Features a strong primary blend on '
              'the scaffold background color, and primary color on navigators, '
              'with filled TextField using primary opacity and rounded '
              'corners. Has tinted TextTheme and tinted interactions. Seed '
              'generated ColorScheme is ON, using the "Chroma" strategy that '
              'respect the chroma in each used key color and targets it. '
              'It has primary and tertiary keys enabled. '
              'Primary and tertiary colors are locked to their given '
              'design values in light mode, but only primary is locked in '
              'dark mode.\n'
              'Using high blend on scaffold requires that UI '
              'widgets are placed in containers with lower blend, e.g. Cards. '
              'The theme simulator apps Components and Material do this, as '
              'does the Playground app itself. This design is more common on '
              'desktop sized WEB apps. Earlier Playground versions defaulted '
              'to this design. It can look impactful on desktop and WEB apps, '
              'but requires extra care to use it, especially on phone sized '
              'apps. This example also work well if you turn OFF seeded color '
              'scheme.',
          settingsId: 8,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Computed',
          seeded: false,
          subtitle: 'This theme is not seeded, but still uses only three input '
              'colors, primary, secondary and tertiary colors from light '
              'theme mode and computes all other colors, including all dark '
              'mode colors. If you do not want to use a seed generated '
              'ColorScheme and only want to specify '
              'the main light theme colors, primary, secondary and tertiary, '
              'maybe they are your three brand colors, and create '
              'a full ColorScheme based on them, this is a way to do so. '
              'Obviously the dark theme does not have the same fidelity as '
              'hand tuned dark mode colors, but it is a quick and easy way '
              'to get a dark mode theme without defining its colors when not '
              'using seed generated ColorSchemes.',
          settingsId: 9,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Shadcn UI like (BETA)',
          seeded: true,
          subtitle: 'This style configures the Material theme to look '
              'a bit like the Shadcn UI design system. It is not an exact '
              'replica and never will be, consider it more like inspired '
              'by Shadcn. It is primarily intended to be used with the Shadcn '
              'theme colors, but you can of course use it with any of the '
              'built-in schemes. This is a preliminary first config '
              'and will be refined over time as more theming features '
              'are added to the Playground that allow us to bring it closer '
              'to the Shadcn design. Be aware that the results you get '
              'when you use this configuration WILL change  in future '
              'Themes Playground releases.\n\n'
              'As always, export your settings and save them as JSON if you '
              'want to keep them and use them later again in the Playground.',
          settingsId: 10,
          controller: controller,
        ),
        const Divider(),
        UseSeededColorSchemeSwitch(controller: controller),
        SwitchListTileReveal(
          title: const Text('Confirm selection?'),
          subtitleReveal: const Text('To toggle quickly between premade '
              'configurations, turn OFF this option. It is ON by default to '
              'prevent accidental activation of premade themes that will '
              'overwrite you current theme settings when activated.'),
          value: controller.confirmPremade,
          onChanged: controller.setConfirmPremade,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Learn more about key color seeded ColorScheme in the ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _materialDocs,
                  text: 'Material-3 design guide',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. ',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        TestAdaptiveResponse(controller),
        const SizedBox(height: 16),
      ],
    );
  }
}

/// A list tile to show setup info and enable tapping on it to
/// activate it.
class SetupListTile extends StatelessWidget {
  const SetupListTile({
    super.key,
    required this.controller,
    required this.title,
    required this.subtitle,
    this.seeded = true,
    required this.settingsId,
  });
  final String title;
  final String subtitle;
  final int settingsId;
  final bool seeded;
  final ThemeController controller;

  Future<void> _handleSetToPreMade(BuildContext context, String title) async {
    bool? setToPremadeDesign;
    if (controller.confirmPremade) {
      setToPremadeDesign = await showDialog<bool?>(
        context: context,
        builder: (BuildContext context) {
          return SetThemeToPremadeDialog(selectedOption: title);
        },
      );
    } else {
      setToPremadeDesign = true;
    }
    if (setToPremadeDesign ?? false) {
      await controller.setToPremade(settingsId: settingsId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color bgColor =
        seeded ? theme.colorScheme.error : theme.colorScheme.primary;
    final Color fgColor =
        seeded ? theme.colorScheme.onError : theme.colorScheme.onPrimary;
    final TextStyle style = theme.textTheme.labelSmall!.copyWith(
      color: fgColor,
      fontWeight: FontWeight.bold,
    );

    return Banner(
      message: seeded ? 'Seeded' : 'Vanilla',
      location: BannerLocation.topEnd,
      color: bgColor,
      textStyle: style,
      child: ListTileReveal(
        title: Text(title),
        subtitleReveal: Text(subtitle),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 32.0),
          child: FilledButton(
            onPressed: () async {
              await _handleSetToPreMade(context, title);
            },
            child: const Text('Use'),
          ),
        ),
        onTap: () async {
          await _handleSetToPreMade(context, title);
        },
      ),
    );
  }
}
