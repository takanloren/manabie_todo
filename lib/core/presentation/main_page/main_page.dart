import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo_entity.dart';
import 'package:manabie_todo/todo_app/presentation/add_todo/add_todo_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

import 'main_page_controller.dart';

class MainPage extends GetView<MainPageController> {
  MainPage({Key? key}) : super(key: key);

  final _mainPageController = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 100.h,
      child: Column(
        children: [
          Container(
            height: 5.h,
            child: AppBar(
              title: Text('Manabie Assignment - Hà Minh Tùng'),
              backgroundColor: Colors.blueGrey,
            ),
          ),
          Expanded(
              child: PersistentTabView(
            context,
            controller: _mainPageController.mainTabController,
            screens: _mainPageController.buildScreens(),
            items: _mainPageController.navBarsItems(),
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
                  print(result.toString());
                  _mainPageController.addNewTodo(result as TodoEntity);
                } else {}
              },
              child: const Icon(Icons.add),
            ),
          ))
        ],
      ),
    );
  }
}
