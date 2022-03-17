import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/header_card.dart';
import '../../../shared/widgets/universal/theme_showcase.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({
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
        title: const Text('Card'),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: CardShowcase(),
        ));
  }
}
