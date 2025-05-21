import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'switch_list_tile_reveal.dart';

/// Used to show the current themed Material widgets.
///
/// Use this widget to review your theme's impact on [ThemeData] and see
/// how it looks with different Material widgets.
///
/// The sub widgets used in this theme showcase can also be used on their
/// own, for example combined in smaller panels instead of in on big column
/// like here. Using the individual elements is done in example 5 where they
/// are put in separate cards.
///
/// These are all Flutter "Universal" Widgets that only depends on the SDK and
/// all the Widgets in this file be dropped into any application. They are
/// however not so useful, unless all you really want to do is to show what
/// Flutter Widgets look like.
class ShowcaseMaterial extends StatelessWidget {
  const ShowcaseMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const TextStyle headerStyle = TextStyle(fontSize: 20);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        //
        // Buttons
        //
        const Text('Material Buttons', style: headerStyle),
        const SizedBox(height: 8),
        const ElevatedButtonShowcase(),
        const SizedBox(height: 8),
        const FilledButtonShowcase(),
        const SizedBox(height: 8),
        const FilledButtonTonalShowcase(),
        const SizedBox(height: 8),
        const OutlinedButtonShowcase(),
        const SizedBox(height: 8),
        const TextButtonShowcase(),
        const SizedBox(height: 16),
        //
        // ToggleButtons and SegmentedButton
        //
        const Text('ToggleButtons', style: headerStyle),
        const SizedBox(height: 8),
        const ToggleButtonsShowcase(),
        const SizedBox(height: 16),
        const Text('SegmentedButton', style: headerStyle),
        const SizedBox(height: 8),
        const SegmentedButtonShowcase(showOutlinedButton: false),
        const SizedBox(height: 16),
        //
        // FloatingActionButton and Chip
        //
        const Text('FloatingActionButton', style: headerStyle),
        const SizedBox(height: 8),
        const FabShowcase(),
        const SizedBox(height: 16),
        const Text('Chips', style: headerStyle),
        const SizedBox(height: 8),
        const ChipShowcase(showOptions: true),
        const SizedBox(height: 16),
        //
        // Switch, CheckBox and Radio
        //
        const Text('Switch', style: headerStyle),
        const SizedBox(height: 8),
        const SwitchShowcase(showCupertinoSwitches: true),
        const SizedBox(height: 16),
        const Text('Checkbox', style: headerStyle),
        const SizedBox(height: 8),
        const CheckboxShowcase(showCupertinoSwitches: true),
        const SizedBox(height: 16),
        const Text('Radio', style: headerStyle),
        const SizedBox(height: 8),
        const RadioShowcase(showCupertinoSwitches: true),
        const SizedBox(height: 16),
        //
        // Icon
        //
        const Text('Icon', style: headerStyle),
        const SizedBox(height: 16),
        const IconShowcase(),
        const SizedBox(height: 16),
        //
        // IconButton
        //
        const Text('IconButton', style: headerStyle),
        const SizedBox(height: 16),
        const IconButtonShowcase(),
        const SizedBox(height: 16),
        const IconButtonVariantsShowcase(),
        const SizedBox(height: 16),
        //
        // CircleAvatar
        //
        const Text('CircleAvatar', style: headerStyle),
        const SizedBox(height: 16),
        const CircleAvatarShowcase(),
        const SizedBox(height: 16),
        //
        // Tooltip
        //
        const Text('Tooltip', style: headerStyle),
        const SizedBox(height: 8),
        const TooltipShowcase(),
        const SizedBox(height: 16),
        //
        // ProgressIndicator
        //
        const Text('ProgressIndicator', style: headerStyle),
        const SizedBox(height: 8),
        const ProgressIndicatorShowcase(),
        const SizedBox(height: 16),
        //
        // Slider and RangeSlider
        //
        const Text('Slider and RangeSlider', style: headerStyle),
        const SizedBox(height: 8),
        const SliderShowcase(),
        const Divider(),
        const SizedBox(height: 8),
        const SliderAdaptiveShowcase(),
        const Divider(),
        const RangeSliderShowcase(),
        const SizedBox(height: 8),
        //
        // TextField
        //
        const Text('TextField', style: headerStyle),
        const SizedBox(height: 8),
        const TextFieldShowcase(),
        const SizedBox(height: 16),
        //
        // PopupMenuButton, DropdownButtonFormField, DropDownButton
        //
        const Text('PopupMenuButton', style: headerStyle),
        const PopupMenuButtonsShowcase(explain: true),
        const SizedBox(height: 16),
        const Text('DropdownButtons', style: headerStyle),
        const SizedBox(height: 8),
        const DropDownButtonShowcase(explain: true),
        const SizedBox(height: 8),
        const DropdownButtonFormFieldShowcase(explain: true),
        const SizedBox(height: 24),
        //
        // DropdownMenu, MenuBar, MenuAnchor
        //
        const Text('DropdownMenu, MenuAnchor and MenuBar', style: headerStyle),
        const DropDownMenuShowcase(explain: true),
        const MenuAnchorShowcase(explain: true),
        const MenuBarShowcase(explain: true),
        const SizedBox(height: 16),
        //
        // AppBars and TabBar
        //
        const Text('AppBar', style: headerStyle),
        const SizedBox(height: 8),
        const AppBarShowcase(),
        const SizedBox(height: 16),
        const Text('TabBar', style: headerStyle),
        const SizedBox(height: 8),
        const SizedBox(height: 8),
        const TabBarForAppBarShowcase(explain: true),
        const SizedBox(height: 16),
        const TabBarScrollingForAppBarShowcase(),
        const SizedBox(height: 8),
        const TabBarForBackgroundShowcase(explain: true),
        const SizedBox(height: 16),
        //
        // BottomAppBar and SearchBar
        //
        const Text('BottomAppBar', style: headerStyle),
        const BottomAppBarShowcase(explain: true),
        const SizedBox(height: 16),
        const Text('SearchBar', style: headerStyle),
        const SearchBarShowcase(explain: true),
        const SizedBox(height: 16),
        //
        // BottomNavigationBar (M2),  NavigationBar (M3)
        // NavigationRail, NavigationDrawer
        //
        const Text('Navigation Components', style: headerStyle),
        const BottomNavigationBarShowcase(explain: true),
        const SizedBox(height: 8),
        const NavigationBarShowcase(explain: true),
        const SizedBox(height: 8),
        const NavigationRailShowcase(explain: true),
        const SizedBox(height: 8),
        const NavigationDrawerShowcase(explain: true),
        const DrawerShowcase(explain: true),
        const SizedBox(height: 16),
        //
        // AlertDialog, TimePickerDialog, DatePickerDialog
        //
        const Text('Dialogs', style: headerStyle),
        const AlertDialogShowcase(),
        const TimePickerDialogShowcase(),
        const DatePickerDialogShowcase(),
        const SizedBox(height: 8),
        //
        // BottomSheet
        //
        const Text('BottomSheet', style: headerStyle),
        const SizedBox(height: 16),
        const BottomSheetShowcase(),
        const SizedBox(height: 16),
        const BottomSheetModalShowcase(),
        const SizedBox(height: 16),
        //
        // SnackBar and MaterialBanner
        //
        const Text('SnackBar and MaterialBanner', style: headerStyle),
        const SizedBox(height: 8),
        const MaterialBannerSnackBarShowcase(),
        //
        // Card
        //
        const Text('Card', style: headerStyle),
        const SizedBox(height: 8),
        const CardTypesShowcase(showForcedOutlined: true),
        const CardShowcase(explain: true),
        const SizedBox(height: 16),
        //
        // Material
        //
        const Text('Material', style: headerStyle),

        const MaterialShowcase(explain: true),
        const SizedBox(height: 16),
        //
        // LisTile, SwitchListTile, CheckboxListTile, RadioListTile
        // and more exotic
        // ExpansionTile, ExpansionPanelList
        //
        const Text('All List Tiles', style: headerStyle),
        const ListTileShowcase(),
        const Divider(height: 1),
        const SwitchListTileShowcase(),
        const Divider(height: 1),
        const CheckboxListTileShowcase(),
        const Divider(height: 1),
        const RadioListTileShowcase(),
        const Divider(),
        const ExpansionTileShowcase(),
        const Divider(),
        const ExpansionPanelListShowcase(),
        const SizedBox(height: 32),
        //
        // TextTheme and PrimaryTextTheme
        //
        const Text('Text', style: headerStyle),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('TextTheme', style: theme.textTheme.titleMedium),
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
                Text('PrimaryTextTheme',
                    style: theme.primaryTextTheme.titleMedium),
                const PrimaryTextThemeShowcase(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class ElevatedButtonShowcase extends StatelessWidget {
  const ElevatedButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          SizedBox(
            width: 116,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
          ),
          SizedBox(
            width: 110,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            ),
          ),
          const SizedBox(
            width: 117,
            child: ElevatedButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ),
        ],
      ),
    );
  }
}

class FilledButtonShowcase extends StatelessWidget {
  const FilledButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          SizedBox(
            width: 116,
            child: FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
          ),
          SizedBox(
            width: 110,
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            ),
          ),
          const SizedBox(
            width: 117,
            child: FilledButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ),
        ],
      ),
    );
  }
}

class FilledButtonTonalShowcase extends StatelessWidget {
  const FilledButtonTonalShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          SizedBox(
            width: 116,
            child: FilledButton.tonal(
              onPressed: () {},
              child: const Text('Tonal'),
            ),
          ),
          SizedBox(
            width: 110,
            child: FilledButton.tonalIcon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            ),
          ),
          const SizedBox(
            width: 117,
            child: FilledButton.tonal(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ),
        ],
      ),
    );
  }
}

class OutlinedButtonShowcase extends StatelessWidget {
  const OutlinedButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          SizedBox(
            width: 116,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
          ),
          SizedBox(
            width: 110,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            ),
          ),
          const SizedBox(
            width: 117,
            child: OutlinedButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ),
        ],
      ),
    );
  }
}

class TextButtonShowcase extends StatelessWidget {
  const TextButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          SizedBox(
            width: 116,
            child: TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
          ),
          SizedBox(
            width: 110,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Icon'),
            ),
          ),
          const SizedBox(
            width: 117,
            child: TextButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ),
        ],
      ),
    );
  }
}

class ToggleButtonsShowcase extends StatefulWidget {
  const ToggleButtonsShowcase({this.compareButtons, super.key});
  final bool? compareButtons;

  @override
  State<ToggleButtonsShowcase> createState() => _ToggleButtonsShowcaseState();
}

class _ToggleButtonsShowcaseState extends State<ToggleButtonsShowcase> {
  List<bool> selected = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
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
          if (widget.compareButtons ?? false)
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
          if (widget.compareButtons ?? false)
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
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
          if (widget.compareButtons ?? false)
            const OutlinedButton(
              onPressed: null,
              child: Text('Outlined'),
            ),
        ],
      ),
    );
  }
}

class SegmentedButtonShowcase extends StatefulWidget {
  const SegmentedButtonShowcase({this.showOutlinedButton, super.key});
  final bool? showOutlinedButton;

  @override
  State<SegmentedButtonShowcase> createState() =>
      _SegmentedButtonShowcaseState();
}

enum Calendar { day, week, month, year }

class _SegmentedButtonShowcaseState extends State<SegmentedButtonShowcase> {
  Calendar _selected = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          SegmentedButton<Calendar>(
            showSelectedIcon: false,
            // multiSelectionEnabled: false,
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text('Day'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                label: Text('Week'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                label: Text('Month'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                label: Text('Year'),
              ),
            ],
            selected: <Calendar>{_selected},
            onSelectionChanged: (Set<Calendar> selected) {
              setState(() {
                _selected = selected.first;
              });
            },
          ),
          SegmentedButton<Calendar>(
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text('Day'),
                icon: Icon(Icons.calendar_view_day),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                icon: Icon(Icons.calendar_view_week),
                label: Text('Week'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                icon: Icon(Icons.calendar_view_month),
                label: Text('Mont'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                icon: Icon(Icons.calendar_today),
                label: Text('Year'),
              ),
            ],
            selected: <Calendar>{_selected},
            onSelectionChanged: (Set<Calendar> selected) {
              setState(() {
                _selected = selected.first;
              });
            },
          ),
          SegmentedButton<Calendar>(
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text('Day'),
                icon: Icon(Icons.calendar_view_day),
                enabled: false,
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                icon: Icon(Icons.calendar_view_week),
                label: Text('Week'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                icon: Icon(Icons.calendar_view_month),
                label: Text('Mont'),
                enabled: false,
              ),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                icon: Icon(Icons.calendar_today),
                label: Text('Year'),
              ),
            ],
            selected: <Calendar>{_selected},
            onSelectionChanged: (Set<Calendar> selected) {
              setState(() {
                _selected = selected.first;
              });
            },
          ),
        ],
      ),
    );
  }
}

