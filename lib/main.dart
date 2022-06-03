import 'package:flutter/material.dart';
import 'package:manabie_todo/core/core_main.dart';

import 'core/presentation/widget/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CoreMain.init();
  runApp(AppWidget());
}
