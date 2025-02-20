class DataModel {
  int total;
  int limit;
  int skip;
  List<ProductModel> products;

  DataModel({
    required this.total,
    required this.limit,
    required this.skip,
    required this.products,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> listProduct = [];

    for (Map<String, dynamic> eachMap in json['products']) {
      var eachProduct = ProductModel.fromJson(eachMap);
      listProduct.add(eachProduct);
    }

    return DataModel(
        total: json['total'],
        limit: json['limit'],
        skip: json['skip'],
        products: listProduct);
  }
}

class ProductModel {
  int? id;
  String? title;
  String? description;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<dynamic> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        discountPercentage: json['discountPercentage'],
        rating: json['rating'],
        stock: json['stock'],
        brand: json['brand'],
        category: json['category'],
        thumbnail: json['thumbnail'],
        images: json['images']);
  }
}
