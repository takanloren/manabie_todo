import 'package:dartz/dartz.dart';

import '../../../common/errors/failures.dart';
import '../../data/model/todo_model.dart';
import '../repositories/todo_repository.dart';

class TodoUsecase{
  final TodoRepository todoRepository;

  TodoUsecase({required this.todoRepository});

  Future<Either<Failure, List<TodoModel>>> getAllTasks() async {
      return await todoRepository.getAllTasks();
  }
  Future<Either<Failure, List<TodoModel>>> getIncompleteTasks() async {
      return await todoRepository.getIncompleteTasks();
  }

  Future<Either<Failure, List<TodoModel>>> getCompleteTasks() async {
      return await todoRepository.getCompleteTasks();
  }

  Future<Either<Failure, bool>> addTask(TodoModel todoModel) async {
      return await todoRepository.addTask(todoModel);
  }

  Future<Either<Failure, bool>> updateTask(TodoModel todoModel) async {
      return await todoRepository.updateTask(todoModel);
  }

  Future<Either<Failure, bool>> removeTask(TodoModel todoModel) async {
      return await todoRepository.removeTask(todoModel);
  }
}