import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/catalog.dart';
import '../models/product.dart';
import '../state/cart_model.dart';
import '../utils/format.dart';
import '../widgets/cart_button.dart';
import '../widgets/product_avatar.dart';

/// Product catalog.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of products'),
        centerTitle: true,
        actions: const [CartButton()],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: catalog.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) => _ProductTile(product: catalog[index]),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final quantity =
        context.select<CartModel, int>((cart) => cart.quantityOf(product));
    final cart = context.read<CartModel>();

    return ListTile(
      leading: ProductAvatar(product: product),
      title: Text('${product.brand} ${product.title}'),
      subtitle: Text(product.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            formatPrice(product.price),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(width: 8),
          if (quantity == 0)
            IconButton(
              tooltip: 'Add to cart',
              icon: const Icon(Icons.add_shopping_cart_outlined),
              onPressed: () => cart.add(product),
            )
          else
            _QuantityStepper(
              quantity: quantity,
              onRemove: () => cart.removeOne(product),
              onAdd: () => cart.add(product),
            ),
        ],
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  const _QuantityStepper({
    required this.quantity,
    required this.onRemove,
    required this.onAdd,
  });

  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: 'Remove one',
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: onRemove,
        ),
        Text('$quantity', style: Theme.of(context).textTheme.titleMedium),
        IconButton(
          tooltip: 'Add one more',
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.add_circle_outline),
          onPressed: onAdd,
        ),
      ],
    );
  }
}
