import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class MaterialAndBottomSheetSettings extends StatelessWidget {
  const MaterialAndBottomSheetSettings(this.controller, {Key? key})
      : super(key: key);

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final String labelForDefaultSelectedItem = isDark
        ? (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default null (light primary, 93% opacity)'
            : 'default null (Light grey)'
        : (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default null (dark primary, 95% opacity)'
            : 'default null (dark grey)';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16),
          child: MaterialAndBottomSheetShowcase(),
        ),
        ColorSchemePopupMenu(
          title: const Text('SnackBar background color'),
          labelForDefault: labelForDefaultSelectedItem,
          index: controller.snackBarSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSnackBarSchemeColor(null);
                  } else {
                    controller
                        .setSnackBarSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
      ],
    );
  }
}
