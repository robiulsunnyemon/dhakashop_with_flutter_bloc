part of 'product_bloc.dart';


abstract class ProductState extends Equatable{}
class ProductInitial extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ProductLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);

  @override
  // TODO: implement props
  List<Object?> get props =>[products];
}
class ProductDetailsLoaded extends ProductState {
  final List<Product> productDetails;
  ProductDetailsLoaded(this.productDetails);

  @override
  // TODO: implement props
  List<Object?> get props =>[productDetails];
}
class ProductError extends ProductState {
  final String message;
  ProductError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props =>[message];
}
