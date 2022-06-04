import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:manabie_todo/core/core_main.dart';

import 'core/presentation/widget/app_widget.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  /*if (!Platform.environment.containsKey('FLUTTER_TEST')){
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }*/

  await CoreMain.init();
  runApp(AppWidget());
}
