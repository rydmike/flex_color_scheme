import 'package:flutter/material.dart';

/// Draw a number of boxes showing the colors of key theme color properties
/// in the ColorScheme of the inherited ThemeData and some of its key color
/// properties.
///
/// This widget is just used so we can visually see the active theme colors
/// in the examples and their used FlexColorScheme based themes.
///
/// It also show some warning labels when using surface branding that is too
/// strong and makes the surface require reverse contrasted text in relation to
/// text normally associated with the active theme mode.
///
/// These are all Flutter "Universal" Widgets that only depends on the SDK and
/// all the Widgets in this file be dropped into any application. They are
/// however not so generally reusable.
class ShowThemeColors extends StatelessWidget {
  const ShowThemeColors({Key? key}) : super(key: key);

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light;

  // Return true if the color is dark, meaning it needs light text for contrast.
  static bool _isDark(final Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.dark;

  // On color used when a theme color property does not have a theme onColor.
  static Color _onColor(final Color color) =>
      _isLight(color) ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isDark = colorScheme.brightness == Brightness.dark;
    final Color appBarColor = theme.appBarTheme.backgroundColor ??
        (isDark ? colorScheme.surface : colorScheme.primary);

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
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
    }

    // Warning label for scaffold background when it uses to much blend.
    final String scaffoldTooHigh = isDark
        ? _isLight(theme.scaffoldBackgroundColor)
            ? '\nTOO HIGH'
            : ''
        : _isDark(theme.scaffoldBackgroundColor)
            ? '\nTOO HIGH'
            : '';
    // Warning label for scaffold background when it uses to much blend.
    final String surfaceTooHigh = isDark
        ? _isLight(theme.colorScheme.surface)
            ? '\nTOO HIGH'
            : ''
        : _isDark(theme.colorScheme.surface)
            ? '\nTOO HIGH'
            : '';

    // Warning label for scaffold background when it uses to much blend.
    final String backTooHigh = isDark
        ? _isLight(theme.colorScheme.background)
            ? '\nTOO HIGH'
            : ''
        : _isDark(theme.colorScheme.background)
            ? '\nTOO HIGH'
            : '';

    // Wrap this widget branch in a custom theme where card has a border outline
    // if it did not have one, but retains in ambient themed border radius.
    return Theme(
      data: Theme.of(context).copyWith(
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
              'ColorScheme Colors',
              style: theme.textTheme.subtitle1,
            ),
          ),
          // A Wrap widget is just the right handy widget for this type of
          // widget to make it responsive.
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            runSpacing: 6,
            children: <Widget>[
              ThemeCard(
                label: 'Primary',
                color: colorScheme.primary,
                textColor: colorScheme.onPrimary,
              ),
              ThemeCard(
                label: 'on\nPrimary',
                color: colorScheme.onPrimary,
                textColor: colorScheme.primary,
              ),
              ThemeCard(
                label: 'Primary\nVariant',
                color: colorScheme.primaryVariant,
                textColor: _onColor(colorScheme.primaryVariant),
              ),
              ThemeCard(
                label: 'Secondary',
                color: colorScheme.secondary,
                textColor: colorScheme.onSecondary,
              ),
              ThemeCard(
                label: 'on\nSecondary',
                color: colorScheme.onSecondary,
                textColor: colorScheme.secondary,
              ),
              ThemeCard(
                label: 'Secondary\nVariant',
                color: colorScheme.secondaryVariant,
                textColor: _onColor(colorScheme.secondaryVariant),
              ),
              ThemeCard(
                label: 'Background$backTooHigh',
                color: colorScheme.background,
                textColor: colorScheme.onBackground,
              ),
              ThemeCard(
                label: 'on\nBackground',
                color: colorScheme.onBackground,
                textColor: colorScheme.background,
              ),
              ThemeCard(
                label: 'Surface$surfaceTooHigh',
                color: colorScheme.surface,
                textColor: colorScheme.onSurface,
              ),
              ThemeCard(
                label: 'on\nSurface',
                color: colorScheme.onSurface,
                textColor: colorScheme.surface,
              ),
              ThemeCard(
                label: 'Error',
                color: colorScheme.error,
                textColor: colorScheme.onError,
              ),
              ThemeCard(
                label: 'on\nError',
                color: colorScheme.onError,
                textColor: colorScheme.error,
              ),
              ThemeCard(
                label: 'Themed\nAppBar',
                color: appBarColor,
                textColor: _onColor(appBarColor),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'ThemeData Colors',
              style: theme.textTheme.subtitle1,
            ),
          ),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              ThemeCard(
                label: 'Primary\nColor',
                color: theme.primaryColor,
                textColor: _onColor(theme.primaryColor),
              ),
              ThemeCard(
                label: 'Primary\nDark',
                color: theme.primaryColorDark,
                textColor: _onColor(theme.primaryColorDark),
              ),
              ThemeCard(
                label: 'Primary\nLight',
                color: theme.primaryColorLight,
                textColor: _onColor(theme.primaryColorLight),
              ),
              ThemeCard(
                label: 'Secondary\nHeader',
                color: theme.secondaryHeaderColor,
                textColor: _onColor(theme.secondaryHeaderColor),
              ),
              ThemeCard(
                label: 'Toggleable\nActive',
                color: theme.toggleableActiveColor,
                textColor: _onColor(theme.toggleableActiveColor),
              ),
              ThemeCard(
                label: 'Bottom\nAppBar',
                color: theme.bottomAppBarColor,
                textColor: _onColor(theme.bottomAppBarColor),
              ),
              ThemeCard(
                label: 'Divider',
                color: theme.dividerColor,
                textColor: colorScheme.onBackground,
              ),
              ThemeCard(
                label: 'Disabled',
                color: theme.disabledColor,
                textColor: colorScheme.onBackground,
              ),
              ThemeCard(
                label: 'Canvas$backTooHigh',
                color: theme.canvasColor,
                textColor: colorScheme.onBackground,
              ),
              ThemeCard(
                label: 'Card$surfaceTooHigh',
                color: theme.cardColor,
                textColor: colorScheme.onSurface,
              ),
              ThemeCard(
                label: 'Dialog',
                color: theme.dialogBackgroundColor,
                textColor: colorScheme.onSurface,
              ),
              ThemeCard(
                label: 'Scaffold$scaffoldTooHigh',
                color: theme.scaffoldBackgroundColor,
                textColor: colorScheme.onBackground,
              ),
              ThemeCard(
                label: 'Error\nColor',
                color: theme.errorColor,
                textColor: colorScheme.onError,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// This is just simple SizedBox with a Card with a passed in label, background
/// and text label color. Used to show the colors of a theme color property.
class ThemeCard extends StatelessWidget {
  const ThemeCard({
    Key? key,
    required this.label,
    required this.color,
    required this.textColor,
    this.size = const Size(78, 56),
  }) : super(key: key);

  final String label;
  final Color color;
  final Color textColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Card(
        margin: EdgeInsets.zero,
        color: color,
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: textColor, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
