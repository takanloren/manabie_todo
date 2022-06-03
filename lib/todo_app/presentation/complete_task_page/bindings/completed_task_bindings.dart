import 'package:get/get.dart';

import '../controllers/completed_task_controller.dart';

class CompletedTaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CompletedTaskController());
  }
}