import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/header_card.dart';
import '../../../shared/widgets/universal/theme_showcase.dart';

class ThemedPrimaryTextTheme extends StatelessWidget {
  const ThemedPrimaryTextTheme(
      {Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      color: Theme.of(context).colorScheme.primary,
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed PrimaryTextTheme'),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: PrimaryTextThemeShowcase(),
      ),
    );
  }
}
