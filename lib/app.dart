import 'package:einkaufswagen22/presentation/product_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Products',
      home: ProductPage(),
    );
  }
}
