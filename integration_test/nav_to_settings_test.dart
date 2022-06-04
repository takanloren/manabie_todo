import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:manabie_todo/common/widgets/custom_text_form_field.dart';
import 'package:manabie_todo/todo_app/presentation/add_todo/add_todo_widget.dart';
import 'package:manabie_todo/todo_app/presentation/all_task_page/pages/all_task_page.dart';
import 'package:manabie_todo/todo_app/presentation/settings_page/pages/settings_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../lib/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  const IconData iconDataAdd = Icons.add;
  const IconData iconDataSettings = Icons.settings;

  testWidgets('tap on the settings tabview -> show settings screen',
          (tester) async {
        app.main();
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('bottom_nav_bar')), findsOneWidget);

        final Finder bottomNavBarItem = find.byKey(const Key('bottom_nav_settings'));

        await tester.tap(bottomNavBarItem);

        await tester.pumpAndSettle();

        expect(find.byType(SettingsPage), findsOneWidget);
      });
}