import 'package:dhakashop/config/routes/routes_name.dart';
import 'package:dhakashop/presentation/bottom_Navbar/page/bottom_navbar.dart';
import 'package:dhakashop/presentation/cart/page/cart_view.dart';
import 'package:dhakashop/presentation/order/page/order_view.dart';
import 'package:dhakashop/presentation/product/page/product_details.dart';
import 'package:flutter/material.dart';
import '../../presentation/home/page/product_page.dart';
import '../../presentation/login/page/login_screen.dart';
import '../../presentation/profile/page/profile_page.dart';
import '../../presentation/splash/page/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const ProductPage());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());

      case RoutesName.productDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductDetails(data: settings.arguments as Map<String, dynamic>),

        );

      case RoutesName.cartProduct:
        return MaterialPageRoute(
          builder: (BuildContext context) => CartView(),

        );


      case RoutesName.orderProduct:
        return MaterialPageRoute(
          builder: (BuildContext context) => OrderView(),
        );

      case RoutesName.bottomNavbar:
        return MaterialPageRoute(
          builder: (BuildContext context) => BottomNavbar(),
        );


      case RoutesName.profileView:
        return MaterialPageRoute(
          builder: (BuildContext context) => ProfilePage(),
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