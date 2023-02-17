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
              'inspiration and to see what FlexColorScheme can do.'
              '\n\n'
              'These templates do no set colors, you choose them as desired. '
              'Most choices use seeded M3 ColorScheme and Material 3 mode. '
              'You can easily turn both off. In fact all configs are just '
              'starting points for you to explore and modify further.'),
        ),
        const Divider(),
        SetupListTile(
          title: 'Default settings',
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
          title: 'Material 3 default styles',
          subtitle: 'Set Playground settings to a configurations that '
              'matches Material 3 defaults. Seeded color scheme is '
              'activated using the default Flutter Material 3 seeded '
              'ColorScheme algorithm.',
          settingsId: 1,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Theme with light surface blends',
          subtitle: 'This...',
          settingsId: 2,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Theme with heavy background blends',
          subtitle: 'This...',
          settingsId: 3,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Material 2 inspired Material 3',
          subtitle: 'This...',
          settingsId: 4,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'Material 3 with bright colors',
          subtitle: 'This...',
          settingsId: 5,
          controller: controller,
        ),
        const Divider(),
        SetupListTile(
          title: 'More platform agnostic Material 3',
          subtitle: 'This...',
          settingsId: 6,
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

  Future<void> _handleSetToPreMade(BuildContext context, String title) async {
    final bool? setToPremadeDesign = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return SetThemeToPremadeDialog(selectedOption: title);
      },
    );
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
          await _handleSetToPreMade(context, title);
        },
        child: const Text('Use'),
      ),
      onTap: () async {
        await _handleSetToPreMade(context, title);
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
      title: Text('Use ${selectedOption.toLowerCase()}?'),
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
            child: const Text('Use design')),
      ],
    );
  }
}
