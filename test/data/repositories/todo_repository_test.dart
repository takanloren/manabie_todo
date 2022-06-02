import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/common/errors/failures.dart';
import 'package:manabie_todo/common/extensions/extensions.dart';
import 'package:manabie_todo/todo_app/data/datasources/local/todo_local_datasource.dart';
import 'package:manabie_todo/todo_app/data/repositories/todo_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../model/todo_model_data.dart';
import '../repositories/todo_repository_test.mocks.dart';



@GenerateMocks([TodoLocalDataSource])
void main(){
  TodoLocalDataSource mockTodoLocalDataSource = MockTodoLocalDataSource();
  TodoRepositoryImpl todoRepositoryImpl = TodoRepositoryImpl(mockTodoLocalDataSource);

  //Before each test
  setUp(() {
    mockTodoLocalDataSource = MockTodoLocalDataSource();
    todoRepositoryImpl = TodoRepositoryImpl(mockTodoLocalDataSource);
  });

  //After each test
  tearDown(() {

  });

  group('TODO REPOSITORY TEST', () {
    test('Should get all the todo tasks', () async {
      when(mockTodoLocalDataSource.getAll())
          .thenAnswer((_) async => [todoModel1, todoModel2, todoModel3]);

      //then
      final either = await todoRepositoryImpl.getAllTasks();

      if(either.isLeft()){
        final Failure error = either.asLeft();
        expect(error, isA<DataSourceFailure>());
      }else{
        final result = either.asRight();
        expect(result.length, 3);
        expect(result[0].description, todoModel1.description);
        expect(result[1].title, todoModel2.title);
        expect(result[2].id, todoModel3.id);
        verify(mockTodoLocalDataSource.getAll()).called(1);
      }
    });

    test('Should get all the INCOMPLETE todo tasks', () async {
      when(mockTodoLocalDataSource.getAll())
          .thenAnswer((_) async => [todoModel1, todoModel4, todoModel5]);

      //then
      final either = await todoRepositoryImpl.getIncompleteTasks();

      if(either.isLeft()){
        final Failure error = either.asLeft();
        expect(error, isA<DataSourceFailure>());
      }else{
        final result = either.asRight();
        expect(result.length, 3);
        expect(result[0].description, todoModel1.description);
        expect(result[1].title, todoModel4.title);
        expect(result[2].id, todoModel5.id);
        verify(mockTodoLocalDataSource.getAll()).called(1);
      }
    });

    test('Should get all the COMPLETE todo tasks', () async {
      when(mockTodoLocalDataSource.getAll())
          .thenAnswer((_) async => [todoModel2, todoModel3]);

      //then
      final either = await todoRepositoryImpl.getCompleteTasks();

      if(either.isLeft()){
        final Failure error = either.asLeft();
        expect(error, isA<DataSourceFailure>());
      }else{
        final result = either.asRight();
        expect(result.length, 2);
        expect(result[0].description, todoModel2.description);
        expect(result[1].title, todoModel3.title);
        verify(mockTodoLocalDataSource.getAll()).called(1);
      }
    });

    test('Add a todo task', () async {
      when(mockTodoLocalDataSource.add(todoModel5))
          .thenAnswer((_) async => 1);

      when(mockTodoLocalDataSource.getAll())
          .thenAnswer((_) async => [todoModel5]);

      //then
      final either = await todoRepositoryImpl.addTask(todoModel5);

      if(either.isLeft()){
        final Failure error = either.asLeft();
        expect(error, isA<DataSourceFailure>());
      }else{
        final result = either.asRight();
        expect(result, true);

        final either2 = await todoRepositoryImpl.getAllTasks();

        if(either2.isRight()){
          final result = either2.asRight();
          expect(result.length, 1);
          expect(result[0].id, todoModel5.id);
        }
      }

      verify(mockTodoLocalDataSource.add(todoModel5)).called(1);
    });

    test('Delete a todo task', () async {
      //then
      final either = await todoRepositoryImpl.removeTask(todoModel1);

      if(either.isLeft()){
        final Failure error = either.asLeft();
        expect(error, isA<DataSourceFailure>());
      }else{
        verify(mockTodoLocalDataSource.delete(todoModel1.id)).called(1);
      }
    });

    test('Update a todo task', () async {
      //then
      final either = await todoRepositoryImpl.updateTask(todoModel3);

      if(either.isLeft()){
        final Failure error = either.asLeft();
        expect(error, isA<DataSourceFailure>());
      }else{
        verify(mockTodoLocalDataSource.put(todoModel3.id, todoModel3)).called(1);
      }
    });
  });
}