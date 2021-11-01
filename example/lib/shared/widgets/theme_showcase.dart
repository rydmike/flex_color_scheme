import 'package:flutter/material.dart';

/// Theme showcase for the current theme.
///
/// Use this widget to review your theme's impact on [ThemeData] and see
/// how it looks with different Material widgets.
///
/// The sub widgets used in this theme show case can also be used on their
/// own. This is done in example 5, where they are used in expanding Cards.
class ThemeShowcase extends StatelessWidget {
  const ThemeShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ButtonsShowcase(),
        const ButtonsShowcase(enabled: false),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Legacy buttons deprecated',
              style: Theme.of(context).textTheme.headline6),
        ),
        const LegacyButtonShowcase(),
        const LegacyButtonShowcase(enabled: false),
        const IconButtonShowcase(),
        const ChipShowcase(),
        const CheckboxShowcase(),
        const TextInputField(),
        const TabBarForAppBarShowcase(),
        const TabBarForBackgroundShowcase(),
        const BottomNavigationBarShowcase(),
        const ListTileShowcase(),
        const TimePickerDialogShowcase(),
        const DatePickerDialogShowcase(),
        const AlertDialogShowcase(),
        const BottomSheetAndMaterialShowcase(),
        const SizedBox(height: 16),
        const CardShowcase(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text('Normal TextTheme',
              style: Theme.of(context).textTheme.subtitle1),
        ),
        const TextThemeShowcase(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text('Primary TextTheme',
              style: Theme.of(context).textTheme.subtitle1),
        ),
        const PrimaryTextThemeShowcase(),
      ],
    );
  }
}

class ButtonsShowcase extends StatelessWidget {
  const ButtonsShowcase({Key? key, this.enabled = true}) : super(key: key);
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: enabled ? () {} : null,
            child: const Text('ELEVATED BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: OutlinedButton(
            onPressed: enabled ? () {} : null,
            child: const Text('OUTLINED BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextButton(
            onPressed: enabled ? () {} : null,
            child: const Text('TEXT BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ToggleButtons(
            isSelected: const <bool>[true, false, false],
            onPressed: enabled ? (int newIndex) {} : null,
            children: const <Widget>[
              Icon(Icons.adb),
              Icon(Icons.phone),
              Icon(Icons.account_circle),
            ],
          ),
        ),
        _PopupMenuButton(enabled: enabled),
      ],
    );
  }
}

class LegacyButtonShowcase extends StatelessWidget {
  const LegacyButtonShowcase({Key? key, this.enabled = true}) : super(key: key);
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: RaisedButton(
            onPressed: enabled ? () {} : null,
            child: const Text('RAISED BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: OutlineButton(
            onPressed: enabled ? () {} : null,
            child: const Text('OUTLINE BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FlatButton(
            onPressed: enabled ? () {} : null,
            child: const Text('FLAT BUTTON'),
          ),
        ),
      ],
    );
  }
}

class _PopupMenuButton extends StatelessWidget {
  const _PopupMenuButton({Key? key, this.enabled = true}) : super(key: key);
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: PopupMenuButton<int>(
        onSelected: (_) {},
        enabled: enabled,
        tooltip: enabled ? 'Show menu' : 'Menu disabled',
        itemBuilder: (BuildContext context) => const <PopupMenuItem<int>>[
          PopupMenuItem<int>(value: 1, child: Text('Option 1')),
          PopupMenuItem<int>(value: 2, child: Text('Option 2')),
          PopupMenuItem<int>(value: 3, child: Text('Option 3')),
          PopupMenuItem<int>(value: 4, child: Text('Option 4')),
        ],
        child: AbsorbPointer(
          child: TextButton(
            focusNode: FocusNode(
              skipTraversal: true,
              canRequestFocus: false,
            ),
            onPressed: enabled ? () {} : null,
            child: const Text('POPUP MENU'),
          ),
        ),
      ),
    );
  }
}

class IconButtonShowcase extends StatelessWidget {
  const IconButtonShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.accessibility),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            icon: const Icon(Icons.accessibility),
            onPressed: () {},
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            child: Text('AV'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Tooltip(
              message: 'Current tooltip theme.\nThis a two row tooltip.',
              child: Text('Text with tooltip')),
        ),
      ],
    );
  }
}

