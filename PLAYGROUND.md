# Reusable Plan: Adding UI Components to Themes Playground

## Overview

This document provides a comprehensive, step-by-step guide for adding new theme properties and UI controls to the FlexColorScheme Themes Playground (example5_themes_playground). The plan follows the established architectural patterns discovered through codebase analysis.

---

## Quick Reference: UI Control Selection by Data Type

| Data Type | UI Control | Widget File |
|-----------|-----------|-------------|
| `bool` (non-nullable) | `SwitchListTileReveal` | `shared/widgets/universal/switch_list_tile_reveal.dart` |
| `bool?` (nullable/tri-state) | `NullableBoolToggleButtons` | `shared/widgets/universal/nullable_bool_toggle_buttons.dart` |
| `int?` or `double?` | `SliderListTileReveal` | `shared/widgets/universal/slider_list_tile_reveal.dart` |
| `int` or `double` (non-nullable) | `ListTileSlider` | `shared/widgets/universal/list_tile_slider.dart` |
| `T extends Enum` | `EnumPopupMenu<T>` | `example5_themes_playground/widgets/shared/enum_popup_menu.dart` |
| `SchemeColor?` | `ColorSchemePopupMenu` | `example5_themes_playground/widgets/shared/color_scheme_popup_menu.dart` |
| `TargetPlatform?` | `PlatformPopupMenu` | `example5_themes_playground/widgets/shared/platform_popup_menu.dart` |
| `Color` (for custom colors) | `ColorPickerInkWellDialog` | `example5_themes_playground/widgets/shared/color_picker_inkwell.dart` |
| Informational section | `ListTileReveal` | `shared/widgets/universal/list_tile_reveal.dart` |
| Expandable section | `ListTileExpand` | `shared/widgets/universal/list_tile_expand.dart` |

---

## Step-by-Step Implementation Guide

### Required Information Before Starting

Before beginning implementation, ensure you have:
1. **Target panel file** - Which panel will contain the new UI control (e.g., `buttons_panel.dart`, `text_field_panel.dart`)
2. **FlexColorScheme API property name** - Which property in FlexColorScheme or FlexSubThemesData this controller property maps to
3. **Data type** - The type of the property (bool, int?, double?, enum, etc.)
4. **Default value** - The default value based on M2/M3 Material Design specs

If any of these are not specified, **ask for them** before proceeding.

---

### Step 1: Define Storage Constants

**File**: `example/lib/shared/const/store.dart`

Add TWO constants for each new property:

```dart
// Key used to read and save the [propertyName] value.
static const String key[PropertyName] = '[propertyName]';
// Default value for the [propertyName], also used to reset settings.
// [Optional: Add context about M2/M3 differences or null handling]
static const [Type] default[PropertyName] = [defaultValue];
```

**Important**: Add the key to the `storageKeys` validation list (lines 2669-2950):

```dart
static const List<String> storageKeys = <String>[
  // ... existing keys
  key[PropertyName],
];
```

#### Naming Conventions:
- **Key**: `key[PropertyName]` (camelCase with 'key' prefix)
- **Default**: `default[PropertyName]` (camelCase with 'default' prefix)

#### Examples by Type:

**Boolean (non-nullable)**:
```dart
static const String keyUseFlexColorScheme = 'useFlexColorScheme';
static const bool defaultUseFlexColorScheme = true;
```

**Boolean (nullable - for M2/M3 differences)**:
```dart
static const String keyUseMaterial3Typography = 'useMaterial3Typography';
// The controller uses a nullable bool with different defaults in
// M2 and M3 mode if it is set to null.
static const bool? defaultUseMaterial3Typography = null;
```

**Double (nullable - allows "use default")**:
```dart
static const String keyDefaultRadius = 'defaultRadius';
static const double? defaultDefaultRadius = null;
```

**Enum (nullable)**:
```dart
static const String keyListTileStyle = 'listTileStyle';
static const ListTileStyle? defaultListTileStyle = null;
```

**Color (typically nullable)**:
```dart
static const String keyTabBarDividerColor = 'tabBarDividerColor';
static const Color? defaultTabBarDividerColor = null;
```

**Color (non-nullable with AppColor default)**:
```dart
static const String keyCustomPrimaryLight = 'customPrimaryLight';
static const Color defaultCustomPrimaryLight = AppColor.customPrimaryLight;
```

