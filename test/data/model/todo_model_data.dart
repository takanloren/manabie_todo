import 'package:manabie_todo/todo_app/data/model/todo_model.dart';

TodoModel todoModel1 = TodoModel("1","TodoTitleTest1", false);
TodoModel todoModel2 = TodoModel("2","TodoTitleTest2", true);
TodoModel todoModel3 = TodoModel("3","TodoTitleTest3", true);
TodoModel todoModel4 = TodoModel("4","TodoTitleTest4", false);
TodoModel todoModel5 = TodoModel("5","TodoTitleTest5", false);

Map<String, dynamic> todoJson = {
'task_id': '123456',
'todo_title': 'title',
'todo_des': 'description',
'completed': false,
};