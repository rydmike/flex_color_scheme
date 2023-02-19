import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';

/// A panel with ready premade design we can click on to use.
class PremadeDesignsPanel extends StatelessWidget {
  const PremadeDesignsPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _materialDocs = Uri(
    scheme: 'https',
    host: 'm3.material.io',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodyMedium!
        .copyWith(color: theme.textTheme.bodySmall!.color);
    final TextStyle linkStyle = theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Premade FlexColorScheme designs'),
          subtitle: Text('To get started with theming, try these '
              'premade designs as starting points. You can use them as '
              'inspiration and to see what FlexColorScheme can do. '
              'These templates do no set colors, you choose them as desired. '
              'Many choices use seeded M3 ColorScheme and they all use '
              'Material 3 mode. '
              'You can easily turn both off. In fact all configs are just '
              'starting points for you to explore and modify further.'),
        ),
        const SizedBox(height: 8),
        const Divider(),
        SetupListTile(
          title: 'Playground default',
          seeded: false,
          subtitle: 'Set settings to their Themes Playground defaults. '
              'In Material 2 mode the default setup is quite opinionated, it '
              'mimics M3 in M2 mode. The M3 mode is mostly M3 style, '
              'with some minor tweaks. The NavigationBar and Rail use '
              'primary colored selected items with opacity based indicator.',
          settingsId: 0,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Material 3 default',
          seeded: true,
          subtitle: 'Set Playground settings to a configurations that '
              'matches the Material 3 defaults. Seeded color scheme is '
              'activated using the default Flutter Material 3 seeded '
              'ColorScheme algorithm.',
          settingsId: 1,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Primary navigators',
          seeded: false,
          subtitle: 'This theme features primary color on navigators, with '
              'filled TextField using primary opacity, rounder corners and no '
              'unfocused border. '
              'Outlines on buttons with outline are also primary colored. '
              'Also features light surface blends with tinted '
              'TextTheme and tinted interactions. Does not use seed generated '
              'ColorScheme, but you can turn it ON.',
          settingsId: 2,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Fabulous 12',
          seeded: true,
          subtitle: 'Primary leaning theme, but with high scaffold blend, '
              'a ColorScheme using 3 seed colors and the saturated Jolly '
              'seed strategy. With a smooth looking border radius 12 on all '
              'widgets, except FAB, that is back in shape with its M2 circle '
              'and secondary color.',
          settingsId: 3,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Material 3 does M2',
          seeded: false,
          subtitle: 'Shows how you can emulate Material 2 style '
              'in Material 3 mode. It does not use surface blends or seeded '
              'ColorScheme. It removes elevation tint in light mode, but '
              'keeps it in dark where it is useful. It brings back elevation '
              'shadows in both light and dark mode if they were removed in M3. '
              'It is not entirely default M2, it keeps some useful '
              'consistency cleanups for a bit more refined M2 than Flutter '
              'defaults. Need an M2 styled M3 to migrate? Here it is!',
          settingsId: 4,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'High contrast',
          seeded: true,
          subtitle: 'A theme that looks like it is not seed generated, but '
              'it is. Using the high contrast config and its three key colors '
              'locked in light theme mode. It also uses black and white "on" '
              'colors in light mode. It has very high surface blends, but '
              'since true-black and plain-white setting is used, it is not '
              'very visible and we get an ink black scaffold in dark mode and '
              'plain white in light mode.',
          settingsId: 5,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Primary based',
          seeded: true,
          subtitle: 'This theme limits input colors to only the primary color. '
              'It uses the One Hue seed generation configuration to create '
              'a bright ColorScheme where all colors are shades of the same '
              'input primary color. Even if you turn off using seeds, '
              'FlexColorScheme computes all colors based on the primary '
              'input color, using the usedColor scheme colors set to just '
              'one color.',
          settingsId: 6,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Platform agnostic',
          seeded: false,
          subtitle: 'A more platform agnostic design with M3, '
              'it is less rounded than M3 default to feel more at home on '
              'iOS and other platforms. It removes elevation tint in light '
              'mode, and puts shadows back in light and dark mode. This '
              'only happens on macOS and iOS, other platforms keep the M3 '
              'elevation tint. The config is not seeded, but it is '
              'preconfigured to also work well by just turning seeded '
              'ColorScheme ON. Try it, it will keep your primary brand color '
              'and also use saturated colorful seed colors.',
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
              'corners. Uses tinted TextTheme and tinted interactions. Seed '
              'generated ColorScheme is ON with primary and tertiary keys '
              'used. Primary and tertiary colors are locked to their given '
              'design values in light mode, but only primary in dark.  '
              'Themes with high blend on scaffold requires that UI '
              'widgets are placed in containers with lower blend, e.g. Cards. '
              'The theme simulator apps Components and Material do that, as '
              'does the Playground app itself. This design is more common on '
              'desktop sized WEB apps. Earlier Playground versions defaulted '
              'to this design, it can look impactful on desktop WEB apps, but '
              'it requires extra care to use it on phone sized apps. This '
              'config also work well if you turn OFF seeded color scheme, '
              'it becomes less color tinted then.',
          settingsId: 8,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Computed dark theme',
          seeded: false,
          subtitle: 'This theme is not seeded, but uses only three input '
              'colors primary, secondary and tertiary from light mode and '
              'computes all other colors, including all dark mode colors. If '
              "you don't want to use seeded color and only want to specify "
              'the main light theme colors, maybe 3 brand colors, and create '
              'a full M3 ColorScheme based on them, this is an optional way.',
          settingsId: 9,
          controller: controller,
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'Learn more about Material 3 design in the ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _materialDocs,
                  text: 'Material 3 guide',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. ',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
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

  Future<void> _handleSetToPreMade(
    BuildContext context,
    String title, [
    bool confirm = true,
  ]) async {
    bool? setToPremadeDesign;
    if (confirm) {
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
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 32.0),
          child: FilledButton(
            onPressed: () async {
              await _handleSetToPreMade(context, title, false);
            },
            child: const Text('Use'),
          ),
        ),
        onTap: () async {
          await _handleSetToPreMade(context, title, false);
        },
      ),
    );
  }
}

/// Dialog to confirm if user wants to set theme to a premade setup.
class SetThemeToPremadeDialog extends StatelessWidget {
  const SetThemeToPremadeDialog({super.key, required this.selectedOption});
  final String selectedOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Use "$selectedOption" theme?'),
      content: const Text('Your current configuration will be overwritten, '
          'but custom colors will be kept.'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Use theme')),
      ],
    );
  }
}