---

### Step 2: Add ThemeController Property

**File**: `example/lib/shared/controllers/theme_controller.dart`

Each property requires FOUR additions:

#### Part A: Private Field Declaration

```dart
late [Type] _[propertyName];
```

#### Part B: Public Getter

```dart
[Type] get [propertyName] => _[propertyName];
```

#### Part C: Setter with Persistence

**For NON-NULLABLE types** (bool, int, double, non-nullable enums):
```dart
void set[PropertyName]([Type]? value, [bool notify = true]) {
  if (value == null) return;  // � Null check required
  if (value == _[propertyName]) return;
  _[propertyName] = value;
  if (notify) notifyListeners();
  unawaited(_themeService.save(Store.key[PropertyName], value));
}
```

**For NULLABLE types** (bool?, double?, Color?, nullable enums):
```dart
void set[PropertyName]([Type]? value, [bool notify = true]) {
  // � NO null check - null is a valid value
  if (value == _[propertyName]) return;
  _[propertyName] = value;
  if (notify) notifyListeners();
  unawaited(_themeService.save(Store.key[PropertyName], value));
}
```

**Special Case: Custom Colors with Side Effects**:
```dart
void setCustomPrimaryLight(Color? value, [bool notify = true]) {
  if (value == null) return;
  if (value == _customPrimaryLight) return;
  _customPrimaryLight = value;
  // Update related properties with notify: false
  setCustomPrimaryLightRef(value, false);
  if (!customUsesDarkColorsForSeed) setCustomPrimaryDarkRef(value, false);
  if (notify) notifyListeners();
  unawaited(_themeService.save(Store.keyCustomPrimaryLight, value));
}
```

#### Part D: Loading in `loadAll()` Method

Add to the appropriate section in the `loadAll()` method:

```dart
_[propertyName] = await _themeService.load(
    Store.key[PropertyName], Store.default[PropertyName]);
```

**Organization**: Group related properties together (e.g., all button properties, all AppBar properties).

#### Part E: Reset in `resetSettings()` Method

Add to the appropriate section in the `resetSettings()` method to ensure properties reset to default values:

```dart
set[PropertyName](Store.default[PropertyName], false);
```

**Important Notes**:
- The second parameter `false` prevents notifying listeners for each individual property reset
- Group reset calls with related properties (e.g., all Card settings together)
- The method will call `notifyListeners()` once at the end after all resets

**Real Example** (Card settings reset):
```dart
// Card SETTINGS.
setCardBackgroundSchemeColor(Store.defaultCardBackgroundSchemeColor, false);
setCardBorderSchemeColor(Store.defaultCardBorderSchemeColor, false);
setCardBorderWidth(Store.defaultCardBorderWidth, false);
setCardBorderRadius(Store.defaultCardBorderRadius, false);
```

**Location in file**: The `resetSettings()` method is around line 800-2000+ and contains all property resets grouped by category.

---

### Step 3: Determine Default Value Logic

Defaults depend on the Material widget type and Material Design version.

#### Default Value Sources:

1. **Material-3 Defaults**: Check Flutter's Material 3 component specifications
2. **Material-2 Defaults**: Check Flutter's Material 2 legacy defaults
3. **FlexColorScheme API Defaults**: Check the actual FlexColorScheme/FlexSubThemes API defaults

#### Default Label Pattern (for UI display):

Use conditional logic to show contextual defaults:

```dart
final String [property]DefaultLabel =
    controller.[property] == null && effectiveGlobalDefault == null
        ? useMaterial3 ? 'M3 default value' : 'M2 default value'
        : controller.[property] == null && effectiveGlobalDefault != null
            ? 'global ${effectiveGlobalDefault.toStringAsFixed(0)} dp'
            : '';
```

**Real Example** (from `buttons_panel.dart`):
```dart
final String elevatedButtonRadiusDefaultLabel =
    controller.elevatedButtonBorderRadius == null && effectiveRadius == null
        ? useMaterial3 ? 'stadium' : '40 dp'
        : controller.elevatedButtonBorderRadius == null && effectiveRadius != null
            ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
            : '';
```

**Key Pattern**:
- If property is null AND no global default exists � show M2/M3 specific default
- If property is null BUT global default exists � show "global {value}"
- If property is set � show empty string (the actual value will be displayed)

