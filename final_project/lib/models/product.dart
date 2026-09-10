import 'package:flutter/foundation.dart';

/// A single item that can be bought in the shop.
@immutable
class Product {
  const Product({
    required this.id,
    required this.brand,
    required this.title,
    required this.price,
    required this.description,
  });

  /// Stable identifier — the cart is keyed by it, so two products that share
  /// a brand (or even a price) never get mixed up.
  final String id;

  /// Brand name, also used to resolve the logo in `images/`.
  final String brand;

  final String title;

  /// Price in tenge.
  final int price;

  final String description;

  String get imageAsset => 'images/$brand.png';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Product && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
