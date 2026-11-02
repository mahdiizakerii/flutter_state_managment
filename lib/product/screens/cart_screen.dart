import 'package:flutter/material.dart';
import 'package:flutter_state_managment/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    final cartItems = provider.seletedProducts;
    final totalPrice = provider.totalPrice;

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
