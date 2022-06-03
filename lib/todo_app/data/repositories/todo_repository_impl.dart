import 'package:dartz/dartz.dart';
import 'package:manabie_todo/common/errors/failures.dart';
import 'package:manabie_todo/todo_app/data/model/todo_model.dart';
import 'package:manabie_todo/todo_app/domain/repositories/todo_repository.dart';

import '../../../common/datasources/local/base_local_datasource.dart';

class TodoRepositoryImpl extends TodoRepository{

  final BaseLocalDataSource todoLocalDataSource;

  TodoRepositoryImpl(this.todoLocalDataSource);

  @override
  Future<Either<Failure, bool>> addTask(TodoModel todoModel) async {
    try{
      await todoLocalDataSource.add(todoModel);
      return const Right(true);
    }
    catch(ex){
      return Left(DataSourceFailure('addTask failed - $ex'));
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> getAllTasks() async {
    try{
      final result = await todoLocalDataSource.getAll();
      return Right(result as List<TodoModel>);
    }
    catch(ex){
      return Left(DataSourceFailure('get all task failed - $ex'));
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> getCompleteTasks() async {
    try{
      final getAll = await todoLocalDataSource.getAll();
      var result = getAll.where((todo) => todo.completed).toList();
      return Right(result as List<TodoModel>);
    }
    catch(ex){
      return Left(DataSourceFailure('get completed task failed - $ex'));
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> getIncompleteTasks() async {
    try{
      final getAll = await todoLocalDataSource.getAll();
      var result = getAll.where((todo) => !todo.completed).toList();
      return Right(result as List<TodoModel>);
    }
    catch(ex){
      return Left(DataSourceFailure('get incompleted task failed - $ex'));
    }
  }

  @override
  Future<Either<Failure, bool>> removeTask(TodoModel todoModel) async {
    try{
      final getAll = await todoLocalDataSource.getAll();

      if (getAll.any((v) => v.id == todoModel.id)) {
        final removedIndex = getAll.indexWhere((v) => v.id == todoModel.id);
        await todoLocalDataSource.deleteAtIndex(removedIndex);
        return const Right(true);
      }
      return const Left(DataSourceFailure('remove task failed - Target task not existing'));
    }
    catch(ex){
      return Left(DataSourceFailure('remove task failed - $ex'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateTask(TodoModel todoModel) async {
    try{
      await todoModel.save();
      return const Right(true);
    }
    catch(ex){
      return Left(DataSourceFailure('updateTask failed - $ex'));
    }
  }

}