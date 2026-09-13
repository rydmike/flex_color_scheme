import 'package:flex_color_scheme_example/example5_themes_playground/utils/generate_theme_dart_code.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/widgets/dialogs/dart_code_dialog.dart';
import 'package:flex_color_scheme_example/shared/controllers/theme_controller.dart';
import 'package:flex_color_scheme_example/shared/widgets/universal/responsive_dialog.dart';
import 'package:material_ui/material_ui.dart';

// Top level function to handle Theme code menu tap, make the FlexColorScheme
// setup code and copy the code to clipboard.
Future<void> showCopySetupCodeDialog(
    BuildContext context, ThemeController controller) async {
  final String code = generateThemeDartCode(controller);
  await showResponsiveDialog<void>(
    context: context,
    child: DartCodeDialog(
        dialogHeader: 'Copy ThemeData setup code',
        copyMessage: 'FlexColorScheme setup code copied to the clipboard!',
        code: code),
  );
}
