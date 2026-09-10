import 'package:flutter/material.dart';

import '../models/product.dart';

/// Brand logo for a product, falling back to the brand initial when the
/// asset is missing.
class ProductAvatar extends StatelessWidget {
  const ProductAvatar({super.key, required this.product, this.radius = 26});

  final Product product;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return CircleAvatar(
      radius: radius,
      backgroundColor: colors.surfaceContainerHighest,
      child: ClipOval(
        child: Image.asset(
          product.imageAsset,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Center(
            child: Text(
              product.brand.characters.first,
              style: TextStyle(
                fontSize: radius * 0.8,
                fontWeight: FontWeight.bold,
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