class FabShowcase extends StatefulWidget {
  const FabShowcase({super.key});

  @override
  State<FabShowcase> createState() => _FabShowcaseState();
}

class _FabShowcaseState extends State<FabShowcase> {
  bool extended = true;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: <Widget>[
          Tooltip(
            verticalOffset: 40,
            waitDuration: const Duration(milliseconds: 500),
            message: 'FloatingActionButton.small',
            child: FloatingActionButton.small(
              heroTag: 'FAB small',
              onPressed: () {},
              child: const Icon(Icons.accessibility),
            ),
          ),
          Tooltip(
            verticalOffset: 40,
            waitDuration: const Duration(milliseconds: 500),
            message: 'FloatingActionButton',
            child: FloatingActionButton(
              heroTag: 'FAB standard',
              onPressed: () {},
              child: const Icon(Icons.accessibility),
            ),
          ),
          Tooltip(
            verticalOffset: 40,
            waitDuration: const Duration(milliseconds: 500),
            message: 'FloatingActionButton.extended(isExtended: $extended)',
            child: FloatingActionButton.extended(
              heroTag: 'FAB extendable',
              isExtended: extended,
              onPressed: () {
                setState(() {
                  extended = !extended;
                });
              },
              icon: const Icon(Icons.accessibility),
              label: const Text('Extended'),
            ),
          ),
          Tooltip(
            verticalOffset: 60,
            waitDuration: const Duration(milliseconds: 500),
            message: 'FloatingActionButton.large',
            child: FloatingActionButton.large(
              heroTag: 'FAB large',
              onPressed: () {},
              child: const Icon(Icons.accessibility),
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchShowcase extends StatefulWidget {
  const SwitchShowcase({super.key, this.showCupertinoSwitches = false});
  final bool showCupertinoSwitches;

  @override
  State<SwitchShowcase> createState() => _SwitchShowcaseState();
}

class _SwitchShowcaseState extends State<SwitchShowcase> {
  bool isOn1 = true;

  static const double _width = 75;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Material')),
              Switch(
                value: isOn1,
                onChanged: (bool value) {
                  setState(() {
                    isOn1 = value;
                  });
                },
              ),
              Switch(
                value: !isOn1,
                onChanged: (bool value) {
                  setState(() {
                    isOn1 = !value;
                  });
                },
              ),
              Switch(
                thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return Icon(Icons.check,
                        color: isLight
                            ? colorScheme.primary
                            : colorScheme.onPrimary);
                  }
                  // All other states will use the default thumbIcon.
                  return Icon(Icons.close, color: colorScheme.onPrimary);
                }),
                value: isOn1,
                onChanged: (bool value) {
                  setState(() {
                    isOn1 = value;
                  });
                },
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Disabled')),
              Switch(
                value: isOn1,
                onChanged: null,
              ),
              Switch(
                value: !isOn1,
                onChanged: null,
              ),
              Switch(
                thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return Icon(Icons.check,
                        color: isLight
                            ? colorScheme.primary
                            : colorScheme.onPrimary);
                  }
                  // All other states will use the default thumbIcon.
                  return Icon(Icons.close, color: colorScheme.onPrimary);
                }),
                value: isOn1,
                onChanged: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Adaptive')),
              Switch.adaptive(
                value: isOn1,
                onChanged: (bool value) {
                  setState(() {
                    isOn1 = value;
                  });
                },
              ),
              Switch.adaptive(
                value: !isOn1,
                onChanged: (bool value) {
                  setState(() {
                    isOn1 = !value;
                  });
                },
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Disabled')),
              Switch.adaptive(
                value: isOn1,
                onChanged: null,
              ),
              Switch.adaptive(
                value: !isOn1,
                onChanged: null,
              ),
            ],
          ),
          if (widget.showCupertinoSwitches)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                const SizedBox(width: _width, child: Text('Cupertino')),
                CupertinoSwitch(
                  value: isOn1,
                  onChanged: (bool value) {
                    setState(() {
                      isOn1 = value;
                    });
                  },
                ),
                CupertinoSwitch(
                  value: !isOn1,
                  onChanged: (bool value) {
                    setState(() {
                      isOn1 = !value;
                    });
                  },
                ),
              ],
            ),
          if (widget.showCupertinoSwitches)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                const SizedBox(width: _width, child: Text('Disabled')),
                CupertinoSwitch(
                  value: isOn1,
                  onChanged: null,
                ),
                CupertinoSwitch(
                  value: !isOn1,
                  onChanged: null,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class CheckboxShowcase extends StatefulWidget {
  const CheckboxShowcase({super.key, this.showCupertinoSwitches = false});
  final bool showCupertinoSwitches;

  @override
  State<CheckboxShowcase> createState() => _CheckboxShowcaseState();
}

class _CheckboxShowcaseState extends State<CheckboxShowcase> {
  bool isSelected1 = true;
  bool? isSelectedTri1 = true;
  bool? isSelectedTri2 = false;
  bool? isSelectedTri3;

  static const double _width = 75;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Enabled')),
              Checkbox(
                value: isSelected1,
                onChanged: (bool? value) {
                  setState(() {
                    isSelected1 = value ?? false;
                  });
                },
              ),
              Checkbox(
                value: !isSelected1,
                onChanged: (bool? value) {
                  setState(() {
                    isSelected1 = !(value ?? false);
                  });
                },
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Error')),
              Checkbox(
                isError: true,
                value: isSelected1,
                onChanged: (bool? value) {
                  setState(() {
                    isSelected1 = value ?? false;
                  });
                },
              ),
              Checkbox(
                isError: true,
                value: !isSelected1,
                onChanged: (bool? value) {
                  setState(() {
                    isSelected1 = !(value ?? false);
                  });
                },
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Tri-state')),
              Checkbox(
                tristate: true,
                value: isSelectedTri1,
                onChanged: (bool? value) {
                  setState(() {
                    isSelectedTri1 = value;
                    if (value == null) {
                      isSelectedTri2 = true;
                      isSelectedTri3 = false;
                    } else if (value) {
                      isSelectedTri2 = false;
                      isSelectedTri3 = null;
                    } else {
                      isSelectedTri2 = null;
                      isSelectedTri3 = true;
                    }
                  });
                },
              ),
              Checkbox(
                tristate: true,
                value: isSelectedTri2,
                onChanged: (bool? value) {
                  setState(() {
                    isSelectedTri2 = value;
                    if (value == null) {
                      isSelectedTri1 = false;
                      isSelectedTri3 = true;
                    } else if (value) {
                      isSelectedTri1 = null;
                      isSelectedTri3 = false;
                    } else {
                      isSelectedTri1 = true;
                      isSelectedTri3 = null;
                    }
                  });
                },
              ),
              Checkbox(
                tristate: true,
                value: isSelectedTri3,
                onChanged: (bool? value) {
                  setState(() {
                    isSelectedTri3 = value;
                    if (value == null) {
                      isSelectedTri1 = true;
                      isSelectedTri2 = false;
                    } else if (value) {
                      isSelectedTri1 = false;
                      isSelectedTri2 = null;
                    } else {
                      isSelectedTri1 = null;
                      isSelectedTri2 = true;
                    }
                  });
                },
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Disabled')),
              Checkbox(
                tristate: true,
                value: isSelectedTri1,
                onChanged: null,
              ),
              Checkbox(
                tristate: true,
                value: isSelectedTri2,
                onChanged: null,
              ),
              Checkbox(
                tristate: true,
                value: isSelectedTri3,
                onChanged: null,
              ),
            ],
          ),
          if (widget.showCupertinoSwitches)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                const SizedBox(width: _width, child: Text('Adaptive')),
                Checkbox.adaptive(
                  value: isSelected1,
                  onChanged: (bool? value) {
                    setState(() {
                      isSelected1 = value ?? false;
                    });
                  },
                ),
                Checkbox.adaptive(
                  value: !isSelected1,
                  onChanged: (bool? value) {
                    setState(() {
                      isSelected1 = !(value ?? false);
                    });
                  },
                ),
              ],
            ),
          if (widget.showCupertinoSwitches)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                const SizedBox(width: _width, child: Text('Disabled')),
                Checkbox.adaptive(value: isSelected1, onChanged: null),
                Checkbox.adaptive(
                  value: !isSelected1,
                  onChanged: null,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class RadioShowcase extends StatefulWidget {
  const RadioShowcase({super.key, this.showCupertinoSwitches = false});
  final bool showCupertinoSwitches;

  @override
  State<RadioShowcase> createState() => _RadioShowcaseState();
}

class _RadioShowcaseState extends State<RadioShowcase> {
  bool? groupValue = true;
  static const double _width = 75;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Enabled')),
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
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Disabled')),
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
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Adaptive')),
              Radio<bool>.adaptive(
                value: true,
                groupValue: groupValue,
                onChanged: (bool? value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
              Radio<bool>.adaptive(
                value: false,
                groupValue: groupValue,
                onChanged: (bool? value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(width: _width, child: Text('Disabled')),
              Radio<bool>.adaptive(
                value: true,
                groupValue: groupValue,
                onChanged: null,
              ),
              Radio<bool>.adaptive(
                value: false,
                groupValue: groupValue,
                onChanged: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SliderShowcase extends StatefulWidget {
  const SliderShowcase({super.key});

  @override
  State<SliderShowcase> createState() => _SliderShowcaseState();
}

class _SliderShowcaseState extends State<SliderShowcase> {
  double value = 5;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text('Slider stepped (${value.toStringAsFixed(0)})'),
            subtitle: Slider(
              max: 30,
              divisions: 31,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue.roundToDouble();
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('Slider continuous (${value.toStringAsFixed(2)})'),
            subtitle: Slider(
              max: 30,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title:
                Text('Slider stepped disabled (${value.toStringAsFixed(0)})'),
            subtitle: Slider(
              max: 30,
              divisions: 31,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: null,
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
                'Slider continuous disabled (${value.toStringAsFixed(2)})'),
            subtitle: Slider(
              max: 30,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}

class SliderAdaptiveShowcase extends StatefulWidget {
  const SliderAdaptiveShowcase({super.key});

  @override
  State<SliderAdaptiveShowcase> createState() => _SliderAdaptiveShowcaseState();
}

class _SliderAdaptiveShowcaseState extends State<SliderAdaptiveShowcase> {
  double value = 5;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            dense: true,
            title:
                Text('Slider.adaptive stepped (${value.toStringAsFixed(0)})'),
            subtitle: Slider.adaptive(
              max: 30,
              divisions: 31,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue.roundToDouble();
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
                'Slider.adaptive continuous (${value.toStringAsFixed(2)})'),
            subtitle: Slider.adaptive(
              max: 30,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('Slider.adaptive stepped disabled '
                '(${value.toStringAsFixed(0)})'),
            subtitle: Slider.adaptive(
              max: 30,
              divisions: 31,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: null,
            ),
          ),
          ListTile(
            dense: true,
            title: Text('Slider.adaptive continuous disabled '
                '(${value.toStringAsFixed(2)})'),
            subtitle: Slider.adaptive(
              max: 30,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}

class RangeSliderShowcase extends StatefulWidget {
  const RangeSliderShowcase({super.key});

  @override
  State<RangeSliderShowcase> createState() => _RangeSliderShowcaseState();
}

class _RangeSliderShowcaseState extends State<RangeSliderShowcase> {
  RangeValues values = const RangeValues(5, 12);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text('RangeSlider stepped (${RangeLabels(
              values.start.toStringAsFixed(0),
              values.end.toStringAsFixed(0),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              divisions: 31,
              labels: RangeLabels(
                values.start.toStringAsFixed(0),
                values.end.toStringAsFixed(0),
              ),
              values: values,
              onChanged: (RangeValues newValues) {
                setState(() {
                  values = RangeValues(
                    newValues.start.roundToDouble(),
                    newValues.end.roundToDouble(),
                  );
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('RangeSlider continuous (${RangeLabels(
              values.start.toStringAsFixed(2),
              values.end.toStringAsFixed(2),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              labels: RangeLabels(
                values.start.toStringAsFixed(2),
                values.end.toStringAsFixed(2),
              ),
              values: values,
              onChanged: (RangeValues newValues) {
                setState(() {
                  values = newValues;
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('RangeSlider stepped disabled (${RangeLabels(
              values.start.toStringAsFixed(0),
              values.end.toStringAsFixed(0),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              divisions: 31,
              labels: RangeLabels(
                values.start.toStringAsFixed(0),
                values.end.toStringAsFixed(0),
              ),
              values: values,
              onChanged: null,
            ),
          ),
          ListTile(
            dense: true,
            title: Text('RangeSlider continuous disabled (${RangeLabels(
              values.start.toStringAsFixed(2),
              values.end.toStringAsFixed(2),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              divisions: 31,
              labels: RangeLabels(
                values.start.toStringAsFixed(2),
                values.end.toStringAsFixed(2),
              ),
              values: values,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}

class PopupMenuButtonsShowcase extends StatelessWidget {
  const PopupMenuButtonsShowcase({super.key, this.explain = false});
  final bool explain;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
      spacing: 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (explain)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'PopupMenuButton',
              style: denseHeader,
            ),
          ),
        if (explain)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              'The PopupMenuButton is a Material-2 design commonly used in '
              'Material apps. In M3 it has received a slightly updated style '
              'with elevation tint.',
              style: denseBody,
            ),
          ),
        const Row(
          spacing: 16,
          children: <Widget>[
            PopupMenuButtonShowcase(),
            CheckedPopupMenuButtonShowcase(),
            PopupMenuButtonTilesShowcase(),
          ],
        ),
      ],
    );
  }
}

class PopupMenuButtonShowcase extends StatelessWidget {
  const PopupMenuButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: PopupMenuButton<int>(
        onSelected: (_) {},
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) => const <PopupMenuItem<int>>[
          PopupMenuItem<int>(value: 1, child: Text('Option 1')),
          PopupMenuItem<int>(value: 2, child: Text('Option 2')),
          PopupMenuItem<int>(value: 3, child: Text('Option 3')),
          PopupMenuItem<int>(value: 4, child: Text('Option 4')),
          PopupMenuItem<int>(value: 5, child: Text('Option 5')),
        ],
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}

class CheckedPopupMenuButtonShowcase extends StatelessWidget {
  const CheckedPopupMenuButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: PopupMenuButton<int>(
        onSelected: (_) {},
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) => const <PopupMenuItem<int>>[
          CheckedPopupMenuItem<int>(value: 1, child: Text('Option 1')),
          CheckedPopupMenuItem<int>(value: 2, child: Text('Option 2')),
          CheckedPopupMenuItem<int>(value: 3, child: Text('Option 3')),
          CheckedPopupMenuItem<int>(value: 4, child: Text('Option 4')),
          CheckedPopupMenuItem<int>(value: 5, child: Text('Option 5')),
        ],
        icon: const Icon(Icons.playlist_add_check),
      ),
    );
  }
}

class PopupMenuButtonTilesShowcase extends StatelessWidget {
  const PopupMenuButtonTilesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: PopupMenuButton<int>(
        tooltip: 'Show menu using\nListTile items',
        onSelected: (_) {},
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) => const <PopupMenuItem<int>>[
          PopupMenuItem<int>(
              value: 1,
              child:
                  ListTile(leading: Icon(Icons.alarm), title: Text('Alarm'))),
          PopupMenuItem<int>(
              value: 2,
              child: ListTile(
                  leading: Icon(Icons.cabin), title: Text('Wood cabin'))),
          PopupMenuItem<int>(
              value: 3,
              child: ListTile(
                  leading: Icon(Icons.camera_outdoor_rounded),
                  title: Text('Surveillance'))),
          PopupMenuItem<int>(
              value: 4,
              child: ListTile(
                  leading: Icon(Icons.water_damage),
                  title: Text('Water damage'))),
        ],
        icon: const Icon(Icons.more_horiz),
      ),
    );
  }
}

class DropDownButtonShowcase extends StatefulWidget {
  const DropDownButtonShowcase({super.key, this.explain = false});
  final bool explain;

  @override
  State<DropDownButtonShowcase> createState() => _DropDownButtonShowcaseState();
}

class _DropDownButtonShowcaseState extends State<DropDownButtonShowcase> {
  String selectedItem = '1 DropdownButton';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        spacing: 0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                'DropdownButton',
                style: denseHeader,
              ),
            ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text(
                'An older Material-2 widget, it cannot be themed. '
                'Consider using M3 DropdownMenu instead.',
                style: denseBody,
              ),
            ),
          DropdownButton<String>(
            value: selectedItem,
            onChanged: (String? value) {
              setState(() {
                selectedItem = value ?? '1 DropdownButton';
              });
            },
            items: <String>[
              '1 DropdownButton',
              '2 DropdownButton',
              '3 DropdownButton',
              '4 DropdownButton',
              '5 DropdownButton',
              '6 DropdownButton',
              '7 DropdownButton',
              '8 DropdownButton',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class DropdownButtonFormFieldShowcase extends StatefulWidget {
  const DropdownButtonFormFieldShowcase({super.key, this.explain = false});
  final bool explain;

  @override
  State<DropdownButtonFormFieldShowcase> createState() =>
      _DropdownButtonFormFieldShowcaseState();
}

class _DropdownButtonFormFieldShowcaseState
    extends State<DropdownButtonFormFieldShowcase> {
  String selectedItem = '1 DropdownButtonFormField';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        spacing: 0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                'DropdownButtonFormField',
                style: denseHeader,
              ),
            ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text(
                'An older M2 widget. Cannot theme its open style. '
                'Closed style uses InputDecorator theme. Maybe consider '
                'using M3 DropDownMenu instead.',
                style: denseBody,
              ),
            ),
          DropdownButtonFormField<String>(
            value: selectedItem,
            onChanged: (String? value) {
              setState(() {
                selectedItem = value ?? '1 DropdownButtonFormField';
              });
            },
            items: <String>[
              '1 DropdownButtonFormField',
              '2 DropdownButtonFormField',
              '3 DropdownButtonFormField',
              '4 DropdownButtonFormField',
              '5 DropdownButtonFormField',
              '6 DropdownButtonFormField',
              '7 DropdownButtonFormField',
              '8 DropdownButtonFormField',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class DropDownMenuShowcase extends StatefulWidget {
  const DropDownMenuShowcase({super.key, this.explain = false});
  final bool explain;

  @override
  State<DropDownMenuShowcase> createState() => _DropDownMenuShowcaseState();
}

class _DropDownMenuShowcaseState extends State<DropDownMenuShowcase> {
  IconData selectedItem = Icons.alarm;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        spacing: 0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                'DropdownMenu',
                style: denseHeader,
              ),
            ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text(
                'The M3 DropdownMenu shares building blocks with MenuBar '
                'and MenuAnchor, also uses InputDecorator for text entry.',
                style: denseBody,
              ),
            ),
          DropdownMenu<IconData>(
            initialSelection: selectedItem,
            requestFocusOnTap: true,
            leadingIcon: Icon(selectedItem),
            onSelected: (IconData? value) {
              setState(() {
                selectedItem = value ?? Icons.alarm;
              });
              // Unfocus after select, see
              // https://github.com/flutter/flutter/issues/138343
              FocusScope.of(context).unfocus();
            },
            dropdownMenuEntries: const <DropdownMenuEntry<IconData>>[
              DropdownMenuEntry<IconData>(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 12)),
                ),
                label: 'Alarm settings',
                leadingIcon: Icon(Icons.alarm),
                value: Icons.alarm,
              ),
              DropdownMenuEntry<IconData>(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 12)),
                ),
                label: 'Disabled settings',
                leadingIcon: Icon(Icons.settings),
                enabled: false,
                value: Icons.settings,
              ),
              DropdownMenuEntry<IconData>(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 12)),
                ),
                label: 'Cabin overview',
                leadingIcon: Icon(Icons.cabin),
                value: Icons.cabin,
              ),
              DropdownMenuEntry<IconData>(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 12)),
                ),
                label: 'Surveillance view',
                leadingIcon: Icon(Icons.camera_outdoor_rounded),
                // value: 'four',
                value: Icons.camera_outdoor_rounded,
              ),
              DropdownMenuEntry<IconData>(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 12)),
                ),
                label: 'Water alert',
                leadingIcon: Icon(Icons.water_damage),
                // value: 'five',
                value: Icons.water_damage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TooltipShowcase extends StatelessWidget {
  const TooltipShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 4,
      children: <Widget>[
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

class IconShowcase extends StatelessWidget {
  const IconShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 4,
      children: <Widget>[
        Tooltip(
          message: 'Icon is Icons\nAddCircle',
          child: Icon(Icons.add_circle),
        ),
        Tooltip(
          message: 'Icon is Icons\nCameraAltOutlined',
          child: Icon(Icons.camera_alt_outlined),
        ),
        Tooltip(
          message: 'Icon is Icons\nFlutterDash',
          child: Icon(Icons.flutter_dash),
        ),
        Tooltip(
          message: 'Icon is Icons\nWarningAmber',
          child: Icon(Icons.warning_amber),
        ),
      ],
    );
  }
}