class ChipShowcase extends StatelessWidget {
  const ChipShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8),
          child: Chip(
            label: Text('Chip'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Chip(
            label: Text('Avatar Chip'),
            avatar: FlutterLogo(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: InputChip(
            label: const Text('Input Chip'),
            onSelected: (bool value) {},
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: InputChip(
            label: Text('Disabled Input Chip'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ChoiceChip(
            label: const Text('Selected Chip'),
            selected: true,
            onSelected: (bool value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ChoiceChip(
            label: const Text('Not Selected Chip'),
            selected: false,
            onSelected: (bool value) {},
          ),
        ),
      ],
    );
  }
}

class CheckboxShowcase extends StatelessWidget {
  const CheckboxShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Checkbox(
          value: true,
          onChanged: (bool? value) {},
        ),
        Checkbox(
          value: false,
          onChanged: (bool? value) {},
        ),
        const Checkbox(
          value: false,
          onChanged: null,
        ),
        Radio<bool>(
          value: true,
          groupValue: true,
          onChanged: (bool? value) {},
        ),
        Radio<bool>(
          value: false,
          groupValue: true,
          onChanged: (bool? value) {},
        ),
        const Radio<bool>(
          value: false,
          groupValue: true,
          onChanged: null,
        ),
        Switch(
          value: true,
          onChanged: (bool value) {},
        ),
        Switch(
          value: false,
          onChanged: (bool value) {},
        ),
        const Switch(
          value: false,
          onChanged: null,
        ),
      ],
    );
  }
}

class TextInputField extends StatefulWidget {
  const TextInputField({Key? key}) : super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late TextEditingController _textController;
  bool _errorState = false;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  _errorState = false;
                } else {
                  _errorState = true;
                }
              });
            },
            key: const Key('TextField1'),
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Write something...',
              labelText: 'Text entry',
              errorText: _errorState
                  ? "Any entry without an 'a' will trigger this error"
                  : null,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Disabled text input',
            ),
          ),
        ),
      ],
    );
  }
}

class TabBarForAppBarShowcase extends StatelessWidget {
  const TabBarForAppBarShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Color effectiveTabBackground =
        Theme.of(context).appBarTheme.backgroundColor ??
            (isDark ? colorScheme.surface : colorScheme.primary);

    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'TabBar in an AppBar',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'If the TabBar will always be used in an AppBar, then use '
            'style FlexTabBarStyle.forAppBar (default), '
            'it will fit contrast wise here.',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 8),
          Container(
            color: effectiveTabBackground,
            child: const Material(
              type: MaterialType.transparency,
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'CHAT',
                    icon: Icon(Icons.chat_bubble),
                  ),
                  Tab(
                    text: 'TASKS',
                    icon: Icon(Icons.beenhere),
                  ),
                  Tab(
                    text: 'FOLDER',
                    icon: Icon(Icons.create_new_folder),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarForBackgroundShowcase extends StatelessWidget {
  const TabBarForBackgroundShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16),
          Text(
            'TabBar on a surface',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'If the TabBar will always be used on background and surface '
            'colors, then use style FlexTabBarStyle.forBackground, '
            'it will fit contrast wise here.',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 8),
          const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'CHAT',
                icon: Icon(Icons.chat_bubble),
              ),
              Tab(
                text: 'TASKS',
                icon: Icon(Icons.beenhere),
              ),
              Tab(
                text: 'FOLDER',
                icon: Icon(Icons.create_new_folder),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarShowcase extends StatefulWidget {
  const BottomNavigationBarShowcase({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarShowcase> createState() =>
      _BottomNavigationBarShowcaseState();
}

class _BottomNavigationBarShowcaseState
    extends State<BottomNavigationBarShowcase> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16),
          Text(
            'BottomNavigationBar',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'Default background color is theme.canvasColor via Material, and '
            'theme.canvasColor is set to theme.colorScheme.background.',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 8),
          BottomNavigationBar(
            currentIndex: buttonIndex,
            onTap: (int value) {
              setState(() {
                buttonIndex = value;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble),
                label: 'Chat',
                // title: Text('Item 1'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.beenhere),
                label: 'Tasks',
                // title: Text('Item 2'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.create_new_folder),
                label: 'Folder',
                // title: Text('Item 3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListTileShowcase extends StatelessWidget {
  const ListTileShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('List tile title'),
          subtitle: const Text('List tile sub title'),
          trailing: const Text('Trailing'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Selected list tile title'),
          subtitle: const Text('Selected list tile sub title'),
          trailing: const Text('Trailing'),
          selected: true,
          onTap: () {},
        ),
        SwitchListTile(
          title: const Text('Switch list tile'),
          subtitle: const Text('The switch list tile is ON'),
          value: true,
          onChanged: (bool value) {},
        ),
      ],
    );
  }
}

class TimePickerDialogShowcase extends StatelessWidget {
  const TimePickerDialogShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The TimePickerDialog pops the context with its buttons, clicking them
    // pops the page when not used in a showDialog. We just need to see it, no
    // need to use it to visually see what it looks like, so absorbing pointers.
    return AbsorbPointer(
      child: TimePickerDialog(
        initialTime: TimeOfDay.now(),
      ),
    );
  }
}

class DatePickerDialogShowcase extends StatelessWidget {
  const DatePickerDialogShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The DatePickerDialog pops the context with its buttons, clicking them
    // pops the page when not used in a showDialog. We just need to see it, no
    // need to use it to visually see what it looks like, so absorbing pointers.
    return AbsorbPointer(
      child: DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2050),
      ),
    );
  }
}

