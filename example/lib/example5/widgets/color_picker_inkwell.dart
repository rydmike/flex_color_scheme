import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// A [ColorPicker] that shows a dialog, when a child, normally Material
/// is wrapped in an InkWell.
///
/// It uses a stateless color InkWell. Clicking on it allows the user to
/// change the color using a custom
/// [ColorPicker] package via a dialog. The indicator has an onChanged
/// callback that can be used to follow the changes of the color in the
/// dialog as user tries different colors. If the users closes the dialog
/// via cancel or barrier dismiss, the wasCancelled returns true.
/// This widget is stateless so it will be up to the user of this
/// widget to hold state and return the color to the state it had
/// when dialog was opened, if so desired.
///
/// This picker is implemented this way so that we can get the selected
/// color via a callback and use the received color to change the theme of
/// the application and allow it to rebuild the theme of the entire app and the
/// screens of the context that opened the dialog. Since the dialog is stateless
/// it can be kept open even though the app under it is being rebuilt.
class ColorPickerInkWell extends StatelessWidget {
  const ColorPickerInkWell({
    Key? key,
    required this.color,
    required this.onChanged,
    required this.wasCancelled,
    required this.recentColors,
    required this.onRecentColorsChanged,
    this.pickerSize = 40,
    this.enabled = false,
    required this.child,
  }) : super(key: key);

