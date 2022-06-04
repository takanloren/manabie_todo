import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:manabie_todo/core/core_main.dart';
import 'package:manabie_todo/core/presentation/main_page/main_page.dart';
import 'package:manabie_todo/core/presentation/main_page/main_page_controller.dart';
import 'package:manabie_todo/todo_app/presentation/add_todo/add_todo_widget.dart';
import 'package:manabie_todo/todo_app/presentation/all_task_page/controllers/all_task_controller.dart';
import 'package:manabie_todo/todo_app/presentation/all_task_page/pages/all_task_page.dart';
import 'package:manabie_todo/todo_app/presentation/complete_task_page/controllers/completed_task_controller.dart';
import 'package:manabie_todo/todo_app/presentation/complete_task_page/pages/completed_task_page.dart';
import 'package:manabie_todo/todo_app/presentation/incomplete_task_page/controllers/incompleted_task_controller.dart';
import 'package:manabie_todo/todo_app/presentation/incomplete_task_page/pages/incompleted_task_page.dart';
import 'package:manabie_todo/todo_app/presentation/settings_page/controllers/settings_controller.dart';
import 'package:manabie_todo/todo_app/presentation/settings_page/pages/settings_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  const IconData iconData = Icons.add;


  setUpAll(() async {
    await CoreMain.init();
    SizerUtil.height = 1000;
    SizerUtil.width = 400;
    Get.lazyPut(() => AllTaskController());
    Get.lazyPut(() => CompletedTaskController());
    Get.lazyPut(() => InCompletedTaskController());
    Get.lazyPut(() => SettingsController());
    Get.put(MainPageController());
  });

  Widget createWidgetForTesting({required Widget child}){
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('MainPage contains the Add FAB', (tester) async {
    await tester.pumpWidget(MaterialApp(home: MainPage(),));

    final addFABFinder = find.widgetWithIcon(FloatingActionButton, iconData);

    expect(addFABFinder, findsOneWidget);
  });

  testWidgets('MainPage contains the AppBar', (tester) async {
    await tester.pumpWidget(MaterialApp(home: MainPage(),));

    final appBarFinder = find.widgetWithText(AppBar, 'Todo App - Manabie Assignment - Dev: Hà Minh Tùng');

    expect(appBarFinder, findsOneWidget);
  });

  testWidgets('MainPage contains the Bottom nav bar', (tester) async {
    await tester.pumpWidget(MaterialApp(home: MainPage(),));
    final bottomNavBarFinder = find.widgetWithIcon(PersistentTabView, iconData);

    expect(bottomNavBarFinder, findsOneWidget);
  });

  testWidgets('AllTaskPage contains the ListView/Card/Slidable/ExpandablePanel', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: AllTaskPage()));

    final aFinder = find.byType(ListView);
    final bFinder = find.byType(Slidable);
    final cFinder = find.byType(Card);
    final dFinder = find.byType(ExpandablePanel);

    expect(aFinder, findsOneWidget);
    expect(bFinder, findsOneWidget);
    expect(cFinder, findsOneWidget);
    expect(dFinder, findsOneWidget);
  });

  testWidgets('CompletedPage contains the ListView/Card/Slidable/ExpandablePanel', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: CompletedTaskPage()));

    final aFinder = find.byType(ListView);
    final bFinder = find.byType(Slidable);
    final cFinder = find.byType(Card);
    final dFinder = find.byType(ExpandablePanel);

    expect(aFinder, findsOneWidget);
    expect(bFinder, findsOneWidget);
    expect(cFinder, findsOneWidget);
    expect(dFinder, findsOneWidget);
  });

  testWidgets('InCompletedPage contains the ListView/Card/Slidable/ExpandablePanel', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: InCompletedTaskPage()));

    final aFinder = find.byType(ListView);
    final bFinder = find.byType(Slidable);
    final cFinder = find.byType(Card);
    final dFinder = find.byType(ExpandablePanel);

    expect(aFinder, findsOneWidget);
  });
}