---

### Step 4: Add UI Control to Panel

**Location**: `example/lib/example5_themes_playground/widgets/panels/[category]/`

**Important**: The panel file will typically be specified when adding a new UI control. If the target panel is not specified, ask for this information before proceeding.

#### A. Modify Existing Panel File (Most Common)

In most cases, you'll be adding controls to an existing panel file:

```dart
class MyNewPanel extends StatelessWidget {
  const MyNewPanel(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    // Enable control based on prerequisites
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    return Column(
      children: <Widget>[
        // Add controls here
      ],
    );
  }
}
```

#### B. Select Appropriate UI Control

**Boolean (non-nullable)** - Use `SwitchListTileReveal`:
```dart
SwitchListTileReveal(
  enabled: enableControl,
  value: controller.myBoolProperty,
  onChanged: controller.setMyBoolProperty,
  title: const Text('My boolean setting'),
  subtitleReveal: const Text(
    'Detailed explanation of what this setting does. '
    'Can span multiple lines and explain M2/M3 differences.'
  ),
)
```

**Boolean (nullable/tri-state)** - Use `NullableBoolToggleButtons`:
```dart
ListTileReveal(
  enabled: enableControl,
  title: const Text('My tri-state setting'),
  subtitleReveal: const Text('Explanation...'),
  trailing: Padding(
    padding: const EdgeInsetsDirectional.only(end: 5.0),
    child: NullableBoolToggleButtons(
      value: controller.myNullableBoolProperty,
      onChanged: controller.setMyNullableBoolProperty,
    ),
  ),
)
```

**Numeric (int/double nullable)** - Use `SliderListTileReveal`:
```dart
SliderListTileReveal(
  enabled: enableControl,
  title: const Text('My numeric setting'),
  value: controller.myNumericProperty,
  onChanged: controller.setMyNumericProperty,
  min: 0,
  max: 40,
  divisions: 40,
  valueDecimalPlaces: 0,  // 0 for int, 1-2 for double
  valueHeading: 'LABEL',
  valueUnitLabel: ' dp',  // ' %', ' px', etc.
  valueDefaultLabel: myPropertyDefaultLabel,
  valueDefaultDisabledLabel: useMaterial3 ? 'M3 default' : 'M2 default',
  subtitleReveal: const Text('Explanation...'),
)
```

**Enum** - Use `EnumPopupMenu<T>`:
```dart
EnumPopupMenu<MyEnumType>(
  enabled: enableControl,
  title: const Text('My enum setting'),
  value: controller.myEnumProperty,
  values: MyEnumType.values,
  onChanged: controller.setMyEnumProperty,
  subtitleReveal: const Text('Explanation...'),
)
```

**SchemeColor** - Use `ColorSchemePopupMenu`:
```dart
ColorSchemePopupMenu(
  enabled: enableControl,
  title: const Text('Widget color'),
  colorPrefix: 'Uses ',
  defaultLabel: useMaterial3 ? 'primary' : 'primaryVariant',
  defaultLabelDark: useMaterial3 ? 'primaryContainer' : 'primary',
  value: controller.myColorProperty,
  onChanged: controller.setMyColorProperty,
  subtitleReveal: const Text('Explanation...'),
)
```

**Custom Color** - Use `ColorPickerInkWellDialog`:
```dart
ListTileReveal(
  enabled: enableControl,
  title: const Text('Custom color'),
  trailing: ColorPickerInkWellDialog(
    color: controller.myCustomColor,
    onChanged: controller.setMyCustomColor,
    wasCancelled: (bool cancelled) {
      if (cancelled) {
        // Handle cancellation if needed
      }
    },
    enabled: enableControl,
    child: ColorIndicator(
      color: controller.myCustomColor,
      width: 44,
      height: 44,
    ),
  ),
)
```

#### C. Add Enable Control Logic

**Standard Pattern**:
```dart
final bool enableControl =
    controller.useSubThemes && controller.useFlexColorScheme;
```

**With Additional Prerequisites**:
```dart
final bool enableControl =
    controller.useSubThemes &&
    controller.useFlexColorScheme &&
    controller.someOtherPrerequisite;
```

---

### Step 5: Add Code Generation Logic

**File**: `example/lib/example5_themes_playground/utils/generate_theme_dart_code.dart`

