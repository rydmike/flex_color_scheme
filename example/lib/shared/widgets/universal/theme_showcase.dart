import 'package:flutter/material.dart';

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
  const ThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const TextInputField(),
        const Divider(),
        const ElevatedButtonShowcase(),
        const SizedBox(height: 8),
        const OutlinedButtonShowcase(),
        const SizedBox(height: 8),
        const TextButtonShowcase(),
        const SizedBox(height: 8),
        const ToggleButtonsShowcase(),
        const Divider(),
        const FabShowcase(),
        const SizedBox(height: 16),
        const ChipShowcase(),
        const Divider(),
        const SizedBox(height: 8),
        const PopupMenuButtonShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        const TooltipShowcase(),
        const SizedBox(height: 16),
        const IconButtonCircleAvatarDropdownShowcase(),
        const Divider(),
        const SwitchShowcase(),
        const CheckboxShowcase(),
        const RadioShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const SliderShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const ListTileShowcase(),
        const Divider(),
        const AppBarShowcase(),
        const Divider(),
        const TabBarForAppBarShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const TabBarForBackgroundShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const BottomNavigationBarShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const NavigationBarShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const NavigationRailShowcase(),
        const SizedBox(height: 8),
        const Divider(),
        const AlertDialogShowcase(),
        const TimePickerDialogShowcase(),
        const DatePickerDialogShowcase(),
        const BottomSheetShowcase(),
        const SizedBox(height: 32),
        const MaterialBannerSnackBarShowcase(),
        const Divider(height: 32),
        const MaterialShowcase(),
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
                      style: theme.textTheme.titleMedium),
                ),
                const TextThemeShowcase(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          color: theme.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Primary TextTheme',
                      style: theme.primaryTextTheme.titleMedium),
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
  const ElevatedButtonShowcase({super.key});

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

// These are commented until https://github.com/flutter/flutter/pull/107382
// lands in master 3.1.0 channel. and makes their way to stable channel.
// TODO(rydmike): Add these buttons to showcase
// TODO(rydmike): FCS fix FCS M3 defaults.
//
// class FilledButtonShowcase extends StatelessWidget {
//   const FilledButtonShowcase({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       crossAxisAlignment: WrapCrossAlignment.center,
//       spacing: 8,
//       runSpacing: 8,
//       children: <Widget>[
//         FilledButton(
//           onPressed: () {},
//           child: const Text('FilledButton button'),
//         ),
//         FilledButton.icon(
//           onPressed: () {},
//           icon: const Icon(Icons.add),
//           label: const Text('FilledButton icon'),
//         ),
//         const FilledButton(
//           onPressed: null,
//           child: Text('FilledButton button'),
//         ),
//       ],
//     );
//   }
// }
//
//
// class FilledButtonTonalShowcase extends StatelessWidget {
//   const FilledButtonTonalShowcase({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       crossAxisAlignment: WrapCrossAlignment.center,
//       spacing: 8,
//       runSpacing: 8,
//       children: <Widget>[
//         FilledButton.tonal(
//           onPressed: () {},
//           child: const Text('FilledButton.tonal'),
//         ),
//         FilledButton.tonal.icon(
//           onPressed: () {},
//           icon: const Icon(Icons.add),
//           label: const Text('FilledButton.tonal icon'),
//         ),
//         const FilledButton.tonal(
//           onPressed: null,
//           child: Text('FilledButton.tonal button'),
//         ),
//       ],
//     );
//   }
// }

class OutlinedButtonShowcase extends StatelessWidget {
  const OutlinedButtonShowcase({super.key});

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
  const TextButtonShowcase({super.key});

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

class ToggleButtonsShowcase extends StatefulWidget {
  const ToggleButtonsShowcase({this.showOutlinedButton, super.key});
  final bool? showOutlinedButton;

