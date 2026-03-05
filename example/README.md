# M3E Expandable Example App

This example app demonstrates the various components provided by the `m3e_expandable` package.

## M3E Expandable Card List
A card list with items that can be expanded to reveal more content.

### ListView (`M3EExpandableCardList`)
```dart
M3EExpandableCardList(
  itemCount: items.length,
  allowMultipleExpanded: true,
  headerBuilder: (context, index, isExpanded) => Text('Header $index'),
  bodyBuilder: (context, index) => Text('Body $index'),
)
```

### Sliver (`SliverM3EExpandableCardList`)
```dart
CustomScrollView(
  slivers: [
    SliverM3EExpandableCardList(
      itemCount: items.length,
      allowMultipleExpanded: false, // Auto-collapses other items when one is expanded
      headerBuilder: (context, index, isExpanded) => Text('Header $index'),
      bodyBuilder: (context, index) => Text('Body $index'),
    ),
  ],
)
```

### Column (`M3EExpandableCardColumn`)
```dart
M3EExpandableCardColumn(
  itemCount: items.length,
  allowMultipleExpanded: true,
  headerBuilder: (context, index, isExpanded) => Text('Header $index'),
  bodyBuilder: (context, index) => Text('Body $index'),
)
```
