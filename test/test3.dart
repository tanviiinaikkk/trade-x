import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trade_x/qr_code_scanner.dart';
import 'package:trade_x/shake_detector.dart';
import 'package:trade_x/views/buyers/nav_screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen UI Test', (WidgetTester tester) async {
    // Build HomeScreen widget
    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(),
    ));

    // Verify that HomeScreen contains the correct widgets
    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('Scan QR'), findsOneWidget);
    expect(find.text('Click for Fun'), findsOneWidget);

    // Tap on the 'Scan QR' button
    await tester.tap(find.text('Scan QR'));
    await tester.pumpAndSettle();

    // Verify that QRScannerScreen is pushed onto the navigator stack after tapping the button
    expect(find.byType(QRScannerScreen), findsOneWidget);

    // Tap on the 'Click for Fun' button
    await tester.tap(find.text('Click for Fun'));
    await tester.pumpAndSettle();

    // Verify that ShakeDetectorWidget is pushed onto the navigator stack after tapping the button
    expect(find.byType(ShakeDetectorWidget), findsOneWidget);
  });
}