class CircleAvatarShowcase extends StatelessWidget {
  const CircleAvatarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 4,
      children: <Widget>[
        Tooltip(
          message: 'This is a\nCircleAvatar',
          child: CircleAvatar(
            child: Text('CA'),
          ),
        ),
        Tooltip(
          message: 'CircleAvatar\nwith image',
          child: CircleAvatar(
            child: FlutterLogo(),
          ),
        ),
        Tooltip(
          message: 'CircleAvatar\nwith image\nradius 30',
          child: CircleAvatar(
            radius: 30,
            child: FlutterLogo(size: 40),
          ),
        ),
      ],
    );
  }
}

class IconButtonShowcase extends StatefulWidget {
  const IconButtonShowcase({super.key});

  @override
  State<IconButtonShowcase> createState() => _IconButtonShowcaseState();
}

class _IconButtonShowcaseState extends State<IconButtonShowcase> {
  bool isLockOpen = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 4,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.accessibility),
            tooltip: 'This is an\nIconButton',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.lock_outlined),
            selectedIcon: const Icon(Icons.lock_open_outlined),
            tooltip: isLockOpen
                ? 'This is an IconButton\nIn M3 tap to close lock'
                : 'This is an IconButton\nIn M3 tap to open lock',
            isSelected: isLockOpen,
            onPressed: () {
              setState(() {
                isLockOpen = !isLockOpen;
              });
            },
          ),
        ],
      ),
    );
  }
}

class IconButtonVariantsShowcase extends StatelessWidget {
  const IconButtonVariantsShowcase({super.key});
  @override
  Widget build(BuildContext context) {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 0,
      runSpacing: 4,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 18),
            SizedBox(width: 75, height: 21, child: Text('Type')),
            SizedBox(height: 16),
            SizedBox(width: 75, height: 48, child: Text('Tappable')),
            SizedBox(width: 75, height: 48, child: Text('Toggleable')),
            SizedBox(width: 75, height: 48, child: Text('Disabled')),
          ],
        ),
        Column(
          // Standard IconButton
          children: <Widget>[
            SizedBox(
                width: 65, child: Text('Default', textAlign: TextAlign.center)),
            SizedBox(height: 4),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Standard',
              variant: _IconButtonVariant.standard,
              toggleable: false,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Standard toggleable',
              variant: _IconButtonVariant.standard,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: false,
              tooltip: 'Standard (disabled)',
              variant: _IconButtonVariant.standard,
              toggleable: false,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
                width: 65, child: Text('Filled', textAlign: TextAlign.center)),
            SizedBox(height: 4),
            // Filled IconButton
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Filled',
              variant: _IconButtonVariant.filled,
              toggleable: false,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Filled toggleable',
              variant: _IconButtonVariant.filled,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: false,
              tooltip: 'Filled (disabled)',
              variant: _IconButtonVariant.filled,
              toggleable: false,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
                width: 65, child: Text('Tonal', textAlign: TextAlign.center)),
            SizedBox(height: 4),
            // Filled Tonal IconButton
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Filled tonal',
              variant: _IconButtonVariant.filledTonal,
              toggleable: false,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Filled tonal toggleable',
              variant: _IconButtonVariant.filledTonal,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: false,
              tooltip: 'Filled tonal (disabled)',
              variant: _IconButtonVariant.filledTonal,
              toggleable: false,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
                width: 65,
                child: Text('Outlined', textAlign: TextAlign.center)),
            SizedBox(height: 4),
            // Outlined IconButton
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Outlined',
              variant: _IconButtonVariant.outlined,
              toggleable: false,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Outlined toggleable',
              variant: _IconButtonVariant.outlined,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: false,
              tooltip: 'Outlined (disabled)',
              variant: _IconButtonVariant.outlined,
              toggleable: false,
            ),
          ],
        ),
      ],
    );
  }
}

enum _IconButtonVariant { standard, filled, filledTonal, outlined }

class _IconToggleButton extends StatefulWidget {
  const _IconToggleButton({
    required this.isEnabled,
    required this.tooltip,
    required this.variant,
    this.toggleable = true,
  });

  final bool isEnabled;
  final String tooltip;
  final _IconButtonVariant variant;
  final bool toggleable;

  @override
  State<_IconToggleButton> createState() => _IconToggleButtonState();
}

