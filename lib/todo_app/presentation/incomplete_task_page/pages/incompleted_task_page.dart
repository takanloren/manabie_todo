import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/incompleted_task_controller.dart';

class InCompletedTaskPage extends GetView<InCompletedTaskController> {
  InCompletedTaskPage({Key? key}) : super(key: key);

  final _controller = Get.find<InCompletedTaskController>();

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
                Obx(() => Text(_controller.totalCount.value.toString(), style: TextStyle(
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
                padding: EdgeInsets.all(5.sp),
                child: Obx(() => ListView.builder(
                    itemBuilder: (context, index) {
                      var todo = _controller.allTasks[index];
                      return Card(
                        margin: EdgeInsets.all(5.sp),
                        shadowColor: theme.dividerColor,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Slidable(
                          // Specify a key if the Slidable is dismissible.
                            key: ValueKey(index),

                            // The end action pane is the one at the right or the bottom side.
                            endActionPane: ActionPane(
                              extentRatio: 0.25,
                              dragDismissible: false,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    _controller.onPressedDelete(todo);
                                  },
                                  padding: const EdgeInsets.all(5),
                                  autoClose: true,
                                  icon: Icons.delete,
                                  label: 'delete'.tr,
                                ),
                              ],
                            ),

                            // The child of the Slidable is what the user sees when the
                            // component is not dragged.
                            child: ExpandablePanel(
                              theme: const ExpandableThemeData(
                                hasIcon: false,
                              ),
                              header: Container(
                                padding: EdgeInsets.only(left: 5.sp),
                                height: 5.h,
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
                                              letterSpacing: 0.1,
                                              decoration: todo.completed ? TextDecoration.lineThrough : null,
                                            )),
                                      ),
                                    ),
                                    Checkbox(
                                        value: todo.completed,
                                        onChanged: (value) {
                                          print("Change to $value - Current value: ${todo.completed}");
                                          _controller.onCompletedChange(todo, value);
                                        })
                                  ],
                                ),
                              ),
                              collapsed: Container(
                                child: Center(child: Icon(Icons.arrow_drop_down, size: 10.sp),),
                              ),
                              expanded: Container(
                                padding: EdgeInsets.only(bottom: 8.sp, left: 8.sp, right: 8.sp),
                                child: Text(todo.description, softWrap: true, maxLines: 5,),
                              ),
                            )
                        ),
                      );
                    },

                    itemCount: _controller.allTasks.length)) ,
              )
          )
        ],
      ),
    );
  }
}