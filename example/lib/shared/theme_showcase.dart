import 'package:flutter/cupertino.dart';
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
            child: const Text('OUTLINED BUTTON'),
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
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: PopupMenuButton<int>(
          onSelected: (_) {},
          enabled: enabled,
          itemBuilder: (BuildContext context) => const <PopupMenuItem<int>>[
            PopupMenuItem<int>(value: 1, child: Text('Option 1')),
            PopupMenuItem<int>(value: 2, child: Text('Option 2')),
            PopupMenuItem<int>(value: 3, child: Text('Option 3')),
            PopupMenuItem<int>(value: 4, child: Text('Option 4')),
          ],
          child: AbsorbPointer(
            child: TextButton(
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
            'TabBar is used in AppBar (default)',
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            'Use style FlexTabBarStyle.forAppBar',
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
          ),
          Container(
            color: effectiveTabBackground,
            child: const Material(
              type: MaterialType.transparency,
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Tab 1',
                    icon: Icon(Icons.chat_bubble),
                  ),
                  Tab(
                    text: 'Tab 2',
                    icon: Icon(Icons.beenhere),
                  ),
                  Tab(
                    text: 'Tab 3',
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
            'TabBar always used on background color',
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            'Use style FlexTabBarStyle.forBackground',
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
          ),
          const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Tab 1',
                icon: Icon(Icons.chat_bubble),
              ),
              Tab(
                text: 'Tab 2',
                icon: Icon(Icons.beenhere),
              ),
              Tab(
                text: 'Tab 3',
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
                  label: 'Item 1',
                  // title: Text('Item 1'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.beenhere),
                  label: 'Item 2',
                  // title: Text('Item 2'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.create_new_folder),
                  label: 'Item 3',
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
      child: BottomSheet(
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Headline 1',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'Headline 2',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            'Headline 3',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            'Headline 4',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'Headline 5',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            'Headline 6',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Subtitle 1',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            'Subtitle 2',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Body Text 1',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Body Text 2',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            'Button',
            style: Theme.of(context).textTheme.button,
          ),
          Text(
            'Caption',
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            'Overline',
            style: Theme.of(context).textTheme.overline,
          ),
        ],
      ),
    );
  }
}
