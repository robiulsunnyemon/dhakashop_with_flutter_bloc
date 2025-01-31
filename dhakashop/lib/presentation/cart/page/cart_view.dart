import 'package:dhakashop/presentation/cart/bloc/cart_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cart/cart_model.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartProductsBloc>().add(LoadCartProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Products"),
        actions: [
          BlocBuilder<CartProductsBloc, CartProductsState>(
            builder: (context, state) {
              if(state is CartProductLoaded){
               return Text(
                  state.cartProducts.length.toString(),
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
                );  //cart value
              }
              else{
                return Text(
                  " ",
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
                );
              }
            },
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: BlocBuilder<CartProductsBloc, CartProductsState>(
        builder: (context, state) {
          if (state is CartProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CartProductLoaded) {
            return ListView.builder(
              itemCount: state.cartProducts.length,
              itemBuilder: (context, index) {
                CartProduct cartProduct = state.cartProducts[index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          cartProduct.productName ?? "NO Product Name",
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(),
                            ElevatedButton(onPressed: (){
                              print("product id: ${cartProduct.product}");
                              context.read<CartProductsBloc>().add(DeleteCartProduct(id: cartProduct.id!));

                            }, child: Icon(Icons.delete,color: Colors.red,))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is CartProductError) {
            return Center(child: Text(state.message));
          }else {
            return Center(child: Text(''));
          }
        },
      ),
    );
  }
}
