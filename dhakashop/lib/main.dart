import 'package:dhakashop/domain/repositories/cart/cart_repository.dart';
import 'package:dhakashop/domain/repositories/order/order_repository.dart';
import 'package:dhakashop/presentation/bottom_Navbar/bloc/bottom_navbar_bloc.dart';
import 'package:dhakashop/presentation/cart/bloc/cart_products_bloc.dart';
import 'package:dhakashop/presentation/home/bloc/product_bloc.dart';
import 'package:dhakashop/presentation/order/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';
import 'data/services/api_service.dart';
import 'domain/repositories/bottom_navbar/bottom_navbar_repository.dart';
import 'domain/repositories/product/product_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ApiService()),
        RepositoryProvider(
            create: (context) => ProductRepository(context.read<ApiService>())),
        RepositoryProvider(
            create: (context) =>
                CartProductRepository(context.read<ApiService>())),
        RepositoryProvider(
            create: (context) =>
                OrderRepository(context.read<ApiService>())),

        RepositoryProvider(
            create: (context) =>
                BottomNavbarRepository(context.read<ApiService>())),

      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductBloc(context.read<ProductRepository>())
          ),

          BlocProvider(
              create: (context) => CartProductsBloc(context.read<CartProductRepository>())
          ),

          BlocProvider(
              create: (context) => OrderBloc(context.read<OrderRepository>())
          ),

          BlocProvider(
              create: (context) => BottomNavBarBloc(context.read<BottomNavbarRepository>())
          ),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.bottomNavbar,
          onGenerateRoute: Routes.generateRoute,
        ),
      ),
    );
  }
}
