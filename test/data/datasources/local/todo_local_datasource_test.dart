import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:manabie_todo/common/util/constants.dart';
import 'package:manabie_todo/todo_app/data/datasources/local/todo_local_datasource.dart';
import 'package:manabie_todo/todo_app/data/model/todo_model.dart';


import '../../model/todo_model_data.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>(TODO_LOCAL_STORAGE_NAME);
  final box = Hive.box<TodoModel>(TODO_LOCAL_STORAGE_NAME);

  TodoLocalDataSourceImpl todoLocalDataSourceImpl = TodoLocalDataSourceImpl(box: box);

  setUp(() async {
    await box.clear();
  });

  test('Add a todo task to local storage', () {
    todoLocalDataSourceImpl.add(todoModel1);
    expect(box.values.length, 1);
    todoLocalDataSourceImpl.add(todoModel2);
    expect(box.values.length, 2);
    todoLocalDataSourceImpl.add(todoModel3);
    expect(box.values.length, 3);
  });

  test('Remove todo task from local storage', () {
    todoLocalDataSourceImpl.add(todoModel1);
    expect(box.values.length, 1);
    todoLocalDataSourceImpl.add(todoModel2);
    expect(box.values.length, 2);
    todoLocalDataSourceImpl.add(todoModel3);
    expect(box.values.length, 3);

    todoLocalDataSourceImpl.deleteAtIndex(0);
    expect(box.values.length, 2);
  });

  test('Update todo task', () {
    TodoModel todoModel1 = TodoModel("1","TodoTitleTest1", false);

    todoLocalDataSourceImpl.add(todoModel1);
    expect(box.values.length, 1);

    todoModel1.completed = true;
    todoModel1.title = 'Modified';
    todoModel1.save();

    expect(box.values.first.completed, true);
    expect(box.values.first.title, 'Modified');
  });
}