  @override
  State<ToggleButtonsShowcase> createState() => _ToggleButtonsShowcaseState();
}

class _ToggleButtonsShowcaseState extends State<ToggleButtonsShowcase> {
  List<bool> selected = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        ToggleButtons(
          isSelected: selected,
          onPressed: (int toggledIndex) {
            setState(() {
              selected[toggledIndex] = !selected[toggledIndex];
            });
          },
          children: const <Widget>[
            Icon(Icons.adb),
            Icon(Icons.phone),
            Icon(Icons.account_circle),
          ],
        ),
        if (widget.showOutlinedButton ?? false)
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outlined'),
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
        if (widget.showOutlinedButton ?? false)
          const OutlinedButton(
            onPressed: null,
            child: Text('Outlined'),
          ),
      ],
    );
  }
}

class FabShowcase extends StatelessWidget {
  const FabShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        FloatingActionButton.small(
          heroTag: 'FAB small',
          onPressed: () {},
          tooltip: 'Tooltip on small\nFloatingActionButton',
          child: const Icon(Icons.accessibility),
        ),
        FloatingActionButton.extended(
          heroTag: 'FAB extended false',
          isExtended: false,
          onPressed: () {},
          tooltip: 'Tooltip on extended:false\nFloatingActionButton.extended',
          icon: const Icon(Icons.accessibility),
          label: const Text('Extended'),
        ),
        FloatingActionButton.extended(
          heroTag: 'FAB extended true',
          isExtended: true,
          onPressed: () {},
          tooltip: 'Tooltip on extended:true\nFloatingActionButton.extended',
          icon: const Icon(Icons.accessibility),
          label: const Text('Extended'),
        ),
        FloatingActionButton(
          heroTag: 'FAB standard',
          onPressed: () {},
          tooltip: 'Tooltip on default\nFloatingActionButton',
          child: const Icon(Icons.accessibility),
        ),
        FloatingActionButton.large(
          heroTag: 'FAB large',
          onPressed: () {},
          tooltip: 'Tooltip on large\nFloatingActionButton',
          child: const Icon(Icons.accessibility),
        ),
      ],
    );
  }
}

class SwitchShowcase extends StatefulWidget {
  const SwitchShowcase({super.key});

  @override
  State<SwitchShowcase> createState() => _SwitchShowcaseState();
}

class _SwitchShowcaseState extends State<SwitchShowcase> {
  bool isOn1 = true;
  bool isOn2 = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        Switch(
          value: isOn1,
          onChanged: (bool value) {
            setState(() {
              isOn1 = value;
            });
          },
        ),
        // TODO(rydmike): New M3 Switch features, only master. Add later.
        // Switch(
        //   thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
        //       (Set<MaterialState> states) {
        //     if (states.contains(MaterialState.selected)) {
        //       return const Icon(Icons.check);
        //     }
        //     return const Icon(Icons
        //         .close); // All other states will use the default thumbIcon.
        //   }),
        //   value: isOn,
        //   onChanged: (bool value) {
        //     setState(() {
        //       isOn = value;
        //     });
        //   },
        // ),
        Switch(
          value: isOn2,
          onChanged: (bool value) {
            setState(() {
              isOn2 = value;
            });
          },
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

class CheckboxShowcase extends StatefulWidget {
  const CheckboxShowcase({super.key});

  @override
  State<CheckboxShowcase> createState() => _CheckboxShowcaseState();
}

class _CheckboxShowcaseState extends State<CheckboxShowcase> {
  bool? isSelected1 = true;
  bool? isSelected2;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        Checkbox(
          value: isSelected1,
          onChanged: (bool? value) {
            setState(() {
              isSelected1 = value;
            });
          },
        ),
        Checkbox(
          tristate: true,
          value: isSelected2,
          onChanged: (bool? value) {
            setState(() {
              isSelected2 = value;
            });
          },
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
          value: null,
          tristate: true,
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

class RadioShowcase extends StatefulWidget {
  const RadioShowcase({super.key});

  @override
  State<RadioShowcase> createState() => _RadioShowcaseState();
}

class _RadioShowcaseState extends State<RadioShowcase> {
  bool? groupValue = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        Radio<bool>(
          value: true,
          groupValue: groupValue,
          onChanged: (bool? value) {
            setState(() {
              groupValue = value;
            });
          },
        ),
        Radio<bool>(
          value: false,
          groupValue: groupValue,
          onChanged: (bool? value) {
            setState(() {
              groupValue = value;
            });
          },
        ),
        Radio<bool>(
          value: true,
          groupValue: groupValue,
          onChanged: null,
        ),
        Radio<bool>(
          value: false,
          groupValue: groupValue,
          onChanged: null,
        ),
      ],
    );
  }
}

class SliderShowcase extends StatefulWidget {
  const SliderShowcase({super.key});

