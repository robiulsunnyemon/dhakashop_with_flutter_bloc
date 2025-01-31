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
    
    on<DeleteCartProduct>(
        (event, emit)async{
          emit(CartProductLoading());
          try {
            bool isDeleted = await cartProductRepository.deleteProducts(id: event.id);
            if (isDeleted) {
              final updatedCartProducts = await cartProductRepository.getProducts();
              emit(CartProductLoaded(updatedCartProducts));
            } else {
              emit(CartProductError("Failed to delete product!"));
            }
          } catch (e) {
            emit(CartProductError("Failed to delete product!"));
          }
        }
    );


    on<PostCartProduct>(
            (event, emit)async{
          emit(CartProductLoading());
          try {
            bool isDeleted = await cartProductRepository.postCartProducts(id: event.id);
            if (isDeleted) {
              final updatedCartProducts = await cartProductRepository.getProducts();
              emit(CartProductLoaded(updatedCartProducts));
            } else {
              emit(CartProductError("Failed to delete product!"));
            }
          } catch (e) {
            emit(CartProductError("Failed to delete product!"));
          }
        }
    );



    
  }
}
