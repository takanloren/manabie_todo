import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manabie_todo/common/themes/theme_service.dart';
import 'package:manabie_todo/todo_app/data/model/settings/todo_settings_model.dart';

import '../common/languages/localization_service.dart';
import '../common/util/constants.dart';
import '../todo_app/data/model/todo_model.dart';

class CoreDatabase{
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoModelAdapter());
    Hive.registerAdapter(TodoSettingsModelAdapter());

    final todoBox = await Hive.openBox<TodoModel>(TODO_LOCAL_STORAGE_NAME);
    final settingBox = await Hive.openBox<TodoSettingsModel>(SETTINGS_LOCAL_STORAGE_NAME);

    //Check and init default settings
    if(settingBox.values.isEmpty){
      TodoSettingsModel defaultSettings = TodoSettingsModel(false, 'en');
      settingBox.add(defaultSettings);

      //Generate default task - only on first time run app
      for(int i = 1; i <= 6; i++){
        todoBox.add(TodoModel(i.toString(), 'Todo task number $i', 'This is the description for the todo $i', i % 2 == 0 ? true : false));
      }
    }

    ThemeService.themeMode = settingBox.values.first.isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }
}