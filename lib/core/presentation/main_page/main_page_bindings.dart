import 'package:get/get.dart';
import 'package:manabie_todo/core/presentation/main_page/main_page_controller.dart';
import 'package:manabie_todo/todo_app/presentation/all_task_page/controllers/all_task_controller.dart';
import 'package:manabie_todo/todo_app/presentation/settings_page/controllers/settings_controller.dart';

import '../../../todo_app/presentation/complete_task_page/controllers/completed_task_controller.dart';
import '../../../todo_app/presentation/incomplete_task_page/controllers/completed_task_controller.dart';

class MainPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTaskController());
    Get.lazyPut(() => CompletedTaskController());
    Get.lazyPut(() => InCompletedTaskController());
    Get.lazyPut(() => SettingsController());
    Get.put(MainPageController());
  }
}