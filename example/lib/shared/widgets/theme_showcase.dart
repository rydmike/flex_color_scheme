import 'package:flutter/material.dart';

/// Theme showcase for the current theme.
///
/// Use this widget to review your theme's impact on [ThemeData] and see
/// how it looks with different Material widgets.
///
/// This simple material theme demo is based on similar work in package
/// https://pub.dev/packages/flutter_material_showcase developed by
/// Miguel Beltran, thanks and credits belong to him for the idea.
///
/// This version adds more demo widgets, and removes the Calendar that exists
/// in the original version.
///
/// This stateful widget is only used in to provide visual feedback on how each
/// selected and demonstrated FlexColorScheme based theme looks like.
class ThemeShowcase extends StatefulWidget {
  const ThemeShowcase({
    Key? key,
  }) : super(key: key);

  @override
  _ThemeShowcaseState createState() => _ThemeShowcaseState();
}

class _ThemeShowcaseState extends State<ThemeShowcase> {
  int _buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const _ButtonRow(),
          const _ButtonRow(enabled: false),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Legacy Buttons (Deprecated)',
                style: Theme.of(context).textTheme.headline6),
          ),
          const _LegacyButtonRow(),
          const _LegacyButtonRow(enabled: false),
          const _IconButtonRow(),
          const _ChipRow(),
          const _CheckboxRow(),
          const _TextInput(),
          const _TabRowForAppBar(),
          const _TabRowForBackground(),
          _BottomNavigation(
            buttonIndex: _buttonIndex,
            onTap: (int value) {
              setState(() {
                _buttonIndex = value;
              });
            },
          ),
          const _ListTiles(),
          const _TimePicker(),
          const _DatePicker(),
          const _Dialog(),
          const _BottomSheet(),
          const _Cards(),
          const _TextStyles(),
        ],
      ),
    );
  }
}

class _ButtonRow extends StatelessWidget {
  const _ButtonRow({Key? key, this.enabled = true}) : super(key: key);
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

class _LegacyButtonRow extends StatelessWidget {
  const _LegacyButtonRow({Key? key, this.enabled = true}) : super(key: key);
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
    return Padding(
      padding: const EdgeInsets.all(8),
      // One way to make a TextButton styled and background colored button
      // for a PopupMenuButton, with a Card style background. Just wanted
      // something that always uses same rounding and style as buttons, but
      // with a varied branded background style from branded Card color.
      child: Card(
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
      ),
    );
  }
}

class _IconButtonRow extends StatelessWidget {
  const _IconButtonRow({Key? key}) : super(key: key);

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

class _ChipRow extends StatelessWidget {
  const _ChipRow({Key? key}) : super(key: key);

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

class _CheckboxRow extends StatelessWidget {
  const _CheckboxRow({Key? key}) : super(key: key);

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

class _TextInput extends StatefulWidget {
  const _TextInput({Key? key}) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<_TextInput> {
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

class _TabRowForAppBar extends StatelessWidget {
  const _TabRowForAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Color effectiveTabBackground =
        Theme.of(context).appBarTheme.backgroundColor ??
            (isDark ? colorScheme.surface : colorScheme.primary);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'If the TabBar will always be used in an AppBar',
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            'Then use style FlexTabBarStyle.forAppBar (default), '
            'it will work here.',
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
          ),
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

class _TabRowForBackground extends StatelessWidget {
  const _TabRowForBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'If the TabBar will always be used on background colors',
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            'Then use style FlexTabBarStyle.forBackground, it will work here.',
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
          ),
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

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({
    Key? key,
    required this.buttonIndex,
    required this.onTap,
  }) : super(key: key);
  final int buttonIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'BottomNavigationBar',
              style: Theme.of(context).textTheme.caption,
            ),
            BottomNavigationBar(
              onTap: onTap,
              currentIndex: buttonIndex,
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
      ),
    );
  }
}

class _ListTiles extends StatelessWidget {
  const _ListTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
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
      ),
    );
  }
}

class _TimePicker extends StatelessWidget {
  const _TimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: TimePickerDialog(
        initialTime: TimeOfDay.now(),
      ),
    );
  }
}

class _DatePicker extends StatelessWidget {
  const _DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2050),
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AlertDialog(
        title: const Text('Allow location services'),
        content: const Text('Let us help determine location. This means '
            'sending anonymous location data to us.'),
        actions: <Widget>[
          TextButton(onPressed: () {}, child: const Text('CANCEL')),
          TextButton(onPressed: () {}, child: const Text('ALLOW')),
        ],
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AbsorbPointer(
        child: BottomSheet(
          enableDrag: false,
          onClosing: () {},
          builder: (final BuildContext context) => SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'A BottomSheet',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  const _Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const <Widget>[
          Divider(height: 30),
          Material(
            type: MaterialType.canvas,
            elevation: 0,
            child: SizedBox(
              height: 50,
              child: Center(child: Text('Material type canvas, elevation 0')),
            ),
          ),
          SizedBox(height: 10),
          Material(
            type: MaterialType.canvas,
            elevation: 1,
            child: SizedBox(
              height: 50,
              child: Center(child: Text('Material type canvas, elevation 1')),
            ),
          ),
          SizedBox(height: 10),
          Material(
            type: MaterialType.canvas,
            elevation: 4,
            child: SizedBox(
              height: 50,
              child: Center(child: Text('Material type canvas, elevation 4')),
            ),
          ),
          Divider(height: 30),
          Material(
            elevation: 0,
            type: MaterialType.card,
            child: SizedBox(
              height: 50,
              child: Center(child: Text('Material type card, elevation 0')),
            ),
          ),
          SizedBox(height: 10),
          Material(
            elevation: 1,
            type: MaterialType.card,
            child: SizedBox(
              height: 50,
              child: Center(child: Text('Material type card, elevation 1')),
            ),
          ),
          SizedBox(height: 10),
          Material(
            elevation: 4,
            type: MaterialType.card,
            child: SizedBox(
              height: 50,
              child: Center(child: Text('Material type card, elevation 4')),
            ),
          ),
          Divider(height: 30),
          Card(
            elevation: 0,
            child: SizedBox(
              height: 50,
              child: Center(child: Text('Card widget, elevation 0')),
            ),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 1,
            child: SizedBox(
              height: 50,
              child: Center(child: Text('Card widget, elevation 1')),
            ),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 4,
            child: SizedBox(
              height: 50,
              child: Center(child: Text('Card widget, elevation 4')),
            ),
          ),
          Divider(height: 30),
        ],
      ),
    );
  }
}

class _TextStyles extends StatelessWidget {
  const _TextStyles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
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
      ),
    );
  }
}