Add conditional string generation in the appropriate section:

#### Pattern A: Nullable Property (null = use default)

```dart
final String myProperty = controller.myProperty != null
    ? '      myProperty: ${controller.myProperty},\n'
    : '';
```

#### Pattern B: Boolean (only include if true)

```dart
final String myBoolProperty = controller.myBoolProperty
    ? '      myBoolProperty: ${controller.myBoolProperty},\n'
    : '';
```

#### Pattern C: Enum with Known Default

```dart
final String myEnumProperty = controller.myEnumProperty != MyEnumType.defaultValue
    ? '      myEnumProperty: ${controller.myEnumProperty},\n'
    : '';
```

#### Pattern D: Double with Formatting

```dart
final String myDoubleProperty = controller.myDoubleProperty != null
    ? '      myDoubleProperty: ${controller.myDoubleProperty!.toStringAsFixed(1)},\n'
    : '';
```

#### Pattern E: Color Property

```dart
final String myColorProperty = controller.myColorProperty != null
    ? '      myColorProperty: const ${controller.myColorProperty.toColorString()},\n'
    : '';
```

#### Pattern F: Material-2/Material-3 Conditional

```dart
final String myProperty = controller.myProperty == null ||
        (controller.myProperty == MyType.m2Default && !controller.useMaterial3) ||
        (controller.myProperty == MyType.m3Default && controller.useMaterial3)
    ? ''
    : '      myProperty: ${controller.myProperty},\n';
```

#### Pattern G: AdaptiveResponse (uses .code property)

```dart
final String myAdaptiveProperty = controller.myAdaptiveProperty != null &&
        controller.myAdaptiveProperty != AdaptiveResponse.off &&
        controller.useMaterial3
    ? '      myAdaptiveProperty: ${controller.myAdaptiveProperty!.code},\n'
    : '';
```

#### Add to Code Assembly

Find the appropriate section in the final code string interpolation:

```dart
final String code =
    "import 'package:flex_color_scheme/flex_color_scheme.dart';\n"
    // ... imports ...
    'abstract final class AppTheme {\n'
    '  static ThemeData light = FlexThemeData.light(\n'
    // ... earlier properties ...
    '$myProperty'  // � Add your property string here
    // ... later properties ...
    '  );\n'
    '}\n';
```

**Organization**: Group related properties together with section comments:

```dart
// Button theme properties
'$elevatedButtonSchemeColor'
'$elevatedButtonBorderRadius'
'$elevatedButtonElevation'
```

---

### Step 6: Add JSON Import/Export Support

**File**: `example/lib/example5_themes_playground/utils/import_export_playground_settings.dart`

#### A. For Standard Types (bool, int, double, String)

No changes needed - automatic serialization works.

#### B. For Color Types

No changes needed - Color serialization already handled:

```dart
if (object is Color) {
  return <String, String>{
    JsonKeys.dartType.key: JsonKeys.typeColor.key,
    JsonKeys.value.key: object.hexCode,
  };
}
```

#### C. For Custom Enum Types

**Step 1**: Add JsonKeys enum entry (if new enum type):

```dart
enum JsonKeys {
  // ... existing entries
  typeEnumMyNewType(key: 'enum_my_new_type'),
  // ...
}
```

**Step 2**: Add to export encoder (around line 150):

```dart
else if (object is MyNewEnumType) {
  dartType = JsonKeys.typeEnumMyNewType.key;
}
```

**Step 3**: Add to import decoder (around line 250):

```dart
else if (_equalsIgnoreCase(dartType, JsonKeys.typeEnumMyNewType.key)) {
  mapped = MyNewEnumType.values.firstWhere(
      (MyNewEnumType element) => _equalsIgnoreCase(element.name, value as String));
}
```

---

### Step 7: Connect Controller to Theme (CRITICAL STEP)

**Files**:
- `example/lib/example5_themes_playground/theme/flex_theme_light.dart`
- `example/lib/example5_themes_playground/theme/flex_theme_dark.dart`

**Important**: This step assumes the FlexColorScheme API property already exists in `FlexColorScheme.light()`, `FlexColorScheme.dark()`, or in their `subThemesData: FlexSubThemesData()` configurations. The property name in the API will typically be provided. If not specified, ask which FlexColorScheme property the new controller property should connect to.

