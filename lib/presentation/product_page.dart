import 'package:einkaufswagen22/infrastructure/product.dart';
import 'package:einkaufswagen22/infrastructure/product_repository.dart';
import 'package:einkaufswagen22/presentation/product_tile.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Product> availableProducts = [];
  final List<Product> selectedProducts = [];
  ProductRepository productRepository = ProductRepository();

  @override
  void initState() {
    super.initState();
    initAvailableProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produkte')),
      body: _buildProductList(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart), onPressed: _onResetCart),
    );
  }

  void initAvailableProducts() {
    setState(() {
      productRepository.findAll().then((products) {
        availableProducts.clear();
        availableProducts.addAll(products);
      });
    });
  }

  void _onResetCart() {
    //initAvailableProducts();
    setState(() {
      availableProducts.addAll(selectedProducts);
      selectedProducts.clear();
    });
  }

  Widget _buildProductList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ProductTile(
          product: availableProducts[index],
          onTilePressed: (product) => onProductSelected(product),
        );
      },
      itemCount: availableProducts.length,
    );
  }

  void onProductSelected(Product product) {
    setState(() {
      availableProducts.remove(product);
      selectedProducts.add(product);
    });
  }
}
