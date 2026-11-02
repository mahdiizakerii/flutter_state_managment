import 'package:flutter/material.dart';
import 'package:flutter_state_managment/product/constans/products_constants.dart';
import 'package:flutter_state_managment/product/widget/product_tile.dart';

class ProductListScreens extends StatefulWidget {
  const ProductListScreens({super.key});

  @override
  State<StatefulWidget> createState() => _ProductListScreensState();
}

class _ProductListScreensState extends State<ProductListScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(icon: Icon(Icons.shopping_bag_outlined), onPressed: () {}),
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
