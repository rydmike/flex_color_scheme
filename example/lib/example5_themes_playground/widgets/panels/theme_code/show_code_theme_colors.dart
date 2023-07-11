import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/widgets/app/color_card.dart';
import '../../../theme/code_theme.dart';

/// Draw a number of boxes showing the colors of color properties in the
/// [CodeTheme] extension of the inherited ThemeData and its color properties.
///
/// This widget is just used so we can visually see the active code highlight
/// colors in the examples and their used FlexColorScheme based themes.
///
class ShowCodeThemeColors extends StatelessWidget {
  const ShowCodeThemeColors({super.key, this.onBackgroundColor});

  /// The color of the background the color widget are being drawn on.
  ///
  /// Some of the theme colors may have semi transparent fill color. To compute
  /// a legible text color for the sum when it shown on a background color, we
  /// need to alpha merge it with background and we need the exact background
  /// color it is drawn on for that. If not passed in from parent, it is
  /// assumed to be drawn on card color, which usually is close enough.
  final Color? onBackgroundColor;

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light;

  // On color used when a theme color property does not have a theme onColor.
  static Color _onColor(final Color color, final Color bg) =>
      _isLight(Color.alphaBlend(color, bg)) ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool useMaterial3 = theme.useMaterial3;
    // Get our custom code view theme from the BrandTheme extension, with a
    // fallback to primary color. We use the light and dark fixed version as
    // it uses the const values as fallback in case the theme extension has
    // not been added to [ThemeData].
    //
    // While the theme extension [CodeTheme] in this example is based on same
    // colors as it static light and dark mode, it is also color harmonized to
    // source color. In this case theme surface tint color, which typically
    // equals primary color.
    // Fallback is only used if CodeTheme is not setup in app's ThemeData.
    // This will not happen in this app. This kind of fallback would be to
    // defaults you would use if you had a package that provided a theme
    // extension, and it would fallback to defaults like this internally if
    // it had not been added by user to ThemeData as an extension.
    final CodeTheme colors = theme.extension<CodeTheme>() ??
        (isDark ? CodeTheme.dark : CodeTheme.light);

    final Size mediaSize = MediaQuery.sizeOf(context);
    final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint;
    final double spacing = isPhone ? 3 : 6;

    // Grab the card border from the theme card shape
    ShapeBorder? border = theme.cardTheme.shape;
    // If we had one, copy in a border side to it.
    if (border is RoundedRectangleBorder) {
      border = border.copyWith(
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
      // If
    } else {
      // If border was null, make one matching Card default, but with border
      // side, if it was not null, we leave it as it was.
      border ??= RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(useMaterial3 ? 12 : 4)),
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
    }

    // Get effective background color.
    final Color background =
        onBackgroundColor ?? theme.cardTheme.color ?? theme.cardColor;

    // Wrap this widget branch in a custom theme where card has a border outline
    // if it did not have one, but retains in ambient themed border radius.
    return Theme(
      data: theme.copyWith(
        cardTheme: CardTheme.of(context).copyWith(
          elevation: 0,
          shape: border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'CodeTheme Colors',
              style: theme.textTheme.titleMedium,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: spacing,
            runSpacing: spacing,
            children: <Widget>[
              ColorCard(
                label: 'Base\n#${colors.baseColor!.hexCode}',
                color: colors.baseColor!,
                textColor: _onColor(colors.baseColor!, background),
              ),
              ColorCard(
                label: 'Number\n#${colors.numberColor!.hexCode}',
                color: colors.numberColor!,
                textColor: _onColor(colors.numberColor!, background),
              ),
              ColorCard(
                label: 'Comment\n#${colors.commentColor!.hexCode}',
                color: colors.commentColor!,
                textColor: _onColor(colors.commentColor!, background),
              ),
              ColorCard(
                label: 'Keyword\n#${colors.keywordColor!.hexCode}',
                color: colors.keywordColor!,
                textColor: _onColor(colors.keywordColor!, background),
              ),
              ColorCard(
                label: 'String\n#${colors.stringColor!.hexCode}',
                color: colors.stringColor!,
                textColor: _onColor(colors.stringColor!, background),
              ),
              ColorCard(
                label: 'Punctuation\n#${colors.punctuationColor!.hexCode}',
                color: colors.punctuationColor!,
                textColor: _onColor(colors.punctuationColor!, background),
              ),
              ColorCard(
                label: 'Class\n#${colors.classColor!.hexCode}',
                color: colors.classColor!,
                textColor: _onColor(colors.classColor!, background),
              ),
              ColorCard(
                label: 'Constant\n#${colors.constantColor!.hexCode}',
                color: colors.constantColor!,
                textColor: _onColor(colors.constantColor!, background),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