  final Color color;
  final ValueChanged<Color> onChanged;
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
    ColorTools.createPrimarySwatch(FlexColor.materialLightPrimaryVariant):
        'Purple M2 guide Sec',
    ColorTools.createPrimarySwatch(FlexColor.materialLightPrimaryHc):
        'Blue Flutter HiC Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialLightPrimaryVariantHc):
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
    ColorTools.createPrimarySwatch(FlexColor.brandBlueLightPrimaryVariant):
        'Brand blue IG PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueLightSecondary):
        'Brand blue TW Sec',
    ColorTools.createPrimarySwatch(FlexColor.ebonyClayLightPrimary):
        'Ebony clay Prim',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueLightSecondaryVariant):
        'Brand blue G SecVar',
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
    ColorTools.createPrimarySwatch(FlexColor.mallardGreenLightPrimaryVariant):
        'Mallard PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.wasabiLightPrimary): 'Wasabi Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialLightSecondaryVariant):
        'Teal M2 guide SecVar',
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
    ColorTools.createPrimarySwatch(FlexColor.rosewoodLightPrimaryVariant):
        'Rosewood PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.sakuraLightPrimary): 'Sakura Prim',
    ColorTools.createPrimarySwatch(FlexColor.sakuraLightPrimaryVariant):
        'Sakura PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.sakuraLightSecondary):
        'Sakura Sec',
    ColorTools.createPrimarySwatch(FlexColor.mandyRedLightPrimary):
        'Mandy red Prim',
    ColorTools.createPrimarySwatch(FlexColor.sanJuanBlueLightSecondary):
        'SanJuan Sec',
    ColorTools.createPrimarySwatch(FlexColor.damaskLightPrimary): 'Damask Prim',
    ColorTools.createPrimarySwatch(FlexColor.damaskLightPrimaryVariant):
        'Damask PrimVar',
    // COLORS: Orange like
    ColorTools.createPrimarySwatch(FlexColor.goldLightPrimary): 'Gold Prim',
    ColorTools.createPrimarySwatch(FlexColor.bahamaBlueLightSecondary):
        'Bahama Sec',
    ColorTools.createPrimarySwatch(FlexColor.sharkLightSecondary): 'Shark Sec',
    ColorTools.createPrimarySwatch(FlexColor.sharkLightSecondaryVariant):
        'Shark SecVar',
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
    ColorTools.createPrimarySwatch(FlexColor.materialDarkPrimaryVariant):
        'Purple M2 guide Sec',
    ColorTools.createPrimarySwatch(FlexColor.materialDarkPrimaryHc):
        'Blue Flutter HiC Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialDarkPrimaryVariantHc):
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
    ColorTools.createPrimarySwatch(FlexColor.brandBlueDarkPrimaryVariant):
        'Brand blue IG PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueDarkSecondary):
        'Brand blue TW Sec',
    ColorTools.createPrimarySwatch(FlexColor.ebonyClayDarkPrimary):
        'Ebony clay Prim',
    ColorTools.createPrimarySwatch(FlexColor.brandBlueDarkSecondaryVariant):
        'Brand blue G SecVar',
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
    ColorTools.createPrimarySwatch(FlexColor.mallardGreenDarkPrimaryVariant):
        'Mallard PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.wasabiDarkPrimary): 'Wasabi Prim',
    ColorTools.createPrimarySwatch(FlexColor.materialDarkSecondaryVariant):
        'Teal M2 guide SecVar',
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
    ColorTools.createPrimarySwatch(FlexColor.rosewoodDarkPrimaryVariant):
        'Rosewood PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.sakuraDarkPrimary): 'Sakura Prim',
    ColorTools.createPrimarySwatch(FlexColor.sakuraDarkPrimaryVariant):
        'Sakura PrimVar',
    ColorTools.createPrimarySwatch(FlexColor.sakuraDarkSecondary): 'Sakura Sec',
    ColorTools.createPrimarySwatch(FlexColor.mandyRedDarkPrimary):
        'Mandy red Prim',
    ColorTools.createPrimarySwatch(FlexColor.sanJuanBlueDarkSecondary):
        'SanJuan Sec',
    ColorTools.createPrimarySwatch(FlexColor.damaskDarkPrimary): 'Damask Prim',
    ColorTools.createPrimarySwatch(FlexColor.damaskDarkPrimaryVariant):
        'Damask PrimVar',
    // COLORS: Orange like
    ColorTools.createPrimarySwatch(FlexColor.goldDarkPrimary): 'Gold Prim',
    ColorTools.createPrimarySwatch(FlexColor.bahamaBlueDarkSecondary):
        'Bahama Sec',
    ColorTools.createPrimarySwatch(FlexColor.sharkDarkSecondary): 'Shark Sec',
    ColorTools.createPrimarySwatch(FlexColor.sharkDarkSecondaryVariant):
        'Shark SecVar',
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
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    return InkWell(
      // We want a bit more pronounced hover color for this case than normally.
      hoverColor: isLight ? const Color(0x40BCBCBC) : const Color(0x30FFFFFF),
      splashColor: isLight ? const Color(0x40BCBCBC) : const Color(0x30FFFFFF),
      focusColor: isLight ? const Color(0x40BCBCBC) : const Color(0x30FFFFFF),
      highlightColor:
          isLight ? const Color(0x40BCBCBC) : const Color(0x30FFFFFF),
      onTap: enabled
          ? () async {
              if (await ColorPicker(
                color: color,
                onColorChanged: onChanged,
                crossAxisAlignment: CrossAxisAlignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                enableShadesSelection: true,
                width: 35,
                height: 35,
                spacing: 3,
                runSpacing: 3,
                elevation: 0,
                hasBorder: false,
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
                title: Text('Select Color',
                    style: Theme.of(context).textTheme.headline6),
                subheading: Text('Select color shade',
                    style: Theme.of(context).textTheme.bodyText2),
                wheelSubheading: Text('Selected color and its shades',
                    style: Theme.of(context).textTheme.bodyText2),
                recentColorsSubheading: Text('Recent colors',
                    style: Theme.of(context).textTheme.bodyText2),
                showMaterialName: true,
                showColorName: true,
                showColorCode: true,
                colorCodeHasColor: true,
                customColorSwatchesAndNames:
                    isLight ? _lightSwatches : _darkSwatches,
                copyPasteBehavior: const ColorPickerCopyPasteBehavior(
                  longPressMenu: true,
                  editUsesParsedPaste: true,
                  copyButton: true,
                  pasteButton: true,
                ),
                actionButtons: const ColorPickerActionButtons(
                  closeButton: true,
                  okButton: true,
                  dialogActionButtons: false,
                  closeTooltipIsClose: false,
                ),
                showRecentColors: true,
              ).showPickerDialog(
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
