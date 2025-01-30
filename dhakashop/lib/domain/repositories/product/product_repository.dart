
import '../../../data/models/product_model.dart';
import '../../../data/services/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository(this.apiService);

  Future<List<Product>> getProducts() async {
    final data = await apiService.getRequest('/posts');
    return (data as List).map((item) => Product.fromJson(item)).toList();
  }
}
