import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:manabie_todo/common/datasources/local/base_local_datasource.dart';
import 'package:manabie_todo/todo_app/data/datasources/local/todo_local_datasource.dart';
import 'package:manabie_todo/todo_app/data/datasources/local/todo_settings_local_datasource.dart';
import 'package:manabie_todo/todo_app/data/repositories/settings/todo_settings_repository_impl.dart';
import 'package:manabie_todo/todo_app/data/repositories/todo/todo_repository_impl.dart';
import 'package:manabie_todo/todo_app/domain/repositories/settings/todo_settings_repository.dart';
import 'package:manabie_todo/todo_app/domain/repositories/todo/todo_repository.dart';
import 'package:manabie_todo/todo_app/domain/usecases/settings/todo_settings_usecases.dart';
import 'package:manabie_todo/todo_app/domain/usecases/todo/todo_usecases.dart';

import '../common/util/constants.dart';
import '../todo_app/data/model/settings/todo_settings_model.dart';
import '../todo_app/data/model/todo/todo_model.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

class ServiceLocator{
  static Future<void> init() async {
    final todoBox = await Hive.openBox<TodoModel>(TODO_LOCAL_STORAGE_NAME);
    final settingBox = await Hive.openBox<TodoSettingsModel>(SETTINGS_LOCAL_STORAGE_NAME);

    //Data sources
    sl.registerLazySingleton<TodoLocalDataSourceImpl>(
          () => TodoLocalDataSourceImpl(box: todoBox),
    );
    sl.registerLazySingleton<TodoSettingsLocalDataSourceImpl>(
          () => TodoSettingsLocalDataSourceImpl(box: settingBox),
    );

    //Repositories
    sl.registerLazySingleton<TodoRepository>(
          () => TodoRepositoryImpl(sl()),
    );
    sl.registerLazySingleton<TodoSettingsRepository>(
          () => TodoSettingsRepositoryImpl(sl()),
    );

    //Use cases
    sl.registerLazySingleton(() => TodoUsecase(todoRepository: sl()));
    sl.registerLazySingleton(() => TodoSettingsUsecase(todoSettingsRepository: sl()));
  }
}

