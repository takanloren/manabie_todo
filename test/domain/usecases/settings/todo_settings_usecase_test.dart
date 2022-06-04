import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/common/errors/failures.dart';
import 'package:manabie_todo/common/extensions/extensions.dart';
import 'package:manabie_todo/todo_app/domain/entities/settings/settings_entity.dart';
import 'package:manabie_todo/todo_app/domain/repositories/settings/todo_settings_repository.dart';
import 'package:manabie_todo/todo_app/domain/repositories/todo_repository.dart';
import 'package:manabie_todo/todo_app/domain/usecases/settings/todo_settings_usecases.dart';
import 'package:manabie_todo/todo_app/domain/usecases/todo_usecases.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../todo_entities_data.dart';
import 'todo_settings_usecase_test.mocks.dart';

@GenerateMocks([TodoSettingsRepository])
void main() async {
  TodoSettingsRepository mockTodoSettingsRepo = MockTodoSettingsRepository();
  TodoSettingsUsecase todoSettingsUsecase = TodoSettingsUsecase(todoSettingsRepository: mockTodoSettingsRepo);

  setUp(() {
    mockTodoSettingsRepo = MockTodoSettingsRepository();
    todoSettingsUsecase = TodoSettingsUsecase(todoSettingsRepository: mockTodoSettingsRepo);
  });

  test('Should get the settings', () async {
    when(mockTodoSettingsRepo.getSettings())
        .thenAnswer((_) async => Right(settingsEntity));

    //then
    final either = await todoSettingsUsecase.getSettings();

    if(either.isLeft()){
      final Failure error = either.asLeft();
      expect(error, isA<DataSourceFailure>());
    }else{
      final settings = either.asRight();
      expect(settings.isDarkTheme, settingsEntity.isDarkTheme);
      expect(settings.selectedLanguage, settingsEntity.selectedLanguage);
      verify(mockTodoSettingsRepo.getSettings()).called(1);
    }
  });

  test('Should update the settings', () async {
    SettingsEntity settingsEntityTemp = SettingsEntity(false, 'en');

    when(mockTodoSettingsRepo.getSettings())
        .thenAnswer((_) async => Right(settingsEntityTemp));

    when(mockTodoSettingsRepo.updateSettings(settingsEntityTemp))
        .thenAnswer((_) async => const Right(true));

    //then
    final either = await todoSettingsUsecase.getSettings();

    if(either.isLeft()){
      final Failure error = either.asLeft();
      expect(error, isA<DataSourceFailure>());
    }else{
      final settings = either.asRight();
      expect(settings.isDarkTheme, settingsEntityTemp.isDarkTheme);
      expect(settings.selectedLanguage, settingsEntityTemp.selectedLanguage);
      verify(mockTodoSettingsRepo.getSettings()).called(1);
    }

    settingsEntityTemp.isDarkTheme = true;
    settingsEntityTemp.selectedLanguage = 'en';

    //then
    final either2 = await todoSettingsUsecase.updateSettings(settingsEntityTemp);

    if(either.isLeft()){
      final Failure error = either.asLeft();
      expect(error, isA<DataSourceFailure>());
    }else{
      final either = await todoSettingsUsecase.getSettings();
      final settings = either.asRight();
      expect(settings.isDarkTheme, settingsEntityTemp.isDarkTheme);
      expect(settings.selectedLanguage, settingsEntityTemp.selectedLanguage);
      verify(mockTodoSettingsRepo.updateSettings(settingsEntityTemp)).called(1);
    }
  });
}