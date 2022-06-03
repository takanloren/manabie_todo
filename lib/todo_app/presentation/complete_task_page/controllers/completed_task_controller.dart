import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:manabie_todo/common/extensions/extensions.dart';
import 'package:manabie_todo/todo_app/domain/entities/todo_entity.dart';
import 'package:manabie_todo/todo_app/domain/usecases/todo_usecases.dart';

class CompletedTaskController extends GetxController {
  final todoUsecase = GetIt.I.get<TodoUsecase>();
  var totalCount = 0.obs;
  var allTasks = <TodoEntity>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    fetchData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onCompletedChange(TodoEntity entity, bool? completed) async {
    if(completed != null){
      entity.completed = completed;
      await todoUsecase.updateTask(entity);

      fetchData();
    }
  }

  Future fetchData() async {
    allTasks.clear();
    final result = await todoUsecase.getCompleteTasks();
    if(result.isRight()){
      allTasks.addAll(result.asRight());
    }

    totalCount.value = allTasks.length;
    allTasks.refresh();
  }
}