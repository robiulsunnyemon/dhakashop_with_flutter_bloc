import 'package:dhakashop/data/models/cart/cart_model.dart';

import '../../../data/services/api_service.dart';

class CartProductRepository {
  final ApiService apiService;

  CartProductRepository(this.apiService);

  Future<List<CartProduct>> getProducts() async {
    final data = await apiService.getRequest('wishlist/');
    return (data as List).map((item) => CartProduct.fromJson(item)).toList();
  }
}