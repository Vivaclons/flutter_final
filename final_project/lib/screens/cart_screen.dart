import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_line.dart';
import '../state/cart_model.dart';
import '../utils/format.dart';
import '../widgets/product_avatar.dart';
import 'checkout_screen.dart';

/// Everything the user has added, with quantities and the running total.
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) => TextButton(
              onPressed: cart.isEmpty ? null : cart.clear,
              child: const Text('Clear'),
            ),
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.isEmpty) {
            return const _EmptyCart();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: cart.lines.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) =>
                      _CartLineTile(line: cart.lines[index]),
                ),
              ),
              _CartSummary(cart: cart),
            ],
          );
        },
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.remove_shopping_cart_outlined,
            size: 64,
            color: theme.colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text('Your basket is empty', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Back to products'),
          ),
        ],
      ),
    );
  }
}

class _CartLineTile extends StatelessWidget {
  const _CartLineTile({required this.line});

  final CartLine line;

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartModel>();
    final product = line.product;

    return ListTile(
      leading: ProductAvatar(product: product, radius: 22),
      title: Text('${product.brand} ${product.title}'),
      subtitle: Text('${formatPrice(product.price)} × ${line.quantity}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            formatPrice(line.total),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          IconButton(
            tooltip: 'Remove one',
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => cart.removeOne(product),
          ),
          IconButton(
            tooltip: 'Add one more',
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => cart.add(product),
          ),
          IconButton(
            tooltip: 'Delete',
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.delete_outline),
            onPressed: () => cart.remove(product),
          ),
        ],
      ),
    );
  }
}

class _CartSummary extends StatelessWidget {
  const _CartSummary({required this.cart});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      elevation: 8,
      color: theme.colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cart.itemCount} item(s)',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      formatPrice(cart.totalPrice),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              FilledButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Buy'),
                onPressed: () {
                  final itemCount = cart.itemCount;
                  final total = cart.totalPrice;
                  cart.clear();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (context) => CheckoutScreen(
                        itemCount: itemCount,
                        total: total,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
