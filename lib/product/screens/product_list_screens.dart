import 'package:flutter/material.dart';
import 'package:flutter_state_managment/product/constans/products_constants.dart';
import 'package:flutter_state_managment/product/screens/cart_screen.dart';
import 'package:flutter_state_managment/product/widget/product_tile.dart';

class ProductListScreens extends StatefulWidget {
  const ProductListScreens({super.key});

  @override
  State<StatefulWidget> createState() => _ProductListScreensState();
}

class _ProductListScreensState extends State<ProductListScreens> {
  @override
  Widget build(BuildContext context) {
    final selectedCount = productList
        .where((product) => product.isSelected)
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
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        cartItem: productList
                            .where((product) => product.isSelected)
                            .toList(),
                      ),
                    ),
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
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ProductTile(
            product: product,
            onChanged: (value) {
              setState(() {
                product.isSelected = value ?? false;
              });
            },
          );
        },
      ),
    );
  }
}
