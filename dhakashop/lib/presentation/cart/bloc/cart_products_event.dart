part of 'cart_products_bloc.dart';


abstract class CartProductsEvent extends Equatable{}

class LoadCartProducts extends CartProductsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddCartProduct extends CartProductsEvent{
  final int id;
  AddCartProduct({required this.id});

  @override
  List<Object?> get props =>[id];

}

class AddOrderProduct extends CartProductsEvent{
  final int id;
  AddOrderProduct({required this.id});

  @override
  List<Object?> get props =>[id];

}

class DeleteCartProduct extends CartProductsEvent{
  final int id;
  DeleteCartProduct({required this.id});

  @override
  List<Object?> get props =>[id];

}
