class Product {
  final String name;
  final double price;
  final int quantity;
  final String description; // Nuevo campo

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.description, // Incluir el nuevo campo en el constructor
  });
}
