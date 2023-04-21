import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';

/// Popup used to change the used FlexSchemeData index in the theme controller
/// and via that the selected active theme.
class InputColorsPopupMenu extends StatelessWidget {
  const InputColorsPopupMenu({
    super.key,
    required this.controller,
    this.contentPadding,
  });
  final ThemeController controller;
  // Defaults to 16, like ListTile does.
  final EdgeInsetsGeometry? contentPadding;

  double _borderRadius(bool useMaterial3) =>
      controller.useSubThemes && controller.useFlexColorScheme
          // M3 default for Card is 12.
          ? (controller.cardBorderRadius ?? controller.defaultRadius ?? 12)
          // M3 or M2 default for Card.
          : useMaterial3
              ? 12
              : 4;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;

    return PopupMenuButton<int>(
      tooltip: '',
      initialValue: controller.schemeIndex,
      padding: EdgeInsets.zero,
      onSelected: controller.setSchemeIndex,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i < AppColor.schemes.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(AppColor.schemes[i].name),
              leading: SizedBox(
                width: 52,
                child: FlexThemeModeOptionButton(
                  flexSchemeColor: isLight
                      ? AppColor.schemeAtIndex(i, controller).light
                      : AppColor.schemeAtIndex(i, controller).dark,
                  selected: i == controller.schemeIndex,
                  unselectedBorder: BorderSide.none,
                  selectedBorder: BorderSide(
                    color: scheme.outline,
                    width: 3,
                  ),
                  backgroundColor: scheme.background,
                  width: 26,
                  height: 18,
                  padding: EdgeInsets.zero,
                  borderRadius: 0,
                  optionButtonPadding: EdgeInsets.zero,
                  optionButtonMargin: EdgeInsets.zero,
                  optionButtonBorderRadius: _borderRadius(useMaterial3),
                ),
              ),
            ),
          )
      ],
      child: ListTile(
        contentPadding: contentPadding,
        title: Text(
          '${AppColor.schemes[controller.schemeIndex].name} theme',
        ),
        subtitle: Text(AppColor.schemes[controller.schemeIndex].description),
        trailing: SizedBox(
          width: 68,
          // The parent PopupMenuButton handles the tap.
          child: AbsorbPointer(
            child: FlexThemeModeOptionButton(
              flexSchemeColor: FlexSchemeColor(
                primary: scheme.primary,
                primaryContainer: scheme.primaryContainer,
                secondary: scheme.secondary,
                secondaryContainer: scheme.secondaryContainer,
                tertiary: scheme.tertiary,
                tertiaryContainer: scheme.tertiaryContainer,
              ),
              selected: false,
              unselectedBorder: BorderSide.none,
              backgroundColor: scheme.background,
              width: 30,
              height: 24,
              padding: EdgeInsets.zero,
              borderRadius: 0,
              optionButtonPadding: EdgeInsets.zero,
              optionButtonMargin: EdgeInsets.zero,
              optionButtonBorderRadius: _borderRadius(useMaterial3),
            ),
          ),
        ),
      ),
    );
  }
}
