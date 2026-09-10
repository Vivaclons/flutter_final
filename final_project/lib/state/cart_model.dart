import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../models/cart_line.dart';
import '../models/product.dart';

/// Holds the shopping cart and notifies the UI whenever it changes.
class CartModel extends ChangeNotifier {
  /// Keyed by [Product.id] so identically named products stay separate.
  final Map<String, CartLine> _lines = <String, CartLine>{};

  UnmodifiableListView<CartLine> get lines =>
      UnmodifiableListView<CartLine>(_lines.values);

  bool get isEmpty => _lines.isEmpty;

  /// Total number of items, counting quantities.
  int get itemCount =>
      _lines.values.fold(0, (sum, line) => sum + line.quantity);

  /// Total price of everything in the cart, in tenge.
  int get totalPrice => _lines.values.fold(0, (sum, line) => sum + line.total);

  bool contains(Product product) => _lines.containsKey(product.id);

  int quantityOf(Product product) => _lines[product.id]?.quantity ?? 0;

  /// Adds one unit of [product].
  void add(Product product) {
    final line = _lines[product.id];
    _lines[product.id] = line == null
        ? CartLine(product: product, quantity: 1)
        : line.copyWith(quantity: line.quantity + 1);
    notifyListeners();
  }

  /// Removes a single unit, dropping the line once it reaches zero.
  void removeOne(Product product) {
    final line = _lines[product.id];
    if (line == null) {
      return;
    }
    if (line.quantity <= 1) {
      _lines.remove(product.id);
    } else {
      _lines[product.id] = line.copyWith(quantity: line.quantity - 1);
    }
    notifyListeners();
  }

  /// Removes the product completely, whatever its quantity.
  void remove(Product product) {
    if (_lines.remove(product.id) != null) {
      notifyListeners();
    }
  }

  void clear() {
    if (_lines.isEmpty) {
      return;
    }
    _lines.clear();
    notifyListeners();
  }
}
