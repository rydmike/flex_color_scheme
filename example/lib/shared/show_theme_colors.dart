import 'package:flutter/material.dart';

/// Draw a number of boxes showing the colors of key theme color properties
/// in the ColorScheme of the inherited ThemeData and some of its key color
/// properties.
///
/// This widget is just used so we can visually see the active theme colors
/// in the examples and their used FlexColorScheme based themes.
class ShowThemeColors extends StatelessWidget {
  const ShowThemeColors({Key? key}) : super(key: key);

  // On color used when a theme color property does not have a theme onColor.
  static Color _onColor(final Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light
          ? Colors.black
          : Colors.white;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final Color appBarColor =
        theme.appBarTheme.backgroundColor ?? theme.primaryColor;

    // A Wrap widget is just the right handy widget for this type of
    // widget to make it responsive.
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        ThemeCard(
          label: 'Primary',
          color: colorScheme.primary,
          textColor: colorScheme.onPrimary,
        ),
        ThemeCard(
          label: 'Primary\nColor',
          color: theme.primaryColor,
          textColor: theme.primaryTextTheme.subtitle1!.color ?? Colors.white,
        ),
        ThemeCard(
          label: 'Primary\nColorDark',
          color: theme.primaryColorDark,
          textColor: _onColor(theme.primaryColorDark),
        ),
        ThemeCard(
          label: 'Primary\nColorLight',
          color: theme.primaryColorLight,
          textColor: _onColor(theme.primaryColorLight),
        ),
        ThemeCard(
          label: 'Secondary\nHeader',
          color: theme.secondaryHeaderColor,
          textColor: _onColor(theme.secondaryHeaderColor),
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
          label: 'Toggleable\nActive',
          color: theme.toggleableActiveColor,
          textColor: _onColor(theme.toggleableActiveColor),
        ),
        ThemeCard(
          label: 'Secondary\nVariant',
          color: colorScheme.secondaryVariant,
          textColor: _onColor(colorScheme.secondaryVariant),
        ),
        ThemeCard(
          label: 'AppBar',
          color: appBarColor,
          textColor: _onColor(appBarColor),
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
          label: 'Background',
          color: colorScheme.background,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Canvas',
          color: theme.canvasColor,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Surface',
          color: colorScheme.surface,
          textColor: colorScheme.onSurface,
        ),
        ThemeCard(
          label: 'Card',
          color: theme.cardColor,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Dialog',
          color: theme.dialogBackgroundColor,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Scaffold\nbackground',
          color: theme.scaffoldBackgroundColor,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Error',
          color: colorScheme.error,
          textColor: colorScheme.onError,
        ),
      ],
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
  }) : super(key: key);

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 85,
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
