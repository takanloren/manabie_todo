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

  testWidgets('show add todo dialog but add with empty title -> show alert dialog',
          (tester) async {
        app.main();

        //Check FAB
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);

        //Tap on FAB and add dialog displayed
        final Finder fab = find.byType(FloatingActionButton);

        await tester.tap(fab);

        await tester.pumpAndSettle();

        expect(find.byType(AddTodoDialog), findsOneWidget);
        expect(find.byType(CustomTextFormField), findsNWidgets(2));
        expect(find.byType(ElevatedButton), findsNWidgets(2));

        //Tap Add button in add dialog
        final Finder addButton = find.byKey(const Key('add_todo_btn'));

        await tester.tap(addButton);

        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsWidgets);
      });
}