#### A. Add to Light Theme

In `flex_theme_light.dart`, locate the `flexColorSchemeLight()` function and add the controller property to the appropriate location:

**For FlexColorScheme top-level properties**:
```dart
return FlexColorScheme.light(
  // ... existing properties
  myNewProperty: controller.myNewProperty,  // Add here
  // ... more properties
  subThemesData: controller.useSubThemes
      ? FlexSubThemesData(
          // ...
        )
      : null,
);
```

**For FlexSubThemesData properties** (most common):
```dart
return FlexColorScheme.light(
  // ... top-level properties
  subThemesData: controller.useSubThemes
      ? FlexSubThemesData(
          // ... existing properties
          myNewProperty: controller.myNewProperty,  // Add here
          // ... more properties
        )
      : null,
);
```

**Real Example** (from lines 371-393):
```dart
subThemesData: controller.useSubThemes
    ? FlexSubThemesData(
        // ... other properties
        listTileStyle: controller.listTileStyle,  // � Controller connection
        listTileTitleAlignment: controller.listTileTitleAlignment,
        // ...
      )
    : null,
```

#### B. Add to Dark Theme

In `flex_theme_dark.dart`, add the identical controller connection in the `flexColorSchemeDark()` function:

**For FlexSubThemesData properties**:
```dart
subThemesData: controller.useSubThemes
    ? FlexSubThemesData(
        // ... existing properties
        myNewProperty: controller.myNewProperty,  // Add here
        // ... more properties
      )
    : null,
```

**Real Example** (from lines 350-372):
```dart
subThemesData: controller.useSubThemes
    ? FlexSubThemesData(
        // ... other properties
        listTileStyle: controller.listTileStyle,  // � Same controller connection
        listTileTitleAlignment: controller.listTileTitleAlignment,
        // ...
      )
    : null,
```

#### C. Properties That Differ Between Light and Dark

Some properties have separate light/dark variants in the controller:

**Example**: Input decorator colors
```dart
// In flex_theme_light.dart:
inputDecoratorSchemeColor: controller.inputDecoratorSchemeColorLight,
inputDecoratorBorderSchemeColor: controller.inputDecoratorBorderSchemeColorLight,

// In flex_theme_dark.dart:
inputDecoratorSchemeColor: controller.inputDecoratorSchemeColorDark,
inputDecoratorBorderSchemeColor: controller.inputDecoratorBorderSchemeColorDark,
```

**Example**: AppBar colors
```dart
// In flex_theme_light.dart:
appBarBackgroundSchemeColor: controller.appBarBackgroundSchemeColorLight,

// In flex_theme_dark.dart:
appBarBackgroundSchemeColor: controller.appBarBackgroundSchemeColorDark,
```

#### D. Placement Guidelines

**Organization**: Properties are grouped logically in both theme files:
- Lines ~144-203: Global settings (defaultRadius, interaction effects, typography)
- Lines ~204-245: Button themes (TextButton, ElevatedButton, etc.)
- Lines ~246-312: Toggles and sliders (Switch, Checkbox, Slider, ProgressIndicator)
- Lines ~313-371: Input decoration (TextField)
- Lines ~372-394: ListTile
- Lines ~395-429: FAB, Chip, Card, PopupMenu
- Lines ~430-473: Dialogs, SnackBar
- Lines ~474-500: AppBar, TabBar
- Lines ~501-521: BottomSheet, Drawer
- Lines ~522-551: BottomNavigationBar
- Lines ~552-589: Menu, SearchBar
- Lines ~590-625: NavigationBar
- Lines ~626-667: NavigationRail

**Consistency**: Always add the same property at the same relative position in both light and dark theme files to maintain readability.

---

### Step 8: Register New Panel in Topic Structure (RARE - Only for New Panels)

**Note**: This step is only needed when creating a brand new panel. Most of the time you'll be adding controls to existing panels, so you can skip this step.

**File**: `example/lib/example5_themes_playground/widgets/pages/model/theme_topic.dart`

Add a new `Topic` entry:

```dart
final List<Topic> themeTopics = <Topic>[
  // ... existing topics
  Topic(
    topicKey: TopicKey.myNewTopic,
    heading: 'My New Feature',
    topicGroup: TopicGroup.components,  // Choose appropriate group
    builder: (ThemeController controller) => MyNewPanel(controller),
  ),
];
```

