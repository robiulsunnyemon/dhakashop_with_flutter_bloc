class CartProduct {
  int? id;
  int? user;
  int? product;
  String? productName;
  String? addedAt;

  CartProduct(
      {this.id, this.user, this.product, this.productName, this.addedAt});

  CartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    product = json['product'];
    productName = json['product_name'];
    addedAt = json['added_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['product'] = this.product;
    data['product_name'] = this.productName;
    data['added_at'] = this.addedAt;
    return data;
  }
}
