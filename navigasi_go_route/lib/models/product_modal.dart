class Product {
  final String name;
  final String category;
  final int quantity;

  Product(this.name, this.category, this.quantity);

  static List<Product> products = [
    Product("Milk", "Food", 10),
    Product("Pasta", "Food", 120),
    Product("Pizaa", "Food", 9),
    Product("Coffe", "Food", 20),
    Product("Burger", "Food", 8),
    Product("HotDog", "Food", 11),
    Product("Mie", "Food", 12),
    Product("Shirt", "Clothes", 10),
    Product("Jacket", "Clothes", 9),
    Product("Hat", "Clothes", 12),
    Product("T-Shirt", "Clothes", 15),
    Product("Jeans", "Clothes", 5),
    Product("Boxer", "Clothes", 13),
  ];
}
