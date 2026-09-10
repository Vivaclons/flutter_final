import 'package:final_project/data/catalog.dart';
import 'package:final_project/state/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartModel', () {
    late CartModel cart;

    setUp(() => cart = CartModel());

    test('starts empty', () {
      expect(cart.isEmpty, isTrue);
      expect(cart.itemCount, 0);
      expect(cart.totalPrice, 0);
    });

    test('adding the same product twice increases its quantity', () {
      final product = catalog.first;
      cart
        ..add(product)
        ..add(product);

      expect(cart.lines.length, 1);
      expect(cart.quantityOf(product), 2);
      expect(cart.itemCount, 2);
      expect(cart.totalPrice, product.price * 2);
    });

    test('products with the same brand are tracked separately', () {
      final apples = catalog.where((p) => p.brand == 'Apple').toList();
      expect(apples.length, greaterThan(1));

      cart.add(apples[0]);

      expect(cart.contains(apples[0]), isTrue);
      expect(cart.contains(apples[1]), isFalse,
          reason: 'the cart is keyed by product id, not by brand');
    });

    test('removeOne only drops a single unit', () {
      final product = catalog.first;
      cart
        ..add(product)
        ..add(product)
        ..removeOne(product);

      expect(cart.quantityOf(product), 1);

      cart.removeOne(product);
      expect(cart.contains(product), isFalse);
      expect(cart.isEmpty, isTrue);
    });

    test('remove drops the whole line and clear empties the cart', () {
      cart
        ..add(catalog[0])
        ..add(catalog[0])
        ..add(catalog[1]);

      cart.remove(catalog[0]);
      expect(cart.itemCount, 1);

      cart.clear();
      expect(cart.isEmpty, isTrue);
    });

    test('notifies listeners on every change', () {
      var notifications = 0;
      cart.addListener(() => notifications++);

      cart
        ..add(catalog[0])
        ..removeOne(catalog[0]);
      expect(notifications, 2);

      // No-ops must not notify.
      cart
        ..removeOne(catalog[0])
        ..clear();
      expect(notifications, 2);
    });
  });
}
