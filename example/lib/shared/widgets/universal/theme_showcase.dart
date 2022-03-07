import 'package:flutter/material.dart';

import 'navigation_rail_label_type_buttons.dart';
import 'switch_list_tile_adaptive.dart';

/// Theme showcase for the current theme.
///
/// Use this widget to review your theme's impact on [ThemeData] and see
/// how it looks with different Material widgets.
///
/// The sub widgets used in this theme show case can also be used on their
/// own, for example combined in smaller panels instead of in on big column
/// like here. Using the individual elements is done in example 5 where they
/// are put in separate cards.
///
/// These are all Flutter "Universal" Widgets that only depends on the SDK and
/// all the Widgets in this file be dropped into any application. They are
/// however not so useful, unless all you really want to do is to show what
/// Flutter Widgets look like.
class ThemeShowcase extends StatelessWidget {
  const ThemeShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ElevatedButtonShowcase(),
        const SizedBox(height: 8),
        const OutlinedButtonShowcase(),
        const SizedBox(height: 8),
        const TextButtonShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const ToggleButtonsShowcase(),
        const SizedBox(height: 8),
        const FabShowcase(),
        const SwitchShowcase(),
        const CheckboxShowcase(),
        const RadioShowcase(),
        const PopupDropdownButtonsShowcase(),
        const SizedBox(height: 8),
        const CircleAvatarAndTooltipShowcase(),
        const SizedBox(height: 8),
        const ChipShowcase(),
        const Divider(),
        const TextInputField(),
        const Divider(),
        const ListTileShowcase(),
        const Divider(),
        const TabBarForAppBarShowcase(),
        const TabBarForBackgroundShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const BottomNavigationBarShowcase(),
        const NavigationBarShowcase(),
        const NavigationRailShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const TimePickerDialogShowcase(),
        const DatePickerDialogShowcase(),
        const AlertDialogShowcase(),
        const Divider(),
        const MaterialAndBottomSheetShowcase(),
        const Divider(height: 32),
        const CardShowcase(),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Normal TextTheme',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                const TextThemeShowcase(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Primary TextTheme',
                      style: Theme.of(context).primaryTextTheme.subtitle1),
                ),
                const PrimaryTextThemeShowcase(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ElevatedButtonShowcase extends StatelessWidget {
  const ElevatedButtonShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: const Text('Elevated button'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Elevated icon'),
        ),
        const ElevatedButton(
          onPressed: null,
          child: Text('Elevated button'),
        ),
      ],
    );
  }
}

class OutlinedButtonShowcase extends StatelessWidget {
  const OutlinedButtonShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        OutlinedButton(
          onPressed: () {},
          child: const Text('Outlined button'),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Outlined icon'),
        ),
        const OutlinedButton(
          onPressed: null,
          child: Text('Outlined button'),
        ),
      ],
    );
  }
}

class TextButtonShowcase extends StatelessWidget {
  const TextButtonShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Text('Text button'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Text icon'),
        ),
        const TextButton(
          onPressed: null,
          child: Text('Text button'),
        ),
      ],
    );
  }
}

class ToggleButtonsShowcase extends StatelessWidget {
  const ToggleButtonsShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        ToggleButtons(
          isSelected: const <bool>[true, false, false],
          onPressed: (int newIndex) {},
          children: const <Widget>[
            Icon(Icons.adb),
            Icon(Icons.phone),
            Icon(Icons.account_circle),
          ],
        ),
        ToggleButtons(
          isSelected: const <bool>[true, false, false],
          onPressed: null,
          children: const <Widget>[
            Icon(Icons.adb),
            Icon(Icons.phone),
            Icon(Icons.account_circle),
          ],
        ),
      ],
    );
  }
}

