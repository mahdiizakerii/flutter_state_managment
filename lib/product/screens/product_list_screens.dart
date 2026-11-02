import 'package:flutter/material.dart';
import 'package:flutter_state_managment/product/screens/cart_screen.dart';
import 'package:flutter_state_managment/product/widget/product_tile.dart';
import 'package:flutter_state_managment/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListScreens extends StatelessWidget {
  ProductListScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCount = context
        .watch<ProductProvider>()
        .seletedProducts
        .length;
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_bag_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.red,
                  child: Text(
                    '$selectedCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return ProductTile(
                product: product,
                onChanged: (value) {
                  context.read<ProductProvider>().toggleProductSelection(
                    product,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