class _IconToggleButtonState extends State<_IconToggleButton> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = widget.isEnabled
        ? () {
            setState(() {
              selected = !selected;
            });
          }
        : null;

    final String toggleState = widget.toggleable
        ? selected
            ? '\n(selected)'
            : '\n(not selected)'
        : '';

    switch (widget.variant) {
      case _IconButtonVariant.standard:
        {
          return IconButton(
            isSelected: selected & widget.toggleable,
            tooltip: '${widget.tooltip}$toggleState',
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            onPressed: onPressed,
          );
        }
      case _IconButtonVariant.filled:
        {
          return IconButton.filled(
            isSelected: selected & widget.toggleable,
            tooltip: '${widget.tooltip}$toggleState',
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            onPressed: onPressed,
          );
        }
      case _IconButtonVariant.filledTonal:
        {
          return IconButton.filledTonal(
            isSelected: selected & widget.toggleable,
            tooltip: '${widget.tooltip}$toggleState',
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            onPressed: onPressed,
          );
        }
      case _IconButtonVariant.outlined:
        {
          return IconButton.outlined(
            isSelected: selected & widget.toggleable,
            tooltip: '${widget.tooltip}$toggleState',
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            onPressed: onPressed,
          );
        }
    }
  }
}

class ProgressIndicatorShowcase extends StatefulWidget {
  const ProgressIndicatorShowcase({super.key});

  @override
  State<ProgressIndicatorShowcase> createState() =>
      _ProgressIndicatorShowcaseState();
}

class _ProgressIndicatorShowcaseState extends State<ProgressIndicatorShowcase> {
  bool playProgressIndicator = false;
  @override
  Widget build(BuildContext context) {
    final double? progressValue = playProgressIndicator ? null : 0.75;

    return RepaintBoundary(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                isSelected: playProgressIndicator,
                selectedIcon: const Icon(Icons.pause),
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    playProgressIndicator = !playProgressIndicator;
                  });
                },
              ),
              if (playProgressIndicator)
                const Text('Pause')
              else
                const Text('Play'),
            ],
          ),
          const Text('Material'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: <Widget>[
              SizedBox.square(
                dimension: 40,
                child: CircularProgressIndicator(
                  value: progressValue,
                ),
              ),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              ),
            ],
          ),
          const Text('Adaptive'),
          SizedBox.square(
            dimension: 40,
            child: CircularProgressIndicator.adaptive(
              value: progressValue,
            ),
          ),
        ],
      ),
    );
  }
}

class ChipShowcase extends StatefulWidget {
  const ChipShowcase({super.key, this.showOptions = false});
  final bool showOptions;

  @override
  State<ChipShowcase> createState() => _ChipShowcaseState();
}

class _ChipShowcaseState extends State<ChipShowcase> {
  static const double _fontSize = 11;
  static const double _textWidth = 95;

  bool filterSelected = true;
  bool inputSelected = true;
  bool choiceSelected = true;
  bool showCheckmark = true;
  bool showAvatar = false;

  static const RoundedRectangleBorder _tileShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Chip', style: TextStyle(fontSize: _fontSize)),
                    Text('No M3 spec', style: TextStyle(fontSize: _fontSize))
                  ],
                ),
              ),
              Chip(
                label: const Text('Chip'),
                onDeleted: () {},
              ),
              const Chip(
                label: Text('Chip'),
                avatar: FlutterLogo(),
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('ActionChip', style: TextStyle(fontSize: _fontSize)),
                    Text('Assist (M3)', style: TextStyle(fontSize: _fontSize)),
                  ],
                ),
              ),
              ActionChip(
                label: const Text('ActionChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                onPressed: () {},
              ),
              ActionChip(
                label: const Text('ActionChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                onPressed: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('FilterChip', style: TextStyle(fontSize: _fontSize)),
                    Text('Filter (M3)', style: TextStyle(fontSize: _fontSize)),
                  ],
                ),
              ),
              FilterChip(
                label: const Text('FilterChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                selected: false,
                onSelected: (bool value) {},
              ),
              FilterChip(
                label: const Text('FilterChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                selected: false,
                onSelected: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Selected', style: TextStyle(fontSize: _fontSize)),
                    Text('Filter', style: TextStyle(fontSize: _fontSize)),
                  ],
                ),
              ),
              FilterChip(
                label: const Text('FilterChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                selected: filterSelected,
                onSelected: (bool value) {
                  setState(() {
                    filterSelected = value;
                  });
                },
              ),
              FilterChip(
                label: const Text('FilterChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                selected: true,
                onSelected: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('InputChip', style: TextStyle(fontSize: _fontSize)),
                    Text('Input (M3)', style: TextStyle(fontSize: _fontSize)),
                  ],
                ),
              ),
              InputChip(
                label: const Text('InputChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                onSelected: (bool value) {},
                onDeleted: () {},
              ),
              InputChip(
                label: const Text('InputChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                isEnabled: false,
                onSelected: (bool value) {},
                onDeleted: () {},
                // onDeleted: () {},
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Selected', style: TextStyle(fontSize: _fontSize)),
                    Text('Input', style: TextStyle(fontSize: _fontSize)),
                  ],
                ),
              ),
              InputChip(
                label: const Text('InputChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                selected: inputSelected,
                showCheckmark: showCheckmark,
                onSelected: (bool value) {
                  setState(() {
                    inputSelected = value;
                  });
                },
                onDeleted: () {},
              ),
              InputChip(
                label: const Text('InputChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                selected: true,
                showCheckmark: showCheckmark,
                isEnabled: false,
                onSelected: (bool value) {},
                onDeleted: () {},
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('ChoiceChip', style: TextStyle(fontSize: _fontSize)),
                    Text('Suggestion (M3)',
                        style: TextStyle(fontSize: _fontSize)),
                  ],
                ),
              ),
              ChoiceChip(
                label: const Text('ChoiceChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                selected: false,
                onSelected: (bool value) {},
              ),
              ChoiceChip(
                label: const Text('ChoiceChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                selected: false,
                onSelected: null,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children: <Widget>[
              const SizedBox(
                width: _textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Selected', style: TextStyle(fontSize: _fontSize)),
                    Text('Suggestion (M3)',
                        style: TextStyle(fontSize: _fontSize)),
                  ],
                ),
              ),
              ChoiceChip(
                label: const Text('ChoiceChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                selected: choiceSelected,
                onSelected: (bool value) {
                  setState(() {
                    choiceSelected = value;
                  });
                },
              ),
              ChoiceChip(
                label: const Text('ChoiceChip'),
                avatar: showAvatar
                    ? const Icon(Icons.account_circle_rounded)
                    : null,
                showCheckmark: showCheckmark,
                selected: true,
              ),
            ],
          ),
          if (widget.showOptions)
            SwitchListTile(
              dense: true,
              shape: _tileShape,
              contentPadding: const EdgeInsets.symmetric(horizontal: 6),
              title: const Text('Show checkmark when selected'),
              value: showCheckmark,
              onChanged: (bool value) {
                setState(() {
                  showCheckmark = value;
                });
              },
            ),
          if (widget.showOptions)
            SwitchListTile(
              dense: true,
              shape: _tileShape,
              contentPadding: const EdgeInsets.symmetric(horizontal: 6),
              title: const Text('Show optional avatar'),
              value: showAvatar,
              onChanged: (bool value) {
                setState(() {
                  showAvatar = value;
                });
              },
            ),
        ],
      ),
    );
  }
}

class TextFieldShowcase extends StatefulWidget {
  const TextFieldShowcase({super.key});

  @override
  State<TextFieldShowcase> createState() => _TextFieldShowcaseState();
}

class _TextFieldShowcaseState extends State<TextFieldShowcase> {
  late TextEditingController _plainFieldController;
  late TextEditingController _withIconsController;
  late TextEditingController _fixedHinController;
  late TextEditingController _collapsedFieldController;
  bool _errorStatePlain = false;
  bool _errorStateWithIcons = false;
  bool _errorFixedHint = false;
  bool _forceFilled = false;
  bool _forceOutlined = false;

