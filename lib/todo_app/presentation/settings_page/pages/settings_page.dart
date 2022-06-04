import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../controllers/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  SettingsPage({Key? key}) : super(key: key);

  final _controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => ToggleSwitch(
            minWidth: 40.w,
            initialLabelIndex: _controller.currentSettings.value.isDarkTheme ? 1 : 0,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            labels: ['Light Mode', 'Dark Mode'],
            icons: [Icons.light_mode, Icons.dark_mode],
            activeBgColors: [[Colors.blue],[Colors.blue]],
            onToggle: (index) {
              _controller.onThemeModeToggled(index!);
            },
          ))
          ,
        ],
      ),
    );
  }
}