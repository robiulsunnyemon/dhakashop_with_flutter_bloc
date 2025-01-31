part of 'cart_products_bloc.dart';


abstract class CartProductsState extends Equatable{}

final class CartProductsInitial extends CartProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CartProductLoading extends CartProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CartProductLoaded extends CartProductsState {
  final List<CartProduct> cartProducts;
  CartProductLoaded(this.cartProducts);

  @override
  // TODO: implement props
  List<Object?> get props =>[cartProducts];
}

class CartProductError extends CartProductsState {
  final String message;
  CartProductError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props =>[message];
}