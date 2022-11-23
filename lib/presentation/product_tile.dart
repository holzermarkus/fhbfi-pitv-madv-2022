import 'package:einkaufswagen22/infrastructure/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final Function(Product) onTilePressed;

  const ProductTile(
      {super.key, required this.product, required this.onTilePressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.categoryName),
      onTap: () => _onProductSelected(),
    );
  }

  void _onProductSelected() {
    debugPrint('selected product ${product.name}');
    onTilePressed(product);
  }
}
