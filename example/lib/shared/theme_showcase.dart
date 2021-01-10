import 'package:flutter/material.dart';

// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the examples.

// Theme showcase for the current theme.
//
// Use this widget to review your theme's impact on [ThemeData] and see
// how it looks with different Material widgets.
//
// This simple material theme demo is based on similar work in package
// https://pub.dev/packages/flutter_material_showcase developed by
// Miguel Beltran, thanks and credits belong to him for the idea.
//
// This version adds more demo widgets, and removes the Calendar that exists
// in the original version.
//
// This stateful widget is is only used in the sample to provide visual feedback
// on how each selected and demonstrated FlexColorScheme based theme looks like.
class ThemeShowcase extends StatefulWidget {
  const ThemeShowcase({
    Key key,
  }) : super(key: key);

  @override
  _ThemeShowcaseState createState() => _ThemeShowcaseState();
}

class _ThemeShowcaseState extends State<ThemeShowcase> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool error1 = false;
  bool error2 = false;
  int _buttonIndex = 0;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textController1.dispose();
    textController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildButtonRow(),
          _buildIconButtonRow(),
          _buildChipRow(),
          _buildCheckboxRow(),
          _buildTextInput(),
          _buildTabRowForAppBar(),
          _buildTabRowForBackground(),
          _buildBottomNavigation(),
          _buildCard(),
          _listTiles(),
          _buildDialog(),
          _buildText(),
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: RaisedButton(
            onPressed: () {},
            child: const Text('RAISED BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('ELEVATED BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: OutlineButton(
            onPressed: () {},
            child: const Text('OUTLINE BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: OutlinedButton(
            onPressed: () {},
            child: const Text('OUTLINED BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FlatButton(
            onPressed: () {},
            child: const Text('FLAT BUTTON'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextButton(
            onPressed: () {},
            child: const Text('TEXT BUTTON'),
          ),
        ),
      ],
    );
  }

  Widget _buildIconButtonRow() {
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

  Widget _buildChipRow() {
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

  Widget _buildCheckboxRow() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Checkbox(
          value: true,
          onChanged: (bool value) {},
        ),
        Checkbox(
          value: false,
          onChanged: (bool value) {},
        ),
        const Checkbox(
          value: false,
          onChanged: null,
        ),
        Radio<bool>(
          value: true,
          groupValue: true,
          onChanged: (bool value) {},
        ),
        Radio<bool>(
          value: false,
          groupValue: true,
          onChanged: (bool value) {},
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

  Widget _buildTextInput() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  error1 = false;
                } else {
                  error1 = true;
                }
              });
            },
            key: const Key('TextField1'),
            controller: textController1,
            decoration: InputDecoration(
              hintText: 'Write something...',
              border: const OutlineInputBorder(),
              labelText: 'First text input',
              errorText: error1
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
              border: OutlineInputBorder(),
              labelText: 'Disabled text input with outline border',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  error2 = false;
                } else {
                  error2 = true;
                }
              });
            },
            key: const Key('TextField2'),
            controller: textController2,
            decoration: InputDecoration(
              hintText: 'Write something...',
              labelText: 'Second text input',
              errorText: error2
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

  Widget _buildTabRowForAppBar() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Color effectiveTabBackground = Theme.of(context).appBarTheme?.color ??
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
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
          ),
          Container(
            color: effectiveTabBackground,
            child: const TabBar(
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
        ],
      ),
    );
  }

  Widget _buildTabRowForBackground() {
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
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
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

  Widget _buildBottomNavigation() {
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
              onTap: (int value) {
                setState(() {
                  _buttonIndex = value;
                });
              },
              currentIndex: _buttonIndex,
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

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const <Widget>[
          Material(
            elevation: 1,
            child: SizedBox(
              height: 70,
              child: Center(
                child: Text('Material type canvas, elevation 1'),
              ),
            ),
          ),
          SizedBox(height: 10),
          Material(
            elevation: 1,
            type: MaterialType.card,
            child: SizedBox(
              height: 70,
              child: Center(
                child: Text('Material type card, elevation 1'),
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 4,
            child: SizedBox(
              height: 70,
              child: Center(
                child: Text('Card widget, elevation 4'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTiles() {
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

  Widget _buildDialog() {
    return AlertDialog(
      title: const Text('Allow location services (Dialog example)'),
      content: const Text('Let us help determine location. This means '
          'sending anonymous location data to us.'),
      actions: <Widget>[
        FlatButton(onPressed: () {}, child: const Text('CANCEL')),
        FlatButton(onPressed: () {}, child: const Text('ALLOW')),
      ],
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildText() {
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
