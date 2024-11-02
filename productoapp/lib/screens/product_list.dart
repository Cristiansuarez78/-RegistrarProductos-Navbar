import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(
              '\$${product.price.toStringAsFixed(2)} - Cantidad: ${product.quantity} - ${product.description}', // Incluyendo la descripción
            ),
          );
        },
      ),
    );
  }
}