**TopicGroups**:
- `TopicGroup.general` - General settings
- `TopicGroup.colors` - Color scheme settings
- `TopicGroup.components` - Component themes
- `TopicGroup.controls` - Controls (buttons, chips, etc.)
- `TopicGroup.inputs` - Input fields
- `TopicGroup.bars` - App/Tab/Search bars
- `TopicGroup.navigation` - Navigation components
- `TopicGroup.surfaces` - Surface themes
- `TopicGroup.texts` - Text themes

---

## Common Patterns and Best Practices

### Enable Control Hierarchy

Most specific to least specific:

```dart
// Most specific - requires multiple prerequisites
final bool enableAdvancedControl =
    controller.useSubThemes &&
    controller.useFlexColorScheme &&
    controller.someFeatureEnabled;

// Standard - requires sub-themes
final bool enableControl =
    controller.useSubThemes &&
    controller.useFlexColorScheme;

// Always enabled (rare)
final bool enableControl = true;
```

### Default Value Display Strategy

1. **Compute effective defaults** at build time
2. **Show contextual labels** that explain where defaults come from
3. **Consider M2/M3 differences** in labels
4. **Account for global defaults** that override widget defaults

### Null Handling Rules

| Scenario | Pattern | Example |
|----------|---------|---------|
| Non-nullable property | Add null check in setter | `if (value == null) return;` |
| Nullable property | No null check in setter | Null is valid value |
| Nullable with M2/M3 meaning | Default to null | `null` = use mode-specific default |
| Nullable with global cascade | Show global in label | "global 12 dp" |

### Code Generation Philosophy

**Only generate non-default values** to create clean, minimal API code that:
- Clearly shows what's customized
- Follows Flutter best practices
- Reduces generated code size
- Makes M2/M3 differences obvious

---

## Validation Checklist

Before considering a property implementation complete:

- [ ] Store constants added (key + default)
- [ ] Store key added to `storageKeys` validation list
- [ ] ThemeController field, getter, setter added
- [ ] Property loaded in `loadAll()`
- [ ] Property reset added in `resetSettings()`
- [ ] Default value logic researched (M2/M3 aware)
- [ ] UI control added to appropriate panel (panel file specified or confirmed)
- [ ] Enable control logic implemented
- [ ] **Controller connected to light theme** (in `flex_theme_light.dart`)
- [ ] **Controller connected to dark theme** (in `flex_theme_dark.dart`)
- [ ] Code generation logic added
- [ ] JSON serialization added (for custom types)
- [ ] Panel registered in theme topics (only if creating new panel - rare)
- [ ] Tested: UI control updates controller
- [ ] Tested: Controller updates persist
- [ ] Tested: **Theme actually changes** when UI control is modified
- [ ] Tested: Code generation includes property when non-default
- [ ] Tested: Code generation omits property when default
- [ ] Tested: JSON export includes property
- [ ] Tested: JSON import deserializes correctly

---

## Material Design Default Value Reference

### Where to Find Defaults

1. **Flutter Material Components**:
   - `flutter/lib/src/material/[component].dart`
   - Look for `defaultsFor(BuildContext context)` methods

2. **Material 3 Specs**:
   - https://m3.material.io/components/
   - Check "Specifications" tab for each component

3. **FlexColorScheme API**:
   - `lib/src/flex_sub_themes.dart` static methods
   - Check method implementations for defaults

### Common Default Patterns

**Radius**:
- M2 buttons: 4 dp (or stadium for some)
- M3 buttons: 20-40 dp (varies by component)
- M3 cards: 12 dp
- M3 dialogs: 28 dp

**Elevation**:
- M2 ElevatedButton: 2 dp (normal), 8 dp (pressed)
- M3 ElevatedButton: 1 dp (normal), 3 dp (hovered)
- M3 Cards: 1 dp (elevated), 0 dp (filled)

**Colors**:
- M2 buttons: often use `primary` color
- M3 buttons: use `primary`, `primaryContainer`, `surface` (varies by type)

---

## Examples: Complete Implementation Flows

### Example 1: Adding a Boolean Property

**Property**: `elevatedButtonUseForegroundColor` (bool, non-nullable, default: true)

