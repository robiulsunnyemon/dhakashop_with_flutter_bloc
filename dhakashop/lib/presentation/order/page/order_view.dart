import 'package:dhakashop/data/models/order/order_product.dart';
import 'package:dhakashop/presentation/order/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {

  @override
  void initState() {
    super.initState();
    _loadOrderProducts();
  }

  void _loadOrderProducts() {
    context.read<OrderBloc>().add(LoadOrderProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildOrderList(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Order View"),
    );
  }

  Widget _buildOrderList() {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return _buildOrderListView(state.orderProducts);
        } else {
          return const Center(child: Text("No Orders Available"));
        }
      },
    );
  }

  Widget _buildOrderListView(List<OrderProduct> orderProducts) {
    return ListView.builder(
      itemCount: orderProducts.length,
      itemBuilder: (context, index) {
        final orderProduct = orderProducts[index];
        return _buildOrderCard(orderProduct);
      },
    );
  }

  Widget _buildOrderCard(OrderProduct orderProduct) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Product Id: ${orderProduct.product}"),
            Text("Quantity: ${orderProduct.quantity}"),
            Text("Ordered At: ${orderProduct.orderedAt}"),
          ],
        ),
      ),
    );
  }
}
