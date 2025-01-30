import 'package:dhakashop/presentation/home/bloc/product_bloc.dart';
import 'package:dhakashop/presentation/product/bloc/product_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';
import 'data/services/api_service.dart';
import 'domain/repositories/product/product_repository.dart';
import 'domain/repositories/product_details/product_details_repository.dart';

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
                ProductDetailsRepository(context.read<ApiService>())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductBloc(context.read<ProductRepository>(),
                context.read<ProductDetailsRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.home,
          onGenerateRoute: Routes.generateRoute,
        ),
      ),
    );
  }
}
