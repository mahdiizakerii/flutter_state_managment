import 'package:flutter/material.dart';
import 'package:flutter_state_managment/product/models/product.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItem;
  const CartScreen({super.key, required this.cartItem});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get totalPrice {
    return widget.cartItem.fold(0, (sum, product) => sum + product.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: widget.cartItem.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: widget.cartItem.length,
              itemBuilder: (context, index) {
                final product = widget.cartItem[index];
                return ListTile(
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
