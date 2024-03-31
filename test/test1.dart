import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trade_x/views/buyers/nav_screens/search_screen.dart';


void main() {
  testWidgets('SearchScreen UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: SearchScreen(),
    ));

    // Verify that the app bar title is 'FAQs'.
    expect(find.text('FAQs'), findsOneWidget);

    // Verify the initial state of the search field.
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Search FAQs'), findsOneWidget);

    // Enter text into the search field and verify its value.
    await tester.enterText(find.byType(TextField), 'How do I create');
    expect(find.text('How do I create'), findsOneWidget);

    // Verify if FAQs are displayed based on the search text.
    expect(find.text('How do I create an account?'), findsOneWidget);
    expect(find.text('Is my payment information secure?'), findsNothing); // Make sure unrelated FAQs are not displayed.

    // Verify if tapping on an FAQ expands it to show the answer.
    await tester.tap(find.text('How do I create an account?'));
    await tester.pump(); // Rebuild the widget after the tap.
    expect(find.text('Typically, theres a "Sign Up" or "Register" option on the apps main screen.'), findsOneWidget);

    // Verify if tapping on the expanded FAQ collapses it.
    await tester.tap(find.text('How do I create an account?'));
    await tester.pump(); // Rebuild the widget after the tap.
    expect(find.text('Typically, theres a "Sign Up" or "Register" option on the apps main screen.'), findsNothing);
  });
}