  @override
  State<SliderShowcase> createState() => _SliderShowcaseState();
}

class _SliderShowcaseState extends State<SliderShowcase> {
  double value1 = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          dense: true,
          title: Text('Slider stepped (${value1.toStringAsFixed(0)})'),
          subtitle: Slider(
            max: 30,
            divisions: 31,
            label: value1.toStringAsFixed(0),
            value: value1,
            onChanged: (double newValue) {
              setState(() {
                value1 = newValue.roundToDouble();
              });
            },
          ),
        ),
        ListTile(
          dense: true,
          title: Text('Slider continuous (${value1.toStringAsFixed(2)})'),
          subtitle: Slider(
            max: 30,
            label: value1.toStringAsFixed(2),
            value: value1,
            onChanged: (double newValue) {
              setState(() {
                value1 = newValue;
              });
            },
          ),
        ),
        ListTile(
          dense: true,
          title: Text('Slider stepped disabled (${22.toStringAsFixed(0)})'),
          subtitle: Slider(
            max: 30,
            divisions: 31,
            label: 22.toStringAsFixed(0),
            value: 22,
            onChanged: null,
          ),
        ),
        ListTile(
          dense: true,
          title: Text('Slider continuous disabled (${14.toStringAsFixed(2)})'),
          subtitle: Slider(
            max: 30,
            label: 14.toStringAsFixed(2),
            value: 14,
            onChanged: null,
          ),
        ),
      ],
    );
  }
}

class PopupMenuButtonShowcase extends StatelessWidget {
  const PopupMenuButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    return PopupMenuButton<int>(
      onSelected: (_) {},
      tooltip: 'Show menu',
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) => const <PopupMenuItem<int>>[
        PopupMenuItem<int>(value: 1, child: Text('Option 1')),
        PopupMenuItem<int>(value: 2, child: Text('Option 2')),
        PopupMenuItem<int>(value: 3, child: Text('Option 3')),
        PopupMenuItem<int>(value: 4, child: Text('Option 4')),
        PopupMenuItem<int>(value: 5, child: Text('Option 5')),
      ],
      child: AbsorbPointer(
        child: TextButton.icon(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: scheme.primary,
            foregroundColor: scheme.onPrimary,
            disabledForegroundColor: scheme.onSurface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.expand_more_outlined),
          label: const Text('Show menu'),
        ),
      ),
    );
  }
}

class _DropDownButton extends StatefulWidget {
  const _DropDownButton();

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}

class _DropDownButtonFormField extends StatefulWidget {
  const _DropDownButtonFormField();

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

class TooltipShowcase extends StatelessWidget {
  const TooltipShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 4,
      children: const <Widget>[
        Tooltip(
          message: 'Current tooltip theme',
          child: Text('Text with tooltip'),
        ),
        Tooltip(
          message: 'Current tooltip theme.\nThis a two row tooltip.',
          child: Text('Text with two row tooltip'),
        ),
        Tooltip(
          message: 'Current tooltip theme.\nThis tooltip is too long.\n'
              'Try to keep them short.',
          child: Text('Text with three row tooltip'),
        ),
      ],
    );
  }
}

class IconButtonCircleAvatarDropdownShowcase extends StatefulWidget {
  const IconButtonCircleAvatarDropdownShowcase({super.key});

  @override
  State<IconButtonCircleAvatarDropdownShowcase> createState() =>
      _IconButtonCircleAvatarDropdownShowcaseState();
}

