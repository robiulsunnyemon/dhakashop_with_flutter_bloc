import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/services/api_service.dart';
import 'presentation/bloc/product/product_bloc.dart';
import 'presentation/pages/product_page.dart';
import 'domain/repositories/product/product_repository.dart';

void main() {
  final apiService = ApiService();
  final productRepository = ProductRepository(apiService);

  runApp(MyApp(productRepository));
}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository;
  const MyApp(this.productRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProductBloc(productRepository),
          )
        ],
        child:  MaterialApp(
          home: ProductPage(),
          debugShowCheckedModeBanner: false,
        ),
    );
  }
}
