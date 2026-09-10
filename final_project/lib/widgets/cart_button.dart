import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';
import '../state/cart_model.dart';

/// App bar action that opens the cart and shows how many items are in it.
class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select<CartModel, int>((cart) => cart.itemCount);
    return IconButton(
      tooltip: 'Cart',
      onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
      icon: Badge(
        isLabelVisible: count > 0,
        label: Text('$count'),
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
