import 'package:manabie_todo/core/service_locator.dart';

import 'core_database.dart';

class CoreMain{
  static Future<void> init() async {
    await CoreDatabase.init();
    await ServiceLocator.init();
    //TODO: Add more it needed
  }
}