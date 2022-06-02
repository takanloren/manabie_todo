import 'package:hive/hive.dart';
import 'package:manabie_todo/todo_app/data/model/todo_model.dart';

abstract class TodoLocalDataSource{
  Future<TodoModel?> get(String key);

  Future<List<TodoModel>> getAll();

  Future<void> put(String key, TodoModel value);

  Future<void> putAll(Map<String, TodoModel> items);

  Future<void> delete(String key);

  Future<void> deleteAll();

  Future<List<String>> get keys;

  Future<int> add(TodoModel todoModel);

  Future<void> deleteAtIndex(int index);
}

class TodoLocalDataSourceImpl extends TodoLocalDataSource{
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