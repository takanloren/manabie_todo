import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:manabie_todo/common/extensions/extensions.dart';
import 'package:manabie_todo/todo_app/domain/entities/settings/settings_entity.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo_entity.dart';
import 'package:manabie_todo/todo_app/domain/usecases/todo_usecases.dart';
import 'dart:io' show Platform;

import '../../../../common/languages/localization_service.dart';
import '../../../domain/usecases/settings/todo_settings_usecases.dart';

class SettingsController extends GetxController {
  final settingsUsecase = GetIt.I.get<TodoSettingsUsecase>();
  var isLoading = false.obs;
  Rx<SettingsEntity> currentSettings = SettingsEntity(false, 'en').obs;
  var currentLangCode = 'en'.obs;


  @override
  void onInit() async {
    await fetchData();
    print('onInit Setting Controller- ${currentSettings.value.selectedLanguage}');

    if (!Platform.environment.containsKey('FLUTTER_TEST')){
      print('LocalizationService.changeLocale in SettingsController');
      LocalizationService.changeLocale(currentSettings.value.selectedLanguage);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future fetchData() async {
    final result = await settingsUsecase.getSettings();
    if(result.isRight()){
      currentSettings = result.asRight().obs;
      currentLangCode.value = currentSettings.value.selectedLanguage;
    }
  }

  void onThemeModeToggled(int index) {
    if(index == 0){
      //Switch to light mode
      Get.changeThemeMode(ThemeMode.light);
      currentSettings.value.isDarkTheme = false;
    }else{
      //Switch to dark mode
      Get.changeThemeMode(ThemeMode.dark);
      currentSettings.value.isDarkTheme = true;
    }

    settingsUsecase.updateSettings(currentSettings.value);
  }

  void onLanguageSelected(String? value) {
    currentSettings.value.selectedLanguage = value!;
    settingsUsecase.updateSettings(currentSettings.value);

    currentLangCode.value = value;
    LocalizationService.changeLocale(value);
  }
}