class FabShowcase extends StatelessWidget {
  const FabShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {},
          mini: true,
          tooltip: 'Tooltip on mini\nFloatingActionButton',
          child: const Icon(Icons.accessibility),
        ),
        FloatingActionButton.extended(
          isExtended: false,
          onPressed: () {},
          tooltip: 'Tooltip on extended:false\nFloatingActionButton.extended',
          icon: const Icon(Icons.accessibility),
          label: const Text('Extended'),
        ),
        FloatingActionButton.extended(
          isExtended: true,
          onPressed: () {},
          tooltip: 'Tooltip on extended:true\nFloatingActionButton.extended',
          icon: const Icon(Icons.accessibility),
          label: const Text('Extended'),
        ),
        FloatingActionButton(
          onPressed: () {},
          tooltip: 'Tooltip on default\nFloatingActionButton',
          child: const Icon(Icons.accessibility),
        ),
      ],
    );
  }
}

class SwitchShowcase extends StatelessWidget {
  const SwitchShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        Switch(
          value: true,
          onChanged: (bool value) {},
        ),
        Switch(
          value: false,
          onChanged: (bool value) {},
        ),
        const Switch(
          value: true,
          onChanged: null,
        ),
        const Switch(
          value: false,
          onChanged: null,
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
      spacing: 8,
      runSpacing: 4,
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
          value: true,
          onChanged: null,
        ),
        const Checkbox(
          value: false,
          onChanged: null,
        ),
      ],
    );
  }
}

class RadioShowcase extends StatelessWidget {
  const RadioShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
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
          value: true,
          groupValue: true,
          onChanged: null,
        ),
        const Radio<bool>(
          value: false,
          groupValue: true,
          onChanged: null,
        ),
      ],
    );
  }
}

class PopupDropdownButtonsShowcase extends StatelessWidget {
  const PopupDropdownButtonsShowcase({Key? key, this.enabled = true})
      : super(key: key);
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        _PopupMenuButton(enabled: enabled),
        const _DropDownButton(),
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
          PopupMenuItem<int>(value: 5, child: Text('Option 5')),
        ],
        child: AbsorbPointer(
          child: TextButton(
            focusNode: FocusNode(
              skipTraversal: true,
              canRequestFocus: false,
            ),
            onPressed: enabled ? () {} : null,
            child: const Text('Popup menu'),
          ),
        ),
      ),
    );
  }
}

class _DropDownButton extends StatefulWidget {
  const _DropDownButton({Key? key}) : super(key: key);

