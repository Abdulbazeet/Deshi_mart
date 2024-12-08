import 'package:deshi_mart/presentation/account/screens/account.dart';
import 'package:deshi_mart/presentation/bottom_bar.dart';
import 'package:deshi_mart/presentation/cart/screens/cart.dart';
import 'package:deshi_mart/presentation/explore/screens/explore.dart';
import 'package:deshi_mart/presentation/favourite/screens/favourite.dart';
import 'package:deshi_mart/presentation/onboard/screen/next_screen.dart';
import 'package:deshi_mart/presentation/onboard/screen/onboard.dart';
import 'package:deshi_mart/presentation/shop/screens/product_details.dart';
import 'package:deshi_mart/presentation/shop/screens/shop.dart';
import 'package:deshi_mart/presentation/sign_in/screens/sign_in.dart';
import 'package:deshi_mart/presentation/sign_up/screens/sign_up.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnBoard(),
    ),
    GoRoute(
      path: '/next_screen',
      builder: (context, state) => const NextScreen(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: '/bottom_bar',
      builder: (context, state) => const BottomBar(),
    ),
    GoRoute(
      path: '/shop',
      builder: (context, state) => const Shop(),
    ),
    GoRoute(
      path: '/explore',
      builder: (context, state) => const Explore(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const Cart(),
    ),
    GoRoute(
      path: '/favourite',
      builder: (context, state) => const Favourite(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => const Account(),
    ),
    GoRoute(
      path: '/product_details',
      builder: (context, state) => const ProductDetails(),
    ),
    
  ],
);
