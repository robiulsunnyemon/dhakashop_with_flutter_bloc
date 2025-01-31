import 'package:dhakashop/presentation/cart/bloc/cart_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart/cart_model.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildCartProductsList(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Cart Products"),
      actions: [
        _buildCartItemCount(),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _buildCartItemCount() {
    return BlocBuilder<CartProductsBloc, CartProductsState>(
      builder: (context, state) {
        if (state is CartProductLoaded) {
          return Text(
            state.cartProducts.length.toString(),
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
          );
        } else {
          return const SizedBox(); // Empty space when no data
        }
      },
    );
  }

  Widget _buildCartProductsList() {
    return BlocBuilder<CartProductsBloc, CartProductsState>(
      builder: (context, state) {
        if (state is CartProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartProductLoaded) {
          return _buildCartProductListView(state.cartProducts);
        } else if (state is CartProductError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No Cart Products Available'));
        }
      },
    );
  }

  Widget _buildCartProductListView(List<CartProduct> cartProducts) {
    return ListView.builder(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        return _buildCartProductCard(cartProducts[index],context);
      },
    );
  }

  Widget _buildCartProductCard(CartProduct cartProduct,BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            cartProduct.productName ?? "No Product Name",
            style: const TextStyle(fontSize: 20, color: Colors.red),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDeleteButton(cartProduct,context),
              _buildOrderButton(cartProduct,context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(CartProduct cartProduct,BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CartProductsBloc>().add(DeleteCartProduct(id: cartProduct.id!));
      },
      child: const Icon(Icons.delete, color: Colors.red),
    );
  }

  Widget _buildOrderButton(CartProduct cartProduct,BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CartProductsBloc>().add(AddOrderProduct(id: cartProduct.product!));
      },
      child: const Text("Order"),
    );
  }
}
