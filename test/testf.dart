import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trade_x/main.dart';
import 'package:trade_x/views/buyers/ecomm.dart'; // Replace 'your_app' with your actual app name



void main() {
  testWidgets('SimpleEcommercePage UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: EcommercePage()));

    // Verify that the title 'E-commerce Page' is displayed in the app bar.
    expect(find.text('E-commerce Page'), findsOneWidget);

    // Verify that the 'Welcome to Our Store' text is displayed.
    expect(find.text('Welcome to Our Store'), findsOneWidget);

    // Verify that the 'Shop Now' button is displayed.
    expect(find.widgetWithText(ElevatedButton, 'Shop Now'), findsOneWidget);

    // Verify that the 'View Cart' button is displayed.
    expect(find.widgetWithText(ElevatedButton, 'View Cart'), findsOneWidget);

    // Verify that the 'Check Out' button is displayed.
    expect(find.widgetWithText(ElevatedButton, 'Check Out'), findsOneWidget);
  });
}

