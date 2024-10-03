import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/view/auth/auth_tab.dart';
import 'package:flutter_pizza_riverpod/view/cart/order_list.dart';
import 'package:flutter_pizza_riverpod/view/pizza/pizza_list.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> appRoutes = [
  GoRoute(
      path: '/',
      name: "Pizzas",
      // redirect: (context, state) {
      //   final authProvider = context.read<FirebaseAuthProvider>();
      //   if (!authProvider.haveUser) {
      //     return "/login";
      //   } else {
      //     return null;
      //   }
      // },
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const PizzaList(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      }),
  GoRoute(
      path: '/login',
      name: "Auth",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const AuthTab(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      }),
  GoRoute(
      path: '/panier',
      name: "Panier",
      // redirect: (context, state) {
      //   final authProvider = context.read<FirebaseAuthProvider>();
      //   if (!authProvider.haveUser) {
      //     return "/login";
      //   } else {
      //     return null;
      //   }
      // },
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const OrderList(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      }),
];
