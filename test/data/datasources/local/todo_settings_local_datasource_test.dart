import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manabie_todo/common/util/constants.dart';
import 'package:manabie_todo/todo_app/data/datasources/local/todo_local_datasource.dart';
import 'package:manabie_todo/todo_app/data/datasources/local/todo_settings_local_datasource.dart';
import 'package:manabie_todo/todo_app/data/model/settings/todo_settings_model.dart';
import 'package:manabie_todo/todo_app/data/model/todo/todo_model.dart';


import '../../model/todo_model_data.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoSettingsModelAdapter());
  await Hive.openBox<TodoSettingsModel>(SETTINGS_LOCAL_STORAGE_NAME);
  final box = Hive.box<TodoSettingsModel>(SETTINGS_LOCAL_STORAGE_NAME);

  TodoSettingsLocalDataSourceImpl todoSettingsLocalDataSourceImpl = TodoSettingsLocalDataSourceImpl(box: box);

  setUp(() async {
    await box.clear();
  });

  test('Add default settings to local storage', () {
    todoSettingsLocalDataSourceImpl.add(TodoSettingsModel(false, "en"));
    expect(box.values.length, 1);
  });

  test('Update todo task 1', () {
    TodoSettingsModel todoSettingsModel = TodoSettingsModel(false, "en");

    todoSettingsLocalDataSourceImpl.add(todoSettingsModel);
    expect(box.values.length, 1);

    todoSettingsModel.isDarkTheme = true;
    todoSettingsModel.selectedLanguage = 'en';
    todoSettingsModel.save();

    expect(box.values.first.isDarkTheme, true);
    expect(box.values.first.selectedLanguage, 'en');
  });
}