class _IconButtonCircleAvatarDropdownShowcaseState
    extends State<IconButtonCircleAvatarDropdownShowcase> {
  bool isLockOpen = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            icon: const Icon(Icons.lock_outlined),
            selectedIcon: const Icon(Icons.lock_open_outlined),
            tooltip: isLockOpen ? 'In M3 tap to close' : 'In M3 tap to open',
            isSelected: isLockOpen,
            onPressed: () {
              setState(() {
                isLockOpen = !isLockOpen;
              });
            },
          ),
        ),
        const Tooltip(
          message: 'Tooltip on\nCircleAvatar',
          child: CircleAvatar(
            child: Text('AV'),
          ),
        ),
        const _DropDownButton(),
      ],
    );
  }
}

class ChipShowcase extends StatelessWidget {
  const ChipShowcase({super.key});

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
          label: Text('Chip'),
          avatar: FlutterLogo(),
        ),
        ActionChip(
          label: const Text('ActionChip'),
          avatar: const Icon(Icons.settings),
          onPressed: () {},
        ),
        const ActionChip(
          label: Text('ActionChip'),
          avatar: Icon(Icons.settings),
          onPressed: null,
        ),
        FilterChip(
          label: const Text('FilterChip'),
          selected: true,
          onSelected: (bool value) {},
        ),
        const FilterChip(
          label: Text('FilterChip'),
          selected: true,
          onSelected: null,
        ),
        FilterChip(
          label: const Text('FilterChip'),
          selected: false,
          onSelected: (bool value) {},
        ),
        const FilterChip(
          label: Text('FilterChip'),
          selected: false,
          onSelected: null,
        ),
        ChoiceChip(
          label: const Text('ChoiceChip'),
          selected: true,
          onSelected: (bool value) {},
        ),
        const ChoiceChip(
          label: Text('ChoiceChip'),
          selected: true,
        ),
        ChoiceChip(
          label: const Text('ChoiceChip'),
          selected: false,
          onSelected: (bool value) {},
        ),
        const ChoiceChip(
          label: Text('ChoiceChip'),
          selected: false,
          onSelected: null,
        ),
        InputChip(
          selected: true,
          label: const Text('InputChip'),
          onSelected: (bool value) {},
          onDeleted: () {},
        ),
        InputChip(
          selected: true,
          label: const Text('InputChip'),
          isEnabled: false,
          onSelected: (bool value) {},
          onDeleted: () {},
        ),
        InputChip(
          label: const Text('InputChip'),
          onSelected: (bool value) {},
          onDeleted: () {},
        ),
        InputChip(
          label: const Text('InputChip'),
          isEnabled: false,
          onSelected: (bool value) {},
          onDeleted: () {},
          // onDeleted: () {},
        ),
      ],
    );
  }
}

class TextInputField extends StatefulWidget {
  const TextInputField({this.filled, super.key});
  final bool? filled;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  bool _errorState1 = false;
  bool _errorState2 = false;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
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
                _errorState1 = false;
              } else {
                _errorState1 = true;
              }
            });
          },
          key: const Key('TextField1'),
          controller: _textController1,
          decoration: InputDecoration(
            filled: widget.filled ?? true,
            hintText: 'Write something...',
            labelText: 'TextField - Underline border, if not defined',
            errorText: _errorState1
                ? "Any entry without an 'a' will trigger this error"
                : null,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (String text) {
            setState(() {
              if (text.contains('a') | text.isEmpty) {
                _errorState2 = false;
              } else {
                _errorState2 = true;
              }
            });
          },
          key: const Key('TextField2'),
          controller: _textController2,
          decoration: InputDecoration(
            filled: widget.filled ?? true,
            border: const OutlineInputBorder(),
            hintText: 'Write something...',
            labelText: 'TextField - Outline border, if not defined',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.info),
            errorText: _errorState2
                ? "Any entry without an 'a' will trigger this error"
                : null,
          ),
        ),
        const SizedBox(height: 8),
        const TextField(
          enabled: false,
          decoration: InputDecoration(
            labelText: 'TextField - Disabled',
          ),
        ),
        const SizedBox(height: 8),
        const _DropDownButtonFormField(),
      ],
    );
  }
}