**Step 1 - Store**:
```dart
static const String keyElevatedButtonUseForegroundColor = 'elevatedButtonUseForegroundColor';
static const bool defaultElevatedButtonUseForegroundColor = true;
// Add to storageKeys list
```

**Step 2 - Controller**:
```dart
late bool _elevatedButtonUseForegroundColor;
bool get elevatedButtonUseForegroundColor => _elevatedButtonUseForegroundColor;

void setElevatedButtonUseForegroundColor(bool? value, [bool notify = true]) {
  if (value == null) return;
  if (value == _elevatedButtonUseForegroundColor) return;
  _elevatedButtonUseForegroundColor = value;
  if (notify) notifyListeners();
  unawaited(_themeService.save(Store.keyElevatedButtonUseForegroundColor, value));
}

// In loadAll():
_elevatedButtonUseForegroundColor = await _themeService.load(
    Store.keyElevatedButtonUseForegroundColor,
    Store.defaultElevatedButtonUseForegroundColor);

// In resetSettings():
setElevatedButtonUseForegroundColor(Store.defaultElevatedButtonUseForegroundColor, false);
```

**Step 3 - UI Panel** (in `buttons_panel.dart`):
```dart
SwitchListTileReveal(
  enabled: enableControl,
  value: controller.elevatedButtonUseForegroundColor,
  onChanged: controller.setElevatedButtonUseForegroundColor,
  title: const Text('Use foreground color'),
  subtitleReveal: const Text(
    'When enabled, applies the selected color to the foreground (text/icon). '
    'When disabled, applies it to the background.'
  ),
)
```

**Step 4 - Code Generation**:
```dart
final String elevatedButtonUseForegroundColor = !controller.elevatedButtonUseForegroundColor
    ? '      elevatedButtonUseForegroundColor: ${controller.elevatedButtonUseForegroundColor},\n'
    : '';
// Only include if false (true is default)
```

**Step 5 - JSON**: No changes needed (bool is standard type)

---

### Example 2: Adding a Nullable Double Property

**Property**: `elevatedButtonElevation` (double?, nullable, default: null)

**Step 1 - Store**:
```dart
static const String keyElevatedButtonElevation = 'elevatedButtonElevation';
static const double? defaultElevatedButtonElevation = null;
```

**Step 2 - Controller**:
```dart
late double? _elevatedButtonElevation;
double? get elevatedButtonElevation => _elevatedButtonElevation;

void setElevatedButtonElevation(double? value, [bool notify = true]) {
  // No null check - null is valid
  if (value == _elevatedButtonElevation) return;
  _elevatedButtonElevation = value;
  if (notify) notifyListeners();
  unawaited(_themeService.save(Store.keyElevatedButtonElevation, value));
}

// In loadAll():
_elevatedButtonElevation = await _themeService.load(
    Store.keyElevatedButtonElevation,
    Store.defaultElevatedButtonElevation);

// In resetSettings():
setElevatedButtonElevation(Store.defaultElevatedButtonElevation, false);
```

**Step 3 - Default Value Logic**:
```dart
final String elevationDefaultLabel =
    controller.elevatedButtonElevation == null
        ? useMaterial3 ? '1 dp' : '2 dp'
        : '';
```

**Step 4 - UI Panel**:
```dart
SliderListTileReveal(
  enabled: enableControl,
  title: const Text('Elevation'),
  value: controller.elevatedButtonElevation,
  onChanged: controller.setElevatedButtonElevation,
  min: 0,
  max: 24,
  divisions: 24,
  valueDecimalPlaces: 0,
  valueHeading: 'ELEV',
  valueUnitLabel: ' dp',
  valueDefaultLabel: elevationDefaultLabel,
  valueDefaultDisabledLabel: useMaterial3 ? '1 dp' : '2 dp',
  subtitleReveal: const Text('Shadow elevation when button is in default state.'),
)
```

**Step 5 - Code Generation**:
```dart
final String elevatedButtonElevation = controller.elevatedButtonElevation != null
    ? '      elevatedButtonElevation: ${controller.elevatedButtonElevation!.toStringAsFixed(1)},\n'
    : '';
```

**Step 6 - JSON**: No changes needed (double is standard type)

---

### Example 3: Adding an Enum Property

**Property**: `listTileStyle` (ListTileStyle?, nullable, default: null)

