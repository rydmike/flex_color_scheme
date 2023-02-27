// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:flutter/material.dart';
//
// import '../../shared/color_scheme_box.dart';
//
// /// Widget used to select used FlexTint using a popup menu.
// ///
// /// Uses index out out of range of [FlexTint] to represent
// /// and select no selection of [FlexTint] which sets its
// /// value to null in parent, so we can use a selectable item as null input,
// /// to represent default value via no value definition.
// class UseElevationTintPopupMenu extends StatelessWidget {
//   const UseElevationTintPopupMenu({
//     super.key,
//     required this.index,
//     this.onChanged,
//     this.title,
//     this.subtitle,
//     this.contentPadding,
//     this.labelForDefault = 'defaults (null)',
//     this.popupLabelDefault,
//   });
//   final int index;
//   final ValueChanged<int>? onChanged;
//   final Widget? title;
//   final Widget? subtitle;
//   final EdgeInsetsGeometry? contentPadding; // Defaults to 16.
//   final String labelForDefault;
//   final String? popupLabelDefault;
//
//   String _explainStyle(
//     final FlexTint? style,
//   ) {
//     switch (style) {
//       case FlexTint.defaults:
//         return 'FlexTint: defaults\n'
//             'Keep surface tint as designed in M3 mode.';
//       case FlexTint.removeTint:
//         return 'FlexTint: removeTint\n'
//             'Remove surface tint elevation in M3 mode.';
//
//       case FlexTint.adaptive:
//         return 'FlexTint: adaptive\n'
//             'Remove surface tint on iOS and macOS, '
//             'but keep it on other platforms.';
//       case null:
//         return 'FlexTint: not defined (defaults)\n'
//             'Keep surface tint as designed in M3 mode.';
//     }
//   }
//
//   static const List<Widget> _styleWidget = <Widget>[
//     Tooltip(
//       message: 'Use M3 tints',
//       child: Icon(Icons.opacity_rounded),
//     ),
//     Tooltip(
//       message: 'Remove tint in M3 mode',
//       child: Icon(Icons.format_color_reset_rounded),
//     ),
//     Tooltip(
//       message: 'Remove tint on iOS and macOS',
//       child: Icon(Icons.invert_colors_off_rounded),
//     ),
//     Tooltip(
//       message: 'Not defined, use M3 tints',
//       child: Icon(Icons.texture_outlined),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final ColorScheme scheme = theme.colorScheme;
//     final TextStyle txtStyle = theme.textTheme.labelLarge!;
//     final bool enabled = onChanged != null;
//     // Negative value, or index over range are used as null and default value.
//     final bool useDefault =
//         index < 0 || index >= FlexTint.values.length || !enabled;
//     final String styleName = !useDefault
//         ? _explainStyle(FlexTint.values[index])
//         : _explainStyle(null);
//     final IconThemeData selectedIconTheme =
//         theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
//     final IconThemeData unSelectedIconTheme =
//         theme.iconTheme.copyWith(color: scheme.primary);
//
//     return PopupMenuButton<int>(
//       initialValue: useDefault ? FlexTint.values.length : index,
//       tooltip: '',
//       padding: EdgeInsets.zero,
//       onSelected: (int index) {
//         // We return -1 for index that reached max length or any negative
//         // value will cause controller for a FlexAppBarStyle to be set to
//         // "null", we need to be able to do that to input "null" property
//         // value to FlexAppBarStyle configs.
//         onChanged?.call(index >= FlexTint.values.length ? -1 : index);
//       },
//       enabled: enabled,
//       itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
//         for (int i = 0; i <= FlexTint.values.length; i++)
//           PopupMenuItem<int>(
//             value: i,
//             child: ListTile(
//               dense: true,
//               contentPadding: EdgeInsets.zero,
//               leading: index == i || (index < 0 && i == FlexTint.values.length)
//                   ? IconTheme(
//                       data: selectedIconTheme,
//                       child: ColorSchemeBox(
//                         backgroundColor: scheme.primary,
//                         borderColor: Colors.transparent,
//                         child: _styleWidget[i],
//                       ),
//                     )
//                   : IconTheme(
//                       data: unSelectedIconTheme,
//                       child: ColorSchemeBox(
//                         backgroundColor: Colors.transparent,
//                         borderColor: scheme.primary,
//                         child: _styleWidget[i],
//                       ),
//                     ),
//               title: i >= FlexTint.values.length
//                   // If we reached max length make default label.
//                   ? Text(popupLabelDefault ?? labelForDefault, style: txtStyle)
//                   : Text(FlexTint.values[i].name, style: txtStyle),
//             ),
//           )
//       ],
//       child: ListTile(
//         enabled: enabled,
//         contentPadding:
//             contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
//         title: title,
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             if (subtitle != null) subtitle!,
//             Text(styleName),
//           ],
//         ),
//         trailing: Padding(
//           padding: const EdgeInsetsDirectional.only(end: 10.0),
//           child: IconTheme(
//             data: selectedIconTheme,
//             child: ColorSchemeBox(
//               backgroundColor: scheme.primary,
//               borderColor: Colors.transparent,
//               child: _styleWidget[useDefault ? FlexTint.values.length : index],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
