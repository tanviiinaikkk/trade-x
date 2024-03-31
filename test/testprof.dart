import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trade_x/views/buyers/nav_screens/profile.dart';

void main() {
  testWidgets('Profile page UI test', (WidgetTester tester) async {
    // Wrap the ProfilePage with MaterialApp
    await tester.pumpWidget(
      MaterialApp(
        home: ProfilePage(),
      ),
    );

    // Verify that the name is displayed.
    expect(find.text('Name:'), findsOneWidget);
    expect(find.text('Tanvi'), findsOneWidget);

    // Verify that the email is displayed.
    expect(find.text('Email id:'), findsOneWidget);
    expect(find.text('naik.tanvi963@gmail.com'), findsOneWidget);

    // Verify that the phone number is displayed.
    expect(find.text('Phone Number:'), findsOneWidget);
    expect(find.text('+91-9372737475'), findsOneWidget);
  });
}
