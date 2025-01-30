import 'package:dhakashop/presentation/bloc/product/product_event.dart';
import 'package:dhakashop/presentation/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/product/product_repository.dart';




// BLoC
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await productRepository.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
