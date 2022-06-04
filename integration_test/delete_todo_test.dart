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

  testWidgets('delete a todo',
          (tester) async {
        app.main();
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('bottom_nav_bar')), findsOneWidget);

        final Finder bottomNavBarItem = find.byKey(const Key('bottom_nav_all'));

        await tester.tap(bottomNavBarItem);

        await tester.pumpAndSettle();

        expect(find.byType(AllTaskPage), findsOneWidget);

        expect(find.byType(FloatingActionButton), findsOneWidget);

        final Finder fab = find.byType(FloatingActionButton);

        await tester.tap(fab);

        await tester.pumpAndSettle();

        expect(find.byType(AddTodoDialog), findsOneWidget);
        expect(find.byType(CustomTextFormField), findsNWidgets(2));
        expect(find.byType(ElevatedButton), findsNWidgets(2));

        await tester.enterText(find.byKey(const Key('add_todo_title')), 'test add todo');

        final Finder addButton = find.byKey(const Key('add_todo_btn'));

        await tester.tap(addButton);

        await tester.pumpAndSettle();

        expect(find.widgetWithText(Card, 'test add todo'), findsWidgets);

        //Check delete button
        final Finder justAdded = find.widgetWithText(Card, 'test add todo');

        await tester.drag(justAdded, const Offset(-500.0, 0.0));

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('delete_todo_button')), findsWidgets);

        final Finder deleteButton = find.byKey(const Key('delete_todo_button'));

        await tester.tap(deleteButton);

        await tester.pumpAndSettle();

        // Ensure that the item is no longer on screen.
        expect(find.widgetWithText(Card, 'test add todo'), findsNothing);
      });
}