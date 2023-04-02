import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// An [InkWell] that when tapped shows [ColorPicker.showPickerDialog] when
/// tapped.
///
/// It uses a stateless color InkWell. Clicking on it allows the user to
/// change the color using the [ColorPicker] package with its built-in dialog.
///
/// The widget has an onChanged callback that can be used to follow the changes
/// of the color in the dialog as user tries different colors.
///
/// If the users closes the dialog via cancel or barrier dismiss, the
/// wasCancelled returns true.
/// This widget is stateless so it will be up to the user of this
/// widget to hold state and return the color to the state it had
/// when dialog was opened, if so desired.
///
/// This picker is implemented this way so that we can get the selected
/// color via a callback and use the received color to change the theme of
/// the application and allow it to rebuild the theme of the entire app and the
/// screens of the context that opened the dialog. Since the dialog is stateless
/// it can be kept open even though the app under it is being rebuilt.
/// It on purpose uses its stale context and can stay open, however any color
/// theme changes will only apply to a new dialog, it will not affect the open
/// dialog itself. The application and widgets visible below the dialog is
/// however changing as colors are manipulated from the color picker dialog.
class ColorPickerInkWellDialog extends StatelessWidget {
  const ColorPickerInkWellDialog({
    super.key,
    required this.color,
    required this.onChanged,
    this.onHover,
    required this.wasCancelled,
    required this.recentColors,
    required this.onRecentColorsChanged,
    this.pickerSize = 40,
    this.enabled = false,
    required this.child,
  });

  final Color color;
  final ValueChanged<Color> onChanged;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool> wasCancelled;
  final List<Color> recentColors;
  final ValueChanged<List<Color>>? onRecentColorsChanged;

  final double pickerSize;
  final bool enabled;
  final Widget child;

