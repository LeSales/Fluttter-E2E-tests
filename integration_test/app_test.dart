import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:e2e_tests/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Home Page E2E test', () {
    testWidgets('Click 5x on FAB increment', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      for (var i = 0; i < 5; i++) {
        await tester.tap(find.byIcon(Icons.plus_one));
        await Future.delayed(const Duration(seconds: 1));
      }
      await tester.pumpAndSettle();

      expect(find.text('5'), findsOneWidget);
    });
  });

  testWidgets('Change Home text', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    var title = find.byKey(const Key('title')).evaluate().single.widget as Text;
    expect(title.data, equals('Home'));

    await tester.tap(find.byKey(const Key('titleInput')));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.enterText(find.byKey(const Key('titleInput')), 'Home Page');
    await tester.pumpAndSettle();
    await Future.delayed(
        const Duration(seconds: 2)); //Just to see when Text change

    title = find.byKey(const Key('title')).evaluate().single.widget as Text;

    expect(title.data, equals('Home Page'));
  });
}
