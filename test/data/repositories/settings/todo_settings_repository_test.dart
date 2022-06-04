import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/common/datasources/local/base_local_datasource.dart';
import 'package:manabie_todo/common/errors/failures.dart';
import 'package:manabie_todo/common/extensions/extensions.dart';
import 'package:manabie_todo/todo_app/data/datasources/local/todo_settings_local_datasource.dart';
import 'package:manabie_todo/todo_app/data/repositories/settings/todo_settings_repository_impl.dart';
import 'package:manabie_todo/todo_app/domain/entities/settings/settings_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/usecases/todo_entities_data.dart';
import 'todo_settings_repository_test.mocks.dart';


@GenerateMocks([TodoSettingsLocalDataSourceImpl])
void main(){
  TodoSettingsLocalDataSourceImpl mockBaseDS = MockTodoSettingsLocalDataSourceImpl();
  TodoSettingsRepositoryImpl todoSettingsRepositoryImpl = TodoSettingsRepositoryImpl(mockBaseDS);

  //Before each test
  setUp(() {
    mockBaseDS = MockTodoSettingsLocalDataSourceImpl();
    todoSettingsRepositoryImpl = TodoSettingsRepositoryImpl(mockBaseDS);
  });

  //After each test
  tearDown(() {

  });

  group('TODO SETTINGS REPOSITORY TEST', () {
    test('Should get the settings', () async {
      when(mockBaseDS.getAll())
          .thenAnswer((_) async => [settingsEntity]);

      //then
      final either = await todoSettingsRepositoryImpl.getSettings();

      if(either.isLeft()){
        final Failure error = either.asLeft();
        expect(error, isA<DataSourceFailure>());
      }else{
        final settings = either.asRight();
        expect(settings.isDarkTheme, settingsEntity.isDarkTheme);
        expect(settings.selectedLanguage, settingsEntity.selectedLanguage);
        verify(mockBaseDS.getAll()).called(1);
      }
    });

    test('Should update the settings', () async {
      SettingsEntity settingsEntityTemp = SettingsEntity(false, 'en');
      settingsEntityTemp.isDarkTheme = true;
      //then
      final either = await todoSettingsRepositoryImpl.updateSettings(settingsEntityTemp);

      if(either.isLeft()){
        final Failure error = either.asLeft();
        expect(error, isA<DataSourceFailure>());
      }else{
        final result = either.asRight();
        expect(result, true);
      }
    });
  });
}