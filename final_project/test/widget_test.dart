import 'package:final_project/data/catalog.dart';
import 'package:final_project/main.dart';
import 'package:final_project/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _login(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.enterText(find.byType(TextFormField).first, 'vivaclons');
  await tester.enterText(find.byType(TextFormField).last, 'secret');
  await tester.tap(find.widgetWithText(FilledButton, 'Login'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('login rejects empty credentials', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.widgetWithText(FilledButton, 'Login'));
    await tester.pump();

    expect(find.text('Enter your user name'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);
    expect(find.text('List of products'), findsNothing);
  });

  testWidgets('valid credentials open the catalog', (tester) async {
    await _login(tester);

    expect(find.text('List of products'), findsOneWidget);
    expect(find.text('${catalog.first.brand} ${catalog.first.title}'),
        findsOneWidget);
  });

  testWidgets('adding a product updates the cart badge and total',
      (tester) async {
    await _login(tester);

    await tester.tap(find.byIcon(Icons.add_shopping_cart_outlined).first);
    await tester.pump();

    // Badge on the app bar cart button.
    expect(find.descendant(of: find.byType(Badge), matching: find.text('1')),
        findsOneWidget);

    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Basket'), findsOneWidget);
    expect(find.text('1 item(s)'), findsOneWidget);
    expect(find.text(formatPrice(catalog.first.price)), findsWidgets);
  });

  testWidgets('buying clears the cart and confirms the order', (tester) async {
    await _login(tester);

    await tester.tap(find.byIcon(Icons.add_shopping_cart_outlined).first);
    await tester.pump();
    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Buy'));
    await tester.pumpAndSettle();

    expect(find.text('Thank you for your order!'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Back to products'));
    await tester.pumpAndSettle();

    expect(find.text('List of products'), findsOneWidget);
    expect(find.byType(Badge), findsOneWidget);
    expect(find.descendant(of: find.byType(Badge), matching: find.text('1')),
        findsNothing);
  });
}
