import 'package:dhakashop/presentation/home/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product/product_model.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Products Details Screen"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailsLoaded) {
            return ListView.builder(
              itemCount: state.productDetails.length,
              itemBuilder: (context, index) {
                Product product = state.productDetails[index];
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