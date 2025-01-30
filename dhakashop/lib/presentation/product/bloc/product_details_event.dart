part of 'product_details_bloc.dart';


abstract class ProductDetailsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class LoadProductDetails extends ProductDetailsEvent {
  final int id;
  LoadProductDetails({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
