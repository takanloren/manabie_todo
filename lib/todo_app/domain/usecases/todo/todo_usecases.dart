import 'package:dartz/dartz.dart';
import 'package:manabie_todo/common/extensions/extensions.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo/todo_entity.dart';

import '../../../../common/errors/failures.dart';
import '../../../data/model/todo/todo_model.dart';
import '../../repositories/todo/todo_repository.dart';

class TodoUsecase{
  final TodoRepository todoRepository;

  TodoUsecase({required this.todoRepository});

  Future<Either<Failure, List<TodoEntity>>> getAllTasks() async {
      final result = await todoRepository.getAllTasks();
      if(result.isLeft()){
        return Left(result.asLeft());
      }else{
        final list = result.asRight().map((e) => TodoEntity(e.id, e.title, e.description, e.completed)).toList();
        return Right(list);
      }
  }
  Future<Either<Failure, List<TodoEntity>>> getIncompleteTasks() async {
      final result = await todoRepository.getIncompleteTasks();
      if(result.isLeft()){
        return Left(result.asLeft());
      }else{
        final list = result.asRight().map((e) => TodoEntity(e.id, e.title, e.description, e.completed)).toList();
        return Right(list);
      }
  }

  Future<Either<Failure, List<TodoEntity>>> getCompleteTasks() async {
      final result = await todoRepository.getCompleteTasks();
      if(result.isLeft()){
        return Left(result.asLeft());
      }else{
        final list = result.asRight().map((e) => TodoEntity(e.id, e.title, e.description, e.completed)).toList();
        return Right(list);
      }
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