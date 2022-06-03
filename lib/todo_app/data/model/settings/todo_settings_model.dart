import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'todo_settings_model.g.dart';

@HiveType(typeId: 1)
class TodoSettingsModel extends HiveObject{
  TodoSettingsModel(this.isDarkTheme, this.selectedLanguage);

  @HiveField(0)
  bool isDarkTheme;

  @HiveField(1)
  String selectedLanguage;
}