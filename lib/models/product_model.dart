class ProductModel {
  final String productId;
  final String productTitle;
  final String productPrice;
  final String productItemCode;
  final String productImage;
  final String productAbout;

  ProductModel({required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productItemCode,
    required this.productImage,
    required this.productAbout,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['id'],
      productTitle: json['title'],
      productPrice: json['price'],
      productItemCode: json['itemcode'],
      productImage: json['image'],
      productAbout: json['about'],
    );
  }
}