import 'package:flutter/material.dart';

import '../../../../../shared/controllers/theme_controller.dart';
import '../../../../../shared/widgets/universal/header_card.dart';
import '../../../../../shared/widgets/universal/show_color_scheme_colors.dart';
import '../select_theme/theme_popup_menu.dart';

// Panel used to show a mor compact view of the ColorScheme colors.
class ColorSchemeColors extends StatelessWidget {
  const ColorSchemeColors({
    Key? key,
    required this.controller,
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);
  final ThemeController controller;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('ColorScheme Colors'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ThemePopupMenu(controller: controller),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShowColorSchemeColors(),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('This shows all the effective ColorScheme colors in '
                'a compact form. '
                'They are presented in the same order as they appear in the '
                'ColorScheme class. The deprecated colors primaryVariant and '
                'secondaryVariant are excluded.'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
