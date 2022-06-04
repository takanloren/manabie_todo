import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo/todo_entity.dart';
import 'package:manabie_todo/todo_app/presentation/add_todo/add_todo_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

import '../../../todo_app/presentation/all_task_page/pages/all_task_page.dart';
import '../../../todo_app/presentation/complete_task_page/pages/completed_task_page.dart';
import '../../../todo_app/presentation/incomplete_task_page/pages/incompleted_task_page.dart';
import '../../../todo_app/presentation/settings_page/pages/settings_page.dart';
import 'main_page_controller.dart';

class MainPage extends GetView<MainPageController> {
  MainPage({Key? key}) : super(key: key);

  final _mainPageController = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 100.h,
      child: Column(
        children: [
          SizedBox(
            height: 4.h,
            child: AppBar(
              foregroundColor: Colors.white,
              title: Text(
                'Todo App - Manabie Assignment - Dev: Hà Minh Tùng',
                style: TextStyle(fontSize: 10.sp),
              ),
              backgroundColor: const Color(0xFF395ad2),
            ),
          ),
          Expanded(
              child: PersistentTabView(
            key: const Key('bottom_nav_bar'),
            context,
            controller: _mainPageController.mainTabController,
            screens: buildScreens(),
            items: navBarsItems(),
            onItemSelected: (index) {
              _mainPageController.onTabViewChanged(index);
            },
            confineInSafeArea: true,
            backgroundColor: theme.backgroundColor,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            //
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(5),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style1,
            // Choose the nav bar style with this property.
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await Get.dialog(AddTodoDialog());

                if (result is TodoEntity) {
                  _mainPageController.addNewTodo(result);
                } else {}
              },
              child: const Icon(Icons.add),
            ),
          ))
        ],
      ),
    );
  }

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
        icon: const Icon(Icons.home, key: Key('bottom_nav_all')),
        title: ('all'.tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.check_mark_circled, key: Key('bottom_nav_completed')),
        title: ('completed'.tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.error_outline, key: Key('bottom_nav_incomplete')),
        title: ('incomplete'.tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings, key: Key('bottom_nav_settings')),
        title: ('settings'.tr),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
