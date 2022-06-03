import 'package:hive/hive.dart';
import 'package:manabie_todo/todo_app/data/model/todo_model.dart';

import '../../../../common/datasources/local/base_local_datasource.dart';

class TodoLocalDataSourceImpl extends BaseLocalDataSource<TodoModel>{
  final Box<TodoModel> box; //= Hive.box<TodoModel>(TODO_LOCAL_STORAGE_NAME);

  TodoLocalDataSourceImpl({required this.box});

  @override
  Future<TodoModel?> get(String key) async {
    return box.get(key);
  }

  @override
  Future<List<TodoModel>> getAll() async {
    return box.toMap().values.toList();
  }

  @override
  Future<void> put(String key, TodoModel value) async {
    await box.put(key, value);
  }

  @override
  Future<void> putAt(int index, TodoModel value) async {
    await box.putAt(index, value);
  }

  @override
  Future<void> putAll(Map<String, TodoModel> items) async {
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
  Future<int> add(TodoModel todoModel) async {
    return box.add(todoModel);
  }

  @override
  Future<void> deleteAtIndex(int index) async {
    return box.deleteAt(index);
  }
}