class AppBarShowcase extends StatelessWidget {
  const AppBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeTop: true,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              const _BehindAppBar(),
              AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
                title: const Text('Standard AppBar'),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          // A bit nasty usage of CustomScrollViews and Slivers and shrinkWraps,
          // to show what the SliverAppBars look like, don't do this in a
          // production app. With just a few widgets, we can get away with it.
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              const _BehindAppBar(),
              CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverAppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    title: const Text('SliverAppBar'),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              const _BehindAppBar(),
              CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverAppBar.medium(
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    title: const Text('SliverAppBar.medium'),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              const _BehindAppBar(),
              CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverAppBar.large(
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    title: const Text('SliverAppBar.large'),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BehindAppBar extends StatelessWidget {
  const _BehindAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(spacing: 8, runSpacing: 8, children: <Widget>[
        const Text('Behind AppBar'),
        const CircleAvatar(child: Text('AV')),
        InputChip(
          showCheckmark: true,
          selected: true,
          label: const Text('Chip check'),
          onSelected: (bool value) {},
        ),
      ]),
    );
  }
}

class TabBarForAppBarShowcase extends StatelessWidget {
  const TabBarForAppBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final ColorScheme colorScheme = theme.colorScheme;

    final Color effectiveTabBackground = theme.appBarTheme.backgroundColor ??
        (isDark ? colorScheme.surface : colorScheme.primary);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              'TabBar in an AppBar',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              'If the TabBar will always be used in an AppBar, then use '
              'style FlexTabBarStyle forAppBar (default), '
              'it will fit contrast wise here',
              style: denseBody,
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarForBackgroundShowcase extends StatelessWidget {
  const TabBarForBackgroundShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              'TabBar on a surface',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              'If the TabBar will always be used on background and surface '
              'colors, then use style FlexTabBarStyle forBackground, '
              'it will fit contrast wise here',
              style: denseBody,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarShowcase extends StatefulWidget {
  const BottomNavigationBarShowcase({super.key});

  @override
  State<BottomNavigationBarShowcase> createState() =>
      _BottomNavigationBarShowcaseState();
}

class _BottomNavigationBarShowcaseState
    extends State<BottomNavigationBarShowcase> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          removeTop: true,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(spacing: 8, runSpacing: 8, children: <Widget>[
                  const Text('Behind Bottom'),
                  FloatingActionButton.small(
                    heroTag: 'Behind Bottom',
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                  InputChip(
                    showCheckmark: true,
                    selected: true,
                    label: const Text('Chip check'),
                    onSelected: (bool value) {},
                  ),
                ]),
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
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Text(
            'BottomNavigationBar (Material 2)',
            style: denseHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            'Default SDK background color is theme canvasColor via Material, '
            'and canvasColor is set to color scheme background, elevation '
            'is 8. FCS sub-theme default is color scheme background and '
            'elevation 0.',
            style: denseBody,
          ),
        ),
      ],
    );
  }
}

class NavigationBarShowcase extends StatefulWidget {
  const NavigationBarShowcase({super.key});

  @override
  State<NavigationBarShowcase> createState() => _NavigationBarShowcaseState();
}

class _NavigationBarShowcaseState extends State<NavigationBarShowcase> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          removeTop: true,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(spacing: 8, runSpacing: 8, children: <Widget>[
                  const Text('Behind NavBar'),
                  FloatingActionButton.small(
                    heroTag: 'Behind NavBar',
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                  InputChip(
                    showCheckmark: true,
                    selected: true,
                    label: const Text('Chip check'),
                    onSelected: (bool value) {},
                  ),
                ]),
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
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Text(
            'NavigationBar (Material 3)',
            style: denseHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            'Default background color is surface with an onSurface overlay '
            'color in M2, and primary in M3, with elevation 3. '
            'FlexColorScheme component theme default is color scheme '
            'background, with used surface blend and elevation 0.',
            style: denseBody,
          ),
        ),
      ],
    );
  }
}

class NavigationRailShowcase extends StatefulWidget {
  const NavigationRailShowcase({
    super.key,
    this.child,
    this.height = 400,
  });

  /// A child widget that we can use to place controls on the
  /// side of the NavigationRail in the show case widget.
  final Widget? child;

  /// The vertical space for the navigation bar.
  final double height;

  @override
  State<NavigationRailShowcase> createState() => _NavigationRailShowcaseState();
}

