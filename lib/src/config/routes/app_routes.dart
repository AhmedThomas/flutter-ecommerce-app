import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../modules/export_modules.dart';

class AppRoutes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String cartRoute = '/cart';
  static const String productRoute = '/product';
  static const String catalogRoute = '/catalog';
  static const String wishlistRoute = '/wishlist';
  static const String checkoutRoute = '/checkout';
  static const String orderConfirmRoute = '/order-confirmation';
  static const String paymentRoute = '/payment-selection';
  static const String userRoute = '/user';
}

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return SplashScreen.route();
      case AppRoutes.homeRoute:
        return HomeScreen.route();
      case AppRoutes.cartRoute:
        return CartScreen.route();
      case AppRoutes.productRoute:
        return ProductScreen.route(product: settings.arguments as Product);
      case AppRoutes.catalogRoute:
        return CategoryScreen.route(category: settings.arguments as Category);
      case AppRoutes.wishlistRoute:
        return WishlistScreen.route();
      case AppRoutes.checkoutRoute:
        return CheckoutScreen.route();
      case AppRoutes.orderConfirmRoute:
        return OrderConfirmation.route();
      case AppRoutes.paymentRoute:
        return PaymentSelection.route();
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
