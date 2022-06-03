import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:manabie_todo/core/presentation/main_page/main_page.dart';
import 'package:manabie_todo/core/presentation/main_page/main_page_bindings.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => MainPage(), binding: MainPageBindings()),
  ];
}