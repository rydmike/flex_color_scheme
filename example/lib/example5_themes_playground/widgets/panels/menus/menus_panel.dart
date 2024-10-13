import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/link_text_span.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/responsive_two_widgets.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../../shared/widgets/universal/switch_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

class MenusPanel extends StatelessWidget {
  const MenusPanel(this.controller, {super.key});
  final ThemeController controller;

  static final Uri _menuNoThemeOnFocusedIssue123736 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/123736',
  );

  static final Uri _dropNotFollowTextPR = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/pull/154667',
  );

  static final Uri _menuLeadingIconIssue131350 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/131350',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!
        .copyWith(color: theme.colorScheme.onSurfaceVariant);
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    final String menuDefault = controller.menuSchemeColor == null
        ? 'surfaceContainer'
        : SchemeColor.values[controller.menuSchemeColor!.index].name;

    final String menuOnDefault = controller.menuSchemeColor == null &&
            controller.menuItemBackgroundSchemeColor == null
        ? 'onSurface'
        : controller.menuItemBackgroundSchemeColor != null
            ? SchemeColor
                .values[FlexSubThemes.onSchemeColor(
                        controller.menuItemBackgroundSchemeColor!)
                    .index]
                .name
            : SchemeColor
                .values[FlexSubThemes.onSchemeColor(controller.menuSchemeColor!)
                    .index]
                .name;

    final String overlayStyle = controller.interactionEffects
        ? ' with tinted overlay'
        : ' with default overlay';

    final String menuIndicatorDefault = controller.menuSchemeColor == null &&
            controller.menuItemBackgroundSchemeColor == null
        ? 'onSurface$overlayStyle'
        : controller.menuItemBackgroundSchemeColor == null
            // ignore: lines_longer_than_80_chars
            ? '${SchemeColor.values[controller.menuSchemeColor!.index].name}$overlayStyle'
            // ignore: lines_longer_than_80_chars
            : '${SchemeColor.values[controller.menuItemBackgroundSchemeColor!.index].name}$overlayStyle';

    final String menuOnIndicatorDefault = controller.menuSchemeColor == null &&
            controller.menuItemBackgroundSchemeColor == null &&
            controller.menuIndicatorBackgroundSchemeColor == null
        ? 'onSurface'
        : controller.menuIndicatorBackgroundSchemeColor == null
            ? controller.menuItemBackgroundSchemeColor == null
                ? SchemeColor
                    .values[
                        FlexSubThemes.onSchemeColor(controller.menuSchemeColor!)
                            .index]
                    .name
                : SchemeColor
                    .values[FlexSubThemes.onSchemeColor(
                            controller.menuItemBackgroundSchemeColor!)
                        .index]
                    .name
            : SchemeColor
                .values[FlexSubThemes.onSchemeColor(
                        controller.menuIndicatorBackgroundSchemeColor!)
                    .index]
                .name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        //
        // Menu container
        //
        const ListTileReveal(
          title: Text('Menu'),
          subtitleReveal:
              Text('Menu container theming properties are shared by '
                  'DropdownMenu, MenuAnchor and MenuBar. You can see applied '
                  'container styles when you open test menus.\n'),
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Color'),
              defaultLabel: 'surfaceContainer',
              value: controller.menuSchemeColor,
              onChanged: controller.setMenuSchemeColor,
            ),
            lastWidget: SliderListTileReveal(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Opacity'),
              value: controller.menuOpacity,
              onChanged: controller.setMenuOpacity,
              min: 0,
              max: 1,
              divisions: 100,
              valueDisplayScale: 100,
              valueDecimalPlaces: 0,
              valueHeading: 'OPACITY',
              valueUnitLabel: ' %',
              valueDefaultLabel: '100 %',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Radius'),
              subtitleReveal: const Text(
                'Does not use the global border radius setting. '
                'Avoid using very large border radius on menu container. '
                'Unlike the using larger radius on PopupMenuButton, the '
                'M3 based  Menu widgets will correctly clip the '
                'highlighted item in corners, so you can use '
                'higher border radius without issues, it is just not '
                'recommended design wise.\n',
              ),
              value: controller.menuRadius,
              onChanged: controller.setMenuRadius,
              min: 0,
              max: 25,
              divisions: 25,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '4 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Elevation'),
              value: controller.menuElevation,
              onChanged: controller.setMenuElevation,
              min: 0,
              max: 30,
              divisions: 30,
              valueHeading: 'ELEV',
              valueDecimalPlaces: 0,
              valueDefaultLabel: '3',
            ),
            isRow: isRow,
          );
        }),
        ListTile(
          enabled: enableControl,
          title: const Text('Content padding'),
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              value: controller.menuPaddingStart,
              onChanged: controller.setMenuPaddingStart,
              min: 0,
              max: 32,
              divisions: 32,
              valueDecimalPlaces: 0,
              valueHeading: 'START',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              value: controller.menuPaddingEnd,
              onChanged: controller.setMenuPaddingEnd,
              min: 0,
              max: 32,
              divisions: 32,
              valueDecimalPlaces: 0,
              valueHeading: 'END',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              value: controller.menuPaddingTop,
              onChanged: controller.setMenuPaddingTop,
              min: 0,
              max: 32,
              divisions: 32,
              valueDecimalPlaces: 0,
              valueHeading: 'TOP',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              value: controller.menuPaddingBottom,
              onChanged: controller.setMenuPaddingBottom,
              min: 0,
              max: 32,
              divisions: 32,
              valueDecimalPlaces: 0,
              valueHeading: 'BOTTOM',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '0 dp',
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
        //
        // Menu items
        //
        const ListTileReveal(
          title: Text('Menu items'),
          subtitleReveal: Text(
            'Menu item style is used by SubmenuButton and '
            'MenuItemButton, that are used in DropdownMenu, MenuAnchor and '
            'MenuBar. You can see the menu item theme styles applied '
            'when you open the test menus.\n',
          ),
        ),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Background color'),
              defaultLabel: menuDefault,
              defaultDisabledLabel: 'surfaceContainer',
              value: controller.menuItemBackgroundSchemeColor,
              onChanged: controller.setMenuItemBackgroundSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Foreground color'),
              defaultLabel: menuOnDefault,
              defaultDisabledLabel: 'onSurface',
              value: controller.menuItemForegroundSchemeColor,
              onChanged: controller.setMenuItemForegroundSchemeColor,
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Highlighted background'),
              defaultLabel: menuIndicatorDefault,
              defaultDisabledLabel: 'onSurface$overlayStyle',
              value: controller.menuIndicatorBackgroundSchemeColor,
              onChanged: controller.setMenuIndicatorBackgroundSchemeColor,
            ),
            lastWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('Highlighted foreground'),
              defaultLabel: menuOnIndicatorDefault,
              defaultDisabledLabel: 'onSurface',
              value: controller.menuIndicatorForegroundSchemeColor,
              onChanged: controller.setMenuIndicatorForegroundSchemeColor,
            ),
            isRow: isRow,
          );
        }),
        SliderListTileReveal(
          enabled: enableControl,
          title: const Text('Highlight radius'),
          subtitleReveal: const Text(
            'Does not use the global border radius setting. '
            'Avoid using large border radius on menu container.\n',
          ),
          value: controller.menuIndicatorRadius,
          onChanged: controller.setMenuIndicatorRadius,
          min: 0,
          max: 25,
          divisions: 25,
          valueDecimalPlaces: 0,
          valueHeading: 'RADIUS',
          valueUnitLabel: ' dp',
          valueDefaultLabel: '0',
        ),
        const Divider(),
        //
        // DropdownMenu
        //
        const ListTileReveal(
          title: Text('DropdownMenu'),
          subtitleReveal: Text(
            'The Material-3 DropdownMenu has a text entry used to optionally '
            'type select an option. Options can also be tap selected. In FCS '
            'the text entry style matches the defined TextField style by '
            'default.\n'
            '\n'
            'The Menu container and Menu item sections below contain shared '
            'theme settings for DropdownMenu, MenuAnchor and MenuBar menus.\n',
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: DropDownMenuShowcase(),
        ),
        ListTileReveal(
          dense: true,
          title: const Text('Known issues'),
          subtitleReveal: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: spanTextStyle,
                  text: 'The selected and focused style of any item found in '
                      'the DropdownMenu is not themed. This is a bug in '
                      'Flutter SDK. For more information see ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _menuNoThemeOnFocusedIssue123736,
                  text: 'issue #123736',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. This has been fixed in master, but has not yet '
                      'landed in Flutter 3.24.\n'
                      '\n'
                      'There are three reported '
                      'issues about the DropdownMenu not following the '
                      'input field correctly. A FIX PR that references these '
                      'issues can be found here ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _dropNotFollowTextPR,
                  text: 'PR #154667',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '. This FIX PR, that also links the issues, '
                      'has landed in master, but not yet in Flutter 3.24.\n'
                      '\n'
                      'Another issue was using leading icons on both menu '
                      'input field and the items as show in the above example. '
                      'They did not align correctly. This has been fixed in '
                      'Flutter 3.22 and later. You can read more about this '
                      'past issue and also '
                      'find links to many other DropdownMenu issues in \n',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: _menuLeadingIconIssue131350,
                  text: 'issue #131350',
                ),
                TextSpan(
                  style: spanTextStyle,
                  text: '.\n',
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        //
        // MenuAnchor
        //
        const ListTileReveal(
          title: Text('MenuAnchor'),
          subtitleReveal: Text(
            'The MenuAnchor can be used to attach a menu to any '
            'widget. It is based on same building blocks as the MenuBar, '
            'using SubMenuButton with MenuItemButton. It can have sub-menus '
            'and keyboard shortcuts.\n'
            '\n'
            'The Menu container and Menu items section below contain shared '
            'theme settings for DropdownMenu, MenuAnchor and MenuBar menus.\n',
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: MenuAnchorShowcase(explain: false),
        ),
        const SizedBox(height: 16),
        const Divider(),
        //
        // MenuBar
        //
        const ListTileReveal(
          title: Text('MenuBar'),
          subtitleReveal: Text(
            'The MenuBar is made up of SubMenuButtons that have '
            'MenuItemButtons. You can construct arbitrary deep nested '
            'sub-menus. Menu items can have keyboard shortcuts.\n'
            '\n'
            'The Menu container and Menu item sections below contain shared '
            'theme settings for DropdownMenu, MenuAnchor and MenuBar menus.\n',
          ),
        ),

        const MenuBarShowcase(explain: false),
        const SizedBox(height: 8),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: ColorSchemePopupMenu(
              enabled: enableControl,
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              title: const Text('Background color'),
              defaultLabel: menuDefault,
              defaultDisabledLabel: 'surfaceContainer',
              value: controller.menuBarBackgroundSchemeColor,
              onChanged: controller.setMenuBarBackgroundSchemeColor,
            ),
            lastWidget: SwitchListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              title: const Text('No shadow'),
              subtitleReveal: const Text(
                'The M3 guide depicts MenuBars with no shadow and optional '
                'elevation with tint. Flutter defaults has shadow in M3. '
                'To be able to use elevation with only elevation tint in M3, '
                'turn this setting ON, to remove the shadow.\n',
              ),
              value: controller.menuBarShadowColor == Colors.transparent,
              onChanged: (bool removeShadow) {
                if (removeShadow) {
                  controller.setMenuBarShadowColor(Colors.transparent);
                } else {
                  controller.setMenuBarShadowColor(null);
                }
              },
            ),
            isRow: isRow,
          );
        }),
        ResponsiveTwoWidgets(builder: (BuildContext context, bool isRow) {
          return RowOrColumn(
            firstWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingStart(context, isRow),
              enabled: enableControl,
              title: const Text('Radius'),
              subtitleReveal: const Text(
                'For an edge-to-edge MenuBar design use 0 dp. The Material-3 '
                'guide depicts MenuBar as edge-to-edge '
                'with no corner rounding, but Flutter defaults to 4 dp. '
                'As of Aug 28, 2024 there is no official M3 spec for '
                'the MenuBar.\n',
              ),
              value: controller.menuBarRadius,
              onChanged: controller.setMenuBarRadius,
              min: 0,
              max: 40,
              divisions: 40,
              valueDecimalPlaces: 0,
              valueHeading: 'RADIUS',
              valueUnitLabel: ' dp',
              valueDefaultLabel: '4 dp',
            ),
            lastWidget: SliderListTileReveal(
              contentPadding: ThemeValues.tilePaddingEnd(context, isRow),
              enabled: enableControl,
              title: const Text('Elevation'),
              subtitleReveal: const Text(
                'For an flat MenuBar design use 0 elevation. The Material-3 '
                'guide depicts MenuBar as flat with no elevation, '
                'but Flutter defaults to elevation 3. As of Aug 28, 2024 '
                'there is no official M3 spec for the MenuBar.\n',
              ),
              value: controller.menuBarElevation,
              onChanged: controller.setMenuBarElevation,
              min: 0,
              max: 30,
              divisions: 30,
              valueHeading: 'ELEV',
              valueDecimalPlaces: 0,
              valueDefaultLabel: '3',
            ),
            isRow: isRow,
          );
        }),
        const Divider(),
        const ListTileReveal(
          dense: true,
          title: Text('More settings with the API'),
          subtitleReveal: Text(
            'With the API you can also set the text styles with '
            'FlexSubThemesData properties:\n'
            '\n'
            '- dropdownMenuTextStyle\n'
            '- menuButtonTextStyle\n',
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
