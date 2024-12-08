import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/account/screens/account.dart';
import 'package:deshi_mart/presentation/cart/screens/cart.dart';
import 'package:deshi_mart/presentation/explore/screens/explore.dart';
import 'package:deshi_mart/presentation/favourite/screens/favourite.dart';
import 'package:deshi_mart/presentation/shop/screens/shop.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> _body = [
    const Shop(),
    const Explore(),
    const Cart(),
    const Favourite(),
    const Account(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_currentIndex],
      bottomNavigationBar: Container(
       
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2), // Shadow above the bar
            ),
          ],
          //  color: Colors.grey,

          color: Colors.white,

          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20.sp,
              ),
              topRight: Radius.circular(
                20.sp,
              )),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20.sp,
              ),
              topRight: Radius.circular(
                20.sp,
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedLabelStyle: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14.sp,
                color: Global_Variables.main_color,
              ),
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
           //   elevation: 40,
              selectedItemColor: Global_Variables.main_color,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/shop.png',
                    color: Colors.black,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/shop.png',
                    color: Global_Variables.main_color,
                  ),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/explore.png',
                      color: Colors.black,
                    ),
                    activeIcon: Image.asset(
                      'assets/images/explore.png',
                      color: Global_Variables.main_color,
                    ),
                    label: 'Explore'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/cart.png',
                      color: Colors.black,
                    ),
                    activeIcon: Image.asset(
                      'assets/images/cart.png',
                      color: Global_Variables.main_color,
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/favourite.png',
                      color: Colors.black,
                    ),
                    activeIcon: Image.asset(
                      'assets/images/favourite.png',
                      color: Global_Variables.main_color,
                    ),
                    label: 'Favourite'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/user.png',
                      color: Colors.black,
                    ),
                    activeIcon: Image.asset(
                      'assets/images/user.png',
                      color: Global_Variables.main_color,
                    ),
                    label: 'Account'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
