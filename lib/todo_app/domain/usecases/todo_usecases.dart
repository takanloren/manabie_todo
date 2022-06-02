import 'package:dartz/dartz.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo_entity.dart';

import '../../../common/errors/failures.dart';
import '../../data/model/todo_model.dart';
import '../repositories/todo_repository.dart';

class TodoUsecase{
  final TodoRepository todoRepository;

  TodoUsecase({required this.todoRepository});

  Future<Either<Failure, List<TodoEntity>>> getAllTasks() async {
      return await todoRepository.getAllTasks();
  }
  Future<Either<Failure, List<TodoEntity>>> getIncompleteTasks() async {
      return await todoRepository.getIncompleteTasks();
  }

  Future<Either<Failure, List<TodoEntity>>> getCompleteTasks() async {
      return await todoRepository.getCompleteTasks();
  }

  Future<Either<Failure, bool>> addTask(TodoEntity todoModel) async {
      return await todoRepository.addTask(todoModel);
  }

  Future<Either<Failure, bool>> updateTask(TodoEntity todoModel) async {
      return await todoRepository.updateTask(todoModel);
  }

  Future<Either<Failure, bool>> removeTask(TodoEntity todoModel) async {
      return await todoRepository.removeTask(todoModel);
  }
}