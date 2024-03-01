class ProductsModel {
  List<Products> products;
  ProductsModel({
    required this.products,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    List<Products> data = [];
    json['products'].forEach((e) {
      data.add(Products.fromJson(e));
    });
    return ProductsModel(products: List.from(data));
  }
}

class Products {
  final int id;
  final String title;
  final String description;
  Products({
    required this.description,
    required this.id,
    required this.title,
  });
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      description: json['description'],
      id: json['id'],
      title: json['title'],
    );
  }
}
