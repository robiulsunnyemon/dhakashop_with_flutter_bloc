import 'package:bloc/bloc.dart';
import 'package:dhakashop/domain/repositories/cart/cart_repository.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/cart/cart_model.dart';

part 'cart_products_event.dart';
part 'cart_products_state.dart';

class CartProductsBloc extends Bloc<CartProductsEvent, CartProductsState> {
  final CartProductRepository cartProductRepository;
  CartProductsBloc(this.cartProductRepository) : super(CartProductsInitial()) {
    on<LoadCartProducts>(
      (event, emit) async {
        emit(CartProductLoading());
        try {
          final cartProducts = await cartProductRepository.getProducts();
          emit(CartProductLoaded(cartProducts));
        } catch (e) {
          emit(CartProductError(e.toString()));
        }
      },
    );
  }
}
