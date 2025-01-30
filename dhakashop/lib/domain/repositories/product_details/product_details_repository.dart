
import '../../../data/models/product/product_model.dart';
import '../../../data/services/api_service.dart';

class ProductDetailsRepository{
  final ApiService apiService;

  ProductDetailsRepository(this.apiService);

  Future<List<Product>> getProducts({required int id}) async {
    final data = await apiService.getRequest('products/$id/');
    print("product details::: $data");
    return (data as List).map((item) => Product.fromJson(item)).toList();
  }
}
