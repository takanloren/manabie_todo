import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

import '../../../common/languages/localization_service.dart';
import '../../../common/themes/dark_theme.dart';
import '../../../common/themes/light_theme.dart';
import '../../routes/app_pages.dart';
import '../../routes/app_routes.dart';



class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    // Hide on-screen keyboard on start
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    WidgetsBinding.instance.addObserver(this);

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) {
        Future.delayed(const Duration(milliseconds: 100), () async {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
        });
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return GetMaterialApp(
              title: 'Todo app - Manabie Assignment - Hà Minh Tùng',
              theme: LightTheme.data,
              darkTheme: DarkTheme.data,
              locale: LocalizationService.locale,
              fallbackLocale: LocalizationService.fallbackLocale,
              translations: LocalizationService(),
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.home,
              getPages: AppPages.pages,
            );
          }
      ),
      onTap: () {
        // Hide on-screen keyboard when tap outside of inputs
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }
}
