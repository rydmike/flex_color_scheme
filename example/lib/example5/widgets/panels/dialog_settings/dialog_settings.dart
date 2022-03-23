import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class DialogSettings extends StatelessWidget {
  const DialogSettings({Key? key, required this.controller}) : super(key: key);
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Themed dialog'),
          subtitle: Text('Flutter SDK default background is '
              'colorScheme.background for Dialog and DatePickerDialog, but '
              'colorScheme.surface for TimePickerDialog. FlexColorScheme '
              'sub-themes use surface as default for all dialogs, to ensure '
              'that they have the same background by default and that '
              'elevation overlay color works in dark mode.\n\n'
              'You can theme them to a shared color scheme based color too.'),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: 'null (background)',
          index: controller.dialogBackgroundSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setDialogBackgroundSchemeColor(null);
                  } else {
                    controller.setDialogBackgroundSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const AlertDialogShowcase(),
        const TimePickerDialogShowcase(),
        const DatePickerDialogShowcase(),
      ],
    );
  }
}