  @override
  State<_DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<_DropDownButton> {
  String selectedItem = 'Dropdown button 1';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedItem,
      onChanged: (String? value) {
        setState(() {
          selectedItem = value ?? 'Dropdown button 1';
        });
      },
      items: <String>[
        'Dropdown button 1',
        'Dropdown button 2',
        'Dropdown button 3',
        'Dropdown button 4',
        'Dropdown button 5'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class _DropDownButtonFormField extends StatefulWidget {
  const _DropDownButtonFormField({Key? key}) : super(key: key);

  @override
  State<_DropDownButtonFormField> createState() =>
      _DropDownButtonFormFieldState();
}

class _DropDownButtonFormFieldState extends State<_DropDownButtonFormField> {
  String selectedItem = 'Dropdown button form field 1';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      onChanged: (String? value) {
        setState(() {
          selectedItem = value ?? 'Dropdown button form field 1';
        });
      },
      items: <String>[
        'Dropdown button form field 1',
        'Dropdown button form field 2',
        'Dropdown button form field 3',
        'Dropdown button form field 4',
        'Dropdown button form field 5'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class CircleAvatarAndTooltipShowcase extends StatelessWidget {
  const CircleAvatarAndTooltipShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            icon: const Icon(Icons.accessibility),
            tooltip: 'Tooltip on\nIconButton',
            onPressed: () {},
          ),
        ),
        const Tooltip(
          message: 'Tooltip on\nCircleAvatar',
          child: CircleAvatar(
            child: Text('AV'),
          ),
        ),
        const Tooltip(
          message: 'Current tooltip theme.\nThis a two row tooltip.',
          child: Text('Text with tooltip'),
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
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        Chip(
          label: const Text('Chip'),
          onDeleted: () {},
        ),
        const Chip(
          label: Text('Avatar Chip'),
          avatar: FlutterLogo(),
        ),
        InputChip(
          label: const Text('Input Chip'),
          onSelected: (bool value) {},
        ),
        InputChip(
          showCheckmark: true,
          selected: true,
          label: const Text('Chip check'),
          onSelected: (bool value) {},
        ),
        const InputChip(
          label: Text('Disabled Chip'),
          isEnabled: false,
        ),
        ChoiceChip(
          label: const Text('Selected Chip'),
          selected: true,
          onSelected: (bool value) {},
        ),
        ChoiceChip(
          label: const Text('Not selected Chip'),
          selected: false,
          onSelected: (bool value) {},
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
        TextField(
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
        const SizedBox(height: 8),
        const TextField(
          enabled: false,
          decoration: InputDecoration(
            labelText: 'Disabled text input',
          ),
        ),
        const SizedBox(height: 8),
        const _DropDownButtonFormField(),
      ],
    );
  }
}

class TabBarForAppBarShowcase extends StatelessWidget {
  const TabBarForAppBarShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle textStyle = theme.textTheme.caption!;

    final Color effectiveTabBackground =
        Theme.of(context).appBarTheme.backgroundColor ??
            (isDark ? colorScheme.surface : colorScheme.primary);

    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              'TabBar in an AppBar',
              style: textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              'If the TabBar will always be used in an AppBar, then use '
              'style FlexTabBarStyle forAppBar (default), '
              'it will fit contrast wise here',
              style: textStyle,
            ),
          ),
          Material(
            color: effectiveTabBackground,
            child: const SizedBox(
              height: 70,
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Chat',
                    icon: Icon(Icons.chat_bubble),
                  ),
                  Tab(
                    text: 'Tasks',
                    icon: Icon(Icons.beenhere),
                  ),
                  Tab(
                    text: 'Folder',
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
    final ThemeData theme = Theme.of(context);
    final TextStyle textStyle = theme.textTheme.caption!;
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              'TabBar on a surface',
              style: textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              'If the TabBar will always be used on background and surface '
              'colors, then use style FlexTabBarStyle forBackground, '
              'it will fit contrast wise here',
              style: textStyle,
            ),
          ),
          const SizedBox(
            height: 70,
            child: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Chat',
                  icon: Icon(Icons.chat_bubble),
                ),
                Tab(
                  text: 'Tasks',
                  icon: Icon(Icons.beenhere),
                ),
                Tab(
                  text: 'Folder',
                  icon: Icon(Icons.create_new_folder),
                ),
              ],
            ),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              'BottomNavigationBar (Material 2)',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              'Default SDK background color is theme canvasColor via Material, '
              'and theme.canvasColor is set to theme.colorScheme.background, '
              'elevation is 8. FlexColorScheme sub-theme default is '
              'colorScheme.background and elevation 0.',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
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

class NavigationBarShowcase extends StatefulWidget {
  const NavigationBarShowcase({Key? key}) : super(key: key);

  @override
  State<NavigationBarShowcase> createState() => _NavigationBarShowcaseState();
}

class _NavigationBarShowcaseState extends State<NavigationBarShowcase> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              'NavigationBar (Material 3)',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              'Default SDK background color is theme.colorScheme.surface with '
              'an onSurface overlay color with elevation 3. FlexColorScheme '
              'sub-theme default is colorScheme.background and elevation 0.',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          NavigationBar(
            selectedIndex: buttonIndex,
            onDestinationSelected: (int value) {
              setState(() {
                buttonIndex = value;
              });
            },
            destinations: const <NavigationDestination>[
              NavigationDestination(
                icon: Icon(Icons.chat_bubble),
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
          ),
        ],
      ),
    );
  }
}

class NavigationRailShowcase extends StatefulWidget {
  const NavigationRailShowcase({
    Key? key,
    this.child,
    this.height = 420,
    this.useIndicator,
    this.onChangedUseIndicator,
    this.railType,
    this.onChangedRailType,
  }) : super(key: key);

  /// A child widget that we can use to place controls on the
  /// side of the NavigationRail in the show case widget.
  final Widget? child;

  /// Height
  final double height;
  final bool? useIndicator;
  final ValueChanged<bool>? onChangedUseIndicator;
  final NavigationRailLabelType? railType;
  final ValueChanged<NavigationRailLabelType>? onChangedRailType;

