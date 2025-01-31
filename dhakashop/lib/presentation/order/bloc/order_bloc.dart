import 'package:bloc/bloc.dart';
import 'package:dhakashop/data/models/order/order_product.dart';
import 'package:dhakashop/domain/repositories/order/order_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;
  OrderBloc(this.orderRepository) : super(OrderInitial()) {
    on<LoadOrderProducts>(
      (event, emit) async {
        emit(ProductLoading());
        try {
          final oderProducts = await orderRepository.getOrderProducts();
          emit(ProductLoaded(oderProducts));
        } catch (e) {
          emit(ProductError(e.toString()));
        }
      },
    );
  }
}