class AlertDialogShowcase extends StatelessWidget {
  const AlertDialogShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Allow location services'),
      content: const Text('Let us help determine location. This means '
          'sending anonymous location data to us.'),
      actions: <Widget>[
        TextButton(onPressed: () {}, child: const Text('CANCEL')),
        TextButton(onPressed: () {}, child: const Text('ALLOW')),
      ],
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class BottomSheetAndMaterialShowcase extends StatelessWidget {
  const BottomSheetAndMaterialShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Material type canvas',
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'Default background color is theme.canvasColor, and '
          'theme.canvasColor is set to theme.colorScheme.background. The '
          'color canvasColor is going to be deprecated in Flutter SDK.',
          style: Theme.of(context).textTheme.caption,
        ),
        const Material(
          type: MaterialType.canvas,
          elevation: 0,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Material type canvas, elevation 0')),
          ),
        ),
        const SizedBox(height: 10),
        const Material(
          type: MaterialType.canvas,
          elevation: 1,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Material type canvas, elevation 1')),
          ),
        ),
        const SizedBox(height: 10),
        const Material(
          type: MaterialType.canvas,
          elevation: 4,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Material type canvas, elevation 4')),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Material type card',
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'Default background color is theme.cardColor, and '
          'theme.cardColor is set to theme.colorScheme.surface. The '
          'color cardColor is going to be deprecated in Flutter SDK.',
          style: Theme.of(context).textTheme.caption,
        ),
        const Material(
          elevation: 0,
          type: MaterialType.card,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Material type card, elevation 0')),
          ),
        ),
        const SizedBox(height: 10),
        const Material(
          elevation: 1,
          type: MaterialType.card,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Material type card, elevation 1')),
          ),
        ),
        const SizedBox(height: 10),
        const Material(
          elevation: 4,
          type: MaterialType.card,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Material type card, elevation 4')),
          ),
        ),
        const SizedBox(height: 32),
        AbsorbPointer(
          child: BottomSheet(
            enableDrag: false,
            onClosing: () {},
            builder: (final BuildContext context) => SizedBox(
              height: 100,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'A Material BottomSheet',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        'Like Drawer it uses Material of type canvas as '
                        'background.',
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardShowcase extends StatelessWidget {
  const CardShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Card',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Default background color comes from Material of type card. ',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        const Card(
          elevation: 0,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Card, elevation 0')),
          ),
        ),
        const SizedBox(height: 10),
        const Card(
          elevation: 1,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Card, elevation 1')),
          ),
        ),
        const SizedBox(height: 10),
        const Card(
          elevation: 4,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Card, elevation 4')),
          ),
        ),
        const SizedBox(height: 10),
        const Card(
          elevation: 8,
          child: SizedBox(
            height: 50,
            child: Center(child: Text('Card, elevation 8')),
          ),
        ),
      ],
    );
  }
}