  @override
  State<NavigationRailShowcase> createState() => _NavigationRailShowcaseState();
}

class _NavigationRailShowcaseState extends State<NavigationRailShowcase> {
  int buttonIndex = 0;
  bool isExtended = false;
  bool useIndicator = true;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  NavigationRailLabelType effectiveLabelType = NavigationRailLabelType.all;

  String explainLabelStyle(final NavigationRailLabelType style) {
    switch (style) {
      case NavigationRailLabelType.none:
        return 'Items have no labels';
      case NavigationRailLabelType.selected:
        return 'Only selected item has a label';
      case NavigationRailLabelType.all:
        return 'All items have labels';
    }
  }

  void afterBuild(BuildContext context) {
    if (!isExtended && effectiveLabelType != labelType) {
      setState(() {
        effectiveLabelType = labelType;
      });
    }
  }

  @override
  void didUpdateWidget(covariant NavigationRailShowcase oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.useIndicator != oldWidget.useIndicator) {
      useIndicator = widget.useIndicator ?? useIndicator;
    }
    if (widget.railType != oldWidget.railType) {
      labelType = widget.railType ?? labelType;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO(rydmike): Study the NavigationRail issue found and maybe report it.
    // The reason for this hack with a addPostFrameCallback is af follows:
    //
    // 1. If you in extended state use a `labelType` that is not none or null
    //    it throws an assertion error.
    // 2. If you in a conditional expr. assign `NavigationRailLabelType.none`
    //    in extended state and the actual `labelType` in not extended state to
    //    `labelType`, it works BUT there is no animation when it closes
    //    when you toggle to not extended state. We want the animation too!
    // 3. If you instead use `null` in the expression for the extended state,
    //    it blows up badly, even though null should be supported based on docs.
    // 4. Open/close animation works correctly when both extended and not
    //    extended states uses `NavigationRailLabelType.none`.
    // 5. The workaround:
    //    Have a `labelType` state that can be freely toggled. Also have an
    //    `effectiveLabelType` that is used as input state to `labelType`.
    //    The `effectiveLabelType` is only toggled directly when we are in
    //    not extended state.
    //    When `extended` state is toggled, we always also set
    //    `effectiveLabelType` to `NavigationRailLabelType.none`. To ensure
    //    we only so extended transition with the `NavigationRailLabelType.none`
    //    that works. Finally we add this addPostFrameCallback that we do after
    //    every build, in it, if we are in note extended state and if the
    //    `effectiveLabelType` and `labelType` are unequal, we use setState
    //    to set the `effectiveLabelType` to `labelType` so we get the set and
    //    desired `labelType` on the Rail after it hs collapsed from extended
    //    mode. What a load of crap to have to do all this to get it work as
    //    it should in the first place.
    WidgetsBinding.instance?.addPostFrameCallback((_) => afterBuild(context));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            'NavigationRail',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            'Default SDK background color is theme.colorScheme.surface. '
            'FlexColorScheme sub-theme default is colorScheme.background.',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        const Divider(height: 1),
        SizedBox(
          height: widget.height,
          child: Row(
            children: <Widget>[
              NavigationRail(
                extended: isExtended,
                useIndicator: useIndicator ? true : null,
                minExtendedWidth: 150,
                labelType: effectiveLabelType,
                selectedIndex: buttonIndex,
                onDestinationSelected: (int value) {
                  setState(() {
                    buttonIndex = value;
                  });
                },
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.chat_bubble),
                    label: Text('Chat'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.beenhere),
                    label: Text('Tasks'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.create_new_folder),
                    label: Text('Folder'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.logout),
                    label: Text('Logout'),
                  ),
                ],
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: Column(
                  children: <Widget>[
                    SwitchListTileAdaptive(
                      title: const Text('Expand and collapse'),
                      subtitle: const Text('ON to expand  OFF to collapse\n'
                          'Only used for local control of rail presentation.'),
                      value: isExtended,
                      onChanged: (bool value) {
                        setState(() {
                          isExtended = value;
                          effectiveLabelType = NavigationRailLabelType.none;
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Labels when rail is collapsed'),
                      subtitle: Text(explainLabelStyle(labelType)),
                      trailing: NavigationRailLabelTypeButtons(
                        style: labelType,
                        onChanged: (NavigationRailLabelType value) {
                          setState(() {
                            labelType = value;
                            if (!isExtended) effectiveLabelType = labelType;
                          });
                          widget.onChangedRailType?.call(value);
                        },
                      ),
                    ),
                    SwitchListTileAdaptive(
                      title: const Text('Item selection indicator'),
                      subtitle: const Text('Also ON when '
                          'useMaterial3 is true, only thing the toggle does '
                          'in Flutter 2.10. Turning this '
                          'OFF, inputs "null" to widget to show this.'),
                      value: useIndicator,
                      onChanged: (bool value) {
                        setState(() {
                          useIndicator = value;
                          widget.onChangedUseIndicator?.call(value);
                        });
                      },
                    ),
                    widget.child ?? const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
          'sending anonymous location data to us'),
      actions: <Widget>[
        TextButton(onPressed: () {}, child: const Text('CANCEL')),
        TextButton(onPressed: () {}, child: const Text('ALLOW')),
      ],
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class MaterialAndBottomSheetShowcase extends StatelessWidget {
  const MaterialAndBottomSheetShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MaterialBanner(
          padding: const EdgeInsets.all(20),
          content: const Text('Hello, I am a Material Banner'),
          leading: const Icon(Icons.agriculture_outlined),
          actions: <Widget>[
            TextButton(
              child: const Text('OPEN'),
              onPressed: () {},
            ),
            TextButton(
              child: const Text('DISMISS'),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Material type canvas',
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'Default background color is theme canvasColor, and '
          'theme canvasColor is set to theme colorScheme background. The '
          'color canvasColor is going to be deprecated in Flutter SDK',
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
          'Default background color is theme cardColor, and '
          'theme cardColor is set to theme colorScheme surface. The '
          'color cardColor is going to be deprecated in Flutter SDK',
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
        const SizedBox(height: 24),
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
            'Default background color comes from Material of type card',
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
    return TextThemeColumnShowcase(textTheme: Theme.of(context).textTheme);
  }
}

class PrimaryTextThemeShowcase extends StatelessWidget {
  const PrimaryTextThemeShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextThemeColumnShowcase(
        textTheme: Theme.of(context).primaryTextTheme);
  }
}

class TextThemeColumnShowcase extends StatelessWidget {
  const TextThemeColumnShowcase({Key? key, required this.textTheme})
      : super(key: key);
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Font: ${textTheme.subtitle2!.fontFamily}',
            style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600)),
        Text(
          'Display Large '
          '(${textTheme.displayLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displayLarge,
        ),
        Text(
          'Display Medium '
          '(${textTheme.displayMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displayMedium,
        ),
        Text(
          'Display Small '
          '(${textTheme.displaySmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displaySmall,
        ),
        const SizedBox(height: 12),
        Text(
          'Headline Large '
          '(${textTheme.headlineLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineLarge,
        ),
        Text(
          'Headline Medium '
          '(${textTheme.headlineMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineMedium,
        ),
        Text(
          'Headline Small '
          '(${textTheme.headlineSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        Text(
          'Title Large '
          '(${textTheme.titleLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleLarge,
        ),
        Text(
          'Title Medium '
          '(${textTheme.titleMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleMedium,
        ),
        Text(
          'Title Small '
          '(${textTheme.titleSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleSmall,
        ),
        const SizedBox(height: 12),
        Text(
          'Body Large '
          '(${textTheme.bodyLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodyLarge,
        ),
        Text(
          'Body Medium '
          '(${textTheme.bodyMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodyMedium,
        ),
        Text(
          'Body Small '
          '(${textTheme.bodySmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        Text(
          'Label Large '
          '(${textTheme.labelLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelLarge,
        ),
        Text(
          'Label Medium '
          '(${textTheme.labelMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelMedium,
        ),
        Text(
          'Label Small '
          '(${textTheme.labelSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelSmall,
        ),
      ],
    );
  }
}
