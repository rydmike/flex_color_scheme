// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:flutter/material.dart';
//
// import '../../shared/color_scheme_box.dart';
//
// /// Widget used to select used FlexShadow using a popup menu.
// ///
// /// Uses index out out of range of [FlexShadow] to represent
// /// and select no selection of [FlexShadow] which sets its
// /// value to null in parent, so we can use a selectable item as null input,
// /// to represent default value via no value definition.
// class UseElevationShadowPopupMenu extends StatelessWidget {
//   const UseElevationShadowPopupMenu({
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
//     final FlexShadow? style,
//   ) {
//     switch (style) {
//       case FlexShadow.defaults:
//         return 'FlexShadow: defaults\n'
//             'Keep elevation shadows as designed in M3 mode, mostly '
//             'there are no shadows on elevated surfaces.';
//       case FlexShadow.useShadow:
//         return 'FlexShadow: useShadow\n'
//             'Add back elevation shadows in M3 mode.';
//
//       case FlexShadow.adaptive:
//         return 'FlexShadow: adaptive\n'
//             'Only add back elevation shadows on iOS and macOS, '
//             'keep them removed on other platforms.';
//       case null:
//         return 'FlexShadow: not defined (defaults)\n'
//             'Keep elevation shadows as designed in M3 mode.';
//     }
//   }
//
//   static const List<Widget> _styleWidget = <Widget>[
//     Tooltip(
//       message: 'As designed, no shadows in M3',
//       child: Icon(Icons.blur_off_rounded),
//     ),
//     Tooltip(
//       message: 'Add shadows\nback in M3 mode',
//       child: Icon(Icons.blur_on_rounded),
//     ),
//     Tooltip(
//       message: 'Only add shadows\nback on iOS and macOS',
//       child: Icon(Icons.deblur_rounded),
//     ),
//     Tooltip(
//       message: 'Not defined, use as\ndesigned, no shadows in M3',
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
//         index < 0 || index >= FlexShadow.values.length || !enabled;
//     final String styleName = !useDefault
//         ? _explainStyle(FlexShadow.values[index])
//         : _explainStyle(null);
//     final IconThemeData selectedIconTheme =
//         theme.iconTheme.copyWith(color: scheme.onPrimary.withAlpha(0xE5));
//     final IconThemeData unSelectedIconTheme =
//         theme.iconTheme.copyWith(color: scheme.primary);
//
//     return PopupMenuButton<int>(
//       initialValue: useDefault ? FlexShadow.values.length : index,
//       tooltip: '',
//       padding: EdgeInsets.zero,
//       onSelected: (int index) {
//         // We return -1 for index that reached max length or any negative
//         // value will cause controller for a FlexAppBarStyle to be set to
//         // "null", we need to be able to do that to input "null" property
//         // value to FlexAppBarStyle configs.
//         onChanged?.call(index >= FlexShadow.values.length ? -1 : index);
//       },
//       enabled: enabled,
//       itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
//         for (int i = 0; i <= FlexShadow.values.length; i++)
//           PopupMenuItem<int>(
//             value: i,
//             child: ListTile(
//               dense: true,
//               contentPadding: EdgeInsets.zero,
//               leading:
//                   index == i || (index < 0 && i == FlexShadow.values.length)
//                       ? IconTheme(
//                           data: selectedIconTheme,
//                           child: ColorSchemeBox(
//                             backgroundColor: scheme.primary,
//                             borderColor: Colors.transparent,
//                             child: _styleWidget[i],
//                           ),
//                         )
//                       : IconTheme(
//                           data: unSelectedIconTheme,
//                           child: ColorSchemeBox(
//                             backgroundColor: Colors.transparent,
//                             borderColor: scheme.primary,
//                             child: _styleWidget[i],
//                           ),
//                         ),
//               title: i >= FlexShadow.values.length
//                   // If we reached max length make default label.
//                   ? Text(popupLabelDefault ?? labelForDefault, style: txtStyle)
//                   : Text(FlexShadow.values[i].name, style: txtStyle),
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
//               child:
//                   _styleWidget[useDefault ? FlexShadow.values.length : index],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
