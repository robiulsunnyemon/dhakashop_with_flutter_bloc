import 'package:dhakashop/data/models/cart/cart_model.dart';

import '../../../data/services/api_service.dart';

class CartProductRepository {
  final ApiService apiService;

  CartProductRepository(this.apiService);




  Future<List<CartProduct>> getProducts() async {
    final data = await apiService.getRequest('wishlist/');
    return (data as List).map((item) => CartProduct.fromJson(item)).toList();
  }


  Future<bool> addCartProducts({required int id}) async {
    Map<String, dynamic> body={
      "product": id
    };
    final data = await apiService.postRequest(endpoint: 'wishlist/',data: body);
    if(data){
      return true;
    }else{
      return false;
    }
  }


  Future<bool> addOrderProducts({required int id}) async {
    Map<String, dynamic> body={
      "quantity":2,
      "product":id
    };
    final data = await apiService.postRequest(endpoint: 'orders/',data: body);
    if(data){
      return true;
    }else{
      return false;
    }
  }


  Future<bool> deleteProducts({required int id}) async {
    final data = await apiService.deleteRequest('wishlist/$id/');
    if(data){
      return true;
    }else{
      return false;
    }
  }


}