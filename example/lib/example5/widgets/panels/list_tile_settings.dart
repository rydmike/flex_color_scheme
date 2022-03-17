import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/header_card.dart';
import '../../../shared/widgets/universal/theme_showcase.dart';

class ListTileSettings extends StatelessWidget {
  const ListTileSettings({
    Key? key,
    this.isOpen = true,
    this.onTap,
  }) : super(key: key);
  final bool isOpen;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('ListTile'),
      child: const ListTileShowcase(),
    );
  }
}