  // Custom colors to use in Light mode
  static final Map<ColorSwatch<Object>, String> _lightSwatches =
      <ColorSwatch<Object>, String>{
    // COLORS: Purple and blue like colors
    ColorTools.createPrimarySwatch(FlexColor.materialLightPrimary):
        'Purple M2 guide Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialLightPrimaryContainer):
        'Purple M2 guide Sec',
    ColorTools.createPrimarySwatch(FlexColor.materialLightPrimaryHc):
        'Blue Flutter HiC Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialLightPrimaryContainerHc):
        'Blue Flutter HiC Sec',
    ColorTools.createPrimarySwatch(FlexColor.blueWhaleLightPrimary):
        'Blue whale Prim',
    ColorTools.createPrimarySwatch(FlexColor.outerSpaceLightPrimary):
        'Outer space Prim',
    ColorTools.createPrimarySwatch(FlexColor.blumineBlueLightPrimary):
        'Blumine Prim',
    ColorTools.createPrimarySwatch(FlexColor.hippieBlueLightPrimary):
        'Hippie blue Prim',
    ColorTools.createPrimarySwatch(FlexColor.aquaBlueLightPrimary):
        'Aqua blue Prim',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueLightPrimary):
        'Brand blue FB Prim',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueLightPrimaryContainer):
        'Brand blue IG PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueLightSecondary):
        'Brand blue TW Sec',
    ColorTools.createPrimarySwatch(FlexColor.ebonyClayLightPrimary):
        'Ebony clay Prim',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueLightTertiary):
        'Brand blue G Tert',
    ColorTools.createPrimarySwatch(FlexColor.deepBlueLightPrimary):
        'Deep blue sea Prim',
    ColorTools.createPrimarySwatch(FlexColor.deepBlueLightSecondary):
        'Deep blue sea Sec',
    // COLORS: Green like
    ColorTools.createPrimarySwatch(FlexColor.jungleLightPrimary): 'Jungle Prim',
    ColorTools.createPrimarySwatch(FlexColor.moneyLightPrimary): 'Money Prim',
    ColorTools.createPrimarySwatch(FlexColor.moneyLightSecondary): 'Money Sec',
    ColorTools.createPrimarySwatch(FlexColor.mallardGreenLightPrimary):
        'Mallard Prim',
    ColorTools.createPrimarySwatch(FlexColor.mallardGreenLightPrimaryContainer):
        'Mallard PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.wasabiLightPrimary): 'Wasabi Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialLightTertiary):
        'Teal M2 guide Tert',
    // COLORS: Red like
    ColorTools.createPrimarySwatch(FlexColor.materialLightError):
        'Error M2 guide',
    ColorTools.createPrimarySwatch(FlexColor.materialLightErrorHc):
        'Error Flutter HiC',
    ColorTools.createPrimarySwatch(FlexColor.redWineLightPrimary):
        'Red Wine Prim',
    ColorTools.createPrimarySwatch(FlexColor.redWineLightSecondary):
        'Red Wine Sec',
    ColorTools.createPrimarySwatch(FlexColor.rosewoodLightPrimary):
        'Rosewood Prim',
    ColorTools.createPrimarySwatch(FlexColor.rosewoodLightPrimaryContainer):
        'Rosewood PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.sakuraLightPrimary): 'Sakura Prim',
    ColorTools.createPrimarySwatch(FlexColor.sakuraLightPrimaryContainer):
        'Sakura PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.sakuraLightSecondary):
        'Sakura Sec',
    ColorTools.createPrimarySwatch(FlexColor.mandyRedLightPrimary):
        'Mandy red Prim',
    ColorTools.createPrimarySwatch(FlexColor.sanJuanBlueLightSecondary):
        'SanJuan Sec',
    ColorTools.createPrimarySwatch(FlexColor.damaskLightPrimary): 'Damask Prim',
    ColorTools.createPrimarySwatch(FlexColor.damaskLightPrimaryContainer):
        'Damask PrimVar',
    // COLORS: Orange like
    ColorTools.createPrimarySwatch(FlexColor.goldLightPrimary): 'Gold Prim',
    ColorTools.createPrimarySwatch(FlexColor.bahamaBlueLightSecondary):
        'Bahama Sec',
    ColorTools.createPrimarySwatch(FlexColor.sharkLightSecondary): 'Shark Sec',
    ColorTools.createPrimarySwatch(FlexColor.sharkLightTertiary): 'Shark Tert',
    ColorTools.createPrimarySwatch(FlexColor.outerSpaceLightSecondary):
        'Outer space Sec',
    ColorTools.createPrimarySwatch(FlexColor.blueWhaleLightSecondary):
        'Blue whale Sec',
    ColorTools.createPrimarySwatch(FlexColor.bigStoneLightSecondary):
        'Big stone Sec',
    ColorTools.createPrimarySwatch(FlexColor.blumineBlueLightSecondary):
        'Blumine Sec',
  };

  // Custom colors to use in Dark mode
  static final Map<ColorSwatch<Object>, String> _darkSwatches =
      <ColorSwatch<Object>, String>{
    // COLORS: Purple and blue like colors
    ColorTools.createPrimarySwatch(FlexColor.materialDarkPrimary):
        'Purple M2 guide Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialDarkPrimaryContainer):
        'Purple M2 guide Sec',
    ColorTools.createPrimarySwatch(FlexColor.materialDarkPrimaryHc):
        'Blue Flutter HiC Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialDarkPrimaryContainerHc):
        'Blue Flutter HiC Sec',
    ColorTools.createPrimarySwatch(FlexColor.blueWhaleDarkPrimary):
        'Blue whale Prim',
    ColorTools.createPrimarySwatch(FlexColor.outerSpaceDarkPrimary):
        'Outer space Prim',
    ColorTools.createPrimarySwatch(FlexColor.blumineBlueDarkPrimary):
        'Blumine Prim',
    ColorTools.createPrimarySwatch(FlexColor.hippieBlueDarkPrimary):
        'Hippie blue Prim',
    ColorTools.createPrimarySwatch(FlexColor.aquaBlueDarkPrimary):
        'Aqua blue Prim',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueDarkPrimary):
        'Brand blue FB Prim',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueDarkPrimaryContainer):
        'Brand blue IG PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueDarkSecondary):
        'Brand blue TW Sec',
    ColorTools.createPrimarySwatch(FlexColor.ebonyClayDarkPrimary):
        'Ebony clay Prim',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueDarkTertiary):
        'Brand blue G Tert',
    ColorTools.createPrimarySwatch(FlexColor.deepBlueDarkPrimary):
        'Deep blue sea Prim',
    ColorTools.createPrimarySwatch(FlexColor.deepBlueDarkSecondary):
        'Deep blue sea Sec',
    // COLORS: Green like
    ColorTools.createPrimarySwatch(FlexColor.jungleDarkPrimary): 'Jungle Prim',
    ColorTools.createPrimarySwatch(FlexColor.moneyDarkPrimary): 'Money Prim',
    ColorTools.createPrimarySwatch(FlexColor.moneyDarkSecondary): 'Money Sec',
    ColorTools.createPrimarySwatch(FlexColor.mallardGreenDarkPrimary):
        'Mallard Prim',
    ColorTools.createPrimarySwatch(FlexColor.mallardGreenDarkPrimaryContainer):
        'Mallard PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.wasabiDarkPrimary): 'Wasabi Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialDarkTertiary):
        'Teal M2 guide Tert',
    // COLORS: Red like
    ColorTools.createPrimarySwatch(FlexColor.materialDarkError):
        'Error M2 guide',
    ColorTools.createPrimarySwatch(FlexColor.materialDarkErrorHc):
        'Error Flutter HiC',
    ColorTools.createPrimarySwatch(FlexColor.redWineDarkPrimary):
        'Red Wine Prim',
    ColorTools.createPrimarySwatch(FlexColor.redWineDarkSecondary):
        'Red Wine Sec',
    ColorTools.createPrimarySwatch(FlexColor.rosewoodDarkPrimary):
        'Rosewood Prim',
    ColorTools.createPrimarySwatch(FlexColor.rosewoodDarkPrimaryContainer):
        'Rosewood PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.sakuraDarkPrimary): 'Sakura Prim',
    ColorTools.createPrimarySwatch(FlexColor.sakuraDarkPrimaryContainer):
        'Sakura PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.sakuraDarkSecondary): 'Sakura Sec',
    ColorTools.createPrimarySwatch(FlexColor.mandyRedDarkPrimary):
        'Mandy red Prim',
    ColorTools.createPrimarySwatch(FlexColor.sanJuanBlueDarkSecondary):
        'SanJuan Sec',
    ColorTools.createPrimarySwatch(FlexColor.damaskDarkPrimary): 'Damask Prim',
    ColorTools.createPrimarySwatch(FlexColor.damaskDarkPrimaryContainer):
        'Damask PrimVar',
    // COLORS: Orange like
    ColorTools.createPrimarySwatch(FlexColor.goldDarkPrimary): 'Gold Prim',
    ColorTools.createPrimarySwatch(FlexColor.bahamaBlueDarkSecondary):
        'Bahama Sec',
    ColorTools.createPrimarySwatch(FlexColor.sharkDarkSecondary): 'Shark Sec',
    ColorTools.createPrimarySwatch(FlexColor.sharkDarkTertiary): 'Shark Tert',
    ColorTools.createPrimarySwatch(FlexColor.outerSpaceDarkSecondary):
        'Outer space Sec',
    ColorTools.createPrimarySwatch(FlexColor.blueWhaleDarkSecondary):
        'Blue whale Sec',
    ColorTools.createPrimarySwatch(FlexColor.bigStoneDarkSecondary):
        'Big stone Sec',
    ColorTools.createPrimarySwatch(FlexColor.blumineBlueDarkSecondary):
        'Blumine Sec',
  };

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    // Make the picker using current theme, this will not change after
    // the picker dialog is opened.
    final ColorPicker colorPicker = ColorPicker(
      color: color,
      onColorChanged: onChanged,
      crossAxisAlignment: CrossAxisAlignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      enableShadesSelection: true,
      enableTonalPalette: true,
      width: 35,
      height: 35,
      spacing: 2,
      runSpacing: 2,
      elevation: 0,
      hasBorder: true,
      borderRadius: 4,
      wheelDiameter: 195,
      wheelHasBorder: false,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      pickerTypeLabels: const <ColorPickerType, String>{
        ColorPickerType.primary: 'Primary',
        ColorPickerType.accent: 'Accent',
        ColorPickerType.bw: 'B&W',
        ColorPickerType.both: 'Both',
        ColorPickerType.custom: 'FlexColor',
        ColorPickerType.wheel: 'Any',
      },
      maxRecentColors: 9,
      recentColors: recentColors,
      onRecentColorsChanged: onRecentColorsChanged,
      title: Text('Select Color', style: theme.textTheme.titleLarge),
      subheading: Text('Select color shade', style: theme.textTheme.bodyLarge),
      wheelSubheading: Text('Selected color and its shades',
          style: theme.textTheme.bodyLarge),
      recentColorsSubheading:
          Text('Recent colors', style: theme.textTheme.bodyLarge),
      selectedPickerTypeColor: theme.colorScheme.primary,
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      colorCodeHasColor: true,
      customColorSwatchesAndNames: isLight
          ? ColorPickerInkWellDialog._lightSwatches
          : ColorPickerInkWellDialog._darkSwatches,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
        editUsesParsedPaste: true,
        copyButton: true,
        pasteButton: true,
        copyFormat: ColorPickerCopyFormat.dartCode,
      ),
      actionButtons: const ColorPickerActionButtons(
        closeButton: true,
        okButton: true,
        dialogActionButtons: false,
        closeTooltipIsClose: false,
      ),
      showRecentColors: true,
    );

    return InkWell(
      onHover: (bool value) {
        onHover?.call(value);
      },
      hoverColor: Colors.transparent,
      onTap: enabled
          ? () async {
              // ignore: use_build_context_synchronously
              if (await colorPicker.showPickerDialog(
                context,
                insetPadding: const EdgeInsets.all(16),
                barrierColor: Colors.black.withOpacity(0.05),
                constraints: const BoxConstraints(
                  minHeight: 560,
                  minWidth: 450,
                  maxWidth: 450,
                ),
              )) {
                wasCancelled(false);
              } else {
                wasCancelled(true);
              }
            }
          : null,
      child: child,
    );
  }
}
