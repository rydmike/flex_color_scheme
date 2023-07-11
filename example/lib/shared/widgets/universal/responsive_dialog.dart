import 'package:flutter/material.dart';

const Size _kDialogSize = Size(570, 850);
const double _kWidthForFullScreenDialog = 720;

/// A Widget for a media size responsive dialog.
///
/// Shows the dialog at size when screen is larger than content, sizes
/// it to window if changed to smaller, and opens as a modal dialog
/// on small media.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class ResponsiveDialog extends StatelessWidget {
  const ResponsiveDialog({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < _kDialogSize.width ||
            constraints.maxHeight < _kDialogSize.height) {
          return child;
        } else {
          final ThemeData theme = Theme.of(context);
          return Center(
            child: SizedBox.fromSize(
              size: _kDialogSize,
              child: AspectRatio(
                aspectRatio: 1,
                child: Material(
                    elevation: theme.dialogTheme.elevation ??
                        (theme.useMaterial3 ? 6 : 24),
                    color: Colors.transparent,
                    surfaceTintColor: theme.colorScheme.surfaceTint,
                    shadowColor: theme.colorScheme.shadow,
                    shape: theme.dialogTheme.shape ??
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                    // This clip is expensive, but the other ones don't
                    // look as pretty as all as this one.
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: child),
              ),
            ),
          );
        }
      },
    );
  }
}

/// Show the child as responsive dialog or full screen dialog.
///
/// The responsive layout is used when media is large enough to fit the dialog
/// but may be resized to become smaller.
///
/// The fullscreen layout is used when dialog is shown media size smaller
/// than dialog size.
Future<T?> showResponsiveDialog<T>({
  required BuildContext context,
  required Widget child,
}) {
  if (MediaQuery.sizeOf(context).width >= _kWidthForFullScreenDialog) {
    return showDialog<T>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => ResponsiveDialog(
        child: child,
      ),
    );
  } else {
    return Navigator.of(context).push<T>(
      MaterialPageRoute<T>(
        fullscreenDialog: true,
        builder: (_) => child,
      ),
    );
  }
}
