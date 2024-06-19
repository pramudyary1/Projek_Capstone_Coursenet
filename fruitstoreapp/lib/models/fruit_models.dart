class Fruit {
  final int id;
  final String name;
  final int price;
  final int qty;
  final int categoryId;
  final String? url;

  Fruit({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
    required this.categoryId,
    this.url,
  });

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      qty: json['qty'],
      categoryId: json['categoryId'],
      url: json['url'],
    );
  }
}
