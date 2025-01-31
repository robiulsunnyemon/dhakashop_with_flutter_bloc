import 'package:dhakashop/data/models/cart/cart_model.dart';
import 'package:dhakashop/data/models/order/order_product.dart';
import '../../../data/services/api_service.dart';


class OrderRepository{
  final ApiService apiService;

  OrderRepository(this.apiService);




  Future<List<OrderProduct>> getOrderProducts() async {
    final data = await apiService.getRequest('orders/');
    return (data as List).map((item) => OrderProduct.fromJson(item)).toList();
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


  Future<bool> deleteOrderProducts({required int id}) async {
    final data = await apiService.deleteRequest('wishlist/$id/');
    if(data){
      return true;
    }else{
      return false;
    }
  }


}