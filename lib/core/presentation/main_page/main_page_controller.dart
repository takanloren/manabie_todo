import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo_entity.dart';
import 'package:manabie_todo/todo_app/presentation/all_task_page/controllers/all_task_controller.dart';
import 'package:manabie_todo/todo_app/presentation/all_task_page/pages/all_task_page.dart';
import 'package:manabie_todo/todo_app/presentation/complete_task_page/controllers/completed_task_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../common/languages/localization_service.dart';
import '../../../common/util/enums.dart';
import '../../../todo_app/domain/usecases/todo_usecases.dart';
import '../../../todo_app/presentation/complete_task_page/pages/completed_task_page.dart';
import '../../../todo_app/presentation/incomplete_task_page/controllers/incompleted_task_controller.dart';
import '../../../todo_app/presentation/incomplete_task_page/pages/incompleted_task_page.dart';
import '../../../todo_app/presentation/settings_page/controllers/settings_controller.dart';
import '../../../todo_app/presentation/settings_page/pages/settings_page.dart';

class MainPageController extends GetxController {

  final todoUsecase = GetIt.I.get<TodoUsecase>();
  PersistentTabController mainTabController = PersistentTabController(initialIndex: 0);
  final allTaskController = Get.find<AllTaskController>();
  final completedTaskController = Get.find<CompletedTaskController>();
  final incompletedTaskController = Get.find<InCompletedTaskController>();
  final settingsController = Get.find<SettingsController>();
  int currentTabIndex = 0;

  List<Widget> buildScreens() {
    return [
      AllTaskPage(),
      CompletedTaskPage(),
      InCompletedTaskPage(),
      SettingsPage()
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ('all'.tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.check_mark_circled),
        title: ('completed'.tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.error_outline),
        title: ('incomplete'.tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ('settings'.tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    FlutterNativeSplash.remove();
  }

  @override
  void onClose() {

  }

  onTabViewChanged(int index) {
    currentTabIndex = index;
    switch(index){
      case 0:
        //All Tasks
        allTaskController.fetchData();
        break;
      case 1:
        //Completed Tasks
        completedTaskController.fetchData();
        break;
      case 2:
        //Incompleted Tasks
        incompletedTaskController.fetchData();
        break;
      case 3:
        //Settings
        break;
    }
  }

  Future<void> addNewTodo(TodoEntity newTodo) async {
    final result = await todoUsecase.addTask(newTodo);
    if(result.isRight()){
      //Refresh the current view
      onTabViewChanged(currentTabIndex);
    }
  }
}