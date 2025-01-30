part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable{}
class LoadProducts extends ProductEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadProductDetails extends ProductEvent {
  final int id;
  LoadProductDetails({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}