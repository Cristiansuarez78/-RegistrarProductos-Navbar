import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductForm extends StatefulWidget {
  final List<Product> products;
  final Function(List<Product>) onProductAdded;

  const ProductForm({
    Key? key,
    required this.products,
    required this.onProductAdded,
  }) : super(key: key);

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController =
      TextEditingController(); // Nuevo controlador

  void addProduct() {
    final String name = nameController.text;
    final double? price = double.tryParse(priceController.text);
    final int? quantity = int.tryParse(quantityController.text);
    final String description =
        descriptionController.text; // Obtener descripción

    if (name.isNotEmpty &&
        price != null &&
        quantity != null &&
        description.isNotEmpty) {
      setState(() {
        widget.products.add(Product(
          name: name,
          price: price,
          quantity: quantity,
          description: description, // Asignar descripción
        ));
        widget.onProductAdded(widget.products);
      });
      nameController.clear();
      priceController.clear();
      quantityController.clear();
      descriptionController.clear(); // Limpiar el campo de descripción
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Producto'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(labelText: 'Nombre del Producto'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Cantidad'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController, // Campo de descripción
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addProduct,
              child: const Text('Agregar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
