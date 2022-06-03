import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manabie_todo/todo_app/presentation/all_task_page/controllers/all_task_controller.dart';
import 'package:manabie_todo/todo_app/presentation/all_task_page/pages/all_task_page.dart';
import 'package:manabie_todo/todo_app/presentation/complete_task_page/controllers/completed_task_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../common/util/enums.dart';
import '../../../todo_app/presentation/complete_task_page/pages/completed_task_page.dart';

class MainPageController extends GetxController {

  PersistentTabController mainTabController = PersistentTabController(initialIndex: 0);
  final allTaskController = Get.find<AllTaskController>();
  final completedTaskController = Get.find<CompletedTaskController>();
  //final allTaskController = Get.find<MainPageController>();

  List<Widget> buildScreens() {
    return [
      AllTaskPage(),
      CompletedTaskPage(),
      Container(
        child: Center(
          child: Text('Incomplete Task Screen'),
        ),
      ),
      Container(
        child: Center(
          child: Text('Settings Screen'),
        ),
      ),
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

  }

  @override
  void onClose() {

  }

  onTabViewChanged(int index) {
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
        break;
      case 3:
        //Settings
        break;
    }
  }
}