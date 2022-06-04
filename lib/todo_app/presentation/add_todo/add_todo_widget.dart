import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manabie_todo/common/widgets/custom_text_form_field.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo_entity.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';

class AddTodoDialog extends StatelessWidget {
  AddTodoDialog({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TodoEntity todoEntity = TodoEntity(const Uuid().v4(), "", "", false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: Text('add'.tr),
      content: SizedBox(
        height: 29.h,
        width: 100.w,
        child: Column(
          children: [
            CustomTextFormField(
              key: const Key('add_todo_title'),
              onTextChanged: (value){
                todoEntity.title = value;
              },
              hint: 'title'.tr,
              autoFocus: true,
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomTextFormField(
              key: const Key('cancel_todo_title'),
              onTextChanged: (value){
                todoEntity.description = value;
              },
              hint: 'description'.tr,
              autoFocus: false,
              maxLines: 3,
            ),
            SizedBox(
              height: 3.h,
            ),
            const Divider(
              height: 1,
            ),
            SizedBox(
              height: 8.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.white,
                      primary: const Color(0xff455A64),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // <-- Radius
                      ),
                    ),
                    onPressed: (){
                      if(todoEntity.title.isEmpty){
                        Get.dialog(AlertDialog(content: Text('add_todo_error_title_empty'.tr),));
                      }else{
                        Get.back(result: todoEntity);
                      }
                    },
                    key: const Key('add_todo_btn'),
                    child: Text('add'.tr),
                  ),
                  SizedBox(width: 12.w,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.white,
                      primary: const Color(0xff455A64),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // <-- Radius
                      ),
                    ),
                    onPressed: (){
                      Get.back(result: false);
                    },
                    key: const Key('cancel_todo_btn'),
                    child: Text('cancel'.tr),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