class _NavigationRailShowcaseState extends State<NavigationRailShowcase> {
  int buttonIndex = 0;
  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            'NavigationRail',
            style: denseHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            'Default SDK background color is theme.colorScheme.surface. '
            'FlexColorScheme sub-theme default is colorScheme.background.',
            style: denseBody,
          ),
        ),
        const Divider(height: 1),
        SizedBox(
          height: widget.height,
          // If we expand the rail and have a very narrow screen, it will
          // take up a lot of height, more than we want to give to the demo
          // panel, just let it overflow then. This may happen when we place
          // a lot of widgets in the child that no longer fits on a phone
          // with expanded rail.
          child: ClipRect(
            child: OverflowBox(
              alignment: AlignmentDirectional.topStart,
              maxHeight: 1200,
              child: Row(
                children: <Widget>[
                  MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    removeTop: true,
                    child: NavigationRail(
                      extended: isExtended,
                      minExtendedWidth: 150,
                      labelType:
                          isExtended ? NavigationRailLabelType.none : null,
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
                  ),
                  const VerticalDivider(width: 1),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        SwitchListTile(
                          title: const Text('Expand and collapse'),
                          subtitle: const Text('ON to expand  OFF to collapse\n'
                              'Only used for local control of Rail '
                              'presentation.'),
                          value: isExtended,
                          onChanged: (bool value) {
                            setState(() {
                              isExtended = value;
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
          ),
        ),
      ],
    );
  }
}

class ListTileShowcase extends StatelessWidget {
  const ListTileShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('ListTile'),
          subtitle: const Text('List tile sub title'),
          trailing: const Text('Trailing'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('ListTile selected'),
          subtitle: const Text('Selected list tile sub title'),
          trailing: const Text('Trailing'),
          selected: true,
          onTap: () {},
        ),
        const Divider(height: 1),
        SwitchListTile(
          secondary: const Icon(Icons.info),
          title: const Text('SwitchListTile'),
          subtitle: const Text('The switch list tile is OFF'),
          value: false,
          onChanged: (bool value) {},
        ),
        SwitchListTile(
          secondary: const Icon(Icons.info),
          title: const Text('SwitchListTile'),
          subtitle: const Text('The switch list tile is ON'),
          value: true,
          onChanged: (bool value) {},
        ),
        const Divider(height: 1),
        CheckboxListTile(
          secondary: const Icon(Icons.info),
          title: const Text('CheckboxListTile'),
          subtitle: const Text('The checkbox list tile is unchecked'),
          value: false,
          onChanged: (bool? value) {},
        ),
        CheckboxListTile(
          secondary: const Icon(Icons.info),
          title: const Text('CheckboxListTile'),
          subtitle: const Text('The checkbox list tile is checked'),
          value: true,
          onChanged: (bool? value) {},
        ),
        CheckboxListTile(
          secondary: const Icon(Icons.info),
          title: const Text('CheckboxListTile'),
          subtitle: const Text('The checkbox list tile is null in tristate'),
          tristate: true,
          value: null,
          onChanged: (bool? value) {},
        ),
        const Divider(height: 1),
        RadioListTile<int>(
          secondary: const Icon(Icons.info),
          title: const Text('RadioListTile'),
          subtitle: const Text('The radio option is unselected'),
          value: 0,
          onChanged: (_) {},
          groupValue: 1,
        ),
        RadioListTile<int>(
          secondary: const Icon(Icons.info),
          title: const Text('RadioListTile'),
          subtitle: const Text('The radio option is selected'),
          value: 1,
          onChanged: (_) {},
          groupValue: 1,
        ),
        RadioListTile<int>(
          secondary: const Icon(Icons.info),
          title: const Text('RadioListTile'),
          subtitle: const Text('The radio option and list tile is selected'),
          value: 1,
          selected: true,
          onChanged: (_) {},
          groupValue: 1,
        ),
      ],
    );
  }
}

class TimePickerDialogShowcase extends StatelessWidget {
  const TimePickerDialogShowcase({super.key});

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
  const DatePickerDialogShowcase({super.key});

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
  const AlertDialogShowcase({super.key});

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
    );
  }
}

