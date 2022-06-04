# Todo Application - Manabie assignment for Mobile Engineer.

The only purpose of this project is Manabie assignment for Mobile Engineer.

- Developed by Hà Minh Tùng.
- Email: tung.haminh1995@gmail.com

## Development environment:

- Flutter 3.0.1 - channel stable
- Framework - revision fb57da5f94
- Engine - revision caaafc5604
- Tools - Dart 2.17.1 
- DevTools 2.12.2

## Features
- Add new todo task with FAB.
- Switch between tab to view All/Completed/Incomplete/Settings screen.
- When a task is completed, it will be marked with a Checked checkbox.
- Tap on a Task to expand the view and see the Task's description.
- Sweep the task to left to reach to the delete button of the task.
- Multiple language and light/dark theme is supported.

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

## Testing

#### Unit Test and Widgets Test
```sh
flutter test .\test
```
#### Integration Test
```sh
flutter test .\integration_test\add_invalid_todo_test.dart
flutter test .\integration_test\add_valid_todo_test.dart
flutter test .\integration_test\delete_todo_test.dart
flutter test .\integration_test\nav_to_settings_test.dart
flutter test .\integration_test\open_add_dialog_test.dart
```

## Note
- By default, on the first time you run the application, six todos will be added automatically. This is done on purpose.
- A release apk already built and placed in \manabie_todo\release_apk\TodoApp_ManabieAssignment_HaMinhTung.apk