# Todo Application - Manabie assignment for Mobile Engineer.

The only purpose for this project is Manabie assignment for Mobile Engineer.

## Development environment:

Flutter 3.0.1 • channel stable
Framework • revision fb57da5f94
Engine • revision caaafc5604
Tools • Dart 2.17.1 • DevTools 2.12.2

## Project Architecture

Clean Architecture

## Data Flow

![todo_manabie_data_flow](https://user-images.githubusercontent.com/23713997/171991144-461ca9fb-45ac-4fd9-b6af-9307c1b7db0d.png)



## Main Dependency Packages

- GetX - https://pub.dev/packages/get
- GetIt - https://pub.dev/packages/get_it
- Hive - https://pub.dev/packages/hive
- Sizer - https://pub.dev/packages/sizer
- Widgets: expandable, persistent_bottom_nav_bar, flutter_slidable

## Dependency Packages Usage
- State Management: GetX
- Service Locator: GetIt
- Multiple Language: GetX
- Light/Dark Theme: GetX
- Local Database: Hive
- Responsive UI: sizer
- Widgets: expandable, persistent_bottom_nav_bar, flutter_slidable 

## Build project

```sh
flutter pub get
```

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

```sh
flutter build apk -t lib/main.dart
```

```sh
flutter run apk -t lib/main.dart
```
## Test

```sh
flutter test .\test
```

