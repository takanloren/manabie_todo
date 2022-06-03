import 'package:dartz/dartz.dart';
import 'package:manabie_todo/common/errors/failures.dart';
import 'package:manabie_todo/todo_app/data/model/settings/todo_settings_model.dart';
import 'package:manabie_todo/todo_app/domain/entities/settings/settings_entity.dart';
import 'package:manabie_todo/todo_app/domain/repositories/settings/todo_settings_repository.dart';

import '../../../../common/datasources/local/base_local_datasource.dart';

class TodoSettingsRepositoryImpl extends TodoSettingsRepository{

  final BaseLocalDataSource todoLocalDataSource;

  TodoSettingsRepositoryImpl(this.todoLocalDataSource);

  @override
  Future<Either<Failure, TodoSettingsModel>> getSettings() async {
    try{
      final settings = await todoLocalDataSource.getAll();

      if(settings.length == 1){
        return Right(settings.first);
      }
      return const Left(DataSourceFailure('getSettings failed - Settings in DB is not equal 1'));
    }
    catch(ex){
      return Left(DataSourceFailure('getSettings failed - $ex'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateSettings(SettingsEntity settingsEntity) async {
    try{
      settingsEntity.save();
      return const Right(true);
    }
    catch(ex){
      return Left(DataSourceFailure('updateSettings failed - $ex'));
    }
  }
}