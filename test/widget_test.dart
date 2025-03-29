import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipee_maker/main.dart';

void main() {
  group('Recipe App Widget Tests', () {
    testWidgets('Initial app layout test', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(RecipeApp());
      await tester.pumpAndSettle();

      // Verify that the app title is displayed
      expect(find.text('Recipe Maker'), findsOneWidget);

      // Verify that we have a list of recipes
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Add recipe button test', (WidgetTester tester) async {
      await tester.pumpWidget(RecipeApp());
      await tester.pumpAndSettle();

      // Look for an add button (usually a FloatingActionButton)
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
