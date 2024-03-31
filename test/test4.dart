import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trade_x/views/buyers/main_screen.dart';
import 'package:trade_x/views/buyers/nav_screens/account_screen.dart';
import 'package:trade_x/views/buyers/nav_screens/search_screen.dart';
import 'package:trade_x/views/buyers/nav_screens/store_screen.dart';
import 'package:trade_x/main.dart'; // Replace 'your_app' with your actual app name

void main() {
  testWidgets('MainScreen UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MainScreen())); // Replace 'MainScreen()' with your actual screen widget

    // Verify that the bottom navigation bar is present.
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Tap on the second navigation item ('STORE').
    await tester.tap(find.text('STORE'));
    await tester.pump();

    // Verify that the 'StoreScreen' is displayed.
    expect(find.byType(StoreScreen), findsOneWidget);

    // Tap on the fourth navigation item ('FAQs').
    await tester.tap(find.text('FAQs'));
    await tester.pump();

    // Verify that the 'SearchScreen' is displayed.
    expect(find.byType(SearchScreen), findsOneWidget);

    // Tap on the fifth navigation item ('ACCOUNT').
    await tester.tap(find.text('ACCOUNT'));
    await tester.pump();

    // Verify that the 'AccountScreen' is displayed.
    expect(find.byType(AccountScreen), findsOneWidget);
  });
}
