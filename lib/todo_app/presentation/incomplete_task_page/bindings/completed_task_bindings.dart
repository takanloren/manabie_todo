import 'package:get/get.dart';

import '../controllers/completed_task_controller.dart';

class InCompletedTaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(InCompletedTaskController());
  }
}