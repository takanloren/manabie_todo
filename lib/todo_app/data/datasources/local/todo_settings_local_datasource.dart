import 'package:hive/hive.dart';
import 'package:manabie_todo/todo_app/data/model/settings/todo_settings_model.dart';
import 'package:manabie_todo/todo_app/data/model/todo/todo_model.dart';

import '../../../../common/datasources/local/base_local_datasource.dart';

class TodoSettingsLocalDataSourceImpl extends BaseLocalDataSource<TodoSettingsModel>{
  final Box<TodoSettingsModel> box;

  TodoSettingsLocalDataSourceImpl({required this.box});

  @override
  Future<TodoSettingsModel?> get(String key) async {
    return box.get(key);
  }

  @override
  Future<List<TodoSettingsModel>> getAll() async {
    return box.toMap().values.toList();
  }

  @override
  Future<void> put(String key, TodoSettingsModel value) async {
    await box.put(key, value);
  }

  @override
  Future<void> putAll(Map<String, TodoSettingsModel> items) async {
    await box.putAll(items);
  }

  @override
  Future<void> delete(String key) async {
    await box.delete(key);
  }

  @override
  Future<void> deleteAll() async {
    final List<String> boxKeys = await keys;
    await box.deleteAll(boxKeys);
  }

  @override
  Future<List<String>> get keys async {
    final List<String> result = box.keys.map((k) => k.toString()).toList();
    return result;
  }

  @override
  Future<int> add(TodoSettingsModel settingsModel) async {
    return box.add(settingsModel);
  }

  @override
  Future<void> deleteAtIndex(int index) async {
    return box.deleteAt(index);
  }

  @override
  Future<void> putAt(int index, TodoSettingsModel value) {
    return box.putAt(index, value);
  }
}