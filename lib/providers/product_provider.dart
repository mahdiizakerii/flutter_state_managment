import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_managment/product/models/product.dart';

final selectedProductsProvider = Provider<List<Product>>((ref) {
  return ref
      .watch(productProvider)
      .where((product) => product.isSelected)
      .toList();
});

final totalPriceProvider = Provider<double>((ref) {
  final product = ref.watch(selectedProductsProvider);

  return product.fold(0, (sum, product) => sum + product.price);
});

final productProvider = NotifierProvider<ProductNotifier, List<Product>>(
  ProductNotifier.new,
);

class ProductNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [
      Product(
        name: 'Wireless Headphones',
        description:
            'Experience premium sound quality with noise cancellation.',
        price: 120.0,
        color: Colors.redAccent,
      ),
      Product(
        name: 'Smartphone',
        description: 'The latest technology with stunning display and high-speed performance.',
        price: 799.0,
        color: Colors.blueAccent,
      ),
      Product(
        name: 'Gaming Laptop',
        description:
            'High-end gaming laptop with cutting-edge graphics and speed.',
        price: 1500.0,
        color: Colors.greenAccent,
      ),
      Product(
        name: 'Smartwatch',
        description: 'Track your health and fitness with style and precision.',
        price: 250.0,
        color: Colors.orangeAccent,
      ),
      Product(
        name: 'Electric Kettle',
        description:
            'Fast and energy-efficient kettle for your perfect tea or coffee.',
        price: 30.0,
        color: Colors.purpleAccent,
      ),
      Product(
        name: 'Air Purifier',
        description: 'Breathe clean air with this advanced filtration system.',
        price: 200.0,
        color: Colors.cyanAccent,
      ),
      Product(
        name: 'Bluetooth Speaker',
        description:
            'Portable speaker with powerful sound and long battery life.',
        price: 80.0,
        color: Colors.pinkAccent,
      ),
      Product(
        name: '4K LED TV',
        description: 'Immerse yourself in stunning visuals with ultra-high-definition display.',
        price: 900.0,
        color: Colors.tealAccent,
      ),
      Product(
        name: 'Digital Camera',
        description: 'Capture every moment with professional-grade clarity.',
        price: 650.0,
        color: Colors.yellowAccent,
      ),
      Product(
        name: 'Coffee Maker',
        description: 'Brew barista-quality coffee in the comfort of your home.',
        price: 150.0,
        color: Colors.brown,
      ),
    ];
  }

  void toggleProductSelection(Product product) {
    product.isSelected = !product.isSelected;
    state = [...state];
  }
}
