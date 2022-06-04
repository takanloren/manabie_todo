import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/common/errors/failures.dart';
import 'package:manabie_todo/common/extensions/extensions.dart';
import 'package:manabie_todo/todo_app/domain/repositories/todo/todo_repository.dart';
import 'package:manabie_todo/todo_app/domain/usecases/todo/todo_usecases.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../data/model/todo_model_data.dart';
import 'todo_entities_data.dart';
import 'todo_usecase_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() async {
  TodoRepository mockTodoRepo = MockTodoRepository();
  TodoUsecase todoUsecase = TodoUsecase(todoRepository: mockTodoRepo);

  setUp(() {
    mockTodoRepo = MockTodoRepository();
    todoUsecase = TodoUsecase(todoRepository: mockTodoRepo);
  });

  test('Should get all the todo tasks', () async {
    when(mockTodoRepo.getAllTasks())
        .thenAnswer((_) async => Right([todoModel1, todoModel2, todoModel3]));

    //then
    final either = await todoUsecase.getAllTasks();

    if(either.isLeft()){
      final Failure error = either.asLeft();
      expect(error, isA<DataSourceFailure>());
    }else{
      final result = either.asRight();
      expect(result.length, 3);
      expect(result[0].description, todoModel1.description);
      expect(result[1].title, todoModel2.title);
      expect(result[2].id, todoModel3.id);
      verify(mockTodoRepo.getAllTasks()).called(1);
    }
  });

  test('Should get all the INCOMPLETE todo tasks', () async {
    when(mockTodoRepo.getIncompleteTasks())
        .thenAnswer((_) async => Right([todoModel1, todoModel4, todoModel5]));

    //then
    final either = await todoUsecase.getIncompleteTasks();

    if(either.isLeft()){
      final Failure error = either.asLeft();
      expect(error, isA<DataSourceFailure>());
    }else{
      final result = either.asRight();
      expect(result.length, 3);
      expect(result[0].description, todoModel1.description);
      expect(result[1].title, todoModel4.title);
      expect(result[2].id, todoModel5.id);
      verify(mockTodoRepo.getIncompleteTasks()).called(1);
    }
  });

  test('Should get all the COMPLETE todo tasks', () async {
    when(mockTodoRepo.getCompleteTasks())
        .thenAnswer((_) async => Right([todoModel2, todoModel3]));

    //then
    final either = await todoUsecase.getCompleteTasks();

    if(either.isLeft()){
      final Failure error = either.asLeft();
      expect(error, isA<DataSourceFailure>());
    }else{
      final result = either.asRight();
      expect(result.length, 2);
      expect(result[0].description, todoModel2.description);
      expect(result[1].title, todoModel3.title);
      verify(mockTodoRepo.getCompleteTasks()).called(1);
    }
  });
  
  test('Add a todo task', () async {
    when(mockTodoRepo.addTask(todoEntity5))
        .thenAnswer((_) async => const Right(true));

    when(mockTodoRepo.getAllTasks())
        .thenAnswer((_) async => Right([todoEntity5]));

    //then
    final either = await todoUsecase.addTask(todoEntity5);

    if(either.isRight()){
      final result = either.asRight();
      expect(result, true);
    }

    verify(mockTodoRepo.addTask(todoEntity5)).called(1);
  });

  test('Delete a todo task', () async {
    when(mockTodoRepo.removeTask(todoEntity1))
        .thenAnswer((_) async => const Right(true));

    //then
    final either = await todoUsecase.removeTask(todoEntity1);

    verify(mockTodoRepo.removeTask(todoEntity1)).called(1);
  });

  test('Update a todo task', () async {
    when(mockTodoRepo.updateTask(todoEntity3))
        .thenAnswer((_) async => const Right(true));

    //then
    final either = await todoUsecase.updateTask(todoEntity3);

    verify(mockTodoRepo.updateTask(todoEntity3)).called(1);
  });
}