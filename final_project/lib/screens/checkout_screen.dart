import 'package:flutter/material.dart';

import '../utils/format.dart';

/// Order confirmation shown after the cart is paid for.
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    required this.itemCount,
    required this.total,
  });

  final int itemCount;
  final int total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Order')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 96,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text('Thank you for your order!',
                  style: theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center),
              const SizedBox(height: 12),
              Text(
                '$itemCount item(s) for ${formatPrice(total)}',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
                child: const Text('Back to products'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
