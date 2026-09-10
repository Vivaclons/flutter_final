import 'package:flutter/foundation.dart';

import 'product.dart';

/// One position in the cart: a product plus how many of it were added.
@immutable
class CartLine {
  const CartLine({required this.product, required this.quantity});

  final Product product;
  final int quantity;

  int get total => product.price * quantity;

  CartLine copyWith({int? quantity}) =>
      CartLine(product: product, quantity: quantity ?? this.quantity);
}
