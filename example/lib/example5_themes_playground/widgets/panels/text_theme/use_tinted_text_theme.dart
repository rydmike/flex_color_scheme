import 'package:flex_color_scheme_example/shared/widgets/universal/list_tile_reveal.dart';
import 'package:material_ui/material_ui.dart';

class UseTinted3TextTheme extends StatelessWidget {
  const UseTinted3TextTheme({super.key});

  static const String _removedInV9 =
      'The tinted TextTheme feature (`blendTextTheme`) was removed in '
      'FlexColorScheme 9.0. It had no function in v8.\n'
      '\n'
      'The feature was originally made before Material-3 TextTheme was '
      'available. Material-3 Typography 2021 uses opaque onSurface text, and '
      'component themes often override TextStyle colors with onSurface or '
      'onSurfaceVariant, so a custom tinted TextTheme rarely shows through.\n'
      '\n'
      'Use seed generation and `onSurface` / `onSurfaceVariant` instead if you '
      'want tinted text. A custom TextTheme still requires matching TextStyle '
      'overrides on component themes that replace those colors.';

  @override
  Widget build(BuildContext context) {
    return const ListTileReveal(
      title: Text('Tinted TextTheme was removed in 9.0'),
      subtitleReveal: Text(_removedInV9),
    );
  }
}
