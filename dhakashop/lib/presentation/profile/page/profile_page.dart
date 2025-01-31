// Profile Page UI
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes/routes_name.dart';
import '../../order/bloc/order_bloc.dart';
import '../bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: CupertinoColors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  //backgroundImage: Icon(Icons.person),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                SizedBox(height: 10),
                Text(state.name,
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(state.email,
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text(state.phone,
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.edit, color: Colors.blue),
                        title: Text("Edit Profile"),
                        onTap: () {
                          // Edit Profile Logic
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.red),
                        title: Text("Logout"),
                        onTap: () {
                          // Logout Logic
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Previous Order History",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.orderProduct);
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
                Expanded(child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoaded) {
                      return ListView.builder(
                        itemCount: state.orderProducts.length,
                        itemBuilder: (context, index) {
                          final orderProduct = state.orderProducts[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Product Id:${orderProduct.product}"),
                                  Text("Quantity: ${orderProduct.quantity}"),
                                  Text("Ordered At: ${orderProduct.orderedAt}"),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}