class TextThemeShowcase extends StatelessWidget {
  const TextThemeShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Headline 1 '
          '(${text.headline1!.fontSize!.toStringAsFixed(0)})',
          style: text.headline1,
        ),
        Text(
          'Headline 2 '
          '(${text.headline2!.fontSize!.toStringAsFixed(0)})',
          style: text.headline2,
        ),
        Text(
          'Headline 3 '
          '(${text.headline3!.fontSize!.toStringAsFixed(0)})',
          style: text.headline3,
        ),
        Text(
          'Headline 4 '
          '(${text.headline4!.fontSize!.toStringAsFixed(0)})',
          style: text.headline4,
        ),
        Text(
          'Headline 5 '
          '(${text.headline5!.fontSize!.toStringAsFixed(0)})',
          style: text.headline5,
        ),
        Text(
          'Headline 6 '
          '(${text.headline6!.fontSize!.toStringAsFixed(0)})',
          style: text.headline6,
        ),
        Text(
          'Subtitle 1 '
          '(${text.subtitle1!.fontSize!.toStringAsFixed(0)})',
          style: text.subtitle1,
        ),
        Text(
          'Subtitle 2 '
          '(${text.subtitle2!.fontSize!.toStringAsFixed(0)})',
          style: text.subtitle2,
        ),
        Text(
          'Body Text 1 '
          '(${text.bodyText1!.fontSize!.toStringAsFixed(0)})',
          style: text.bodyText1,
        ),
        Text(
          'Body Text 2 '
          '(${text.bodyText2!.fontSize!.toStringAsFixed(0)})',
          style: text.bodyText2,
        ),
        Text(
          'Button '
          '(${text.button!.fontSize!.toStringAsFixed(0)})',
          style: text.button,
        ),
        Text(
          'Caption '
          '(${text.caption!.fontSize!.toStringAsFixed(0)})',
          style: text.caption,
        ),
        Text(
          'Overline '
          '(${text.overline!.fontSize!.toStringAsFixed(0)})',
          style: text.overline,
        ),
      ],
    );
  }
}

class PrimaryTextThemeShowcase extends StatelessWidget {
  const PrimaryTextThemeShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).primaryTextTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Headline 1 '
          '(${text.headline1!.fontSize!.toStringAsFixed(0)})',
          style: text.headline1,
        ),
        Text(
          'Headline 2 '
          '(${text.headline2!.fontSize!.toStringAsFixed(0)})',
          style: text.headline2,
        ),
        Text(
          'Headline 3 '
          '(${text.headline3!.fontSize!.toStringAsFixed(0)})',
          style: text.headline3,
        ),
        Text(
          'Headline 4 '
          '(${text.headline4!.fontSize!.toStringAsFixed(0)})',
          style: text.headline4,
        ),
        Text(
          'Headline 5 '
          '(${text.headline5!.fontSize!.toStringAsFixed(0)})',
          style: text.headline5,
        ),
        Text(
          'Headline 6 '
          '(${text.headline6!.fontSize!.toStringAsFixed(0)})',
          style: text.headline6,
        ),
        Text(
          'Subtitle 1 '
          '(${text.subtitle1!.fontSize!.toStringAsFixed(0)})',
          style: text.subtitle1,
        ),
        Text(
          'Subtitle 2 '
          '(${text.subtitle2!.fontSize!.toStringAsFixed(0)})',
          style: text.subtitle2,
        ),
        Text(
          'Body Text 1 '
          '(${text.bodyText1!.fontSize!.toStringAsFixed(0)})',
          style: text.bodyText1,
        ),
        Text(
          'Body Text 2 '
          '(${text.bodyText2!.fontSize!.toStringAsFixed(0)})',
          style: text.bodyText2,
        ),
        Text(
          'Button '
          '(${text.button!.fontSize!.toStringAsFixed(0)})',
          style: text.button,
        ),
        Text(
          'Caption '
          '(${text.caption!.fontSize!.toStringAsFixed(0)})',
          style: text.caption,
        ),
        Text(
          'Overline '
          '(${text.overline!.fontSize!.toStringAsFixed(0)})',
          style: text.overline,
        ),
      ],
    );
  }
}
