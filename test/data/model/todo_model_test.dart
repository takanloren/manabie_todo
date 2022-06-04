import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/todo_app/data/model/todo/todo_model.dart';

import 'todo_model_data.dart';

void main(){
  test('Should generate TodoModel from Json', () {
    final TodoModel todoModel = TodoModel.fromJson(todoJson);

    //Expect
    expect(todoModel.id, todoJson['task_id']);
    expect(todoModel.title, todoJson['todo_title']);
    expect(todoModel.description, todoJson['todo_des']);
    expect(todoModel.completed, todoJson['completed']);
  });
}