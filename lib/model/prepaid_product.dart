class PrepaidProduct {
  final String? productCode;
  final String? productName;
  final String? price;
  final String? description;
  final bool? status;

  PrepaidProduct({
    this.productCode,
    this.productName,
    this.price,
    this.description,
    this.status,
  });

  factory PrepaidProduct.fromJson(Map<String, dynamic> json) {
    return PrepaidProduct(
      productCode: json['product_code'],
      productName: json['product_name'],
      price: json['price'],
      description: json['description'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_code': productCode,
      'product_name': productName,
      'price': price,
      'description': description,
      'status': status,
    };
  }
}
