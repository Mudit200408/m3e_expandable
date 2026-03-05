# M3E Expandable

![M3E Intro](https://raw.githubusercontent.com/Mudit200408/m3e_expandable/main/doc/intro.png)

A Flutter package providing expressive, Material 3 expandable card lists with dynamically rounded corners inside normal `ListView`s and `CustomScrollView`s (via slivers). Features smooth spring-driven expand/collapse animations with expressive M3 styling.

It automatically calculates and draws the corners to fit exactly the [Material 3 Expressive](https://m3.material.io/blog/building-with-m3-expressive) spec for adjacent items. It gives extensive customization options including customizable splash ripples, custom border colors, custom elevation and highly tunable haptic feedback along with stiffness and damping for animations.

---

## 🚀 Features

- **Dynamic border radius:** The first and last items get a larger outer radius while adjoining cards receive a smaller inner radius seamlessly.
- **Sliver & Column Support:** Provides Slivers and Column wrappers out of the box to beautifully tie into complex layouts.
- **Physics & Animations:** Spring-driven physics for expanding and collapsing.
- **Highly Customizable:** Complete control over gaps, radii, colors, haptics, and padding.

---

## 📦 Installation

```yaml
dependencies:
  m3e_expandable: ^0.0.1
```

```dart
import 'package:m3e_expandable/m3e_expandable.dart';
```

---

## 🧩 Usage

Smoothly expand and collapse individual cards using `motor` spring animations.

### 🔴 Expandable M3E (Without selectedBorderRadius, allowMultipleExpanded: true)
<img src="https://raw.githubusercontent.com/Mudit200408/m3e_expandable/main/doc/expandable-no-autocollapse.gif" height="450" alt="Expandable M3E List"/>

### 🔴 Expandable M3E (With selectedBorderRadius, allowMultipleExpanded: true)
<img src="https://raw.githubusercontent.com/Mudit200408/m3e_expandable/main/doc/expandable-autocollapse.gif" height="450" alt="Expandable M3E List"/>


### Usage:

```dart
M3EExpandableCardList(
  itemCount: 10,
  allowMultipleExpanded: true,
  headerBuilder: (context, index, isExpanded) => Text('Header $index'),
  bodyBuilder: (context, index) => Text('Body content for $index'),
)
```

**Constructor Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `itemCount` | `int` | **Required** | Number of expandable items. |
| `headerBuilder` | `M3EExpandableHeaderBuilder` | **Required** | Builds the always-visible header section. |
| `bodyBuilder` | `M3EExpandableBodyBuilder` | **Required** | Builds the hidden, expandable body section. |
| `allowMultipleExpanded` | `bool` | `false` | If true, allows multiple items to be expanded simultaneously. |
| `initiallyExpanded` | `Set<int>` | `{}` | Indices of initially expanded items. |
| `outerRadius` | `double` | `24.0` | Outer radius for first/last items. |
| `innerRadius` | `double` | `4.0` | Inner radius for middle items. |
| `gap` | `double` | `3.0` | Gap between cards. |
| `color` | `Color?` | `surfaceContainerHighest` | Background colour for each card. |
| `headerPadding` | `EdgeInsetsGeometry?` | `EdgeInsets.all(16)` | Padding inside each header. |
| `bodyPadding` | `EdgeInsetsGeometry?` | `EdgeInsets.fromLTRB(16,0,16,16)` | Padding inside each body. |
| `margin` | `EdgeInsetsGeometry?` | `null` | Outer margin around each card. |
| `border` | `BorderSide?` | `null` | Border drawn around each card. |
| `elevation` | `double` | `0` | Elevation of the card. |
| `selectedBorderRadius` | `BorderRadius?` | `null` | Custom border radius for expanded items (spring-animated). |
| `showArrow` | `bool` | `true` | Shows an animated dropdown arrow in the header. |
| `trailingIcon` | `Widget?` | `null` | Custom trailing widget, replaces default arrow when provided. |
| `openStiffness` | `double` | `380` | Spring stiffness for the expand animation. |
| `openDamping` | `double` | `0.75` | Spring damping ratio for the expand animation. |
| `closeStiffness` | `double` | `380` | Spring stiffness for the collapse animation. |
| `closeDamping` | `double` | `0.75` | Spring damping ratio for the collapse animation. |
| `haptic` | `int` | `0` | Haptic feedback level on tap (0=none, 1=light, 2=medium, 3=heavy). |
| `splashColor` | `Color?` | `null` | Ink splash colour. |
| `highlightColor` | `Color?` | `null` | Ink highlight colour. |
| `splashFactory` | `InteractiveInkFeatureFactory?` | `null` | Splash factory. |
| `enableFeedback` | `bool` | `true` | Whether gestures provide acoustic/haptic feedback. |
| `onExpansionChanged` | `void Function(int, bool)?` | `null` | Called when an item is expanded or collapsed. |

> The `M3EExpandableCardList` variant also accepts `controller`, `physics`, `shrinkWrap`, and `padding` for scroll control.

> *Variants Available:* `SliverM3EExpandableCardList`, `M3EExpandableCardColumn`

---

### 🎯 Check the [Example](https://github.com/Mudit200408/m3e_expandable/tree/main/example) App for more details.

---
## 🐞 Found a bug? or ✨ You have a Feature Request?

Feel free to open a [Issue](https://github.com/Mudit200408/m3e_expandable/issues) or [Contribute](https://github.com/Mudit200408/m3e_expandable/pulls) to the project.

Hope You Love It!

----
## Credits
- [Motor](https://pub.dev/packages/motor) Pub Package for Expressive Animations
- Claude and Gemini for helping me with the code and documentation.

### Radhe Radhe 🙏
