import 'package:flutter/material.dart';

// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the examples.

// Draw a number of boxes showing the colors of key theme color properties
// in the ColorScheme of the inherited ThemeData and some of its key color
// properties.
// This widget is just used so we can visually see the active theme colors
// in the examples and their used FlexColorScheme based themes.
class ShowThemeColors extends StatelessWidget {
  const ShowThemeColors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final Color appBarColor = theme.appBarTheme.color ?? theme.primaryColor;

    // A Wrap widget is just the right handy widget for this type of
    // widget to make it responsive.
    return Wrap(
      spacing: 4,
      runSpacing: 4,
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
          textColor: theme.primaryTextTheme.subtitle1.color,
        ),
        ThemeCard(
          label: 'Primary\nColorDark',
          color: theme.primaryColorDark,
          textColor:
              ThemeData.estimateBrightnessForColor(theme.primaryColorDark) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
        ThemeCard(
          label: 'Primary\nColorLight',
          color: theme.primaryColorLight,
          textColor:
              ThemeData.estimateBrightnessForColor(theme.primaryColorLight) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
        ThemeCard(
          label: 'Secondary\nHeader',
          color: theme.secondaryHeaderColor,
          textColor: ThemeData.estimateBrightnessForColor(
                      theme.secondaryHeaderColor) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        ThemeCard(
          label: 'Primary\nVariant',
          color: colorScheme.primaryVariant,
          textColor: ThemeData.estimateBrightnessForColor(
                      colorScheme.primaryVariant) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        ThemeCard(
          label: 'Secondary',
          color: colorScheme.secondary,
          textColor: colorScheme.onSecondary,
        ),
        ThemeCard(
          label: 'Accent\nColor',
          color: theme.accentColor,
          textColor: colorScheme.onPrimary,
        ),
        ThemeCard(
          label: 'Toggleable\nActive',
          color: theme.toggleableActiveColor,
          textColor: ThemeData.estimateBrightnessForColor(
                      theme.toggleableActiveColor) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        ThemeCard(
          label: 'Secondary\nVariant',
          color: colorScheme.secondaryVariant,
          textColor: ThemeData.estimateBrightnessForColor(
                      colorScheme.secondaryVariant) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        ThemeCard(
          label: 'AppBar',
          color: appBarColor,
          textColor: ThemeData.estimateBrightnessForColor(appBarColor) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        ThemeCard(
          label: 'Bottom\nAppBar',
          color: theme.bottomAppBarColor,
          textColor:
              ThemeData.estimateBrightnessForColor(theme.bottomAppBarColor) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black,
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

// This is just simple SizedBox with a Card with a passed in label, background
// and text label color. Used to show the colors of a theme color property.
class ThemeCard extends StatelessWidget {
  const ThemeCard({
    Key key,
    this.label,
    this.color,
    this.textColor,
  }) : super(key: key);

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 85,
      child: Card(
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        elevation: 0,
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
