import 'package:flutter/material.dart';
import 'package:flutter_state_managment/product/screens/product_list_screens.dart';
import 'package:flutter_state_managment/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter State Managment',
        theme: ThemeData(useMaterial3: true),
        home: ProductListScreens(),
      ),
    );
  }
}
