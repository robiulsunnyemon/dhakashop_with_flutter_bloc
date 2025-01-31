import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/routes/routes_name.dart';
import '../../cart/bloc/cart_products_bloc.dart';
import '../bloc/product_bloc.dart';
import '../../../data/models/product/product_model.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildProductList(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Products'),
      actions: [
        const SizedBox(width: 20),
        _buildCartIcon(context),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _buildCartIcon(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pushNamed(context, RoutesName.cartProduct),
      icon: SizedBox(
        height: 40,
        width: 40,
        child: Stack(
          children: [
            const Icon(Icons.shopping_cart_rounded),
           BlocBuilder<CartProductsBloc, CartProductsState>(
           builder: (context, state) {
             if (state is CartProductLoaded) {
               return _buildCartCountBadge(state.cartProducts.length);
             }
             return const SizedBox();
           },
                      )
          ],
        ),
      ),
    );
  }

  Widget _buildCartCountBadge(int count) {
    return Positioned(
      top: 0,
      right: 0,
      child: CircleAvatar(
        radius: 10,
        backgroundColor: Colors.red,
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              Product product = state.products[index];
              return _buildProductCard(product,context);
            },
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text(''));
      },
    );
  }

  Widget _buildProductCard(Product product,BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          product.name,
          style: const TextStyle(fontSize: 20, color: Colors.red),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.description),
            Text("Price: ${product.price}"),
            Text("Stock: ${product.stock}"),
            _buildActionButtons(product,context),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(Product product, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => _navigateToProductDetails(product,context),
          child: const Text("READ MORE"),
        ),
        ElevatedButton(
          onPressed: () => _addToCart(product,context),
          child: const Text("ADD TO CART"),
        ),
      ],
    );
  }

  void _navigateToProductDetails(Product product,BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutesName.productDetails,
      arguments: {
        "name": product.name,
        "description": product.description,
        "stock": product.stock,
        "review": product.reviews.map((rev) => rev.toJson()).toList(),
      },
    );
  }

  void _addToCart(Product product,BuildContext context) {
    context.read<CartProductsBloc>().add(AddCartProduct(id: product.id));
  }
}
