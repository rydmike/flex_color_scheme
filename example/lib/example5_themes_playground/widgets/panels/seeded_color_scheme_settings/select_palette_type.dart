import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';

class SelectPaletteType extends StatelessWidget {
  const SelectPaletteType({super.key, required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<FlexPaletteType>(
      showSelectedIcon: false,
      // multiSelectionEnabled: false,
      segments: const <ButtonSegment<FlexPaletteType>>[
        ButtonSegment<FlexPaletteType>(
          value: FlexPaletteType.common,
          label: Text('Common', style: TextStyle(fontSize: 12)),
        ),
        ButtonSegment<FlexPaletteType>(
          value: FlexPaletteType.extended,
          label: Text('Extended', style: TextStyle(fontSize: 12)),
        )
      ],
      selected: <FlexPaletteType>{controller.paletteType},
      onSelectionChanged: (Set<FlexPaletteType> selected) {
        controller.setPaletteType(selected.first);
      },
    );
  }
}
