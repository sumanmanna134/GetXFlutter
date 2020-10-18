class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;

  Product({
    this.id, this.productName, this.productImage, this.productDescription, this.price
  });

//  factory Product.fromJson(Map<String, dynamic> json) => Product(
//    id: json["id"],
//    productName : json["productName"],
//    productImage: json["productImage"],
//    productDescription: json["productDescription"],
//    price: json["price"],
//  );
}