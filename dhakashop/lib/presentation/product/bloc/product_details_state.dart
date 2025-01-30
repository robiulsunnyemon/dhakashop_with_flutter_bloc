part of 'product_details_bloc.dart';


abstract class ProductDetailsState extends Equatable{}
class ProductDetailsInitial extends ProductDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ProductLoading extends ProductDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ProductLoaded extends ProductDetailsState {
  final List<Product> products;
  ProductLoaded(this.products);

  @override
  // TODO: implement props
  List<Object?> get props =>[products];
}
class ProductError extends ProductDetailsState {
  final String message;
  ProductError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props =>[message];
}