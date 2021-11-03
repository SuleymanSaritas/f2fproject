import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../authenticate/auth_page/auth_type_selector.dart';
import '../../../features/view/home/home_screen.dart';
import '../../../features/view/orders/null_user_order.dart';
import '../../../features/view/orders/basket_screen.dart';
import '../../../features/view/profile/profile_screen.dart';
import '../icon/bottom_icon.dart';

class BottomHomePage extends StatefulWidget {
  @override
  _BottomHomePageState createState() => _BottomHomePageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _BottomHomePageState extends State<BottomHomePage> {
  final Color myBackgroundColor = Color(0xF5380025);
  int _selectedIndex = 0;
  final tabs = [
    HomePage(),
    _auth.currentUser == null ? NullUserOrders() : BasketScreen(),
    _auth.currentUser == null ? AuthTypeSelector() : Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade400,
        items: [
          BottomNavigationBarItem(
            icon: buildBottomIcon(
              Icons.home,
            ),
            label: "HOME",
            backgroundColor: myBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: buildBottomIcon(
              Icons.shopping_cart,
            ),
            label: "BASKET",
            backgroundColor: myBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: buildBottomIcon(
              Icons.account_circle_rounded,
            ),
            label: "PROFILE",
            backgroundColor: myBackgroundColor,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.shifting,
      ),
      body: tabs[_selectedIndex],
    );
  }

  void onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }
}
