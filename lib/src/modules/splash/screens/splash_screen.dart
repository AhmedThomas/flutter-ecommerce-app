import 'dart:async';

import 'package:flutter/material.dart';

import '../../../config/config.dart';

class SplashScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.splashRoute),
      builder: (context) => const SplashScreen(),
    );
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, AppRoutes.homeRoute));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              width: AppSize.s125,
              height: AppSize.s125,
            ),
          ),
          const SizedBox(
            height: AppSize.s28,
          ),
          Text(
            AppStrings.splashTitle,
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
