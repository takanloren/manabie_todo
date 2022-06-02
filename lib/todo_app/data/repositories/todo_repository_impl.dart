import 'package:dartz/dartz.dart';
import 'package:manabie_todo/common/errors/failures.dart';
import 'package:manabie_todo/todo_app/data/datasources/local/todo_local_datasource.dart';
import 'package:manabie_todo/todo_app/data/model/todo_model.dart';
import 'package:manabie_todo/todo_app/domain/repositories/todo_repository.dart';

import '../../domain/entities/todo_entity.dart';

class TodoRepositoryImpl extends TodoRepository{

  final TodoLocalDataSourceImpl todoLocalDataSourceImpl;

  TodoRepositoryImpl(this.todoLocalDataSourceImpl);

  @override
  Future<Either<Failure, bool>> addTask(TodoModel todoModel) async {
    // TODO: implement addTask
    return const Right(false);
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getAllTasks() async {
    // TODO: implement getAllTasks
    return const Left(DataSourceFailure('get all task failed'));
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getCompleteTasks() async {
    // TODO: implement getCompleteTasks
    return const Left(DataSourceFailure('get completed task failed'));
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getIncompleteTasks() async {
    // TODO: implement getIncompleteTasks
    return const Left(DataSourceFailure('get incomplete task failed'));
  }

  @override
  Future<Either<Failure, bool>> removeTask(TodoModel todoModel) async {
    // TODO: implement removeTask
    return const Right(false);
  }

  @override
  Future<Either<Failure, bool>> updateTask(TodoModel todoModel) async {
    // TODO: implement updateTask
    return const Right(false);
  }

}