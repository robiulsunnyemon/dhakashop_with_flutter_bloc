part of 'order_bloc.dart';


abstract class OrderState extends Equatable {}


final class OrderInitial extends OrderState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class ProductLoading extends OrderState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class ProductLoaded extends OrderState {
  final List<OrderProduct> orderProducts;

  ProductLoaded(this.orderProducts);
  @override
  // TODO: implement props
  List<Object?> get props =>[orderProducts];
}


class ProductError extends OrderState {
  final String message;
  ProductError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props =>[message];
}

