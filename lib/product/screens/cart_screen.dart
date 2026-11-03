import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_managment/providers/product_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(selectedProductsProvider);
    final totalPrice = ref.watch(totalPriceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: product.color,
                    child: Text(
                      product.name[0].toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
      ),
    );
  }
}
