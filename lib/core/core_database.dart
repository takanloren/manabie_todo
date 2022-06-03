import 'package:hive_flutter/adapters.dart';
import 'package:manabie_todo/todo_app/data/model/settings/todo_settings_model.dart';

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
      TodoSettingsModel defaultSettings = TodoSettingsModel(false, 'en-us');
      settingBox.add(defaultSettings);
    }

    /*await todoBox.clear();
    for(int i = 0; i < 10; i++){
      todoBox.add(TodoModel(i.toString(), 'Todo task number $i', 'description $i description description description description description description description', i % 2 == 0 ? true : false));
    }*/
  }
}