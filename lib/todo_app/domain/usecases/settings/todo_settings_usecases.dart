import 'package:dartz/dartz.dart';
import 'package:manabie_todo/common/extensions/extensions.dart';
import 'package:manabie_todo/todo_app/domain/repositories/settings/todo_settings_repository.dart';

import '../../../../common/errors/failures.dart';
import '../../../data/model/settings/todo_settings_model.dart';
import '../../entities/settings/settings_entity.dart';

class TodoSettingsUsecase{
  final TodoSettingsRepository todoSettingsRepository;

  TodoSettingsUsecase({required this.todoSettingsRepository});

  Future<Either<Failure, TodoSettingsModel>> getSettings() async {
    return await todoSettingsRepository.getSettings();
  }

  Future<Either<Failure, bool>> updateSettings(SettingsEntity settingsEntity) async {
    return await todoSettingsRepository.updateSettings(settingsEntity);
  }
}