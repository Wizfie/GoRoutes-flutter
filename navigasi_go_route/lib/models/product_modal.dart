class Product {
  final String name;
  final String category;
  final int quantity;

  Product(this.name, this.category, this.quantity);

  static List<Product> products = [
    Product("Milk", "Food", 10),
    Product("Pasta", "Food", 120),
    Product("Shirt", "Clothes", 10),
    Product("Jacket", "Clothes", 50),
  ];
}
