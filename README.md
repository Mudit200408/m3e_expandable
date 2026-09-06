# M3E Expandable

![M3E Intro](https://raw.githubusercontent.com/Mudit200408/m3e_expandable/main/doc/intro.png)

A Flutter package providing expressive, Material 3 expandable card lists with dynamically rounded corners inside normal `ListView`s, `Column`s, `CustomScrollView`s (via slivers), and spring-physics reorderable lists (`M3EReorderableExpandableList`). Features smooth spring-driven expand/collapse animations with expressive M3 styling.

It automatically calculates and draws the corners to fit exactly the [Material 3 Expressive](https://m3.material.io/blog/building-with-m3-expressive) spec for adjacent items. It gives extensive customization options including `InkSparkle` splash ripples, custom border colors, custom elevation, pressed scale micro-interactions, zero-layout-impact focus rings, and highly tunable haptic feedback along with stiffness and damping for animations.

---

## 🎮 Interactive Demo

You can try out the package demo here: [m3e_core demo](https://mudit200408.github.io/m3e_core/)

---

## 🚀 Features

- **Dynamic border radius:** The first and last items get a larger outer radius while adjoining cards receive a smaller inner radius seamlessly.
- **Spring-Physics Reordering:** `M3EReorderableExpandableList` with spring lift-off motion, dynamic placeholder slots, bouncy neighbor displacement, and smooth snap settling.
- **Pressed Scale Micro-Interactions:** Tactile spring-driven squish feedback on touch/pointer down via `pressedScale` and `pressedMotion`.
- **Keyboard Navigation & Focus Rings:** Zero-layout-impact `ExpandableFocusRing` with concentric corner contours, arrow navigation, Enter/Space activation, and keyboard reordering (`Alt/Option + ArrowUp/ArrowDown`).
- **Sliver, Column, ListView & Reorderable Support:** Provides Slivers, Column, ListView, and Reorderable wrappers out of the box.
- **Physics & Animations:** Spring-driven physics for expanding and collapsing with expressive presets via `M3EMotion`.
- **Expressive Splash:** Default `InkSparkle` splash effect for a modern Material 3 feel.
- **Highly Customizable:** Complete control over gaps, radii, colors, haptics, focus rings, and padding via `M3EExpandableStyle`.
- **Global Theming:** Set defaults for all expandable lists using `M3EExpandableTheme`.

---

## 📦 Installation

> [!IMPORTANT]
> **Flutter 3.47+ & `material_ui` Requirement (v1.0.0+)**:
> Starting with `v1.0.0`, `m3e_expandable` is migrated to use the standalone `material_ui` package decoupled in **Flutter 3.47.0**.
> - Requires Flutter SDK **`>=3.47.0`**.
> - Ensure your app imports `package:material_ui/material_ui.dart` (or run `dart fix --apply --code=migrate_design_widgets`).
> - If you are on Flutter `< 3.47.0`, please use `m3e_expandable: ^0.1.0`.

Add `m3e_expandable` and `material_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  material_ui: ^1.0.0
  m3e_expandable: ^1.0.2
```

```dart
import 'package:material_ui/material_ui.dart';
import 'package:m3e_expandable/m3e_expandable.dart';
```

---

## ⚠️ Breaking Changes in v0.1.0

The API has been significantly refactored for better maintainability and more expressive styling options.

- **Parameter Consolidation**: Most visual parameters (`outerRadius`, `innerRadius`, `gap`, `padding`, `colors`, `elevation`) have been moved into the `M3EExpandableStyle` class.
- **Haptic API**: The `haptic` parameter has changed from an `int` (0-3) to the `M3EHapticFeedback` enum (`none`, `light`, `medium`, `heavy`).
- **Constructor Changes**: 
    - The default constructor now takes a `List<M3EExpandableData>` for a data-driven approach.
    - Manual builders are now accessed via the `.builder` constructor.
- **Builder Signatures**: 
    - `headerBuilder` now receives `double progress` instead of `bool isExpanded`.
    - `bodyBuilder` now receives `double progress`, allowing for custom animations during expansion.
- **Icon API**: `showArrow` and `trailingIcon` are replaced by `expandIcon`, `collapseIcon`, and `iconPlacement` inside `M3EExpandableStyle`.
- **Motion API**: `openStiffness`, `openDamping`, etc., are replaced by `M3EMotion` objects passed to `expandMotion` and `collapseMotion`.
- **Shape API**: `selectedBorderRadius` (BorderRadius) is replaced by `expandedRadius` (double) in the style configuration for uniform corner morphing.

---

## 🧩 Quick Start

### Data-Driven (Simple)
Use `M3EExpandableData` for a quick setup with standard M3 layouts.

```dart
M3EExpandableCardList(
  data: [
    M3EExpandableData(
      title: 'Battery level low',
      subtitle: 'Plug in your device to avoid losing your work.',
      leading: const Icon(Icons.battery_alert),
      body: const Text('Your battery is at 10% and will run out soon.'),
    ),
    // ... more items
  ],
)
```

### Manual Control (Builder)
Use the `.builder` constructor for full control over the header and body content.

```dart
M3EExpandableCardList.builder(
  itemCount: 10,
  headerBuilder: (context, index, progress) => Text('Header $index (Progress: $progress)'),
  bodyBuilder: (context, index, progress) => Text('Body content for $index'),
)
```

### Reorderable Expandable List
Use `M3EReorderableExpandableList` for spring-physics reordering while preserving expandable card states.

```dart
List<M3EExpandableData> items = [
  M3EExpandableData(title: 'Task 1', body: const Text('Details for task 1')),
  M3EExpandableData(title: 'Task 2', body: const Text('Details for task 2')),
  M3EExpandableData(title: 'Task 3', body: const Text('Details for task 3')),
];

M3EReorderableExpandableList(
  data: items,
  buildDefaultDragHandles: true,
  onReorder: (oldIndex, newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  },
)
```

---

## 📖 Detailed API Guide

### 1. `M3EExpandableData`
Defines content for data-driven constructors.

| Property | Type | Description |
|---|---|---|
| `title` | `String` | Main title text. |
| `titleStyle` | `List<TextStyle>?` | `[collapsed, expanded]` for lerping or `[single]` for constant style. |
| `subtitle` | `String?` | Optional text subtitle that auto-animates. |
| `subtitleStyle` | `List<TextStyle>?` | `[collapsed, expanded]` or `[single]` for subtitle text. |
| `subtitleMaxLines`| `int?` | Max lines for subtitle when collapsed (default 1). |
| `body` | `Widget?` | Static body content. |
| `bodyBuilder` | `WidgetBuilder?` | Dynamic body content builder (preferred for stateful content). |
| `leading` | `Widget?` | Optional leading widget (e.g., Icon). |
| `trailing` | `Widget?` | Optional trailing widget (placed before/after expansion icon). |

---

### 2. `M3EExpandableStyle`
Complete visual and interaction configuration.

| Category | Property | Type | Default | Description |
|---|---|---|---|---|
| **Shape** | `outerRadius` | `double` | `24.0` | Radius for outermost corners. |
| | `innerRadius` | `double` | `6.0` | Radius for adjacent/middle corners. |
| | `hoverRadius` | `double` | `10.0` | Inner radius when hovered. |
| | `pressedRadius` | `double` | `4.0` | Inner radius when pressed. |
| | `expandedRadius`| `double?` | `null` | Uniform radius when expanded. |
| | `gap` | `double` | `3.0` | Space between cards. |
| **Colors** | `color` | `Color?` | `surfaceContainerHighest` | Background color. |
| | `splashColor` | `Color?` | `null` | Ink ripple color. |
| | `highlightColor`| `Color?` | `null` | Ink highlight color. |
| | `splashFactory` | `InteractiveInkFeatureFactory?` | `InkSparkle.splashFactory` | Custom ink splash factory. |
| | `border` | `BorderSide?`| `null` | [BorderSide] around each card. |
| | `elevation` | `double` | `0` | Card elevation. |
| **Focus Ring** | `focusRingColor` | `Color?` | `null` (ColorScheme.primary) | Focus outline ring color. |
| | `focusRingWidth` | `double` | `2.0` | Stroke width of the focus ring. |
| | `focusRingGap` | `double` | `0.0` | Gap between card edge and focus ring. |
| **Press Scale** | `pressedScale` | `double?` | `null` | Scale factor on touch down (e.g. `0.95`). |
| | `pressedMotion` | `M3EMotion` | `M3EMotion.expressiveSpatialFast` | Motion used for press squish animation. |
| **Padding**| `headerPadding`| `EdgeInsetsGeometry?`| `16, 14, 16, 2` | Padding inside the header. |
| | `bodyPadding` | `EdgeInsetsGeometry?`| `16, 0, 16, 20` | Padding inside the expanded body. |
| | `margin` | `EdgeInsetsGeometry?`| `0` | Outer margin around each card. |
| | `titleSubtitleGap`| `double` | `4.0` | Gap between title and subtitle in simple mode. |
| **Icon** | `expandIcon` | `Widget?` | `Icons.expand_more_rounded`| Icon when collapsed. |
| | `collapseIcon` | `Widget?` | `Icons.expand_more_rounded`| Icon when expanded. |
| | `iconPlacement` | `IconPlacement` | `right` | Placement of expansion icon (`left`/`right`). |
| | `iconPadding` | `EdgeInsetsGeometry`| `8.0` | Padding around the icon. |
| | `iconRotationAngle`| `double` | `pi` | Rotation angle during expansion. |
| **Behavior**| `useInkWell` | `bool` | `true` | Use Material Ink ripple. |
| | `tapHeaderToToggle`| `bool` | `true` | Header tap toggles expansion. |
| | `tapBodyToExpand`| `bool` | `false` | Body tap triggers expansion. |
| | `tapBodyToCollapse`| `bool` | `false` | Body tap triggers collapse. |
| | `tapIconToToggle`| `bool` | `false` | Only the icon can toggle expansion. |
| **Feedback**| `haptic` | `M3EHapticFeedback` | `none` | Haptic level (`none`, `light`, `medium`, `heavy`). |
| | `enableFeedback`| `bool` | `true` | System sound/haptic feedback. |
| | `expandTooltip` | `String?` | `'Expand'` | Accessibility tooltip for expansion. |
| | `collapseTooltip`| `String?` | `'Collapse'` | Accessibility tooltip for collapse. |
| **Alignment**| `headerAlignment`| `CrossAxisAlignment` | `start` | Vertical alignment of header content. |
| | `bodyAlignment` | `AlignmentGeometry` | `topLeft` | Alignment of body content. |

---

### 3. `M3EMotion`
Spring physics presets for animations. All presets use specific stiffness and damping values to achieve their respective feels.

#### 🏗️ Spatial Presets (Shape Morphing)
Used for animating the container shape and border radius.

| Preset Name | Stiffness | Damping | Description |
|---|---|---|---|
| `standardSpatialFast` | `1400` | `0.9` | Snappy spring for responsive feel. |
| `standardSpatialDefault`| `700` | `0.9` | Balanced spring for general use. |
| `standardSpatialSlow` | `300` | `0.9` | Relaxed spring for dramatic feel. |
| `aospSpatial` | `380` | `1.0` | Matches AOSP's notification list feel (no bounce). |
| `expressiveSpatialFast` | `800` | `0.6` | Bouncier spring for expressive feel. |
| `expressiveSpatialDefault`| `380` | `0.75` | Bouncy, balanced spring for expressive feel. |
| `expressiveSpatialSlow` | `200` | `0.8` | Very bouncy spring for dramatic expressive feel. |

#### ✨ Effects Presets (Opacity/Scale)
Used for internal content animations like cross-fades.

| Preset Name | Stiffness | Damping | Description |
|---|---|---|---|
| `standardEffectsFast` | `3800` | `1.0` | Snappy effect animation. |
| `standardEffectsDefault`| `1600` | `1.0` | Balanced effect animation. |
| `standardEffectsSlow` | `800` | `1.0` | Relaxed effect animation. |
| `expressiveEffectsFast` | `3800` | `1.0` | Snappy expressive effect. |
| `expressiveEffectsDefault`| `1600` | `1.0` | Balanced expressive effect. |
| `expressiveEffectsSlow` | `800` | `1.0` | Relaxed expressive effect. |

#### 🛠️ Custom Motion
Create a custom spring with specific physics:
```dart
M3EMotion.custom(stiffness: 380, damping: 0.75, snapToEnd: false)
```

---

### 4. `M3EExpandableTheme`
Wrap your app to provide global defaults.

| Property | Type | Default | Description |
|---|---|---|---|
| `style` | `M3EExpandableStyle` | `const M3EExpandableStyle()` | Global visual style. |
| `expandMotion` | `M3EMotion` | `M3EMotion.aospSpatial` | Default motion for expanding. |
| `collapseMotion`| `M3EMotion` | `M3EMotion.aospSpatial` | Default motion for collapsing. |
| `allowMultipleExpanded`| `bool` | `false` | Allow multiple items open at once. |

```dart
M3EExpandableTheme(
  data: M3EExpandableThemeData(
    style: M3EExpandableStyle(outerRadius: 32, gap: 4),
    expandMotion: M3EMotion.expressiveSpatialDefault,
    collapseMotion: M3EMotion.standardSpatialFast,
    allowMultipleExpanded: true,
  ),
  child: MyApp(),
)
```

---

### 5. `M3EReorderableExpandableList`
A spring-physics reorderable expandable card list that combines full collapsible/expandable card functionality with dynamic destination placeholder slots, spring lift-off motion, bouncy neighbor displacement, and smooth snap settling.

| Parameter | Type | Default | Description |
|---|---|---|---|
| `onReorder` | `ReorderCallback` | **required** | Callback when an item moves to a new position. |
| `keyBuilder` | `Key Function(int)?` | `null` | Generates a stable key for each item across reorders. |
| `buildDefaultDragHandles` | `bool` | `false` | Automatically renders drag handle icons in the header. |
| `dragElevation` | `double` | `8.0` | Elevation applied to the dragged item. |
| `dragScale` | `double` | `1.0` | Scale factor applied to the item while dragged. |
| `dragBorderRadius` | `BorderRadius?` | `null` | Border radius applied to the proxy during dragging. |
| `dragColor` | `Color?` | `null` | Background color for the dragged item proxy. |
| `dragPlaceholderColor` | `Color?` | `null` | Background color for the drop placeholder slot. |
| `dragPlaceholderBorder`| `BorderSide?` | `null` | Outline border for the placeholder slot. |
| `dragPlaceholderRadius`| `double?` | `null` | Corner radius for the placeholder slot container. |
| `dragPlaceholderBuilder`| `Widget Function(BuildContext, int, Size)?` | `null` | Custom builder for the drop slot placeholder. |
| `reorderMotion` | `M3EMotion` | `expressiveSpatialFast` | Motion physics for settling and neighbor shifts. |
| `emptyBuilder` | `WidgetBuilder?` | `null` | Builder displayed when `itemCount` is 0. |

---

### 6. Widget Parameters (Common)
All list variants (`CardList`, `CardColumn`, `SliverList`, `ReorderableList`) share these core parameters:

| Parameter | Type | Description |
|---|---|---|
| `allowMultipleExpanded` | `bool?` | Overrides theme's multi-expand setting. |
| `initiallyExpanded` | `Set<int>` | Indices of cards open on first build (default `{}`). |
| `onExpansionChanged` | `Function(int, bool)?`| Callback when a card is toggled. |
| `style` | `M3EExpandableStyle?` | Custom style for this specific list. |
| `expandMotion` | `M3EMotion?` | Custom expansion motion for this list. |
| `collapseMotion` | `M3EMotion?` | Custom collapse motion for this list. |

---

### 7. ⌨️ Keyboard Shortcuts & Accessibility

Cards support full keyboard navigation and zero-layout-impact focus indicators out of the box:

- **Focus & Traversal:** Navigate between items using `Tab` / `Shift+Tab`.
- **Toggle Expansion:** Press `Enter` or `Space` to toggle expand/collapse.
- **Directional Expand / Collapse:** Press `ArrowRight` or `ArrowDown` to expand; `ArrowLeft` or `ArrowUp` to collapse.
- **Keyboard Reordering:** In `M3EReorderableExpandableList`, press `Alt + ArrowDown` (or `Option + ArrowDown`) to reorder the item forward, and `Alt + ArrowUp` (or `Option + ArrowUp`) to reorder backward.

---

## 🐞 Found a bug? or ✨ You have a Feature Request?

Feel free to open an [Issue](https://github.com/Mudit200408/m3e_expandable/issues) or [Contribute](https://github.com/Mudit200408/m3e_expandable/pulls) to the project.

Hope You Love It!

----
## Credits
- [Motor](https://pub.dev/packages/motor) Pub Package for Expressive Animations
- Claude and Gemini for helping me with the code and documentation.

### Radhe Radhe 🙏
