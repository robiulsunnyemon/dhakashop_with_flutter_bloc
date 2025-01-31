class OrderProduct {
  int? id;
  int? quantity;
  String? orderedAt;
  int? product;

  OrderProduct({this.id, this.quantity, this.orderedAt, this.product});

  OrderProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    orderedAt = json['ordered_at'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['ordered_at'] = this.orderedAt;
    data['product'] = this.product;
    return data;
  }
}
