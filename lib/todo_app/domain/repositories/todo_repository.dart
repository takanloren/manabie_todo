import 'package:dartz/dartz.dart';
import 'package:manabie_todo/todo_app/data/model/todo_model.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo_entity.dart';

import '../../../common/errors/failures.dart';

abstract class TodoRepository{
  Future<Either<Failure, List<TodoModel>>> getAllTasks();
  Future<Either<Failure, List<TodoModel>>> getIncompleteTasks();
  Future<Either<Failure, List<TodoModel>>> getCompleteTasks();
  Future<Either<Failure, bool>> addTask(TodoModel todoModel);
  Future<Either<Failure, bool>> updateTask(TodoModel todoModel);
  Future<Either<Failure, bool>> removeTask(TodoModel todoModel);
}