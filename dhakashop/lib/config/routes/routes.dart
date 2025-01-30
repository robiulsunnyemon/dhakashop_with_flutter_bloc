import 'package:dhakashop/config/routes/routes_name.dart';
import 'package:dhakashop/presentation/product/bloc/product_details_bloc.dart';
import 'package:dhakashop/presentation/product/page/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/home/page/product_page.dart';
import '../../presentation/login/page/login_screen.dart';
import '../../presentation/splash/page/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const ProductPage());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());

      case RoutesName.productDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductDetails(),

        );

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}