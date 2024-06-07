import '../../my_account/views/my_account_view.dart';
import '../../product/views/cart_view.dart';
import '../../product/views/explore_view.dart';
import '../../product/views/product_view.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_color.dart';
import 'widget/nav_item.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

  final List<Widget> _screens = [
    ProductView(),
    const ExploreView(),
    const CartView(),
    MyAccountView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: _screens[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        elevation: 10,
        backgroundColor: AppColors.accentColor,
        child: Image.asset(
          'assets/icons/search.png',
          height: 24,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 7.0,
          elevation: 5,
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NavItem(
                imageUrl: 'assets/icons/nav_home.png',
                index: 0,
                selectedIndex: _selectedIndex,
                onTap: () => _onItemTapped(0),
              ),
              NavItem(
                imageUrl: 'assets/icons/nav_explore.png',
                index: 1,
                selectedIndex: _selectedIndex,
                onTap: () => _onItemTapped(1),
              ),
              const SizedBox(width: 48.0),
              NavItem(
                imageUrl: 'assets/icons/nav_cart.png',
                index: 2,
                selectedIndex: _selectedIndex,
                onTap: () => _onItemTapped(2),
              ),
              NavItem(
                imageUrl: 'assets/icons/nav_user.png',
                index: 3,
                selectedIndex: _selectedIndex,
                onTap: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}