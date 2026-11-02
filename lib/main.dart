import 'package:flutter/material.dart';
import 'package:flutter_state_managment/product/screens/product_list_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter State Managment',
      theme: ThemeData(useMaterial3: true),
      home: const ProductListScreens(),
    );
  }
}
