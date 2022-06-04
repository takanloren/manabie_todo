import 'package:get/get.dart';

import '../controllers/incompleted_task_controller.dart';

class InCompletedTaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(InCompletedTaskController());
  }
}