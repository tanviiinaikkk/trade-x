import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trade_x/views/buyers/nav_screens/store_screen.dart';


void main() {
  testWidgets('StoreScreen UI Test', (WidgetTester tester) async {
    // Build StoreScreen widget
    await tester.pumpWidget(MaterialApp(
      home: StoreScreen(),
    ));

    // Verify that StoreScreen contains the correct widgets
    expect(find.text('Stores'), findsOneWidget);
    expect(find.byType(InkWell), findsNWidgets(6)); // Assuming there are 6 stores in the list

    // Tap on the first store
    await tester.tap(find.byType(InkWell).first);
    await tester.pumpAndSettle();

    // Verify that ProductsPage is displayed after tapping on a store
    expect(find.text('Clothing'), findsOneWidget); // Assuming the first store is 'Clothing'
    expect(find.byType(InkWell), findsNWidgets(6)); // Assuming there are 6 products in the 'Clothing' store
  });

  testWidgets('ProductsPage UI Test', (WidgetTester tester) async {
    // Create a mock store with some products
    final store = Store(
      name: 'Mock Store',
      products: [
        Product(name: 'Product 1', price: 10.99, imageUrl: ''),
        Product(name: 'Product 2', price: 20.49, imageUrl: ''),
      ],
    );

    // Build ProductsPage widget
    await tester.pumpWidget(MaterialApp(
      home: ProductsPage(store: store),
    ));

    // Verify that ProductsPage contains the correct widgets
    expect(find.text('Mock Store'), findsOneWidget);
    expect(find.byType(InkWell), findsNWidgets(2)); // Assuming there are 2 products in the mock store
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('\$10.99'), findsOneWidget);

    // Tap on the first product
    await tester.tap(find.byType(InkWell).first);
    await tester.pumpAndSettle();

    // Verify that the product details dialog is displayed after tapping on a product
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('\$10.99'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);
  });
}
