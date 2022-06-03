import 'package:get/get.dart';

import '../controllers/all_task_controller.dart';

class AllTaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AllTaskController());
  }
}