**Step 1 - Store**:
```dart
static const String keyListTileStyle = 'listTileStyle';
static const ListTileStyle? defaultListTileStyle = null;
```

**Step 2 - Controller**:
```dart
late ListTileStyle? _listTileStyle;
ListTileStyle? get listTileStyle => _listTileStyle;

void setListTileStyle(ListTileStyle? value, [bool notify = true]) {
  if (value == _listTileStyle) return;
  _listTileStyle = value;
  if (notify) notifyListeners();
  unawaited(_themeService.save(Store.keyListTileStyle, value));
}

// In loadAll():
_listTileStyle = await _themeService.load(
    Store.keyListTileStyle,
    Store.defaultListTileStyle);

// In resetSettings():
setListTileStyle(Store.defaultListTileStyle, false);
```

**Step 3 - UI Panel**:
```dart
EnumPopupMenu<ListTileStyle>(
  enabled: enableControl,
  title: const Text('List tile style'),
  value: controller.listTileStyle,
  values: ListTileStyle.values,
  onChanged: controller.setListTileStyle,
  subtitleReveal: const Text(
    'Defines the text style for ListTile titles. '
    'List style uses body text, drawer style uses smaller text.'
  ),
)
```

**Step 4 - Code Generation**:
```dart
final String listTileStyle = controller.listTileStyle != null
    ? '      listTileStyle: ${controller.listTileStyle},\n'
    : '';
```

**Step 5 - JSON** (if ListTileStyle is already supported, skip):

Add to JsonKeys:
```dart
typeEnumListTileStyle(key: 'enum_listtile_style'),
```

Add to export:
```dart
else if (object is ListTileStyle) {
  dartType = JsonKeys.typeEnumListTileStyle.key;
}
```

Add to import:
```dart
else if (_equalsIgnoreCase(dartType, JsonKeys.typeEnumListTileStyle.key)) {
  mapped = ListTileStyle.values.firstWhere(
      (ListTileStyle element) => _equalsIgnoreCase(element.name, value as String));
}
```

---

## File Reference Quick Links

### Core Architecture
- **ThemeController**: `example/lib/shared/controllers/theme_controller.dart`
- **Store**: `example/lib/shared/const/store.dart`
- **AppColor**: `example/lib/shared/const/app_color.dart`

### UI Controls
- **SwitchListTileReveal**: `example/lib/shared/widgets/universal/switch_list_tile_reveal.dart`
- **NullableBoolToggleButtons**: `example/lib/shared/widgets/universal/nullable_bool_toggle_buttons.dart`
- **SliderListTileReveal**: `example/lib/shared/widgets/universal/slider_list_tile_reveal.dart`
- **EnumPopupMenu**: `example/lib/example5_themes_playground/widgets/shared/enum_popup_menu.dart`
- **ColorSchemePopupMenu**: `example/lib/example5_themes_playground/widgets/shared/color_scheme_popup_menu.dart`
- **ColorPickerInkWellDialog**: `example/lib/example5_themes_playground/widgets/shared/color_picker_inkwell.dart`
- **ListTileReveal**: `example/lib/shared/widgets/universal/list_tile_reveal.dart`

### Code Generation & Persistence
- **Generate Theme Code**: `example/lib/example5_themes_playground/utils/generate_theme_dart_code.dart`
- **Import/Export**: `example/lib/example5_themes_playground/utils/import_export_playground_settings.dart`

### Panel Organization
- **Theme Topics**: `example/lib/example5_themes_playground/widgets/pages/model/theme_topic.dart`
- **Panels Directory**: `example/lib/example5_themes_playground/widgets/panels/`

---

## Key Architectural Principles

1. **Consistency**: Every property follows the same mechanical pattern
2. **Individual Persistence**: Each property saved separately for performance
3. **Null = Default**: Nullable properties use `null` to mean "use API default"
4. **M2/M3 Awareness**: Defaults and labels adapt to Material Design version
5. **Type Safety**: Strong typing prevents runtime errors
6. **Minimal Code Generation**: Only include non-default values
7. **Validation on Import**: Multi-layer checks for security and data integrity
8. **Fire-and-Forget Persistence**: Async saves don't block UI

---

## End of Plan

This document provides a complete, reusable pattern for adding any type of UI component to the Themes Playground. Follow the steps sequentially, use the appropriate control for each data type, and maintain consistency with the established architecture.
