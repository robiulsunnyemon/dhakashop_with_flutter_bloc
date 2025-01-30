
import 'package:dhakashop/config/routes/routes_name.dart';
import 'package:dhakashop/domain/repositories/product_details/product_details_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product/product_model.dart';
import '../../../domain/repositories/product/product_repository.dart';

part 'product_state.dart';
part 'product_event.dart';





// BLoC
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  final ProductDetailsRepository productDetailsRepository;

  ProductBloc(this.productRepository, this.productDetailsRepository) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await productRepository.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
    on<LoadProductDetails>((event, emit) async {
      emit(ProductLoading());
      try {
        final  products = await productDetailsRepository.getProducts(id: event.id);
        emit(ProductDetailsLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });


  }
}
