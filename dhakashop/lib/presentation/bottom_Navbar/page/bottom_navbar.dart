
import 'package:dhakashop/presentation/cart/page/cart_view.dart';
import 'package:dhakashop/presentation/home/page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/bloc/cart_products_bloc.dart';
import '../../home/bloc/product_bloc.dart';
import '../bloc/bottom_navbar_bloc.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {



  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    context.read<ProductBloc>().add(LoadProducts());
    context.read<CartProductsBloc>().add(LoadCartProducts());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
          final screens = [
            ProductPage(),
            CategoryScreen(),
            CartView(),
            ProfileScreen(),
          ];
          return screens[state.index];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) => context.read<BottomNavBarBloc>().add(NavBarItemTapped(index)),
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        },
      ),
    );
  }
}


// Screens
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Screen'));
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Category Screen'));
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Cart Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Screen'));
  }
}