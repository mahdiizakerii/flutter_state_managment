import 'package:flutter/material.dart';
import 'package:flutter_state_managment/product/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final ValueChanged<bool?> onChanged;
  const ProductTile({
    super.key,
    required this.product,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
        trailing: Checkbox(value: product.isSelected, onChanged: onChanged),
      ),
    );
  }
}
