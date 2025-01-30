import 'package:bloc/bloc.dart';
import 'package:dhakashop/domain/repositories/product_details/product_details_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product/product_model.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductDetailsRepository productDetailsRepository;
  ProductDetailsBloc(this.productDetailsRepository)
      : super(ProductDetailsInitial()) {
    on<LoadProductDetails>(
      (event, emit) async {
        // TODO: implement event handler

        emit(ProductLoading());
        try {
          final products = await productDetailsRepository.getProducts(id:event.id);
          emit(ProductLoaded(products));
        } catch (e) {
          emit(ProductError(e.toString()));
        }
      },
    );
  }
}
