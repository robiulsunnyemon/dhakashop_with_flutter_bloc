import 'package:dhakashop/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/routes/routes.dart';
import '../../cart/bloc/cart_products_bloc.dart';
import '../bloc/product_bloc.dart';
import '../../../data/models/product/product_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(LoadProducts());
    context.read<CartProductsBloc>().add(LoadCartProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.cartProduct);
              },
              icon: Stack(
                children: [
                  Icon(Icons.shopping_cart_rounded),
                  BlocBuilder<CartProductsBloc, CartProductsState>(
                    builder: (context, state) {
                      if (state is CartProductLoaded) {
                        return Text(
                          state.cartProducts.length.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        );
                      }
                      return Text(
                        "NO",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      );
                    },
                  ),
                ],
              )),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                Product product = state.products[index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          product.name,
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.description),
                            Text("Price: ${product.price}"),
                            Text("Stock: ${product.stock}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.productDetails,
                                        arguments: {
                                          "name": product.name,
                                          "description": product.description,
                                          "stock": product.stock,
                                          "review": product.reviews.map((rev) => rev.toJson()).toList(),
                                        });
                                  },
                                  child: Text("READ MORE"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("ADD TO CART"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text(''));
        },
      ),
    );
  }
}
