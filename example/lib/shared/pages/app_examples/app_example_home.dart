import 'package:flutter/material.dart';

/// An example that show what an app using the theme might look like
class AppExampleHome extends StatelessWidget {
  const AppExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
      ),
      drawer: const AppExampleDrawer(),
      bottomNavigationBar: const AppExampleNavigationBar(),
    );
  }
}

class AppExampleDrawer extends StatefulWidget {
  const AppExampleDrawer({
    super.key,
  });

  @override
  State<AppExampleDrawer> createState() => _AppExampleDrawerState();
}

class _AppExampleDrawerState extends State<AppExampleDrawer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (int value) {
        setState(() {
          selectedIndex = value;
        });
      },
      children: <Widget>[
        const SizedBox(height: 16),
        const NavigationDrawerDestination(
          icon: Badge(
            label: Text('26'),
            child: Icon(Icons.chat_bubble),
          ),
          label: Text('Chat'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.beenhere),
          label: Text('Tasks'),
        ),
        const Divider(),
        NavigationDrawerDestination(
          icon: const Icon(Icons.create_new_folder),
          label: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: const Text(
              'Folder, item with long text truncated with ellipses',
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.logout),
          label: Text('Logout'),
        ),
      ],
    );
  }
}

class AppExampleNavigationBar extends StatefulWidget {
  const AppExampleNavigationBar({super.key});

  @override
  State<AppExampleNavigationBar> createState() =>
      _AppExampleNavigationBarState();
}

class _AppExampleNavigationBarState extends State<AppExampleNavigationBar> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: buttonIndex,
      onDestinationSelected: (int value) {
        setState(() {
          buttonIndex = value;
        });
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Badge(
            label: Text('12'),
            child: Icon(Icons.chat_bubble),
          ),
          label: 'Chat',
        ),
        NavigationDestination(
          icon: Icon(Icons.beenhere),
          label: 'Tasks',
        ),
        NavigationDestination(
          icon: Icon(Icons.create_new_folder),
          label: 'Folder',
        ),
      ],
    );
  }
}
