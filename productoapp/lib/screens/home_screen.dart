import 'package:flutter/material.dart';
import 'product_form.dart';
import 'product_list.dart'; // Asegúrate de importar ProductList
import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = []; // Mantener la lista aquí

  void updateProducts(List<Product> newProducts) {
    setState(() {
      products = newProducts; // Actualiza la lista de productos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido al sistema de gestión de productos experimental de Flutter modelo MK1',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.white),
            label: 'Registrar Producto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.white),
            label: 'Lista de Productos',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductForm(
                    products: products,
                    onProductAdded: updateProducts,
                  ),
                ),
              );
              break;
            case 1: // Opción "Lista de Productos"
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductList(products: products),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