  static const RoundedRectangleBorder _tileShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  @override
  void initState() {
    super.initState();
    _plainFieldController = TextEditingController();
    _withIconsController = TextEditingController();
    _fixedHinController = TextEditingController();
    _collapsedFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _plainFieldController.dispose();
    _withIconsController.dispose();
    _fixedHinController.dispose();
    _collapsedFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDefaultDecoration =
        Theme.of(context).inputDecorationTheme == const InputDecorationTheme();

    return RepaintBoundary(
      child: Column(
        spacing: 16,
        children: <Widget>[
          Row(
            spacing: 16,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (String text) {
                    setState(() {
                      if (text.contains('a') | text.isEmpty) {
                        _errorStatePlain = false;
                      } else {
                        _errorStatePlain = true;
                      }
                    });
                  },
                  key: const Key('TextField1'),
                  controller: _plainFieldController,
                  decoration: InputDecoration(
                    border: _forceOutlined && isDefaultDecoration
                        ? const OutlineInputBorder()
                        : null,
                    filled: _forceFilled && isDefaultDecoration ? true : null,
                    hintText: 'Write something...',
                    labelText: 'TextField',
                    errorText: _errorStatePlain
                        ? "Any entry without an 'a' will trigger this error"
                        : null,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  // ignore: avoid-undisposed-instances, false positive, this will be disposed automatically by GC.
                  controller: TextEditingController(),
                  enabled: false,
                  decoration: InputDecoration(
                    border: _forceOutlined && isDefaultDecoration
                        ? const OutlineInputBorder()
                        : null,
                    filled: _forceFilled && isDefaultDecoration ? true : null,
                    labelText: 'Disabled label',
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 16,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (String text) {
                    setState(() {
                      if (text.contains('a') | text.isEmpty) {
                        _errorStateWithIcons = false;
                      } else {
                        _errorStateWithIcons = true;
                      }
                    });
                  },
                  key: const Key('TextField2'),
                  controller: _withIconsController,
                  decoration: InputDecoration(
                    border: _forceOutlined && isDefaultDecoration
                        ? const OutlineInputBorder()
                        : null,
                    filled: _forceFilled && isDefaultDecoration ? true : null,
                    hintText: 'Write something...',
                    labelText: 'Moving label',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.info),
                    errorText: _errorStateWithIcons
                        ? "Any entry without an 'a' will trigger this error"
                        : null,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  // ignore: avoid-undisposed-instances, false positive, this will be disposed automatically by GC.
                  controller: TextEditingController(text: 'Entry'),
                  enabled: false,
                  decoration: InputDecoration(
                    border: _forceOutlined && isDefaultDecoration
                        ? const OutlineInputBorder()
                        : null,
                    filled: _forceFilled && isDefaultDecoration ? true : null,
                    labelText: 'Disabled label',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.info),
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 16,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (String text) {
                    setState(() {
                      if (text.contains('a') | text.isEmpty) {
                        _errorFixedHint = false;
                      } else {
                        _errorFixedHint = true;
                      }
                    });
                  },
                  key: const Key('TextField2'),
                  controller: _fixedHinController,
                  decoration: InputDecoration(
                    border: _forceOutlined && isDefaultDecoration
                        ? const OutlineInputBorder()
                        : null,
                    filled: _forceFilled && isDefaultDecoration ? true : null,
                    hintText: 'No moving label',
                    prefixIcon: const Icon(Icons.key),
                    errorText: _errorFixedHint
                        ? "Any entry without an 'a' will trigger this error"
                        : null,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  // ignore: avoid-undisposed-instances, false positive, this will be disposed automatically by GC.
                  controller: TextEditingController(text: ''),
                  enabled: false,
                  decoration: InputDecoration(
                    border: _forceOutlined && isDefaultDecoration
                        ? const OutlineInputBorder()
                        : null,
                    filled: _forceFilled && isDefaultDecoration ? true : null,
                    labelText: 'Disabled entry',
                    prefixIcon: const Icon(Icons.key),
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 16,
            children: <Widget>[
              Expanded(
                child: TextField(
                  key: const Key('TextField3'),
                  controller: _collapsedFieldController,
                  decoration: InputDecoration.collapsed(
                    border: _forceOutlined && isDefaultDecoration
                        ? const OutlineInputBorder()
                        : null,
                    filled: _forceFilled && isDefaultDecoration ? true : null,
                    hintText: 'Collapsed',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  key: const Key('TextField4'),
                  enabled: false,
                  // ignore: avoid-undisposed-instances, false positive, this will be disposed automatically by GC.
                  controller: TextEditingController(text: 'Disabled entry'),
                  decoration: InputDecoration.collapsed(
                    border: _forceOutlined && isDefaultDecoration
                        ? const OutlineInputBorder()
                        : null,
                    filled: _forceFilled && isDefaultDecoration ? true : null,
                    hintText: 'Collapsed TextField',
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                  dense: true,
                  shape: _tileShape,
                  title: const Text('Filled'),
                  subtitleReveal: const Text('This is not a theme toggle. It '
                      'sets the Decoration.filled to true on widget level. '
                      "Use it to see Flutter's default filled style when "
                      'no custom theme is used. This switch does nothing '
                      'when a custom InputDecoration theme is active.'),
                  enabled: isDefaultDecoration,
                  allowRevealWhenDisabled: true,
                  value: _forceFilled,
                  onChanged: (bool value) {
                    setState(() {
                      _forceFilled = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: SwitchListTileReveal(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                  dense: true,
                  shape: _tileShape,
                  title: const Text('Outlined'),
                  subtitleReveal: const Text('This is not a theme toggle. It '
                      'sets border to the default OutlineInputBorder() on '
                      "widget level. Use it to see Flutter's default outlined "
                      'style when no custom theme is used. This switch does '
                      'nothing when a custom InputDecoration theme is active.'),
                  enabled: isDefaultDecoration,
                  allowRevealWhenDisabled: true,
                  value: _forceOutlined,
                  onChanged: (bool value) {
                    setState(() {
                      _forceOutlined = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppBarShowcase extends StatelessWidget {
  const AppBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Column(
          spacing: 8,
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
                  title: const Text('AppBar'),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            // A bit nasty usage of CustomScrollViews and Slivers and
            // shrinkWraps, to show what the SliverAppBars look like, don't
            // do this in a production app. With just a few widgets,
            // we can get away with it.
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
                    ),
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
                    ),
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
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BehindAppBar extends StatelessWidget {
  const _BehindAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          const Text('Behind AppBar'),
          const CircleAvatar(child: Text('AV')),
          InputChip(
            showCheckmark: true,
            selected: true,
            label: const Text('Chip check'),
            onSelected: (bool value) {},
          ),
        ],
      ),
    );
  }
}

class SearchBarShowcase extends StatefulWidget {
  const SearchBarShowcase({
    super.key,
    this.explain = false,
    this.isFullScreen = false,
  });
  final bool explain;
  final bool isFullScreen;

  @override
  State<SearchBarShowcase> createState() => _SearchBarShowcaseState();
}

class _SearchBarShowcaseState extends State<SearchBarShowcase> {
  bool isMicOn = false;
  String? selectedColor;
  List<_ColorItem> searchHistory = <_ColorItem>[];

  Iterable<Widget> getHistoryList(SearchController controller) {
    return searchHistory.map(
      (_ColorItem color) => ListTile(
        leading: const Icon(Icons.history),
        title: Text(color.label),
        trailing: IconButton(
          icon: const Icon(Icons.call_missed),
          onPressed: () {
            controller.text = color.label;
            controller.selection =
                TextSelection.collapsed(offset: controller.text.length);
          },
        ),
        onTap: () {
          controller.closeView(color.label);
          handleSelection(color);
        },
      ),
    );
  }

  Iterable<Widget> getSuggestions(SearchController controller) {
    final String input = controller.value.text;
    return _ColorItem.values
        .where((_ColorItem color) => color.label.contains(input))
        .map(
          (_ColorItem filteredColor) => ListTile(
            leading: CircleAvatar(backgroundColor: filteredColor.color),
            title: Text(filteredColor.label),
            trailing: IconButton(
              icon: const Icon(Icons.call_missed),
              onPressed: () {
                controller.text = filteredColor.label;
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
              },
            ),
            onTap: () {
              controller.closeView(filteredColor.label);
              handleSelection(filteredColor);
            },
          ),
        );
  }

  void handleSelection(_ColorItem color) {
    setState(() {
      selectedColor = color.label;
      if (searchHistory.length >= 5) {
        searchHistory.removeLast();
      }
      searchHistory.insert(0, color);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.explain) ...<Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                'SearchBar',
                style: denseHeader,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text(
                'The M3 SearchBar can in some use cases be used instead '
                'of an AppBar or BottomAppBar.',
                style: denseBody,
              ),
            ),
          ],
          SearchAnchor.bar(
            isFullScreen: widget.isFullScreen,
            barHintText: 'Search colors',
            barTrailing: <Widget>[
              Tooltip(
                message: 'Voice search',
                child: IconButton(
                  isSelected: isMicOn,
                  onPressed: () {
                    setState(() {
                      isMicOn = !isMicOn;
                    });
                  },
                  icon: const Icon(Icons.mic_off),
                  selectedIcon: const Icon(Icons.mic),
                ),
              ),
            ],
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              if (controller.text.isEmpty) {
                if (searchHistory.isNotEmpty) {
                  return getHistoryList(controller);
                }
                return <Widget>[
                  const Center(
                    child: Text('No search history.',
                        style: TextStyle(color: Colors.grey)),
                  ),
                ];
              }
              return getSuggestions(controller);
            },
          ),
          const SizedBox(height: 20),
          if (selectedColor == null)
            const Text('Select a color')
          else
            Text('Last selected color is $selectedColor'),
        ],
      ),
    );
  }
}

enum _ColorItem {
  red('red', Colors.red),
  orange('orange', Colors.orange),
  yellow('yellow', Colors.yellow),
  green('green', Colors.green),
  blue('blue', Colors.blue),
  indigo('indigo', Colors.indigo),
  violet('violet', Color(0xFF8F00FF)),
  purple('purple', Colors.purple),
  pink('pink', Colors.pink),
  silver('silver', Color(0xFF808080)),
  gold('gold', Color(0xFFFFD700)),
  beige('beige', Color(0xFFF5F5DC)),
  brown('brown', Colors.brown),
  grey('grey', Colors.grey),
  black('black', Colors.black),
  peach('peach', Color(0xFFFFE5B4)),
  cream('cream', Color(0xFFFFFDD0)),
  aquamarine('aquamarine', Color(0xFF7FFFD4)),
  seagull('seagull', Color(0xFF80CCEA)),
  redDevil('red devil', Color(0xFF860111)),
  blueStone('blue stone', Color(0xFF016162)),
  cerulean('cerulean', Color(0xFF02A4D3)),
  tangaroa('tangaroa', Color(0xFF03163C)),
  zuccini('zuccini', Color(0xFF044022)),
  firefly('firefly', Color(0xFF0E2A30)),
  java('java', Color(0xFF1FC2C2)),
  graphite('graphite', Color(0xFF251607)),
  mariner('mariner', Color(0xFF286ACD)),
  aubergine('aubergine', Color(0xFF3B0910)),
  horizon('horizon', Color(0xFF5A87A0)),
  bordeaux('bordeaux', Color(0xFF5C0120)),
  redwood('redwood', Color(0xFF5D1E0F)),
  espresso('espresso', Color(0xFF612718)),
  eggplant('eggplant', Color(0xFF614051)),
  walnut('walnut', Color(0xFF773F1A)),
  maroon('maroon', Color(0xFF800000)),
  faluRed('falu red', Color(0xFF801818)),
  amethyst('amethyst', Color(0xFF9966CC)),
  sage('sage', Color(0xFF9EA587)),
  rouge('rouge', Color(0xFFA23B6C)),
  fire('fire', Color(0xFFAA4203)),
  lipstick('lipstick', Color(0xFFAB0563)),
  bronco('bronco', Color(0xFFABA196)),
  cadillac('cadillac', Color(0xFFB04C6A)),
  padua('padua', Color(0xFFADE6C4)),
  desert('desert', Color(0xFFAE6020)),
  bouquet('bouquet', Color(0xFFAE809E)),
  hippiePink('hippie pink', Color(0xFFAE4560)),
  hibiscus('hibiscus', Color(0xFFB6316C)),
  rust('rust', Color(0xFFB7410E)),
  sahara('sahara', Color(0xFFB7A214)),
  bourbon('bourbon', Color(0xFFBA6F1E)),
  grenadier('grenadier', Color(0xFFD54600)),
  white('white', Colors.white);

  const _ColorItem(this.label, this.color);
  final String label;
  final Color color;
}

class TabBarForAppBarShowcase extends StatelessWidget {
  const TabBarForAppBarShowcase({super.key, this.explain = false});
  final bool explain;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool useM3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;

    final Color effectiveTabBackground = theme.appBarTheme.backgroundColor ??
        (isDark
            ? colorScheme.surface
            : useM3
                ? colorScheme.surface
                : colorScheme.primary);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (explain) ...<Widget>[
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
                  'If the TabBar is used in an AppBar, then try style '
                  'FlexTabBarStyle forAppBar, it will fit contrast wise '
                  'here regardless of selected AppBar background color.',
                  style: denseBody,
                ),
              ),
            ],
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              removeTop: true,
              child: Material(
                color: effectiveTabBackground,
                child: SizedBox(
                  height: 130,
                  child: AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                    title: const Text('TabBar in AppBar'),
                    bottom: TabBar(
                      tabAlignment: theme.tabBarTheme.tabAlignment ==
                                  TabAlignment.start ||
                              theme.tabBarTheme.tabAlignment ==
                                  TabAlignment.startOffset
                          ? TabAlignment.fill
                          : null,
                      tabs: const <Widget>[
                        Tab(
                          text: 'Chat',
                          icon: Badge(
                            label: Text('18'),
                            child: Icon(Icons.chat_bubble),
                          ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarScrollingForAppBarShowcase extends StatelessWidget {
  const TabBarScrollingForAppBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool useM3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;
    const int nrOfTabs = 40;

    final Color effectiveTabBackground = theme.appBarTheme.backgroundColor ??
        (isDark
            ? colorScheme.surface
            : useM3
                ? colorScheme.surface
                : colorScheme.primary);

    return RepaintBoundary(
      child: DefaultTabController(
        length: nrOfTabs,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              removeTop: true,
              child: Material(
                color: effectiveTabBackground,
                child: SizedBox(
                  height: 100,
                  child: AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                    title: const Text('Scrolling TabBar in AppBar'),
                    bottom: TabBar(
                      isScrollable: true,
                      tabAlignment:
                          theme.tabBarTheme.tabAlignment == TabAlignment.fill
                              ? useM3
                                  ? TabAlignment.startOffset
                                  : TabAlignment.center
                              : null,
                      tabs: <Widget>[
                        for (int i = 0; i < nrOfTabs; i++)
                          useM3
                              ? Tab(text: 'Tab label ${i + 1}')
                              : Tab(text: 'TAB LABEL ${i + 1}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarForBackgroundShowcase extends StatelessWidget {
  const TabBarForBackgroundShowcase({super.key, this.explain = false});
  final bool explain;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (explain) ...<Widget>[
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
                  'If TabBar is used on surface colors, consider style '
                  'FlexTabBarStyle forBackground.',
                  style: denseBody,
                ),
              ),
            ],
            Material(
              color: theme.colorScheme.surface,
              child: SizedBox(
                height: 70,
                child: TabBar(
                  tabAlignment:
                      theme.tabBarTheme.tabAlignment == TabAlignment.start ||
                              theme.tabBarTheme.tabAlignment ==
                                  TabAlignment.startOffset
                          ? TabAlignment.fill
                          : null,
                  tabs: const <Widget>[
                    Tab(
                      text: 'Chat',
                      icon: Badge(
                        label: Text('+99'),
                        child: Icon(Icons.chat_bubble),
                      ),
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
      ),
    );
  }
}

class BottomAppBarShowcase extends StatelessWidget {
  const BottomAppBarShowcase({super.key, this.explain = false});

  final bool explain;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (explain) ...<Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text('BottomAppBar', style: denseHeader)),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  'Typically used as a command bar at the bottom of the '
                  'screen. Flutter M2 past default color was '
                  'ThemeData.bottomAppBarColor. It was deprecated in '
                  'Flutter 3.7. New M2 default is colorScheme.surface and '
                  'elevation 8. In M3 it defaults to colorScheme.surface '
                  'color, elevation 3, no shadow, but with surface '
                  'elevation tint.',
                  style: denseBody,
                ),
              ),
            ],
            BottomAppBar(
              child: Row(
                children: <Widget>[
                  IconButton(
                    tooltip: 'Open navigation menu',
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Search',
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    tooltip: 'Favorite',
                    icon: const Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarShowcase extends StatefulWidget {
  const BottomNavigationBarShowcase({super.key, this.explain = false});

  final bool explain;

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
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.explain) ...<Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                'BottomNavigationBar',
                style: denseHeader,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Older Material 2 navigation bar, prefer using NavigationBar. '
                'Flutter default background '
                'color is theme canvasColor via Material. The canvasColor '
                'typically equals colorScheme.background. Default elevation '
                'is 8. FCS sub-theme default is colorScheme.background '
                'and elevation 0.',
                style: denseBody,
              ),
            ),
          ],
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
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
                    ],
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
                      icon: Badge(
                        label: Text('3'),
                        child: Icon(Icons.chat_bubble),
                      ),
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
        ],
      ),
    );
  }
}

class NavigationBarShowcase extends StatefulWidget {
  const NavigationBarShowcase({super.key, this.explain = false});
  final bool explain;

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
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.explain) ...<Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                'NavigationBar',
                style: denseHeader,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Material 3 navigation bar. Default background color is '
                'surface with an onSurface overlay '
                'color in M2, and primary in M3, with elevation 3. '
                'FCS default is color scheme background, with used '
                'surface blend and elevation 0.',
                style: denseBody,
              ),
            ),
          ],
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
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
                    ],
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationRailShowcase extends StatefulWidget {
  const NavigationRailShowcase({
    super.key,
    this.child,
    this.height = 350,
    this.explain = false,
  });

  /// A child widget that we can use to place controls on the
  /// side of the NavigationRail in the show case widget.
  final Widget? child;

  /// The vertical space for the navigation bar.
  final double height;

  final bool explain;

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

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'NavigationRail',
                style: denseHeader,
              ),
            ),
          if (widget.explain)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Flutter default background color is colorScheme.surface. '
                'FlexColorScheme sub-theme default is colorScheme.background.',
                style: denseBody,
              ),
            ),
          const SizedBox(height: 8),
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
                maxHeight: 850,
                child: Row(
                  children: <Widget>[
                    MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      removeTop: true,
                      child: NavigationRail(
                        extended: isExtended,
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
                            icon: Badge(
                              label: Text('5'),
                              child: Icon(Icons.chat_bubble),
                            ),
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
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          SwitchListTileReveal(
                            title: const Text('Expanded'),
                            subtitleReveal:
                                const Text('ON to expand  OFF to collapse\n'
                                    'Only used for local control of Rail '
                                    'presentation.'),
                            value: isExtended,
                            onChanged: (bool value) {
                              setState(() {
                                isExtended = value;
                              });
                            },
                          ),
                          if (widget.child != null)
                            RepaintBoundary(child: widget.child)
                          else
                            const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuBarShowcase extends StatelessWidget {
  const MenuBarShowcase({
    super.key,
    this.explain = false,
    this.explainIndent = 0,
  });
  final bool explain;
  final double explainIndent;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.keyT, control: true):
            VoidCallbackIntent(debugDumpApp),
      },
      child: Column(
        spacing: 0,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          if (explain)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(explainIndent, 16, 0, 0),
              child: Text(
                'MenuBar',
                style: denseHeader,
              ),
            ),
          if (explain)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(explainIndent, 0, 0, 8),
              child: Text(
                'The M3 menus can be used in a MenuBar via SubMenuButton '
                'and its MenuItemButton, but they can also be used in a '
                'MenuAnchor anywhere.',
                style: denseBody,
              ),
            ),
          Row(
            children: <Widget>[
              Expanded(
                child: MenuBar(
                  children: <Widget>[
                    SubmenuButton(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: () {
                            showAboutDialog(
                              context: context,
                              useRootNavigator: false,
                              applicationName: 'MenuBar Demo',
                              applicationVersion: '1.0.0',
                            );
                          },
                          child: const MenuAcceleratorLabel('&About'),
                        ),
                        SubmenuButton(
                          menuChildren: <Widget>[
                            MenuItemButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Saved!'),
                                  ),
                                );
                              },
                              child: const MenuAcceleratorLabel('&Save now'),
                            ),
                            MenuItemButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Load!'),
                                  ),
                                );
                              },
                              child: const MenuAcceleratorLabel('&Load now'),
                            ),
                          ],
                          child: const Text('File'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Quit!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Quit'),
                        ),
                      ],
                      child: const MenuAcceleratorLabel('&File'),
                    ),
                    SubmenuButton(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Bold!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Bold'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Italic!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Italic'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Underline!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Underline'),
                        ),
                      ],
                      child: const MenuAcceleratorLabel('&Style'),
                    ),
                    SubmenuButton(
                      menuChildren: <Widget>[
                        const MenuItemButton(
                          onPressed: null,
                          child: MenuAcceleratorLabel('&Disabled item'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Minify!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('Mi&nify'),
                        ),
                      ],
                      child: const MenuAcceleratorLabel('&View'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuAnchorShowcase extends StatelessWidget {
  const MenuAnchorShowcase({super.key, this.explain = false});
  final bool explain;

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
        if (explain) ...<Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'MenuAnchor',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              'The M3 MenuAnchor used on a Container as a context menu.',
              style: denseBody,
            ),
          ),
        ],
        const Row(
          children: <Widget>[
            Expanded(
              child: MenuAnchorContextMenu(
                message: 'The M3 MenuAnchor is cool!',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// An enhanced enum to define the available menus and their shortcuts.
///
/// Using an enum for menu definition is not required, but this illustrates how
/// they could be used for simple menu systems.
enum MenuEntry {
  about('About'),
  showMessage(
      'Show Message', SingleActivator(LogicalKeyboardKey.keyS, control: true)),
  hideMessage(
      'Hide Message', SingleActivator(LogicalKeyboardKey.keyH, control: true)),
  colorMenu('Color Menu'),
  colorRed('Red', SingleActivator(LogicalKeyboardKey.keyR, control: true)),
  colorGreen('Green', SingleActivator(LogicalKeyboardKey.keyG, control: true)),
  colorBlue('Blue', SingleActivator(LogicalKeyboardKey.keyB, control: true));

  const MenuEntry(this.label, [this.shortcut]);
  final String label;
  final MenuSerializableShortcut? shortcut;
}

class MenuAnchorContextMenu extends StatefulWidget {
  const MenuAnchorContextMenu({super.key, required this.message});

  final String message;

  @override
  State<MenuAnchorContextMenu> createState() => _MenuAnchorContextMenuState();
}

class _MenuAnchorContextMenuState extends State<MenuAnchorContextMenu> {
  MenuEntry? _lastSelection;
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  // ignore: dispose-fields, false positive, the menu controller has no dispose method.
  final MenuController _menuController = MenuController();
  ShortcutRegistryEntry? _shortcutsEntry;
  bool get showingMessage => _showingMessage;
  bool _showingMessage = false;
  set showingMessage(bool value) {
    if (_showingMessage != value) {
      setState(() {
        _showingMessage = value;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Dispose of any previously registered shortcuts, since they are about to
    // be replaced.
    _shortcutsEntry?.dispose();
    // Collect the shortcuts from the different menu selections so that they can
    // be registered to apply to the entire app. Menus don't register their
    // shortcuts, they only display the shortcut hint text.
    // ignore: move-variable-closer-to-its-usage, false positive, used right after this!!
    final Map<ShortcutActivator, Intent> shortcuts =
        <ShortcutActivator, Intent>{
      for (final MenuEntry item in MenuEntry.values)
        if (item.shortcut != null)
          item.shortcut!: VoidCallbackIntent(() => _activate(item)),
    };
    // Register the shortcuts with the ShortcutRegistry so that they are
    // available to the entire application.
    final Map<ShortcutActivator, Intent>? entries =
        ShortcutRegistry.maybeOf(context)?.shortcuts;
    // TODO(rydmike): Potential issue with ShortcutRegistry? Investigate.
    // Workaround to avoid issue of entries being added multiple times, the
    // dispose of them does not seem to work all the time. This widget is in
    // this app potentially shown in many places, the only shortcut entries we
    // should have are the same ones, if it exists and has not been disposed
    // when this is called we can add it, if it exists it is the one we want
    // already. We could also check for the specific entries, but for this case
    // this workaround is enough.
    // The ShortcutRegistry is perhaps intended to be used as one global
    // setting in the app, it should be higher up in the tree, then we would
    // not have this issue, still dispose and create new ones should work.
    if (entries?.isEmpty ?? false) {
      _shortcutsEntry = ShortcutRegistry.of(context).addAll(shortcuts);
    }
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTapDown: _handleTapDown,
      child: MenuAnchor(
        controller: _menuController,
        consumeOutsideTap: true,
        menuChildren: <Widget>[
          MenuItemButton(
            child: Text(MenuEntry.about.label),
            onPressed: () => _activate(MenuEntry.about),
          ),
          const MenuItemButton(
            child: Text('Disabled item'),
          ),
          if (_showingMessage)
            MenuItemButton(
              onPressed: () => _activate(MenuEntry.hideMessage),
              shortcut: MenuEntry.hideMessage.shortcut,
              child: Text(MenuEntry.hideMessage.label),
            ),
          if (!_showingMessage)
            MenuItemButton(
              onPressed: () => _activate(MenuEntry.showMessage),
              shortcut: MenuEntry.showMessage.shortcut,
              child: Text(MenuEntry.showMessage.label),
            ),
          SubmenuButton(
            menuChildren: <Widget>[
              MenuItemButton(
                onPressed: () => _activate(MenuEntry.colorRed),
                shortcut: MenuEntry.colorRed.shortcut,
                child: Text(MenuEntry.colorRed.label),
              ),
              MenuItemButton(
                onPressed: () => _activate(MenuEntry.colorGreen),
                shortcut: MenuEntry.colorGreen.shortcut,
                child: Text(MenuEntry.colorGreen.label),
              ),
              MenuItemButton(
                onPressed: () => _activate(MenuEntry.colorBlue),
                shortcut: MenuEntry.colorBlue.shortcut,
                child: Text(MenuEntry.colorBlue.label),
              ),
            ],
            child: const Text('Color'),
          ),
        ],
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Click anywhere on this container to show the '
                  'MenuAnchor context menu.',
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Menu keyboard shortcuts also work.',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    showingMessage ? widget.message : '',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  _lastSelection != null
                      ? 'Last Selected: ${_lastSelection!.label}'
                      : '',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _activate(MenuEntry selection) {
    setState(() {
      _lastSelection = selection;
    });
    switch (selection) {
      case MenuEntry.about:
        showAboutDialog(
          context: context,
          useRootNavigator: false,
          applicationName: 'MenuAnchor Demo',
          applicationVersion: '1.0.0',
        );
      case MenuEntry.showMessage:
      case MenuEntry.hideMessage:
        showingMessage = !showingMessage;
      case MenuEntry.colorMenu:
      case MenuEntry.colorRed:
      case MenuEntry.colorGreen:
      case MenuEntry.colorBlue:
    }
  }

  void _handleTapDown(TapDownDetails details) {
    // If you want control CLICK for context menu, uncomment this.
    // if (!HardwareKeyboard.instance.logicalKeysPressed
    //         .contains(LogicalKeyboardKey.controlLeft) &&
    //     !HardwareKeyboard.instance.logicalKeysPressed
    //         .contains(LogicalKeyboardKey.controlRight)) {
    //   return;
    // }
    _menuController.open(position: details.localPosition);
  }
}

class DrawerShowcase extends StatelessWidget {
  const DrawerShowcase({super.key, this.explain = false});
  final bool explain;

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
        if (explain) ...<Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Drawer',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              'Default Flutter background color in M3 is colorScheme.surface, '
              'with elevation tint and no shadow. In M2 it has shadow and '
              'uses color theme.canvasColor, that is typically set '
              'to colorScheme.background.',
              style: denseBody,
            ),
          ),
        ],
        SizedBox(
          height: 280,
          child: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            child: const Drawer(
              child: Center(
                child: Text('Drawer'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationDrawerShowcase extends StatefulWidget {
  const NavigationDrawerShowcase({super.key, this.explain = false});

  final bool explain;

  @override
  State<NavigationDrawerShowcase> createState() =>
      _NavigationDrawerShowcaseState();
}

class _NavigationDrawerShowcaseState extends State<NavigationDrawerShowcase> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (widget.explain) ...<Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'NavigationDrawer',
                style: denseHeader,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Default Flutter background color is colorScheme.surface, '
                'with addition of elevation tint in Material 3 mode.',
                style: denseBody,
              ),
            ),
          ],
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            removeLeft: true,
            removeRight: true,
            child: SizedBox(
              height: 280,
              child: NavigationDrawer(
                selectedIndex: selectedIndex,
                onDestinationSelected: (int value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                children: const <Widget>[
                  SizedBox(height: 16),
                  NavigationDrawerDestination(
                    icon: Badge(
                      label: Text('26'),
                      child: Icon(Icons.chat_bubble),
                    ),
                    label: Text('Chat'),
                  ),
                  NavigationDrawerDestination(
                    icon: Icon(Icons.beenhere),
                    label: Text('Tasks'),
                  ),
                  Divider(),
                  NavigationDrawerDestination(
                    icon: Icon(Icons.create_new_folder),
                    label: Text('Folder'),
                  ),
                  NavigationDrawerDestination(
                    icon: Icon(Icons.logout),
                    label: Text('Logout'),
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

class ListTileShowcase extends StatefulWidget {
  const ListTileShowcase({super.key});

  @override
  State<ListTileShowcase> createState() => _ListTileShowcaseState();
}

class _ListTileShowcaseState extends State<ListTileShowcase> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            selected: !selected,
            leading: const Icon(Icons.info),
            title: const Text('ListTile'),
            subtitle: selected
                ? const Text('Selected list tile')
                : const Text('Normal list tile'),
            trailing: const Text('Trailing'),
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('ListTile selected'),
            subtitle: selected
                ? const Text('Selected list tile')
                : const Text('Normal list tile'),
            trailing: const Text('Trailing'),
            selected: selected,
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
          ),
          ListTile(
            enabled: false,
            leading: const Icon(Icons.info),
            title: const Text('ListTile disabled'),
            subtitle: const Text('Disabled list tile'),
            trailing: const Text('Trailing'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SwitchListTileShowcase extends StatefulWidget {
  const SwitchListTileShowcase({super.key});

  @override
  State<SwitchListTileShowcase> createState() => _SwitchListTileShowcaseState();
}

class _SwitchListTileShowcaseState extends State<SwitchListTileShowcase> {
  bool isSwitchOneOn = true;
  bool isSwitchTwoOn = false;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            secondary: const Icon(Icons.info),
            title: const Text('SwitchListTile'),
            subtitle: isSwitchOneOn
                ? const Text('The switch list tile is ON')
                : const Text('The switch list tile is OFF'),
            value: isSwitchOneOn,
            onChanged: (bool value) {
              setState(() {
                isSwitchOneOn = value;
              });
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.info),
            title: const Text('SwitchListTile'),
            subtitle: isSwitchTwoOn
                ? const Text('The switch list tile is ON')
                : const Text('The switch list tile is OFF'),
            value: isSwitchTwoOn,
            onChanged: (bool value) {
              setState(() {
                isSwitchTwoOn = value;
              });
            },
          ),
          const SwitchListTile(
            secondary: Icon(Icons.info),
            title: Text('SwitchListTile disabled'),
            subtitle: Text('The switch list tile is ON'),
            value: true,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class CheckboxListTileShowcase extends StatefulWidget {
  const CheckboxListTileShowcase({super.key});

  @override
  State<CheckboxListTileShowcase> createState() =>
      _CheckboxListTileShowcaseState();
}

class _CheckboxListTileShowcaseState extends State<CheckboxListTileShowcase> {
  bool isCheckOneOn = false;
  bool isCheckTwoOn = true;
  bool? isCheckThreeOn;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          CheckboxListTile(
            secondary: const Icon(Icons.info),
            title: const Text('CheckboxListTile'),
            subtitle: isCheckOneOn
                ? const Text('The checkbox list tile is checked')
                : const Text('The checkbox list tile is unchecked'),
            value: isCheckOneOn,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  isCheckOneOn = value;
                });
              }
            },
          ),
          CheckboxListTile(
            secondary: const Icon(Icons.info),
            title: const Text('CheckboxListTile'),
            subtitle: isCheckTwoOn
                ? const Text('The checkbox list tile is checked')
                : const Text('The checkbox list tile is unchecked'),
            value: isCheckTwoOn,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  isCheckTwoOn = value;
                });
              }
            },
          ),
          CheckboxListTile(
            secondary: const Icon(Icons.info),
            title: const Text('CheckboxListTile'),
            subtitle: isCheckThreeOn == null
                ? const Text('The checkbox list tile is null in tristate')
                : isCheckThreeOn!
                    ? const Text('The checkbox list tile is checked')
                    : const Text('The checkbox list tile is unchecked'),
            tristate: true,
            value: isCheckThreeOn,
            onChanged: (bool? value) {
              setState(() {
                isCheckThreeOn = value;
              });
            },
          ),
          const CheckboxListTile(
            enabled: false,
            secondary: Icon(Icons.info),
            title: Text('CheckboxListTile disabled'),
            subtitle: Text('The checkbox list tile is checked'),
            value: true,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class RadioListTileShowcase extends StatefulWidget {
  const RadioListTileShowcase({super.key});

  @override
  State<RadioListTileShowcase> createState() => _RadioListTileShowcaseState();
}

class _RadioListTileShowcaseState extends State<RadioListTileShowcase> {
  int value = 2;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: const Text('RadioListTile'),
            subtitle: value == 1
                ? const Text('The radio option is selected')
                : const Text('The radio option is unselected'),
            value: 1,
            groupValue: value,
            onChanged: (int? val) {
              if (val != null) {
                setState(() {
                  value = val;
                });
              }
            },
          ),
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: const Text('RadioListTile'),
            subtitle: value == 2
                ? const Text('The radio option is selected')
                : const Text('The radio option is unselected'),
            value: 2,
            groupValue: value,
            onChanged: (int? val) {
              if (val != null) {
                setState(() {
                  value = val;
                });
              }
            },
          ),
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: const Text('RadioListTile'),
            subtitle: value == 3
                ? const Text('The radio option and list tile is selected')
                : const Text('The radio option is unselected'),
            value: 3,
            groupValue: value,
            selected: value == 3,
            onChanged: (int? val) {
              if (val != null) {
                setState(() {
                  value = val;
                });
              }
            },
          ),
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: const Text('RadioListTile disabled'),
            subtitle: const Text('The radio option is unselected and disabled'),
            value: 4,
            groupValue: value,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class ExpansionTileShowcase extends StatefulWidget {
  const ExpansionTileShowcase({super.key});

  @override
  State<ExpansionTileShowcase> createState() => _ExpansionTileShowcaseState();
}

class _ExpansionTileShowcaseState extends State<ExpansionTileShowcase> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          const ExpansionTile(
            title: Text('ExpansionTile 1'),
            subtitle: Text('Trailing expansion arrow icon'),
            children: <Widget>[
              ListTile(title: Text('This is tile number 1')),
            ],
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
          const ExpansionTile(
            title: Text('ExpansionTile 3'),
            subtitle: Text('Leading expansion arrow icon'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              ListTile(title: Text('This is tile number 3')),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpansionPanelListShowcase extends StatefulWidget {
  const ExpansionPanelListShowcase({super.key});

  @override
  State<ExpansionPanelListShowcase> createState() =>
      _ExpansionPanelListShowcaseState();
}

class _ExpansionPanelListShowcaseState
    extends State<ExpansionPanelListShowcase> {
  final List<ExpansionPanelShowcaseItems> _items =
      ExpansionPanelShowcaseItems.generateItems(6);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _items[index].isExpanded = isExpanded;
          });
        },
        children:
            _items.map<ExpansionPanel>((ExpansionPanelShowcaseItems item) {
          return ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle: item.id > 2
                  ? const Text('To delete this panel, tap the trash can icon')
                  : const Text(
                      'This panel is fixed here and cannot be removed. Items '
                      'numbered 3 and higher can be removed.'),
              trailing: item.id > 2
                  ? IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _items.removeWhere(
                              (ExpansionPanelShowcaseItems currentItem) =>
                                  item == currentItem);
                        });
                      },
                    )
                  : null,
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}

// Stores ExpansionPanel state information
class ExpansionPanelShowcaseItems {
  ExpansionPanelShowcaseItems({
    required this.id,
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  final int id;
  final String expandedValue;
  final String headerValue;
  bool isExpanded;

  static List<ExpansionPanelShowcaseItems> generateItems(int numberOfItems) {
    return List<ExpansionPanelShowcaseItems>.generate(numberOfItems,
        (int index) {
      return ExpansionPanelShowcaseItems(
        id: index,
        headerValue: 'ExpansionPanelList tile $index',
        expandedValue: 'This is ExpansionPanel item number $index',
      );
    });
  }
}

class AlertDialogShowcase extends StatelessWidget {
  const AlertDialogShowcase({super.key});

  Future<void> _openDialog(BuildContext context,
      [bool adaptive = false]) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => adaptive
          ? const _AlertDialogAdaptiveExample()
          : const _AlertDialogExample(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const AbsorbPointer(child: _AlertDialogExample()),
        const AbsorbPointer(child: _AlertDialogAdaptiveExample()),
        Wrap(
          children: <Widget>[
            TextButton(
              child: const Text(
                'Show AlertDialog',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                await _openDialog(context, false);
              },
            ),
            TextButton(
              child: const Text(
                'Show adaptive AlertDialog',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                await _openDialog(context, true);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _AlertDialogExample extends StatelessWidget {
  const _AlertDialogExample();

  @override
  Widget build(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final String cancel = useMaterial3 ? 'Cancel' : 'CANCEL';
    final String allow = useMaterial3 ? 'Allow' : 'ALLOW';

    return AlertDialog(
      title: const Text('Allow location services'),
      content: const Text('Let us help determine location. This means '
          'sending anonymous location data to us'),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.of(context).pop(), child: Text(cancel)),
        TextButton(
            onPressed: () => Navigator.of(context).pop(), child: Text(allow)),
      ],
    );
  }
}

class _AlertDialogAdaptiveExample extends StatelessWidget {
  const _AlertDialogAdaptiveExample();

  Widget adaptiveAction(
      {required BuildContext context,
      required VoidCallback onPressed,
      required Widget child}) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final String cancel = useMaterial3 ? 'Cancel' : 'CANCEL';
    final String allow = useMaterial3 ? 'Allow' : 'ALLOW';

    return AlertDialog.adaptive(
      title: const Text('Allow location services'),
      content: const Text('Let us help determine location. This means '
          'sending anonymous location data to us'),
      actions: <Widget>[
        // ignore: avoid-returning-widgets, perfectly valid use case here.
        adaptiveAction(
            context: context,
            onPressed: () => Navigator.of(context).pop(),
            child: Text(cancel)),
        // ignore: avoid-returning-widgets, perfectly valid use case here.
        adaptiveAction(
            context: context,
            onPressed: () => Navigator.of(context).pop(),
            child: Text(allow)),
      ],
    );
  }
}

class TimePickerDialogShowcase extends StatelessWidget {
  const TimePickerDialogShowcase({super.key});

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => TimePickerDialog(
        initialTime: TimeOfDay.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AbsorbPointer(
          child: TimePickerDialog(
            initialTime: TimeOfDay.now(),
          ),
        ),
        TextButton(
          child: const Text(
            'Show TimePickerDialog',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            await _openDialog(context);
          },
        ),
      ],
    );
  }
}

class DatePickerDialogShowcase extends StatelessWidget {
  const DatePickerDialogShowcase({super.key});

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2050),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AbsorbPointer(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: DatePickerDialog(
              initialDate: DateTime.now(),
              firstDate: DateTime(1930),
              lastDate: DateTime(2050),
            ),
          ),
        ),
        TextButton(
          child: const Text(
            'Show DatePickerDialog',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            await _openDialog(context);
          },
        ),
      ],
    );
  }
}

class BottomSheetShowcase extends StatelessWidget {
  const BottomSheetShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AbsorbPointer(
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
                  'BottomSheet',
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  'In M2 Flutter uses Material of type canvas, resulting in\n'
                  'color surface. In M3 Flutter uses surfaceContainerLow.\n'
                  'FCS defaults to surfaceContainerLow in both modes.',
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetModalShowcase extends StatelessWidget {
  const BottomSheetModalShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AbsorbPointer(
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
                  'Modal BottomSheet',
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  'In M2 Flutter uses Material of type canvas, resulting in\n'
                  'color surface. In M3 Flutter uses surfaceContainerLow.\n'
                  'FCS defaults to surfaceContainerLow in both modes.',
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MaterialBannerSnackBarShowcase extends StatelessWidget {
  const MaterialBannerSnackBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SnackBarShowcase(),
        MaterialBannerShowcase(),
      ],
    );
  }
}

class SnackBarShowcase extends StatefulWidget {
  const SnackBarShowcase({super.key});

  @override
  State<SnackBarShowcase> createState() => _SnackBarShowcaseState();
}

class _SnackBarShowcaseState extends State<SnackBarShowcase> {
  int fixedCount = 0;
  int pinnedCount = 0;

  void _showDemoSnackBar(
      BuildContext context, SnackBarBehavior style, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: style,
        showCloseIcon: true,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
        duration: const Duration(milliseconds: 3000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;

    final Color defaultBackgroundColor = isLight
        ? useMaterial3
            ? colorScheme.inverseSurface
            : Color.alphaBlend(colorScheme.onSurface.withValues(alpha: 0.80),
                colorScheme.surface)
        : colorScheme.onSurface;
    final Color snackBackground =
        theme.snackBarTheme.backgroundColor ?? defaultBackgroundColor;

    final Color snackForeground =
        ThemeData.estimateBrightnessForColor(snackBackground) ==
                Brightness.light
            ? Colors.black
            : Colors.white;

    final Color defaultActionColor =
        useMaterial3 ? colorScheme.inversePrimary : colorScheme.secondary;
    final Color snackActionColor =
        theme.snackBarTheme.actionTextColor ?? defaultActionColor;

    final TextStyle snackStyle = theme.snackBarTheme.contentTextStyle ??
        ThemeData(brightness: Brightness.light)
            .textTheme
            .titleMedium!
            .copyWith(color: snackForeground);
    final TextStyle snackActionStyle = theme.snackBarTheme.contentTextStyle
            ?.copyWith(color: snackActionColor) ??
        ThemeData(brightness: Brightness.light)
            .textTheme
            .titleMedium!
            .copyWith(color: snackActionColor);
    final double snackElevation = theme.snackBarTheme.elevation ?? 6;

    final ShapeBorder? shape = theme.snackBarTheme.shape;

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Material(
              color: snackBackground,
              elevation: snackElevation,
              shadowColor: colorScheme.shadow,
              shape: shape ??
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
              child: SizedBox(
                height: 46,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 24),
                      Text('A floating SnackBar', style: snackStyle),
                      const Spacer(),
                      Text('Undo', style: snackActionStyle),
                      const SizedBox(width: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              child: const Text(
                'Show floating SnackBar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                pinnedCount++;
                _showDemoSnackBar(context, SnackBarBehavior.floating,
                    'A floating SnackBar ($pinnedCount)');
              },
            ),
          ),
          const SizedBox(height: 16),
          Material(
            color: snackBackground,
            elevation: snackElevation,
            shadowColor: colorScheme.shadow,
            shape: shape,
            child: SizedBox(
              height: 46,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 24),
                    Text('A fixed SnackBar', style: snackStyle),
                    const Spacer(),
                    Text('Undo', style: snackActionStyle),
                    const SizedBox(width: 24),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              child: const Text(
                'Show fixed SnackBar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                fixedCount++;
                _showDemoSnackBar(context, SnackBarBehavior.fixed,
                    'A fixed SnackBar ($fixedCount)');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialBannerShowcase extends StatefulWidget {
  const MaterialBannerShowcase({super.key, this.enableShowBanner = false});

  final bool enableShowBanner;

  @override
  State<MaterialBannerShowcase> createState() => _MaterialBannerShowcaseState();
}

class _MaterialBannerShowcaseState extends State<MaterialBannerShowcase> {
  int showCount = 0;

  void _showDemoMaterialBanner(
      BuildContext context, bool twoButtons, String message) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        // elevation: 3,
        content: Text(message),
        leading: const Icon(Icons.add_alert),
        actions: <Widget>[
          if (twoButtons)
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
            ),
          TextButton(
            child: const Text('Dismiss'),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MaterialBanner(
            elevation: 3,
            content: const Text('I am a MaterialBanner at elevation 3'),
            leading: const Icon(Icons.agriculture_outlined),
            actions: <Widget>[
              TextButton(
                child: const Text('Open'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Dismiss'),
                onPressed: () {},
              ),
            ],
          ),
          if (widget.enableShowBanner)
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'Show MaterialBanner',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      showCount++;
                      _showDemoMaterialBanner(
                          context, false, 'A MaterialBanner ($showCount)');
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Show two button MaterialBanner',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      showCount++;
                      _showDemoMaterialBanner(context, true,
                          'A MaterialBanner with two actions ($showCount)');
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class MaterialShowcase extends StatelessWidget {
  const MaterialShowcase(
      {super.key, this.explain = false, this.width = CardShowcase._width - 8});
  final bool explain;
  final double width;

  static const double _height = 100;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle denseHeader = theme.textTheme.titleMedium!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    final TextStyle labelSmall = theme.textTheme.labelSmall!;

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (explain) ...<Widget>[
            Text(
              'Material widget is a lower level building block. It cannot '
              'be themed, but it has Material-2,  Material-3 mode dependent '
              'behavior. Material is responsible for clipping, elevation '
              'and ink effects below its children.\n'
              '\n'
              'Material can also specify surfaceTint color, '
              'which is applied when Material is elevated, but only in '
              'Material-3 mode.',
              style: denseBody,
            ),
            const SizedBox(height: 12),
          ],
          Text('Material type canvas', style: denseHeader),
          Text(
            'Default background color is theme canvasColor, '
            'theme canvasColor is set to theme colorScheme surface. The '
            'color canvasColor will be deprecated in Flutter.',
            style: denseBody,
          ),
          const SizedBox(height: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.canvas,
                  elevation: 1,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material canvas,\nelevation 1,\ndefault surfaceTint,'
                          '\ndefault shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.canvas,
                  elevation: 1,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material canvas,\nelevation 1,\n'
                          'primary surfaceTint,\ntransparent shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.canvas,
                  elevation: 1,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: colorScheme.primary,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material canvas,\n elevation 1,\n '
                          'primary surfaceTint,\nprimary shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.canvas,
                  elevation: 6,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material canvas,\nelevation 6,\n'
                          'default surfaceTint,\ndefault shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.canvas,
                  elevation: 6,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material canvas,\nelevation 6,\n'
                          'primary surfaceTint,\ntransparent shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.canvas,
                  elevation: 6,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: colorScheme.primary,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material canvas,\nelevation 6,\n '
                          'primary surfaceTint,\nprimary shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text('Material card', style: denseHeader),
          Text(
            'Default background color is theme cardColor, '
            'theme cardColor is set to theme colorScheme surface. The '
            'color cardColor will be deprecated in Flutter.',
            style: denseBody,
          ),
          const SizedBox(height: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.card,
                  elevation: 1,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material card,\nelevation 1,\n'
                          'default surfaceTint,\ndefault shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.card,
                  elevation: 1,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material card,\nelevation 1,\n'
                          'primary surfaceTint,\ntransparent shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.card,
                  elevation: 1,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: colorScheme.shadow,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material card,\nelevation 1,\n'
                          'primary surfaceTint,\nprimary shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.card,
                  elevation: 6,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material card,\nelevation 6,\n'
                          'default surfaceTint,\ndefault shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.card,
                  elevation: 6,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material card,\nelevation 6,\n'
                          'primary surfaceTint,\ntransparent shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: _height,
                child: Material(
                  type: MaterialType.card,
                  elevation: 6,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: colorScheme.primary,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          'Material card,\nelevation 6,\n'
                          'primary surfaceTint,\nprimary shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardShowcase extends StatelessWidget {
  const CardShowcase({super.key, this.explain = false, this.width});
  final bool explain;
  final double? width;

  static const double _width = 140;
  static const double _height = 100;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    final TextStyle labelSmall = theme.textTheme.labelSmall!;

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (explain)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                'In M2 mode default background color is theme.cardColor, '
                'which is typically set to colorScheme.surface.',
                style: denseBody,
              ),
            ),
          if (explain)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                'In M3 mode, before Flutter 3.22, its background defaults to '
                'surface color and it gets elevation based surfaceTint. '
                'After Flutter 3.22, the background defaults to '
                'surfaceContainerLow and it does not get any elevation '
                'based surfaceTint by default.',
                style: denseBody,
              ),
            ),
          if (explain)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                'In M2 mode surfaceTint has no effect, even if specified. '
                'Card gets elevation shadow by default in both '
                'M2 and M3 mode.',
                style: denseBody,
              ),
            ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 0,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 0,\ndefault surfaceTint\n'
                          'and default shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 0,
                  surfaceTintColor: colorScheme.surfaceTint,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 0,\nwith surfaceTint,\n'
                          'default shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 0,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 0,\nwith surfaceTint,\n'
                          'transparent shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 1,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 1,\ndefault surfaceTint\n'
                          'and default shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 1,
                  surfaceTintColor: colorScheme.surfaceTint,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 1,\nwith surfaceTint,\n'
                          'default shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 1,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 1,\nwith surfaceTint,\n'
                          'transparent shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 4,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 4,\ndefault surfaceTint\n'
                          'and default shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 4,
                  surfaceTintColor: colorScheme.surfaceTint,
                  child: SizedBox(
                    height: 60,
                    child: Center(
                      child: Text(
                        'Card elevation 4,\nwith surfaceTint,\n'
                        'default shadow',
                        textAlign: TextAlign.center,
                        style: labelSmall,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 4,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 4,\nwith surfaceTint,\n'
                          'transparent shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 10,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 10,\ndefault surfaceTint\n'
                          'and default shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 10,
                  surfaceTintColor: colorScheme.surfaceTint,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 10,\nwith surfaceTint,\n'
                          'default shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width ?? _width,
                height: _height,
                child: Card(
                  elevation: 10,
                  surfaceTintColor: colorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Card elevation 10,\nwith surfaceTint,\n'
                          'transparent shadow',
                          textAlign: TextAlign.center,
                          style: labelSmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardTypesShowcase extends StatelessWidget {
  const CardTypesShowcase({
    super.key,
    this.width,
    this.showForcedOutlined = false,
  });

  final double? width;
  final bool showForcedOutlined;

  static const double _cardWidth = CardShowcase._width;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    // (rydmike): To make the by Flutter team made custom outlined Card below
    // that is a not a part of SDK configured Cards, actually follow M2/M3
    // switch, as well as on higher prio any ambient themed border radius
    // the Card theme has, we need to do something like this, to get
    // the correct border radius that we can use in the custom constructor
    // further below.
    //
    // Default starting point value based on M3,  M2 mode spec values.
    double borderRadius = useMaterial3 ? 12 : 4;
    // Is themed? Try to get the radius from the theme,  used that if it was.
    final ShapeBorder? cardShape = theme.cardTheme.shape;
    // ignore: avoid-excessive-expressions, false positive, shape in CardTheme can be null.
    if (cardShape != null && cardShape is RoundedRectangleBorder) {
      if (cardShape.borderRadius is BorderRadius) {
        // ignore: avoid-type-casts, false positive, the cast is checked just above!
        final BorderRadius shape = cardShape.borderRadius as BorderRadius;
        borderRadius = shape.bottomLeft.x;
      }
    }

    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        SizedBox(
          width: width ?? _cardWidth,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              child: Column(
                spacing: 20,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Elevated'),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: width ?? _cardWidth,
          child: Card.filled(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              child: Column(
                spacing: 20,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Filled'),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: width ?? _cardWidth,
          child: Card.outlined(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              child: Column(
                spacing: 20,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Outlined'),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showForcedOutlined)
          SizedBox(
            width: width ?? _cardWidth,
            child: Card.outlined(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: theme.colorScheme.outlineVariant),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              borderOnForeground: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                child: Column(
                  spacing: 20,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Forced'),
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

class TextThemeShowcase extends StatelessWidget {
  const TextThemeShowcase({super.key, this.showDetails = false});
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    return TextThemeColumnShowcase(
      textTheme: Theme.of(context).textTheme,
      showDetails: showDetails,
    );
  }
}

class PrimaryTextThemeShowcase extends StatelessWidget {
  const PrimaryTextThemeShowcase({super.key, this.showDetails = false});
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    return TextThemeColumnShowcase(
      textTheme: Theme.of(context).primaryTextTheme,
      showDetails: showDetails,
    );
  }
}

class TextThemeColumnShowcase extends StatelessWidget {
  const TextThemeColumnShowcase({
    super.key,
    required this.textTheme,
    this.showDetails = false,
  });
  final TextTheme textTheme;
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    final String fontName = textTheme.bodyMedium!.fontFamily ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Font: $fontName', style: textTheme.titleSmall),
        _ShowTextStyle(
          'Display Large '
          '(${textTheme.displayLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displayLarge!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Display Medium '
          '(${textTheme.displayMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displayMedium!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Display Small '
          '(${textTheme.displaySmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displaySmall!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        const SizedBox(height: 12),
        _ShowTextStyle(
          'Headline Large '
          '(${textTheme.headlineLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineLarge!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Headline Medium '
          '(${textTheme.headlineMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineMedium!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Headline Small '
          '(${textTheme.headlineSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineSmall!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        const SizedBox(height: 12),
        _ShowTextStyle(
          'Title Large '
          '(${textTheme.titleLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleLarge!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Title Medium '
          '(${textTheme.titleMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleMedium!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Title Small '
          '(${textTheme.titleSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleSmall!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        const SizedBox(height: 12),
        _ShowTextStyle(
          'Body Large '
          '(${textTheme.bodyLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodyLarge!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Body Medium '
          '(${textTheme.bodyMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodyMedium!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Body Small '
          '(${textTheme.bodySmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodySmall!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        const SizedBox(height: 12),
        _ShowTextStyle(
          'Label Large '
          '(${textTheme.labelLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelLarge!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Label Medium '
          '(${textTheme.labelMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelMedium!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
        _ShowTextStyle(
          'Label Small '
          '(${textTheme.labelSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelSmall!,
          infoStyle: textTheme.labelSmall!,
          showDetails: showDetails,
        ),
      ],
    );
  }
}

class _ShowTextStyle extends StatelessWidget {
  const _ShowTextStyle(
    this.label, {
    required this.style,
    required this.infoStyle,
    this.showDetails = false,
  });

  final String label;
  final TextStyle style;
  final TextStyle infoStyle;
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    final String font = style.fontFamily ?? '';
    final String size = style.fontSize!.toStringAsFixed(1);
    final String fontWeight = style.fontWeight!.toString();
    final String color = style.color!.toString();
    final String spacing = style.letterSpacing != null
        ? style.letterSpacing!.toStringAsFixed(2)
        : '';
    final String height = style.height != null
        ? ' height: ${style.height!.toStringAsFixed(2)}'
        : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: style),
        if (showDetails) ...<Widget>[
          const SizedBox(height: 4),
          Text(
            '$font $size pt, $fontWeight $color '
            'Letter spacing: $spacing$height',
            style: infoStyle,
          ),
          const SizedBox(height: 4),
        ],
      ],
    );
  }
}
