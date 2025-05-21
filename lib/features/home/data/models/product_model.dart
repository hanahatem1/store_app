class ProductModel {
  final int id;
  final String title;
  final String image;
  final double price;
  final double rate; 
  final String description;

  ProductModel( {
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rate,
    required this.description
    
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      rate: (json['rating']['rate'] as num).toDouble(), 
      description: (json['description'])
    );
  }
}
