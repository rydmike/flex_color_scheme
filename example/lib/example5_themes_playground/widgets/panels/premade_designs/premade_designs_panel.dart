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
          subtitle: Text('To quickly get started with theming, try these '
              'premade designs as starting points. You can use them as '
              'inspiration and to see what FlexColorScheme can do. '
              'These templates do no set colors, you choose them as desired. '
              'Most choices use seeded M3 ColorScheme and Material 3 mode. '
              'You can easily turn both off. In fact all configs are just '
              'starting points for you to explore and modify further.'),
        ),
        const Divider(),
        SetupListTile(
          title: 'Playground default',
          subtitle: 'Set settings back to their Themes Playground defaults. '
              'In Material 2 mode the default setup is quite opinionated, it '
              'mimics M3 in M2 mode. The M3 mode is almost default M3 style, '
              'with some minor tweaks. The NavigationBar and Rail use a '
              'primary colored selected items with opacity based indicator.',
          settingsId: 0,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Material 3 default',
          subtitle: 'Set Playground settings to a configurations that '
              'matches Material 3 defaults. Seeded color scheme is '
              'activated using the default Flutter Material 3 seeded '
              'ColorScheme algorithm.',
          settingsId: 1,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Primary focused',
          subtitle: 'This theme features primary color on navigators, filled '
              'text input with primary opacity, rounders corner and no '
              'unfocused border. '
              'Outlines on buttons with outline are also primary colored. '
              'Uses light surface blends with tinted texts and interactions. '
              'It does not use seed generated ColorScheme',
          settingsId: 2,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Fabulous 12',
          subtitle: 'Primary leaning theme, but with high scaffold blend, '
              'a ColorScheme using 3 seed colors and the saturated Vivid '
              'seed strategy. With smooth looking border radius 12 on all '
              'widgets, except FAB, that is back in shape with its M2 circle.',
          settingsId: 3,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Material 3 does Material 2',
          subtitle: 'Shows how you can emulate Material 2 style '
              'in Material 3 mode. It does not use surface blends or seeded '
              'ColorScheme. It removes elevation tint in light mode, but '
              'keeps it in dark where it is useful. It brings back elevation '
              'shadows in both light and dark mode if they were removed in M3. '
              'It is not entirely default M2, it keeps some useful '
              'consistency cleanups for a bit more refined M2 than Flutter '
              'defaults. Need an M2 style M3 to migrate? Here it is!',
          settingsId: 4,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'High contrast, locked keys',
          subtitle: 'A theme that looks like it is not seed generated, but '
              'it is, using the high contrast config and the three key colors '
              'locked in light theme mode, also uses black and white on '
              'colors in light mode. It has high surface blends, but since '
              'true black and plain white setting is used, it is not very '
              'visible and we have ink black scaffold in dart mode and '
              'plain white one in light mode.',
          settingsId: 5,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'All primary based',
          subtitle: 'This theme limits input colors to only the primary color, '
              'It uses the One Hue seed generation to create a bright '
              'ColorScheme where all colors are shades of the same primary '
              'input. Even if you turn off using seeds, FlexColorScheme '
              'computes all colors based on the primary input color.',
          settingsId: 6,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Platform agnostic M3',
          subtitle: 'This theme show a more platform agnostic design with M3, '
              'it is less rounded then M3 default to feel more at home on '
              'iOS but also it on Android ads brand expression. It removes '
              'elevation tint in light mode, and puts shadows back in light '
              'and dark mode, but this only happens on macOS and iOS, other '
              'platforms keep the M3 surface tint.',
          settingsId: 7,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Computed dark theme',
          subtitle: 'This theme is not seeded, but uses only three input '
              'colors primary, secondary and tertiary from light mode and '
              'computes all other colors, including all dark mode colors. If '
              "you don't want to use seeded color and only want to specify "
              'the main light theme colors, maybe 3 brand colors, and create '
              'a full M3 ColorScheme based on them, this is an optional way.',
          settingsId: 7,
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
    required this.settingsId,
  });
  final String title;
  final String subtitle;
  final int settingsId;
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
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: FilledButton(
        onPressed: () async {
          await _handleSetToPreMade(context, title, false);
        },
        child: const Text('Use'),
      ),
      onTap: () async {
        await _handleSetToPreMade(context, title, false);
      },
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
