import 'package:flutter/material.dart';

const Size _kDialogSize = Size(550, 900);
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
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < _kDialogSize.width ||
            constraints.maxHeight < _kDialogSize.height) {
          return child;
        } else {
          return Center(
            child: SizedBox.fromSize(
              size: _kDialogSize,
              child: AspectRatio(
                aspectRatio: 1,
                child: Material(
                    elevation: Theme.of(context).dialogTheme.elevation ?? 4,
                    shape: Theme.of(context).dialogTheme.shape ??
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
  final double screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth >= _kWidthForFullScreenDialog) {
    return showDialog<T>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black38,
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
