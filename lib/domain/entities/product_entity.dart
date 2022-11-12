class ProductEntity {
  final String? name;
  final String? path;
  final String? description;
  final int? quantity;
  final String? price;

  ProductEntity({
    this.name,
    this.path,
    this.description,
    this.quantity,
    this.price,
  });

  ProductEntity.fromJson(Map<String, Object?> json)
      : this(
          name: (json['name'] != null) ? json['name']! as String : '',
          path: (json['path'] != null) ? json['path']! as String : '',
          description: (json['description'] != null)
              ? json['description']! as String
              : '',
          quantity: (json['quantity'] != null) ? json['quantity']! as int : 0,
          price: (json['price'] != null) ? json['price']! as String : '',
        );
  Map<String, Object?> toJson() {
    return {
      'name': name,
      'path': path,
      'description': description,
      'quantity': quantity,
      'price': price,
    };
  }
}
