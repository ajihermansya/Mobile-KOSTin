class Kost {
  final int id;
  final String name;
  final String price;
  final String description;
  final String image;

  const Kost({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  factory Kost.fromJson(Map<String, dynamic> json) {
    return Kost(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
    );
  }
}
