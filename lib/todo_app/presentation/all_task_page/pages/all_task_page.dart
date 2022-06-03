import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manabie_todo/todo_app/presentation/all_task_page/controllers/all_task_controller.dart';
import 'package:sizer/sizer.dart';

class AllTaskPage extends GetView<AllTaskController> {
  AllTaskPage({Key? key}) : super(key: key);

  final _allTaskPageController = Get.find<AllTaskController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0.sp),
            child: Row(
              children: [
                Text('total'.tr, style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13.sp,
                    letterSpacing: 0.1
                ),),
                const Text(': '),
                Obx(() => Text(_allTaskPageController.totalCount.value.toString(), style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 13.sp,
                    letterSpacing: 0.1
                ),))
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.all(10.sp),
                child: Obx(() => ListView.separated(
                    itemBuilder: (context, index) {
                      var todo = _allTaskPageController.allTasks[index];

                      return ExpandablePanel(
                        theme: const ExpandableThemeData(
                          hasIcon: false,
                        ),
                        header: Container(
                          height: 7.h,
                          child: Row(
                            children: [
                              todo.completed ? const Icon(CupertinoIcons.check_mark_circled) : const Icon(Icons.error_outline),
                              SizedBox(width: 3.w,),
                              Expanded(
                                child: Container(
                                  color: theme.listTileTheme.tileColor,
                                  child: Text(todo.title,
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 13.sp,
                                        letterSpacing: 0.1
                                      )),
                                ),
                              ),
                              Checkbox(
                                  value: todo.completed,
                                  onChanged: (value) {
                                    print("Change to $value - Current value: ${todo.completed}");
                                    _allTaskPageController.onCompletedChange(todo, value);
                                  })
                            ],
                          ),
                        ),
                        collapsed: Container(
                          padding: EdgeInsets.only(bottom: 2.sp),
                          child: Center(child: Icon(Icons.arrow_drop_down, size: 15.sp),),
                        ),
                        expanded: Container(
                          padding: EdgeInsets.only(bottom: 8.sp),
                          child: Text(todo.description, softWrap: true, ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 0.3,
                        color: Colors.blueGrey,
                        height: 1,
                      );
                    },
                    itemCount: _allTaskPageController.allTasks.length)) ,
              )
          )
        ],
      ),
    );
  }
}