class BottomSheetShowcase extends StatelessWidget {
  const BottomSheetShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AbsorbPointer(
          child: BottomSheet(
            enableDrag: false,
            elevation: theme.bottomSheetTheme.elevation,
            backgroundColor: theme.bottomSheetTheme.backgroundColor,
            onClosing: () {},
            builder: (final BuildContext context) => SizedBox(
              height: 150,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Material BottomSheet',
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      'Uses Material of type canvas as default background.\n'
                      'ColorScheme background in M2, but surface in M3.',
                      style: theme.textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        AbsorbPointer(
          child: BottomSheet(
            elevation: theme.bottomSheetTheme.modalElevation,
            backgroundColor: theme.bottomSheetTheme.modalBackgroundColor,
            enableDrag: false,
            onClosing: () {},
            builder: (final BuildContext context) => SizedBox(
              height: 150,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Material Modal BottomSheet',
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      'Uses Material of type canvas as default background.\n'
                      'ColorScheme background in M2, but surface in M3.',
                      style: theme.textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MaterialBannerSnackBarShowcase extends StatelessWidget {
  const MaterialBannerSnackBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;

    final Color defaultBackgroundColor = isLight
        ? Color.alphaBlend(
            colorScheme.onSurface.withOpacity(0.80), colorScheme.surface)
        : colorScheme.onSurface;
    final Color snackBackground =
        theme.snackBarTheme.backgroundColor ?? defaultBackgroundColor;
    final Color snackForeground =
        ThemeData.estimateBrightnessForColor(snackBackground) ==
                Brightness.light
            ? Colors.black
            : Colors.white;
    final TextStyle snackStyle = theme.snackBarTheme.contentTextStyle ??
        ThemeData(brightness: Brightness.light)
            .textTheme
            .titleMedium!
            .copyWith(color: snackForeground);
    final double snackElevation = theme.snackBarTheme.elevation ?? 6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Divider(height: 1),
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
        const SizedBox(height: 16),
        Material(
          color: snackBackground,
          elevation: snackElevation,
          surfaceTintColor: colorScheme.surfaceTint,
          shadowColor: colorScheme.shadow,
          child: SizedBox(
            height: 40,
            child: Center(
              child: Text('Material SnackBar (style simulation only)',
                  style: snackStyle),
            ),
          ),
        ),
      ],
    );
  }
}

class MaterialShowcase extends StatelessWidget {
  const MaterialShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Material elevation and tint', style: denseHeader),
        Text(
          'When useMaterial3 is true, Material gets no elevation, '
          'unless its shadowColor is also specified, which is not needed when '
          'it is false and using M2. To in M3 give it surface elevated '
          'tint, also specify its surfaceTint color.',
          style: denseBody,
        ),
        const SizedBox(height: 12),
        Text('Material type canvas', style: denseHeader),
        Text(
          'Default background color is theme canvasColor, and '
          'theme canvasColor is set to theme colorScheme background. The '
          'color canvasColor is going to be deprecated in Flutter SDK',
          style: denseBody,
        ),
        const Divider(),
        const SizedBox(height: 8),
        const Material(
          type: MaterialType.canvas,
          elevation: 0,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type canvas, elevation 0, '
                  'default',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        const Material(
          type: MaterialType.canvas,
          elevation: 1,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type canvas, elevation 1, '
                  'default',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          type: MaterialType.canvas,
          elevation: 1,
          surfaceTintColor: colorScheme.surfaceTint,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type canvas, elevation 1, '
                  'with surfaceTint, no shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          type: MaterialType.canvas,
          elevation: 1,
          surfaceTintColor: colorScheme.surfaceTint,
          shadowColor: colorScheme.shadow,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type canvas, elevation 1, '
                  'with surfaceTint, and shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        const Material(
          type: MaterialType.canvas,
          elevation: 6,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type canvas, elevation 6, '
                  'default',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          type: MaterialType.canvas,
          elevation: 6,
          surfaceTintColor: colorScheme.surfaceTint,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type canvas, elevation 6, '
                  'with surfaceTint, no shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          type: MaterialType.canvas,
          elevation: 6,
          surfaceTintColor: colorScheme.surfaceTint,
          shadowColor: colorScheme.shadow,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type canvas, elevation 6, '
                  'with surfaceTint, and shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        Text('Material type card', style: denseHeader),
        Text(
          'Default background color is theme cardColor, and '
          'theme cardColor is set to theme colorScheme surface. The '
          'color cardColor is going to be deprecated in Flutter SDK',
          style: denseBody,
        ),
        const Divider(),
        const SizedBox(height: 8),
        const Material(
          type: MaterialType.card,
          elevation: 0,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type card, elevation 0, '
                  'default',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        const Material(
          type: MaterialType.card,
          elevation: 1,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type card, elevation 1, '
                  'default',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          type: MaterialType.card,
          elevation: 1,
          surfaceTintColor: colorScheme.surfaceTint,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type card, elevation 1, '
                  'with surfaceTint, no shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          type: MaterialType.card,
          elevation: 1,
          surfaceTintColor: colorScheme.surfaceTint,
          shadowColor: colorScheme.shadow,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type card, elevation 1, '
                  'with surfaceTint, and shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        const Material(
          type: MaterialType.card,
          elevation: 6,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type card, elevation 6, '
                  'default',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          type: MaterialType.card,
          elevation: 6,
          surfaceTintColor: colorScheme.surfaceTint,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type card, elevation 6, '
                  'with surfaceTint, no shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          type: MaterialType.card,
          elevation: 6,
          surfaceTintColor: colorScheme.surfaceTint,
          shadowColor: colorScheme.shadow,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Material type card, elevation 6, '
                  'with surfaceTint, and shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class CardShowcase extends StatelessWidget {
  const CardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Card', style: denseHeader),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Default background color comes from Material of type card, which '
            'by default is set to theme colorScheme surface. '
            'When useMaterial3 is true, Card gets elevation based '
            'surfaceTint. When it is false, surfaceTint has no '
            'effect even if specified.',
            style: denseBody,
          ),
        ),
        Card(
          elevation: 0,
          surfaceTintColor: colorScheme.surfaceTint,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Card, elevation 0',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Card(
          elevation: 1,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'Card, elevation 1, default surfaceTint and shadow',
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Card(
          elevation: 1,
          surfaceTintColor: colorScheme.surfaceTint,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Card, elevation 1, with surfaceTint, default shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Card(
          elevation: 1,
          surfaceTintColor: colorScheme.surfaceTint,
          shadowColor: Colors.transparent,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Card, elevation 1,  with surfaceTint, '
                  'transparent shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        const Card(
          elevation: 4,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Card, elevation 4, default surfaceTint and shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Card(
          elevation: 4,
          surfaceTintColor: colorScheme.surfaceTint,
          child: const SizedBox(
            height: 60,
            child: Center(
              child: Text(
                'Card, elevation 4, with surfaceTint, default shadow',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Card(
          elevation: 4,
          surfaceTintColor: colorScheme.surfaceTint,
          shadowColor: Colors.transparent,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Card, elevation 4, with surfaceTint, '
                  'transparent shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        const Card(
          elevation: 10,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Card, elevation 10, default surfaceTint and shadow',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 10,
          surfaceTintColor: colorScheme.surfaceTint,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Card, elevation 10, with surfaceTint',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 10,
          surfaceTintColor: colorScheme.surfaceTint,
          shadowColor: Colors.transparent,
          child: const SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'Card, elevation 10, with surfaceTint, '
                'transparent shadow',
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ),
      ],
    );
  }
}

class TextThemeShowcase extends StatelessWidget {
  const TextThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return TextThemeColumnShowcase(textTheme: Theme.of(context).textTheme);
  }
}

class PrimaryTextThemeShowcase extends StatelessWidget {
  const PrimaryTextThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return TextThemeColumnShowcase(
        textTheme: Theme.of(context).primaryTextTheme);
  }
}

class TextThemeColumnShowcase extends StatelessWidget {
  const TextThemeColumnShowcase({super.key, required this.textTheme});
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Font: ${textTheme.titleSmall!.fontFamily}',
            style:
                textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600)),
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
