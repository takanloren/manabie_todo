import 'package:dartz/dartz.dart';
import 'package:manabie_todo/todo_app/data/model/settings/todo_settings_model.dart';
import 'package:manabie_todo/todo_app/data/model/todo/todo_model.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo/todo_entity.dart';

import '../../../../common/errors/failures.dart';
import '../../entities/settings/settings_entity.dart';

abstract class TodoSettingsRepository{
  Future<Either<Failure, TodoSettingsModel>> getSettings();
  Future<Either<Failure, bool>> updateSettings(SettingsEntity settingsEntity);
}